getgenv().Settings = {
    Main = {
        Enable = true,
 
        HoldKey = false,
        ToggleKey = true,
 
        UseKeyBoardKey = true,
        KeyBoardKey = Enum.KeyCode.C, -- https://create.roblox.com/docs/reference/engine/enums/KeyCode
 
        UseMouseKey = false,
        ThirdPerson = true,
        FirstPerson = true,
 
        AutoPingSets = true,
 
        UseCircleRadius = true,
        DisableOutSideCircle = true,
 
        UseShake = true,
        ShakePower = 1,
 
        CheckForWalls = true
    },
    Check = {
        CheckIfKo = true, -- This Is For Da Hood
        DisableOnTargetDeath = true,
        DisableOnPlayerDeath = true
    },
    Horizontal = {
        PredictMovement = true,
        PredictionVelocity = 0.17221418
    },
    Smooth = {
        Smoothness = true,
        SmoothnessAmount = 1,
        SmoothMethod = Enum.EasingStyle.Circular,
        SmoothMethodV2 = Enum.EasingDirection.InOut
    },
    Part = {
        AimPart = "Head",
        CheckIfJumpedAimPart = "HumanoidRootPart",
        CheckIfJumped = true,
        GetClosestPart = false
    },
    Resolver = {
        UnderGround = false,
        UseUnderGroundKeybind = true,
        UnderGroundKey = Enum.KeyCode.P,
        DetectDesync = true,
        Detection = 75,
 
        UseDetectDesyncKeybind = true,
        DetectDesyncKey = Enum.KeyCode.V,
        SendNotification = true
    },
    Visual = {
        Fov = true,
        FovTransparency = 1,
        FovThickness = 1,
        FovColor = Color3.fromRGB(255, 185, 0),
        FovRadius = 100
    },
    Spoofer = {
        MemorySpoofer = true,
        MemoryTabColor = Color3.fromRGB(211, 88, 33),
        MemoryMost = 85000,
        MemoryLeast = 80000,
 
        PingSpoofer = true,
        PingTabColor = Color3.fromRGB(211, 88, 33),
        PingMost = 2000,
        PingLeast = 1000
    }
}
 
-- // Locals
 
local Players, Uis, RService, Inset, CurrentCamera = 
game:GetService("Players"), 
game:GetService("UserInputService"), 
game:GetService("RunService"),
game:GetService("GuiService"):GetGuiInset().Y,
game:GetService("Workspace").CurrentCamera
 
local Client = Players.LocalPlayer;
 
local Mouse, Camera = Client:GetMouse(), workspace.CurrentCamera
 
local Circle = Drawing.new("Circle")
 
local CF, RNew, Vec3, Vec2 = CFrame.new, Ray.new, Vector3.new, Vector2.new
 
local OldAimPart = getgenv().Settings.Part.AimPart
 
local AimlockTarget, MousePressed, CanNotify = nil, false, false
 
getgenv().UpdateFOV = function()
    if (not Circle) then
        return (Circle)
    end
    Circle.Color = Settings.Visual.FovColor
    Circle.Visible = Settings.Visual.Fov
    Circle.Radius = Settings.Visual.FovRadius
    Circle.Thickness = Settings.Visual.FovThickness
    Circle.Position = Vec2(Mouse.X, Mouse.Y + Inset)
    return (Circle)
end
 
RService.Heartbeat:Connect(UpdateFOV)
 
-- // Functions
 
getgenv().WallCheck = function(destination, ignore)
    local Origin = Camera.CFrame.p
    local CheckRay = RNew(Origin, destination - Origin)
    local Hit = game.workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit == nil
end
 
getgenv().WTS = function(Object)
    local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vec2(ObjectVector.X, ObjectVector.Y)
end
 
getgenv().IsOnScreen = function(Object)
    local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end
 
getgenv().FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end
 
getgenv().GetClosestBodyPart = function(character)
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vec2(Mouse.X, Mouse.Y)).Magnitude
                if (Circle.Radius > Distance and Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end
 
getgenv().WorldToViewportPoint = function(P)
    return Camera:WorldToViewportPoint(P)
end
 
getgenv().WorldToScreenPoint = function(P)
    return Camera.WorldToScreenPoint(Camera, P)
end
 
getgenv().GetObscuringObjects = function(T)
    if T and T:FindFirstChild(getgenv().Settings.Part.AimPart) and Client and Client.Character:FindFirstChild("Head") then
        local RayPos =
            workspace:FindPartOnRay(RNew(T[getgenv().Settings.Part.AimPart].Position, Client.Character.Head.Position))
        if RayPos then
            return RayPos:IsDescendantOf(T)
        end
    end
end
 
getgenv().GetNearestTarget = function()
    local AimlockTarget, Closest = nil, 1 / 0
 
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
            local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (Vec2(Position.X, Position.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude
            if Settings.Main.CheckForWalls then
                if
                    (Circle.Radius > Distance and Distance < Closest and OnScreen and
                        getgenv().WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}))
                 then
                    Closest = Distance
                    AimlockTarget = v
                end
            elseif Settings.Main.UseCircleRadius then
                if
                    (Circle.Radius > Distance and Distance < Closest and OnScreen and
                        getgenv().WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}))
                 then
                    Closest = Distance
                    AimlockTarget = v
                end
            else
                if (Circle.Radius > Distance and Distance < Closest and OnScreen) then
                    Closest = Distance
                    AimlockTarget = v
                end
            end
        end
    end
    return AimlockTarget
end
 
-- // Use KeyBoardKey Function
 
Uis.InputBegan:connect(
    function(input)
        if
            input.KeyCode == Settings.Main.KeyBoardKey and Settings.Main.UseKeyBoardKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget == nil and
                getgenv().Settings.Main.HoldKey == true
         then
            pcall(
                function()
                    MousePressed = true
                    AimlockTarget = GetNearestTarget()
                end
            )
        end
    end
)Uis.InputEnded:connect(
    function(input)
        if
            input.KeyCode == Settings.Main.KeyBoardKey and getgenv().Settings.Main.HoldKey == true and
                Settings.Main.UseKeyBoardKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget ~= nil
         then
            AimlockTarget = nil
            MousePressed = false
        end
    end
)
 
Uis.InputBegan:Connect(
    function(keyinput, stupid)
        if
            keyinput.KeyCode == Settings.Resolver.UnderGroundKey and getgenv().Settings.Main.Enable == true and
                Settings.Resolver.UseUnderGroundKeybind == true
         then
            if Settings.Resolver.UnderGround == true then
                Settings.Resolver.UnderGround = false
                if getgenv().Settings.Resolver.SendNotification then
                    game.StarterGui:SetCore(
                        "SendNotification",
                        {
                            Title = "Sanky Box",
                            Text = "Disabled UnderGround Resolver",
                            Icon = "rbxassetid://11394475200",
                            Duration = 1
                        }
                    )
                end
            else
                Settings.Resolver.UnderGround = true
                if getgenv().Settings.Resolver.SendNotification then
                    game.StarterGui:SetCore(
                        "SendNotification",
                        {
                            Title = "Sanky Box",
                            Text = "Enabled UnderGround Resolver",
                            Icon = "rbxassetid://11394475200",
                            Duration = 1
                        }
                    )
                end
            end
        end
    end
)
 
Uis.InputBegan:Connect(
    function(keyinput, stupid)
        if
            keyinput.KeyCode == Settings.Resolver.DetectDesyncKey and getgenv().Settings.Main.Enable == true and
                Settings.Resolver.UseDetectDesyncKeybind == true
         then
            if Settings.Resolver.DetectDesync == true then
                Settings.Resolver.DetectDesync = false
                if getgenv().Settings.Resolver.SendNotification then
                    game.StarterGui:SetCore(
                        "SendNotification",
                        {
                            Title = "Sanky Box",
                            Text = "Disabled Desync Resolver",
                            Icon = "rbxassetid://11394475200",
                            Duration = 1
                        }
                    )
                end
            else
                Settings.Resolver.DetectDesync = true
                if getgenv().Settings.Resolver.SendNotification then
                    game.StarterGui:SetCore(
                        "SendNotification",
                        {
                            Title = "Sanky Box",
                            Text = "Enabled Desync Resolver",
                            Icon = "rbxassetid://11394475200",
                            Duration = 1
                        }
                    )
                end
            end
        end
    end
)
 
Uis.InputBegan:Connect(
    function(keyinput, stupid)
        if
            keyinput.KeyCode == Settings.Main.KeyBoardKey and Settings.Main.UseKeyBoardKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget == nil and
                getgenv().Settings.Main.ToggleKey == true
         then
            pcall(
                function()
                    MousePressed = true
                    AimlockTarget = GetNearestTarget()
                end
            )
        elseif
            keyinput.KeyCode == Settings.Main.KeyBoardKey and Settings.Main.UseKeyBoardKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget ~= nil
         then
            AimlockTarget = nil
            MousePressed = false
        end
    end
)
 
-- // Use MouseKey Function
 
Uis.InputBegan:connect(
    function(input)
        if
            input.UserInputType == Settings.Main.MouseKey and Settings.Main.UseMouseKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget == nil and
                getgenv().Settings.Main.HoldKey == true
         then
            pcall(
                function()
                    MousePressed = true
                    AimlockTarget = GetNearestTarget()
                end
            )
        end
    end
)Uis.InputEnded:connect(
    function(input)
        if
            input.UserInputType == Settings.Main.MouseKey and getgenv().Settings.Main.HoldKey == true and
                Settings.Main.UseMouseKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget ~= nil
         then
            AimlockTarget = nil
            MousePressed = false
        end
    end
)
 
Uis.InputBegan:Connect(
    function(keyinput, stupid)
        if
            keyinput.UserInputType == Settings.Main.MouseKey and Settings.Main.UseMouseKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget == nil and
                getgenv().Settings.Main.ToggleKey == true
         then
            pcall(
                function()
                    MousePressed = true
                    AimlockTarget = GetNearestTarget()
                end
            )
        elseif
            keyinput.UserInputType == Settings.Main.MouseKey and Settings.Main.UseMouseKey == true and
                getgenv().Settings.Main.Enable == true and
                AimlockTarget ~= nil
         then
            AimlockTarget = nil
            MousePressed = false
        end
    end
)
 
-- // Main Functions. RunService HeartBeat.
 
task.spawn(
    function()
        while task.wait() do
            if MousePressed == true and getgenv().Settings.Main.Enable == true then
                if AimlockTarget and AimlockTarget.Character then
                    if getgenv().Settings.Part.GetClosestPart == true then
                        getgenv().Settings.Part.AimPart = tostring(GetClosestBodyPart(AimlockTarget.Character))
                    end
                end
                if getgenv().Settings.Main.DisableOutSideCircle == true and AimlockTarget and AimlockTarget.Character then
                    if
                        Circle.Radius <
                            (Vec2(
                                Camera:WorldToScreenPoint(AimlockTarget.Character.HumanoidRootPart.Position).X,
                                Camera:WorldToScreenPoint(AimlockTarget.Character.HumanoidRootPart.Position).Y
                            ) - Vec2(Mouse.X, Mouse.Y)).Magnitude
                     then
                        AimlockTarget = nil
                    end
                end
            end
        end
    end
)
 
RService.Heartbeat:Connect(
    function()
        if getgenv().Settings.Main.Enable == true and MousePressed == true then
            if getgenv().Settings.Main.UseShake == true and AimlockTarget and AimlockTarget.Character then
                pcall(
                    function()
                        local TargetVelv1 = AimlockTarget.Character[getgenv().Settings.Part.AimPart]
                        TargetVelv1.Velocity =
                            Vec3(TargetVelv1.Velocity.X, TargetVelv1.Velocity.Y, TargetVelv1.Velocity.Z) +
                            Vec3(
                                math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower),
                                math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower),
                                math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower)
                            ) *
                                0.1
                        TargetVelv1.AssemblyLinearVelocity =
                            Vec3(TargetVelv1.Velocity.X, TargetVelv1.Velocity.Y, TargetVelv1.Velocity.Z) +
                            Vec3(
                                math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower),
                                math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower),
                                math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower)
                            ) *
                                0.1
                    end
                )
            end
            if getgenv().Settings.Resolver.UnderGround == true and AimlockTarget and AimlockTarget.Character then
                pcall(
                    function()
                        local TargetVelv2 = AimlockTarget.Character[getgenv().Settings.Part.AimPart]
                        TargetVelv2.Velocity = Vec3(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                        TargetVelv2.AssemblyLinearVelocity = Vec3(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                    end
                )
            end
            if
                getgenv().Settings.Resolver.DetectDesync == true and AimlockTarget and AimlockTarget.Character and
                    AimlockTarget.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude >
                        getgenv().Settings.Resolver.Detection
             then
                pcall(
                    function()
                        local TargetVel = AimlockTarget.Character[getgenv().Settings.Part.AimPart]
                        TargetVel.Velocity = Vec3(0, 0, 0)
                        TargetVel.AssemblyLinearVelocity = Vec3(0, 0, 0)
                    end
                )
            end
            if getgenv().Settings.Main.ThirdPerson == true and getgenv().Settings.Main.FirstPerson == true then
                if
                    (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or
                        (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1
                 then
                    CanNotify = true
                else
                    CanNotify = false
                end
            elseif getgenv().Settings.Main.ThirdPerson == true and getgenv().Settings.Main.FirstPerson == false then
                if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then
                    CanNotify = true
                else
                    CanNotify = false
                end
            elseif getgenv().Settings.Main.ThirdPerson == false and getgenv().Settings.Main.FirstPerson == true then
                if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then
                    CanNotify = true
                else
                    CanNotify = false
                end
            end
            if getgenv().Settings.Main.AutoPingSets == true and getgenv().Settings.Horizontal.PredictionVelocity then
                local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                local split = string.split(pingvalue, "(")
                local ping = tonumber(split[1])
                if ping > 190 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.206547
                elseif ping > 180 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.19284
                elseif ping > 170 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.1923111
                elseif ping > 160 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.1823111
                elseif ping > 150 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.171
                elseif ping > 140 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.165773
                elseif ping > 130 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.1223333
                elseif ping > 120 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.143765
                elseif ping > 110 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.1455
                elseif ping > 100 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.130340
                elseif ping > 90 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.136
                elseif ping > 80 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.1347
                elseif ping > 70 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.119
                elseif ping > 60 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.12731
                elseif ping > 50 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.127668
                elseif ping > 40 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.125
                elseif ping > 30 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.11
                elseif ping > 20 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.12588
                elseif ping > 10 then
                    getgenv().Settings.Horizontal.PredictionVelocity = 0.9
                end
            end
            if getgenv().Settings.Check.CheckIfKo == true and AimlockTarget and AimlockTarget.Character then
                local KOd = AimlockTarget.Character:WaitForChild("BodyEffects")["K.O"].Value
                local Grabbed = AimlockTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
                if AimlockTarget.Character.Humanoid.health < 1 or KOd or Grabbed then
                    if MousePressed == true then
                        AimlockTarget = nil
                        MousePressed = false
                    end
                end
            end
            if
                getgenv().Settings.Check.DisableOnTargetDeath == true and AimlockTarget and
                    AimlockTarget.Character:FindFirstChild("Humanoid")
             then
                if AimlockTarget.Character.Humanoid.health < 1 then
                    if MousePressed == true then
                        AimlockTarget = nil
                        MousePressed = false
                    end
                end
            end
            if
                getgenv().Settings.Check.DisableOnPlayerDeath == true and Client.Character and
                    Client.Character:FindFirstChild("Humanoid") and
                    Client.Character.Humanoid.health < 1
             then
                if MousePressed == true then
                    AimlockTarget = nil
                    MousePressed = false
                end
            end
            if getgenv().Settings.Part.CheckIfJumped == true and getgenv().Settings.Part.GetClosestPart == false then
                if AimlockTarget and AimlockTarget.Character then
                    if AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                        getgenv().Settings.Part.AimPart = getgenv().Settings.Part.CheckIfJumpedAimPart
                    else
                        getgenv().Settings.Part.AimPart = OldAimPart
                    end
                end
            end
            if
                AimlockTarget and AimlockTarget.Character and
                    AimlockTarget.Character:FindFirstChild(getgenv().Settings.Part.AimPart)
             then
                if getgenv().Settings.Main.FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().Settings.Horizontal.PredictMovement == true then
                            if getgenv().Settings.Smooth.Smoothness == true then
                                local Main =
                                    CF(
                                    Camera.CFrame.p,
                                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position +
                                        AimlockTarget.Character[getgenv().Settings.Part.AimPart].Velocity *
                                            getgenv().Settings.Horizontal.PredictionVelocity
                                )
 
                                Camera.CFrame =
                                    Camera.CFrame:Lerp(
                                    Main,
                                    getgenv().Settings.Smooth.SmoothnessAmount,
                                    Enum.EasingStyle.Elastic,
                                    Enum.EasingDirection.InOut
                                )
                            else
                                Camera.CFrame =
                                    CF(
                                    Camera.CFrame.p,
                                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position +
                                        AimlockTarget.Character[getgenv().Settings.Part.AimPart].Velocity *
                                            getgenv().Settings.Horizontal.PredictionVelocity + Vector3
                                )
                            end
                        elseif getgenv().Settings.Horizontal.PredictMovement == false then
                            if getgenv().Settings.Smooth.Smoothness == true then
                                local Main =
                                    CF(
                                    Camera.CFrame.p,
                                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position
                                )
                                Camera.CFrame =
                                    Camera.CFrame:Lerp(
                                    Main,
                                    getgenv().Settings.Smooth.SmoothnessAmount,
                                    getgenv().Settings.Smooth.SmoothMethod,
                                    getgenv().Settings.Smooth.SmoothMethodV2
                                )
                            else
                                Camera.CFrame =
                                    CF(
                                    Camera.CFrame.p,
                                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position
                                )
                            end
                        end
                    end
                end
            end
        end
    end
)
 
-- IK THIS IS SHITTY BRUH
 
local PerformanceStats = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("PerformanceStats")
 
local MemLabel
local color,
    color1,
    color2,
    color3,
    color4,
    color5,
    color6,
    color7,
    color8,
    color9,
    color10,
    color11,
    color12,
    color13,
    color14,
    color15,
    color16,
    color17,
    color18,
    color19
for I, Child in next, PerformanceStats:GetChildren() do
    if Child.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
        MemLabel = Child.StatsMiniTextPanelClass.ValueLabel
        color = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_0
        color1 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_1
        color2 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_2
        color3 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_3
        color4 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_4
        color5 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_5
        color6 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_6
        color7 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_7
        color8 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_8
        color9 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_9
        color10 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_10
        color11 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_11
        color12 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_12
        color13 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_13
        color14 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_14
        color15 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_15
        color16 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_16
        color17 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_17
        color18 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_18
        color19 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_19
        break
    end
end
MemLabel:GetPropertyChangedSignal("Text"):Connect(
    function()
        if Settings.Spoofer.MemorySpoofer == true then
            MemLabel.Text = math.random(Settings.Spoofer.MemoryLeast, Settings.Spoofer.MemoryMost) / 100 .. " MB"
            color.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color1.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color2.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color3.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color4.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color5.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color6.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color7.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color8.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color9.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color10.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color11.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color12.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color13.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color14.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color15.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color16.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color17.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color18.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
            color19.BackgroundColor3 = Settings.Spoofer.MemoryTabColor
        end
    end
)
 
local PingLabel
for I, Child in next, PerformanceStats:GetChildren() do
    if Child.StatsMiniTextPanelClass.TitleLabel.Text == "Ping" then
        PingLabel = Child.StatsMiniTextPanelClass.ValueLabel
        color = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_0
        color1 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_1
        color2 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_2
        color3 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_3
        color4 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_4
        color5 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_5
        color6 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_6
        color7 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_7
        color8 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_8
        color9 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_9
        color10 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_10
        color11 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_11
        color12 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_12
        color13 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_13
        color14 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_14
        color15 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_15
        color16 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_16
        color17 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_17
        color18 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_18
        color19 = Child.PS_AnnotatedGraph.PS_BarFrame.Bar_19
        break
    end
end
PingLabel:GetPropertyChangedSignal("Text"):Connect(
    function()
        if Settings.Spoofer.PingSpoofer == true then
            local textrandom = math.random(Settings.Spoofer.PingLeast, Settings.Spoofer.PingMost) / 100
            PingLabel.Text = textrandom .. " ms"
            color.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color1.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color2.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color3.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color4.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color5.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color6.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color7.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color8.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color9.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color10.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color11.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color12.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color13.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color14.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color15.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color16.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color17.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color18.BackgroundColor3 = Settings.Spoofer.PingTabColor
            color19.BackgroundColor3 = Settings.Spoofer.PingTabColor
            if game.PlaceId == 9825515356 then
                game:GetService("ReplicatedStorage").MainEvent:FireServer("GetPing", textrandom)
            end
        end
    end
)
