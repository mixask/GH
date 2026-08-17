/**
 * greedyhudzell.xyz Worker
 *
 * Lua proxies: /loader.lua /script.lua /library.lua /modules.lua
 * Obfuscator UI: GET /obfuscate
 * Obfuscator API: POST /api/obfuscate
 * Syntax check:   POST /api/syntax-check  (lightweight structural)
 *
 * Cloudflare Secret (recommended):
 *   wrangler secret put LUAOBF_API_KEY
 * Then env.LUAOBF_API_KEY is used automatically.
 * Fallback only if secret missing (dev).
 */
const GH = "https://raw.githubusercontent.com/mixask/GH/main";
const LUAOBF_NEW = "https://api.luaobfuscator.com/v1/obfuscator/newscript";
const LUAOBF_RUN = "https://api.luaobfuscator.com/v1/obfuscator/obfuscate";
const FALLBACK_KEY = "11ad3847-d943-4a76-ee19-f9acab3e85144ea9";

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

/** Plugins / root flags aligned with luaobfuscator.com */
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
  // default medium
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

/** Local: bit32-ish byte scramble + long-string embed (no remote API) */
function bit32Embed(code) {
  const key = 0x5a;
  const bytes = [];
  for (let i = 0; i < code.length; i++) {
    bytes.push(code.charCodeAt(i) ^ (key + (i % 17)));
  }
  // chunk as numbers
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
  // also wrap whole thing in long string loader for extra layer
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

/** Structural syntax check (not full luac — runs on edge) */
function syntaxCheck(code) {
  const issues = [];
  if (!code || !code.trim()) {
    return { ok: false, issues: ["empty code"] };
  }
  const pairs = { "(": ")", "[": "]", "{": "}" };
  const stack = [];
  let i = 0;
  let line = 1;
  let inStr = null; // ' " or long
  let longEq = 0;

  while (i < code.length) {
    const c = code[i];
    if (c === "\n") line++;

    // long strings [[ ]] [=[ ]=]
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

    // line comments
    if (c === "-" && code[i + 1] === "-") {
      if (code[i + 2] === "[") {
        // block comment treated roughly as long string scan
        i += 2;
        continue;
      }
      while (i < code.length && code[i] !== "\n") i++;
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

  // rough keyword balance
  const ends = (code.match(/\bend\b/g) || []).length;
  const starts =
    (code.match(/\bfunction\b/g) || []).length +
    (code.match(/\bthen\b/g) || []).length +
    (code.match(/\bdo\b/g) || []).length;
  // not exact but signal
  if (Math.abs(ends - starts) > 5) {
    issues.push(`possible block imbalance (function/then/do=${starts}, end=${ends})`);
  }

  return { ok: issues.length === 0, issues };
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
<title>Greedy · Lua Obfuscator</title>
<style>
:root{--bg:#0c0a05;--panel:#12100a;--btn:#2d240c;--accent:#ffc31e;--text:#ffe6be;--muted:#9e8c64;--ok:#50aa46;--bad:#e05555}
*{box-sizing:border-box}body{margin:0;font-family:system-ui,sans-serif;background:var(--bg);color:var(--text);min-height:100vh}
header{padding:14px 18px;border-bottom:1px solid #3a3010;display:flex;gap:14px;align-items:center;flex-wrap:wrap}
header h1{margin:0;font-size:1.1rem;color:var(--accent)}
header a{color:var(--muted);text-decoration:none;font-size:.9rem}
main{max-width:1100px;margin:0 auto;padding:18px}
.card{background:var(--panel);border:1px solid #3a3010;border-radius:12px;padding:14px;margin-bottom:14px}
label.title{display:block;color:var(--muted);font-size:.82rem;margin-bottom:6px}
.chk{display:flex;align-items:center;gap:8px;font-size:.9rem;margin:4px 0;color:var(--text)}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
@media(max-width:800px){.grid{grid-template-columns:1fr}}
textarea,select,button{width:100%;border-radius:8px;border:1px solid #4a3c14;background:#1a150a;color:var(--text);padding:10px;font-size:.92rem}
textarea{min-height:240px;font-family:ui-monospace,monospace;resize:vertical}
button{background:var(--btn);color:var(--accent);font-weight:700;cursor:pointer;margin-top:8px}
button:hover{filter:brightness(1.12)}button:disabled{opacity:.5;cursor:wait}
.actions{display:flex;flex-wrap:wrap;gap:8px}
.actions button{flex:1;min-width:140px}
.status{margin-top:8px;font-size:.88rem;color:var(--muted);white-space:pre-wrap}
.status.ok{color:var(--ok)}.status.err{color:var(--bad)}
.hint{color:var(--muted);font-size:.78rem;line-height:1.4;margin-top:8px}
.plugins{display:grid;grid-template-columns:1fr 1fr;gap:4px 12px}
@media(max-width:600px){.plugins{grid-template-columns:1fr}}
</style>
</head>
<body>
<header>
  <h1>Greedy Hudzell · Lua Obfuscator</h1>
  <a href="https://luaobfuscator.com" target="_blank">luaobfuscator.com</a>
  <a href="https://discord.gg/sbVuaT9a2T">Discord</a>
</header>
<main>
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
      <b>embed_bit32</b> — optional API light pass (if possible) then bit32 byte scramble inside long-string loader (needs bit32 at runtime / Luau bit32).<br/>
      <b>full</b> — heavy VM; may break large Roblox scripts (upvalues).
    </p>
  </div>

  <div class="card">
    <label class="title">Root flags (luaobfuscator)</label>
    <div class="plugins" id="roots">${rootChecks}</div>
    <label class="title" style="margin-top:12px">CustomPlugins</label>
    <div class="plugins" id="plugins">${pluginChecks}</div>
  </div>

  <div class="grid">
    <div class="card">
      <label class="title">Input</label>
      <textarea id="input" placeholder="paste Lua here..."></textarea>
      <div class="actions">
        <button id="run">Obfuscate</button>
        <button id="checkIn">Check syntax (input)</button>
      </div>
      <div id="status" class="status"></div>
    </div>
    <div class="card">
      <label class="title">Output</label>
      <textarea id="output" placeholder="result..."></textarea>
      <div class="actions">
        <button id="copy">Copy</button>
        <button id="checkOut">Check syntax (output)</button>
      </div>
    </div>
  </div>
</main>
<script>
const statusEl = document.getElementById('status');
const input = document.getElementById('input');
const output = document.getElementById('output');
const preset = document.getElementById('preset');
const runBtn = document.getElementById('run');

function collectOptions() {
  const opts = {};
  document.querySelectorAll('[data-root]').forEach(el => { opts[el.getAttribute('data-root')] = el.checked; });
  document.querySelectorAll('[data-plugin]').forEach(el => { opts[el.getAttribute('data-plugin')] = el.checked; });
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
      statusEl.textContent = 'Syntax check OK (structural — not full luac)';
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
      statusEl.textContent = 'OK · ' + (data.mode || preset.value) + ' · ' + (data.code||'').length + ' chars';
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
    const path = url.pathname;

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

    if (path === "/obfuscate" || path === "/obfuscate/") {
      return new Response(obfuscateHtml(), {
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
      const result = syntaxCheck(body.code || "");
      return new Response(JSON.stringify(result), { headers: JSON_HEADERS });
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
        // Local-only modes
        if (preset === "embed") {
          return new Response(
            JSON.stringify({ ok: true, code: plainLongStringEmbed(code), mode: "embed" }),
            { headers: JSON_HEADERS }
          );
        }

        if (preset === "embed_bit32") {
          // optional light API pass first
          let src = code;
          const light = await callLuaObf(apiKey, code, presetConfig("light"));
          if (light.ok) src = light.code;
          const wrapped = bit32Embed(src);
          return new Response(
            JSON.stringify({
              ok: true,
              code: wrapped,
              mode: "embed_bit32",
              note: light.ok ? "api light + bit32 embed" : "bit32 embed only (api light failed: " + (light.error || "") + ")",
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
