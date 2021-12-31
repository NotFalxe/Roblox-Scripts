local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local Lib = loadstring(game:HttpGet('https://pastebin.com/raw/GaRF4FDA'))()
local CategoryVariableHere= Lib:Category("Knife Simulator")
CategoryVariableHere:Button("Autofarm",function() 
    while wait() do
 
local args = {
    [1] = "hit",
    [2] = {}
}
 
game:GetService("ReplicatedStorage").forhackers:InvokeServer(unpack(args))
 
local args = {
    [1] = "throw",
    [2] = CFrame.new(Vector3.new(-85.16625213623, 100.0666809082, -17.599998474121), Vector3.new(-0.62112283706665, -0.2661966085434, -0.7371199131012))
}
game:GetService("ReplicatedStorage").forhackers:InvokeServer(unpack(args))
end 
  if player.Character then
if player.Character:FindFirstChild("Humanoid") then
player.Character.Humanoid.Name = "1"
end
local l = player.Character["1"]:Clone()
l.Parent = player.Character
l.Name = "Humanoid"; wait(0.1)
player.Character["1"]:Destroy()
workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
player.Character.Animate.Disabled = true; wait(0.1)
player.Character.Animate.Disabled = false
end
end)


CategoryVariableHere:Button("SlientAim/AimBot",function() 
local plrs = game:service("Players")
local ms = plrs.LocalPlayer:GetMouse()
local nearest = function()
local plr,dist = nil,5000
for k,l in pairs(plrs:GetPlayers()) do
local pos = l.Character:GetPrimaryPartCFrame().p
local len = (ms.Hit.p - pos).Magnitude
if len <= dist then
plr = l
dist = len
end
end
return plr.Character:GetPrimaryPartCFrame().p
end
workspace.CurrentCamera.trash.ChildAdded:connect(function(c)
c.CFrame = CFrame.new(nearest())
end) end)
CategoryVariableHere:Button("Esp",function() 
    local plrs = game:service'Players';

local function epic_esp(model)
local human = model:WaitForChild('Humanoid',5);
if human then
human.HealthDisplayDistance = math.huge;
human.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn;
human.NameDisplayDistance = math.huge;
human.NameOcclusion = Enum.NameOcclusion.NoOcclusion;
end;
end;

for _,p in next,plrs:GetPlayers() do
if p.Character~=nil then epic_esp(p.Character) end;
p.CharacterAdded:Connect(function(c) epic_esp(c) end);
end;

plrs.PlayerAdded:Connect(function(p)
p.CharacterAdded:Connect(function(c) epic_esp(c) end) ;
end);
end)
local CategoryVariableHere= Lib:Category("Credits")
CategoryVariableHere:Label("Credits to a r q for ui liba")
CategoryVariableHere:Label("Credits to DekuDimz#0734 aka me lol") Lib:Reload()
