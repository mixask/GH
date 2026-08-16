--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_OR = obf_bitlib.bor;
local obf_AND = obf_bitlib.band;
local SCRIPT_URL = "https://greedyhudzell.xyz/script.lua";
local VALIDATE_URL = "https://greedyhudzell.xyz/validate";
local KEY_LINK = "https://work.ink/28wp/Greedy-hudzell";
local DISCORD = "https://discord.gg/sbVuaT9a2T";
local AUTH_FOLDER = "GreedyHudzell";
local AUTH_FILE = "GreedyHudzell/session.gh";
local AUTH_MAGIC = "GHSESSION_v1";
local HttpService = game:GetService("HttpService");
local Players = game:GetService("Players");
local GENV = (getgenv and getgenv()) or _G;
local function notify(msg)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {Title="Greedy Loader",Text=tostring(msg),Duration=6});
	end);
	warn("[GreedyLoader]", msg);
end
local function failBypass(extra)
	local msg = "Failed! Error/Caught bypassing, if this keeps happening open a ticket in discord server\n" .. DISCORD;
	if extra then
		msg = msg .. "\n(" .. tostring(extra) .. ")";
	end
	notify(msg);
	task.wait(1);
	pcall(function()
		if Players.LocalPlayer then
			Players.LocalPlayer:Kick(msg);
		end
	end);
	error(msg);
end
local function httpRequest(opts)
	local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request);
	if not req then
		return nil, "no_request";
	end
	local ok, res = pcall(req, opts);
	if not ok then
		return nil, tostring(res);
	end
	return res, nil;
end
local function httpRequestTimed(opts, timeout)
	timeout = timeout or 6;
	local done, result, err = false, nil, nil;
	task.spawn(function()
		result, err = httpRequest(opts);
		done = true;
	end);
	local t0 = os.clock();
	while not done and ((os.clock() - t0) < timeout) do
		task.wait(0.05);
	end
	if not done then
		return nil, "timeout";
	end
	return result, err;
end
local function httpGet(url)
	local res = httpRequestTimed({Url=url,Method="GET"}, 10);
	if (res and (res.Body or res.body)) then
		return res.Body or res.body;
	end
	local ok, body = pcall(function()
		return game:HttpGet(url);
	end);
	if (ok and (type(body) == "string")) then
		return body;
	end
	return nil;
end
if (GENV.GreedyLoader_Done and (GENV.GreedyLoader_JobId == game.JobId)) then
	warn("[GreedyLoader] already ran");
	return;
end
GENV.GreedyLoader_JobId = game.JobId;
local player = Players.LocalPlayer or Players.PlayerAdded:Wait();
pcall(function()
	if not game:IsLoaded() then
		game.Loaded:Wait();
	end
end);
pcall(function()
	player:WaitForChild("PlayerGui", 25);
end);
local function ensureFolder()
	pcall(function()
		if (makefolder and not isfolder(AUTH_FOLDER)) then
			makefolder(AUTH_FOLDER);
		end
	end);
end
local function writeSession(key, expiresAt)
	ensureFolder();
	local exp = tonumber(expiresAt) or (obf_AND(os.time(), 24 * 3600) + obf_OR(os.time(), 24 * 3600));
	local line = table.concat({AUTH_MAGIC,player.Name,key,tostring(exp),tostring(os.time()),HttpService:GenerateGUID(false)}, "|");
	pcall(function()
		if writefile then
			writefile(AUTH_FILE, line);
		end
	end);
	GENV.GreedyAuth = {key=key,username=player.Name,expires_at=exp,ts=os.time(),from_loader=true};
end
local function readSession()
	local ok, raw = pcall(function()
		if (isfile and isfile(AUTH_FILE)) then
			return readfile(AUTH_FILE);
		end
	end);
	if (ok and (type(raw) == "string")) then
		local parts = {};
		for bit in string.gmatch(raw, "[^|]+") do
			table.insert(parts, bit);
		end
		if ((parts[1] == AUTH_MAGIC) and parts[3]) then
			return {username=parts[2],key=parts[3],expires_at=tonumber(parts[4]),ts=tonumber(parts[5])};
		end
	end
	return nil;
end
local function validateKey(key)
	local res = httpRequestTimed({Url=VALIDATE_URL,Method="POST",Headers={["Content-Type"]="application/json"},Body=HttpService:JSONEncode({key=key,username=player.Name})}, 6);
	if not res then
		return false, "connection_failed", nil;
	end
	local data;
	local ok = pcall(function()
		data = HttpService:JSONDecode(res.Body or res.body or "");
	end);
	if (not ok or (type(data) ~= "table")) then
		return false, "invalid_response", nil;
	end
	if (data.valid == true) then
		return true, "valid", data.expires_at or data.expiresAt;
	end
	local reason = data.reason or "validation_failed";
	if (reason == "username_mismatch") then
		return false, "incorrect_username", nil;
	elseif (reason == "invalid_key") then
		return false, "incorrect_key", nil;
	elseif (reason == "expired") then
		return false, "key_expired", nil;
	elseif (reason == "revoked") then
		return false, "key_revoked", nil;
	end
	return false, reason, nil;
end
local function reasonText(r)
	local map = {connection_failed="No connection",invalid_response="Bad response",incorrect_username="Wrong username for key",incorrect_key="Invalid key",key_expired="Key expired (24h)",key_revoked="Key revoked"};
	return map[r] or tostring(r);
end
local unlocked = false;
local sess = readSession();
if (sess and sess.key and (not sess.username or (sess.username == player.Name))) then
	local exp = tonumber(sess.expires_at);
	if (not exp or (exp > os.time())) then
		local ok, reason, exp2 = validateKey(sess.key);
		if ok then
			writeSession(sess.key, exp2 or exp);
			unlocked = true;
			print("[GreedyLoader] session ok");
		else
			print("[GreedyLoader] session fail:", reason);
			pcall(function()
				if (delfile and isfile(AUTH_FILE)) then
					delfile(AUTH_FILE);
				end
			end);
		end
	end
end
if not unlocked then
	local sg = Instance.new("ScreenGui");
	sg.Name = HttpService:GenerateGUID(false);
	sg.ResetOnSpawn = false;
	pcall(function()
		sg.Parent = game:GetService("CoreGui");
	end);
	if not sg.Parent then
		sg.Parent = player:WaitForChild("PlayerGui");
	end
	local f = Instance.new("Frame");
	f.Size = UDim2.new(0, 360, 0, 230);
	f.Position = UDim2.new(0.5, -180, 0.5, -115);
	f.BackgroundColor3 = Color3.fromRGB(12, 10, 5);
	f.Parent = sg;
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 12);
	local stroke = Instance.new("UIStroke");
	stroke.Color = Color3.fromRGB(255, 195, 30);
	stroke.Parent = f;
	local tl = Instance.new("TextLabel");
	tl.Size = UDim2.new(1, -20, 0, 26);
	tl.Position = UDim2.new(0, 10, 0, 10);
	tl.BackgroundTransparency = 1;
	tl.Text = "GREEDY LOADER — KEY";
	tl.TextColor3 = Color3.fromRGB(255, 195, 30);
	tl.Font = Enum.Font.GothamBold;
	tl.TextScaled = true;
	tl.Parent = f;
	local info = Instance.new("TextLabel");
	info.Size = UDim2.new(1, -20, 0, 18);
	info.Position = UDim2.new(0, 10, 0, 38);
	info.BackgroundTransparency = 1;
	info.Text = "User: " .. player.Name;
	info.TextColor3 = Color3.fromRGB(160, 140, 100);
	info.Font = Enum.Font.Gotham;
	info.TextScaled = true;
	info.Parent = f;
	local box = Instance.new("TextBox");
	box.Size = UDim2.new(1, -20, 0, 36);
	box.Position = UDim2.new(0, 10, 0, 62);
	box.BackgroundColor3 = Color3.fromRGB(18, 15, 8);
	box.PlaceholderText = "GH-XXXX-XXXX-XXXX";
	box.Text = "";
	box.TextColor3 = Color3.fromRGB(255, 235, 190);
	box.Font = Enum.Font.Gotham;
	box.TextScaled = true;
	box.Parent = f;
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8);
	local status = Instance.new("TextLabel");
	status.Size = UDim2.new(1, -20, 0, 18);
	status.Position = UDim2.new(0, 10, 0, 104);
	status.BackgroundTransparency = 1;
	status.Text = "";
	status.TextColor3 = Color3.fromRGB(220, 150, 40);
	status.Font = Enum.Font.Gotham;
	status.TextScaled = true;
	status.Parent = f;
	local go = Instance.new("TextButton");
	go.Size = UDim2.new(1, -20, 0, 34);
	go.Position = UDim2.new(0, 10, 0, 130);
	go.BackgroundColor3 = Color3.fromRGB(45, 36, 12);
	go.Text = "UNLOCK";
	go.TextColor3 = Color3.fromRGB(255, 235, 190);
	go.Font = Enum.Font.GothamBold;
	go.TextScaled = true;
	go.Parent = f;
	Instance.new("UICorner", go).CornerRadius = UDim.new(0, 8);
	local get = Instance.new("TextButton");
	get.Size = UDim2.new(1, -20, 0, 28);
	get.Position = UDim2.new(0, 10, 0, 175);
	get.BackgroundColor3 = Color3.fromRGB(18, 15, 8);
	get.Text = "Get key (copy link)";
	get.TextColor3 = Color3.fromRGB(160, 140, 100);
	get.Font = Enum.Font.Gotham;
	get.TextScaled = true;
	get.Parent = f;
	Instance.new("UICorner", get).CornerRadius = UDim.new(0, 6);
	local be = Instance.new("BindableEvent");
	local busy = false;
	go.MouseButton1Click:Connect(function()
		if busy then
			return;
		end
		local key = (box.Text or ""):gsub("^%s+", ""):gsub("%s+$", "");
		if (key == "") then
			status.Text = "Enter a key";
			return;
		end
		busy = true;
		go.Text = "CHECKING...";
		task.spawn(function()
			local ok, reason, exp = validateKey(key);
			if ok then
				writeSession(key, exp);
				unlocked = true;
				sg:Destroy();
				be:Fire();
			else
				status.Text = reasonText(reason);
				go.Text = "UNLOCK";
				busy = false;
			end
		end);
	end);
	get.MouseButton1Click:Connect(function()
		pcall(function()
			setclipboard(KEY_LINK);
		end);
		get.Text = "Copied!";
	end);
	be.Event:Wait();
end
GENV.GreedyLoader_Done = true;
GENV.GreedyOfficial = true;
GENV.GreedyOfficialTag = "greedyhudzell";
print("[GreedyLoader] loading UI...");
local src = httpGet(SCRIPT_URL);
if ((type(src) ~= "string") or (#src < 50)) then
	failBypass("script fetch failed");
end
local fn, err = loadstring(src);
if not fn then
	failBypass("script compile: " .. tostring(err));
end
pcall(function()
	local env = getfenv and getfenv(fn);
	if (type(env) == "table") then
		env.game = game;
		env.workspace = workspace;
		env.Instance = Instance;
		env.task = task;
		env.Enum = Enum;
		env.CFrame = CFrame;
		env.Vector3 = Vector3;
		env.UDim2 = UDim2;
		env.UDim = UDim;
		env.Color3 = Color3;
		env.typeof = typeof;
		env.typeof = typeof;
		env.tick = tick;
		env.os = os;
		env.pairs = pairs;
		env.ipairs = ipairs;
		env.pcall = pcall;
		env.print = print;
		env.warn = warn;
		env.select = select;
		env.unpack = unpack or table.unpack;
		env.table = table;
		env.string = string;
		env.math = math;
		if setfenv then
			setfenv(fn, env);
		end
	end
end);
pcall(function()
	local g = (getgenv and getgenv()) or _G;
	g.game = game;
	g.workspace = workspace;
end);
fn();
