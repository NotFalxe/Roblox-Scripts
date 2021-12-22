--[[
~~ Credits ~~
CXZ NAME_R : My Youtube channle
LocalPlayer#7434 : Script owner
Zyrex#5956 : Script helper
]]

--(Press ';' to enter commands bar)
--(Say ':cmds' then say '/console' to view commands)
-- Settings:

connections = {}
Crash = true -- If your gui is crashing your game try make this to true maybe it's will help
DeleteDoors = true -- Delete all doors and Cells door
EspChamber = false -- Show ESP chamber
EspName = false -- Show ESP player name
EspItem = false -- Esp dropped items (Glitchy)
ShowNotification = true -- Show notifycation when you executes commands
ShowSpawnPads = true -- Show a spawns pad
MaxChatLogsSaves = 33 -- Max chats will save when someone chat
SaveYourMessageToChatLogs = true -- When you chat it's will save message that you say to chat logs
AutoRespawnOnDie = true -- Auto respawn when you died
AutoGunWhenRepspawn = true -- Auto respawn when you respawned
AutoBToolsWhenRespawn = true -- Auto BTools when respawned
AutoModTheGunInYourBackpackWhenRespawn = true -- Auto mod the when you respawned
AntiFling = true -- When someone is using fling you can prevent get fling by change this to true
AntiCriminal = true -- You cannot become a criminal but this will protect you from spam arresters
AntiArrest = true -- When you got arrested you will turn into Neutral and you will tp to Prison nexus
DeleteCriminalPads = true -- You are not able to become a criminal but if someone have a advance crim script you can become a crimnal
AntiCrash = true -- You won't crasg when someone is crashing server
AntiArmorSpam = true -- When someone rage and spam armor you won't lag anymore
AntiBring = false -- You won't get bring by another exploiters This will help you from being Void you cannot use this with another scripts
MaxAntiBringDistance = 9 -- 1 = 1 stud , If you get bring farther than max anti bring distance(studs) you will tp back
FastPunch = true -- Fast punch mode
AntiTaser = true -- Taser bypass mode
InfStamina = false -- No function
AntiTeamChange = true -- When you died if your team changed When you respawn you will become old team
AnimatedGui = true -- Animated the gui when you open the gui
GuiAnimatedSpeed = 0.5 -- Gui animation when you open the gui
GuiClosePosition = UDim2.new(0.45, 0, 2, 0) -- Gui position when you close
GuiOpenPosition = UDim2.new(0.45, 0, 0.85, 0) -- Gui position when you open

if reScript then
	reScript()
end

-- Guis:

local ADMINGUI = Instance.new("ScreenGui")
local INPUT_BACKGROUND = Instance.new("Frame")
local ICON_1 = Instance.new("TextLabel")
local INPUT_HANDLER = Instance.new("TextLabel")
local INPUT = Instance.new("TextBox")
local NOTIFY_HANDLER = Instance.new("Frame")
local NOTIFY_GUI = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local NOTIFYLABEL = Instance.new("TextLabel")
local NOTIFYTEXT = Instance.new("TextLabel")
local UILISTLAYOUT = Instance.new("UIListLayout")

ADMINGUI.Name = "AdminGui"
if not Crash then
	ADMINGUI.Parent = game:GetService("CoreGui")
else
	ADMINGUI.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end
ADMINGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

INPUT_BACKGROUND.Name = "INPUT_BACKGROUND"
INPUT_BACKGROUND.Parent = ADMINGUI
INPUT_BACKGROUND.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
INPUT_BACKGROUND.BackgroundTransparency = 0.500
INPUT_BACKGROUND.BorderSizePixel = 0
INPUT_BACKGROUND.Position = UDim2.new(0.373991966, 0, 0.883138597, 0)
INPUT_BACKGROUND.Size = UDim2.new(0, 250, 0, 40)

ICON_1.Name = "ICON_1"
ICON_1.Parent = INPUT_BACKGROUND
ICON_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ICON_1.BackgroundTransparency = 1.000
ICON_1.BorderSizePixel = 0
ICON_1.Position = UDim2.new(-0.00214279164, 0, 0, 0)
ICON_1.Size = UDim2.new(0, 30, 1, 0)
ICON_1.Font = Enum.Font.SourceSans
ICON_1.Text = ">"
ICON_1.TextColor3 = Color3.fromRGB(255, 255, 255)
ICON_1.TextScaled = true
ICON_1.TextSize = 14.000
ICON_1.TextWrapped = true

INPUT_HANDLER.Name = "INPUT_HANDLER"
INPUT_HANDLER.Parent = INPUT_BACKGROUND
INPUT_HANDLER.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
INPUT_HANDLER.BackgroundTransparency = 1.000
INPUT_HANDLER.BorderSizePixel = 0
INPUT_HANDLER.Position = UDim2.new(0.118000001, 0, 0, 0)
INPUT_HANDLER.Size = UDim2.new(0.882000029, 0, 1, 0)
INPUT_HANDLER.ZIndex = 0
INPUT_HANDLER.Font = Enum.Font.SourceSans
INPUT_HANDLER.Text = ""
INPUT_HANDLER.TextColor3 = Color3.fromRGB(155, 155, 155)
INPUT_HANDLER.TextSize = 18.000
INPUT_HANDLER.TextXAlignment = Enum.TextXAlignment.Left

INPUT.Name = "INPUT"
INPUT.Parent = INPUT_HANDLER
INPUT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
INPUT.BackgroundTransparency = 1.000
INPUT.BorderSizePixel = 0
INPUT.Size = UDim2.new(1, 0, 1, 0)
INPUT.Font = Enum.Font.SourceSans
INPUT.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
INPUT.Text = ""
INPUT.TextColor3 = Color3.fromRGB(255, 255, 255)
INPUT.TextSize = 18.000
INPUT.TextWrapped = true
INPUT.TextXAlignment = Enum.TextXAlignment.Left

NOTIFY_HANDLER.Name = "NOTIFY_HANDLER"
NOTIFY_HANDLER.Parent = ADMINGUI
NOTIFY_HANDLER.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NOTIFY_HANDLER.BackgroundTransparency = 1.000
NOTIFY_HANDLER.BorderSizePixel = 0
NOTIFY_HANDLER.Position = UDim2.new(0.00806451589, 0, 0.320534229, 0)
NOTIFY_HANDLER.Size = UDim2.new(0, 200, 0, 400)

NOTIFY_GUI.Name = "NOTIFY_GUI"
NOTIFY_GUI.Parent = nil
NOTIFY_GUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NOTIFY_GUI.BackgroundTransparency = 0.500
NOTIFY_GUI.BorderSizePixel = 0
NOTIFY_GUI.Size = UDim2.new(1, 0, 0, 75)

UICorner.Parent = NOTIFY_GUI

NOTIFYLABEL.Name = "NOTIFYLABEL"
NOTIFYLABEL.Parent = NOTIFY_GUI
NOTIFYLABEL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NOTIFYLABEL.BackgroundTransparency = 1.000
NOTIFYLABEL.BorderSizePixel = 0
NOTIFYLABEL.Size = UDim2.new(1, 0, 0, 20)
NOTIFYLABEL.Font = Enum.Font.GothamBlack
NOTIFYLABEL.Text = "Success"
NOTIFYLABEL.TextColor3 = Color3.fromRGB(0, 255, 0)
NOTIFYLABEL.TextScaled = true
NOTIFYLABEL.TextSize = 14.000
NOTIFYLABEL.TextWrapped = true

NOTIFYTEXT.Name = "NOTIFYTEXT"
NOTIFYTEXT.Parent = NOTIFY_GUI
NOTIFYTEXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NOTIFYTEXT.BackgroundTransparency = 1.000
NOTIFYTEXT.BorderSizePixel = 0
NOTIFYTEXT.Position = UDim2.new(0, 0, 0, 20)
NOTIFYTEXT.Size = UDim2.new(1, 0, 0, 55)
NOTIFYTEXT.Font = Enum.Font.GothamBlack
NOTIFYTEXT.Text = ""
NOTIFYTEXT.TextColor3 = Color3.fromRGB(255, 255, 255)
NOTIFYTEXT.TextSize = 18.000
NOTIFYTEXT.TextWrapped = true
NOTIFYTEXT.TextYAlignment = Enum.TextYAlignment.Top

UILISTLAYOUT.Name = "UILISTLAYOUT"
UILISTLAYOUT.Parent = NOTIFY_HANDLER
UILISTLAYOUT.Padding = UDim.new(0, 3)
UILISTLAYOUT.VerticalAlignment  = Enum.VerticalAlignment.Bottom
UILISTLAYOUT.SortOrder = Enum.SortOrder.LayoutOrder

local cmds = {
	"me = you, player name = another player",
	"cmds -- show commands",
	"kill [player,all,inmate,guard,criminal] -- kill player",
	"ded -- loop kill all",
	"lb [player] -- loop bring player",
	"unded -- unloop kill all",
	"sa [player] -- spam arrest player",
	"ka [player] -- kill aura player",
	"lk [player] -- loop kill player",
	"unlk [player] -- unloop kill player",
	"goto [player] -- bring player",
	"bring [player,all,guard,criminal,inmate] -- bring player",
	"crim [player,all,inmate,guard] -- crim player",
	"tase [player] -- tase player",
	"taze -- tase all",
	"void [player,all,guard,inmate,criminal] -- void player",
	"crash -- crash server",
	"arrest [player,all,inmate,criminal] [time] -- arrest player",
	"rank [player,all,guard,inmate,criminal] -- admin player",
	"unrank [player,all,guard,inmate,criminal] -- unadmin player",
	"base [player] -- tp player to criminal base",
	"yard [player] -- tp player to yard",
	"nexus [player] -- tp player to nexus",
	"color (r/g/b) -- change team color",
	"stuck -- stuck you into the neutral spawn",
	"unstuck -- unstuck you into the neutral spawn",
	"view [player] -- view player",
	"unview [player] -- unview player",
	"disconnect -- disconnected server",
	"rj -- rejoin server",
	"team [inmate,guard,neutral,brickcolor]",
	"re -- re",
	"res -- respawn",
	"key [player,all,inmate,criminal] -- give key card",
	"cuffs [player,all,inmate,criminal] -- give hand cuffs",
	"chatlog -- view chat logs",
	"timeout -- time out server",
}

local TWEENSERVICE = game:GetService("TweenService")

function OpenInput()
	if AnimatedGui then
		local TWEENINFO = TweenInfo.new(
			GuiAnimatedSpeed, 
			Enum.EasingStyle.Linear, 
			Enum.EasingDirection.In, 
			0,
			false,
			0
		)
		local MAKECHANGES = {
			Position = GuiOpenPosition
		}
		local TWEENING = TWEENSERVICE:Create(INPUT_BACKGROUND, TWEENINFO, MAKECHANGES)
		TWEENING:Play()
	else
		INPUT_BACKGROUND.Position = GuiOpenPosition
	end
end

function CloseInput()
	if AnimatedGui then
		local TWEENINFO = TweenInfo.new(
			GuiAnimatedSpeed, 
			Enum.EasingStyle.Linear, 
			Enum.EasingDirection.In, 
			0,
			false,
			0
		)
		local MAKECHANGES = {
			Position = GuiClosePosition
		}
		local TWEENING = TWEENSERVICE:Create(INPUT_BACKGROUND, TWEENINFO, MAKECHANGES)
		TWEENING:Play()
	else
		INPUT_BACKGROUND.Position = GuiClosePosition
	end
end

function SendNotification(msg, typeofmsg, color)
	if ShowNotification then
		local clr = color or Color3.fromRGB(255, 255, 255)
		local clone = NOTIFY_GUI:Clone()
		clone.NOTIFYLABEL.Text = typeofmsg
		clone.NOTIFYTEXT.Text = msg
		clone.Parent = NOTIFY_HANDLER
		coroutine.wrap(function()
			wait(1)
			for i = 0,1,0.05 do
				wait(.05)
				if i > 0.5 then
					clone.BackgroundTransparency = i
					clone.NOTIFYTEXT.TextTransparency = i
					clone.NOTIFYLABEL.TextTransparency = i
				end
			end
			clone:Destroy()
		end)()
	end
end

CloseInput()

local prefix = ":"
local antiTouch = {}

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
	if prefix == ":" then
		prefix = ":" and ";"
	elseif prefix == "?" then
		prefix = "?" and "/"
	elseif prefix == ">" then
		prefix =  ">" and "."
	elseif prefix == "<" then
		prefix = "<" and ","
	else
		prefix = prefix and prefix:lower() and prefix:upper()
	end
	if key == prefix then
		OpenInput()
		wait()
		INPUT:CaptureFocus()
	end
end)

function GETPLR(STRING)
	if not STRING then return end
	if STRING == "me" then
		return game.Players.LocalPlayer
	else
		local MATCH = {}
		for _,plr in pairs(game.Players:GetPlayers()) do
			if string.lower(plr.Name):match(string.lower(STRING)) then
				table.insert(MATCH, plr.Name)
			end
			if string.lower(plr.DisplayName):match(string.lower(STRING)) then
				table.insert(MATCH, plr.DisplayName)
			end
		end
		if #MATCH > 0 then
			return MATCH[math.random(1, #MATCH)]
		elseif #MATCH < 1 then
			return nil
		end
	end
end

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Tab then
		if INPUT_HANDLER.Text ~= "" then
			INPUT.Text = INPUT_HANDLER.Text
		end
	end
end)

INPUT.Changed:Connect(function(change)
	if change == "Text" then
		if INPUT.Text ~= "" then
			for i,v in pairs(cmds) do
				if string.lower(v:split(" ")[1]):match(string.lower(INPUT.Text:split(" ")[1])) and not INPUT.Text:split(" ")[2] then
					INPUT_HANDLER.Text = v:split(" ")[1]
				end
			end
			if INPUT.Text:split(" ")[2] and not INPUT.Text:split(" ")[3] then
				if string.lower("all"):match(string.lower(INPUT.Text:split(" ")[2])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." all"
				elseif string.lower("me"):match(string.lower(INPUT.Text:split(" ")[2])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." me"
				elseif string.lower("inmates"):match(string.lower(INPUT.Text:split(" ")[2])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." inmates"
				elseif string.lower("guards"):match(string.lower(INPUT.Text:split(" ")[2])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." guards"
				elseif string.lower("criminals"):match(string.lower(INPUT.Text:split(" ")[2])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." criminals"
				else
					local PLAYER = GETPLR(INPUT.Text:split(" ")[2])
					if PLAYER ~= nil then
						INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..PLAYER:lower()
					end
				end
			end
			if INPUT.Text:split(" ")[3] then
				if string.lower("all"):match(string.lower(INPUT.Text:split(" ")[3])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..INPUT.Text:split(" ")[2].." all"
				elseif string.lower("inmates"):match(string.lower(INPUT.Text:split(" ")[3])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..INPUT.Text:split(" ")[2].." inmates"
				elseif string.lower("guards"):match(string.lower(INPUT.Text:split(" ")[3])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..INPUT.Text:split(" ")[2].." guards"
				elseif string.lower("criminals"):match(string.lower(INPUT.Text:split(" ")[3])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..INPUT.Text:split(" ")[2].." criminals"
				elseif string.lower("me"):match(string.lower(INPUT.Text:split(" ")[3])) then
					INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..INPUT.Text:split(" ")[2].." me"
				else
					local PLAYER = GETPLR(INPUT.Text:split(" ")[3])
					if PLAYER ~= nil then
						INPUT_HANDLER.Text = INPUT.Text:split(" ")[1].." "..INPUT.Text:split(" ")[2].." "..PLAYER
					end
				end
			end
		else
			INPUT_HANDLER.Text = ""
		end
	end
end)

-- Scripts:

local players = game:GetService("Players")
local run = game:GetService("RunService")
local localplayer = players.LocalPlayer
local character = localplayer.Character
local humroot = character:FindFirstChild("HumanoidRootPart")
local backpack = localplayer.Backpack
local replicatedstorage = game:GetService("ReplicatedStorage")
local humanoid = character:FindFirstChild("Humanoid")

local usingcmd = false

local prefix = ":"
local states = {}
local loopkill = {}
local killaura = {}
local admins = {}

localplayer.CharacterAdded:Connect(function(char)
	character = game.Players.LocalPlayer.Character
	backpack = localplayer:WaitForChild("Backpack", 0.3)
	humanoid = char:WaitForChild("Humanoid", 0.3)
	char:WaitForChild("Humanoid", 0.3).Died:Connect(function()
		if AutoRespawnOnDie then
			pcall(function()
				if game.Players.LocalPlayer.TeamColor.Name ~= "Medium stone grey" then
					savepos()
					loadchar()
					wait(.1)
					loadpos()
				else
					teamevent("Bright orange")
					savepos()
					loadchar()
					wait(.1)
					loadpos()
					teamevent("Medium stone grey")
				end
			end)
		end
	end)
	humroot = char:WaitForChild("HumanoidRootPart", 0.3)
end)

function getplr(str, plr)
	if not str then return end
	local yes = {}
	if str == "me" then
		return plr
	else
		for _,plrs in ipairs(players:GetPlayers()) do
			if string.lower(plrs.Name):match(string.lower(str)) or string.lower(plrs.DisplayName):match(string.lower(str)) then
				table.insert(yes, plrs)
			end
		end
	end
	if #yes > 0 then
		return yes[1]
	elseif #yes < 1 then
		return nil
	end
end

function getpos()
	local x,y,z = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame:ToOrientation()
	return CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z) * CFrame.fromOrientation(0, y, 0)
end

local HumanoidRootPartLastCFrame = getpos()
local CurrentCameraLastCFrame = game:GetService("Workspace").CurrentCamera.CFrame

function savepos()
	CurrentCameraLastCFrame = game:GetService("Workspace").CurrentCamera.CFrame
	HumanoidRootPartLastCFrame = getpos()
end

function loadpos()
	humroot.CFrame = HumanoidRootPartLastCFrame
	for i = 1,2 do
		wait()
		game:GetService("Workspace").CurrentCamera.CFrame = CurrentCameraLastCFrame
	end
end

function loadchar(color)
	local color = color or nil
	workspace.Remote.loadchar:InvokeServer(nil, color)
end

function fegod()
	local CHAR = game.Players.LocalPlayer.Character
	CHAR.Humanoid.Name = "1"
	local c = CHAR["1"]:Clone()
	c.Name = "Humanoid"
	c.Parent = CHAR
	CHAR["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = CHAR
	CHAR.Animate.Disabled = true
	wait()
	CHAR.Animate.Disabled = false
	CHAR.Humanoid.DisplayDistanceType = "None"
end

function beam(plr, time, distance, size)
	if plr ~= nil then
		local time = tonumber(time) or 1
		local distance = tonumber(distance) or math.huge
		if plr and time and distance then
			workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("Remington 870"):FindFirstChild("ITEMPICKUP"))
			local events = {}
			local size = tonumber(size) or 100
			for i = 1,size do
				events[#events + 1] = {
					Hit = plr.Character:FindFirstChildOfClass("Part"),
					Distance = distance,
					Cframe = plr.Character:FindFirstChildOfClass("Part").CFrame * CFrame.Angles(math.rad(i), 0, 0),
					RayObject = Ray.new(Vector3.new(), Vector3.new())
				}
			end
			local gun
			for i,v in pairs(backpack:GetChildren()) do
				if gun == nil and v:FindFirstChild("GunStates") then
					gun = v
				end
			end
			if gun == nil then
				for i,v in pairs(character:GetChildren()) do
					if gun == nil and v:FindFirstChild("GunStates") then
						gun = v
					end
				end
			end
			game:GetService("ReplicatedStorage"):WaitForChild("ShootEvent"):FireServer(events, gun)
			gun.Parent = character
			character:FindFirstChild(gun.Name):Destroy()
		end
	end
end

function tp(plr, pos)
	pcall(function()
		if plr == localplayer then
			humroot.CFrame = pos
		else
			local isantifling = false
			if AntiFling then
				AntiFling = false
				isantifling = true
			end
			local lastpos = getpos()
			loadchar()
			local CHAR = game.Players.LocalPlayer.Character
			CHAR.Humanoid.Name = "1"
			local c = CHAR["1"]:Clone()
			c.Name = "Humanoid"
			c.Parent = CHAR
			CHAR["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = CHAR
			local Animate = CHAR:FindFirstChild("Animate")
			if Animate then
				Animate.Disabled = true
				wait()
				Animate.Disabled = false
			end
			CHAR.Humanoid.DisplayDistanceType = "None"
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
			if not game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") and not game.Players.LocalPlayer.Character:FindFirstChild("Hammer") then
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
			end
			local tool = game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") or game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9")
			local canHave = Instance.new("BoolValue", tool)
			canHave.Value = true
			canHave.Name = "CanHave"
			tool.Parent = character
			humroot.Anchored = true
			local stop = 0
			repeat wait(.1)
				pcall(function()
					stop = stop + 1
					humroot.CFrame = pos
					plr.Character.HumanoidRootPart.CFrame = humroot.CFrame * CFrame.new(0, 0, -0.5)
				end)
			until not character:FindFirstChildOfClass("Tool") or not localplayer.Character or not localplayer.Character.HumanoidRootPart or not game.Players:FindFirstChild(plr.Name) or stop > 500
			humroot.Anchored = false
			wait(.2)
			loadchar()
			wait(.1)
			for i = 1,3 do
				wait()
				usingcmd = true
				game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = lastpos
			end
			if isantifling then
				AntiFling = true
			end
		end
	end)
end

game.Players.LocalPlayer.CharacterAdded:connect(function(char)
	wait(.2)
	char.ChildAdded:connect(function(child)
		if not child:IsA("HopperBin") and not child:FindFirstChild("CanHave") and not child:IsA("Humanoid") and not child:IsA("BasePart") and not child:IsA("Accessory") and not child:IsA("Shirt") and not child:IsA("Pants") then
			child.Parent = backpack
			child:Destroy()
			wait()
			child:Destroy()
		end
	end)
end)

function void(plr)
	pcall(function()
		if plr == localplayer then
			humroot.CFrame = CFrame.new(99999999999999, 99999999999999, 99999999999999)
		else
			local isantifling = false
			if AntiFling then
				AntiFling = false
				isantifling = true
			end
			local lastpos = getpos()
			loadchar()
			local CHAR = game.Players.LocalPlayer.Character
			CHAR.Humanoid.Name = "1"
			local c = CHAR["1"]:Clone()
			c.Name = "Humanoid"
			c.Parent = CHAR
			CHAR["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = CHAR
			local Animate = CHAR:FindFirstChild("Animate")
			if Animate then
				Animate.Disabled = true
				wait()
				Animate.Disabled = false
			end
			CHAR.Humanoid.DisplayDistanceType = "None"
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
			if not game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") and not game.Players.LocalPlayer.Character:FindFirstChild("Hammer") then
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
			end
			local tool = game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") or game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9")
			local canHave = Instance.new("BoolValue", tool)
			canHave.Value = true
			canHave.Name = "CanHave"
			tool.Parent = character
			humroot.Anchored = true
			local stop = 0
			repeat wait(.1)
				pcall(function()
					stop = stop + 1
					plr.Character.HumanoidRootPart.CFrame = humroot.CFrame * CFrame.new(0, 0, -0.5)
				end)
			until not character:FindFirstChildOfClass("Tool") or not localplayer.Character or not localplayer.Character.HumanoidRootPart or not game.Players:FindFirstChild(plr.Name) or stop > 500
			humroot.Anchored = false
			for i = 1,10 do
				wait()
				usingcmd = true
				humroot.CFrame = CFrame.new(99999999999999, 99999999999999, 99999999999999)
			end
			wait(.2)
			loadchar()
			wait(.1)
			for i = 1,3 do
				wait()
				usingcmd = true
				game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = lastpos
			end
			if isantifling then
				AntiFling = true
			end
		end
	end)
end

local NOW = humroot.CFrame

game:GetService("RunService").Stepped:Connect(function()
	if states.loopbring then
		humroot.CFrame = NOW
	end
end)

function doloop()
	savepos()
	repeat wait()
	until not states.loopbring
	usingcmd = true
	loadpos()
end

function tpV(plr, plr2)
	pcall(function()
		if plr == localplayer then
			humroot.CFrame = plr2.Character.HumanoidRootPart.CFrame
		else
			local isantifling = false
			if AntiFling then
				AntiFling = false
				isantifling = true
			end
			local lastpos = getpos()
			loadchar()
			local CHAR = game.Players.LocalPlayer.Character
			CHAR.Humanoid.Name = "1"
			local c = CHAR["1"]:Clone()
			c.Name = "Humanoid"
			c.Parent = CHAR
			CHAR["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = CHAR
			local Animate = CHAR:FindFirstChild("Animate")
			if Animate then
				Animate.Disabled = true
				wait()
				Animate.Disabled = false
			end
			CHAR.Humanoid.DisplayDistanceType = "None"
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
			if not game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") and not game.Players.LocalPlayer.Character:FindFirstChild("Hammer") then
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
			end
			local tool = game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") or game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9")
			local canHave = Instance.new("BoolValue", tool)
			canHave.Value = true
			canHave.Name = "CanHave"
			tool.Parent = character
			humroot.Anchored = true
			local stop = 0
			repeat wait(.1) 
				pcall(function()
					stop = stop + 1
					humroot.CFrame = plr2.Character.HumanoidRootPart.CFrame
					plr.Character.HumanoidRootPart.CFrame = humroot.CFrame * CFrame.new(0, 0, -0.5)
				end)
			until not character:FindFirstChildOfClass("Tool") or not localplayer.Character or not localplayer.Character.HumanoidRootPart or not game.Players:FindFirstChild(plr.Name) or stop > 500
			humroot.Anchored = false
			wait(.2)
			loadchar()
			wait(.1)
			for i = 1,3 do
				wait()
				usingcmd = true
				game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = lastpos
			end
			if isantifling then
				AntiFling = true
			end
		end
	end)
end

function kill(plr)
	if plr == localplayer then
		if not character:FindFirstChild("Force Field") then
			character.Humanoid.Health = 0
		end
	else
		if plr.TeamColor.Name == localplayer.TeamColor.Name then
			loadchar(BrickColor.random().Name)
		end
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		local gun = backpack:FindFirstChild("Remington 870") or character:FindFirstChild("Remington 870")
		local events = {}
		for i = 1,15 do
			events[#events + 1] = {
				Hit = plr.Character:FindFirstChildOfClass("Part"),
				Cframe = CFrame.new(),
				Distance = 0,
				RayObject = Ray.new(Vector3.new(), Vector3.new())
			}
		end
		coroutine.wrap(function()
			for i = 1,30 do
				replicatedstorage.ReloadEvent:FireServer(gun)
				wait(.3)
			end
		end)()
		replicatedstorage.ShootEvent:FireServer(events, gun)
	end
end

function killteam(brickcolor, whitelist)
	if not brickcolor then return end
	local events = {}
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
	for _,plrs in pairs(players:GetPlayers()) do
		if plrs.TeamColor.Name == brickcolor and plrs ~= localplayer and plrs ~= whitelist then
			if plrs.TeamColor.Name == localplayer.TeamColor.Name then
				savepos()
				loadchar(BrickColor.random().Name)
				wait(.1)
				loadpos()
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			end
			for i = 1,15 do
				events[#events + 1] = {
					Hit = plrs.Character:FindFirstChildOfClass("Part"),
					Cframe = CFrame.new(),
					Distance = 0,
					RayObject = Ray.new(Vector3.new(), Vector3.new())
				}
			end
		end
	end
	local gun = backpack:FindFirstChild("Remington 870") or character:FindFirstChild("Remington 870")
	coroutine.wrap(function()
		for i = 1,30 do
			replicatedstorage.ReloadEvent:FireServer(gun)
			wait(.3)
		end
	end)()
	replicatedstorage.ShootEvent:FireServer(events, gun)
end

function killall(whitelist)
	local events = {}
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
	for _,plrs in pairs(players:GetPlayers()) do
		if plrs ~= localplayer and plrs ~= whitelist then
			if plrs.TeamColor.Name == localplayer.TeamColor.Name then
				savepos()
				loadchar(BrickColor.random().Name)
				wait(.1)
				loadpos()
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			end
			for i = 1,15 do
				events[#events + 1] = {
					Hit = plrs.Character:FindFirstChildOfClass("Part"),
					Cframe = CFrame.new(),
					Distance = 0,
					RayObject = Ray.new(Vector3.new(), Vector3.new())
				}
			end
		end
	end
	local gun = backpack:FindFirstChild("Remington 870") or character:FindFirstChild("Remington 870")
	coroutine.wrap(function()
		for i = 1,30 do
			replicatedstorage.ReloadEvent:FireServer(gun)
			wait(.3)
		end
	end)()
	replicatedstorage.ShootEvent:FireServer(events, gun)
end

function crim(plr)
	pcall(function()
		if plr == nil and game.Players:FindFirstChild(plr.Name) or plr.TeamColor.Name == "Really red" then return end
		if plr ~= localplayer then
			local isantifling = false
			if AntiFling then
				AntiFling = false
				isantifling = true
			end
			local pad = game:GetService("Lighting"):FindFirstChild("SpawnLocation")
			pad.Parent = game:GetService("Workspace")
			local padCFrame = pad.CFrame
			savepos()
			character:WaitForChild("Humanoid").Sit = false
			local CHAR = game.Players.LocalPlayer.Character
			CHAR.Humanoid.Name = "1"
			local c = CHAR["1"]:Clone()
			c.Name = "Humanoid"
			c.Parent = CHAR
			CHAR["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = CHAR
			local Animate = CHAR:FindFirstChild("Animate")
			if Animate then
				Animate.Disabled = true
				wait()
				Animate.Disabled = false
			end
			CHAR.Humanoid.DisplayDistanceType = "None"
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
			if not game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") and not game.Players.LocalPlayer.Character:FindFirstChild("Hammer") then
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
			end
			local tool = game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") or game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9")
			local canHave = Instance.new("BoolValue", tool)
			canHave.Value = true
			canHave.Name = "CanHave"
			tool.Parent = character
			humroot.Anchored = true
			local oldteam = localplayer.TeamColor.Name
			local stop = 0
			pad.CanCollide = false
			pad.Transparency = 1.000
			repeat wait(.1)
				pcall(function()
					stop = stop + 1
					pad.Anchored = false
					pad.CFrame = humroot.CFrame
					pad.Anchored = true
					teamevent("Bright orange")
					plr.Character.HumanoidRootPart.CFrame = humroot.CFrame * CFrame.new(0, 0, -0.75)
				end)
			until not character:FindFirstChildOfClass("Tool") or not localplayer.Character or not localplayer.Character.HumanoidRootPart or not game.Players:FindFirstChild(plr.Name) or stop > 500
			humroot.Anchored = false
			pad.Anchored = true
			pad.Transparency = 0.000
			wait(.2)
			teamevent("Bright orange")
			if oldteam ~= "Medium stone grey" then
				loadchar(BrickColor.new(oldteam).Name)
			else
				loadchar(BrickColor.new("Bright orange").Name)
			end
			wait(.1)
			usingcmd = true
			loadpos()
			pad.Parent = game:GetService("Lighting")
			if isantifling then
				AntiFling = true
			end
		end
	end)
end

function tase(plr)
	local events = {}
	savepos()
	local oldteam = localplayer.TeamColor.Name
	if not character:FindFirstChild("Taser") and not backpack:FindFirstChild("Taser") then
		oldteam = localplayer.TeamColor.Name
		loadchar(BrickColor.new("Bright blue").Name)
		loadpos()
	end
	for i = 1,1 do
		events[#events + 1] = {
			Hit = plr.Character:FindFirstChildOfClass("Part"),
			Cframe = CFrame.new(),
			Distance = 0,
			RayObject = Ray.new(Vector3.new(), Vector3.new())
		}
	end
	local gun = backpack:FindFirstChild("Taser") or character:FindFirstChild("Taser")
	coroutine.wrap(function()
		for i = 1,30 do
			replicatedstorage.ReloadEvent:FireServer(gun)
			wait(.3)
		end
	end)()
	replicatedstorage.ShootEvent:FireServer(events, gun)
	if localplayer.TeamColor.Name ~= oldteam then
		loadchar(BrickColor.new(oldteam).Name)
	end
	loadpos()
end

function taseall(whitelist)
	local events = {}
	savepos()
	local oldteam = localplayer.TeamColor.Name
	if not character:FindFirstChild("Taser") and not backpack:FindFirstChild("Taser") then
		oldteam = localplayer.TeamColor.Name
		loadchar(BrickColor.new("Bright blue").Name)
		loadpos()
	end
	for _,plrs in pairs(players:GetPlayers()) do
		if plrs ~= localplayer and plrs ~= whitelist then
			for i = 1,1 do
				events[#events + 1] = {
					Hit = plrs.Character:FindFirstChildOfClass("Part"),
					Cframe = CFrame.new(),
					Distance = 0,
					RayObject = Ray.new(Vector3.new(), Vector3.new())
				}
			end
		end
	end
	local gun = backpack:FindFirstChild("Taser") or character:FindFirstChild("Taser")
	coroutine.wrap(function()
		for i = 1,30 do
			replicatedstorage.ReloadEvent:FireServer(gun)
			wait(.3)
		end
	end)()
	replicatedstorage.ShootEvent:FireServer(events, gun)
	if localplayer.TeamColor.Name ~= oldteam then
		loadchar(BrickColor.new(oldteam).Name)
	end
	loadpos()
end

function arrest(plr, times)
	savepos()
	local times = tonumber(times) or 1
	local stop = 0
	repeat wait()
		stop = stop + 1
		character.Humanoid.Sit = false
		usingcmd = true
		humroot.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.75)
		for i = 1,times do
			coroutine.wrap(function()
				workspace.Remote.arrest:InvokeServer(plr.Character.Head)
			end)()
		end
	until (plr.Character.Head:FindFirstChild("handcuffedGui") or stop > 100)
	character.Humanoid.Sit = false
	loadchar()
	usingcmd = true
	loadpos()
end

function bypassbring(plr)
	savepos()
	loadchar()
	local CHAR = game.Players.LocalPlayer.Character
	CHAR.Humanoid.Name = "1"
	local c = CHAR["1"]:Clone()
	c.Name = "Humanoid"
	c.Parent = CHAR
	CHAR["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = CHAR
	CHAR.Animate.Disabled = true
	wait()
	CHAR.Animate.Disabled = false
	CHAR.Humanoid.DisplayDistanceType = "None"
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
	if not game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") then
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
	end
	local tool = game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") or game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9")
	tool.Parent = character
	humroot.Anchored = true
	local stop = 0
	repeat wait(.1)
		pcall(function()
			stop = stop + 1
			plr.Character.HumanoidRootPart.CFrame = humroot.CFrame * CFrame.new(0, 0, -0.75)
		end)
	until not character:FindFirstChildOfClass("Tool") or not localplayer.Character or not localplayer.Character.HumanoidRootPart or not game.Players:FindFirstChild(plr.Name) or stop > 500
	humroot.Anchored = false
	game.Players.LocalPlayer.CharacterRemoving:Wait()
	loadchar()
	usingcmd = true
	loadpos()
end

function arrestevent(plr, times)
	local times = tonumber(times) or 1
	for i = 1,times do
		wait()
		pcall(function()
			workspace.Remote.arrest:InvokeServer(plr.Character.Head)
		end)
	end
end

function key(plr)
	local success, errorm = pcall(function()
		local MyPos = getpos()
		local oldteam
		if not backpack:FindFirstChild("Key card") and not character:FindFirstChild("Key card") then
			oldteam = localplayer.TeamColor.Name
			repeat wait(.2)
				character:WaitForChild("Humanoid").Health = 0
				usingcmd = true
				loadchar(BrickColor.new("Bright blue").Name)
			until workspace.Prison_ITEMS.single:FindFirstChild("Key card")
			loadchar(BrickColor.new(oldteam).Name)
			workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(workspace:WaitForChild("Prison_ITEMS").single:WaitForChild("Key card"):FindFirstChild("ITEMPICKUP"))
		end
		local keycard = backpack:FindFirstChild("Key card") or character:FindFirstChild("Key card")
		local canHave = Instance.new("BoolValue")
		if keycard and game.Players:FindFirstChild(plr.Name) then
			canHave.Value = true
			canHave.Name = "CanHave"
			canHave.Parent = keycard
			local CHAR = game.Players.LocalPlayer.Character
			CHAR.Humanoid.Name = "1"
			local c = CHAR["1"]:Clone()
			c.Name = "Humanoid"
			c.Parent = CHAR
			CHAR["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = CHAR
			CHAR.Animate.Disabled = true
			wait()
			CHAR.Animate.Disabled = false
			CHAR.Humanoid.DisplayDistanceType = "None"
			keycard.Parent = character
			local stop = 0
			repeat wait(.1)
				pcall(function()
					stop = stop + 1
					usingcmd = true
					humroot.CFrame = plr.Character:FindFirstChild("Torso").CFrame * CFrame.new(0, 0, 0.75) or plr.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 0.75) or plr.Character:FindFirstChildOfClass("Part").CFrame * CFrame.new(0, 0, 0.75)
					plr.Character:FindFirstChild("HumanoidRootPart").Anchored = true
				end)
			until not character:FindFirstChild("Key card") or not game.Players:FindFirstChild(plr.Name) or stop > 500
			loadchar(BrickColor.new(oldteam).Name)
		end
		wait(.2)
		for i = 1,3 do
			wait()
			usingcmd = true
			humroot.CFrame = MyPos
		end
		plr.Character:FindFirstChild("HumanoidRootPart").Anchored = false
	end)
	if success then
		return true, ""
	else
		return false, errorm
	end
end

function cuffs(plr)
	local success, errorm = pcall(function()
		local MyPos = getpos()
		local hand_cuffs = backpack:FindFirstChild("Handcuffs") or character:FindFirstChild("Handcuffs")
		local oldteam = localplayer.TeamColor.Name
		if not hand_cuffs then
			oldteam = localplayer.TeamColor.Name
			loadchar(BrickColor.new("Bright blue").Name)
		end
		local CHAR = game.Players.LocalPlayer.Character
		CHAR.Humanoid.Name = "1"
		local c = CHAR["1"]:Clone()
		c.Name = "Humanoid"
		c.Parent = CHAR
		CHAR["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = CHAR
		CHAR.Animate.Disabled = true
		wait()
		CHAR.Animate.Disabled = false
		CHAR.Humanoid.DisplayDistanceType = "None"
		hand_cuffs = backpack:FindFirstChild("Handcuffs") or character:FindFirstChild("Handcuffs")
		local canHave = Instance.new("BoolValue", hand_cuffs)
		canHave.Value = true
		canHave.Name = "CanHave"
		hand_cuffs.Parent = character
		local stop = 0
		repeat wait(.1)
			pcall(function()
				stop = stop + 1
				usingcmd = true
				humroot.CFrame = plr.Character:FindFirstChild("Torso").CFrame * CFrame.new(0, 0, 0.75) or plr.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 0.75) or plr.Character:FindFirstChildOfClass("Part").CFrame * CFrame.new(0, 0, 0.75)
				plr.Character:FindFirstChild("HumanoidRootPart").Anchored = true
			end)
		until not character:FindFirstChild("Handcuffs") or not humroot or not character or not game.Players:FindFirstChild(plr.Name) or stop > 500
		loadchar(BrickColor.new(oldteam).Name)
		wait(.2)
		for i = 1,3 do
			wait()
			usingcmd = true
			humroot.CFrame = MyPos
		end
		plr.Character:FindFirstChild("HumanoidRootPart").Anchored = false
	end)
	if success then
		return true, ""
	else
		return false, errorm
	end
end

function teamevent(brickcolor)
	workspace.Remote.TeamEvent:FireServer(brickcolor)
end

function chatnotify(msg)
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = msg,
		Color = Color3.fromRGB(255, 0, 0),
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size96
	})
end

function chat(msg)
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

function cmd(cmd)
	return arg1 == prefix..string.lower(cmd)
end

function cmd2(cmds, plr)
	return arg1 == admins[plr.Name].prefix..string.lower(cmds)
end

chatnotify("Admin loaded!, enjoy!")
chatnotify("Made by        : ")
chatnotify("Youtube        :       CXZ NAME_R")
chatnotify("Discord        : LocalPlayer#7434")
chatnotify("Helper Discord :       Zyrex#5659")

local chatlogs = {}

function usecmd(msg)
	arg = string.lower(msg):split(" ")
	arg1 = arg[1]
	arg2 = arg[2]
	arg3 = arg[3]
	usingcmd = true
	if cmd("cmds") then
		chatnotify("Say '/console' or press F9 or Fn + F9 to see all commands")
		for i,v in pairs(cmds) do
			print(i..". "..v)
		end
		SendNotification("Say '/console' or press F9 or Fn + F9 to see all commands", "Success", Color3.fromRGB(0, 255, 0))
	end
	if cmd("timeout") then
		local events = {}
		for i = 1,100000 do
			events[#events + 1] = {
				Hit = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part"),
				Distance = 0,
				Cframe = CFrame.new(),
				RayObject = Ray.new(Vector3.new(), Vector3.new())
			}
		end
		for i = 1,2 do
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			local gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			if gun then
				game.ReplicatedStorage.ShootEvent:FireServer(events, gun)
			end
		end
	end
	if cmd("lag") then
		local events = {}
		for i = 1,10000 do
			events[#events + 1] = {
				Hit = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part"),
				Distance = 0,
				Cframe = CFrame.new(),
				RayObject = Ray.new(Vector3.new(), Vector3.new())
			}
		end
		for i = 1,math.huge do
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			local gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			if gun then
				game.ReplicatedStorage.ShootEvent:FireServer(events, gun)
			end
		end
	end
	if cmd("bbring") then
		local plr = getplr(arg2, localplayer)
		if plr ~= game.Players.LocalPlayer and plr ~= nil then
			bypassbring(plr)
		end
	end
	if cmd("chatlog") then
		warn("-- Chat logs --")
		for i = 1,#chatlogs do
			print("("..chatlogs[i].clocktime..")".."["..chatlogs[i].plr.DisplayName.."]: "..chatlogs[i].chat)
		end
		SendNotification("Printed chat logs!", "Success", Color3.fromRGB(0, 255, 0))
		chatnotify("Say '/console' or press F9 or FN + F9 to view chat logs")
	end
	if cmd("res") then
		usingcmd = true
		loadchar()
	end
	if cmd("re") then
		savepos()
		loadchar()
		wait(.1)
		usingcmd = true
		loadpos()
	end
	if cmd("team") then
		if string.lower("neutral") == string.lower(arg2) then
			teamevent("Medium stone grey")
		elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
			teamevent("Bright blue")
		elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
			teamevent("Bright orange")
		else
			if arg[4] == nil then
				loadchar(BrickColor.new(arg2.." "..arg3).Name)
			else
				loadchar(BrickColor.new(arg2.." "..arg3.." "..arg[4]).Name)
			end
		end
	end
	if cmd("touch") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			if plr == localplayer then
				states.antitouch = true
			else
				if not antiTouch[plr.Name] then
					antiTouch[plr.Name] = {plr = plr}
					SendNotification("Added anti touch to "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				else
					SendNotification(plr.DisplayName.." already have anti touch", "Warn", Color3.fromRGB(255, 255, 0))
				end
			end
		else
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("untouch") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			if plr == localplayer then
				states.antitouch = false
			else
				if not antiTouch[plr.Name] then
					antiTouch[plr.Name] = nil
					SendNotification("Removed anti touch to "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				else
					SendNotification(plr.DisplayName.." don't have anti touch", "Warn", Color3.fromRGB(255, 255, 0))
				end
			end
		else
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	--[[if cmd("bypass") then
		local message = arg2
		local space = "_"
		if arg2 ~= nil then
			local alpharbet = {
				a = "a ͤ",
				b = "b ͤ",
				c = "c ͤ",
				d = "d ͤ",
				e = "e ͤ",
				f = "f",
				g = "g ͤ",
				h = "h ͤ",
				i = "i ͤ",
				j = "j",
				k = "k ͤ",
				l = "l ͤ",
				m = "m ͤ",
				n = "n ͤ",
				o = "○",
				p = "p ͤ",
				q = "q ͤ",
				r = "r ͤ",
				s = "s ͤ",
				t = "t ͤ",
				u = "u ͤ",
				w = "w ͤ",
				x = "x ͤ",
				y = "y ͤ",
				z = "z ͤ",
				_ = " "
			}
			local bypasses
			for t = 1,#message do
				for i,v in pairs(alpharbet) do
					if message:sub(1,t):lower() == i then
						if bypasses == nil then
							bypasses = v
						else
							bypasses = bypasses..v
						end
					end
				end
			end
			chat(bypasses)
		end
	end]]
	if cmd("rj") then
		SendNotification("Rejoining server", "Success", Color3.fromRGB(0, 255, 0))
		game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end
	if cmd("disconnect") then
		SendNotification("Disconnected server", "Success", Color3.fromRGB(0, 255, 0))
		local events = {
			Hit = workspace:FindFirstChildOfClass("Part"),
			Cframe = CFrame.new(),
			Distance = 0,
			RayObject = Ray.new(Vector3.new(), Vector3.new())
		}
		local eventspack = {}
		for i = 1,10000 do
			eventspack[#eventspack + 1] = events
		end
		for i = 1,math.huge do
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			local gun = character:FindFirstChild("Remington 870") or backpack:FindFirstChild("Remington 870")
			game.ReplicatedStorage.ShootEvent:FireServer(eventspack, gun)
		end
	end
	if cmd("view") then
		local plr = getplr(arg2, localplayer)
		if plr then
			SendNotification("Viewing "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
			states.viewing = plr
		else
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("unview") then
		SendNotification("Unviewed "..states.viewing.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
		states.viewing = nil
		wait(.1)
		workspace.CurrentCamera.CameraSubject = character
	end
	if cmd("stuck") then
		states.stucking = true
		wait(.2)
		SendNotification("Stucked", "Success", Color3.fromRGB(0, 255, 0))
		loadchar(BrickColor.new("Medium stone grey").Name)
	end
	if cmd("unstuck") then
		SendNotification("Unstucked", "Success", Color3.fromRGB(0, 255, 0))
		states.stucking = false
	end
	if cmd("color") then
		local Arguaments = arg2
		local Split = Arguaments:split("/")
		savepos()
		loadchar(Color3.fromRGB(Split[1], Split[2], Split[3]))
		usingcmd = true
		loadpos()
		SendNotification("Color", "Success", Color3.fromRGB(0, 255, 0))
	end
	if cmd("lb") then
		local plr = getplr(arg2, localplayer)
		if plr then
			states.loopbring = true
			coroutine.wrap(function()
				doloop()
			end)()
			usingcmd = true
			NOW = CFrame.new(plr.Character:FindFirstChildOfClass("Part").CFrame.p)
			SendNotification("Looped bring "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
			local count = 0
			local isantifling = false
			if AntiFling then
				isantifling = true
				AntiFling = false
			end
			repeat wait(.1)
				pcall(function()
					count = count + 1
					if count < 2 then
						local CHAR = game.Players.LocalPlayer.Character
						CHAR.Humanoid.Name = "1"
						local c = CHAR["1"]:Clone()
						c.Name = "Humanoid"
						c.Parent = CHAR
						CHAR["1"]:Destroy()
						game.Workspace.CurrentCamera.CameraSubject = CHAR
						CHAR.Animate.Disabled = true
						wait()
						CHAR.Animate.Disabled = false
						CHAR.Humanoid.DisplayDistanceType = "None"
						workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
						if not game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") then
							workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
						end
						if not CHAR:FindFirstChildOfClass("Tool") then
							local tool = game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer") or game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9")
							local canHave = Instance.new("BoolValue", tool)
							canHave.Value = true
							canHave.Name = "CanHave"
							tool.Parent = character
						end
						local isrespawn = Instance.new("BoolValue", CHAR)
						isrespawn.Value = true
						isrespawn.Name = "Respawn"
					end
					if not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or not character:FindFirstChild("Respawn") then
						count = 0
					end
					plr.Character.HumanoidRootPart.CFrame = humroot.CFrame * CFrame.new(0, 0, -0.5)
				end)
			until not states.loopbring or not players:FindFirstChild(plr.Name)
			states.loopbring = false
			if isantifling then
				AntiFling = true
			end
		else
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("unlb") then
		SendNotification("Unlooped bring", "Success", Color3.fromRGB(0, 255, 0))
		states.loopbring = false
	end
	if cmd("beam") then
		local plr = getplr(arg2, localplayer)
		local time = tonumber(arg3) or 1
		local size = tonumber(arg[4]) or 100
		if plr ~= nil then
			for i = 1,time do
				beam(plr, time, math.huge, size)
			end
		end
	end
	if cmd("crash") then
		SendNotification("Crashed server", "Success", Color3.fromRGB(0, 255 ,0))
		local events = {
			Hit = game:GetService("Workspace"):FindFirstChildOfClass("Part"),
			Cframe = CFrame.new(),
			Distance = math.huge,
			RayObject = Ray.new(Vector3.new(), Vector3.new())
		}
		local events_package = {}
		for i = 1,75000 do
			events_package[#events_package + 1] = events
		end
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		local gun = character:FindFirstChild("Remington 870") or backpack:FindFirstChild("Remington 870")
		for i = 1,10 do
			game.ReplicatedStorage.ShootEvent:FireServer(events_package, gun)
		end
	end
	if cmd("sa") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			local pad = game:GetService("Lighting"):FindFirstChild("SpawnLocation")
			pcall(function()
				for i,v in pairs(connections) do
					v:Disconnect()
				end
			end)
			coroutine.wrap(function()
				for i = 1,100 do
					coroutine.wrap(function()
						arrestevent(plr, math.huge)
					end)()
				end
			end)()
			if plr.TeamColor.Name ~= "Really red" then
				repeat wait()
					crim(plr)
				until plr.TeamColor.Name == "Realy red" or not game.Players:FindFirstChild(plr.Name)
			end
			loadchar()
			for i = 1,10 do
				wait()
				usingcmd = true
				humroot.CFrame = plr.Character:FindFirstChildOfClass("Part").CFrame * CFrame.new(0, 1, 0)
			end
			pad.Anchored = true
			pad.Transparency = 0.000
			pad.Parent = game:GetService("Lighting")
			SendNotification("Spam arrested "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
		else
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("prefix") then
		local newPrefix = tostring(arg2) or tostring(prefix)
		if #newPrefix == 1 and newPrefix ~= prefix then
			prefix = newPrefix
			SendNotification("Changed prefix to "..prefix, "Success", Color3.fromRGB(0, 255, 0))
		else
			SendNotification("Prefix cannot have more than 1 letter", "Warn", Color3.fromRGB(255, 255, 0))
		end
	end
	if cmd("rank") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			if plr and not admins[plr.Name] then
				admins[plr.Name] = {plr = plr, prefix = ":"}
				SendNotification("Ranked "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				chat("/w "..plr.DisplayName.." You have been ranked say :cmds for commands")
			elseif plr and admins[plr.Name] then
				SendNotification(plr.DisplayName.." already have ranked", "Warn", Color3.fromRGB(255, 255, 0))
			elseif not plr then
				SendNotification("No player foudn by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and not admins[v.Name] then
						admins[v.Name] = {plr = v, prefix = ":"}
					end
				end
				SendNotification("Ranked everyone", "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and not admins[v.Name] and v.TeamColor.Name == "Bright orange" then
						admins[v.Name] = {plr = v, prefix = ":"}
					end
				end
				SendNotification("Rabked inmates", "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and not admins[v.Name] and v.TeamColor.Name == "Bright blue" then
						admins[v.Name] = {plr = v, prefix = ":"}
					end
				end
				SendNotification("Ranked guards", "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("criminal") == string.lower(arg2) or string.lower("criminals") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and not admins[v.Name] and v.TeamColor.Name == "Really red" then
						admins[v.Name] = {plr = v, prefix = ":"}
					end
				end
				SendNotification("Ranked criminals", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification("No player foudn by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
			end
		end
	end
	if cmd("unrank") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			if plr and admins[plr.Name] then
				admins[plr.Name] = nil
				SendNotification("Unranked "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				chat("/w "..plr.Name.." You have been ranked say :cmds for commands")
			elseif plr and not admins[plr.Name] then
				SendNotification(plr.DisplayName.." doesn't have ranked", "Warn", Color3.fromRGB(255, 255, 0))
			elseif not plr then
				SendNotification("No player foudn by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and admins[v.Name] then
						admins[v.Name] = nil
					end
				end
				SendNotification("Unranked everyone", "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and admins[v.Name] and v.TeamColor.Name == "Bright orange" then
						admins[v.Name] = nil
					end
				end
				SendNotification("Unranked inmates", "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and admins[v.Name] and v.TeamColor.Name == "Bright blue" then
						admins[v.Name] = nil
					end
				end
				SendNotification("Unranked guards", "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("criminal") == string.lower(arg2) or string.lower("criminals") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and admins[v.Name] and v.TeamColor.Name == "Really red" then
						admins[v.Name] = nil
					end
				end
				SendNotification("Unranked criminals", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification("No player foudn by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
			end
		end
	end
	if cmd("arrest") then
		local plr = getplr(arg2, localplayer)
		local times = tonumber(arg3) or 1
		savepos()
		if plr ~= nil then
			SendNotification("Arrested "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
			arrest(plr, times)
		elseif string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name ~= "Bright blue" then
					for i = 1,10 do
						wait()
						character:WaitForChild("Humanoid").Sit = false
						usingcmd = true
						humroot.CFrame = v.Character:FindFirstChildOfClass("Part").CFrame
						arrestevent(v, times)
					end
				end
			end
		elseif string.lower("inmates") == string.lower(arg2) or string.lower("inmate") == string.lower(arg2) then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
					for i = 1,10 do
						wait()
						character:WaitForChild("Humanoid").Sit = false
						usingcmd = true
						humroot.CFrame = v.Character:FindFirstChildOfClass("Part").CFrame
						arrestevent(v, times)
					end
				end
			end
		elseif string.lower("criminals") == string.lower(arg2) or string.lower("criminal") == string.lower(arg2) then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Really red" then
					for i = 1,10 do
						wait()
						character:WaitForChild("Humanoid").Sit = false
						usingcmd = true
						humroot.CFrame = v.Character:FindFirstChildOfClass("Part").CFrame
						arrestevent(v, times)
					end
				end
			end
		else
			SendNotification("No player found by name: "..arg2)
		end
		loadpos()
	end
	if cmd("ka") then
		local plr = getplr(arg2, localplayer)
		if plr == localplayer then
			SendNotification("Added kill aura to you", "Success", Color3.fromRGB(0, 255, 0))
			states.killaura = true
		elseif plr ~= nil and plr ~= localplayer then
			if not killaura[plr.Name] then
				SendNotification("Added kill aura to "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				killaura[plr.Name] = {plr = plr}
			end
		else
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("unka") then
		local plr = getplr(arg2, localplayer)
		if plr == localplayer then
			states.killaura = false
			SendNotification("Removed kill aura from you", "Success", Color3.fromRGB(0, 255, 0))
		else
			if killaura[plr.Name] then
				killaura[plr.Name] = nil
				SendNotification("Removed kill aura from "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
			end
		end
	end
	if cmd("taze") then
		local success, errorm = pcall(function()
			taseall()
		end)
		if success then
			SendNotification("Taze all", "Success", Color3.fromRGB(0, 255, 0))
		else
			SendNotification(errorm, "Success", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("tase") then
		local success, errorm = pcall(function()
			tase(getplr(arg2, localplayer))
		end)
		if success then
			SendNotification("Taze "..getplr(arg2, localplayer).DisplayName, "Success", Color3.fromRGB(0, 255, 0))
		else
			SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("bcrim") then
		local plr = getplr(arg2, localplayer)
		if plr ~= localplayer and plr ~= nil then
			local char = plr.Character
			local pad = game:GetService("Lighting"):FindFirstChildOfClass("SpawnLocation")
			wait(.1)
			pad.Parent = workspace
			pad.Transparency = 1
			pad.AllowTeamChangeOnTouch = false
			local time = 0
			repeat wait()
				pcall(function()
					time = time  + 1
					pad.Anchored = false
					for i = 1,2 do
						coroutine.wrap(function()
							game:GetService("ReplicatedStorage"):WaitForChild("meleeEvent"):FireServer(plr)
						end)()
					end
					pad.CFrame = humroot.CFrame
					pad.Anchored = true
					humroot.CFrame = char:FindFirstChildOfClass("Part").CFrame * CFrame.new(0, 0, 0.5)
				end)
			until plr.TeamColor.Name == "Really red" or not game.Players:FindFirstChild(plr.Name) or time > 200
			pad.Transparency = 0
			pad.Parent = game:GetService("Lighting")
			pad.AllowTeamChangeOnTouch = true
		end
	end
	if cmd("crim") then
		local plr = getplr(arg2, localplayer)
		pcall(function()
			if plr ~= nil then
				local success, errorm = pcall(function()
					crim(plr)
				end)
				if success then
					SendNotification("Crimmed "..getplr(arg2, localplayer).DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				else
					SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
				end
			else
				if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= game.Players.LocalPlayer and v.TeamColor.Name ~= "Really red" then
							repeat wait()
								crim(v)
							until not game.Players:FindFirstChild(v.Name) or v.TeamColor.Name == "Really red"
						end
					end
				elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= game.Players.LocalPlayer and v.TeamColor.Name == "Bright orange" then
							repeat wait()
								crim(v)
							until not game.Players:FindFirstChild(v.Name) or v.TeamColor.Name == "Really red"
						end
					end
				elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= game.Players.LocalPlayer and v.TeamColor.Name == "Bright blue" then
							repeat wait()
								crim(v)
							until not game.Players:FindFirstChild(v.Name) or v.TeamColor.Name == "Really red"
						end
					end
				else
					SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
				end
			end
		end)
	end
	if cmd("bring") then
		local plr = getplr(arg2, localplayer)
		local success, errorm
		if plr ~= nil then
			success, errorm = pcall(function()
				tp(plr, humroot.CFrame)
			end)
			if success then
				SendNotification("Brought "..getplr(arg2, localplayer).DisplayName, "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if string.lower("all") == (string.lower(arg2)) or string.lower("others") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= localplayer then
						tp(v, getpos())
					end
				end
				SendNotification("Brought "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("inmates") == (string.lower(arg2)) or string.lower("inmate") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
						tp(v, getpos())
					end
				end
				SendNotification("Brought "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("guards") == (string.lower(arg2)) or string.lower("guard") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright blue" then
						tp(v, getpos())
					end
				end
				SendNotification("Brought "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("criminals") == (string.lower(arg2)) or string.lower("criminal") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Really red" then
						tp(v, getpos())
					end
				end
				SendNotification("Brought "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			end
		end
	end
	if cmd("goto") then
		local success, errorm = pcall(function()
			humroot.CFrame = getplr(arg2, localplayer).Character.HumanoidRootPart.CFrame
		end)
		if success then
			SendNotification("Gone to "..getplr(arg2, localplayer).DisplayName, "Success", Color3.fromRGB(0, 255, 0))
		else
			SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("lk") then
		local plr = getplr(arg2, localplayer)
		if plr and not loopkill[plr.Name] then
			loopkill[plr.Name] = {plr = plr}
			SendNotification("Looped kills "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
		elseif plr == nil then
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		elseif plr and loopkill[plr.Name] then
			SendNotification(plr.DisplayName.." already have loop kills", "Warn", Color3.fromRGB(255, 255, 0))
		end
	end
	if cmd("unlk") then
		local plr = getplr(arg2, localplayer)
		if plr and loopkill[plr.Name] then
			loopkill[plr.Name] = nil
			SendNotification("Unlooped kills "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
		elseif plr == nil then
			SendNotification("No player found by name: "..arg2, "Error", Color3.fromRGB(255, 0, 0))
		elseif plr and not loopkill[plr.Name] then
			SendNotification(plr.DisplayName.." doesn't have loop kills", "Warn", Color3.fromRGB(255, 255, 0))
		end
	end
	if cmd("void") then
		local plr = getplr(arg2, localplayer)
		local success, errorm
		if plr ~= nil then
			success, errorm = pcall(function()
				void(plr)
			end)
		else
			if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						void(v)
					end
				end
				SendNotification("Voided "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and v.TeamColor.Name == "Bright blue" then
						void(v)
					end
				end
				SendNotification("Voided "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("inmate") == (string.lower(arg2)) or string.lower("inmates") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and v.TeamColor.Name == "Bright orange" then
						void(v)
					end
				end
				SendNotification("Voided "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			elseif string.lower("criminal") == (string.lower(arg2)) or string.lower("criminals") == (string.lower(arg2)) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer and v.TeamColor.Name == "Really red" then
						void(v)
					end
				end
				SendNotification("Voided "..arg2, "Success", Color3.fromRGB(0, 255, 0))
			end
		end
		if success then
			SendNotification("Voided "..getplr(arg2, localplayer).Name, "Success", Color3.fromRGB(0, 255, 0))
		else
			SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
		end
	end
	if cmd("kill") then
		if string.lower("all") == (string.lower(arg2)) or string.lower("others") == (string.lower(arg2)) then
			local success, errorm = pcall(function()
				killall()
			end)
			if success then
				SendNotification("Killed all", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		elseif string.lower("inmate") == (string.lower(arg2)) or string.lower("inmates") == (string.lower(arg2)) then
			local success, errorm = pcall(function()
				killteam(BrickColor.new("Bright orange").Name)
			end)
			if success then
				SendNotification("Killed inmates", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		elseif string.lower("guard") == (string.lower(arg2)) or string.lower("guards") == (string.lower(arg2)) then
			local success, errorm = pcall(function()
				killteam(BrickColor.new("Bright blue").Name)
			end)
			if success then
				SendNotification("Killed guards", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		elseif string.lower("criminal") == (string.lower(arg2)) or string.lower("criminals") == (string.lower(arg2)) then
			local success, errorm = pcall(function()
				killteam(BrickColor.new("Really red").Name)
			end)
			if success then
				SendNotification("Killed criminals", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			local plr = getplr(arg2, localplayer)
			local success, errorm = pcall(function()
				kill(plr)
			end)
			if success then
				SendNotification("Killed "..plr.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		end
	end
	if cmd("ded") then
		states.loopkillall = true
	end
	if cmd("unded") then
		states.loopkillall = false
	end
	if cmd("tp") then
		local plr = getplr(arg2, localplayer)
		local plr2 = getplr(arg3, localplayer)
		if plr ~= nil then
			local success, errorm
			if plr2 ~= nil then
				success, errorm = pcall(function()
					tpV(plr, plr2)
				end)
			end
			if success then
				SendNotification("Tp "..plr.DisplayName.." to "..plr2.DisplayName)
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if plr2 ~= nil then
				if string.lower("all") == (string.lower(arg2)) or string.lower("others") == (string.lower(arg2)) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= localplayer and v ~= plr2 then
							tpV(v, plr2)
						end
					end
					SendNotification("Tp "..arg2.." to "..plr2.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				elseif string.lower("guard") == (string.lower(arg2)) or string.lower("guards") == (string.lower(arg2)) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= localplayer and v ~= plr2 and v.TeamColor.Name == "Bright blue" then
							tpV(v, plr2)
						end
					end
					SendNotification("Tp "..arg2.." to "..plr2.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				elseif string.lower("inmate") == (string.lower(arg2)) or string.lower("inmates") == (string.lower(arg2)) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= localplayer and v ~= plr2 and v.TeamColor.Name == "Bright orange" then
							tpV(v, plr2)
						end
					end
					SendNotification("Tp "..arg2.." to "..plr2.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				elseif string.lower("criminal") == (string.lower(arg2)) or string.lower("criminals") == (string.lower(arg2)) then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= localplayer and v ~= plr2 and v.TeamColor.Name == "Really red" then
							tpV(v, plr2)
						end
					end
					SendNotification("Tp "..arg2.." to "..plr2.DisplayName, "Success", Color3.fromRGB(0, 255, 0))
				end
			end
		end
	end
	if cmd("nexus") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			local success, errorm = pcall(function()
				tp(plr, CFrame.new(888, 100, 2388))
			end)
			if success then
				SendNotification("Tp "..getplr(arg2, localplayer).DisplayName.." to prison nexus", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer then
						tp(v, CFrame.new(888, 100, 2388))
					end
				end
			elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright blue" then
						tp(v, CFrame.new(888, 100, 2388))
					end
				end
			elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
						tp(v, CFrame.new(888, 100, 2388))
					end
				end
			elseif string.lower("criminal") == string.lower(arg2) or string.lower("criminals") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Really red" then
						tp(v, CFrame.new(888, 100, 2388))
					end
				end
			end
		end
	end
	if cmd("yard") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			local success, errorm = pcall(function()
				tp(plr, CFrame.new(791, 98, 2498))
			end)
			if success then
				SendNotification("Tp "..getplr(arg2, localplayer).DisplayName.." to prison yard", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer then
						tp(v, CFrame.new(791, 98, 2498))
					end
				end
			elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright blue" then
						tp(v, CFrame.new(791, 98, 2498))
					end
				end
			elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
						tp(v, CFrame.new(791, 98, 2498))
					end
				end
			elseif string.lower("criminal") == string.lower(arg2) or string.lower("criminals") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Really red" then
						tp(v, CFrame.new(791, 98, 2498))
					end
				end
			end
		end
	end
	if cmd("base") then
		local plr = getplr(arg2, localplayer)
		if plr ~= nil then
			local success, errorm = pcall(function()
				tp(plr, CFrame.new(-943, 95, 2055))
			end)
			if success then
				SendNotification("Tp "..getplr(arg2, localplayer).DisplayName.." to criminal base", "Success", Color3.fromRGB(0, 255, 0))
			else
				SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
			end
		else
			if string.lower("all") == string.lower(arg2) or string.lower("others") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer then
						tp(v, CFrame.new(-943, 95, 2055))
					end
				end
			elseif string.lower("guard") == string.lower(arg2) or string.lower("guards") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright blue" then
						tp(v, CFrame.new(-943, 95, 2055))
					end
				end
			elseif string.lower("inmate") == string.lower(arg2) or string.lower("inmates") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
						tp(v, CFrame.new(-943, 95, 2055))
					end
				end
			elseif string.lower("criminal") == string.lower(arg2) or string.lower("criminals") == string.lower(arg2) then
				for i,v in pairs(players:GetPlayers()) do
					if v ~= localplayer and v.TeamColor.Name == "Really red" then
						tp(v, CFrame.new(-943, 95, 2055))
					end
				end
			end
		end
	end
	if cmd("key") then
		local plr = getplr(arg2, localplayer)
		if string.lower("all") == (string.lower(arg2)) or string.lower("others") == (string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer then
					pcall(function()
						key(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." key card", "Success", Color3.fromRGB(0, 255, 0))
		elseif string.lower("inmate") == (string.lower(arg2)) or string.lower("inmates") == (string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
					pcall(function()
						key(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." key card", "Success", Color3.fromRGB(0, 255, 0))
		elseif string.lower("guard") == (string.lower(arg2)) or string.lower("guards") == (string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Bright blue" then
					pcall(function()
						key(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." key card", "Success", Color3.fromRGB(0, 255, 0))
		elseif string.lower("criminal") == (string.lower(arg2)) or string.lower("criminals") == (string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Really red" then
					pcall(function()
						key(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." key card", "Success", Color3.fromRGB(0, 255, 0))
		else
			if plr ~= nil then
				if plr == localplayer then
					local success, errorm = pcall(function()
						if not backpack:FindFirstChild("Key card") and not character:FindFirstChild("Key card") then
							local oldteam = localplayer.TeamColor.Name
							savepos()
							repeat wait(.2)
								character:WaitForChild("Humanoid").Health = 0
								usingcmd = true
								loadchar(BrickColor.new("Bright blue").Name)
							until workspace.Prison_ITEMS.single:FindFirstChild("Key card")
							loadchar(BrickColor.new(oldteam).Name)
							usingcmd = true
							loadpos()
							workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(workspace:WaitForChild("Prison_ITEMS").single:WaitForChild("Key card"):FindFirstChild("ITEMPICKUP"))
							SendNotification("Obtains key card", "Success", Color3.fromRGB(0, 255, 0))
						else
							SendNotification("You already have key card", "Warn", Color3.fromRGB(255, 255, 0))
						end
					end)
					if not success then
						SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
					end
				else
					local success, errorm = pcall(function()
						key(plr)
					end)
					if success then
						SendNotification("Gave "..plr.DisplayName.." key card", "Success", Color3.fromRGB(0, 255, 0))
					else
						SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
					end
				end
			end
		end
	end
	if cmd("cuffs") then
		local plr = getplr(arg2, localplayer)
		if string.lower("all"):match(string.lower(arg2)) or string.lower("others"):match(string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer then
					pcall(function()
						cuffs(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." hand cuffs", "Success", Color3.fromRGB(0, 255, 0))
		elseif string.lower("inmate"):match(string.lower(arg2)) or string.lower("inmates"):match(string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Bright orange" then
					pcall(function()
						cuffs(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." hand cuffs", "Success", Color3.fromRGB(0, 255, 0))
		elseif string.lower("guard"):match(string.lower(arg2)) or string.lower("guards"):match(string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Bright blue" then
					pcall(function()
						cuffs(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." hand cuffs", "Success", Color3.fromRGB(0, 255, 0))
		elseif string.lower("criminal"):match(string.lower(arg2)) or string.lower("criminals"):match(string.lower(arg2)) then
			savepos()
			for i,v in pairs(players:GetPlayers()) do
				if v ~= localplayer and v.TeamColor.Name == "Really red" then
					pcall(function()
						cuffs(v)
					end)
				end
			end
			loadpos()
			SendNotification("Gave "..arg2.." hand cuffs", "Success", Color3.fromRGB(0, 255, 0))
		else
			if plr ~= nil then
				if plr == localplayer then
					local success, errorm = pcall(function()
						local oldteam = localplayer.TeamColor.Name
						loadchar(BrickColor.new("Bright blue").Name)
						if oldteam == "Bright blue" or oldteam == "Bright orange" or oldteam == "Medium stone grey" then
							teamevent(oldteam)
						elseif oldteam == "Really red" then
							SendNotification("Cannot change team back to normal team", "Warn", Color3.fromRGB(255, 255, 0))
						else
							teamevent("Medium ston grey")
						end
					end)
					if success then
						SendNotification("Obtains hand cuffs", "Success", Color3.fromRGB(0, 255, 0))
					else
						SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
					end
				else
					local success, errorm = pcall(function()
						cuffs(plr)
					end)
					if success then
						SendNotification("Gave "..plr.DisplayName.." hand cuffs")
					else
						SendNotification(errorm, "Error", Color3.fromRGB(255, 0, 0))
					end
				end
			end
		end
	end
end

function usecmds(msg, plr)
	arg = string.lower(msg):split(" ")
	arg1 = arg[1]
	arg2 = arg[2]
	arg3 = arg[3]
	usingcmd = true
	local oldcmd = cmd2
	local cmd = function(commands)
		return oldcmd(commands, plr)
	end
	local PF = admins[plr.Name].prefix
	if cmd2("cmds", plr) then
		chat("/w "..plr.Name.." "..PF.."kill [player] "..PF.."bring [player] "..PF.."goto [player] "..PF.."nexus [player] "..PF.."crim [player] "..PF.."ka [player] "..PF.."unka [player] ")
		chat("/w "..plr.Name.." "..PF.."kill [all,inmate,criminal,guard] "..PF.."base [player] "..PF.."yard [player] "..PF.."lk [player] "..PF.."unlk [player] "..PF.."key [player] "..PF.."cuffs [player] " )
	end
	if cmd2("prefix", plr) then
		local newPrefix = tostring(arg2) or tostring(admins[plr.Name].prefix)
		if newPrefix ~= admins[plr.Name].prefix and #newPrefix == 1 then
			admins[plr.Name].prefix = newPrefix
		end
	end
	if cmd2("ka", plr) then
		local plr = getplr(arg2, plr)
		if plr and not killaura[plr.Name] then
			killaura[plr.Name] = {plr = plr}
		end
	end
	if cmd2("unka", plr) then
		local plr = getplr(arg2, plr)
		if plr and killaura[plr.Name] then
			killaura[plr.Name] = nil
		end
	end
	if cmd2("kill", plr) then
		if arg2 == "all" then
			killall(plr)
		elseif arg2 == "inmate" or arg2 == "inmates" then
			killteam(BrickColor.new("Bright orange").Name, plr)
		elseif arg2 == "guard" or arg2 == "guards" then
			killteam(BrickColor.new("Bright blue").Name, plr)
		elseif arg2 == "criminal" or arg2 == "criminals" then
			killteam(BrickColor.new("Really red").Name, plr)
		else
			local plr = getplr(arg2, plr)
			if plr ~= nil then
				kill(plr)
			end
		end
	end
	if cmd2("bring", plr) then
		local plr2 = getplr(arg2, plr)
		if plr2 ~= nil then
			tpV(plr2, plr)
		end
	end
	if cmd2("goto", plr) then
		local plr2 = getplr(arg2, plr)
		if plr2 ~= nil then
			tpV(plr, plr2)
		end
	end
	if cmd2("nexus", plr) then
		local plr = getplr(arg2, plr)
		if plr ~= nil then
			tp(plr, CFrame.new(888, 100, 2388))
		end
	end
	if cmd2("yard", plr) then
		local plr = getplr(arg2, plr)
		if plr ~= nil then
			tp(plr, CFrame.new(791, 98, 2498))
		end
	end
	if cmd2("base", plr) then
		local plr = getplr(arg2, plr)
		if plr ~= nil then
			tp(plr, CFrame.new(-943, 95, 2055))
		end
	end
	if cmd2("crim", plr) then
		local plr = getplr(arg2, plr)
		if plr then
			tp(plr, CFrame.new(-919, 100, 2138))
		end
	end
	if cmd2("lk", plr) then
		local plr = getplr(arg2, plr)
		if plr and not loopkill[plr.Name] then
			loopkill[plr.Name] = {plr = plr}
		end
	end
	if cmd2("unlk", plr) then
		local plr = getplr(arg2, plr)
		if plr and loopkill[plr.Name] then
			loopkill[plr.Name] = nil
		end
	end
	if cmd2("key", plr) then
		local plr = getplr(arg2, plr)
		if plr ~= nil then
			key(plr)
		end
	end
	if cmd("cuffs", plr) then
		local plr = getplr(arg2, plr)
		if plr ~= nil then
			cuffs(plr)
		end
	end
end

for _,v in pairs(players:GetPlayers()) do
	if v ~= localplayer then
		v.Chatted:Connect(function(msg)
			if admins[v.Name] then
				usecmds(msg, v)
			end
		end)
	end
end

players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if admins[plr.Name] then
			usecmds(msg, plr)
		end
	end)
end)

localplayer.Chatted:Connect(usecmd)

spawn(function()
	while wait(.75) do
		if states.loopkillall then
			pcall(function()
				killall()
			end)
		end
	end
end)

spawn(function()
	while wait(.75) do
		for i,v in pairs(loopkill) do
			pcall(function()
				if v.plr and game.Players:FindFirstChild(v.plr.Name) then
					if v.plr.TeamColor.Name == localplayer.TeamColor.Name then
						savepos()
						loadchar(BrickColor.random().Name)
						wait(.1)
						loadpos()
					end
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
					local gun = backpack:FindFirstChild("Remington 870") or character:FindFirstChild("Remington 870")
					local events = {}
					for i = 1,15 do
						events[#events + 1] = {
							Hit = v.plr.Character:FindFirstChildOfClass("Part"),
							Cframe = CFrame.new(),
							Distance = 0,
							RayObject = Ray.new(Vector3.new(), Vector3.new())
						}
					end
					coroutine.wrap(function()
						for i = 1,30 do
							replicatedstorage.ReloadEvent:FireServer(gun)
							wait(.3)
						end
					end)()
					replicatedstorage.ShootEvent:FireServer(events, gun)
				end
			end)
		end
	end
end)

coroutine.wrap(function()
	while wait(1) do
		if states.killaura then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= game.Players.LocalPlayer and v.TeamColor.Name ~= localplayer.TeamColor.Name then
					pcall(function()
						local events = {}
						local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
						if Distance < 25 and v.Character.Humanoid.Health > 0 and not v.Character:FindFirstChild("Force Field") then
							for e = 1,15 do
								events[#events + 1] = {
									Hit = v.Character:FindFirstChildOfClass("Part"),
									Cframe = CFrame.new(),
									Distance = 0,
									RayObject = Ray.new(Vector3.new(), Vector3.new())
								}
							end
						end
						if #events > 10 then
							local gun
							for _,g in pairs(character:GetChildren()) do
								if g.Name ~= "Taser" and gun == nil and g ~= nil and g:FindFirstChild("GunStates") then
									gun = g
								end
							end
							if gun == nil then
								for _,g in pairs(backpack:GetChildren()) do
									if g.Name ~= "Taser" and gun == nil and g ~= nil and g:FindFirstChild("GunStates") then
										gun = g
									end
								end
							end
							coroutine.wrap(function()
								for i = 1,30 do
									game:GetService("ReplicatedStorage"):WaitForChild("ReloadEvent"):FireServer(gun)
									wait(.5)
								end
							end)()
							replicatedstorage:WaitForChild("ShootEvent"):FireServer(events, gun)
						end
					end)
				end
			end
		end
	end
end)()

spawn(function()
	while wait(1) do
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.TeamColor.Name ~= localplayer.TeamColor.Name then
				for _,p in pairs(killaura) do
					pcall(function()
						local events = {}
						if game.Players:FindFirstChild(p.plr.Name) then
							if (v.Character:FindFirstChildOfClass("Part").Position-p.plr.Character:FindFirstChildOfClass("Part").Position).Magnitude < 20 then
								if v.Character:FindFirstChild("Humanoid").Health > 0 and v ~= p.plr and not v.Character:FindFirstChild("Force Field") then
									for e = 1,15 do
										events[#events + 1] = {
											Hit = v.Character:FindFirstChildOfClass("Part"),
											Cframe = CFrame.new(),
											Distance = 0,
											RayObject = Ray.new(Vector3.new(), Vector3.new())
										}
									end
								end
							end
						end
						if #events > 10 then
							local gun
							for _,g in pairs(character:GetChildren()) do
								if g.Name ~= "Taser" and gun == nil and g ~= nil and g:FindFirstChild("GunStates") then
									gun = g
								end
							end
							if gun == nil then
								for _,g in pairs(backpack:GetChildren()) do
									if g.Name ~= "Taser" and gun == nil and g ~= nil and g:FindFirstChild("GunStates") then
										gun = g
									end
								end
							end
							coroutine.wrap(function()
								for i = 1,30 do
									game:GetService("ReplicatedStorage"):WaitForChild("ReloadEvent"):FireServer(gun)
									wait(.5)
								end
							end)()
							replicatedstorage:WaitForChild("ShootEvent"):FireServer(events, gun)
						end
					end)
				end
			end
		end
	end
end)

local OldTeam = game.Players.LocalPlayer.TeamColor.Name

spawn(function()
	while wait() do
		pcall(function()
			if AntiTeamChange then
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health < 1 then
					if game.Players.LocalPlayer.TeamColor.Name ~= OldTeam then
						if OldTeam == "Bright blue" or OldTeam == "Bright orange" then
							teamevent(OldTeam)
						end
					end
				elseif game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
					OldTeam = game.Players.LocalPlayer.TeamColor.Name
				end
			end
		end)
	end
end)

local oldposition = humroot.Position
local oldcframe = getpos()

game:GetService("RunService").Stepped:Connect(function()
	pcall(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
	end)
end)

spawn(function()
	while wait() do
		pcall(function()
			if AntiBring then
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-oldposition).magnitude > MaxAntiBringDistance and not usingcmd then
					coroutine.wrap(function()
						for i = 1,3 do
							wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
						end
					end)()
				elseif usingcmd then
					wait(.1)
					usingcmd = false
					oldposition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					oldcframe = getpos()
				end
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-oldposition).magnitude < MaxAntiBringDistance and not usingcmd then
					oldposition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					oldcframe = getpos()
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < 1 then
				usingcmd = true
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(888, 100, 2388)
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			local arrestPlayer = getconnections(game:GetService("Workspace"):WaitForChild("Remote"):WaitForChild("arrestPlayer").OnClientEvent)
			for i,v in pairs(arrestPlayer) do
				v:Disable()
			end
		end)
	end
end)

spawn(function()
	while wait() do
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= localplayer then
				pcall(function()
					coroutine.wrap(function()
						for t = 1,1000 do
							v.Character.Head:FindFirstChild("handcuffedGui"):Destroy()
						end
					end)()
				end)
			end
		end
	end
end)

local removing = false

spawn(function()
	while wait() do
		pcall(function()
			if AntiCriminal then
				if game.Players.LocalPlayer.TeamColor.Name == "Really red" then
					local char = character
					local hum = char:FindFirstChildOfClass("Humanoid"):Clone()
					hum.Name = "Humanoid"
					char:FindFirstChildOfClass("Humanoid"):Destroy()
					hum.Parent = char
					usingcmd = true
					loadchar(BrickColor.new("Bright blue").Name)
					humroot.CFrame = CFrame.new(888, 100, 2388)
				end
			end
			if AntiArrest then
				if game.Players.LocalPlayer.Character:FindFirstChild("Head"):FindFirstChild("handcuffedGui") then
					teamevent("Medium stone grey")
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if FastPunch then
				getsenv(game.Players.LocalPlayer.Character.ClientInputHandler).cs.isFighting = false
				getsenv(game.Players.LocalPlayer.Character.ClientInputHandler).cs.isRunning = false
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if AntiTaser then
				local tazePlayer = getconnections(workspace.Remote.tazePlayer.OnClientEvent)
				for i,v in pairs(tazePlayer) do
					v:Disable()
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if states.viewing ~= nil then
				workspace.CurrentCamera.CameraSubject = states.viewing.Character
			end
		end)
	end
end)

localplayer.CharacterAdded:Connect(function()
	if localplayer.TeamColor.Name == "Medium stone grey" and states.stucking then
		wait(.5)
		game.Players.LocalPlayer.PlayerGui.Home.intro.Visible = false
		game.Players.LocalPlayer.PlayerGui.Home.hud.Visible = true
		workspace.CurrentCamera.FieldOfView = 70
		game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", true)
		game:GetService("StarterGui"):SetCoreGuiEnabled("Backpack", true)
		game:GetService("StarterGui"):SetCoreGuiEnabled("PlayerList", true)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			for i,v in pairs(players:GetPlayers()) do
				if v.Character:FindFirstChild("vest") then
					if AntiArmorSpam then
						for i = 1,25 do
							coroutine.wrap(function()
								v.Character:FindFirstChild("vest"):Destroy()
							end)()
						end
					end
				end
			end
		end)
	end
end)

if AntiCrash then
	local replicatedEvent = getconnections(game:GetService("ReplicatedStorage"):WaitForChild("ReplicateEvent").OnClientEvent)

	for i,v in pairs(replicatedEvent) do
		v:Disable()
	end
end

game:GetService("Workspace"):WaitForChild("Prison_ITEMS"):WaitForChild("single").ChildAdded:Connect(function(child)
	if child ~= nil and EspItem then
		local bill = Instance.new("BillboardGui", child)
		local text = Instance.new("TextLabel", bill)
		bill.AlwaysOnTop = true
		bill.Size = UDim2.new(2, 0, 1, 0)
		bill.ExtentsOffset = Vector3.new(0, 2, 0)
		text.Text = child.Name
		text.TextScaled = false
		text.TextSize = 16
		text.Font = Enum.Font.GothamBlack
		text.TextColor3 = Color3.fromRGB(0, 255, 255)
		text.BackgroundTransparency = 1.000
		text.Size = UDim2.new(1, 0, 1, 0)
		text.Name = "Title"
		bill.Name = "Billboard"
	end
end)

for _,plr in pairs(game.Players:GetPlayers()) do
	if plr ~= localplayer then
		repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Part")
		if plr ~= nil and EspName then
			local bill = Instance.new("BillboardGui", plr.Character)
			local text = Instance.new("TextLabel", bill)
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(2, 0, 1, 0)
			bill.ExtentsOffset = Vector3.new(0, 1, 0)
			text.Text = plr.DisplayName
			text.TextScaled = false
			text.TextSize = 16
			text.Font = Enum.Font.GothamBlack
			text.TextColor = plr.TeamColor
			text.BackgroundTransparency = 1.000
			text.Size = UDim2.new(1, 0, 1, 0)
			text.Name = "Title"
			bill.Name = "Billboard"
		end
		if plr ~= nil and EspChamber then
			for i,v in pairs(plr.Character:children()) do
				pcall(function()
					local box = Instance.new("BoxHandleAdornment", v)
					box.AlwaysOnTop = true
					box.Color3 = plr.TeamColor.Color
					box.AdornCullingMode = Enum.AdornCullingMode.Automatic
					box.Transparency = 0.750
					box.Visible = true
					box.Adornee = v
					box.ZIndex = 0
					box.Size = v.Size
					box.Name = "Box"
				end)
			end
		end
		plr.CharacterAdded:Connect(function(char)
			char:WaitForChild("HumanoidRootPart")
			repeat wait() until char ~= nil and char:FindFirstChildOfClass("Part")
			if plr ~= nil and EspName then
				local bill = Instance.new("BillboardGui", char)
				local text = Instance.new("TextLabel", bill)
				bill.AlwaysOnTop = true
				bill.Size = UDim2.new(2, 0, 1, 0)
				bill.ExtentsOffset = Vector3.new(0, 1, 0)
				text.Text = plr.DisplayName
				text.TextScaled = false
				text.TextSize = 16
				text.Font = Enum.Font.GothamBlack
				text.TextColor = plr.TeamColor
				text.BackgroundTransparency = 1.000
				text.Size = UDim2.new(1, 0, 1, 0)
				text.Name = "Title"
				bill.Name = "Billboard"
			end
			if plr ~= nil and EspChamber then
				for i,v in pairs(char:children()) do
					pcall(function()
						local box = Instance.new("BoxHandleAdornment", v)
						box.AlwaysOnTop = true
						box.Color3 = plr.TeamColor.Color
						box.AdornCullingMode = Enum.AdornCullingMode.Automatic
						box.Transparency = 0.750
						box.Visible = true
						box.Adornee = v
						box.ZIndex = 0
						box.Size = v.Size
						box.Name = "Box"
					end)
				end
			end
		end)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Wait()
	repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Part")
	if plr ~= nil and EspName then
		local bill = Instance.new("BillboardGui", plr.Character:WaitForChild("Head"))
		local text = Instance.new("TextLabel", bill)
		bill.AlwaysOnTop = true
		bill.Size = UDim2.new(2, 0, 1, 0)
		bill.ExtentsOffset = Vector3.new(0, 1, 0)
		text.Text = plr.DisplayName
		text.TextScaled = false
		text.TextSize = 16
		text.Font = Enum.Font.GothamBlack
		text.TextColor = plr.TeamColor
		text.BackgroundTransparency = 1.000
		text.Size = UDim2.new(1, 0, 1, 0)
		text.Name = "Title"
		bill.Name = "Billboard"
	end
	if plr ~= nil and EspChamber then
		for i,v in pairs(plr.Character:children()) do
			pcall(function()
				local box = Instance.new("BoxHandleAdornment", v)
				box.AlwaysOnTop = true
				box.Color3 = plr.TeamColor.Color
				box.AdornCullingMode = Enum.AdornCullingMode.Automatic
				box.Transparency = 0.750
				box.Visible = true
				box.Adornee = v
				box.ZIndex = 0
				box.Size = v.Size
				box.Name = "Box"
			end)
		end
	end
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("HumanoidRootPart")
		repeat wait() until char:FindFirstChildOfClass("Part") and char ~= nil
		if plr ~= nil and EspName then
			local bill = Instance.new("BillboardGui", char:WaitForChild("Head"))
			local text = Instance.new("TextLabel", bill)
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(2, 0, 1, 0)
			bill.ExtentsOffset = Vector3.new(0, 1, 0)
			text.Text = plr.DisplayName
			text.TextScaled = false
			text.TextSize = 16
			text.Font = Enum.Font.GothamBlack
			text.TextColor = plr.TeamColor
			text.BackgroundTransparency = 1.000
			text.Size = UDim2.new(1, 0, 1, 0)
			text.Name = "Title"
			bill.Name = "Billboard"
		end
		if EspChamber then
			for i,v in pairs(char:children()) do
				pcall(function()
					local box = Instance.new("BoxHandleAdornment", v)
					box.AlwaysOnTop = true
					box.Color3 = plr.TeamColor.Color
					box.AdornCullingMode = Enum.AdornCullingMode.Automatic
					box.Transparency = 0.750
					box.Visible = true
					box.Adornee = v
					box.ZIndex = 0
					box.Size = v.Size
					box.Name = "Box"
				end)
			end
		end
	end)
end)

spawn(function()
	while wait() do
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= localplayer then
				pcall(function()
					if v.Character.Head:FindFirstChild("Billboard") then
						v.Character.Head.Billboard.Title.TextColor = v.TeamColor
						v.Character.Head.Billboard.Title.Text = v.DisplayName
					end
				end)
			end
		end
	end
end)

localplayer.CharacterAdded:Connect(function()
	if AutoGunWhenRepspawn then
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
		if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(localplayer.UserId, 96651) then
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
		end
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
		if AutoModTheGunInYourBackpackWhenRespawn then
			local Remington_870 = character:FindFirstChild("Remington 870") or backpack:FindFirstChild("Remington 870")
			local AK_47 = character:FindFirstChild("AK-47") or backpack:FindFirstChild("AK-47")
			local M4A1
			if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(localplayer.UserId, 96651) then
				M4A1 = character:FindFirstChild("M4A1") or backpack:FindFirstChild("M4A1")
			end
			local M9 = character:FindFirstChild("M9") or backpack:FindFirstChild("M9")
			local Taser
			if character:FindFirstChild("Taser") or backpack:FindFirstChild("Taser") then
				Taser = character:FindFirstChild("Taser") or backpack:FindFirstChild("Taser")
			end
			for i,v in pairs(backpack:GetChildren()) do
				if v:IsA("Tool") then
					local canHave = Instance.new("BoolValue", v)
					canHave.Value = true
					canHave.Name = "CanHave"
				end
			end
			local GUNS = {
				Remington_870,
				AK_47,
				M4A1,
				M9,
				Taser
			}
			for i,v in pairs(GUNS) do
				if v ~= nil then
					local req = require(v:FindFirstChild("GunStates"))
					req["ReloadTime"] = -math.huge
					req["FireRate"] = -math.huge
					req["AutoFire"] = true
					req["StoredAmmo"] = math.huge
					req["AmmoPerClip"] = math.huge
					req["CurrentAmmo"] = math.huge
					req["MaxAmmo"] = math.huge
					local canHave = Instance.new("BoolValue", v)
					canHave.Value = true
					canHave.Name = "CanHave"
				end
			end
		end
	end
	if AutoBToolsWhenRespawn then
		local HopperBin = Instance.new("HopperBin", backpack)
		HopperBin.BinType = 4
		HopperBin = Instance.new("HopperBin", backpack)
		HopperBin.BinType = 3
		HopperBin = Instance.new("HopperBin", backpack)
		HopperBin.BinType = 2
	end
end)

if DeleteCriminalPads then
	for i,v in pairs(workspace["Criminals Spawn"]:children()) do
		v.Parent = game.Lighting
	end
end

spawn(function()
	while wait() do
		coroutine.wrap(function()
			pcall(function()
				local Remington_870 = character:FindFirstChild("Remington 870") or backpack:FindFirstChild("Remington 870")
				local AK_47 = character:FindFirstChild("AK-47") or backpack:FindFirstChild("AK-47")
				local M4A1
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(localplayer.UserId, 96651) then
					M4A1 = character:FindFirstChild("M4A1") or backpack:FindFirstChild("M4A1")
				end
				local M9 = character:FindFirstChild("M9") or backpack:FindFirstChild("M9")
				local Taser
				if character:FindFirstChild("Taser") or backpack:FindFirstChild("Taser") then
					Taser = character:FindFirstChild("Taser") or backpack:FindFirstChild("Taser")
				end
				local Guns = {
					Remington_870,
					AK_47,
					M4A1,
					M9,
					Taser
				}
				for i,v in pairs(Guns) do
					local req = require(v:FindFirstChild("GunStates"))
					for t = 1,2 do
						game:GetService("ReplicatedStorage"):WaitForChild("ReloadEvent"):FireServer(v)
						wait(.5)
					end
				end
			end)
		end)()
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if AntiFling then
		local plr = game:GetService('Players')
		local me = plr.LocalPlayer
		for i,v in pairs(plr:GetPlayers()) do
			if v ~= me then
				local char = v.Character
				if char then
					for _,p in pairs(char:GetChildren()) do
						pcall(function()
							p.CanCollide = false
							if p:FindFirstChild("Handle") then
								p.Handle.CanCollide = false
							end
						end)
					end
				end
			end
		end
	end
end)

game:GetService("RunService").RenderStepped:connect(function()
	if states.timeout then
		local events = {}
		for i = 1,1000 do
			events[#events + 1] = {
				Hit = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part"),
				Distance = 0,
				Cframe = CFrame.new(),
				RayObject = Ray.new(Vector3.new(), Vector3.new())
			}
		end
		local gun = nil
		for _,v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):children()) do
			if v:IsA("Tool") and v.Name ~= "Taser" and v:FindFirstChild("GunStates") and gun == nil then
				gun = v
			end
		end
		if gun == nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:children()) do
				if v:IsA("Tool") and v.Name ~= "Taser" and v:FindFirstChild("GunStates") and gun == nil then
					gun = v
				end
			end
		end
		game:GetService("ReplicatedStorage"):WaitForChild("ShootEvent"):FireServer(events, gun)
	end
end)

for i,v in pairs(game.Players:GetPlayers()) do
	if SaveYourMessageToChatLogs then
		v.Chatted:Connect(function(msg)
			if #chatlogs > MaxChatLogsSaves then
				chatlogs[1] = nil
				for i = 1,#chatlogs do
					if i ~= 1 then
						chatlogs[i-1] = {
							plr = chatlogs[i].plr,
							chat = chatlogs[i].chat,
							clocktime = chatlogs[i].clocktime
						}
					end
				end
			end
			chatlogs[#chatlogs + 1] = {
				plr = v,
				chat = msg,
				clocktime = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Home").hud.ClockFrame.tl.Text
			}
		end)
	else
		if v ~= localplayer then
			v.Chatted:Connect(function(msg)
				if #chatlogs > MaxChatLogsSaves then
					chatlogs[1] = nil
					for i = 1,#chatlogs do
						if i ~= 1 then
							chatlogs[i-1] = {
								plr = chatlogs[i].plr,
								chat = chatlogs[i].chat,
								clocktime = chatlogs[i].clocktime
							}
						end
					end
				end
				chatlogs[#chatlogs + 1] = {
					plr = v,
					chat = msg,
					clocktime = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Home").hud.ClockFrame.tl.Text
				}
			end)
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if #chatlogs > MaxChatLogsSaves then
			chatlogs[1] = nil
		end
		chatlogs[#chatlogs + 1] = {
			plr = plr,
			chat = msg,
			clocktime = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Home").hud.ClockFrame.tl.Text
		}
	end)
end)

spawn(function()
	while wait() do
		pcall(function()
			localplayer:WaitForChild("Status"):WaitForChild("isBadGuard").Value = false
			localplayer:WaitForChild("Status"):WaitForChild("toolIsEquipped").Value = false
			localplayer:WaitForChild("Status"):WaitForChild("playerCell").Value = nil
		end)
	end
end)

INPUT.FocusLost:Connect(function()
	if INPUT.Text:sub(1,1) ~= prefix then
		usecmd(prefix..INPUT.Text)
	else
		usecmd(INPUT.Text)
	end
	wait()
	INPUT.Text = ""
	INPUT_HANDLER.Text = ""
	CloseInput()
end)

for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
	if v:IsA("SpawnLocation") then
		v.AllowTeamChangeOnTouch = false
		v.CanCollide = false
	end
end

pcall(function()
	savepos()
	loadchar(BrickColor.random().Name)
	wait(.1)
	usingcmd = true
	loadpos()
	local cellBlock = game:GetService("Workspace"):FindFirstChild("Prison_Cellblock")
	if cellBlock then
		local cellDoor = cellBlock:FindFirstChild("doors")
		if cellDoor and DeleteDoors then
			game:GetService("Workspace"):WaitForChild("Prison_Cellblock"):WaitForChild("doors").Parent = game:GetService("Lighting")
		end
	end
	local door = game:GetService("Workspace"):FindFirstChild("Doors")
	if door and DeleteDoors then
		game:GetService("Workspace"):FindFirstChild("Doors").Parent = game:GetService("Lighting")
	end
	if ShowSpawnPads then
		for _,models in pairs(game:GetService("Workspace"):WaitForChild("Prison_spawn"):GetChildren()) do
			for _,spawns in pairs(models:GetChildren()) do
				if spawns:IsA("SpawnLocation") then
					spawns.Transparency = 0.750
					spawns.FrontSurface = Enum.SurfaceType.Smooth
				end
			end
		end
	end
end)

getgenv().reScript = function()
	states = {}
	loopkill = {}
	admins = {}
	killaura = {}
	chatlogs = {}
	connections = {}
	antiTouch = {}
	ADMINGUI:Destroy()
	Crash = false
	DeleteDoors = false
	EspChamber = false
	EspName = false
	EspItem = false
	ShowNotification = false
	ShowSpawnPads = false
	MaxChatLogsSaves = 0 
	SaveYourMessageToChatLogs = false
	AutoRespawnOnDie = false
	AutoGunWhenRepspawn = false
	AutoBToolsWhenRespawn = false
	AutoModTheGunInYourBackpackWhenRespawn = false
	AntiFling = false
	AntiCriminal = false
	AntiArrest = false
	DeleteCriminalPads = false
	AntiCrash = false
	AntiArmorSpam = false
	AntiBring = false
	MaxAntiBringDistance = 100
	FastPunch = false
	AntiTaser = false
	InfStamina = false
	AntiTeamChange = false
	AnimatedGui = false
	GuiAnimatedSpeed = 0
	GuiClosePosition = UDim2.new(0., 0, 0, 0)
	GuiOpenPosition = UDim2.new(0, 0, 0, 0)
	for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
		if v.Name  == "doors" then
			v.Parent = game:GetService("Workspace"):FindFirstChild("Prison_Cellblock")
		elseif v.Name == "Doors" then
			v.Parent = game:GetService("Workspace")
		else
			v.Parent = game:GetService("Workspace"):FindFirstChild("Criminals Spawn")
		end
	end
	chatnotify("Success, Reloaded admin")
end
