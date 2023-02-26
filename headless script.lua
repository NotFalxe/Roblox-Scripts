--HEADLESS SCRIPT
local hidehead = 0 -- Transparency If you don't like your head visible


--load
if not game['Loaded'] or not game:GetService('Players')['LocalPlayer'] then
    game['Loaded']:Wait();
    game:WaitForChild(game:GetService('Players'));
    game:GetService('Players'):WaitForChild(game:GetService('Players').LocalPlayer.Name)
end
--end
wait()
repeat game:GetService("RunService").Stepped:Wait() until not game:GetService("Players").LocalPlayer.Character:FindFirstChild("ForceField")
wait()

game.Players.LocalPlayer.Character.Head.Neck:Destroy()
game.Players.LocalPlayer.Character.Head.face:Destroy()
game.Players.LocalPlayer.Character.Head.Transparency = hidehead
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame = CFrame.new(0, 0.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)



--MAKE HEAD STUCK
l = Instance.new("Attachment",game.Players.LocalPlayer.Character.Head)
ll = Instance.new("Attachment",game.Players.LocalPlayer.Character.UpperTorso)
o = Instance.new("AlignOrientation",l)
o.Attachment0 = l
o.Attachment1 = ll
o.ReactionTorqueEnabled = true
o.PrimaryAxisOnly = false
o.MaxTorque = 9999999
o.MaxAngularVelocity = math.huge
o.Responsiveness = 200
--end1
