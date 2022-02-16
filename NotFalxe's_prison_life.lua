local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Prison Life", "Midnight")

-- MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection('Main')
MainSection:NewDropdown("Give Gun", "Gives Player Gun", {"M9", "Remington 870", "AK-47"}, function(v)
    local A_1 = game:GetService('Workspace')['Prison_ITEMS'].giver[v].ITEMPICKUP
    local Event = game:GetService('Workspace').Remote.itemHandler
    Event:InvokeServer(A_1)
end)



-- PLAYER
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk.", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

PlayerSection:NewSlider("JumpPower", "Changes how high you jump.", 250, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

PlayerSection:NewKeybind("Noclip (press f on keyboard)", "Lets you walk through walls", Enum.KeyCode.F, function()
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end)


--//END
notif('Created by NotFalxe. Enjoy!', 5)
