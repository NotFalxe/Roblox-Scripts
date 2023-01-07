if game.PlaceId == 2788229376 then
    if getgenv().L_15 == true then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Speed Glitch";
            Text = "Already Executed";
        })
        return
    end
    getgenv().L_15 = true -- dont change me
    
    getgenv().Notification = true
    getgenv().AutoMacro = false
    getgenv().Macro = true
    getgenv().AutoMacroKey = Enum.KeyCode.Z
    getgenv().MacroKey = Enum.KeyCode.X
    getgenv().MacroMode = "Mouse" -- Keyboard, Mouse
    getgenv().GodMacro = true
    getgenv().GodMacroKey = Enum.KeyCode.C
    getgenv().GodMacroAuto = false

    if AutoMacro == true then
        game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if chatting then
                    IsChatting = true
                else
                    IsChatting = false
                end
                if input.KeyCode == AutoMacroKey then
                    if IsChatting ~= false then
                        return
                    end
                    if not AutoMacroToggle then
                        if Notification == true then
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "AutoMacro";
                                Text = "AutoMacro: On";
                            })
                        end
                        AutoMacroToggle = true
                        Instance.new("Animation", game:GetService("ReplicatedStorage"):findFirstChild("ClientAnimations")).Name = 'Greet'
                        game:GetService("ReplicatedStorage"):findFirstChild("ClientAnimations"):findFirstChild("Greet").AnimationId = 'rbxassetid://3189777795'
                        local Greet = game.ReplicatedStorage.ClientAnimations.Greet
                        local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                        local Animation = Humanoid:LoadAnimation(Greet)
                        Animation:Play()
                        wait(1.6)
                        for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                            if v:IsA("Tool") and v.Name ~= "Combat" or v.Name ~= "[Boombox]" then
                                game:GetService("Players").LocalPlayer.Character:findFirstChildOfClass'Humanoid':EquipTool(v)
                            end
                        end
                        wait()
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "S", false, game)
                        spawn(function()
                            if MacroMode == "Keyboard" then
                                while AutoMacroToggle == true do
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                end
                            elseif MacroMode == "Mouse" then
                                while AutoMacroToggle == true do
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                end
                            end
                        end)
                        Animation:Stop()
                        Macro =
                            game:service'Players'.LocalPlayer.Character:findFirstChildOfClass'Humanoid'.Running:Connect(function()
                                Animation:Stop()
                            end)
                    else
                        if Notification == true then
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "AutoMacro";
                                Text = "AutoMacro: Off";
                            })
                        end
                        AutoMacroToggle = false
                        local Greet = game.ReplicatedStorage.ClientAnimations.Greet
                        local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                        local Animation = Humanoid:LoadAnimation(Greet)
                        Animation:Stop()
                        game:GetService("ReplicatedStorage"):findFirstChild("ClientAnimations"):findFirstChild("Greet"):Remove()
                        Macro:Disconnect()
                    end
                end
            end
        end)
    end

    if Macro == true then
        game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if chatting then
                    IsChatting = true
                else
                    IsChatting = false
                end
                if input.KeyCode == MacroKey then
                    if IsChatting ~= false then
                        return
                    end
                    if not MacroToggle then
                        if Notification == true then
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "Macro";
                                Text = "Macro: On";
                            })
                        end
                        MacroToggle = true
                        spawn(function()
                            if MacroMode == "Keyboard" then
                                while MacroToggle == true do
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    wait()
                                end
                            elseif MacroMode == "Mouse" then
                                while MacroToggle == true do
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait()
                                end
                            end
                        end)
                    else
                        if Notification == true then
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "Macro";
                                Text = "Macro: Off";
                            })
                            MacroToggle = false
                        end
                    end
                end
            end
        end)
    end
    if GodMacro == true then
        game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if chatting then
                    IsChatting = true
                else
                    IsChatting = false
                end
                if input.KeyCode == GodMacroKey then
                    if IsChatting ~= false then
                        return
                    end
                    if not GodMacroToggle then
                        if Notification == true then
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "GodMacro";
                                Text = "GodMacro: On";
                            })
                        end
                        GodMacroToggle = true
                        if GodMacroAuto == true then
                            Instance.new("Animation", game:GetService("ReplicatedStorage"):findFirstChild("ClientAnimations")).Name = 'Greet'
                            game:GetService("ReplicatedStorage"):findFirstChild("ClientAnimations"):findFirstChild("Greet").AnimationId = 'rbxassetid://3189777795'
                            local Greet = game.ReplicatedStorage.ClientAnimations.Greet
                            local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                            local Animation = Humanoid:LoadAnimation(Greet)
                            Animation:Play()
                            wait(1.6)
                            for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                                if v:IsA("Tool") and v.Name ~= "Combat" or v.Name ~= "[Boombox]" then
                                    game:GetService("Players").LocalPlayer.Character:findFirstChildOfClass'Humanoid':EquipTool(v)
                                end
                            end
                            wait()
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "S", false, game)
                        end
                        spawn(function()
                            if MacroMode == "Keyboard" then
                                while GodMacroToggle == true do
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                end
                            elseif MacroMode == "Mouse" then
                                while GodMacroToggle == true do
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    game:GetService("RunService").Heartbeat:wait()
                                end
                            end
                        end)
                        if GodMacroAuto == true then
                            Animation:Stop()
                            Macro =
                                game:service'Players'.LocalPlayer.Character:findFirstChildOfClass'Humanoid'.Running:Connect(function()
                                    Animation:Stop()
                                end)
                        end
                    else
                        if Notification == true then
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "GodMacro";
                                Text = "GodMacro: Off";
                            })
                            GodMacroToggle = false
                            if GodMacroAuto == true then
                                local Greet = game.ReplicatedStorage.ClientAnimations.Greet
                                local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                                local Animation = Humanoid:LoadAnimation(Greet)
                                Animation:Stop()
                                game:GetService("ReplicatedStorage"):findFirstChild("ClientAnimations"):findFirstChild("Greet"):Remove()
                                Macro:Disconnect()
                            end
                        end
                    end
                end
            end
        end)
    end
end
