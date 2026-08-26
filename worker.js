/**
 * mixask/GH — worker.js (proxies + obfuscator)
 *
 * Lua: /loader.lua /script.lua /library.lua /modules.lua
 * UI:  GET /obfuscator  (and /obfuscate)
 * API: POST /api/obfuscate
 *      POST /api/syntax-check
 *
 * Secret: wrangler secret put LUAOBF_API_KEY
 */

const GH = "https://raw.githubusercontent.com/mixask/GH/main";
const LUAOBF_NEW = "https://api.luaobfuscator.com/v1/obfuscator/newscript";
const LUAOBF_RUN = "https://api.luaobfuscator.com/v1/obfuscator/obfuscate";
const FALLBACK_KEY = "11ad3847-d943-4a76-ee19-f9acab3e85144ea9";
const DISCORD = "https://discord.gg/sbVuaT9a2T";

const TEXT_HEADERS = {
  "Content-Type": "text/plain; charset=utf-8",
  "Cache-Control": "no-cache",
  "Access-Control-Allow-Origin": "*",
};
const JSON_HEADERS = {
  "Content-Type": "application/json; charset=utf-8",
  "Cache-Control": "no-cache",
  "Access-Control-Allow-Origin": "*",
};

async function proxyGithub(file) {
  const response = await fetch(`${GH}/${file}`, {
    cf: { cacheTtl: 0, cacheEverything: false },
  });
  if (!response.ok) {
    return new Response(`${file} not found`, { status: 404, headers: TEXT_HEADERS });
  }
  return new Response(await response.text(), { headers: TEXT_HEADERS });
}

const PLUGIN_DEFS = [
  { key: "EncryptStrings", label: "Encrypt Strings", args: [100], type: "plugin" },
  { key: "SwizzleLookups", label: "Table indirection (SwizzleLookups)", args: [100], type: "plugin" },
  { key: "EncryptFuncDeclaration", label: "Encrypt Func Declaration", args: [100], type: "plugin" },
  { key: "ControlFlowFlattenV1AllBlocks", label: "Control Flow Flatten", args: [75, 75, 33], type: "plugin" },
  { key: "RevertAllIfStatements", label: "Revert If Statements", args: [50], type: "plugin" },
  { key: "MixedBooleanArithmetic", label: "Mixed Boolean Arithmetic", args: [75], type: "plugin" },
  { key: "MutateAllLiterals", label: "Mutate Literals", args: [20], type: "plugin" },
  { key: "JunkifyAllIfStatements", label: "Junkify If Statements", args: [50], type: "plugin" },
];

const ROOT_FLAGS = [
  { key: "MinifiyAll", label: "Minify All", def: true },
  { key: "Virtualize", label: "Virtualize (VM)", def: false },
  { key: "Multifile", label: "Multifile", def: false },
];

function buildConfigFromOptions(opts) {
  opts = opts || {};
  const cfg = {};
  for (const f of ROOT_FLAGS) {
    cfg[f.key] = opts[f.key] != null ? !!opts[f.key] : f.def;
  }
  if (opts.ASCIIArt) cfg.ASCIIArt = opts.ASCIIArt;
  const plugins = {};
  for (const p of PLUGIN_DEFS) {
    if (opts[p.key]) {
      plugins[p.key] = Array.isArray(opts[p.key + "_args"]) ? opts[p.key + "_args"] : p.args;
    }
  }
  if (Object.keys(plugins).length) cfg.CustomPlugins = plugins;
  return cfg;
}

function presetConfig(preset) {
  if (preset === "light") {
    return {
      MinifiyAll: true,
      CustomPlugins: {
        SwizzleLookups: [100],
        EncryptStrings: [100],
      },
    };
  }
  if (preset === "full") {
    return {
      MinifiyAll: true,
      ASCIIArt: "feet_1",
      Virtualize: true,
      CustomPlugins: {
        SwizzleLookups: [100],
        EncryptStrings: [100],
        EncryptFuncDeclaration: [100],
        RevertAllIfStatements: [50],
        ControlFlowFlattenV1AllBlocks: [75, 75, 33],
        MixedBooleanArithmetic: [75],
        MutateAllLiterals: [20],
        JunkifyAllIfStatements: [50],
      },
    };
  }
  return {
    MinifiyAll: true,
    CustomPlugins: {
      SwizzleLookups: [100],
      EncryptStrings: [100],
      ControlFlowFlattenV1AllBlocks: [50, 50, 25],
      JunkifyAllIfStatements: [30],
    },
  };
}

function bit32Embed(code) {
  const key = 0x5a;
  const bytes = [];
  for (let i = 0; i < code.length; i++) {
    bytes.push(code.charCodeAt(i) ^ (key + (i % 17)));
  }
  const parts = [];
  for (let i = 0; i < bytes.length; i += 40) {
    parts.push(bytes.slice(i, i + 40).join(","));
  }
  const dataLua = parts.map((p) => "{" + p + "}").join(",\n");
  const payload = `-- Greedy embed+bit32 layer
local _k = ${key}
local _chunks = {${dataLua}}
local _out = {}
local _i = 0
for _, ch in ipairs(_chunks) do
  for _, b in ipairs(ch) do
    _i = _i + 1
    _out[#_out + 1] = string.char(bit32.bxor(b, (_k + ((_i - 1) % 17))))
  end
end
local _src = table.concat(_out)
local _fn, _err = loadstring(_src)
if not _fn then error(_err) end
return _fn()
`;
  if (payload.includes("]=====]")) {
    return `return loadstring([======[\n${payload}\n]======])()`;
  }
  return `return loadstring([=====[\n${payload}\n]=====])()`;
}

function plainLongStringEmbed(code) {
  if (code.includes("]=====]")) {
    return `-- embed\nreturn loadstring([======[\n${code}\n]======])()`;
  }
  return `-- embed\nreturn loadstring([=====[\n${code}\n]=====])()`;
}

async function callLuaObf(apiKey, code, cfg) {
  const newRes = await fetch(LUAOBF_NEW, {
    method: "POST",
    headers: {
      "content-type": "text/plain; charset=utf-8",
      apikey: apiKey,
    },
    body: code,
  });
  if (!newRes.ok) {
    const t = await newRes.text();
    return { ok: false, error: `newscript HTTP ${newRes.status}: ${t.slice(0, 240)}` };
  }
  let session;
  try {
    session = await newRes.json();
  } catch {
    return { ok: false, error: "newscript: invalid JSON" };
  }
  if (!session.sessionId) {
    return { ok: false, error: session.message || "no sessionId" };
  }

  const runRes = await fetch(LUAOBF_RUN, {
    method: "POST",
    headers: {
      "content-type": "application/json",
      apikey: apiKey,
      sessionId: session.sessionId,
    },
    body: JSON.stringify(cfg),
  });
  if (!runRes.ok) {
    const t = await runRes.text();
    return { ok: false, error: `obfuscate HTTP ${runRes.status}: ${t.slice(0, 240)}` };
  }
  let out;
  try {
    out = await runRes.json();
  } catch {
    return { ok: false, error: "obfuscate: invalid JSON" };
  }
  if (!out.code) {
    return { ok: false, error: out.message || "empty code from API" };
  }
  return { ok: true, code: out.code, sessionId: session.sessionId };
}

/** Structural syntax check — --[[ ]] is valid */
function syntaxCheck(code) {
  const issues = [];
  if (!code || !code.trim()) {
    return { ok: false, issues: ["empty code"] };
  }
  const pairs = { "(": ")", "[": "]", "{": "}" };
  const stack = [];
  let i = 0;
  let line = 1;
  let inStr = null;
  let longEq = 0;

  while (i < code.length) {
    const c = code[i];
    if (c === "\n") line++;

    if (!inStr && c === "-" && code[i + 1] === "-" && code[i + 2] === "[") {
      let j = i + 3;
      let n = 0;
      while (code[j] === "=") { n++; j++; }
      if (code[j] === "[") {
        i = j + 1;
        while (i < code.length) {
          if (code[i] === "\n") line++;
          if (code[i] === "]") {
            let k = i + 1;
            let m = 0;
            while (code[k] === "=") { m++; k++; }
            if (m === n && code[k] === "]") { i = k + 1; break; }
          }
          i++;
        }
        continue;
      }
    }

    if (!inStr && c === "-" && code[i + 1] === "-") {
      while (i < code.length && code[i] !== "\n") i++;
      continue;
    }

    if (!inStr && c === "[" && code[i + 1] === "[") {
      inStr = "long"; longEq = 0; i += 2; continue;
    }
    if (!inStr && c === "[" && code[i + 1] === "=") {
      let n = 0; let j = i + 1;
      while (code[j] === "=") { n++; j++; }
      if (code[j] === "[") { inStr = "long"; longEq = n; i = j + 1; continue; }
    }
    if (inStr === "long") {
      if (c === "]") {
        let n = 0; let j = i + 1;
        while (code[j] === "=") { n++; j++; }
        if (n === longEq && code[j] === "]") { inStr = null; i = j + 1; continue; }
      }
      i++; continue;
    }

    if (!inStr && (c === '"' || c === "'")) { inStr = c; i++; continue; }
    if (inStr === '"' || inStr === "'") {
      if (c === "\\") { i += 2; continue; }
      if (c === inStr) inStr = null;
      i++; continue;
    }

    if (pairs[c]) {
      stack.push({ ch: c, line });
    } else if (c === ")" || c === "]" || c === "}") {
      const top = stack.pop();
      if (!top || pairs[top.ch] !== c) {
        issues.push(`line ${line}: unexpected '${c}'`);
      }
    }
    i++;
  }
  if (inStr) issues.push("unclosed string/long-string");
  for (const s of stack) issues.push(`line ${s.line}: unclosed '${s.ch}'`);

  return {
    ok: issues.length === 0,
    issues,
    note: "Block comments --[[ ]] are valid and ignored",
  };
}

function pageShell(title, activeNav, content) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>${title} · Greedy Hudzell</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet"/>
<style>
:root{
  --bg:#0a0a0a;--bg2:#111;--card:#141414;--border:#2a2a2a;
  --text:#f2f2f2;--muted:#9a9a9a;--gold:#C9A227;--gold-soft:#E8C547;
  --ok:#4caf7a;--bad:#e85d5d;--radius:16px;
}
*{box-sizing:border-box;margin:0;padding:0}
body{
  font-family:Inter,system-ui,sans-serif;background:var(--bg);color:var(--text);
  min-height:100vh;line-height:1.55;
  background-image:
    radial-gradient(ellipse 80% 50% at 50% -20%,rgba(201,162,39,.08),transparent),
    radial-gradient(ellipse 60% 40% at 100% 100%,rgba(255,255,255,.03),transparent);
}
a{color:var(--gold-soft);text-decoration:none}
a:hover{text-decoration:underline}
.wrap{width:min(780px,94vw);margin:0 auto;padding:28px 0 80px}
.top{
  position:sticky;top:0;z-index:50;backdrop-filter:blur(14px);
  background:rgba(10,10,10,.78);border-bottom:1px solid var(--border);
}
.top-inner{
  width:min(980px,94vw);margin:0 auto;display:flex;align-items:center;
  justify-content:space-between;gap:16px;padding:14px 0;flex-wrap:wrap;
}
.brand{display:flex;align-items:center;gap:12px;font-weight:700;color:var(--text);text-decoration:none}
.brand:hover{text-decoration:none}
.brand-mark{
  width:34px;height:34px;border-radius:10px;
  background:linear-gradient(135deg,#1a1a1a,#2a2410);
  border:1px solid var(--gold);display:grid;place-items:center;
  color:var(--gold);font-size:14px;font-weight:700;
}
.nav{display:flex;flex-wrap:wrap;gap:6px}
.nav a{
  color:var(--muted);padding:8px 14px;border-radius:999px;
  border:1px solid transparent;font-size:13px;font-weight:500;text-decoration:none;
}
.nav a:hover{color:var(--text);border-color:var(--border);background:var(--card);text-decoration:none}
.nav a.active{color:#0a0a0a;background:var(--gold);border-color:var(--gold)}
.page-header{margin:32px 0 24px}
.page-header h1{font-size:1.8rem;font-weight:700;margin-bottom:6px}
.page-header .sub{color:var(--muted);font-size:14px}
.section{margin-bottom:32px}
.section h2{font-size:1.05rem;font-weight:600;color:var(--gold-soft);margin-bottom:10px;padding-bottom:6px;border-bottom:1px solid var(--border)}
.section p{color:#c8c8c8;font-size:14px;line-height:1.7;margin-bottom:10px}
.section ul{color:#c8c8c8;font-size:14px;line-height:1.7;padding-left:20px;margin-bottom:10px}
.section ul li{margin-bottom:4px}
.badge{
  display:inline-block;font-size:11px;font-weight:600;padding:2px 8px;
  border-radius:999px;background:rgba(201,162,39,.12);color:var(--gold);
  border:1px solid rgba(201,162,39,.25);margin-bottom:18px;
}
footer.site{margin-top:28px;text-align:center;color:#555;font-size:12px}
</style>
</head>
<body>
<header class="top">
  <div class="top-inner">
    <a class="brand" href="/">
      <div class="brand-mark">GH</div>
      <span>Greedy Hudzell</span>
    </a>
    <nav class="nav">
      <a href="/">Home</a>
      <a href="/status">Status</a>
      <a href="/executors">Executors</a>
      <a href="/guide">Guide</a>
      <a href="/tos"${activeNav === "tos" ? ' class="active"' : ""}>ToS</a>
      <a href="/obfuscator">Obfuscator</a>
    </nav>
  </div>
</header>
<main class="wrap">
${content}
  <footer class="site">
    © Greedy Hudzell · <a href="${DISCORD}">discord.gg/sbVuaT9a2T</a> · Not affiliated with Roblox
  </footer>
</main>
</body>
</html>`;
}

function tosHtml() {
  const content = `
  <div class="page-header">
    <div class="badge">Legal</div>
    <h1>Terms of Service</h1>
    <p class="sub">Last updated: June 2025</p>
  </div>

  <div class="section">
    <h2>1. Acceptance</h2>
    <p>By purchasing, using, or accessing any Greedy Hudzell (GH) product, script, or service, you agree to these Terms of Service. If you do not agree, do not use our services.</p>
  </div>

  <div class="section">
    <h2>2. License</h2>
    <p>Upon purchasing a key, you are granted a non-transferable, non-exclusive, revocable license to use the GH script for personal use only. You may not:</p>
    <ul>
      <li>Resell, redistribute, or share your key with others</li>
      <li>Deobfuscate, reverse-engineer, or modify the script</li>
      <li>Use the script to harm, exploit, or harass other players</li>
      <li>Claim the script or any part of it as your own work</li>
    </ul>
  </div>

  <div class="section">
    <h2>3. Refund Policy</h2>
    <p>All sales are final. We do not offer refunds under any circumstances, including but not limited to: game updates that temporarily break functionality, user error, or change of mind. If the script is broken due to our fault, we will provide an extended key at our discretion.</p>
  </div>

  <div class="section">
    <h2>4. Account & Key Responsibility</h2>
    <p>You are solely responsible for keeping your key secure. Sharing your key may result in permanent revocation without refund. We reserve the right to revoke any key at any time for violation of these terms.</p>
  </div>

  <div class="section">
    <h2>5. Service Availability</h2>
    <p>We do not guarantee 100% uptime. The script may be temporarily unavailable due to Roblox updates, maintenance, or other factors outside our control. Downtime does not qualify for refunds or key extensions.</p>
  </div>

  <div class="section">
    <h2>6. Prohibited Use</h2>
    <p>You agree not to use GH products for any purpose that violates Roblox's Terms of Service or any applicable laws. You bear full responsibility for any consequences resulting from your use of the script on your Roblox account.</p>
  </div>

  <div class="section">
    <h2>7. Disclaimer</h2>
    <p>Greedy Hudzell is not affiliated with, endorsed by, or in any way officially connected with Roblox Corporation. Use of any exploit or script may result in your Roblox account being banned. We are not responsible for any account actions taken by Roblox.</p>
  </div>

  <div class="section">
    <h2>8. Changes to Terms</h2>
    <p>We reserve the right to update these terms at any time. Continued use of our services after changes constitutes acceptance of the new terms. Check this page periodically for updates.</p>
  </div>

  <div class="section">
    <h2>9. Contact</h2>
    <p>For questions or disputes, reach us via our <a href="${DISCORD}">Discord server</a>.</p>
  </div>
`;
  return pageShell("Terms of Service", "tos", content);
}

function privacyHtml() {
  const content = `
  <div class="page-header">
    <div class="badge">Legal</div>
    <h1>Privacy Policy</h1>
    <p class="sub">Last updated: June 2025</p>
  </div>

  <div class="section">
    <h2>1. Overview</h2>
    <p>Greedy Hudzell ("we", "us") is committed to protecting your privacy. This policy explains what information we collect, how we use it, and your rights regarding it.</p>
  </div>

  <div class="section">
    <h2>2. Information We Collect</h2>
    <p>We collect minimal information necessary to operate our service:</p>
    <ul>
      <li><strong>Roblox username</strong> — collected when you activate a key, used to bind your license</li>
      <li><strong>Discord user ID</strong> — collected if you interact with our Discord bot, used for key management</li>
      <li><strong>Purchase records</strong> — transaction references for support purposes (no payment card data is stored by us)</li>
      <li><strong>Usage data</strong> — basic script execution logs for anti-abuse and debugging purposes</li>
    </ul>
  </div>

  <div class="section">
    <h2>3. How We Use Your Data</h2>
    <p>Your data is used exclusively to:</p>
    <ul>
      <li>Validate and manage your license key</li>
      <li>Provide customer support</li>
      <li>Detect and prevent abuse or key sharing</li>
      <li>Improve script performance and stability</li>
    </ul>
    <p>We do not sell, rent, or share your personal data with third parties for marketing purposes.</p>
  </div>

  <div class="section">
    <h2>4. Data Retention</h2>
    <p>We retain your data for as long as your license is active, plus a reasonable period afterward for support purposes. You may request deletion of your data by contacting us on Discord.</p>
  </div>

  <div class="section">
    <h2>5. Third-Party Services</h2>
    <p>Our service may interact with the following third-party platforms, each governed by their own privacy policies:</p>
    <ul>
      <li>Roblox Corporation — for username verification</li>
      <li>Discord — for bot interactions and community support</li>
      <li>Cloudflare — for DDoS protection and content delivery</li>
    </ul>
  </div>

  <div class="section">
    <h2>6. Security</h2>
    <p>We take reasonable measures to protect your data. However, no system is 100% secure. We are not liable for unauthorized access resulting from circumstances beyond our reasonable control.</p>
  </div>

  <div class="section">
    <h2>7. Your Rights</h2>
    <p>You have the right to:</p>
    <ul>
      <li>Request access to the data we hold about you</li>
      <li>Request correction of inaccurate data</li>
      <li>Request deletion of your data</li>
    </ul>
    <p>To exercise these rights, contact us via our <a href="${DISCORD}">Discord server</a>.</p>
  </div>

  <div class="section">
    <h2>8. Changes</h2>
    <p>We may update this policy from time to time. We will notify users of significant changes via our Discord server. Continued use of our service after changes constitutes acceptance.</p>
  </div>

  <div class="section">
    <h2>9. Contact</h2>
    <p>Privacy-related inquiries can be directed to us via <a href="${DISCORD}">Discord</a>.</p>
  </div>
`;
  return pageShell("Privacy Policy", "privacy", content);
}

function obfuscateHtml() {
  const pluginChecks = PLUGIN_DEFS.map(
    (p) =>
      `<label class="chk"><input type="checkbox" data-plugin="${p.key}" ${
        p.key === "EncryptStrings" || p.key === "SwizzleLookups" ? "checked" : ""
      }/> ${p.label}</label>`
  ).join("\n");
  const rootChecks = ROOT_FLAGS.map(
    (f) =>
      `<label class="chk"><input type="checkbox" data-root="${f.key}" ${f.def ? "checked" : ""}/> ${f.label}</label>`
  ).join("\n");

  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>Obfuscator · Greedy Hudzell</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet"/>
<style>
:root{
  --bg:#0a0a0a;--bg2:#111;--card:#141414;--border:#2a2a2a;
  --text:#f2f2f2;--muted:#9a9a9a;--gold:#C9A227;--gold-soft:#E8C547;
  --ok:#4caf7a;--bad:#e85d5d;--radius:16px;
}
*{box-sizing:border-box;margin:0;padding:0}
body{
  font-family:Inter,system-ui,sans-serif;background:var(--bg);color:var(--text);
  min-height:100vh;line-height:1.55;
  background-image:
    radial-gradient(ellipse 80% 50% at 50% -20%,rgba(201,162,39,.08),transparent),
    radial-gradient(ellipse 60% 40% at 100% 100%,rgba(255,255,255,.03),transparent);
}
a{color:var(--gold-soft);text-decoration:none}
a:hover{text-decoration:underline}
.wrap{width:min(980px,94vw);margin:0 auto;padding:28px 0 80px}
.top{
  position:sticky;top:0;z-index:50;backdrop-filter:blur(14px);
  background:rgba(10,10,10,.78);border-bottom:1px solid var(--border);
}
.top-inner{
  width:min(980px,94vw);margin:0 auto;display:flex;align-items:center;
  justify-content:space-between;gap:16px;padding:14px 0;flex-wrap:wrap;
}
.brand{display:flex;align-items:center;gap:12px;font-weight:700;color:var(--text);text-decoration:none}
.brand:hover{text-decoration:none}
.brand-mark{
  width:34px;height:34px;border-radius:10px;
  background:linear-gradient(135deg,#1a1a1a,#2a2410);
  border:1px solid var(--gold);display:grid;place-items:center;
  color:var(--gold);font-size:14px;font-weight:700;
}
.nav{display:flex;flex-wrap:wrap;gap:6px}
.nav a{
  color:var(--muted);padding:8px 14px;border-radius:999px;
  border:1px solid transparent;font-size:13px;font-weight:500;text-decoration:none;
}
.nav a:hover{color:var(--text);border-color:var(--border);background:var(--card);text-decoration:none}
.nav a.active{color:#0a0a0a;background:var(--gold);border-color:var(--gold)}
.panel{
  background:var(--card);border:1px solid var(--border);border-radius:var(--radius);
  padding:18px;margin-top:18px;
}
.panel h2{font-size:1.15rem;margin-bottom:4px}
.panel .sub{color:var(--muted);font-size:13px;margin-bottom:14px}
.card{
  background:var(--bg2);border:1px solid var(--border);border-radius:12px;
  padding:14px;margin-bottom:12px;
}
label.title{
  display:block;color:var(--muted);font-size:11px;text-transform:uppercase;
  letter-spacing:.05em;margin-bottom:8px;font-weight:600;
}
.chk{display:flex;align-items:center;gap:8px;font-size:13px;margin:4px 0;color:var(--text)}
.chk input{accent-color:var(--gold)}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
@media(max-width:800px){.grid{grid-template-columns:1fr}}
.plugins{display:grid;grid-template-columns:1fr 1fr;gap:4px 12px}
@media(max-width:600px){.plugins{grid-template-columns:1fr}}
textarea,select{
  width:100%;border-radius:10px;border:1px solid var(--border);
  background:#0c0c0c;color:var(--text);padding:10px 12px;font-size:13px;
}
textarea{
  min-height:240px;font-family:"JetBrains Mono",ui-monospace,monospace;
  font-size:12px;resize:vertical;
}
textarea:focus,select:focus{outline:1px solid rgba(201,162,39,.4)}
.btn{
  display:inline-flex;align-items:center;justify-content:center;
  padding:10px 14px;border-radius:999px;font-size:13px;font-weight:600;
  border:1px solid var(--border);background:var(--card);color:var(--text);
  cursor:pointer;margin-top:8px;
}
.btn:hover{border-color:var(--gold);color:var(--gold-soft)}
.btn:disabled{opacity:.5;cursor:wait}
.btn-gold{
  background:linear-gradient(135deg,var(--gold),#a8841a);
  color:#0a0a0a;border-color:var(--gold);
}
.btn-gold:hover{color:#0a0a0a;filter:brightness(1.05)}
.actions{display:flex;flex-wrap:wrap;gap:8px}
.actions .btn{flex:1;min-width:120px}
.status{margin-top:10px;font-size:13px;color:var(--muted);white-space:pre-wrap}
.status.ok{color:var(--ok)}
.status.err{color:var(--bad)}
.hint{color:var(--muted);font-size:12px;line-height:1.45;margin-top:10px}
footer.site{margin-top:28px;text-align:center;color:#555;font-size:12px}
</style>
</head>
<body>
<header class="top">
  <div class="top-inner">
    <a class="brand" href="/">
      <div class="brand-mark">GH</div>
      <span>Greedy Hudzell</span>
    </a>
    <nav class="nav">
      <a href="/">Home</a>
      <a href="/status">Status</a>
      <a href="/executors">Executors</a>
      <a href="/guide">Guide</a>
      <a href="/tos">ToS</a>
      <a class="active" href="/obfuscator">Obfuscator</a>
    </nav>
  </div>
</header>

<main class="wrap">
  <section class="panel">
    <h2>Lua obfuscator</h2>
    <p class="sub">Same tabs as the rest of the site — leave via the top nav anytime.</p>

    <div class="card">
      <label class="title">Preset</label>
      <select id="preset">
        <option value="custom">Custom (checkboxes below)</option>
        <option value="light">Light — SwizzleLookups + EncryptStrings</option>
        <option value="medium" selected>Medium — strings + table + mild CF</option>
        <option value="full">Full — Virtualize + all main plugins</option>
        <option value="embed">Embed only — [=====[ ]=====]</option>
        <option value="embed_bit32">Embed + bit32 scramble + table/strings pipeline</option>
      </select>
      <p class="hint">
        <b>embed</b> — local wrap, no API.<br/>
        <b>embed_bit32</b> — optional API light pass then bit32 inside long-string loader (needs bit32 / Luau).<br/>
        <b>full</b> — heavy VM; may break large Roblox scripts (upvalues).
      </p>
    </div>

    <div class="card">
      <label class="title">Root flags (luaobfuscator)</label>
      <div class="plugins" id="roots">${rootChecks}</div>
      <label class="title" style="margin-top:14px">CustomPlugins</label>
      <div class="plugins" id="plugins">${pluginChecks}</div>
    </div>

    <div class="grid">
      <div class="card">
        <label class="title">Input</label>
        <textarea id="input" placeholder="paste Lua here..."></textarea>
        <div class="actions">
          <button type="button" class="btn btn-gold" id="run">Obfuscate</button>
          <button type="button" class="btn" id="checkIn">Check syntax (input)</button>
        </div>
        <div id="status" class="status"></div>
      </div>
      <div class="card">
        <label class="title">Output</label>
        <textarea id="output" placeholder="result..."></textarea>
        <div class="actions">
          <button type="button" class="btn" id="copy">Copy</button>
          <button type="button" class="btn" id="checkOut">Check syntax (output)</button>
        </div>
      </div>
    </div>
  </section>

  <footer class="site">
    © Greedy Hudzell · <a href="${DISCORD}">discord.gg/sbVuaT9a2T</a> · Not affiliated with Roblox
  </footer>
</main>

<script>
const statusEl = document.getElementById('status');
const input = document.getElementById('input');
const output = document.getElementById('output');
const preset = document.getElementById('preset');
const runBtn = document.getElementById('run');

function collectOptions() {
  const opts = {};
  document.querySelectorAll('[data-root]').forEach(el => {
    opts[el.getAttribute('data-root')] = el.checked;
  });
  document.querySelectorAll('[data-plugin]').forEach(el => {
    opts[el.getAttribute('data-plugin')] = el.checked;
  });
  return opts;
}

async function syntaxCheck(code) {
  const res = await fetch('/api/syntax-check', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify({ code })
  });
  return res.json();
}

async function doCheck(which) {
  const code = which === 'in' ? input.value : output.value;
  statusEl.className = 'status';
  statusEl.textContent = 'Checking syntax...';
  try {
    const data = await syntaxCheck(code || '');
    if (data.ok) {
      statusEl.textContent = 'Syntax check OK' + (data.note ? ' — ' + data.note : '');
      statusEl.className = 'status ok';
    } else {
      statusEl.textContent = 'Issues:\\n' + (data.issues || []).join('\\n');
      statusEl.className = 'status err';
    }
  } catch (e) {
    statusEl.textContent = String(e);
    statusEl.className = 'status err';
  }
}

document.getElementById('checkIn').onclick = () => doCheck('in');
document.getElementById('checkOut').onclick = () => doCheck('out');

runBtn.onclick = async () => {
  const code = input.value || '';
  if (!code.trim()) {
    statusEl.textContent = 'Paste code first';
    statusEl.className = 'status err';
    return;
  }
  runBtn.disabled = true;
  statusEl.className = 'status';
  statusEl.textContent = 'Obfuscating...';
  output.value = '';
  try {
    const res = await fetch('/api/obfuscate', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({
        preset: preset.value,
        options: collectOptions(),
        code
      })
    });
    const data = await res.json();
    if (!data.ok) {
      statusEl.textContent = data.error || 'failed';
      statusEl.className = 'status err';
    } else {
      output.value = data.code || '';
      statusEl.textContent = 'OK · ' + (data.mode || preset.value) + ' · ' + (data.code || '').length + ' chars';
      statusEl.className = 'status ok';
    }
  } catch (e) {
    statusEl.textContent = String(e);
    statusEl.className = 'status err';
  }
  runBtn.disabled = false;
};

document.getElementById('copy').onclick = async () => {
  try {
    await navigator.clipboard.writeText(output.value || '');
    statusEl.textContent = 'Copied';
    statusEl.className = 'status ok';
  } catch (_) {
    statusEl.textContent = 'Copy failed';
    statusEl.className = 'status err';
  }
};
</script>
</body>
</html>`;
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname.replace(/\/+$/, "") || "/";

    if (request.method === "OPTIONS") {
      return new Response(null, {
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
          "Access-Control-Allow-Headers": "Content-Type",
        },
      });
    }

    if (path === "/script.lua") return proxyGithub("greedy.lua");
    if (path === "/library.lua") return proxyGithub("greedylibrary.lua");
    if (path === "/loader.lua") return proxyGithub("greedyloader.lua");
    if (path === "/modules.lua") return proxyGithub("greedymodules.lua");

    if (path === "/obfuscator" || path === "/obfuscate") {
      return new Response(obfuscateHtml(), {
        headers: { "Content-Type": "text/html; charset=utf-8", "Cache-Control": "no-cache" },
      });
    }

    if (path === "/tos") {
      return new Response(tosHtml(), {
        headers: { "Content-Type": "text/html; charset=utf-8", "Cache-Control": "no-cache" },
      });
    }

    if (path === "/privacy") {
      return new Response(privacyHtml(), {
        headers: { "Content-Type": "text/html; charset=utf-8", "Cache-Control": "no-cache" },
      });
    }

    if (path === "/api/syntax-check" && request.method === "POST") {
      let body;
      try {
        body = await request.json();
      } catch {
        return new Response(JSON.stringify({ ok: false, issues: ["invalid JSON"] }), {
          status: 400,
          headers: JSON_HEADERS,
        });
      }
      return new Response(JSON.stringify(syntaxCheck(body.code || "")), { headers: JSON_HEADERS });
    }

    if (path === "/api/obfuscate" && request.method === "POST") {
      let body;
      try {
        body = await request.json();
      } catch {
        return new Response(JSON.stringify({ ok: false, error: "invalid JSON" }), {
          status: 400,
          headers: JSON_HEADERS,
        });
      }
      const code = typeof body.code === "string" ? body.code : "";
      const preset = body.preset || "medium";
      if (!code || code.length < 2) {
        return new Response(JSON.stringify({ ok: false, error: "empty code" }), {
          status: 400,
          headers: JSON_HEADERS,
        });
      }
      if (code.length > 1_500_000) {
        return new Response(JSON.stringify({ ok: false, error: "code too large" }), {
          status: 413,
          headers: JSON_HEADERS,
        });
      }

      const apiKey = (env && env.LUAOBF_API_KEY) || FALLBACK_KEY;

      try {
        if (preset === "embed") {
          return new Response(
            JSON.stringify({ ok: true, code: plainLongStringEmbed(code), mode: "embed" }),
            { headers: JSON_HEADERS }
          );
        }

        if (preset === "embed_bit32") {
          let src = code;
          const light = await callLuaObf(apiKey, code, presetConfig("light"));
          if (light.ok) src = light.code;
          const wrapped = bit32Embed(src);
          return new Response(
            JSON.stringify({
              ok: true,
              code: wrapped,
              mode: "embed_bit32",
              note: light.ok
                ? "api light + bit32 embed"
                : "bit32 embed only (api light failed: " + (light.error || "") + ")",
            }),
            { headers: JSON_HEADERS }
          );
        }

        let cfg;
        if (preset === "custom") {
          cfg = buildConfigFromOptions(body.options || {});
        } else {
          cfg = presetConfig(preset);
        }

        const result = await callLuaObf(apiKey, code, cfg);
        if (!result.ok) {
          return new Response(JSON.stringify(result), { status: 502, headers: JSON_HEADERS });
        }
        return new Response(
          JSON.stringify({ ok: true, code: result.code, mode: preset, sessionId: result.sessionId }),
          { headers: JSON_HEADERS }
        );
      } catch (e) {
        return new Response(JSON.stringify({ ok: false, error: String(e) }), {
          status: 500,
          headers: JSON_HEADERS,
        });
      }
    }

    return new Response("Not Found", { status: 404, headers: TEXT_HEADERS });
  },
};
