local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua'))()







function prison_life()
    local Window = Library.CreateLib("Falxe's Prison Life", 'Midnight')

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



    -- Functions

    game:GetService('RunService').RenderStepped:Connect(function()
        if game.Players.LocalPlayer.Character.Humanoid.Health == 0 and getgenv().godmode then
            local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            game.Workspace.Remote.loadchar:InvokeServer(game.Players.LocalPlayer.Name)  
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        end
        if getgenv().noclip then
            if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
                game.Players.LocalPlayer.Character:FindFirstChild('Humanoid'):ChangeState(11)
            end
        end
        if getgenv().changedwalkspeed then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walkspeed
        end
        if getgenv().changedjumppower then
            game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = getgenv().jumppower
        end
        if getgenv().changedhipheight then
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = getgenv().hipheight
        end
    end)

            mainRemotes = game.ReplicatedStorage
    meleeRemote = mainRemotes['meleeEvent']
    mouse = game.Players.LocalPlayer:GetMouse()
    punching = false
    cooldown = false

    function punch()
    cooldown = true
    local part = Instance.new('Part', game.Players.LocalPlayer.Character)
    part.Transparency = 1
    part.Size = Vector3.new(5, 2, 3)
    part.CanCollide = false
    local w1 = Instance.new('Weld', part)
    w1.Part0 = game.Players.LocalPlayer.Character.Torso
    w1.Part1 = part
    w1.C1 = CFrame.new(0,0,2)
    part.Touched:connect(function(hit)
    if game.Players:FindFirstChild(hit.Parent.Name) then
    local plr = game.Players:FindFirstChild(hit.Parent.Name)
    if plr.Name ~= game.Players.LocalPlayer.Name then
    part:Destroy()

    for i = 1,100 do
    meleeRemote:FireServer(plr)
    end
    end
    end
    end)

    wait(1)
    cooldown = false
    part:Destroy()
    end


    mouse.KeyDown:connect(function(key)
    if cooldown == false then
    if key:lower() == 'f' then

    if getgenv().onepunch then
    punch()
    end
    end
    end
    end)


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


    if getgenv().kill then
    kill()
    end


    -- Main

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


    MainSection:NewButton('Remove Doors','Removes All Doors',function()
        game.Workspace.Doors:Destroy()
        game.Workspace.Prison_Cellblock.doors:Destroy()
        local Warehouses = game.Workspace.Warehouses
        for i,v in pairs(Warehouses:GetDescendants()) do
            if v.Name == 'doors' then
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

    PlayerSection:NewTextBox('HipHeight','Sets your HipHeight',function(txt)
        getgenv().changedhipheight = true
        if tonumber(txt) then
            getgenv().hipheight = tonumber(txt)
        end
    end)


    PlayerSection:NewButton('Fly (Flight [E])','Allows you to fly', function()
        function FLY()
            FLYING = true
            local BG = Instance.new('BodyGyro')
            local BV = Instance.new('BodyVelocity')
            BG.P = 9e4
            BG.Parent = T
            BV.Parent = T
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(function()
                repeat wait()
                    if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                    end
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    else
                        BV.velocity = Vector3.new(0, 0, 0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()
                if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                end
            end)
        end
        flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 's' then
                CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 'a' then
                CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 'd' then 
                CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
            elseif QEfly and KEY:lower() == 'e' then
                CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
            elseif QEfly and KEY:lower() == 'q' then
                CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end)
        flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 0
            elseif KEY:lower() == 's' then
                CONTROL.B = 0
            elseif KEY:lower() == 'a' then
                CONTROL.L = 0
            elseif KEY:lower() == 'd' then
                CONTROL.R = 0
            elseif KEY:lower() == 'e' then
                CONTROL.Q = 0
            elseif KEY:lower() == 'q' then
                CONTROL.E = 0
            end
        end)
        FLY()
    end)




    -- Teleports Section
    local Teleports = Window:NewTab('Teleports')
    local TeleportsSection = Teleports:NewSection('Teleports')

    TeleportsSection:NewButton('Criminal Base','Teleports to the Criminal Base.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-859.15161132813, 94.476051330566, 2058.5427246094)
    end)

    TeleportsSection:NewButton('Downtown','Teleports you to DownTown.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-300.44033813477, 54.175037384033, 1781.2364501953)
    end)

    TeleportsSection:NewButton('Entrance Gate','Teleports you to the entrance gate.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(491.27182006836, 98.039939880371, 2216.3107910156)
    end)

    TeleportsSection:NewButton('Entrance','Teleports you to the entrance of prison.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(653.81713867188, 99.990005493164, 2272.083984375)
    end)

    TeleportsSection:NewButton('Yard','Teleports you to the prison yard.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(781.6845703125, 97.999946594238, 2462.8779296875)
    end)

    TeleportsSection:NewButton('Hallway','Teleports you to the prison hallway.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(860.78448486328, 99.990005493164, 2362.9597167969)
    end)

    TeleportsSection:NewButton('Cell Block','Teleports you to the cell block.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.43115234375, 99.989990234375, 2440.3828125)
    end)

    TeleportsSection:NewButton('Cafeteria','Teleports you to the cafeteria.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(932.06213378906, 99.989959716797, 2290.4250488281)
    end)

    TeleportsSection:NewButton('Armory','Teleports you to the armory.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(835.28918457031, 99.990005493164, 2285.4909667969)
    end)

    TeleportsSection:NewButton('Guards Only','Teleports you to the guards only room.',function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(830.04302978516, 99.990005493164, 2327.0859375)
    end)


    -- OTHER (other stuff here)
    local Other = Window:NewTab('Other')
    local OtherSection = Other:NewSection('Other')

    OtherSection:NewToggle('Super Punch','Kills anyone with one punch.',function(state)
        getgenv().onepunch = state
    end)


    OtherSection:NewTextBox('Arrest Player', 'Arrest the player.', function(txt)
        if txt == 'all' then
            for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    i = 0
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                        game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                        i = i + 1
                    until i == 10
                end
            end
        else
            local plr = findplayer(txt)
            if plr then
                local i = 0
                repeat wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                    game.Workspace.Remote.arrest:InvokeServer(plr.Character.HumanoidRootPart)
                    i = i + 1
                until i == 10
            end
        end
    end)

    OtherSection:NewTextBox('Goto Player', 'Teleports to the player.', function(txt)
        local plr = findplayer(txt)
        if plr then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
        end
    end)
end




























    -- YESSIR WE ARE BACK TO MM2

-- MM2

function MM2()
    local Window = Library.CreateLib("Falxe's MM2", 'Midnight')




    local Main = Window:NewTab('Main')
    local MainSection = Main:NewSection('Main')
    local Player = Window:NewTab('Player')
    local PlayerSection = Player:NewSection('Player')
    local Emotes = Window:NewTab('Emotes')
    local EmotesSection = Emotes:NewSection('Emotes')
    local Misc = Window:NewTab('Misc')
    local MiscSection = Misc:NewSection('Misc')

    getgenv().changedwalkspeed = false
    getgenv().walkspeed = 0
    getgenv().changedjumppower = false
    getgenv().jumppower = 0



    -- MAIN



    MainSection:NewToggle('Murder & Sherrif ESP', 'Gives murder and sheriff esp.', function()
        function getChance()
        local Event = game:GetService("ReplicatedStorage").GetChance
        chance = Event:InvokeServer()[1]
        return chance
        end
        
        
        function setESP(part, good)
        if part:FindFirstChild("BoxHandleAdornment") then else
            local ESP = Instance.new("BoxHandleAdornment")
            if good then
                ESP.Color3 = Color3.fromRGB(17, 164, 255)
            else
                ESP.Color3 = Color3.fromRGB(255, 0, 0)
            end
            ESP.ZIndex = 1
            ESP.AlwaysOnTop = true
            ESP.Size = part.Size
            ESP.Transparency = 0.5
            ESP.Adornee = part
            ESP.Parent = part
        end
        end
        
        function getMurderer()
        
        local Event = game:GetService("ReplicatedStorage").GetPlayerData
        local info = Event:InvokeServer()
        
        
        
        for i,v in pairs(game.Players:GetChildren()) do
        if info[v.Name] ~= nil then
        if info[v.Name]["Role"] == "Murderer" then
        return v
        end
        end
        end
        end
        
        function getSheriff()
        local Event = game:GetService("ReplicatedStorage").GetPlayerData
        local info = Event:InvokeServer()
        
        
        
        for i,v in pairs(game.Players:GetChildren()) do
        if info[v.Name] ~= nil then
        if info[v.Name]["Role"] == "Sheriff" then
        return v
        end
        end
        end
        end
        
        function espMurderer()
        if getMurderer() ~= nil then
            for i,v in pairs(getMurderer().Character:GetChildren()) do
                if v:IsA("BasePart") then
                    setESP(v,false)
                end
            end
        end
        end
        
        function espSheriff()
        if getSheriff() ~= nil then
            for i,v in pairs(getSheriff().Character:GetChildren()) do
                if v:IsA("BasePart") then
                    setESP(v,true)
                end
            end
        end
        end
        
        espSheriff()
        espMurderer()
        end)



    MainSection:NewToggle('Coin Farm (With God Mode)', 'Lets you coin farm with god mode.', function(v)
        getgenv().CoinFarm = v
        if getgenv().CoinFarm then
            getgenv().TpDelay = 2
        loadstring(game:HttpGet('https://gist.githubusercontent.com/TurkOyuncu99/6cbdf3cd3182d2889d2af766da9a2286/raw/3b3872fa207a24a6e78fc4b5a07c37cead7842df/casgg'))()
    end
    end)



    MainSection:NewDropdown('Open Crates', 'Opens crates/boxes', {'KnifeBox1', 'KnifeBox2', 'KnifeBox3', 'KnifeBox4', 'KnifeBox5', 'MLGBox'}, function(autobox)
        local args = {
        [1] = autobox
        }
        game:service'ReplicatedStorage'.Remotes.Shop.OpenCrate:InvokeServer(unpack(args))
        wait()
        game:service'ReplicatedStorage'.CrateComplete:FireServer()
    end)


    function findplayers() --Find all players but local player
        espMurderer() --Finds murderer
        espSheriff() --Finds sheriff
        local colors1 = 0
        local colors2 = 255
        local colors3 = 0
        for i, v in pairs(game:GetService("Players"):GetChildren()) do
            if v ~= game:GetService("Players").LocalPlayer then --If not local player
                if v.Name ~= murderer then --If not murderer
                    if v.Name ~= sheriff then --If not sheriff
                        if espnames == true then
                            local teamname = v.Name
                            if v.Character.Head ~= nil then --Tried to failproof to stop printing nil
                                Create(v.Character.Head, false, colors1 ,colors2, colors3, teamname)
                            else
                                if printvar == true then
                                    print("Head missing from sheriff!")
                                end
                            end
                        elseif espnames == false then
                            local teamname = "Innocents"
                            if v.Parent.Head ~= nil then --Tried to failproof to stop printing nil
                                Create(v.Character.Head, false, colors1 ,colors2, colors3, teamname)
                            else
                                if printvar == true then
                                    print("Head missing from sheriff!")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    



    MainSection:NewToggle('All ESP', 'Shows ESP for everyone.', function()
        CreateEsp()
    end)


    




    -- PLAYER


    if getgenv().changedwalkspeed then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walkspeed
    end
    if getgenv().changedjumppower then
        game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = getgenv().jumppower
    end



    PlayerSection:NewSlider('WalkSpeed', 'Changes how fast you walk.', 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider('JumpPower', 'Changes how high you jump.', 250, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)


    PlayerSection:NewButton('God Mode', 'Gives you God Mode.', function()
        game.Players.LocalPlayer.Character.Humanoid:Remove()
        Instance.new('Humanoid', game.Players.LocalPlayer.Character)
        game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass('Humanoid').HipHeight = 2
    end)

    PlayerSection:NewButton('Invisible + GodMode', 'Makes you invisible and God Mode.', function()
        game.Players.LocalPlayer.Character.Humanoid:Remove()
        Instance.new('Humanoid', game.Players.LocalPlayer.Character)
        game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass('Humanoid').HipHeight = 2
        wait(0.30)
        game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
        game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
        game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
        game.Players.LocalPlayer.Character.LowerTorso:Destroy()
        game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
        game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
        game.Players.LocalPlayer.Character.Head:Destroy()
        game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
        game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
        game.Players.LocalPlayer.Character.LeftFoot:Destroy()
        game.Players.LocalPlayer.Character.LeftLowerLeg:Destroy()
        game.Players.LocalPlayer.Character.RightFoot:Destroy()
        game.Players.LocalPlayer.Character.RightLowerLeg:Destroy()
        game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
        game.Players.LocalPlayer.Character.UpperTorso:Destroy()
        game.Players.LocalPlayer.Character.Torso:Destroy()
        game.Players.LocalPlayer.Character.LowerTorso:Destroy()
        game.Players.LocalPlayer.Character.UpperTorso:Destroy()
        game.Players.LocalPlayer.Character.Head:Destroy()
    end)


    PlayerSection:NewButton('Noclip [GUI]', 'Allows you to noclip, or otherwise called walk through walls.', function()
        nclip = loadstring(game:HttpGet('https://pastebin.com/raw/9LBsfRkD'))()
        print(nclip)
    end)


    PlayerSection:NewToggle('Invisible', 'Makes you invisible.', function(omg)
        getgenv().trinkets = omg
    if getgenv().trinkets then
    game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(omg)
    else
    game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(false)
    end
    end)


PlayerSection:NewToggle('Infinite Jump', 'Gives you infinite jumps', function()
    local InfiniteJumpEnabled = true
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfiniteJumpEnabled then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)










    -- EMOTES


    EmotesSection:NewButton('Sit', 'Makes you do the sit emote.', function()
        local string_1 = 'sit';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton('Ninja Rest', 'Makes you do the ninja rest emote.', function()
        local string_1 = 'ninja';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton('Floss', 'Makes you do the floss emote.', function()
        local string_1 = 'floss';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton('Dab', 'Makes you do the dab emote.', function()
        local string_1 = 'dab';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton('Zombie', 'Makes you do the zombie emote.', function()
        local string_1 = 'zombie';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton('Zen', 'Makes you do the zen emote.', function()
        local string_1 = 'zen';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton('Headless', 'Makes you do the headless emote.', function()
        local string_1 = 'headless';
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)









    -- MISC
    MiscSection:NewButton('Tp to gun', 'Teleports you to the gun.', function()
        game.Workspace.GunDrop.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
    end)


end




if game.PlaceId == 155615604 then
    prison_life()
elseif game.PlaceId == 142823291 then
    MM2()
end
