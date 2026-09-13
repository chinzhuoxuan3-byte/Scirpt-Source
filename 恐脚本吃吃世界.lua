game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "吃吃世界脚本",
    Text = "作者：恐拜大帝\nQQ：3999698324",
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
})

local repo = 'https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/'

local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("加载失败: " .. url)
        return nil
    end
    return result
end

local Library = safeLoad(repo .. 'Library.lua')
local ThemeManager = safeLoad(repo .. 'addons/ThemeManager.lua')
local SaveManager = safeLoad(repo .. 'addons/SaveManager.lua')

if not Library then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "错误",
        Text = "UI 库加载失败，请检查网络或脚本资源",
        Duration = 5,
    })
    return
end

local function Notify(msg)
    Library:Notify(msg, 3)
end

-- 原有变量
local actionSpeedActive = false
local eatMultiplyActive = false
local eatMultiplier = 2
local desiredWalkSpeed = 16

-- 新功能开关变量
local SmoothFollowEnabled = false
local AimbotEnabled = false
local LockViewEnabled = false
local CrosshairEnabled = false
local CrosshairSpinEnabled = false
local AimbotRadius = math.floor(workspace.CurrentCamera.ViewportSize.Y / 3)

-- 自瞄圆圈（直接放CoreGui，保证显示）
local AimbotCircle = Instance.new("Frame")
AimbotCircle.Name = "AimbotCircle"
AimbotCircle.Parent = game:GetService("CoreGui")
AimbotCircle.Size = UDim2.new(0, AimbotRadius*2, 0, AimbotRadius*2)
AimbotCircle.Position = UDim2.new(0.5, -AimbotRadius, 0.5, -AimbotRadius)
AimbotCircle.BackgroundTransparency = 1
AimbotCircle.BorderSizePixel = 0
AimbotCircle.Visible = false
local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.new(1,1,1)
circleStroke.Thickness = 2
circleStroke.Parent = AimbotCircle
local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1,0)
circleCorner.Parent = AimbotCircle

-- 准星UI
local CrosshairGui = Instance.new("ScreenGui")
CrosshairGui.Name = "CrosshairGui"
CrosshairGui.Parent = game.Players.LocalPlayer.PlayerGui
CrosshairGui.ResetOnSpawn = false
CrosshairGui.IgnoreGuiInset = true

local CrosshairFrame = Instance.new("Frame")
CrosshairFrame.Name = "Crosshair"
CrosshairFrame.Parent = CrosshairGui
CrosshairFrame.Size = UDim2.new(0, 30, 0, 30)
CrosshairFrame.Position = UDim2.new(0.5, -15, 0.5, -15)
CrosshairFrame.BackgroundTransparency = 1
CrosshairFrame.Visible = false

local hLine = Instance.new("Frame")
hLine.Parent = CrosshairFrame
hLine.Size = UDim2.new(1, 0, 0, 2)
hLine.Position = UDim2.new(0, 0, 0.5, -1)
hLine.BackgroundColor3 = Color3.new(1,1,1)
hLine.BorderSizePixel = 0

local vLine = Instance.new("Frame")
vLine.Parent = CrosshairFrame
vLine.Size = UDim2.new(0, 2, 1, 0)
vLine.Position = UDim2.new(0.5, -1, 0, 0)
vLine.BackgroundColor3 = Color3.new(1,1,1)
vLine.BorderSizePixel = 0

local dot = Instance.new("Frame")
dot.Parent = CrosshairFrame
dot.Size = UDim2.new(0, 6, 0, 6)
dot.Position = UDim2.new(0.5, -3, 0.5, -3)
dot.BackgroundColor3 = Color3.new(1,1,1)
dot.BorderSizePixel = 0
local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1,0)
dotCorner.Parent = dot

-- 功能逻辑
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- 平滑跟随
RunService.Heartbeat:Connect(function()
    if not SmoothFollowEnabled then return end
    local myChar = LocalPlayer.Character
    if not myChar then return end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local nearest = nil
    local minDist = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (p.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
            if dist < minDist then
                minDist = dist
                nearest = p
            end
        end
    end
    if nearest then
        local targetRoot = nearest.Character.HumanoidRootPart
        local offset = targetRoot.CFrame.LookVector * -2.5
        myRoot.CFrame = CFrame.new(targetRoot.Position + offset, targetRoot.Position)
    end
end)

-- 视角锁定
RunService:BindToRenderStep("LockView", Enum.RenderPriority.Camera.Value + 1, function()
    if not LockViewEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local camDir = Camera.CFrame.LookVector
    local flatDir = Vector3.new(camDir.X, 0, camDir.Z)
    if flatDir.Magnitude > 0.01 then
        root.CFrame = CFrame.new(root.Position, root.Position + flatDir)
    end
end)

-- 自瞄逻辑
RunService.RenderStepped:Connect(function()
    if not AimbotEnabled then
        AimbotCircle.Visible = false
        return
    end
    AimbotCircle.Visible = true
    AimbotCircle.Size = UDim2.new(0, AimbotRadius*2, 0, AimbotRadius*2)
    AimbotCircle.Position = UDim2.new(0.5, -AimbotRadius, 0.5, -AimbotRadius)

    local camPos = Camera.CFrame.Position
    local closestDist = math.huge
    local closestPlayer = nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer then continue end
        local char = p.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local targetPos = char.HumanoidRootPart.Position
            local screenPos, onScreen = Camera:WorldToScreenPoint(targetPos)
            if onScreen then
                local distFromCenter = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if distFromCenter <= AimbotRadius then
                    local realDist = (targetPos - camPos).Magnitude
                    if realDist < closestDist then
                        closestDist = realDist
                        closestPlayer = p
                    end
                end
            end
        end
    end
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPos = closestPlayer.Character.HumanoidRootPart.Position
        local dir = (targetPos - camPos).Unit
        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(camPos, camPos + dir), 0.2)
    end
end)

-- 准星旋转
RunService.Heartbeat:Connect(function()
    if CrosshairEnabled and CrosshairSpinEnabled then
        CrosshairFrame.Rotation = (CrosshairFrame.Rotation + 1) % 360
    elseif CrosshairEnabled and not CrosshairSpinEnabled then
        CrosshairFrame.Rotation = 0
    end
    CrosshairFrame.Visible = CrosshairEnabled
end)

-- 原脚本动作加速循环
task.spawn(function()
    while true do
        if actionSpeedActive then
            local char = LocalPlayer.Character
            if char then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                        track:AdjustSpeed(3.0)
                    end
                end
            end
        end
        task.wait(0.3)
    end
end)

-- 吃倍数 Hook
local function hookEatEvents()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local function scanAndHook(container)
        for _, obj in pairs(container:GetDescendants()) do
            if obj:IsA("RemoteEvent") then
                local name = obj.Name:lower()
                if name:find("eat") or name:find("consume") or name:find("food") then
                    local oldFire = obj.FireServer
                    obj.FireServer = function(self, ...)
                        if eatMultiplyActive then
                            for i = 1, eatMultiplier do
                                oldFire(self, ...)
                                task.wait(0.05)
                            end
                            return
                        end
                        return oldFire(self, ...)
                    end
                end
            end
        end
    end
    scanAndHook(replicatedStorage)
    pcall(function()
        scanAndHook(game:GetService("ReplicatedFirst"))
        scanAndHook(workspace)
    end)
end
hookEatEvents()

-- 飞行脚本
local function loadFlightScript()
    local success, err = pcall(function()
        local main = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local up = Instance.new("TextButton")
        local down = Instance.new("TextButton")
        local onof = Instance.new("TextButton")
        local TextLabel = Instance.new("TextLabel")
        local plus = Instance.new("TextButton")
        local speed = Instance.new("TextLabel")
        local mine = Instance.new("TextButton")
        local closebutton = Instance.new("TextButton")
        local mini = Instance.new("TextButton")
        local mini2 = Instance.new("TextButton")

        main.Name = "main"
        main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        main.ResetOnSpawn = false

        Frame.Parent = main
        Frame.BackgroundColor3 = Color3.fromRGB(163,255,137)
        Frame.BorderColor3 = Color3.fromRGB(103,221,213)
        Frame.Position = UDim2.new(0.100320168,0,0.379746825,0)
        Frame.Size = UDim2.new(0,190,0,57)

        up.Name = "up"
        up.Parent = Frame
        up.BackgroundColor3 = Color3.fromRGB(79,255,152)
        up.Size = UDim2.new(0,44,0,28)
        up.Font = Enum.Font.SourceSans
        up.Text = "上升"
        up.TextColor3 = Color3.fromRGB(0,0,0)
        up.TextSize = 14

        down.Name = "down"
        down.Parent = Frame
        down.BackgroundColor3 = Color3.fromRGB(215,255,121)
        down.Position = UDim2.new(0,0,0.491228074,0)
        down.Size = UDim2.new(0,44,0,28)
        down.Font = Enum.Font.SourceSans
        down.Text = "下落"
        down.TextColor3 = Color3.fromRGB(0,0,0)
        down.TextSize = 14

        onof.Name = "onof"
        onof.Parent = Frame
        onof.BackgroundColor3 = Color3.fromRGB(255,249,74)
        onof.Position = UDim2.new(0.702823281,0,0.491228074,0)
        onof.Size = UDim2.new(0,56,0,28)
        onof.Font = Enum.Font.SourceSans
        onof.Text = "飞"
        onof.TextColor3 = Color3.fromRGB(0,0,0)
        onof.TextSize = 14

        TextLabel.Parent = Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(242,60,255)
        TextLabel.Position = UDim2.new(0.469327301,0,0,0)
        TextLabel.Size = UDim2.new(0,100,0,28)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = "恐拜大帝"
        TextLabel.TextColor3 = Color3.fromRGB(0,0,0)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14
        TextLabel.TextWrapped = true

        plus.Name = "plus"
        plus.Parent = Frame
        plus.BackgroundColor3 = Color3.fromRGB(133,145,255)
        plus.Position = UDim2.new(0.231578946,0,0,0)
        plus.Size = UDim2.new(0,45,0,28)
        plus.Font = Enum.Font.SourceSans
        plus.Text = "+"
        plus.TextColor3 = Color3.fromRGB(0,0,0)
        plus.TextScaled = true
        plus.TextSize = 14
        plus.TextWrapped = true

        speed.Name = "speed"
        speed.Parent = Frame
        speed.BackgroundColor3 = Color3.fromRGB(255,85,0)
        speed.Position = UDim2.new(0.468421042,0,0.491228074,0)
        speed.Size = UDim2.new(0,44,0,28)
        speed.Font = Enum.Font.SourceSans
        speed.Text = "1"
        speed.TextColor3 = Color3.fromRGB(0,0,0)
        speed.TextScaled = true
        speed.TextSize = 14
        speed.TextWrapped = true

        mine.Name = "mine"
        mine.Parent = Frame
        mine.BackgroundColor3 = Color3.fromRGB(123,255,247)
        mine.Position = UDim2.new(0.231578946,0,0.491228074,0)
        mine.Size = UDim2.new(0,45,0,29)
        mine.Font = Enum.Font.SourceSans
        mine.Text = "-"
        mine.TextColor3 = Color3.fromRGB(0,0,0)
        mine.TextScaled = true
        mine.TextSize = 14
        mine.TextWrapped = true

        closebutton.Name = "Close"
        closebutton.Parent = Frame
        closebutton.BackgroundColor3 = Color3.fromRGB(225,25,0)
        closebutton.Font = Enum.Font.SourceSans
        closebutton.Size = UDim2.new(0,45,0,28)
        closebutton.Text = "X"
        closebutton.TextSize = 30
        closebutton.Position = UDim2.new(0,0,-1,27)

        mini.Name = "minimize"
        mini.Parent = Frame
        mini.BackgroundColor3 = Color3.fromRGB(192,150,230)
        mini.Font = Enum.Font.SourceSans
        mini.Size = UDim2.new(0,45,0,28)
        mini.Text = "-"
        mini.TextSize = 40
        mini.Position = UDim2.new(0,44,-1,27)

        mini2.Name = "minimize2"
        mini2.Parent = Frame
        mini2.BackgroundColor3 = Color3.fromRGB(192,150,230)
        mini2.Font = Enum.Font.SourceSans
        mini2.Size = UDim2.new(0,45,0,28)
        mini2.Text = "+"
        mini2.TextSize = 40
        mini2.Position = UDim2.new(0,44,0,30)
        mini2.Visible = false

        local speeds = 1
        local speaker = game:GetService("Players").LocalPlayer
        local chr = game.Players.LocalPlayer.Character
        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
        local nowe = false

        Notify("飞行脚本已加载")

        Frame.Active = true
        Frame.Draggable = true

        closebutton.MouseButton1Click:Connect(function()
            main:Destroy()
        end)

        up.MouseButton1Click:Connect(function()
            if chr and chr:FindFirstChild("HumanoidRootPart") then
                chr.HumanoidRootPart.CFrame = chr.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            end
        end)

        down.MouseButton1Click:Connect(function()
            if chr and chr:FindFirstChild("HumanoidRootPart") then
                chr.HumanoidRootPart.CFrame = chr.HumanoidRootPart.CFrame + Vector3.new(0, -3, 0)
            end
        end)

        mini.MouseButton1Click:Connect(function()
            up.Visible = false
            down.Visible = false
            onof.Visible = false
            plus.Visible = false
            speed.Visible = false
            mine.Visible = false
            closebutton.Visible = false
            mini.Visible = false
            mini2.Visible = true
            Frame.Size = UDim2.new(0, 100, 0, 28)
            TextLabel.Position = UDim2.new(0, 0, 0, 0)
        end)

        mini2.MouseButton1Click:Connect(function()
            up.Visible = true
            down.Visible = true
            onof.Visible = true
            plus.Visible = true
            speed.Visible = true
            mine.Visible = true
            closebutton.Visible = true
            mini.Visible = true
            mini2.Visible = false
            Frame.Size = UDim2.new(0, 190, 0, 57)
            TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
        end)

        plus.MouseButton1Click:Connect(function()
            speeds = speeds + 1
            speed.Text = tostring(speeds)
        end)

        mine.MouseButton1Click:Connect(function()
            if speeds > 1 then
                speeds = speeds - 1
                speed.Text = tostring(speeds)
            else
                speed.Text = "错误"
                task.wait(0.2)
                speed.Text = "1"
            end
        end)

        speaker.CharacterAdded:Connect(function(newChar)
            chr = newChar
            hum = chr:FindFirstChildOfClass("Humanoid")
        end)

        onof.MouseButton1Click:Connect(function()
            nowe = not nowe
            onof.Text = "飞"
            if nowe then
                if hum then
                    for _, state in pairs(Enum.HumanoidStateType:GetEnumItems()) do
                        hum:SetStateEnabled(state, false)
                    end
                    hum:ChangeState(Enum.HumanoidStateType.Swimming)
                end
                if chr.Animate then
                    chr.Animate.Disabled = true
                end
                if hum then
                    for i, v in next, hum:GetPlayingAnimationTracks() do
                        v:AdjustSpeed(0)
                    end
                end
                task.spawn(function()
                    local runService = game:GetService("RunService")
                    while nowe and chr and hum do
                        runService.Heartbeat:Wait()
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection * speeds)
                        end
                    end
                end)
                if hum.RigType == Enum.HumanoidRigType.R6 then
                    local plr = game.Players.LocalPlayer
                    local torso = plr.Character.Torso
                    local bg = Instance.new("BodyGyro", torso)
                    bg.P = 9e4
                    bg.maxTorque = Vector3.new(9e9,9e9,9e9)
                    bg.CFrame = torso.CFrame
                    local bv = Instance.new("BodyVelocity", torso)
                    bv.Velocity = Vector3.new(0,0,0)
                    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                    if nowe then
                        plr.Character.Humanoid.PlatformStand = true
                    end
                    while nowe and plr.Character.Humanoid.Health > 0 do
                        game:GetService("RunService").RenderStepped:Wait()
                        bg.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
                    bg:Destroy()
                    bv:Destroy()
                    plr.Character.Humanoid.PlatformStand = false
                    plr.Character.Animate.Disabled = false
                else
                    local plr = game.Players.LocalPlayer
                    local UpperTorso = plr.Character.UpperTorso
                    local bg = Instance.new("BodyGyro", UpperTorso)
                    bg.P = 9e4
                    bg.maxTorque = Vector3.new(9e9,9e9,9e9)
                    bg.CFrame = UpperTorso.CFrame
                    local bv = Instance.new("BodyVelocity", UpperTorso)
                    bv.Velocity = Vector3.new(0,0,0)
                    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                    if nowe then
                        plr.Character.Humanoid.PlatformStand = true
                    end
                    while nowe and plr.Character.Humanoid.Health > 0 do
                        task.wait()
                        bg.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
                    bg:Destroy()
                    bv:Destroy()
                    plr.Character.Humanoid.PlatformStand = false
                    plr.Character.Animate.Disabled = false
                end
            else
                if hum then
                    for _, state in pairs(Enum.HumanoidStateType:GetEnumItems()) do
                        hum:SetStateEnabled(state, true)
                    end
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                end
                if chr.Animate then
                    chr.Animate.Disabled = false
                end
            end
        end)
    end)
    if not success then
        Notify("飞行脚本加载失败："..tostring(err))
    end
end

-- 持续更新移动速度
task.spawn(function()
    while true do
        task.wait(0.1)
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid and humanoid.WalkSpeed ~= desiredWalkSpeed then
                humanoid.WalkSpeed = desiredWalkSpeed
            end
        end
    end
end)

-- 创建主窗口
local Window = Library:CreateWindow({
    Title = "吃吃世界脚本",
    Footer = "By 恐拜大帝 | QQ:3999698324",
    Icon = 131153193945220,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab("主要", "star"),
    Visual = Window:AddTab("视觉", "eye"),
    Other = Window:AddTab("其他", "settings"),
}

-- 主要标签页
local LeftGroup = Tabs.Main:AddLeftGroupbox("功能控制")
local RightGroup = Tabs.Main:AddRightGroupbox("特殊功能")

LeftGroup:AddToggle('ActionSpeed', {
    Text = '动作加速（吃东西/搬起）',
    Default = false,
    Callback = function(Value)
        actionSpeedActive = Value
        Notify("动作加速" .. (Value and "已开启" or "已关闭"))
    end
})

LeftGroup:AddToggle('EatMultiply', {
    Text = '吃一口长好几倍',
    Default = false,
    Callback = function(Value)
        eatMultiplyActive = Value
        Notify("吃倍数" .. (Value and "已开启" or "已关闭"))
    end
})

LeftGroup:AddSlider('EatMultiplier', {
    Text = '吃倍数',
    Default = 2,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Suffix = " 倍",
    Callback = function(Value)
        eatMultiplier = Value
        if eatMultiplyActive then
            Notify("吃倍数已设为 " .. Value)
        end
    end
})

LeftGroup:AddSlider('WalkSpeed', {
    Text = '移动速度',
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Suffix = " studs",
    Callback = function(Value)
        desiredWalkSpeed = Value
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then humanoid.WalkSpeed = Value end
        end
        Notify("移动速度已设为 " .. Value)
    end
})

RightGroup:AddButton({
    Text = '召唤飞行脚本',
    Func = loadFlightScript,
    DoubleClick = false
})

-- 视觉标签页
local VisualLeft = Tabs.Visual:AddLeftGroupbox("自瞄设置")
local VisualRight = Tabs.Visual:AddRightGroupbox("其他视觉")

VisualLeft:AddToggle('Aimbot', {
    Text = '自瞄',
    Default = false,
    Callback = function(Value)
        AimbotEnabled = Value
        if not Value then
            AimbotCircle.Visible = false
        end
        Notify("自瞄" .. (Value and "已开启" or "已关闭"))
    end
})

VisualLeft:AddSlider('AimbotRadius', {
    Text = '自瞄半径',
    Default = 100,
    Min = 50,
    Max = 400,
    Rounding = 0,
    Suffix = " px",
    Callback = function(Value)
        AimbotRadius = Value
    end
})

VisualRight:AddToggle('SmoothFollow', {
    Text = '平滑跟随',
    Default = false,
    Callback = function(Value)
        SmoothFollowEnabled = Value
        Notify("平滑跟随" .. (Value and "已开启" or "已关闭"))
    end
})

VisualRight:AddToggle('LockView', {
    Text = '锁定视角',
    Default = false,
    Callback = function(Value)
        LockViewEnabled = Value
        Notify("锁定视角" .. (Value and "已开启" or "已关闭"))
    end
})

VisualRight:AddToggle('Crosshair', {
    Text = '准星',
    Default = false,
    Callback = function(Value)
        CrosshairEnabled = Value
        Notify("准星" .. (Value and "已显示" or "已隐藏"))
    end
})

VisualRight:AddToggle('CrosshairSpin', {
    Text = '准星旋转',
    Default = false,
    Callback = function(Value)
        CrosshairSpinEnabled = Value
        if CrosshairEnabled then
            CrosshairFrame.Rotation = 0
        end
        Notify("准星旋转" .. (Value and "已开启" or "已关闭"))
    end
})

-- 其他标签页
local OtherLeft = Tabs.Other:AddLeftGroupbox("杂项")
OtherLeft:AddLabel("作者：恐拜大帝")
OtherLeft:AddLabel("QQ：3999698324", true)
OtherLeft:AddButton({
    Text = '卸载脚本',
    Func = function() Library:Unload() end
})

-- 主题/保存管理器
if ThemeManager then
    ThemeManager:SetLibrary(Library)
    ThemeManager:SetFolder("ChiChiWorld")
    ThemeManager:ApplyToTab(Tabs.Other)
end

if SaveManager then
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetFolder("ChiChiWorldConfig")
    SaveManager:BuildConfigSection(Tabs.Other)
end

Notify("吃吃世界脚本已加载")