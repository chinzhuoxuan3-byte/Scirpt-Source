local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-/Main/UI"))()

if game.Players.LocalPlayer.Name == "AQ14ABS" or game.Players.LocalPlayer.Name == "edc12363" or game.Players.LocalPlayer.Name == "onygfvjop" or game.Players.LocalPlayer.Name == "ah_kdj3" or game.Players.LocalPlayer.Name == "luoyang100616" or game.Players.LocalPlayer.Name == "hdjdje675" or game.Players.LocalPlayer.Name == "qazwsxuruu" or game.Players.LocalPlayer.Name == "ADCZ4xx"
or game.Players.LocalPlayer.Name == "hjcjb96" or game.Players.LocalPlayer.Name == "TM5418888" or game.Players.LocalPlayer.Name == "codm656558" then
    game.Players.LocalPlayer:Kick("Exploiting😂")
else

OrionLib:MakeNotification({
    Name = "脚本中心",
    Content = "脚本启动中",
    Time = 2.5 })

local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://4590662766"
    Sound.Parent = game:GetService("SoundService")
    Sound.Volume = 5
    Sound:Play()
    Sound.Ended:Wait()
    Sound:Destroy()

local Window = OrionLib:MakeWindow({Name = "脚本中心", HidePremium = false, SaveConfig = false, IntroText = "脚本中心", ConfigFolder = "脚本中心"})

local Tab = Window:MakeTab({
    Name = "公告",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddParagraph("作者","情云")
Tab:AddLabel("此脚本为缝合")
Tab:AddLabel("此脚本完全免费禁止倒卖")
Tab:AddLabel("QQ群 : 834856433")
Tab:AddLabel("DC群组 : https://discord.gg/KxZX9pP6vh")

local Tab = Window:MakeTab({
    Name = "通用功能",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddToggle({
    Name = "大运",
    Default = false,
    Callback = function(Value)
    if Value then
        local Car = game:GetObjects("rbxassetid://78896584994504")[1]
        Car.car.CanCollide = false
        Car.Parent = workspace
        spawn(function()
            ToggleCar = game:GetService("RunService").RenderStepped:Connect(function()
                Car.car:PivotTo(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(1.3, 0, 1.6))
            end)
        end)
    else
        if ToggleCar then
            ToggleCar:Disconnect()
            Car:Destroy()
        end
    end
end})

Tab:AddButton({
    Name = "IY Dex修复版",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end})

Tab:AddButton({
    Name = "普京比例",
    Callback = function()
getgenv().Resolution = {
    [".gg/scripters"] = 0.65
}

local Camera = workspace.CurrentCamera
if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "g5s"
end})

Tab:AddButton({
    Name = "恢复比例",
    Callback = function()
getgenv().Resolution = {
    [".gg/scripters"] = 1
}

local Camera = workspace.CurrentCamera
if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "g5s"
end})

Tab:AddButton({
    Name = "锁定人物视角",
    Callback = function()
local ShiftlockStarterGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
ShiftlockStarterGui.Name = "Shiftlock (StarterGui)"
ShiftlockStarterGui.Parent = game.CoreGui
ShiftlockStarterGui.ZIndexBehavior =  Enum.ZIndexBehavior.Sibling
ShiftlockStarterGui.ResetOnSpawn = false

ImageButton.Parent = ShiftlockStarterGui
ImageButton.Active = true
ImageButton.Draggable = true
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(0.921914339, 0, 0.552375436, 0)
ImageButton.Size = UDim2.new(0.0636147112, 0, 0.0661305636, 0)
ImageButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageButton.Image = "http://www.roblox.com/asset/?id=182223762"
local function TLQOYN_fake_script()
    local script = Instance.new("LocalScript", ImageButton)

    local MobileCameraFramework = {}
    local Players = game.Players
    local runservice = game:GetService("RunService")
    local CAS = game:GetService("ContextActionService")
    local Player = Players.LocalPlayer
    local character = Player.Character or Player.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")
    local humanoid = character.Humanoid
    local camera = workspace.CurrentCamera
    local button = script.Parent
    uis = game:GetService("UserInputService")
    ismobile = uis.TouchEnabled
    button.Visible = ismobile
    
    local states = {
        OFF = "rbxasset://textures/ui/mouseLock_off@2x.png",
        ON = "rbxasset://textures/ui/mouseLock_on@2x.png"
    }
    local MAX_LENGTH = 900000
    local active = false
    local ENABLED_OFFSET = CFrame.new(1.7, 0, 0)
    local DISABLED_OFFSET = CFrame.new(-1.7, 0, 0)
local rootPos = Vector3.new(0,0,0)
local function UpdatePos()
if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" and Player.Character:FindFirstChildOfClass"Humanoid".RootPart then
rootPos = Player.Character:FindFirstChildOfClass"Humanoid".RootPart.Position
end
end
    local function UpdateImage(STATE)
        button.Image = states[STATE]
    end
    local function UpdateAutoRotate(BOOL)
if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" then
Player.Character:FindFirstChildOfClass"Humanoid".AutoRotate = BOOL
end
end
    local function GetUpdatedCameraCFrame()
if game:GetService"Workspace".CurrentCamera then
return CFrame.new(rootPos, Vector3.new(game:GetService"Workspace".CurrentCamera.CFrame.LookVector.X * MAX_LENGTH, rootPos.Y, game:GetService"Workspace".CurrentCamera.CFrame.LookVector.Z * MAX_LENGTH))
end
end
    local function EnableShiftlock()
UpdatePos()
        UpdateAutoRotate(false)
        UpdateImage("ON")
if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" and Player.Character:FindFirstChildOfClass"Humanoid".RootPart then
Player.Character:FindFirstChildOfClass"Humanoid".RootPart.CFrame = GetUpdatedCameraCFrame()
end
if game:GetService"Workspace".CurrentCamera then
game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * ENABLED_OFFSET
end
    end
    local function DisableShiftlock()
UpdatePos()
        UpdateAutoRotate(true)
        UpdateImage("OFF")
        if game:GetService"Workspace".CurrentCamera then
game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * DISABLED_OFFSET
end
        pcall(function()
            active:Disconnect()
            active = nil
        end)
    end
    UpdateImage("OFF")
    active = false
    function ShiftLock()
        if not active then
            active = runservice.RenderStepped:Connect(function()
                EnableShiftlock()
            end)
        else
            DisableShiftlock()
        end
    end
    local ShiftLockButton = CAS:BindAction("ShiftLOCK", ShiftLock, false, "On")
    CAS:SetPosition("ShiftLOCK", UDim2.new(0.8, 0, 0.8, 0))
    button.MouseButton1Click:Connect(function()
        if not active then
            active = runservice.RenderStepped:Connect(function()
                EnableShiftlock()
            end)
        else
            DisableShiftlock()
        end
    end)
    return MobileCameraFramework
    
end
coroutine.wrap(TLQOYN_fake_script)()
local function OMQRQRC_fake_script()
    local script = Instance.new("LocalScript", ShiftlockStarterGui)

    local Players = game.Players
    local UserInputService = game:GetService("UserInputService")
    local Settings = UserSettings()
    local GameSettings = Settings.GameSettings
    local ShiftLockController = {}
    while not Players.LocalPlayer do
        wait()
    end
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local ScreenGui, ShiftLockIcon, InputCn
    local IsShiftLockMode = true
    local IsShiftLocked = true
    local IsActionBound = false
    local IsInFirstPerson = false
    ShiftLockController.OnShiftLockToggled = Instance.new("BindableEvent")
    local function isShiftLockMode()
        return LocalPlayer.DevEnableMouseLock and GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.ClickToMove and GameSettings.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove and LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable
    end
    if not UserInputService.TouchEnabled then
        IsShiftLockMode = isShiftLockMode()
    end
    local function onShiftLockToggled()
        IsShiftLocked = not IsShiftLocked
        ShiftLockController.OnShiftLockToggled:Fire()
    end
    local initialize = function()
        print("enabled")
    end
    function ShiftLockController:IsShiftLocked()
        return IsShiftLockMode and IsShiftLocked
    end
    function ShiftLockController:SetIsInFirstPerson(isInFirstPerson)
        IsInFirstPerson = isInFirstPerson
    end
    local function mouseLockSwitchFunc(actionName, inputState, inputObject)
        if IsShiftLockMode then
            onShiftLockToggled()
        end
    end
    local function disableShiftLock()
        if ScreenGui then
            ScreenGui.Parent = nil
        end
        IsShiftLockMode = false
        Mouse.Icon = ""
        if InputCn then
            InputCn:disconnect()
            InputCn = nil
        end
        IsActionBound = false
        ShiftLockController.OnShiftLockToggled:Fire()
    end
    local onShiftInputBegan = function(inputObject, isProcessed)
        if isProcessed then
            return
        end
        if inputObject.UserInputType ~= Enum.UserInputType.Keyboard or inputObject.KeyCode == Enum.KeyCode.LeftShift or inputObject.KeyCode == Enum.KeyCode.RightShift then
        end
    end
    local function enableShiftLock()
        IsShiftLockMode = isShiftLockMode()
        if IsShiftLockMode then
            if ScreenGui then
                ScreenGui.Parent = PlayerGui
            end
            if IsShiftLocked then
                ShiftLockController.OnShiftLockToggled:Fire()
            end
            if not IsActionBound then
                InputCn = UserInputService.InputBegan:connect(onShiftInputBegan)
                IsActionBound = true
            end
        end
    end
    GameSettings.Changed:connect(function(property)
        if property == "ControlMode" then
            if GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then
                enableShiftLock()
            else
                disableShiftLock()
            end
        elseif property == "ComputerMovementMode" then
            if GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove then
                disableShiftLock()
            else
                enableShiftLock()
            end
        end
    end)
    LocalPlayer.Changed:connect(function(property)
        if property == "DevEnableMouseLock" then
            if LocalPlayer.DevEnableMouseLock then
                enableShiftLock()
            else
                disableShiftLock()
            end
        elseif property == "DevComputerMovementMode" then
            if LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.ClickToMove or LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
                disableShiftLock()
            else
                enableShiftLock()
            end
        end
    end)
    LocalPlayer.CharacterAdded:connect(function(character)
        if not UserInputService.TouchEnabled then
            initialize()
        end
    end)
    if not UserInputService.TouchEnabled then
        initialize()
        if isShiftLockMode() then
            InputCn = UserInputService.InputBegan:connect(onShiftInputBegan)
            IsActionBound = true
        end
    end
    enableShiftLock()
    return ShiftLockController
    
end
coroutine.wrap(OMQRQRC_fake_script)()
end})

Tab:AddButton({
    Name = "IY指令",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end})

Tab:AddButton({
    Name = "IY指令 ( 中文版 )",
    Callback = function()
loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,87,97,110,103,122,104,101,104,97,111,104,47,102,108,121,45,97,119,97,121,47,109,97,105,110,47,37,69,54,37,56,67,37,56,55,37,69,52,37,66,66,37,56,65,37,69,52,37,66,56,37,65,68,37,69,54,37,57,54,37,56,55,46,116,120,116})end)())))()
end})

Tab:AddButton({
    Name = "撸管R6",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end})

Tab:AddButton({
    Name = "撸管R15",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 头部 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "Head",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 身体 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "HumanoidRootPart",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄锁头老版本",
    Callback = function()
local fov = 50
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头老版本 ( 大范围 )",
    Callback = function()
local fov = 100
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头 ( 斩念提供 )",
    Callback = function()
local fov = 100
local smoothness = 10
local crosshairDistance = 5

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 255, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FovAdjustGui"
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(128, 0, 128)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0.4, 0, 0.4, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
MinimizeButton.Parent = Frame

local isMinimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "+"
    else
        Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "-"
    end
end)

local FovLabel = Instance.new("TextLabel")
FovLabel.Name = "FovLabel"
FovLabel.Text = "自瞄范围"
FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FovLabel.BackgroundTransparency = 1
FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
FovLabel.Parent = Frame

local FovSlider = Instance.new("TextBox")
FovSlider.Name = "FovSlider"
FovSlider.Text = tostring(fov)
FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
FovSlider.Parent = Frame

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Name = "SmoothnessLabel"
SmoothnessLabel.Text = "自瞄平滑度"
SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessLabel.Parent = Frame

local SmoothnessSlider = Instance.new("TextBox")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Text = tostring(smoothness)
SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0)
SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessSlider.Parent = Frame

local CrosshairDistanceLabel = Instance.new("TextLabel")
CrosshairDistanceLabel.Name = "CrosshairDistanceLabel"
CrosshairDistanceLabel.Text = "自瞄预判距离"
CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceLabel.BackgroundTransparency = 1
CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceLabel.Parent = Frame

local CrosshairDistanceSlider = Instance.new("TextBox")
CrosshairDistanceSlider.Name = "CrosshairDistanceSlider"
CrosshairDistanceSlider.Text = tostring(crosshairDistance)
CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0)
CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceSlider.Parent = Frame

local targetCFrame = Cam.CFrame

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
    FOVring.Radius = fov
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()

    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        local targetCharacter = closest.Character
        local targetHead = targetCharacter.Head
        local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

        local isMoving = targetRootPart.Velocity.Magnitude > 0.1

        local targetPosition
        if isMoving then
            targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance)
        else
            targetPosition = targetHead.Position
        end

        targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
    else
        targetCFrame = Cam.CFrame
    end
    Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness)
end)

FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newFov = tonumber(FovSlider.Text)
        if newFov then
            fov = newFov
        else
            FovSlider.Text = tostring(fov)
        end
    end
end)

SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newSmoothness = tonumber(SmoothnessSlider.Text)
        if newSmoothness then
            smoothness = newSmoothness
        else
            SmoothnessSlider.Text = tostring(smoothness)
        end
    end
end)

CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text)
        if newCrosshairDistance then
            crosshairDistance = newCrosshairDistance
        else
            CrosshairDistanceSlider.Text = tostring(crosshairDistance)
        end
    end
end)
end})

Tab:AddButton({
    Name = "修改玩家碰撞体积箱",
    Callback = function()
local Close = Instance.new("TextButton")
local Open2 = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local FightingGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local Cre = Instance.new("TextLabel")
local HitBox = Instance.new("TextBox")
local Red = Instance.new("TextBox")
local Green = Instance.new("TextBox")
local Blue = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

FightingGui.Name = "FightingGui"
FightingGui.Parent = game.CoreGui
FightingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


Open2.Name = "Tools"
Open2.Parent = game.CoreGui
Open2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Open.Name = "开/关"
Open.Parent = Open2
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 0.451871663, 0)
Open.Size = UDim2.new(0, 78, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "开/关"
Open.TextColor3 = Color3.fromRGB(250, 0, 0)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Down:Connect(function()
 FightingGui.Enabled = true
end)

Close.Name = "Close"
Close.Parent = main
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.Position = UDim2.new(1, 0, -0.226244345, 0)
Close.Size = UDim2.new(0, 60, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
 FightingGui.Enabled = false
end)

main.Parent = FightingGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.073011741, 0, 0.237333342, 0)
main.Size = UDim2.new(0, 273, 0, 221)
main.Draggable = true

Cre.Name = "Cre"
Cre.Parent = main
Cre.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Cre.Position = UDim2.new(0, 0, -0.226244345, 0)
Cre.Size = UDim2.new(0, 273, 0, 50)
Cre.Font = Enum.Font.SourceSans
Cre.Text = "修改人物碰撞体积箱"
Cre.TextColor3 = Color3.fromRGB(0, 0, 0)
Cre.TextScaled = true
Cre.TextSize = 14.000
Cre.TextWrapped = true

HitBox.Name = "输入"
HitBox.Parent = main
HitBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HitBox.Position = UDim2.new(0.0586080588, 0, 0.0995475128, 0)
HitBox.Size = UDim2.new(0, 65, 0, 50)
HitBox.Font = Enum.Font.SourceSans
HitBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
HitBox.PlaceholderText = "输入"
HitBox.Text = ""
HitBox.TextColor3 = Color3.fromRGB(0, 0, 0)
HitBox.TextScaled = true
HitBox.TextSize = 14.000
HitBox.TextWrapped = true

Red.Name = "红色"
Red.Parent = main
Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Red.Position = UDim2.new(0.485832304, 0, 0.0995475128, 0)
Red.Size = UDim2.new(0, 37, 0, 31)
Red.Font = Enum.Font.SourceSans
Red.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Red.PlaceholderText = "红色"
Red.Text = ""
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000

Green.Name = "绿色"
Green.Parent = main
Green.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Green.Position = UDim2.new(0.665319502, 0, 0.0995475128, 0)
Green.Size = UDim2.new(0, 37, 0, 31)
Green.Font = Enum.Font.SourceSans
Green.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Green.PlaceholderText = "绿色"
Green.Text = ""
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.Position = UDim2.new(0.47118023, 0, 0.325791866, 0)
TextLabel.Size = UDim2.new(0, 140, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "颜色"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Blue.Name = "蓝色"
Blue.Parent = main
Blue.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Blue.Position = UDim2.new(0.837480664, 0, 0.0995475128, 0)
Blue.Size = UDim2.new(0, 37, 0, 31)
Blue.Font = Enum.Font.SourceSans
Blue.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Blue.PlaceholderText = "蓝色"
Blue.Text = ""
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
game:GetService("RunService").RenderStepped:connect(function()
 for i,v in next, game.Players:GetPlayers() do
  if v.Name ~= game.Players.LocalPlayer.Name then
   v.Character.HumanoidRootPart.Size = Vector3.new(HitBox.Text,HitBox.Text,HitBox.Text)
   v.Character.HumanoidRootPart.Transparency = 0.8
   v.Character.HumanoidRootPart.Color = Color3.new(Red.Text,Green.Text,Blue.Text)
   v.Character.HumanoidRootPart.Material = "Neon"
   v.Character.HumanoidRootPart.CanCollide = false
  end
 end
end)
end})

Tab:AddButton({
    Name = "防甩飞",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/AntiFling.lua"))()
end})

Tab:AddButton({
    Name = "国服马可",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0"))()
end})

Tab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
    if Value then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end})

Tab:AddButton({
    Name = "夜视",
    Callback = function()
local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)
end})

Tab:AddButton({
    Name = "超高画质",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end})

Tab:AddButton({
    Name = "光影",
    Default = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end})

Tab:AddButton({
    Name = "飞车",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
end})

Tab:AddButton({
    Name = "动作 ( 部分服务器不可用 )",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
end})

Tab:AddButton({
    Name = "电脑键盘",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
end})

Tab:AddButton({
    Name = "踏空行走",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
end})

local Tab = Window:MakeTab({
    Name = "玩家",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "移动速度 ( 部分服务器没效果 )",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end})

Tab:AddTextbox({
    Name = "跳跃高度 ( 部分服务器没效果 )",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end})

Tab:AddTextbox({
    Name = "重力设置 ( 部分服务器没效果 )",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
game.Workspace.Gravity = Value
end})

Tab:AddToggle({
    Name = "穿墙",
    Default = false,
    Callback = function(Value)
    if Value then
        Noclip = true
        Stepped = game.RunService.Stepped:Connect(function()
            if Noclip == true then
                for a, b in pairs(game.Workspace:GetChildren()) do
                    if b.Name == game.Players.LocalPlayer.Name then
                        for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    else
        Noclip = false
    end
end})

Tab:AddButton({
    Name = "无限跳跃",
    Callback = function()
    game:GetService("UserInputService").JumpRequest:connect(function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end)
end})

Tab:AddButton({
    Name = "传送玩家",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/YNVbeqPy"))()
end})

Tab:AddButton({
    Name = "透视",
    Callback = function()
local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(Player)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = Player.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage

    local plrchar = Player.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[Player] = Player.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(Player)
    local plrname = Player.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[Player] then
        connections[Player]:Disconnect()
    end
end)
end})

Tab:AddButton({
    Name = "飞行",
    Callback = function()
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
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "飞行"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game.Players.LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "飞行";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

    if nowe == true then
        nowe = false

        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else
        nowe = true



        for i = 1, speeds do
            spawn(function()

                local hb = game:GetService("RunService").Heartbeat    


                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end

            end)
        end
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        local Char = game.Players.LocalPlayer.Character
        local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:AdjustSpeed(0)
        end
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end




    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



        local Player = game.Players.LocalPlayer
        local torso = Player.Character.Torso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0


        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            Player.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game.Players.LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService("RunService").RenderStepped:Wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        Player.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false




    else
        local Player = game.Players.LocalPlayer
        local UpperTorso = Player.Character.UpperTorso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0


        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            Player.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game.Players.LocalPlayer.Character.Humanoid.Health == 0 do
            wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end

            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        Player.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false



    end





end)

local tis

up.MouseButton1Down:connect(function()
    tis = up.MouseEnter:connect(function()
        while tis do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
        end
    end)
end)

up.MouseLeave:connect(function()
    if tis then
        tis:Disconnect()
        tis = nil
    end
end)

local dis

down.MouseButton1Down:connect(function()
    dis = down.MouseEnter:connect(function()
        while dis do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
        end
    end)
end)

down.MouseLeave:connect(function()
    if dis then
        dis:Disconnect()
        dis = nil
    end
end)


game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = speeds
    if nowe == true then


        tpwalking = false
        for i = 1, speeds do
            spawn(function()

                local hb = game:GetService("RunService").Heartbeat    


                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end

            end)
        end
    end
end)
mine.MouseButton1Down:connect(function()
    if speeds == 1 then
        speed.Text = "cannot be less than 1"
        wait(1)
        speed.Text = speeds
    else
        speeds = speeds - 1
        speed.Text = speeds
        if nowe == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()

                    local hb = game:GetService("RunService").Heartbeat    


                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end

                end)
            end
        end
    end
end)

closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    onof.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    mini2.Visible = true
    main.Frame.BackgroundTransparency = 1
    closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    onof.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    mini2.Visible = false
    main.Frame.BackgroundTransparency = 0
    closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
end})

local Tab = Window:MakeTab({
    Name = "DOORS",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "绕过DOORS加速反作弊",
    Callback = function()
local Collision = game.Players.LocalPlayer.Character:WaitForChild"Collision"
local Crouch = Collision.CollisionCrouch
Crouch.Massless = true

local OTick = tick()
game:GetService("RunService"):BindToRenderStep("Bypass", 999, function()
    if (tick() - OTick) >= .2 then
        Collision.Massless = not Collision.Massless
        OTick = tick()
    end
end)
end})

Tab:AddButton({
    Name = "NB DOORS",
    Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/DOORS/raw/main/Scripts/Gui/NBDOORS"))()
end})

Tab:AddButton({
    Name = "mspaint",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end})

Tab:AddButton({
    Name = "NB DOORS FLOOR2",
    Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/DF2RW.lua"))()
end})

Tab:AddButton({
    Name = "MS HUB",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"))()
end})

Tab:AddButton({
    Name = "BlackKing汉化版",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end})

Tab:AddButton({
    Name = "自动Rooms ( 请先开启所有带自动的功能否则不能自动躲柜子 )",
    Callback = function()
if game.PlaceId ~= 6839171747 or game.ReplicatedStorage.GameData.Floor.Value ~= "Rooms" then

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示";
    Text = "请到Rooms里执行";
    Icon = "rbxassetid://14250466898";
    Duration = 5;
})
    
local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://4590662766"
    Sound.Parent = game:GetService("SoundService")
    Sound.Volume = 5
    Sound:Play()
    
    return
elseif workspace:FindFirstChild("PathFindPartsFolder") then

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示";
    Text = "?";
    Icon = "rbxassetid://14250466898";
    Duration = 5;
})

local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://4590662766"
    Sound.Parent = game:GetService("SoundService")
    Sound.Volume = 5
    Sound:Play()

    return
end

local PathfindingService = game:GetService("PathfindingService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = game.Players.LocalPlayer
local LatestRoom = game.ReplicatedStorage.GameData.LatestRoom

local Cooldown = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui

TextLabel.Size = UDim2.new(0,350,0,100)
TextLabel.TextSize = 48
TextLabel.TextStrokeColor3 = Color3.new(1,1,1)
TextLabel.TextStrokeTransparency = 0
TextLabel.BackgroundTransparency = 1

local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
end

local Folder = Instance.new("Folder")
Folder.Parent = workspace
Folder.Name = "PathFindPartsFolder"

if LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") then
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Name = "lol"
end

function getLocker()
    local Closest

    for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
        if v.Name == "Rooms_Locker" then
            if v:FindFirstChild("Door") and v:FindFirstChild("HiddenPlayer") then
                if v.HiddenPlayer.Value == nil then
                    if v.Door.Position.Y > -3 then
                        if Closest == nil then
                            Closest = v.Door
                        else
                            if (LocalPlayer.Character.HumanoidRootPart.Position - v.Door.Position).Magnitude < (Closest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                                Closest = v.Door
                            end
                        end
                    end
                end
            end
        end
    end
    return Closest
end

function getPath()
    local Part
    
    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity and Entity.Main.Position.Y > -4 then
        Part = getLocker()
    else
        Part = workspace.CurrentRooms[LatestRoom.Value].Door.Door
    end
    return Part
end

LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    TextLabel.Text = "Room: "..math.clamp(LatestRoom.Value, 1,1000)

    if LatestRoom.Value ~= 1000 then
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    else
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
    
        Folder:ClearAllChildren()

    local Sound = Instance.new("Sound")
          Sound.SoundId = "rbxassetid://4590662766"
          Sound.Parent = game:GetService("SoundService")
          Sound.Volume = 5
          Sound:Play()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示";
    Text = "已到达A-1000";
    Icon = "rbxassetid://14250466898";
    Duration = 5;
})
        return
    end
end)

game:GetService("RunService").RenderStepped:connect(function()
    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    LocalPlayer.Character.Collision.CanCollide = false
    LocalPlayer.Character.Collision.Size = Vector3.new(8,LocalPlayer.Character.Collision.Size.Y,8)

    LocalPlayer.Character.Humanoid.WalkSpeed = 21

    local Path = getPath()

    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity then
        if Path then
            if Path.Parent.Name == "Rooms_Locker" then
                if Entity.Main.Position.Y > -4 then
                    if (LocalPlayer.Character.HumanoidRootPart.Position - Path.Position).Magnitude < 2 then
                        if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                            fireproximityprompt(Path.Parent.HidePrompt)
                        end
                    end
                end
            end
        end
        if Entity.Main.Position.Y < -4 then
            if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
                LocalPlayer.Character:SetAttribute("Hiding", false)
            end
        end
    else
        if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
            LocalPlayer.Character:SetAttribute("Hiding", false)
        end
    end
end)

while true do

    local Destination = getPath()

    local path = PathfindingService:CreatePath({ WaypointSpacing = 1, AgentRadius = 0.1, AgentCanJump = false })
    path:ComputeAsync(LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0,2,0), Destination.Position)
    local Waypoints = path:GetWaypoints()

    if path.Status ~= Enum.PathStatus.NoPath then

        Folder:ClearAllChildren()

        for _, Waypoint in pairs(Waypoints) do
            local part = Instance.new("Part")
            part.Size = Vector3.new(1,1,1)
            part.Position = Waypoint.Position
            part.Shape = "Cylinder"
            part.Rotation = Vector3.new(0,0,90)
            part.Material = "SmoothPlastic"
            part.Anchored = true
            part.CanCollide = false
            part.Parent = Folder
        end

        for _, Waypoint in pairs(Waypoints) do
            if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
                LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
            end
        end
    end
end
end})

Tab:AddButton({
    Name = "生成Rush",
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/DOORS-Custom-Entity-S*er-V2-21705"))()
end})

local Tab = Window:MakeTab({
    Name = "DOORS物品",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "NB DOORS物品",
    Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/DOORS/raw/main/Scripts/Gui/ItemHub"))()
end})

Tab:AddButton({
    Name = "NVCS-3000 ( 夜视仪 )",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\78\86\67\83\45\51\48\48\48"))()
end})

Tab:AddButton({
    Name = "星光桶",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\83\116\97\114\74\117\103"))()
end})

Tab:AddButton({
    Name = "神圣手雷",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end})

Tab:AddButton({
    Name = "磁铁",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end})

Tab:AddButton({
    Name = "剪刀",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/v2yEJYmu"))()
end})

local Tab = Window:MakeTab({
    Name = "Rooms & Doors",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "情云与DX共同制作"
})

Tab:AddButton({
    Name = "Rooms & Doors",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Rooms%20%26%20Doors"))()
end})

local Tab = Window:MakeTab({
    Name = "压力",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "迷途之子",
    Callback = function()
loadstring(game:HttpGet("https://szto.hkjc.uk/code"))()
end})

Tab:AddButton({
    Name = "情云压力",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Pressure"))()
end})

local Tab = Window:MakeTab({
    Name = "俄亥俄州",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "自瞄 ( 头部 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "Head",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 身体 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "HumanoidRootPart",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄锁头老版本",
    Callback = function()
local fov = 50
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头老版本 ( 大范围 )",
    Callback = function()
local fov = 100
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头 ( 斩念提供 )",
    Callback = function()
local fov = 100
local smoothness = 10
local crosshairDistance = 5

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 255, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FovAdjustGui"
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(128, 0, 128)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0.4, 0, 0.4, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
MinimizeButton.Parent = Frame

local isMinimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "+"
    else
        Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "-"
    end
end)

local FovLabel = Instance.new("TextLabel")
FovLabel.Name = "FovLabel"
FovLabel.Text = "自瞄范围"
FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FovLabel.BackgroundTransparency = 1
FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
FovLabel.Parent = Frame

local FovSlider = Instance.new("TextBox")
FovSlider.Name = "FovSlider"
FovSlider.Text = tostring(fov)
FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
FovSlider.Parent = Frame

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Name = "SmoothnessLabel"
SmoothnessLabel.Text = "自瞄平滑度"
SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessLabel.Parent = Frame

local SmoothnessSlider = Instance.new("TextBox")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Text = tostring(smoothness)
SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0)
SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessSlider.Parent = Frame

local CrosshairDistanceLabel = Instance.new("TextLabel")
CrosshairDistanceLabel.Name = "CrosshairDistanceLabel"
CrosshairDistanceLabel.Text = "自瞄预判距离"
CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceLabel.BackgroundTransparency = 1
CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceLabel.Parent = Frame

local CrosshairDistanceSlider = Instance.new("TextBox")
CrosshairDistanceSlider.Name = "CrosshairDistanceSlider"
CrosshairDistanceSlider.Text = tostring(crosshairDistance)
CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0)
CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceSlider.Parent = Frame

local targetCFrame = Cam.CFrame

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
    FOVring.Radius = fov
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()

    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        local targetCharacter = closest.Character
        local targetHead = targetCharacter.Head
        local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

        local isMoving = targetRootPart.Velocity.Magnitude > 0.1

        local targetPosition
        if isMoving then
            targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance)
        else
            targetPosition = targetHead.Position
        end

        targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
    else
        targetCFrame = Cam.CFrame
    end
    Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness)
end)

FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newFov = tonumber(FovSlider.Text)
        if newFov then
            fov = newFov
        else
            FovSlider.Text = tostring(fov)
        end
    end
end)

SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newSmoothness = tonumber(SmoothnessSlider.Text)
        if newSmoothness then
            smoothness = newSmoothness
        else
            SmoothnessSlider.Text = tostring(smoothness)
        end
    end
end)

CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text)
        if newCrosshairDistance then
            crosshairDistance = newCrosshairDistance
        else
            CrosshairDistanceSlider.Text = tostring(crosshairDistance)
        end
    end
end)
end})

Tab:AddButton({
    Name = "修改玩家碰撞体积箱 ( 近战武器有效 )",
    Callback = function()
local Close = Instance.new("TextButton")
local Open2 = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local FightingGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local Cre = Instance.new("TextLabel")
local HitBox = Instance.new("TextBox")
local Red = Instance.new("TextBox")
local Green = Instance.new("TextBox")
local Blue = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

FightingGui.Name = "FightingGui"
FightingGui.Parent = game.CoreGui
FightingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


Open2.Name = "Tools"
Open2.Parent = game.CoreGui
Open2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Open.Name = "开/关"
Open.Parent = Open2
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 0.451871663, 0)
Open.Size = UDim2.new(0, 78, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "开/关"
Open.TextColor3 = Color3.fromRGB(250, 0, 0)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Down:Connect(function()
 FightingGui.Enabled = true
end)

Close.Name = "Close"
Close.Parent = main
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.Position = UDim2.new(1, 0, -0.226244345, 0)
Close.Size = UDim2.new(0, 60, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
 FightingGui.Enabled = false
end)

main.Parent = FightingGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.073011741, 0, 0.237333342, 0)
main.Size = UDim2.new(0, 273, 0, 221)
main.Draggable = true

Cre.Name = "Cre"
Cre.Parent = main
Cre.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Cre.Position = UDim2.new(0, 0, -0.226244345, 0)
Cre.Size = UDim2.new(0, 273, 0, 50)
Cre.Font = Enum.Font.SourceSans
Cre.Text = "修改人物碰撞体积箱"
Cre.TextColor3 = Color3.fromRGB(0, 0, 0)
Cre.TextScaled = true
Cre.TextSize = 14.000
Cre.TextWrapped = true

HitBox.Name = "输入"
HitBox.Parent = main
HitBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HitBox.Position = UDim2.new(0.0586080588, 0, 0.0995475128, 0)
HitBox.Size = UDim2.new(0, 65, 0, 50)
HitBox.Font = Enum.Font.SourceSans
HitBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
HitBox.PlaceholderText = "输入"
HitBox.Text = ""
HitBox.TextColor3 = Color3.fromRGB(0, 0, 0)
HitBox.TextScaled = true
HitBox.TextSize = 14.000
HitBox.TextWrapped = true

Red.Name = "红色"
Red.Parent = main
Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Red.Position = UDim2.new(0.485832304, 0, 0.0995475128, 0)
Red.Size = UDim2.new(0, 37, 0, 31)
Red.Font = Enum.Font.SourceSans
Red.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Red.PlaceholderText = "红色"
Red.Text = ""
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000

Green.Name = "绿色"
Green.Parent = main
Green.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Green.Position = UDim2.new(0.665319502, 0, 0.0995475128, 0)
Green.Size = UDim2.new(0, 37, 0, 31)
Green.Font = Enum.Font.SourceSans
Green.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Green.PlaceholderText = "绿色"
Green.Text = ""
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.Position = UDim2.new(0.47118023, 0, 0.325791866, 0)
TextLabel.Size = UDim2.new(0, 140, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "颜色"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Blue.Name = "蓝色"
Blue.Parent = main
Blue.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Blue.Position = UDim2.new(0.837480664, 0, 0.0995475128, 0)
Blue.Size = UDim2.new(0, 37, 0, 31)
Blue.Font = Enum.Font.SourceSans
Blue.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Blue.PlaceholderText = "蓝色"
Blue.Text = ""
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
game:GetService("RunService").RenderStepped:connect(function()
 for i,v in next, game.Players:GetPlayers() do
  if v.Name ~= game.Players.LocalPlayer.Name then
   v.Character.HumanoidRootPart.Size = Vector3.new(HitBox.Text,HitBox.Text,HitBox.Text)
   v.Character.HumanoidRootPart.Transparency = 0.8
   v.Character.HumanoidRootPart.Color = Color3.new(Red.Text,Green.Text,Blue.Text)
   v.Character.HumanoidRootPart.Material = "Neon"
   v.Character.HumanoidRootPart.CanCollide = false
  end
 end
end)
end})

Tab:AddButton({
    Name = "玩家控制",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-QY/Main/Ohio"))()
end})

local Tab = Window:MakeTab({
    Name = "内脏与黑火药",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "明月清风",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\71\65\66\80"))()
end})

local Tab = Window:MakeTab({
    Name = "内脏与黑火药动画",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

local Player = game.Players.LocalPlayer
local char
local connect
connect = Player.CharacterAdded:Connect(function(c)
char = c
end)

local flags = {
    ShamblerAnimation = false,
    BomberAnimation = false,
    RunnerAnimation = false,
    ZapperAnimation = false,
    IgniterAnimation = false,
    HeadlessAnimation = false,
    CuirassierAnimation = false,
    CuirassierChargeAnimation = false,
    ChargeAnimation = false,
    ChargeLanceAnimation = false,
    ChargeHeavyAnimation = false,
    HeadlessHorsemanAnimation2 = false,
    HeadlessHorsemanAnimation2 = false
}

Tab:AddToggle({
    Name = "Shambler动画",
    Default = false,
    Callback = function(Value)
    flags.ShamblerAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.ShamblerAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "ShamblerIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ShamblerIdle"
                    Animation.AnimationId = "rbxassetid://12333488814"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ShamblerWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ShamblerIdle"
                    Animation.AnimationId = "rbxassetid://12333488814"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ShamblerIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Walks = {"14463697470","14463730540","14463758355","14464590442"}
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ShamblerWalk"
                    Animation.AnimationId = "rbxassetid://"..Walks[math.random(1, #Walks)]
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.ShamblerAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ShamblerWalk" then
            v:Stop()
       elseif tostring(v) == "ShamblerIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Bomber动画",
    Default = false,
    Callback = function(Value)
    flags.BomberAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.BomberAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "BomberIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "BomberIdle"
                    Animation.AnimationId = "rbxassetid://13211198049"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "BomberWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "BomberIdle"
                    Animation.AnimationId = "rbxassetid://13211198049"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "BomberIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "BomberWalk"
                    Animation.AnimationId = "rbxassetid://13211207597"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.BomberAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "BomberWalk" then
            v:Stop()
       elseif tostring(v) == "BomberIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Runner动画",
    Default = false,
    Callback = function(Value)
    flags.RunnerAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.RunnerAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "RunnerIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "RunnerIdle"
                    Animation.AnimationId = "rbxassetid://12581784105"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "RunnerRun" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "RunnerIdle"
                    Animation.AnimationId = "rbxassetid://12581784105"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "RunnerIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Walks = {"12581786940","12581785298","12581788539"}
                    local Animation = Instance.new("Animation")
                    Animation.Name = "RunnerRun"
                    Animation.AnimationId = "rbxassetid://"..Walks[math.random(1, #Walks)]
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.RunnerAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "RunnerRun" then
            v:Stop()
       elseif tostring(v) == "RunnerIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Zapper动画",
    Default = false,
    Callback = function(Value)
    flags.ZapperAnimation = Value
    if Value then
    local walk = false
    local idle = false
        while flags.ZapperAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 or humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ZapperWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ZapperIdle"
                    Animation.AnimationId = "rbxassetid://14498563473"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ZapperIdle" then
                    v:Stop()
                    idle = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ZapperWalk"
                    Animation.AnimationId = "rbxassetid://14498289874"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                end
            end
        end
        repeat task.wait() until not flags.ZapperAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ZapperWalk" then
            v:Stop()
       elseif tostring(v) == "ZapperIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Igniter动画",
    Default = false,
    Callback = function(Value)
    flags.IgniterAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.IgniterAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "IgniterIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "IgniterIdle"
                    Animation.AnimationId = "rbxassetid://14678879479"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "IgniterWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "IgniterIdle"
                    Animation.AnimationId = "rbxassetid://14678879479"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "IgniterIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "IgniterWalk"
                    Animation.AnimationId = "rbxassetid://14678880308"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.IgniterAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "IgniterWalk" then
            v:Stop()
       elseif tostring(v) == "IgniterIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Headless动画",
    Default = false,
    Callback = function(Value)
    flags.HeadlessAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.HeadlessAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "HeadlessIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessIdle"
                    Animation.AnimationId = "rbxassetid://107080941320600"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "HeadlessWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessIdle"
                    Animation.AnimationId = "rbxassetid://107080941320600"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "HeadlessIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessWalk"
                    Animation.AnimationId = "rbxassetid://74764025513892"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.HeadlessAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "HeadlessWalk" then
            v:Stop()
       elseif tostring(v) == "HeadlessIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Cuirassier动画",
    Default = false,
    Callback = function(Value)
    flags.CuirassierAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.CuirassierAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "CuirassierIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "CuirassierIdle"
                    Animation.AnimationId = "rbxassetid://82800474630427"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "CuirassierWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "CuirassierIdle"
                    Animation.AnimationId = "rbxassetid://82800474630427"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "CuirassierIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "CuirassierWalk"
                    Animation.AnimationId = "rbxassetid://118210337289087"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.CuirassierAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "CuirassierWalk" then
            v:Stop()
       elseif tostring(v) == "CuirassierIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Cuirassier Charge动画",
    Default = false,
    Callback = function(Value)
    flags.CuirassierChargeAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.CuirassierChargeAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "CuirassierIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "CuirassierIdle"
                    Animation.AnimationId = "rbxassetid://82800474630427"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "CuirassierCharge" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "CuirassierIdle"
                    Animation.AnimationId = "rbxassetid://82800474630427"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "CuirassierIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "CuirassierCharge"
                    Animation.AnimationId = "rbxassetid://73945225930488"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.CuirassierChargeAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "CuirassierCharge" then
            v:Stop()
       elseif tostring(v) == "CuirassierIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Charge动画",
    Default = false,
    Callback = function(Value)
    flags.ChargeAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.ChargeAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "ChargeIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeIdle"
                    Animation.AnimationId = "rbxassetid://14284611111"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ChargeRun" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeIdle"
                    Animation.AnimationId = "rbxassetid://14284611111"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ChargeIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeRun"
                    Animation.AnimationId = "rbxassetid://14284623849"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.ChargeAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ChargeRun" then
            v:Stop()
       elseif tostring(v) == "ChargeIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Charge Lance动画",
    Default = false,
    Callback = function(Value)
    flags.ChargeLanceAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.ChargeLanceAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "ChargeLanceIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeLanceIdle"
                    Animation.AnimationId = "rbxassetid://15669227704"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ChargeLanceRun" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeLanceIdle"
                    Animation.AnimationId = "rbxassetid://15669227704"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ChargeLanceIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeLanceRun"
                    Animation.AnimationId = "rbxassetid://15669228671"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.ChargeLanceAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ChargeLanceRun" then
            v:Stop()
       elseif tostring(v) == "ChargeLanceIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Charge Heavy动画",
    Default = false,
    Callback = function(Value)
    flags.ChargeHeavyAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.ChargeHeavyAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "ChargeHeavyIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeHeavyIdle"
                    Animation.AnimationId = "rbxassetid://14284611111"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ChargeHeavyRun" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeHeavyIdle"
                    Animation.AnimationId = "rbxassetid://14284611111"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ChargeHeavyIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ChargeHeavyRun"
                    Animation.AnimationId = "rbxassetid://17406602570"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.ChargeHeavyAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ChargeHeavyRun" then
            v:Stop()
       elseif tostring(v) == "ChargeHeavyIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Headless Horseman动画1",
    Default = false,
    Callback = function(Value)
    flags.HeadlessHorsemanAnimation1 = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.HeadlessHorsemanAnimation1 do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "HeadlessHorsemanIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessHorsemanIdle"
                    Animation.AnimationId = "rbxassetid://13936362530"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "HeadlessHorseman" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessHorsemanIdle"
                    Animation.AnimationId = "rbxassetid://13936362530"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "HeadlessHorsemanIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessHorseman"
                    Animation.AnimationId = "rbxassetid://13936362530"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.HeadlessHorsemanAnimation1
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "HeadlessHorseman" then
            v:Stop()
       elseif tostring(v) == "HeadlessHorsemanIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Headless Horseman动画2",
    Default = false,
    Callback = function(Value)
    flags.HeadlessHorsemanAnimation2 = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.HeadlessHorsemanAnimation2 do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "HeadlessHorsemanIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessHorsemanIdle"
                    Animation.AnimationId = "rbxassetid://13936362530"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "HeadlessHorseman" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessHorsemanIdle"
                    Animation.AnimationId = "rbxassetid://13936362530"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "HeadlessHorsemanIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "HeadlessHorseman"
                    Animation.AnimationId = "rbxassetid://14998290995"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.HeadlessHorsemanAnimation2
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "HeadlessHorseman" then
            v:Stop()
       elseif tostring(v) == "HeadlessHorsemanIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddButton({
    Name = "Zapper挥砍动画",
    Callback = function()
    if char then
        local tool = char:FindFirstChild("Axe") or char:FindFirstChild("Pickaxe") or char:FindFirstChild("Baguette") or Player.Backpack:FindFirstChild("Axe") or Player.Backpack:FindFirstChild("Pickaxe") or Player.Backpack:FindFirstChild("Baguette")
        if tool.Parent ~= char then
        tool.Parent = char
        end
        local Handle = Instance.new("Part", tool)
        Handle.Name = "Handle"
        Handle.CanCollide = false
        Handle.Transparency = 1
        task.spawn(function()
        task.wait(2.5)
        Handle:Destroy()
        end)
        task.spawn(function()
            repeat
            task.wait()
            pcall(function()
            end)
            until not Handle
        end)
        local Animation = Instance.new("Animation")
        Animation.Name = "Zapper Swing"
        Animation.AnimationId = "rbxassetid://14499470197"
        local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
        k:Play()
        Handle.Touched:Connect(function(Hit)
        pcall(function()
        if Hit.Parent ~= char and Hit.Parent ~= Model and Hit.Parent.Name ~= "3D_Clothing" then
               if Hit.Parent.Zombie then
               local Head = {
               [1] = "HitZombie",
               [2] = Hit.Parent,
               [3] = Hit.Parent.Head.CFrame.Position,
               [4] = true
               }
               tool.RemoteEvent:FireServer("Swing","Over")
               tool.RemoteEvent:FireServer(unpack(Head))
                    end
                end
            end)
        end)
    end
end})

local Tab = Window:MakeTab({
    Name = "莱克星顿与康科德",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "明月清风",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\76\67"))()
end})

local Tab = Window:MakeTab({
    Name = "犯罪",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "自瞄 ( 头部 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "Head",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 身体 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "HumanoidRootPart",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "防Criminology踢出",
    Callback = function()
    for _, Value in next, getgc(true) do
        if typeof(Value) == "table" then
            if rawget(Value, "indexInstance") or rawget(Value, "newindexInstance") or rawget(Value, "newIndexInstance") then
                Value.tvk = {"kick", function() return task.wait(9e9) end}
            end
        end
    end
end})

Tab:AddButton({
    Name = "Criminology",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PresidentAnvil/temp-criminology/main/criminology.lua"))()
end})

Tab:AddButton({
    Name = "Criminology Light",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/PresidentAnvil/crimlight/main/criminologylight.lua"))()
end})

Tab:AddButton({
    Name = "复制Criminology卡密获取链接",
    Callback = function()
setclipboard("https://linkvertise.com/1193953/free-criminality-gui")
end})

Tab:AddButton({
    Name = "Max Hub",
    Callback = function()
script_key = "\76\68\99\89\71\75\85\112\105\97\118\107\67\101\78\101\109\86\78\116\100\81\87\88\107\116\85\85\102\84\102\100";
_G.MaxHub = {
    GlobalChat = false,
    Notifications = true
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/993b07de445441e83e15ce5fde260d5f.lua"))()
end})

Tab:AddButton({
    Name = "qwertyu4t55567rgdf的犯罪脚本",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyu4t55567rgdf/fling/main/Loader.lua"))()
end})

Tab:AddButton({
    Name = "不知名犯罪脚本",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vuubvyc/UNDETECTEDWAREEE/main/Script"))()
end})

local Tab = Window:MakeTab({
    Name = "最强战场",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "自瞄 ( 头部 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "Head",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 身体 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "HumanoidRootPart",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "垃圾桶战神",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/main/Trashcan%20Man"))()
end})

Tab:AddButton({
    Name = "动作集 ( 别人可以看见 )",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt"))()
end})

Tab:AddButton({
    Name = "卡UI了无法滑动 ? 点我",
    Callback = function()
game:GetService("CoreGui")["Discord"]:Destroy()
end})

local Tab = Window:MakeTab({
    Name = "被遗弃",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "情云Forsaken",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Forsaken"))()
end})

Tab:AddButton({
    Name = "AppleStuff",
    Callback = function()
loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/SilkScripts/AppleStuff/main/AppleFSKV2")))()
end})

Tab:AddButton({
    Name = "FartHub",
    Callback = function()
loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua")))()
end})

local Tab = Window:MakeTab({
    Name = "脚本中心",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "脚本中心",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
end})

Tab:AddButton({
    Name = "XK脚本中心",
    Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()
end})

local Tab = Window:MakeTab({
    Name = "其他",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

OrionLib:Init()
end