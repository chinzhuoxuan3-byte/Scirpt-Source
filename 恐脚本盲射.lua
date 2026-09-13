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

local Options = Library.Options
local Toggles = Library.Toggles
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local isModelLoadActive = false
local isDistanceShowActive = false
local isDoubleMoneyActive = false
local isScriptRunning = true

local playerLoopHandle = {}

local CurrentCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local CurrentHumanoid = CurrentCharacter:WaitForChild("Humanoid", 10)

LocalPlayer.CharacterAdded:Connect(function(newChar)
    CurrentCharacter = newChar
    CurrentHumanoid = newChar:WaitForChild("Humanoid", 10)
    -- 若某些功能开启，需要重置 Humanoid 设置
    if isFaceNearestActive then
        pcall(function() CurrentHumanoid.AutoRotate = false end)
    end
    if isSmoothFollowActive then
        pcall(function() CurrentHumanoid.WalkSpeed = 0 end)
    end
    if isSpeedLockActive then
        pcall(function() CurrentHumanoid.WalkSpeed = speedValue end)
    end
end)

local function getWebContent(url)
    return game:HttpGet(url)
end

local function runLuaCode(code)
    loadstring(code)()
end

-- ============== 原功能函数 ==============
local function loadPlayerModel(player)
    if player == LocalPlayer then return end
    local loopRunning = true
    local function stopLoop()
        loopRunning = false
    end
    task.spawn(function()
        while loopRunning and isModelLoadActive and isScriptRunning and player:IsDescendantOf(Players) do
            task.wait(0.5)
            pcall(function()
                if player.Character then
                    player.Character.Archivable = true
                    player.Character.Parent = workspace
                end
            end)
            pcall(function()
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local head = char:FindFirstChild("Head")
                    if hrp then hrp.LocalTransparencyModifier = 0 end
                    if head then head.LocalTransparencyModifier = 0 end
                end
            end)
        end
    end)
    return stopLoop
end

local function drawPlayerMarker(player)
    if player == LocalPlayer then return end
    local loopRunning = true
    local function stopLoop()
        loopRunning = false
        pcall(function()
            if player.Character then
                local marker = player.Character:FindFirstChild("PlayerMarker", true)
                if marker then
                    marker.Parent:Destroy()
                end
            end
        end)
    end
    task.spawn(function()
        while loopRunning and isModelLoadActive and isScriptRunning and player:IsDescendantOf(Players) do
            task.wait(0.5)
            pcall(function()
                local char = player.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                if not root then return end
                local existing = root:FindFirstChild("PlayerMarker")
                if existing then existing:Destroy() end
                local bg = Instance.new("BillboardGui")
                bg.Name = "PlayerMarker"
                bg.AlwaysOnTop = true
                bg.Size = UDim2.new(0.02, 0, 0.02, 0)
                bg.Adornee = root
                bg.Parent = root
                local f = Instance.new("Frame")
                f.Size = UDim2.new(1, 0, 1, 0)
                f.BackgroundColor3 = Color3.new(1, 0, 0)
                f.BorderSizePixel = 0
                f.Parent = bg
            end)
        end
    end)
    return stopLoop
end

local function startAllPlayerFunc()
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local stopLoad = loadPlayerModel(player)
        local stopMarker = drawPlayerMarker(player)
        playerLoopHandle[player.UserId] = {stopLoad, stopMarker}
    end
end

local function stopAllPlayerFunc()
    for userId, handleList in pairs(playerLoopHandle) do
        for _, stopFunc in pairs(handleList) do
            stopFunc()
        end
    end
    table.clear(playerLoopHandle)
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            local marker = player.Character:FindFirstChild("DistanceMarker")
            if marker then marker:Destroy() end
        end
    end
end

-- ============== 新增功能变量与函数 ==============
-- 自动挥拳
local isAutoPunchActive = false
local autoPunchConnection = nil

local function startAutoPunch()
    if autoPunchConnection then return end
    autoPunchConnection = RunService.Heartbeat:Connect(function()
        if not isAutoPunchActive or not isScriptRunning then
            autoPunchConnection:Disconnect()
            autoPunchConnection = nil
            return
        end
        pcall(function()
            local char = LocalPlayer.Character
            if char then
                local fists = char:FindFirstChild("Fists")
                if fists then
                    local remote = fists:FindFirstChild("fistremote")
                    if remote then
                        remote:FireServer("lmb")
                    end
                end
            end
        end)
    end)
end

local function stopAutoPunch()
    isAutoPunchActive = false
    if autoPunchConnection then
        autoPunchConnection:Disconnect()
        autoPunchConnection = nil
    end
end

-- 防坠落 (Y 轴低于 3.0 时强制锁定)
local isFallProtectActive = false
local fallProtectConnection = nil

local function startFallProtect()
    if fallProtectConnection then return end
    fallProtectConnection = RunService.Stepped:Connect(function()
        if not isFallProtectActive or not isScriptRunning then
            fallProtectConnection:Disconnect()
            fallProtectConnection = nil
            return
        end
        pcall(function()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if not root or not hum then return end
            if root.Position.Y < 3.0 then
                root.CFrame = CFrame.new(root.Position.X, 3.0, root.Position.Z)
                root.AssemblyLinearVelocity = Vector3.new(
                    root.AssemblyLinearVelocity.X,
                    0,
                    root.AssemblyLinearVelocity.Z
                )
                if hum:GetState() == Enum.HumanoidStateType.Freefall then
                    hum:ChangeState(Enum.HumanoidStateType.Landed)
                end
            end
        end)
    end)
end

local function stopFallProtect()
    isFallProtectActive = false
    if fallProtectConnection then
        fallProtectConnection:Disconnect()
        fallProtectConnection = nil
    end
end

-- 平滑跟随
local isSmoothFollowActive = false
local smoothFollowTarget = nil
local smoothFollowConnection = nil
local selectedPlayerName = ""

local function updateSmoothFollowTarget()
    if selectedPlayerName ~= "" then
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and target ~= LocalPlayer then
            smoothFollowTarget = target
            return
        end
    end
    local nearest = nil
    local minDist = math.huge
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then
        smoothFollowTarget = nil
        return
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local dist = (myRoot.Position - root.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    nearest = player
                end
            end
        end
    end
    smoothFollowTarget = nearest
end

local function startSmoothFollow()
    if smoothFollowConnection then return end
    updateSmoothFollowTarget()
    -- 锁定自身移速，防止玩家自行移动干扰跟随
    pcall(function()
        if CurrentHumanoid then
            CurrentHumanoid.WalkSpeed = 0
        end
    end)
    smoothFollowConnection = RunService.RenderStepped:Connect(function()
        if not isSmoothFollowActive or not isScriptRunning then
            smoothFollowConnection:Disconnect()
            smoothFollowConnection = nil
            return
        end
        local target = smoothFollowTarget
        if not target or not target.Character then
            updateSmoothFollowTarget()
            target = smoothFollowTarget
        end
        if not target or not target.Character then return end
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot or not myRoot then return end
        -- 修正：使用 +5 站在目标身后（Z轴正向是后方）
        local behindCFrame = targetRoot.CFrame * CFrame.new(0, 0, 5)
        myRoot.CFrame = behindCFrame
    end)
end

local function stopSmoothFollow()
    isSmoothFollowActive = false
    if smoothFollowConnection then
        smoothFollowConnection:Disconnect()
        smoothFollowConnection = nil
    end
    smoothFollowTarget = nil
    -- 恢复默认移速
    pcall(function()
        if CurrentHumanoid then
            CurrentHumanoid.WalkSpeed = 16
        end
    end)
end

-- 朝向最近的人
local isFaceNearestActive = false
local faceNearestConnection = nil

local function startFaceNearest()
    if faceNearestConnection then return end
    -- 关闭 Humanoid 自动旋转，允许手动设置朝向
    pcall(function()
        if CurrentHumanoid then
            CurrentHumanoid.AutoRotate = false
        end
    end)
    faceNearestConnection = RunService.RenderStepped:Connect(function()
        if not isFaceNearestActive or not isScriptRunning then
            faceNearestConnection:Disconnect()
            faceNearestConnection = nil
            return
        end
        pcall(function()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end

            local nearestRoot = nil
            local minDist = math.huge
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        local dist = (myRoot.Position - root.Position).Magnitude
                        if dist < minDist then
                            minDist = dist
                            nearestRoot = root
                        end
                    end
                end
            end
            if not nearestRoot then return end

            -- 直接使用 CFrame.lookAt 获取水平面朝向，不改变位置
            local lookAtPos = nearestRoot.Position
            local horizontalPos = Vector3.new(lookAtPos.X, myRoot.Position.Y, lookAtPos.Z)
            -- 只有当目标点与自身位置有足够距离时才旋转，避免抖动
            if (horizontalPos - myRoot.Position).Magnitude > 0.1 then
                myRoot.CFrame = CFrame.lookAt(myRoot.Position, horizontalPos)
            end
        end)
    end)
end

local function stopFaceNearest()
    isFaceNearestActive = false
    if faceNearestConnection then
        faceNearestConnection:Disconnect()
        faceNearestConnection = nil
    end
    -- 恢复自动旋转
    pcall(function()
        if CurrentHumanoid then
            CurrentHumanoid.AutoRotate = true
        end
    end)
end

-- 移速修改
local isSpeedLockActive = false
local speedValue = 16
local speedLockConnection = nil

local function startSpeedLock()
    if speedLockConnection then return end
    speedLockConnection = RunService.Heartbeat:Connect(function()
        if not isSpeedLockActive or not isScriptRunning then
            speedLockConnection:Disconnect()
            speedLockConnection = nil
            return
        end
        pcall(function()
            if CurrentHumanoid and CurrentHumanoid.WalkSpeed ~= speedValue then
                CurrentHumanoid.WalkSpeed = speedValue
            end
        end)
    end)
end

local function stopSpeedLock()
    isSpeedLockActive = false
    if speedLockConnection then
        speedLockConnection:Disconnect()
        speedLockConnection = nil
    end
    pcall(function()
        if CurrentHumanoid then
            CurrentHumanoid.WalkSpeed = 16  -- 恢复默认
        end
    end)
end

-- 刷新下拉框玩家列表
local dropdownPlayers = nil
local function refreshDropdown()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(names, p.Name)
        end
    end
    if dropdownPlayers then
        -- 兼容不同 UI 库的刷新方式
        if dropdownPlayers.Clear and dropdownPlayers.Add then
            dropdownPlayers:Clear()
            for _, name in ipairs(names) do
                dropdownPlayers:Add(name)
            end
        elseif dropdownPlayers.SetOptions then
            dropdownPlayers:SetOptions(names)
        end
    end
end

-- ============== 原有循环（距离显示） ==============
local renderSteppedConn = RunService.RenderStepped:Connect(function()
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot or not isScriptRunning then return end
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local targetChar = player.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then continue end
        local distanceMarker = targetChar:FindFirstChild("DistanceMarker")
        if not distanceMarker then
            distanceMarker = Instance.new("BillboardGui")
            distanceMarker.Name = "DistanceMarker"
            distanceMarker.Adornee = targetRoot
            distanceMarker.Size = UDim2.new(0, 100, 0, 25)
            distanceMarker.StudsOffset = Vector3.new(0, 3, 0)
            distanceMarker.AlwaysOnTop = true
            distanceMarker.Parent = targetChar
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = Color3.new(1, 1, 0)
            textLabel.TextScaled = true
            textLabel.Parent = distanceMarker
        end
        distanceMarker.Enabled = isModelLoadActive and isDistanceShowActive
        if distanceMarker.Enabled then
            local distance = (myRoot.Position - targetRoot.Position).Magnitude
            distanceMarker.TextLabel.Text = math.floor(distance) .. "m"
        end
    end
end)

-- 玩家加入/离开事件
local playerAddedConn = Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.2)
        if isModelLoadActive and isScriptRunning then
            local stopLoad = loadPlayerModel(player)
            local stopMarker = drawPlayerMarker(player)
            playerLoopHandle[player.UserId] = {stopLoad, stopMarker}
        end
    end)
    refreshDropdown()
end)

local playerRemovingConn = Players.PlayerRemoving:Connect(function(player)
    local handleList = playerLoopHandle[player.UserId]
    if handleList then
        for _, stopFunc in pairs(handleList) do
            stopFunc()
        end
        playerLoopHandle[player.UserId] = nil
    end
    refreshDropdown()
end)

-- 双倍金钱
local function startDoubleMoney()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if not leaderstats then return end
    local money = leaderstats:FindFirstChild("Money") or leaderstats:FindFirstChild("Cash") or leaderstats:FindFirstChild("Coins")
    if not money then return end
    local lastValue = money.Value
    local connection
    connection = money:GetPropertyChangedSignal("Value"):Connect(function()
        if not isDoubleMoneyActive then
            connection:Disconnect()
            return
        end
        local newValue = money.Value
        local diff = newValue - lastValue
        if diff > 0 then
            money.Value = newValue + diff
            newValue = money.Value
        end
        lastValue = newValue
    end)
end

-- 找奖杯传送
local function findTrophyAndTeleport()
    local keywords = {"奖杯", "奖", "杯", "Trophy", "trophy", "TROPHY", "Trofeo", "trofeo", "Trophäe", "trophäe", "トロフィー", "트로피", "трофей", "TROFEO"}
    local searchIn = workspace:GetDescendants()
    local found = nil
    for _, obj in ipairs(searchIn) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            for _, kw in ipairs(keywords) do
                if string.find(obj.Name, kw, 1, true) then
                    found = obj
                    break
                end
            end
        end
        if found then break end
    end
    if found then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos
            if found:IsA("BasePart") then
                targetPos = found.Position + Vector3.new(0, 5, 0)
            else
                local primaryPart = found.PrimaryPart or found:FindFirstChildWhichIsA("BasePart")
                if primaryPart then
                    targetPos = primaryPart.Position + Vector3.new(0, 5, 0)
                else
                    Library:Notify("无法确定奖杯位置", 3)
                    return
                end
            end
            LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(targetPos)
        end
    else
        Library:Notify("未找到奖杯", 3)
    end
end

-- ============== UI 构建 ==============
local Window = Library:CreateWindow({
    Title = "盲射脚本",
    Footer = "By 恐拜大帝",
    Icon = 131153193945220,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

Library:Notify("恐拜大帝 制作", 5)

local Tabs = {
    Notice = Window:AddTab("通知", "info"),
    Main = Window:AddTab("主要功能", "info"),
    Settings = Window:AddTab("设置", "settings"),
}

-- 通知标签页
local NoticeGroup = Tabs.Notice:AddLeftGroupbox("作者消息")
NoticeGroup:AddLabel('恐拜大帝将持续更新此脚本')
NoticeGroup:AddLabel('创作者：恐拜大帝')

-- ============== 主要功能标签页 ==============
-- 左侧分组：辅助功能
local AssistGroup = Tabs.Main:AddLeftGroupbox("辅助功能")

local modelToggle = AssistGroup:AddToggle('ModelLoadToggle', {
    Text = '显示玩家模型（持续刷新）',
    Default = false,
    Tooltip = '预载其他玩家模型并在角色位置显示红点',
    Callback = function(Value)
        isModelLoadActive = Value
        if Value then
            startAllPlayerFunc()
        else
            stopAllPlayerFunc()
            isDistanceShowActive = false
            local distToggle = Toggles.DistanceToggle
            if distToggle and distToggle.SetValue then
                distToggle:SetValue(false)
            end
        end
    end
})

local distanceToggle = AssistGroup:AddToggle('DistanceToggle', {
    Text = '距离显示（持续刷新）',
    Default = false,
    Tooltip = '需先开启玩家显示',
    Callback = function(Value)
        if not isModelLoadActive then
            Library:Notify("请先开启玩家显示", 3)
            if distanceToggle.SetValue then
                distanceToggle:SetValue(false)
            end
            return
        end
        isDistanceShowActive = Value
    end
})

AssistGroup:AddButton('召唤飞行脚本', function()
    local success, err = pcall(function()
        local targetUrl = "https://pastebin.com/raw/dZNN3GhY"
        local codeContent = getWebContent(targetUrl)
        runLuaCode(codeContent)
    end)
    if not success then
        Library:Notify("加载飞行脚本失败", 3)
    else
        Library:Notify("飞行脚本已执行", 3)
    end
end)

local doubleMoneyToggle = AssistGroup:AddToggle('DoubleMoneyToggle', {
    Text = '双倍金钱农场',
    Default = false,
    Tooltip = '开启后，任何获得的金钱将翻倍',
    Callback = function(Value)
        isDoubleMoneyActive = Value
        if Value then
            startDoubleMoney()
            Library:Notify("双倍金钱已激活", 3)
        else
            Library:Notify("双倍金钱已关闭", 3)
        end
    end
})

AssistGroup:AddButton('传送到跑酷终点奖杯处', function()
    findTrophyAndTeleport()
end)

-- 右侧分组：战斗/移动
local BattleGroup = Tabs.Main:AddRightGroupbox("战斗/移动")

-- 自动挥拳
local autoPunchToggle = BattleGroup:AddToggle('AutoPunchToggle', {
    Text = '自动挥拳',
    Default = false,
    Tooltip = '自动点击鼠标左键进行拳击',
    Callback = function(Value)
        isAutoPunchActive = Value
        if Value then
            startAutoPunch()
            Library:Notify("自动挥拳已开启", 2)
        else
            stopAutoPunch()
            Library:Notify("自动挥拳已关闭", 2)
        end
    end
})

-- 防坠落 (阈值 3.0)
local fallProtectToggle = BattleGroup:AddToggle('FallProtectToggle', {
    Text = '防坠落',
    Default = false,
    Tooltip = 'Y轴低于3.0时自动传送回3.0高度并停止下落',
    Callback = function(Value)
        isFallProtectActive = Value
        if Value then
            startFallProtect()
            Library:Notify("防坠落已开启", 2)
        else
            stopFallProtect()
            Library:Notify("防坠落已关闭", 2)
        end
    end
})

-- 朝向最近的人
local faceNearestToggle = BattleGroup:AddToggle('FaceNearestToggle', {
    Text = '朝向最近的人',
    Default = false,
    Tooltip = '开启后角色始终面朝距离自己最近的玩家',
    Callback = function(Value)
        isFaceNearestActive = Value
        if Value then
            startFaceNearest()
            Library:Notify("朝向最近玩家已开启", 2)
        else
            stopFaceNearest()
            Library:Notify("朝向最近玩家已关闭", 2)
        end
    end
})

-- 玩家选择下拉框
dropdownPlayers = BattleGroup:AddDropdown('PlayerSelectDropdown', {
    Text = '选择跟随目标',
    Options = {},
    Default = '',
    Callback = function(value)
        selectedPlayerName = value
    end
})

-- 刷新玩家列表按钮
BattleGroup:AddButton('刷新玩家列表', function()
    refreshDropdown()
    Library:Notify("玩家列表已刷新", 2)
end)

-- 平滑跟随开关
local smoothFollowToggle = BattleGroup:AddToggle('SmoothFollowToggle', {
    Text = '平滑跟随目标',
    Default = false,
    Tooltip = '开启后紧贴跟随选择的玩家或最近的玩家（在其身后）',
    Callback = function(Value)
        isSmoothFollowActive = Value
        if Value then
            startSmoothFollow()
            Library:Notify("平滑跟随已开启", 2)
        else
            stopSmoothFollow()
            Library:Notify("平滑跟随已关闭", 2)
        end
    end
})

-- 移速修改
local speedSlider = BattleGroup:AddSlider('SpeedSlider', {
    Text = '自定义移速',
    Min = 16,
    Max = 200,
    Default = 16,
    Step = 1,
    Callback = function(value)
        speedValue = value
        if isSpeedLockActive then
            pcall(function()
                if CurrentHumanoid then
                    CurrentHumanoid.WalkSpeed = value
                end
            end)
        end
    end
})

local speedLockToggle = BattleGroup:AddToggle('SpeedLockToggle', {
    Text = '锁定移速',
    Default = false,
    Tooltip = '开启后持续强制应用上方滑条设定的速度',
    Callback = function(Value)
        isSpeedLockActive = Value
        if Value then
            startSpeedLock()
            Library:Notify("移速锁定已开启", 2)
        else
            stopSpeedLock()
            Library:Notify("移速锁定已关闭", 2)
        end
    end
})

-- ============== 设置与卸载 ==============
local SettingsGroup = Tabs.Settings:AddLeftGroupbox("菜单")
SettingsGroup:AddButton('卸载脚本', function()
    isScriptRunning = false
    isModelLoadActive = false
    isDistanceShowActive = false
    isDoubleMoneyActive = false
    isAutoPunchActive = false
    isFallProtectActive = false
    isSmoothFollowActive = false
    isFaceNearestActive = false
    isSpeedLockActive = false

    stopAllPlayerFunc()
    stopAutoPunch()
    stopFallProtect()
    stopSmoothFollow()
    stopFaceNearest()
    stopSpeedLock()

    if renderSteppedConn then renderSteppedConn:Disconnect() end
    if playerAddedConn then playerAddedConn:Disconnect() end
    if playerRemovingConn then playerRemovingConn:Disconnect() end

    local moveGui = LocalPlayer.PlayerGui:FindFirstChild("main")
    if moveGui then moveGui:Destroy() end
    Library:Unload()
end)

-- 初始填充玩家列表
refreshDropdown()

-- 主题与保存
if ThemeManager then
    ThemeManager:SetLibrary(Library)
    ThemeManager:SetFolder("MyScriptTheme")
    ThemeManager:ApplyToTab(Tabs.Settings)
end

if SaveManager then
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetFolder("MyScriptConfig")
    SaveManager:BuildConfigSection(Tabs.Settings)
end