--[[
  GREEDY_LOADER_MARK_v1
  Official loader — key gate + integrity + loads hub
  https://greedyhudzell.xyz/loader.lua
  script: https://greedyhudzell.xyz/script.lua
]]

local LOADER_URL = "https://greedyhudzell.xyz/loader.lua"
local SCRIPT_URL = "https://greedyhudzell.xyz/script.lua"
local VALIDATE_URL = "https://greedyhudzell.xyz/validate"
local KEY_LINK = "https://work.ink/28wp/Greedy-hudzell"
local DISCORD = "https://discord.gg/sbVuaT9a2T"
local LOADER_MARK = "GREEDY_LOADER_MARK_v1"
local HUB_MARK = "GREEDY_HUB_MARK_v4"

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GENV = (getgenv and getgenv()) or _G

local function notify(msg)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Greedy Hudzell",
			Text = msg,
			Duration = 8,
		})
	end)
	warn("[GreedyLoader]", msg)
end

local function failBypass(extra)
	local msg = "Failed! Error/Caught bypassing, if this keeps happening open a ticket in discord server\n" .. DISCORD
	if extra then
		msg = msg .. "\n(" .. tostring(extra) .. ")"
	end
	notify(msg)
	task.wait(1.2)
	pcall(function()
		local plr = Players.LocalPlayer
		if plr then
			plr:Kick(msg)
		end
	end)
	return error(msg)
end

local function httpRequest(opts)
	local req = (syn and syn.request)
		or (http and http.request)
		or http_request
		or request
		or (fluxus and fluxus.request)
	if not req then
		return nil, "no_request"
	end
	local ok, res = pcall(req, opts)
	if not ok then
		return nil, tostring(res)
	end
	return res, nil
end

local function httpGet(url)
	local res, err = httpRequest({ Url = url, Method = "GET" })
	if res and (res.Body or res.body) then
		return res.Body or res.body
	end
	local ok, body = pcall(function()
		return game:HttpGet(url)
	end)
	if ok and type(body) == "string" then
		return body
	end
	return nil, err or "httpget_failed"
end

-- Integrity: remote loader must contain our mark (tampered host / wrong file)
do
	local remote, err = httpGet(LOADER_URL)
	if type(remote) ~= "string" or #remote < 50 then
		failBypass("loader fetch failed")
	end
	if not string.find(remote, LOADER_MARK, 1, true) then
		failBypass("loader mismatch")
	end
	-- if this running copy is missing the mark, it's a bypass stub
	-- (remote is source of truth — we continue; mark must exist in THIS file too)
end

if not string.find([==[GREEDY_LOADER_MARK_v1]==], "GREEDY_LOADER_MARK") then
	failBypass("local mark")
end

-- Anti double
if GENV.GreedyLoader_Done and GENV.GreedyLoader_JobId == game.JobId then
	warn("[GreedyLoader] already ran")
	return
end
GENV.GreedyLoader_JobId = game.JobId

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
pcall(function()
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
end)
pcall(function()
	player:WaitForChild("PlayerGui", 20)
end)

local KEY_FOLDER = "GreedyHudzell"
local KEY_FILE = KEY_FOLDER .. "/auth.json"
local KEY_TTL = 24 * 3600

local function ensureFolder()
	pcall(function()
		if makefolder and not isfolder(KEY_FOLDER) then
			makefolder(KEY_FOLDER)
		end
	end)
end

local function saveKeyAuth(key, expiresAt)
	ensureFolder()
	local payload = {
		key = key,
		username = player.Name,
		ts = os.time(),
		expires_at = expiresAt,
	}
	GENV.GreedyAuth = payload
	pcall(function()
		if writefile then
			writefile(KEY_FILE, HttpService:JSONEncode(payload))
		end
	end)
end

local function loadSavedKey()
	if type(GENV.GreedyAuth) == "table" and type(GENV.GreedyAuth.key) == "string" then
		local ts = tonumber(GENV.GreedyAuth.ts) or 0
		if os.time() - ts <= KEY_TTL then
			return GENV.GreedyAuth.key, GENV.GreedyAuth.expires_at
		end
	end
	local ok, data = pcall(function()
		if isfile and isfile(KEY_FILE) then
			return HttpService:JSONDecode(readfile(KEY_FILE))
		end
	end)
	if ok and type(data) == "table" and type(data.key) == "string" then
		local ts = tonumber(data.ts) or 0
		if os.time() - ts <= KEY_TTL then
			GENV.GreedyAuth = data
			return data.key, data.expires_at
		end
	end
	return nil, nil
end

local function validateKey(key)
	local res, err = httpRequest({
		Url = VALIDATE_URL,
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json" },
		Body = HttpService:JSONEncode({ key = key, username = player.Name }),
	})
	if not res then
		return false, "connection_failed", nil
	end
	local raw = res.Body or res.body or ""
	local data
	local ok = pcall(function()
		data = HttpService:JSONDecode(raw)
	end)
	if not ok or type(data) ~= "table" then
		return false, "invalid_response", nil
	end
	if data.valid == true then
		return true, "valid", data.expires_at or data.expiresAt
	end
	local reason = data.reason or "validation_failed"
	if reason == "username_mismatch" then
		return false, "incorrect_username", nil
	elseif reason == "invalid_key" then
		return false, "incorrect_key", nil
	elseif reason == "expired" then
		return false, "key_expired", nil
	elseif reason == "revoked" then
		return false, "key_revoked", nil
	end
	return false, reason, nil
end

local function reasonText(r)
	local map = {
		connection_failed = "No connection to server",
		invalid_response = "Bad server response",
		incorrect_username = "Key is for another username",
		incorrect_key = "Invalid key",
		key_expired = "Key expired (24h)",
		key_revoked = "Key revoked",
	}
	return map[r] or tostring(r)
end

local unlocked = false
local usedKey, usedExp = nil, nil

local saved = loadSavedKey()
if saved then
	local ok, reason, exp = validateKey(saved)
	if ok then
		saveKeyAuth(saved, exp)
		unlocked = true
		usedKey, usedExp = saved, exp
		print("[GreedyLoader] key ok")
	else
		GENV.GreedyAuth = nil
		print("[GreedyLoader] saved key failed:", reason)
	end
end

if not unlocked then
	local sg = Instance.new("ScreenGui")
	sg.Name = HttpService:GenerateGUID(false)
	sg.ResetOnSpawn = false
	pcall(function()
		sg.Parent = game:GetService("CoreGui")
	end)
	if not sg.Parent then
		sg.Parent = player:WaitForChild("PlayerGui")
	end
	local f = Instance.new("Frame")
	f.Size = UDim2.new(0, 360, 0, 230)
	f.Position = UDim2.new(0.5, -180, 0.5, -115)
	f.BackgroundColor3 = Color3.fromRGB(12, 10, 5)
	f.Parent = sg
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 12)
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 195, 30)
	stroke.Parent = f
	local tl = Instance.new("TextLabel")
	tl.Size = UDim2.new(1, -20, 0, 26)
	tl.Position = UDim2.new(0, 10, 0, 10)
	tl.BackgroundTransparency = 1
	tl.Text = "GREEDY LOADER — KEY"
	tl.TextColor3 = Color3.fromRGB(255, 195, 30)
	tl.Font = Enum.Font.GothamBold
	tl.TextScaled = true
	tl.Parent = f
	local info = Instance.new("TextLabel")
	info.Size = UDim2.new(1, -20, 0, 18)
	info.Position = UDim2.new(0, 10, 0, 38)
	info.BackgroundTransparency = 1
	info.Text = "User: " .. player.Name
	info.TextColor3 = Color3.fromRGB(160, 140, 100)
	info.Font = Enum.Font.Gotham
	info.TextScaled = true
	info.Parent = f
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -20, 0, 36)
	box.Position = UDim2.new(0, 10, 0, 62)
	box.BackgroundColor3 = Color3.fromRGB(18, 15, 8)
	box.PlaceholderText = "GH-XXXX-XXXX-XXXX"
	box.Text = ""
	box.TextColor3 = Color3.fromRGB(255, 235, 190)
	box.Font = Enum.Font.Gotham
	box.TextScaled = true
	box.Parent = f
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
	local status = Instance.new("TextLabel")
	status.Size = UDim2.new(1, -20, 0, 18)
	status.Position = UDim2.new(0, 10, 0, 104)
	status.BackgroundTransparency = 1
	status.Text = ""
	status.TextColor3 = Color3.fromRGB(220, 150, 40)
	status.Font = Enum.Font.Gotham
	status.TextScaled = true
	status.Parent = f
	local go = Instance.new("TextButton")
	go.Size = UDim2.new(1, -20, 0, 34)
	go.Position = UDim2.new(0, 10, 0, 130)
	go.BackgroundColor3 = Color3.fromRGB(45, 36, 12)
	go.Text = "UNLOCK"
	go.TextColor3 = Color3.fromRGB(255, 235, 190)
	go.Font = Enum.Font.GothamBold
	go.TextScaled = true
	go.Parent = f
	Instance.new("UICorner", go).CornerRadius = UDim.new(0, 8)
	local get = Instance.new("TextButton")
	get.Size = UDim2.new(1, -20, 0, 28)
	get.Position = UDim2.new(0, 10, 0, 175)
	get.BackgroundColor3 = Color3.fromRGB(18, 15, 8)
	get.Text = "Get key (copy link)"
	get.TextColor3 = Color3.fromRGB(160, 140, 100)
	get.Font = Enum.Font.Gotham
	get.TextScaled = true
	get.Parent = f
	Instance.new("UICorner", get).CornerRadius = UDim.new(0, 6)
	local be = Instance.new("BindableEvent")
	local busy = false
	go.MouseButton1Click:Connect(function()
		if busy then
			return
		end
		local key = (box.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
		if key == "" then
			status.Text = "Enter a key"
			return
		end
		busy = true
		go.Text = "CHECKING..."
		task.spawn(function()
			local ok, reason, exp = validateKey(key)
			if ok then
				saveKeyAuth(key, exp)
				usedKey, usedExp = key, exp
				unlocked = true
				sg:Destroy()
				be:Fire()
			else
				status.Text = reasonText(reason)
				go.Text = "UNLOCK"
				busy = false
			end
		end)
	end)
	get.MouseButton1Click:Connect(function()
		pcall(function()
			setclipboard(KEY_LINK)
		end)
		get.Text = "Copied!"
	end)
	be.Event:Wait()
end

GENV.GreedyLoaderAuth = true
GENV.GreedyAuth = GENV.GreedyAuth or { key = usedKey, expires_at = usedExp, username = player.Name, ts = os.time() }
GENV.GreedyLoader_Done = true

-- Load hub from GitHub only
print("[GreedyLoader] fetching hub...")
local hubSrc, hubErr = httpGet(SCRIPT_URL)
if type(hubSrc) ~= "string" or #hubSrc < 100 then
	failBypass("script fetch failed")
end
if not string.find(hubSrc, HUB_MARK, 1, true) then
	failBypass("script mismatch")
end

local fn, err = loadstring(hubSrc)
if not fn then
	failBypass("script compile: " .. tostring(err))
end
print("[GreedyLoader] starting hub...")
fn()
