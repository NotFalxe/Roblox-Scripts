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


MainSection:NewDropdown('Give Guns', 'Gives the localplayer guns.', {'M9', 'Remington 870', 'AK-47'}, function(v)
    local A_1 = game:GetService('Workspace')['Prison_ITEMS'].giver[v].ITEMPICKUP
    local Event = game:GetService('Workspace').Remote.ItemHandler
    Event:InvokeServer(A_1)
end)


MainSection:NewButton("Remove Doors","Removes All Doors",function()
    game.Workspace.Doors:Destroy()
    game.Workspace.Prison_Cellblock.doors:Destroy()
    local Warehouses = game.Workspace.Warehouses
    for i,v in pairs(Warehouses:GetDescendants()) do
        if v.Name == "doors" then
           v:Destroy()
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

PlayerSection:NewToggle("Super Punch","Kills anyone with one punch",function(state)
    getgenv().onepunch = state
end)
