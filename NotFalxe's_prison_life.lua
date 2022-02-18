local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua'))()
local Window = Library.CreateLib('Prison Life', 'Midnight')

getgenv().godmode = false
getgenv().noclip = false
getgenv().alerts = false
getgenv().changedwalkspeed = false
getgenv().walkspeed = 0
getgenv().changedjumppower = false
getgenv().jumppower = 0
getgenv().changedhipheight = false
getgenv().hipheight = 0
getgenv().onepunch = false

-- MAIN
local Main = Window:NewTab('Main')
local MainSection = Main:NewSection('Main')


MainSection:NewButton('Give All Items','Gives all items to the localplayer', function(v)
    for i,v in pairs(game.Workspace.Prison_ITEMS.single:GetChildren()) do
        if v:FindFirstChild('ITEMPICKUP') then
            game.Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
        end
    end
    
    for i,v in pairs(game.Workspace.Prison_ITEMS.giver:GetChildren()) do
        if v:FindFirstChild('ITEMPICKUP') then
            game.Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
        end
    end
end)


-- TEAMS

MainSection:NewDropdown('Change Team','Changes your team',{'Criminal','Neutral','Guard','Inmate'},function(v)
    if v == 'Criminal' then
        local weld02 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(weld02)
    elseif v == 'Inmate' then
        game.Workspace.Remote.TeamEvent:FireServer('Bright orange')
    elseif v == 'Guard' then
        game.Workspace.Remote.TeamEvent:FireServer('Bright blue')
    elseif v == 'Neutral' then
        game.Workspace.Remote.TeamEvent:FireServer('Medium stone grey')
    end
end)


-- PLAYER
local Player = Window:NewTab('Player')
local PlayerSection = Player:NewSection('Player')
PlayerSection:NewSlider('WalkSpeed', 'Changes how fast you walk.', 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

PlayerSection:NewSlider('JumpPower', 'Changes how high you jump.', 250, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

PlayerSection:NewToggle('Noclip (PRESS E)','Allows you to walk through wall.', function(v)
    
    
    noclip = false
    game:GetService('RunService').Stepped:connect(function()
    if noclip then
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
    if key == "e" then
    noclip = not noclip
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)
    game.StarterGui:SetCore("SendNotification", {
    Title = "Noclip";
    Text = "Loaded.";
    Duration = "10";
    })
    wait(1)
    game.StarterGui:SetCore("SendNotification", {
    Title = "Noclip";
    Text = "Press E To Noclip";
    Duration = "10";
    }) = v


end)
