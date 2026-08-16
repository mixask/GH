--[[
  Greedy Hudzell UI Library v2.1
  – sequential names UI1, UI2 (visible labels stay normal)
  – Toggle: ON/OFF + green/red (reliable)
]]
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GreedyUI = {}
GreedyUI.__index = GreedyUI

local DEFAULT_THEME = {
	Bg = Color3.fromRGB(12, 10, 5),
	Panel = Color3.fromRGB(18, 15, 8),
	Btn = Color3.fromRGB(42, 34, 14),
	Accent = Color3.fromRGB(255, 195, 30),
	Text = Color3.fromRGB(255, 235, 190),
	Muted = Color3.fromRGB(160, 140, 100),
	Bad = Color3.fromRGB(190, 45, 45),
	Ok = Color3.fromRGB(80, 170, 70),
}

local _idCounter = 0
local function nextId()
	_idCounter = _idCounter + 1
	return "UI" .. _idCounter
end

local function corner(inst, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 8)
	c.Parent = inst
end

local function stroke(inst, col)
	local s = Instance.new("UIStroke")
	s.Color = col
	s.Thickness = 1.2
	s.Parent = inst
end

function GreedyUI.new(opts)
	opts = opts or {}
	local self = setmetatable({}, GreedyUI)
	self.theme = opts.theme or DEFAULT_THEME
	self.title = opts.title or "Greedy UI"
	self.size = opts.size or UDim2.new(0, 520, 0, 360)
	self.layout = opts.layout or "tabs_left"
	self.logo = opts.logo
	self.onClose = opts.onClose
	self._pages = {}
	self._current = nil

	local parent = opts.parent
	if not parent then
		local sg = Instance.new("ScreenGui")
		sg.Name = nextId()
		sg.ResetOnSpawn = false
		pcall(function()
			sg.Parent = game:GetService("CoreGui")
		end)
		if not sg.Parent then
			sg.Parent = player:WaitForChild("PlayerGui")
		end
		parent = sg
		self._sg = sg
	end
	self._parent = parent

	local main = Instance.new("Frame")
	main.Name = nextId()
	main.Size = self.size
	main.Position = UDim2.new(0.5, -self.size.X.Offset / 2, 0.5, -self.size.Y.Offset / 2)
	main.BackgroundColor3 = self.theme.Bg
	main.Active = true
	main.Parent = parent
	corner(main, 12)
	stroke(main, self.theme.Accent)
	self.Main = main

	do
		local dragging, start, startPos
		main.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				start = i.Position
				startPos = main.Position
			end
		end)
		main.InputEnded:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)
		UserInputService.InputChanged:Connect(function(i)
			if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
				local d = i.Position - start
				main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
			end
		end)
	end

	local top = Instance.new("Frame")
	top.Name = nextId()
	top.Size = UDim2.new(1, 0, 0, 36)
	top.BackgroundColor3 = self.theme.Panel
	top.Parent = main
	corner(top, 12)

	local title = Instance.new("TextLabel")
	title.Name = nextId()
	title.Size = UDim2.new(1, -90, 1, 0)
	title.Position = UDim2.new(0, 12, 0, 0)
	title.BackgroundTransparency = 1
	title.Text = self.title
	title.TextColor3 = self.theme.Accent
	title.Font = Enum.Font.GothamBold
	title.TextScaled = true
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = top

	local minBtn = Instance.new("TextButton")
	minBtn.Name = nextId()
	minBtn.Size = UDim2.new(0, 28, 0, 28)
	minBtn.Position = UDim2.new(1, -64, 0, 4)
	minBtn.BackgroundColor3 = self.theme.Btn
	minBtn.Text = "—"
	minBtn.TextColor3 = self.theme.Text
	minBtn.Font = Enum.Font.GothamBold
	minBtn.TextScaled = true
	minBtn.Parent = top
	corner(minBtn, 6)

	local closeBtn = Instance.new("TextButton")
	closeBtn.Name = nextId()
	closeBtn.Size = UDim2.new(0, 28, 0, 28)
	closeBtn.Position = UDim2.new(1, -32, 0, 4)
	closeBtn.BackgroundColor3 = self.theme.Bad
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.new(1, 1, 1)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextScaled = true
	closeBtn.Parent = top
	corner(closeBtn, 6)

	local float
	if self.logo then
		float = Instance.new("ImageButton")
		float.Name = nextId()
		float.Size = UDim2.new(0, 52, 0, 52)
		float.Position = UDim2.new(0, 16, 0.4, 0)
		float.BackgroundColor3 = self.theme.Bg
		float.Image = self.logo
		float.Visible = false
		float.Parent = parent
		corner(float, 12)
		stroke(float, self.theme.Accent)
		float.MouseButton1Click:Connect(function()
			main.Visible = true
			float.Visible = false
		end)
	end
	minBtn.MouseButton1Click:Connect(function()
		main.Visible = false
		if float then
			float.Visible = true
		end
	end)
	closeBtn.MouseButton1Click:Connect(function()
		if self.onClose then
			pcall(self.onClose)
		end
		if self._sg then
			self._sg:Destroy()
		else
			main:Destroy()
			if float then
				float:Destroy()
			end
		end
	end)

	self._tabBar = Instance.new("Frame")
	self._tabBar.Name = nextId()
	self._content = Instance.new("Frame")
	self._content.Name = nextId()
	self._content.BackgroundColor3 = self.theme.Panel
	corner(self._content, 8)

	local L = self.layout
	if L == "none" then
		self._tabBar.Visible = false
		self._content.Size = UDim2.new(1, -12, 1, -48)
		self._content.Position = UDim2.new(0, 6, 0, 42)
		self._content.Parent = main
	elseif L == "tabs_horizontal" then
		self._tabBar.Size = UDim2.new(1, -12, 0, 32)
		self._tabBar.Position = UDim2.new(0, 6, 0, 40)
		self._tabBar.BackgroundColor3 = self.theme.Panel
		self._tabBar.Parent = main
		corner(self._tabBar, 6)
		local hl = Instance.new("UIListLayout")
		hl.FillDirection = Enum.FillDirection.Horizontal
		hl.Padding = UDim.new(0, 4)
		hl.Parent = self._tabBar
		self._content.Size = UDim2.new(1, -12, 1, -84)
		self._content.Position = UDim2.new(0, 6, 0, 76)
		self._content.Parent = main
	elseif L == "tabs_right" then
		self._tabBar.Size = UDim2.new(0, 110, 1, -48)
		self._tabBar.Position = UDim2.new(1, -116, 0, 42)
		self._tabBar.BackgroundColor3 = self.theme.Panel
		self._tabBar.Parent = main
		corner(self._tabBar, 8)
		Instance.new("UIListLayout", self._tabBar).Padding = UDim.new(0, 4)
		self._content.Size = UDim2.new(1, -130, 1, -48)
		self._content.Position = UDim2.new(0, 6, 0, 42)
		self._content.Parent = main
	else
		self._tabBar.Size = UDim2.new(0, 110, 1, -48)
		self._tabBar.Position = UDim2.new(0, 6, 0, 42)
		self._tabBar.BackgroundColor3 = self.theme.Panel
		self._tabBar.Parent = main
		corner(self._tabBar, 8)
		Instance.new("UIListLayout", self._tabBar).Padding = UDim.new(0, 4)
		self._content.Size = UDim2.new(1, -130, 1, -48)
		self._content.Position = UDim2.new(0, 122, 0, 42)
		self._content.Parent = main
	end

	return self
end

function GreedyUI:AddTab(name)
	if self.layout == "none" then
		name = name or "Main"
		if not self._pages[name] then
			local sc = Instance.new("ScrollingFrame")
			sc.Name = nextId()
			sc.Size = UDim2.new(1, -10, 1, -10)
			sc.Position = UDim2.new(0, 5, 0, 5)
			sc.BackgroundTransparency = 1
			sc.ScrollBarThickness = 4
			sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
			sc.Parent = self._content
			Instance.new("UIListLayout", sc).Padding = UDim.new(0, 6)
			self._pages[name] = sc
			self._current = name
		end
		return self._pages[name]
	end

	local b = Instance.new("TextButton")
	b.Name = nextId()
	b.Size = (self.layout == "tabs_horizontal" and UDim2.new(0, 90, 1, -4)) or UDim2.new(1, -8, 0, 28)
	b.BackgroundColor3 = self.theme.Btn
	b.Text = name
	b.TextColor3 = self.theme.Text
	b.Font = Enum.Font.GothamSemibold
	b.TextScaled = true
	b.Parent = self._tabBar
	corner(b, 6)

	local sc = Instance.new("ScrollingFrame")
	sc.Name = nextId()
	sc.Size = UDim2.new(1, -10, 1, -10)
	sc.Position = UDim2.new(0, 5, 0, 5)
	sc.BackgroundTransparency = 1
	sc.Visible = false
	sc.ScrollBarThickness = 4
	sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sc.Parent = self._content
	Instance.new("UIListLayout", sc).Padding = UDim.new(0, 6)
	self._pages[name] = sc

	b.MouseButton1Click:Connect(function()
		self:SelectTab(name)
	end)
	if not self._current then
		self:SelectTab(name)
	end
	return sc
end

function GreedyUI:SelectTab(name)
	self._current = name
	for n, p in pairs(self._pages) do
		p.Visible = (n == name)
	end
end

function GreedyUI:Button(tab, text, cb, color)
	local page = typeof(tab) == "string" and self._pages[tab] or tab
	local b = Instance.new("TextButton")
	b.Name = nextId()
	b.Size = UDim2.new(1, 0, 0, 32)
	b.BackgroundColor3 = color or self.theme.Btn
	b.Text = tostring(text or "")
	b.TextColor3 = self.theme.Text
	b.Font = Enum.Font.GothamSemibold
	b.TextScaled = true
	b.AutoButtonColor = true
	b.Parent = page
	corner(b, 6)
	if cb then
		b.MouseButton1Click:Connect(cb)
	end
	return b
end

-- Reliable toggle: holder color + label text (not only TextButton.Text)
function GreedyUI:Toggle(tab, text, default, cb)
	local page = typeof(tab) == "string" and self._pages[tab] or tab
	local state = default and true or false

	local holder = Instance.new("Frame")
	holder.Name = nextId()
	holder.Size = UDim2.new(1, 0, 0, 32)
	holder.BorderSizePixel = 0
	holder.Parent = page
	corner(holder, 6)

	local lbl = Instance.new("TextLabel")
	lbl.Name = nextId()
	lbl.Size = UDim2.new(1, -8, 1, 0)
	lbl.Position = UDim2.new(0, 4, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
	lbl.Font = Enum.Font.GothamBold
	lbl.TextScaled = true
	lbl.ZIndex = 2
	lbl.Parent = holder

	local btn = Instance.new("TextButton")
	btn.Name = nextId()
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.AutoButtonColor = false
	btn.ZIndex = 3
	btn.Parent = holder

	local function paint()
		if state then
			holder.BackgroundColor3 = self.theme.Ok
			lbl.Text = tostring(text) .. "  |  ON"
		else
			holder.BackgroundColor3 = self.theme.Bad
			lbl.Text = tostring(text) .. "  |  OFF"
		end
	end
	paint()

	local lock = false
	local function flip()
		if lock then
			return
		end
		lock = true
		state = not state
		paint()
		if cb then
			pcall(cb, state)
		end
		task.delay(0.12, function()
			lock = false
		end)
	end
	btn.MouseButton1Click:Connect(flip)
	btn.Activated:Connect(flip)

	return {
		Get = function()
			return state
		end,
		Set = function(v)
			state = v and true or false
			paint()
		end,
		Instance = holder,
	}
end

function GreedyUI:Slider(tab, text, min, max, default, cb)
	local page = typeof(tab) == "string" and self._pages[tab] or tab
	local value = default or min
	local holder = Instance.new("Frame")
	holder.Name = nextId()
	holder.Size = UDim2.new(1, 0, 0, 48)
	holder.BackgroundTransparency = 1
	holder.Parent = page

	local lab = Instance.new("TextLabel")
	lab.Name = nextId()
	lab.Size = UDim2.new(1, 0, 0, 18)
	lab.BackgroundTransparency = 1
	lab.Text = text .. ": " .. tostring(value)
	lab.TextColor3 = self.theme.Text
	lab.Font = Enum.Font.Gotham
	lab.TextScaled = true
	lab.TextXAlignment = Enum.TextXAlignment.Left
	lab.Parent = holder

	local bar = Instance.new("Frame")
	bar.Name = nextId()
	bar.Size = UDim2.new(1, 0, 0, 16)
	bar.Position = UDim2.new(0, 0, 0, 24)
	bar.BackgroundColor3 = self.theme.Btn
	bar.Parent = holder
	corner(bar, 6)

	local fill = Instance.new("Frame")
	fill.Name = nextId()
	fill.Size = UDim2.new((value - min) / math.max(max - min, 1), 0, 1, 0)
	fill.BackgroundColor3 = self.theme.Accent
	fill.Parent = bar
	corner(fill, 6)

	local sliding = false
	local function setFromX(x)
		local rel = math.clamp((x - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1), 0, 1)
		value = math.floor(min + (max - min) * rel + 0.5)
		fill.Size = UDim2.new(rel, 0, 1, 0)
		lab.Text = text .. ": " .. tostring(value)
		if cb then
			cb(value)
		end
	end
	bar.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			sliding = true
			setFromX(i.Position.X)
		end
	end)
	UserInputService.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			sliding = false
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if sliding and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			setFromX(i.Position.X)
		end
	end)
	return function()
		return value
	end
end

function GreedyUI:Info(tab, text)
	local page = typeof(tab) == "string" and self._pages[tab] or tab
	local l = Instance.new("TextLabel")
	l.Name = nextId()
	l.Size = UDim2.new(1, 0, 0, 22)
	l.BackgroundTransparency = 1
	l.Text = tostring(text or "")
	l.TextColor3 = self.theme.Muted
	l.Font = Enum.Font.Gotham
	l.TextScaled = true
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.TextWrapped = true
	l.Parent = page
	return l
end

function GreedyUI:Image(tab, imageId, height)
	local page = typeof(tab) == "string" and self._pages[tab] or tab
	local img = Instance.new("ImageLabel")
	img.Name = nextId()
	img.Size = UDim2.new(1, 0, 0, height or 80)
	img.BackgroundColor3 = self.theme.Bg
	img.Image = imageId
	img.ScaleType = Enum.ScaleType.Crop
	img.Parent = page
	corner(img, 8)
	return img
end

function GreedyUI:SetSize(udim)
	self.Main.Size = udim
end

function GreedyUI:Destroy()
	if self.onClose then
		pcall(self.onClose)
	end
	if self._sg then
		self._sg:Destroy()
	elseif self.Main then
		self.Main:Destroy()
	end
end

return GreedyUI
