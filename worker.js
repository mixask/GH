/**
 * mixask/GH — worker.js (proxies + obfuscator + pricing/tos)
 *
 * Lua: /loader.lua /script.lua /library.lua /modules.lua
 * UI:  GET /obfuscator  /pricing  /tos  /privacy
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
const FREE_KEY = "https://work.ink/28wp/Greedy-hudzell"; // adjust if needed
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
      while (code[j] === "=") {
        n++;
        j++;
      }
      if (code[j] === "[") {
        i = j + 1;
        while (i < code.length) {
          if (code[i] === "\n") line++;
          if (code[i] === "]") {
            let k = i + 1;
            let m = 0;
            while (code[k] === "=") {
              m++;
              k++;
            }
            if (m === n && code[k] === "]") {
              i = k + 1;
              break;
            }
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
      inStr = "long";
      longEq = 0;
      i += 2;
      continue;
    }
    if (!inStr && c === "[" && code[i + 1] === "=") {
      let n = 0;
      let j = i + 1;
      while (code[j] === "=") {
        n++;
        j++;
      }
      if (code[j] === "[") {
        inStr = "long";
        longEq = n;
        i = j + 1;
        continue;
      }
    }
    if (inStr === "long") {
      if (c === "]") {
        let n = 0;
        let j = i + 1;
        while (code[j] === "=") {
          n++;
          j++;
        }
        if (n === longEq && code[j] === "]") {
          inStr = null;
          i = j + 1;
          continue;
        }
      }
      i++;
      continue;
    }
    if (!inStr && (c === '"' || c === "'")) {
      inStr = c;
      i++;
      continue;
    }
    if (inStr === '"' || inStr === "'") {
      if (c === "\\") {
        i += 2;
        continue;
      }
      if (c === inStr) inStr = null;
      i++;
      continue;
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

function navHtml(active) {
  const items = [
    ["/", "Home"],
    ["/pricing", "Pricing"],
    ["/status", "Status"],
    ["/executors", "Executors"],
    ["/guide", "Guide"],
    ["/tos", "ToS"],
    ["/obfuscator", "Obfuscator"],
  ];
  return items
    .map(([href, label]) => {
      const isActive =
        active === label.toLowerCase() ||
        (active === "pricing" && href === "/pricing") ||
        (active === "tos" && href === "/tos") ||
        (active === "obfuscator" && href === "/obfuscator") ||
        (active === "privacy" && href === "/privacy");
      return `<a href="${href}"${isActive ? ' class="active"' : ""}>${label}</a>`;
    })
    .join("\n      ");
}

function pageShell(title, activeNav, content, wide = false) {
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
.wrap{width:min(${wide ? "1100px" : "780px"},94vw);margin:0 auto;padding:28px 0 80px}
.top{
  position:sticky;top:0;z-index:50;backdrop-filter:blur(14px);
  background:rgba(10,10,10,.78);border-bottom:1px solid var(--border);
}
.top-inner{
  width:min(1100px,94vw);margin:0 auto;display:flex;align-items:center;
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
.price-grid{
  display:grid;grid-template-columns:repeat(4,1fr);gap:14px;margin:24px 0 12px;
}
@media(max-width:900px){.price-grid{grid-template-columns:1fr 1fr}}
@media(max-width:520px){.price-grid{grid-template-columns:1fr}}
.price-card{
  background:var(--card);border:1px solid var(--border);border-radius:var(--radius);
  padding:20px 18px;display:flex;flex-direction:column;gap:10px;position:relative;
  transition:border-color .15s, transform .15s;
}
.price-card:hover{border-color:rgba(201,162,39,.45);transform:translateY(-2px)}
.price-card.featured{
  border-color:var(--gold);
  box-shadow:0 0 0 1px rgba(201,162,39,.25), 0 20px 50px rgba(0,0,0,.35);
}
.price-card .tag{
  position:absolute;top:12px;right:12px;font-size:10px;font-weight:700;
  text-transform:uppercase;letter-spacing:.04em;
  background:var(--gold);color:#0a0a0a;padding:3px 8px;border-radius:999px;
}
.price-card h3{font-size:1.05rem;font-weight:700}
.price-card .amount{font-size:1.85rem;font-weight:700;color:var(--gold-soft);letter-spacing:-.02em}
.price-card .amount span{font-size:13px;color:var(--muted);font-weight:500}
.price-card ul{list-style:none;padding:0;margin:6px 0 4px;flex:1}
.price-card ul li{
  font-size:13px;color:#c8c8c8;padding:5px 0 5px 18px;position:relative;line-height:1.4;
}
.price-card ul li::before{
  content:"✓";position:absolute;left:0;color:var(--gold);font-weight:700;font-size:12px;
}
.btn{
  display:inline-flex;align-items:center;justify-content:center;
  padding:11px 14px;border-radius:999px;font-size:13px;font-weight:600;
  border:1px solid var(--border);background:var(--bg2);color:var(--text);
  cursor:pointer;text-decoration:none;width:100%;margin-top:4px;
}
.btn:hover{border-color:var(--gold);color:var(--gold-soft);text-decoration:none}
.btn-gold{
  background:linear-gradient(135deg,var(--gold),#a8841a);
  color:#0a0a0a;border-color:var(--gold);
}
.btn-gold:hover{color:#0a0a0a;filter:brightness(1.05);text-decoration:none}
.note{
  margin-top:18px;padding:14px 16px;border-radius:12px;
  background:var(--bg2);border:1px solid var(--border);
  color:var(--muted);font-size:13px;line-height:1.6;
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
      ${navHtml(activeNav)}
    </nav>
  </div>
</header>
<main class="wrap">
${content}
  <footer class="site">
    © Greedy Hudzell · <a href="${DISCORD}">discord.gg/sbVuaT9a2T</a> ·
    <a href="/privacy">Privacy</a> · Not affiliated with Roblox
  </footer>
</main>
</body>
</html>`;
}

function pricingHtml() {
  const content = `
  <div class="page-header">
    <div class="badge">Draft · USD</div>
    <h1>Pricing</h1>
    <p class="sub">Free day key via Work.ink · Paid plans include <b>account rewire</b></p>
  </div>

  <div class="price-grid">
    <article class="price-card">
      <h3>Free</h3>
      <div class="amount">$0 <span>/ 24h</span></div>
      <ul>
        <li>Full script access</li>
        <li>1 Roblox username</li>
        <li>Work.ink unlock</li>
        <li>No rewire</li>
      </ul>
      <a class="btn" href="${FREE_KEY}" target="_blank" rel="noopener">Get free key</a>
    </article>

    <article class="price-card">
      <h3>Week</h3>
      <div class="amount">$3.99 <span>/ 7 days</span></div>
      <ul>
        <li>Full script access</li>
        <li>Account rewire included</li>
        <li>Priority Discord support</li>
        <li>Key via ticket / seller</li>
      </ul>
      <a class="btn" href="${DISCORD}" target="_blank" rel="noopener">Buy on Discord</a>
    </article>

    <article class="price-card featured">
      <span class="tag">Popular</span>
      <h3>Month</h3>
      <div class="amount">$6.99 <span>/ 30 days</span></div>
      <ul>
        <li>Full script access</li>
        <li>Account rewire included</li>
        <li>Priority Discord support</li>
        <li>Best balance of price / time</li>
      </ul>
      <a class="btn btn-gold" href="${DISCORD}" target="_blank" rel="noopener">Buy on Discord</a>
    </article>

    <article class="price-card">
      <h3>Year</h3>
      <div class="amount">$12.99 <span>/ 365 days</span></div>
      <ul>
        <li>Full script access</li>
        <li>Account rewire included</li>
        <li>Priority Discord support</li>
        <li>Best long-term value</li>
      </ul>
      <a class="btn" href="${DISCORD}" target="_blank" rel="noopener">Buy on Discord</a>
    </article>
  </div>

  <div class="note">
    <b>Rewire</b> — on paid plans you may rebind the key to another Roblox username (fair-use; abuse may be limited).<br/>
    Free keys are bound once and are not transferable.<br/>
    Payments are handled via Discord for now. See <a href="/tos">Terms of Service</a>.
  </div>

  <div class="section" style="margin-top:36px">
    <h2>What’s included</h2>
    <p>Autofarm, missions tools, ESP, movement utilities, loader + key system, and ongoing updates while your plan is active. Features may change with game patches.</p>
  </div>
  <div class="section">
    <h2>How to buy</h2>
    <ul>
      <li>Open our Discord and create a purchase ticket (or contact a listed seller)</li>
      <li>Pay for Week / Month / Year</li>
      <li>Receive a key — run the official loader and activate</li>
    </ul>
  </div>
`;
  return pageShell("Pricing", "pricing", content, true);
}

function tosHtml() {
  const content = `
  <div class="page-header">
    <div class="badge">Legal</div>
    <h1>Terms of Service</h1>
    <p class="sub">Last updated: August 2026</p>
  </div>
  <div class="section">
    <h2>1. Acceptance</h2>
    <p>By purchasing, unlocking, using, or accessing any Greedy Hudzell (GH) product, script, loader, website, Discord bot, or related service, you agree to these Terms of Service. If you do not agree, do not use our services.</p>
  </div>
  <div class="section">
    <h2>2. Plans &amp; pricing</h2>
    <p>We may offer free and paid access:</p>
    <ul>
      <li><strong>Free</strong> — limited-duration key (typically 24 hours) obtained through the published unlock flow (e.g. Work.ink). One Roblox username bind. No rewire.</li>
      <li><strong>Week</strong> — USD 3.99 for 7 days</li>
      <li><strong>Month</strong> — USD 6.99 for 30 days</li>
      <li><strong>Year</strong> — USD 12.99 for 365 days</li>
    </ul>
    <p>Prices are listed on <a href="/pricing">/pricing</a> and may change. The price at the time of purchase applies to that order.</p>
  </div>
  <div class="section">
    <h2>3. License</h2>
    <p>Upon obtaining a valid key, you receive a non-transferable, non-exclusive, revocable license for personal use only. You may not:</p>
    <ul>
      <li>Resell, rent, redistribute, or publicly share keys or script builds</li>
      <li>Deobfuscate, reverse-engineer, or claim GH as your own work</li>
      <li>Use GH to harass others or for purposes unrelated to the intended game tooling</li>
      <li>Bypass or attack our key, website, or Discord systems</li>
    </ul>
  </div>
  <div class="section">
    <h2>4. Account bind &amp; rewire</h2>
    <p><strong>Free keys</strong> are bound to a single Roblox username and are not eligible for rewire.</p>
    <p><strong>Paid keys</strong> (Week / Month / Year) include <strong>account rewire</strong>: you may request rebinding to another Roblox username subject to fair use. We may deny or rate-limit rewires in cases of abuse, resale, or fraud. Rewire does not extend the expiry date unless we explicitly say so.</p>
  </div>
  <div class="section">
    <h2>5. Refund policy</h2>
    <p>All sales are final after a key has been delivered. We do not offer refunds for change of mind, executor issues, user error, or temporary breakage caused by game updates. If GH is unusable due to a fault on our side, we may extend a key at our discretion.</p>
  </div>
  <div class="section">
    <h2>6. Key responsibility</h2>
    <p>You are responsible for keeping your key private. Sharing a key may result in revocation without refund. We may revoke keys that violate these terms, including abuse of rewire or payment fraud.</p>
  </div>
  <div class="section">
    <h2>7. Service availability</h2>
    <p>We do not guarantee uninterrupted service. Roblox updates, executor changes, maintenance, or third-party outages may affect functionality. Downtime alone does not automatically entitle you to a refund or extension.</p>
  </div>
  <div class="section">
    <h2>8. Prohibited use &amp; risk</h2>
    <p>You are solely responsible for complying with Roblox Terms of Service and applicable laws. Use of third-party scripts and executors can result in account penalties. GH is provided as-is; we are not responsible for bans, data loss, or other account actions.</p>
  </div>
  <div class="section">
    <h2>9. Disclaimer</h2>
    <p>Greedy Hudzell is not affiliated with, endorsed by, or connected to Roblox Corporation. All trademarks belong to their owners.</p>
  </div>
  <div class="section">
    <h2>10. Changes</h2>
    <p>We may update these terms at any time. Continued use after changes constitutes acceptance. Material changes may be announced on Discord.</p>
  </div>
  <div class="section">
    <h2>11. Contact</h2>
    <p>Questions: <a href="${DISCORD}">Discord</a>. See also <a href="/privacy">Privacy Policy</a> and <a href="/pricing">Pricing</a>.</p>
  </div>
`;
  return pageShell("Terms of Service", "tos", content);
}

function privacyHtml() {
  const content = `
  <div class="page-header">
    <div class="badge">Legal</div>
    <h1>Privacy Policy</h1>
    <p class="sub">Last updated: August 2026</p>
  </div>
  <div class="section">
    <h2>1. Overview</h2>
    <p>Greedy Hudzell ("we", "us") collects minimal data required to run keys, support, and anti-abuse.</p>
  </div>
  <div class="section">
    <h2>2. Information we collect</h2>
    <ul>
      <li><strong>Roblox username</strong> — license bind / rewire</li>
      <li><strong>Discord user ID</strong> — bot commands, tickets, purchases</li>
      <li><strong>Purchase / key metadata</strong> — plan, expiry, revoke status</li>
      <li><strong>Technical logs</strong> — validation and abuse prevention</li>
    </ul>
  </div>
  <div class="section">
    <h2>3. Use of data</h2>
    <p>We use data to validate licenses, provide support, prevent sharing/abuse, and improve stability. We do not sell personal data for marketing.</p>
  </div>
  <div class="section">
    <h2>4. Retention &amp; rights</h2>
    <p>Data is kept while a license is relevant for support and anti-abuse. You may request access or deletion via Discord where legally applicable.</p>
  </div>
  <div class="section">
    <h2>5. Third parties</h2>
    <p>Roblox, Discord, Cloudflare, and payment intermediaries may process data under their own policies.</p>
  </div>
  <div class="section">
    <h2>6. Contact</h2>
    <p><a href="${DISCORD}">Discord</a> · <a href="/tos">Terms of Service</a></p>
  </div>
`;
  return pageShell("Privacy Policy", "privacy", content);
}

/* ---- obfuscator page (unchanged logic, nav includes Pricing) ---- */
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
.panel{background:var(--card);border:1px solid var(--border);border-radius:var(--radius);padding:18px;margin-top:18px}
.panel h2{font-size:1.15rem;margin-bottom:4px}
.panel .sub{color:var(--muted);font-size:13px;margin-bottom:14px}
.card{background:var(--bg2);border:1px solid var(--border);border-radius:12px;padding:14px;margin-bottom:12px}
label.title{display:block;color:var(--muted);font-size:11px;text-transform:uppercase;letter-spacing:.05em;margin-bottom:8px;font-weight:600}
.chk{display:flex;align-items:center;gap:8px;font-size:13px;margin:4px 0;color:var(--text)}
.chk input{accent-color:var(--gold)}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
@media(max-width:800px){.grid{grid-template-columns:1fr}}
.plugins{display:grid;grid-template-columns:1fr 1fr;gap:4px 12px}
@media(max-width:600px){.plugins{grid-template-columns:1fr}}
textarea,select{width:100%;border-radius:10px;border:1px solid var(--border);background:#0c0c0c;color:var(--text);padding:10px 12px;font-size:13px}
textarea{min-height:240px;font-family:"JetBrains Mono",ui-monospace,monospace;font-size:12px;resize:vertical}
textarea:focus,select:focus{outline:1px solid rgba(201,162,39,.4)}
.btn{display:inline-flex;align-items:center;justify-content:center;padding:10px 14px;border-radius:999px;font-size:13px;font-weight:600;border:1px solid var(--border);background:var(--card);color:var(--text);cursor:pointer;margin-top:8px}
.btn:hover{border-color:var(--gold);color:var(--gold-soft)}
.btn:disabled{opacity:.5;cursor:wait}
.btn-gold{background:linear-gradient(135deg,var(--gold),#a8841a);color:#0a0a0a;border-color:var(--gold)}
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
      ${navHtml("obfuscator")}
    </nav>
  </div>
</header>
<main class="wrap">
  <section class="panel">
    <h2>Lua obfuscator</h2>
    <p class="sub">Heavy presets (full/VM) can cause stack overflow on large hubs — prefer light/medium for GH.</p>
    <div class="card">
      <label class="title">Preset</label>
      <select id="preset">
        <option value="custom">Custom</option>
        <option value="light">Light</option>
        <option value="medium" selected>Medium</option>
        <option value="full">Full (VM — may break large scripts)</option>
        <option value="embed">Embed only</option>
        <option value="embed_bit32">Embed + bit32</option>
      </select>
      <p class="hint">If loader reports <b>stack overflow</b> after obfuscation, use light/medium or skip VM.</p>
    </div>
    <div class="card">
      <label class="title">Root flags</label>
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
    if (path === "/pricing") {
      return new Response(pricingHtml(), {
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
          return new Response(
            JSON.stringify({
              ok: true,
              code: bit32Embed(src),
              mode: "embed_bit32",
              note: light.ok ? "api light + bit32 embed" : "bit32 embed only",
            }),
            { headers: JSON_HEADERS }
          );
        }
        const cfg = preset === "custom" ? buildConfigFromOptions(body.options || {}) : presetConfig(preset);
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
