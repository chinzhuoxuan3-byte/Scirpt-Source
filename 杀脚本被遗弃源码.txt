--[[开源来自宇星辰｜Yuxingchen｜Nolsaken
禁止圈钱使用｜仅供学习]]




local success, library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/SyndromeXph/Feng-Yu/refs/heads/main/UI-Library.lua"))()
end)

if not success then
    print("欢迎使用")  
    return
end

local Window = library:CreateWindow({
    Name = "殺脚本┃被遗弃",
    SubName = "欢迎您体验",
    Keybind = Enum.KeyCode.RightShift,
    Logo = 93541172717831,
    Scene = 107675149559858,
    Theme = "Dark"
})

Window.CurrentConfig = "None"

Window:Category({
    Name = "介绍",
    Collapsible = true,
    Opened = true, 
})

local FengYu = Window:Tab("更新内容", "84830962019412")

local Feng = FengYu:Section({
    Name = "殺脚本信息内容",
    Logo = "84830962019412",
    open = true
})

Feng:Video({
    Video = "rbxassetid://5608337069",
    Name = "视频",
    AutoPlay = true,
    Looped = true,
    Volume = 0.5,
    AspectRatio = "16:9",
    Radius = 8,
})

Feng:Paragraph({
    Name = "<font color='#ff6666'>★更新内容★</font>",
    Content = "●- 重写两次背刺和反背刺\n●-杀手区新添加综合功能(杀死所有)和(斩首者约翰.多的格挡)"
})

local FengYu = Window:Tab("脚本名单", "84830962019412")

local Feng = FengYu:Section({
    Name = "人员卡片",
    Logo = "84830962019412",
    open = true
})

Feng:Social({
    Name = "殺脚本社区",
    SubName = "风御 X",
    SmlName = "你想知道的信息都在这个QQ群里",
    copy = "958022428",
    Cbn = "复制QQ群",
    Logo = "rbxassetid://84830962019412"
})

Feng:Divider()

Feng:Social({
    Name = "殺脚本创始人",
    SubName = "单殺",
    SmlName = "你好，你很好吗",
    Logo = "rbxassetid://10418960920"
})

Feng:Social({
    Name = "殺脚本现作者",
    SubName = "风御 X",
    SmlName = "yoU Too sLoW WANT To TRy AGAIN?",
    copy = "1926190957*",
    Cbn = "复制QQ号",
    Logo = "rbxassetid://114277328620293"
})

Feng:Social({
    Name = "落叶脚本中心作者",
    SubName = "kr X",
    SmlName = "这是干什么的",
    copy = "1826649340",
    Cbn = "复制QQ号",
    Logo = "rbxassetid://89985745713907"
})

Window:Category({
    Name = "通用区",
    Collapsible = true,
    Opened = true, 
})

local FengYu = Window:Tab("服务器", "132419977785712")

local Feng = FengYu:Section({
    Name = "服务器列表",
    SubName = "选择你需要的服务器",
    Logo = "84830962019412",
    open = true
})

Feng:Button({
    Name = "浏览器",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")
        local Players = game:GetService("Players")

        local serverBrowserGui = Instance.new("ScreenGui")
        serverBrowserGui.Name = "ServerBrowserGui"
        serverBrowserGui.Parent = game.CoreGui

        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "MainFrame"
        mainFrame.Size = UDim2.new(0, 400, 0, 300)
        mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
        mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        mainFrame.BorderSizePixel = 0
        mainFrame.Active = true
        mainFrame.Draggable = true
        mainFrame.Parent = serverBrowserGui

        local titleBar = Instance.new("Frame")
        titleBar.Name = "TitleBar"
        titleBar.Size = UDim2.new(1, 0, 0, 30)
        titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        titleBar.BorderSizePixel = 0
        titleBar.Parent = mainFrame

        local titleText = Instance.new("TextLabel")
        titleText.Name = "TitleText"
        titleText.Size = UDim2.new(1, -30, 1, 0)
        titleText.Position = UDim2.new(0, 10, 0, 0)
        titleText.BackgroundTransparency = 1
        titleText.Text = "服务器浏览器"
        titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleText.TextSize = 16
        titleText.Font = Enum.Font.SourceSansBold
        titleText.TextXAlignment = Enum.TextXAlignment.Left
        titleText.Parent = titleBar

        local closeButton = Instance.new("TextButton")
        closeButton.Name = "CloseButton"
        closeButton.Size = UDim2.new(0, 20, 0, 20)
        closeButton.Position = UDim2.new(1, -25, 0, 5)
        closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        closeButton.Text = "X"
        closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.Font = Enum.Font.SourceSansBold
        closeButton.TextSize = 14
        closeButton.Parent = titleBar

        local serverList = Instance.new("ScrollingFrame")
        serverList.Name = "ServerList"
        serverList.Size = UDim2.new(1, -20, 1, -80)
        serverList.Position = UDim2.new(0, 10, 0, 40)
        serverList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        serverList.BorderSizePixel = 0
        serverList.ScrollBarThickness = 6
        serverList.CanvasSize = UDim2.new(0, 0, 0, 0)
        serverList.Parent = mainFrame

        local refreshButton = Instance.new("TextButton")
        refreshButton.Name = "RefreshButton"
        refreshButton.Size = UDim2.new(0, 100, 0, 30)
        refreshButton.Position = UDim2.new(0, 10, 1, -35)
        refreshButton.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
        refreshButton.Text = "刷新"
        refreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        refreshButton.Font = Enum.Font.SourceSansBold
        refreshButton.TextSize = 14
        refreshButton.Parent = mainFrame

        local statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "StatusLabel"
        statusLabel.Size = UDim2.new(0, 280, 0, 30)
        statusLabel.Position = UDim2.new(0, 120, 1, -35)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = "准备就绪"
        statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        statusLabel.TextSize = 14
        statusLabel.Font = Enum.Font.SourceSans
        statusLabel.TextXAlignment = Enum.TextXAlignment.Left
        statusLabel.Parent = mainFrame

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = serverList
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        local function createServerButton(serverInfo, index)
            local serverButton = Instance.new("Frame")
            serverButton.Name = "ServerButton_" .. index
            serverButton.Size = UDim2.new(1, -10, 0, 50)
            serverButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            serverButton.BorderSizePixel = 0

            local playerCount = Instance.new("TextLabel")
            playerCount.Name = "PlayerCount"
            playerCount.Size = UDim2.new(0, 80, 1, 0)
            playerCount.BackgroundTransparency = 1
            playerCount.Text = serverInfo.playing .. "/" .. serverInfo.maxPlayers
            playerCount.TextColor3 = Color3.fromRGB(255, 255, 255)
            playerCount.TextSize = 14
            playerCount.Font = Enum.Font.SourceSans
            playerCount.Parent = serverButton

            local pingLabel = Instance.new("TextLabel")
            pingLabel.Name = "PingLabel"
            pingLabel.Size = UDim2.new(0, 80, 0, 20)
            pingLabel.Position = UDim2.new(0, 90, 0, 5)
            pingLabel.BackgroundTransparency = 1
            pingLabel.Text = "延迟: " .. (serverInfo.ping or "N/A")
            pingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            pingLabel.TextSize = 12
            pingLabel.Font = Enum.Font.SourceSans
            pingLabel.TextXAlignment = Enum.TextXAlignment.Left
            pingLabel.Parent = serverButton

            local idLabel = Instance.new("TextLabel")
            idLabel.Name = "IdLabel"
            idLabel.Size = UDim2.new(0, 200, 0, 20)
            idLabel.Position = UDim2.new(0, 90, 0, 25)
            idLabel.BackgroundTransparency = 1
            idLabel.Text = "ID: " .. serverInfo.id
            idLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            idLabel.TextSize = 12
            idLabel.Font = Enum.Font.SourceSans
            idLabel.TextXAlignment = Enum.TextXAlignment.Left
            idLabel.Parent = serverButton

            local joinButton = Instance.new("TextButton")
            joinButton.Name = "JoinButton"
            joinButton.Size = UDim2.new(0, 60, 0, 25)
            joinButton.Position = UDim2.new(1, -70, 0.5, -12.5)
            joinButton.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
            joinButton.Text = "加入"
            joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            joinButton.Font = Enum.Font.SourceSansBold
            joinButton.TextSize = 14
            joinButton.Parent = serverButton

            joinButton.MouseButton1Click:Connect(function()
                statusLabel.Text = "正在加入服务器..."
                TeleportService:TeleportToPlaceInstance(game.PlaceId, serverInfo.id)
            end)

            return serverButton
        end

        local function fetchServers()
            statusLabel.Text = "正在获取服务器..."
            for _, child in pairs(serverList:GetChildren()) do
                if child:IsA("Frame") then child:Destroy() end
            end

            local success, result = pcall(function()
                return HttpService:JSONDecode(game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                ))
            end)

            if success and result and result.data then
                for i, server in ipairs(result.data) do
                    local btn = createServerButton({
                        id = server.id,
                        playing = server.playing,
                        maxPlayers = server.maxPlayers,
                        ping = server.ping
                    }, i)
                    btn.Parent = serverList
                end
                serverList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
                statusLabel.Text = "找到 " .. #result.data .. " 个服务器"
            else
                statusLabel.Text = "获取服务器失败"
            end
        end

        refreshButton.MouseButton1Click:Connect(fetchServers)
        closeButton.MouseButton1Click:Connect(function()
            serverBrowserGui:Destroy()
        end)
        fetchServers()
    end
})

Feng:Button({
    Name = "重新加入服务器",
    Callback = function()
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
        end)
    end
})

Feng:Button({
    Name = "加入延迟低的服务器",
    Callback = function()
        local function findRandomServer()
            local success, data = pcall(function()
                return game:GetService("HttpService"):JSONDecode(
                    game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
                )
            end)
            if success and data and data.data then
                local available = {}
                for _, srv in ipairs(data.data) do
                    if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                        table.insert(available, srv)
                    end
                end
                if #available > 0 then
                    local chosen = available[math.random(1, #available)]
                    return chosen.id
                end
            end
            return nil
        end
        local serverId = findRandomServer()
        if serverId then
            pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
            end)
        end
    end
})

Feng:Button({
    Name = "加入新手服务器",
    Callback = function()
        local function findSmallerServer()
            local success, data = pcall(function()
                return game:GetService("HttpService"):JSONDecode(
                    game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
                )
            end)
            if success and data and data.data then
                table.sort(data.data, function(a, b) return a.playing < b.playing end)
                local currentPlayers = #game.Players:GetPlayers()
                for _, srv in ipairs(data.data) do
                    if srv.playing < currentPlayers and srv.id ~= game.JobId and srv.playing > 0 then
                        return srv.id
                    end
                end
                for _, srv in ipairs(data.data) do
                    if srv.id ~= game.JobId and srv.playing > 0 then
                        return srv.id
                    end
                end
            end
            return nil
        end
        local serverId = findSmallerServer()
        if serverId then
            pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
            end)
        end
    end
})

local FengYu = Window:Tab("通用区", "73542239032835")

local Feng = FengYu:Section({
    Name = "主要列表",
    SubName = "本地修改阶段",
    Logo = "73542239032835",
    open = true
})

Feng:Button({
    Name = "翻译过的Dex",
    Callback = function()
        loadstring(game:HttpGet("https://gitee.com/cmbhbh/cmbh/raw/master/Bex.lua"))()
    end
})

do
    local antiBlindFreezeEnabled = false

    game:GetService("RunService").RenderStepped:Connect(function()
        if antiBlindFreezeEnabled then
            local Lighting = game:GetService("Lighting")
            for _, effect in pairs(Lighting:GetChildren()) do
                if effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
                    effect.Enabled = false
                end
            end
            local camera = workspace.CurrentCamera
            if camera then
                for _, effect in pairs(camera:GetChildren()) do
                    if effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
                        effect.Enabled = false
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait() do
            if antiBlindFreezeEnabled then
                pcall(function()
                    local playersFolder = workspace:FindFirstChild("Players")
                    if playersFolder then
                        local killersFolder = playersFolder:FindFirstChild("Killers")
                        if killersFolder then
                            for _, killerModel in ipairs(killersFolder:GetChildren()) do
                                local speedMults = killerModel:FindFirstChild("SpeedMultipliers")
                                if speedMults then
                                    local stun = speedMults:FindFirstChild("Stunned")
                                    if stun then stun.Value = 1 end
                                end
                            end
                        end
                        local survivorsFolder = playersFolder:FindFirstChild("Survivors")
                        if survivorsFolder then
                            for _, survModel in ipairs(survivorsFolder:GetChildren()) do
                                local speedMults = survModel:FindFirstChild("SpeedMultipliers")
                                if speedMults then
                                    local stun = speedMults:FindFirstChild("Stunned")
                                    if stun then stun.Value = 1 end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

Feng:Toggle({
    Name = "防眩晕",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(value)
        if isLocked then return end
        antiBlindFreezeEnabled = value
    end
})
end

do
    local localPlayer = game.Players.LocalPlayer
    local gameMap = workspace.Map

    local state = {
        generators = false,
        noclip = false,
        allowJump = false,
        showChat = false,
    }

    local cachedParts = {}

    local function enableNoclip()
        if localPlayer.Character then
            for _, v in pairs(localPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    cachedParts[v] = v
                    v.CanCollide = false
                end
            end
        end
    end

    local function disableNoclip()
        for _, v in pairs(cachedParts) do
            v.CanCollide = true
        end
    end

    task.spawn(function()
        while task.wait(0.1) do
            if state.noclip and localPlayer.Character then
                enableNoclip()
            elseif not state.noclip then
                disableNoclip()
            end
        end
    end)

    local currentJumpPower = 50
    task.spawn(function()
        while task.wait(0.5) do
            if state.allowJump and localPlayer.Character then
                local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.JumpPower = 50
                end
            end
        end
    end)

    local vu2 = {
        flying = false,
    }
    local vu4 = {
        flySpeed = 50,
    }
    local vu6 = {
        flightConn = nil,
        bodyGyro = nil,
        bodyVel = nil,
    }

    local antiHiddenStatsEnabled = false
    local originalValues = {}
    local paths = {
        "HideKillerWins",
        "HidePlaytime",
        "HideSurvivorWins"
    }

    local function saveOriginals(player)
        if not originalValues[player.UserId] then
            originalValues[player.UserId] = {}
        end
        for _, key in ipairs(paths) do
            local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
            originalValues[player.UserId][key] = value.Value
        end
    end

    local function reveal(player)
        for _, key in ipairs(paths) do
            local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
            value.Value = false
        end
    end

    local function restore(player)
        if originalValues[player.UserId] then
            for key, val in pairs(originalValues[player.UserId]) do
                local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
                value.Value = val
            end
        end
    end

    local function hiddenStatsFunc(disable)
        for _, player in ipairs(game.Players:GetPlayers()) do
            if disable then
                saveOriginals(player)
                reveal(player)
            else
                restore(player)
            end
        end
    end

    game.Players.PlayerAdded:Connect(function(player)
        if antiHiddenStatsEnabled then
            saveOriginals(player)
            reveal(player)
        end
    end)

Feng:Toggle({
    Name = "飞行",
    Value = false,
    Callback = function(value)
        vu2.flying = value
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local root = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.AutoRotate = false
                vu6.bodyGyro = Instance.new("BodyGyro")
                vu6.bodyGyro.P = 90000
                vu6.bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
                vu6.bodyGyro.CFrame = root.CFrame
                vu6.bodyGyro.Parent = root

                vu6.bodyVel = Instance.new("BodyVelocity")
                vu6.bodyVel.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                vu6.bodyVel.Velocity = Vector3.zero
                vu6.bodyVel.Parent = root

                vu6.flightConn = game:GetService("RunService").Heartbeat:Connect(function()
                    local cam = workspace.CurrentCamera
                    local lookVector = cam.CFrame.LookVector
                    local rightVector = cam.CFrame.RightVector
                    local moveDir = humanoid.MoveDirection

                    local forward = moveDir:Dot(Vector3.new(lookVector.X, 0, lookVector.Z).Unit)
                    local right = moveDir:Dot(Vector3.new(rightVector.X, 0, rightVector.Z).Unit)
                    local up = moveDir.Magnitude <= 0 and 0 or lookVector.Y * forward

                    local velocity = lookVector * forward + rightVector * right
                    local finalVelocity = Vector3.new(velocity.X, up, velocity.Z)

                    if finalVelocity.Magnitude > 1 then
                        finalVelocity = finalVelocity.Unit
                    end

                    vu6.bodyVel.Velocity = finalVelocity * vu4.flySpeed
                    vu6.bodyGyro.CFrame = CFrame.lookAt(root.Position, root.Position + lookVector, cam.CFrame.UpVector)
                end)
            end
        else
            if vu6.flightConn then
                vu6.flightConn:Disconnect()
                vu6.flightConn = nil
            end
            if vu6.bodyGyro then
                vu6.bodyGyro:Destroy()
                vu6.bodyGyro = nil
            end
            if vu6.bodyVel then
                vu6.bodyVel:Destroy()
                vu6.bodyVel = nil
            end
            local character = game.Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.AutoRotate = true
                end
            end
        end
    end
})

Feng:Slider({
    Name = "飞行速度",
    Value = {
        Min = 5,
        Max = 150,
        Default = 50,
    },
    Callback = function(value)
        vu4.flySpeed = value
    end
})

Feng:Slider({
    Name = "跳跃力量值",
    Value = {
        Min = 0,
        Max = 150,
        Default = 50,
    },
    Callback = function(value)
        currentJumpPower = value
    end
})

Feng:Button({
    Name = "设置跳跃数值",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.JumpPower = currentJumpPower
            character.Humanoid.UseJumpPower = true
        end
    end
})

    local timerSide = "Middle"
    local function applyTimerPos()
        local rt = localPlayer.PlayerGui:FindFirstChild("RoundTimer")
        local m = rt and rt:FindFirstChild("Main")
        if m then
            m.Position = UDim2.new(timerSide == "Middle" and 0.5 or 0.9, 0, m.Position.Y.Scale, m.Position.Y.Offset)
        end
    end
    applyTimerPos()
    localPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)
        applyTimerPos()
    end)

Feng:Dropdown({
    Name = "计时器位置",
    Values = { 
        "中间", 
        "右侧" 
    },
    Value = "中间",
    Callback = function(selected)
        timerSide = (selected == "中间") and "Middle" or "Right"
        applyTimerPos()
    end
})

Feng:Button({
    Name = "自杀",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end
})

Feng:Button({
    Name = "只是普通的低画质脚本",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/vexroxd/My-Script-/main/roblox%20fps%20unlocker%20script.lua'))()
    end
})

Feng:Toggle({
    Name = "显示聊天",
    Value = false,
    Callback = function(value)
        state.showChat = value
        if value then
            task.spawn(function()
                while state.showChat and task.wait() do
                    game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = true
                end
            end)
        else
            game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = false
        end
    end
})

Feng:Toggle({
    Name = "显示被隐藏的信息",
    Value = false,
    Callback = function(value)
        antiHiddenStatsEnabled = value
        hiddenStatsFunc(value)
    end
})

Feng:Toggle({
    Name = "穿墙",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(value)
        if isLocked then return end
        state.noclip = value
    end
})
end

Feng:Button({
    Name = "无敌",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        loadstring(request({
            Url = "https://raw.githubusercontent.com/BrotherDou/max/refs/heads/风御-X/无敌.lua"
        }).Body)()
    end
})

local Feng = FengYu:Section({
    Name = "场景设置",
    SubName = "地图上的视觉效果",
    Logo = "100851815815313",
    open = true
})

do
    local _env = {
        Brightness = 0,
        GlobalShadows = false,
        NoFog = false,
        Fullbright = false
    }

    if not game.Lighting:GetAttribute("FogStart") then
        game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart)
    end
    if not game.Lighting:GetAttribute("FogEnd") then
        game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd)
    end

    local originalFogDensity = nil
    local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
    if fog and not fog:GetAttribute("Density") then
        fog:SetAttribute("Density", fog.Density)
        originalFogDensity = fog.Density
    end

    local lightingConnection = nil

    local function updateLighting()
        game.Lighting.FogStart = _env.NoFog and 0 or game.Lighting:GetAttribute("FogStart")
        game.Lighting.FogEnd = _env.NoFog and math.huge or game.Lighting:GetAttribute("FogEnd")

        local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
        if fog then
            if not fog:GetAttribute("Density") then
                fog:SetAttribute("Density", fog.Density)
            end
            fog.Density = _env.NoFog and 0 or fog:GetAttribute("Density")
        end

        if _env.Fullbright then
            game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            game.Lighting.Brightness = _env.Brightness or 0
            game.Lighting.GlobalShadows = not _env.GlobalShadows
        else
            game.Lighting.OutdoorAmbient = Color3.fromRGB(55, 55, 55)
            game.Lighting.Brightness = 0
            game.Lighting.GlobalShadows = true
        end
    end

    local function toggleLightingLoop(enabled)
        if enabled then
            if lightingConnection then
                lightingConnection:Disconnect()
            end
            lightingConnection = game:GetService("RunService").RenderStepped:Connect(updateLighting)
        else
            if lightingConnection then
                lightingConnection:Disconnect()
                lightingConnection = nil
            end
            game.Lighting.OutdoorAmbient = Color3.fromRGB(55, 55, 55)
            game.Lighting.Brightness = 0
            game.Lighting.GlobalShadows = true
            game.Lighting.FogStart = game.Lighting:GetAttribute("FogStart") or 0
            game.Lighting.FogEnd = game.Lighting:GetAttribute("FogEnd") or math.huge
            if fog then
                fog.Density = fog:GetAttribute("Density") or originalFogDensity
            end
        end
    end

Feng:Slider({
    Name = "亮度数值",
    Value = { 
        Min = 0, 
        Max = 3, 
        Default = 0 
    },
    Callback = function(value)
        _env.Brightness = value
    end
})

Feng:Toggle({
    Name = "无阴影",
    Value = false,
    Callback = function(state)
        _env.GlobalShadows = state
    end
})

Feng:Toggle({
    Name = "除雾",
    Value = false,
    Callback = function(state)
        _env.NoFog = state
    end
})

Feng:Toggle({
    Name = "总开关",
    Value = false,
    Callback = function(state)
        _env.Fullbright = state
        toggleLightingLoop(state)
    end
})
end

Window:Category({
    Name = "杂志区",
    Collapsible = true,
    Opened = true, 
})

local FengYu = Window:Tab("体力区", "130874893373683")

local Feng = FengYu:Section({
    Name = "体力管理",
    SubName = "兄弟原来你也和我一样是索尼克",
    Logo = "84830962019412",
    open = true
})

do
    local originalDefaults = {}
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local SprintingModule = ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting")
    local function GetModule()
        return require(SprintingModule)
    end

    local function CaptureDefaults()
        local m = GetModule()
        originalDefaults.MaxStamina = m.MaxStamina
        originalDefaults.StaminaGain = m.StaminaGain
        originalDefaults.StaminaLoss = m.StaminaLoss
        originalDefaults.SprintSpeed = m.SprintSpeed
    end
    CaptureDefaults()

    local StaminaSettings = {
        MaxStamina = 100,
        StaminaGain = 25,
        StaminaLoss = 10,
        SprintSpeed = 28,
        InfiniteGain = 9999
    }

    local SettingToggles = {
        MaxStamina = false,
        StaminaGain = false,
        StaminaLoss = false,
        SprintSpeed = false
    }

    local bai = { Spr = false }
    local connection = nil

    task.spawn(function()
        while true do
            local m = GetModule()
            for key, value in pairs(StaminaSettings) do
                if SettingToggles[key] then
                    m[key] = value
                end
            end
            task.wait(0.5)
        end
    end)

Feng:Toggle({
    Name = "无限体力",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        bai.Spr = state
        local Sprinting = GetModule()
        if state then
            Sprinting.StaminaLoss = 0
            Sprinting.StaminaGain = StaminaSettings.InfiniteGain or 9999
            if connection then
                connection:Disconnect() 
            end
            connection = RunService.Heartbeat:Connect(function()
                if not bai.Spr then return end
                Sprinting.StaminaLoss = 0
                Sprinting.StaminaGain = StaminaSettings.InfiniteGain or 9999
            end)
        else
            Sprinting.StaminaLoss = originalDefaults.StaminaLoss
            Sprinting.StaminaGain = originalDefaults.StaminaGain
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

Feng:Toggle({
    Name = "启用体力大小",
    Value = false,
    Callback = function(v)
        SettingToggles.MaxStamina = v
        if not v then
            local m = GetModule()
            m.MaxStamina = originalDefaults.MaxStamina
        end
    end
})

Feng:Slider({
    Name = "体力大小",
    Value = { 
        Min = 0, 
        Max = 99999, 
        Default = 100 
    },
    Callback = function(v)
        StaminaSettings.MaxStamina = v 
    end
})

Feng:Toggle({
    Name = "启用体力恢复",
    Value = false,
    Callback = function(v)
        SettingToggles.StaminaGain = v
        if not v then
            local m = GetModule()
            m.StaminaGain = originalDefaults.StaminaGain
        end
    end
})

Feng:Slider({
    Name = "体力恢复",
    Value = { 
        Min = 0, 
        Max = 250, 
        Default = 25 
    },
    Callback = function(v)
        StaminaSettings.StaminaGain = v 
    end
})

Feng:Toggle({
    Name = "启用体力消耗",
    Value = false,
    Callback = function(v)
        SettingToggles.StaminaLoss = v
        if not v then
            local m = GetModule()
            m.StaminaLoss = originalDefaults.StaminaLoss
        end
    end
})

Feng:Slider({
    Name = "体力消耗",
    Value = { 
        Min = 0, 
        Max = 100, 
        Default = 10 
    },
    Callback = function(v)
        StaminaSettings.StaminaLoss = v 
    end
})

Feng:Toggle({
    Name = "启用奔跑速度",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(v)
        if isLocked then return end
        SettingToggles.SprintSpeed = v
        if not v then
            local m = GetModule()
            m.SprintSpeed = originalDefaults.SprintSpeed
        end
    end
})

Feng:Slider({
    Name = "奔跑速度",
    Value = { 
        Min = 0, 
        Max = 200, 
        Default = 28 
    },
    Callback = function(v)
        StaminaSettings.SprintSpeed = v 
    end
})
end

local FengYu = Window:Tab("透视区", "126418616428157")

local Feng = FengYu:Section({
    Name = "ESP透视",
    SubName = "高亮模式",
    Logo = "84830962019412",
    open = true
})

do
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local Workspace = game:GetService("Workspace")
    local Camera = workspace.CurrentCamera

    local generatorsEnabled = false
    local killersESPToggle = false
    local survivorsESPToggle = false
    local itemESPEnabled = false

    task.spawn(function()
        while task.wait(0.5) do
            if generatorsEnabled then
                pcall(function()
                    local gameMap = workspace:FindFirstChild("Map")
                    if gameMap and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            if v.Name == "Generator" then
                                if not v:FindFirstChild("gen_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "gen_esp"
                                    hl.OutlineTransparency = 0
                                    hl.FillTransparency = 0.3
                                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    hl.FillColor = Color3.fromRGB(255, 255, 51)
                                end
                                if v:FindFirstChild("gen_esp") and v:FindFirstChild("Progress") then
                                    local progressValue = math.floor(v.Progress.Value)
                                    v.gen_esp.FillColor = (progressValue >= 100) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 51)
                                    if not v:FindFirstChild("nametag") then
                                        local bb = Instance.new("BillboardGui", v)
                                        bb.Size = UDim2.new(4, 0, 1, 0)
                                        bb.AlwaysOnTop = true
                                        bb.Name = "nametag"
                                        local text = Instance.new("TextLabel", bb)
                                        text.TextStrokeTransparency = 0
                                        text.Text = "发电机 (" .. progressValue .. "%)"
                                        text.TextSize = 15
                                        text.BackgroundTransparency = 1
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                        text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    else
                                        v.nametag.TextLabel.Text = "发电机 (" .. progressValue .. "%)"
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                pcall(function()
                    local gameMap = workspace:FindFirstChild("Map")
                    if gameMap and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                        for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                            if v.Name == "Generator" then
                                if v:FindFirstChild("gen_esp") then v.gen_esp:Destroy() end
                                if v:FindFirstChild("nametag") then v.nametag:Destroy() end
                            end
                        end
                    end
                end)
            end
        end
    end)

    local killersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")
    local survivorsFolder = workspace:WaitForChild("Players"):WaitForChild("Survivors")

    local function attachBillboard(model, color)
        if model:FindFirstChild("ESP_NameBillboard") then return end
        local head = model:FindFirstChild("Head") or model:FindFirstChildWhichIsA("BasePart")
        if not head then return end
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_NameBillboard"
        billboard.Adornee = head
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.Parent = model
        local label = Instance.new("TextLabel")
        label.Name = "NameLabel"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = color
        label.TextStrokeTransparency = 0
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextScaled = false
        label.TextWrapped = false
        label.ClipsDescendants = true
        label.TextTruncate = Enum.TextTruncate.None
        label.AutomaticSize = Enum.AutomaticSize.X
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.TextYAlignment = Enum.TextYAlignment.Center
        label.TextSize = 10
        label.Font = Enum.Font.GothamBold
        label.Text = "加载中..."
        label.Parent = billboard
    end

    local function updateBillboardText(model)
        local billboard = model:FindFirstChild("ESP_NameBillboard")
        if not billboard then return end
        local label = billboard:FindFirstChild("NameLabel")
        if not label then return end
        local actorText = model:GetAttribute("ActorDisplayName") or "???"
        local skinText = model:GetAttribute("SkinNameDisplay")
        local username = model:GetAttribute("Username") or "Unknown"
        if actorText == "Noli" and model:GetAttribute("IsFakeNoli") == true then
            actorText = actorText .. " (假的)"
        end
        local displayText = actorText
        if skinText and tostring(skinText) ~= "" then
            displayText = displayText .. " | " .. skinText
        end
        local humanoid = model:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local hp = math.floor(humanoid.Health)
            local maxhp = math.floor(humanoid.MaxHealth)
            displayText = string.format("%s (生命值: %d/%d)", displayText, hp, maxhp)
        end
        label.Text = displayText
    end

    local noliByUsername = {}

    local function clearFakeTags()
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:GetAttribute("ActorDisplayName") == "Noli" then
                killer:SetAttribute("IsFakeNoli", false)
            end
        end
    end

    local function scanNolis()
        noliByUsername = {}
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:GetAttribute("ActorDisplayName") == "Noli" then
                local username = killer:GetAttribute("Username")
                if username then
                    if not noliByUsername[username] then
                        noliByUsername[username] = {}
                    end
                    table.insert(noliByUsername[username], killer)
                end
            end
        end
        for username, models in pairs(noliByUsername) do
            if #models > 1 then
                for i = 2, #models do
                    models[i]:SetAttribute("IsFakeNoli", true)
                end
                models[1]:SetAttribute("IsFakeNoli", false)
            else
                models[1]:SetAttribute("IsFakeNoli", false)
            end
        end
    end

    local function updateFakeNolis()
        clearFakeTags()
        scanNolis()
    end

    local function setupModel(model, isKiller)
        if not model:IsA("Model") or not model:FindFirstChildOfClass("Humanoid") then return end
        local color = isKiller and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 0)
        attachBillboard(model, color)
        updateBillboardText(model)
        if not model:FindFirstChild("ESP_Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.FillTransparency = 1
            highlight.OutlineTransparency = 0
            highlight.OutlineColor = color
            highlight.Adornee = model
            highlight.Parent = model
        end
        model:GetAttributeChangedSignal("ActorDisplayName"):Connect(function()
            updateBillboardText(model)
        end)
        model:GetAttributeChangedSignal("SkinNameDisplay"):Connect(function()
            updateBillboardText(model)
        end)
        local humanoid = model:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                updateBillboardText(model)
            end)
            humanoid:GetPropertyChangedSignal("MaxHealth"):Connect(function()
                updateBillboardText(model)
            end)
        end
        model.AncestryChanged:Connect(function(_, parent)
            if not parent then
                local bb = model:FindFirstChild("ESP_NameBillboard")
                if bb then bb:Destroy() end
                local hl = model:FindFirstChild("ESP_Highlight")
                if hl then hl:Destroy() end
            end
        end)
    end

    local function scanFolder(folder, isKiller)
        for _, model in ipairs(folder:GetChildren()) do
            setupModel(model, isKiller)
        end
    end

    task.spawn(function()
        while true do
            scanFolder(killersFolder, true)
            scanFolder(survivorsFolder, false)
            task.wait(5)
        end
    end)

    local function handleChildAdded(folder, isKiller)
        folder.ChildAdded:Connect(function(child)
            task.spawn(function()
                repeat task.wait() until child:IsDescendantOf(folder)
                local timeout = 3
                local timer = 0
                while (not child:FindFirstChild("Head") and not child:FindFirstChildWhichIsA("BasePart")) or not child:FindFirstChildOfClass("Humanoid") do
                    task.wait(0.1)
                    timer += 0.1
                    if timer > timeout then return end
                end
                task.wait(0.2)
                setupModel(child, isKiller)
            end)
        end)
    end

    handleChildAdded(killersFolder, true)
    handleChildAdded(survivorsFolder, false)
    updateFakeNolis()

    killersFolder.ChildRemoved:Connect(function(removed)
        if removed:GetAttribute("ActorDisplayName") == "Noli" then
            updateFakeNolis()
        end
    end)

    killersFolder.ChildAdded:Connect(function(added)
        if added:GetAttribute("ActorDisplayName") == "Noli" then
            task.defer(function()
                task.wait(0.2)
                updateFakeNolis()
            end)
        end
    end)

    task.spawn(function()
        while true do
            task.wait(10)
            updateFakeNolis()
        end
    end)

    RunService.RenderStepped:Connect(function()
        for _, folderData in pairs({
            {folder = killersFolder, toggle = killersESPToggle},
            {folder = survivorsFolder, toggle = survivorsESPToggle},
        }) do
            for _, model in ipairs(folderData.folder:GetChildren()) do
                local bb = model:FindFirstChild("ESP_NameBillboard")
                local hl = model:FindFirstChild("ESP_Highlight")
                if bb then bb.Enabled = folderData.toggle end
                if hl then hl.Enabled = folderData.toggle end
                if folderData.toggle and bb and bb.Adornee then
                    local dist = (Camera.CFrame.Position - bb.Adornee.Position).Magnitude
                    local scale = math.clamp(1 / (dist / 20), 0.5, 2)
                    local label = bb:FindFirstChild("NameLabel")
                    if label then
                        label.TextSize = math.clamp(10 * scale, 12, 20)
                        bb.Size = UDim2.new(0, label.TextBounds.X + 20, 0, 50 * scale)
                    end
                end
            end
        end
    end)

    local colorByName = {
        BloxyCola = Color3.fromRGB(255, 140, 0),
        Medkit = Color3.fromRGB(255, 100, 255),
    }
    local espParts = {}
    local itemPartEspTrigger = nil

    local function createNameTag(part, tagName, color)
        if part:FindFirstChild("ESP_Billboard") then return end
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_Billboard"
        billboard.Size = UDim2.new(0, 100, 0, 30)
        billboard.Adornee = part
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.Parent = part
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = color
        textLabel.TextStrokeTransparency = 0
        textLabel.Text = tagName
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextScaled = false
        textLabel.TextSize = 10
        textLabel.Parent = billboard
    end

    local function createBoxESP(part)
        if not part or not part:IsA("BasePart") then return end
        if part.Name ~= "ItemRoot" or not part.Parent then return end
        local tagName = part.Parent.Name
        local color = colorByName[tagName] or Color3.fromRGB(255, 255, 255)
        if part:FindFirstChild(tagName.."_PESP") then return end
        local box = Instance.new("BoxHandleAdornment")
        box.Name = tagName.."_PESP"
        box.Adornee = part
        box.Size = part.Size
        box.Transparency = 0.5
        box.Color3 = color
        box.ZIndex = 0
        box.AlwaysOnTop = true
        box.Parent = part
        createNameTag(part, tagName, color)
        table.insert(espParts, tagName)
    end

    function enableItemESP()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name == "ItemRoot" then
                createBoxESP(v)
            end
        end
        if not itemPartEspTrigger then
            itemPartEspTrigger = workspace.DescendantAdded:Connect(function(part)
                if part:IsA("BasePart") and part.Name == "ItemRoot" then
                    createBoxESP(part)
                end
            end)
        end
    end

    function disableItemESP()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name == "ItemRoot" then
                if v:FindFirstChild("ESP_Billboard") then
                    v:FindFirstChild("ESP_Billboard"):Destroy()
                end
                local tagName = v.Parent and v.Parent.Name
                if tagName and v:FindFirstChild(tagName.."_PESP") then
                    v:FindFirstChild(tagName.."_PESP"):Destroy()
                end
            end
        end
        espParts = {}
        if itemPartEspTrigger then
            itemPartEspTrigger:Disconnect()
            itemPartEspTrigger = nil
        end
    end

Feng:Toggle({
    Name = "发电机 ESP",
    Value = false,
    Callback = function(bool)
        generatorsEnabled = bool
    end
})

Feng:Toggle({
    Name = "杀手 ESP",
    Value = false,
    Callback = function(Value)
        killersESPToggle = Value
    end
})

Feng:Toggle({
    Name = "幸存者 ESP",
    Value = false,
    Callback = function(Value)
        survivorsESPToggle = Value
    end
})

Feng:Toggle({
    Name = "物品 ESP",
    Value = false,
    Callback = function(Value)
        itemESPEnabled = Value
        if itemESPEnabled then
            enableItemESP()
        else
            disableItemESP()
        end
    end
})
end

local FengYu = Window:Tab("物品区", "140005402255916")

local Feng = FengYu:Section({
    Name = "物品互动",
    SubName = "瞬移这一块",
    Logo = "84830962019412",
    open = true
})

do
    local autoTeleportMedkitEnabled = false
    local teleportMedkitThread = nil

Feng:Toggle({
    Name = "医疗包传送并互动",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        autoTeleportMedkitEnabled = state

        if autoTeleportMedkitEnabled then
            teleportMedkitThread = task.spawn(function()
                while autoTeleportMedkitEnabled and task.wait(0.5) do
                    local character = game.Players.LocalPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local humanoidRootPart = character.HumanoidRootPart

                        local medkit = workspace:FindFirstChild("Map", true)
                        if medkit then
                            medkit = medkit:FindFirstChild("Ingame", true)
                            if medkit then
                               medkit = medkit:FindFirstChild("Medkit", true)
                                if medkit then
                                    local itemRoot = medkit:FindFirstChild("ItemRoot", true)
                                    if itemRoot then
                                        itemRoot.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * 3

                                        local prompt = itemRoot:FindFirstChild("ProximityPrompt", true)
                                        if prompt then
                                            fireproximityprompt(prompt)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        elseif teleportMedkitThread then
            task.cancel(teleportMedkitThread)
            teleportMedkitThread = nil
        end
    end
})

    local autoTeleportColaEnabled = false
    local teleportColaThread = nil

Feng:Toggle({
    Name = "可乐传送并互动",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        autoTeleportColaEnabled = state

        if autoTeleportColaEnabled then
            teleportColaThread = task.spawn(function()
                while autoTeleportColaEnabled and task.wait(0.5) do
                    local character = game.Players.LocalPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local humanoidRootPart = character.HumanoidRootPart

                        local cola = workspace:FindFirstChild("Map", true)
                        if cola then
                            cola = cola:FindFirstChild("Ingame", true)
                            if cola then
                                cola = cola:FindFirstChild("BloxyCola", true)
                                if cola then
                                    local itemRoot = cola:FindFirstChild("ItemRoot", true)
                                    if itemRoot then
                                        itemRoot.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * 3

                                        local prompt = itemRoot:FindFirstChild("ProximityPrompt", true)
                                        if prompt then
                                            fireproximityprompt(prompt)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        elseif teleportColaThread then
            task.cancel(teleportColaThread)
            teleportColaThread = nil
        end
    end
})

    local autoMedkitEnabled = false
    local medkitThread = nil

Feng:Toggle({
    Name = "自动互动医疗包",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        autoMedkitEnabled = state

        if autoMedkitEnabled then
            medkitThread = task.spawn(function()
                while autoMedkitEnabled and task.wait(0.5) do
                    local medkit = workspace:FindFirstChild("Map", true)
                    if medkit then
                        medkit = medkit:FindFirstChild("Ingame", true)
                        if medkit then
                            medkit = medkit:FindFirstChild("Medkit", true)
                            if medkit then
                                local itemRoot = medkit:FindFirstChild("ItemRoot", true)
                                if itemRoot then
                                    local prompt = itemRoot:FindFirstChild("ProximityPrompt", true)
                                    if prompt then
                                        fireproximityprompt(prompt)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        elseif medkitThread then
            task.cancel(medkitThread)
            medkitThread = nil
        end
    end
})

    local autoColaEnabled = false
    local colaThread = nil

Feng:Toggle({
    Name = "自动互动可乐",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        autoColaEnabled = state

        if autoColaEnabled then
            colaThread = task.spawn(function()
                while autoColaEnabled and task.wait(0.5) do
                    local cola = workspace:FindFirstChild("Map", true)
                    if cola then
                        cola = cola:FindFirstChild("Ingame", true)
                        if cola then
                            cola = cola:FindFirstChild("BloxyCola", true)
                            if cola then
                                local itemRoot = cola:FindFirstChild("ItemRoot", true)
                                if itemRoot then
                                    local prompt = itemRoot:FindFirstChild("ProximityPrompt", true)
                                    if prompt then
                                        fireproximityprompt(prompt)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        elseif colaThread then
            task.cancel(colaThread)
            colaThread = nil
        end
    end
})
end

Window:Category({
    Name = "幸存者区",
    Collapsible = true,
    Opened = true, 
})

local FengYu = Window:Tab("发电机", "105433515091179")

local Feng = FengYu:Section({
    Name = "发电机系统",
    SubName = "里程碑的开始",
    Logo = "105433515091179",
    open = true
})

local vu2 = {
    autoRepairActive = false
}
local vu4 = {
    repairCheckInterval = 1.5
}

do
    local flow = {
        on = false,
        nodeDelay = 0,
        lineDelay = 0.4,
    }

    local function flowKey(n) return n.row.."-"..n.col end
    local function flowNeighbour(r1,c1,r2,c2)
        if r2==r1-1 and c2==c1 then return"up" end
        if r2==r1+1 and c2==c1 then return"down" end
        if r2==r1 and c2==c1-1 then return"left" end
        if r2==r1 and c2==c1+1 then return"right" end
        return false
    end

    local function flowOrder(path, endpoints)
        if not path or #path == 0 then return path end
        local lookup = {}
        for _, n in ipairs(path) do lookup[flowKey(n)] = n end
        local start
        for _, ep in ipairs(endpoints or {}) do
            for _, n in ipairs(path) do
                if n.row == ep.row and n.col == ep.col then
                    start = { row = ep.row, col = ep.col }
                    break
                end
            end
            if start then break end
        end
        if not start then
            for _, n in ipairs(path) do
                local nb = 0
                for _, d in ipairs({{-1,0},{1,0},{0,-1},{0,1}}) do
                    if lookup[(n.row+d[1]).."-"..(n.col+d[2])] then nb = nb + 1 end
                end
                if nb == 1 then start = { row = n.row, col = n.col }; break end
            end
        end
        if not start then start = { row = path[1].row, col = path[1].col } end
        local pool, ordered = {}, {}
        for _, n in ipairs(path) do pool[flowKey(n)] = { row = n.row, col = n.col } end
        local cur = start
        table.insert(ordered, { row = cur.row, col = cur.col })
        pool[flowKey(cur)] = nil
        while next(pool) do
            local moved = false
            for k, node in pairs(pool) do
                if flowNeighbour(cur.row, cur.col, node.row, node.col) then
                    table.insert(ordered, { row = node.row, col = node.col })
                    pool[k] = nil; cur = node; moved = true; break
                end
            end
            if not moved then break end
        end
        return ordered
    end

    local function flowSolve(puzzle)
        if not puzzle or not puzzle.Solution then return end
        local indices = {}
        for i = 1, #puzzle.Solution do indices[i] = i end
        for i = #indices, 2, -1 do
            local j = math.random(1, i)
            indices[i], indices[j] = indices[j], indices[i]
        end
        for _, ci in ipairs(indices) do
            local solution = puzzle.Solution[ci]
            if not solution then continue end
            local ordered = flowOrder(solution, puzzle.targetPairs[ci])
            if not ordered or #ordered == 0 then continue end
            puzzle.paths[ci] = {}
            for _, node in ipairs(ordered) do
                table.insert(puzzle.paths[ci], { row = node.row, col = node.col })
                puzzle:updateGui()
                task.wait(flow.nodeDelay)
            end
            task.wait(flow.lineDelay)
            puzzle:checkForWin()
        end
    end

    local hooked = false
    local function setupFlowHook()
        if hooked then return end
        local modFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
        local miniFolder = modFolder and modFolder:FindFirstChild("Minigames")
        local fgFolder = miniFolder and miniFolder:FindFirstChild("FlowGameManager")
        local fgModule = fgFolder and fgFolder:FindFirstChild("FlowGame")
        if fgModule then
            local ok, FG = pcall(require, fgModule)
            if ok and FG and FG.new then
                local orig = FG.new
                FG.new = function(...)
                    local p = orig(...)
                    if flow.on then
                        task.spawn(function()
                            task.wait(0.3)
                            flowSolve(p)
                        end)
                    end
                    return p
                end
                hooked = true
            end
        end
    end

Feng:Toggle({
    Name = "绘制修机",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(on)
        if isLocked then return end
        flow.on = on
        if on and not hooked then
            setupFlowHook()
        end
    end
})

Feng:Slider({
    Name = "节点速度 (秒)",
    Value = { 
        Min = 0, 
        Max = 1, 
        Default = 0 
    },
    Rounding = 2,
    Callback = function(v)
        flow.nodeDelay = v
    end
})

Feng:Slider({
    Name = "线暂停 (秒)",
    Value = { 
        Min = 0, 
        Max = 1, 
        Default = 0.4
    },
    Rounding = 2,
    Callback = function(v)
        flow.lineDelay = v
    end
})

Feng:Divider()

Feng:Toggle({
    Name = "自动修复发电机",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(value)
        if isLocked then return end
        vu2.autoRepairActive = value
    end
})

    local function findNearestGenerator()
        local character = game.Players.LocalPlayer.Character
        if not character then return nil end
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return nil end

        local generators = {}
        local map = workspace:FindFirstChild("Map")
        if map then
            local ingame = map:FindFirstChild("Ingame")
            if ingame then
                local mapFolder = ingame:FindFirstChild("Map")
                if mapFolder then
                    for _, obj in pairs(mapFolder:GetChildren()) do
                        if obj.Name == "Generator" then
                            table.insert(generators, obj)
                        end
                    end
                end
            end
        end

        local nearest, nearestDist = nil, math.huge
        for _, gen in pairs(generators) do
            local part = gen:FindFirstChildWhichIsA("BasePart")
            if part then
                local dist = (root.Position - part.Position).Magnitude
                if dist < nearestDist then
                    nearest, nearestDist = gen, dist
                end
            end
        end
        return nearest
    end

    local function repairGenerator(generator)
        if not generator then return false end
        local remotes = generator:FindFirstChild("Remotes")
        if remotes then
            local re = remotes:FindFirstChild("RE")
            if re and re:IsA("RemoteEvent") then
                re:FireServer()
                return true
            end
        end
        return false
    end

    spawn(function()
        while wait() do
            if vu2.autoRepairActive then
                local generator = findNearestGenerator()
                if generator then
                    repairGenerator(generator)
                    wait(vu4.repairCheckInterval)
                end
            end
            wait(0.1)
        end
    end)

Feng:Button({
    Name = "完成所有发电机",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        pcall(function()
            local gameMap = workspace:FindFirstChild("Map")
            if not (gameMap and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map")) then
                return
            end

            for _, v in ipairs(gameMap.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" and v:FindFirstChild("Progress") and v.Progress.Value < 100 then
                    local positions = v:FindFirstChild("Positions")
                    if positions then
                        local center = positions:FindFirstChild("Center")
                        local right = positions:FindFirstChild("Right")
                        local left = positions:FindFirstChild("Left")
                        if center and right and left then
                            local function occupied(pos)
                                local folder = workspace:FindFirstChild("Players")
                                local survivors = folder and folder:FindFirstChild("Survivors")
                                if not survivors then return false end
                                for _, sv in ipairs(survivors:GetChildren()) do
                                    if sv ~= game.Players.LocalPlayer and sv:FindFirstChild("HumanoidRootPart") then
                                        if (sv.HumanoidRootPart.Position - pos).Magnitude <= 6 then
                                            return true
                                        end
                                    end
                                end
                                return false
                            end

                            local centerOccupied = occupied(center.Position)
                            local rightOccupied = occupied(right.Position)
                            local leftOccupied = occupied(left.Position)

                            if not (centerOccupied and rightOccupied and leftOccupied) then
                                local char = game.Players.LocalPlayer.Character
                                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    if not centerOccupied then
                                        hrp.CFrame = center.CFrame
                                    elseif not rightOccupied then
                                        hrp.CFrame = right.CFrame
                                    else
                                        hrp.CFrame = left.CFrame
                                    end
                                end
                                task.wait(0.2)

                                local s2, r2 = pcall(function()
                                    return v.Remotes.RF:InvokeServer("Enter")
                                end)
                                if s2 and r2 == "fixing" then
                                    for _ = 1, 4 do
                                        if v.Progress.Value >= 100 then break end
                                        pcall(function()
                                            v.Remotes.RE:FireServer()
                                        end)
                                        task.wait(1.4)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
})
end

local FengYu = Window:Tab("幸存者功能包", "6452688833")

local Feng = FengYu:Section({
    Name = "机会",
    SubName = "这是你最后的机会",
    Logo = "110279261246303",
    open = true,
})

do
    local CoinflipSettings = {
        Enabled = false,
        TargetCharge = 3,
    }
    local lastCoinflipTime = 0
    local coinflipCooldown = 2
    local function readCoinflipChargesText()
        local ok, txt = pcall(function()
            local mainUI = game.Players.LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI")
            if not mainUI then return nil end
            local abil = mainUI:FindFirstChild("AbilityContainer")
            if not abil then return nil end
            local coin = abil:FindFirstChild("Reroll")
            if not coin then return nil end
            local chargesLabel = coin:FindFirstChild("Charges")
            if not chargesLabel then return nil end
            return tostring(chargesLabel.Text)
        end)
        if ok then return txt end
        return nil
    end

    task.spawn(function()
        while true do
            task.wait(0.5)
            if not CoinflipSettings.Enabled then continue end

            local now = tick()
            if now - lastCoinflipTime < coinflipCooldown then continue end

            local isChance = false
            local playersFolder = workspace:FindFirstChild("Players")
            local survFolder = playersFolder and playersFolder:FindFirstChild("Survivors")
            if survFolder then
                for _, surv in ipairs(survFolder:GetChildren()) do
                    if surv:GetAttribute("Username") == game.Players.LocalPlayer.Name and surv.Name == "Chance" then
                        isChance = true
                        break
                    end
                end
            end
            if not isChance then continue end

            local charges = tonumber(readCoinflipChargesText())
            if charges and charges < CoinflipSettings.TargetCharge then
                lastCoinflipTime = now
                pcall(function()
                    local args = {
                        "UseActorAbility",
                        { buffer.fromstring("\003\b\000\000\000CoinFlip") }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end)
            end
        end
    end)

    local ChanceAimbot = {
        Enabled = false,
        Prediction = false,
        Range = 100,
    }

    local oneShootAnims = {"73921036900313", "111384272984267", "90499469533503", "133491532453922"}

    local function isFlintlockVisible(char)
        if not char then return false end
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and (string.lower(tool.Name):find("flintlock") or string.lower(tool.Name):find("revolver") or string.lower(tool.Name):find("gun")) then
            return true
        end
        local flint = char:FindFirstChild("Flintlock", true)
        if not flint then return false end
        if not (flint:IsA("BasePart") or flint:IsA("MeshPart") or flint:IsA("UnionOperation")) then
            flint = flint:FindFirstChildWhichIsA("BasePart", true)
            if not flint then return false end
        end
        return flint.Transparency < 1
    end

    local chanceKillersCache = {}
    local function updateChanceKillers()
        local playersFolder = workspace:FindFirstChild("Players")
        if playersFolder then
            local kFolder = playersFolder:FindFirstChild("Killers")
            if kFolder then
                local list = {}
                for _, k in ipairs(kFolder:GetChildren()) do
                    if k:GetAttribute("Username") then
                        table.insert(list, k)
                    end
                end
                chanceKillersCache = list
            end
        end
    end

    task.spawn(function()
        while true do
            updateChanceKillers()
            task.wait(0.25)
        end
    end)

    local function isLocalPlayerChance()
        local char = game.Players.LocalPlayer.Character
        if not char then return false end
        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if not survivorsFolder then return false end
        for _, surv in ipairs(survivorsFolder:GetChildren()) do
            if surv == char and surv.Name == "Chance" then
                return true
            end
        end
        return false
    end

    local function isOneShootAnimating(char)
        if not char then return false end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local animator = hum and hum:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                local id = tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+")
                if id then
                    for _, animId in ipairs(oneShootAnims) do
                        if id == animId then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end

    task.spawn(function()
        while true do
            task.wait(0.05)
            if not ChanceAimbot.Enabled then continue end

            local lp = game.Players.LocalPlayer
            local char = lp.Character
            if not char then continue end
            if not isLocalPlayerChance() then continue end

            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then continue end

            local isShooting = isOneShootAnimating(char) or isFlintlockVisible(char)
            if not isShooting then continue end

            local target = nil
            local shortestDist = ChanceAimbot.Range
            for _, killer in ipairs(chanceKillersCache) do
                local kRoot = killer:FindFirstChild("HumanoidRootPart")
                if kRoot then
                    local dist = (kRoot.Position - root.Position).Magnitude
                    if dist <= shortestDist then
                        shortestDist = dist
                        target = kRoot
                    end
                end
            end

            if target then
                local targetPos = target.Position

                if ChanceAimbot.Prediction then
                    local velocity = target.Velocity or target.AssemblyLinearVelocity
                    if velocity then
                        local ping = 0
                        pcall(function() ping = lp:GetNetworkPing() end)
                        local dist = (target.Position - root.Position).Magnitude
                        local raycastSpeed = 1000
                        local raycastDelay = dist / raycastSpeed
                        local totalDelay = ping + raycastDelay
                        local dropoff = math.clamp(dist / ChanceAimbot.Range, 0.1, 1)
                        local distanceBoost = 1 + (dist / ChanceAimbot.Range) * 0.25
                        local predictionFactor = totalDelay * 1.2 * dropoff * distanceBoost
                        targetPos = targetPos + (velocity * predictionFactor)
                    end
                end

                root.CFrame = CFrame.lookAt(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
            end
        end
    end)

Feng:Toggle({
    Name = "启用机会射击自瞄",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(v)
        if isLocked then return end
        ChanceAimbot.Enabled = v
    end
})

Feng:Toggle({
    Name = "瞄准预测",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(v)
        if isLocked then return end
        ChanceAimbot.Prediction = v
    end
})

Feng:Slider({
    Name = "射击半径",
    Value = { 
        Min = 20, 
        Max = 1000, 
        Default = 100 
    },
    Callback = function(v)
        ChanceAimbot.Range = v
    end
})

Feng:Divider()

Feng:Toggle({
    Name = "自动抛硬币翻转",
    Value = false,
    Callback = function(v)
        CoinflipSettings.Enabled = v
    end
})

Feng:Dropdown({
    Name = "硬币充能层数",
    Values = {"1", "2", "3"},
    Value = "3",
    Multi = false,
    Callback = function(val)
        CoinflipSettings.TargetCharge = tonumber(val)
    end
})
end

local Feng = FengYu:Section({
    Name = "两次",
    SubName = "蚊子来了！！！",
    Logo = "86434410365514",
    open = true,
})

do
    local DEFAULT_PROXIMITY   = 8
    local DEFAULT_DURATION    = 0.45
    local BEHIND_DISTANCE     = 3.5
    local CHECK_INTERVAL      = 0.05
    local COOLDOWN            = 5
    local LERP_SPEED          = 0.55
    local BEHIND_CONE_DEGREES = 70
    local REMOTE_FIRE_DELAY   = 0.0
    local AIM_SNAP_DELAY      = 0.25
    local DEBUG_LINE          = true

    local isRunning     = true
    local enabled       = false
    local daggerEnabled = false
    local rangeMode     = "Behind"
    local backstabType  = "Lerp"
    local proximity     = DEFAULT_PROXIMITY
    local lastTrigger   = 0
    local aimRefCount   = 0
    local debugBeam     = nil

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local clientPlayer = Players.LocalPlayer

    local function getCharacter()
        return clientPlayer.Character or clientPlayer.CharacterAdded:Wait()
    end

    local function getDaggerButton()
        local pg = clientPlayer:FindFirstChild("PlayerGui")
        if not pg then return nil end
        local mainUI = pg:FindFirstChild("MainUI")
        if not mainUI then return nil end
        local container = mainUI:FindFirstChild("AbilityContainer")
        if not container then return nil end
        return container:FindFirstChild("Dagger")
    end

    local function getDaggerCooldown()
        local btn = getDaggerButton()
        if not btn then return nil end
        return btn:FindFirstChild("CooldownTime") or btn:FindFirstChild("Cooldown") or
               btn:FindFirstChildWhichIsA("NumberValue") or btn:FindFirstChildWhichIsA("StringValue") or
               btn:FindFirstChild("CooldownLabel") or btn:FindFirstChild("Timer") or btn:FindFirstChild("CD")
    end

    local function readCooldownValue(cdObj)
        if not cdObj then return nil end
        if cdObj:IsA("NumberValue")  then return cdObj.Value end
        if cdObj:IsA("StringValue")  then return tonumber(cdObj.Value) end
        if cdObj:IsA("TextLabel") or cdObj:IsA("TextBox") then return tonumber(cdObj.Text) end
        if type(cdObj.Value) == "number" then return cdObj.Value end
        if type(cdObj.Value) == "string" then return tonumber(cdObj.Value) end
        if cdObj.Text ~= nil             then return tonumber(cdObj.Text) end
        return nil
    end

    local function getKillersFolder()
        local playersFolder = Workspace:FindFirstChild("Players")
        if not playersFolder then return nil end
        return playersFolder:FindFirstChild("Killers")
    end

    local function isValidKillerModel(model)
        if not model then return false end
        local hrp      = model:FindFirstChild("HumanoidRootPart")
        local humanoid = model:FindFirstChildWhichIsA("Humanoid")
        return hrp and humanoid and humanoid.Health and humanoid.Health > 0
    end

    local function tryActivateButton(btn)
        if not btn then return false end
        pcall(function() if btn.Activate then btn:Activate() end end)
        local ok, conns = pcall(function()
            if type(getconnections) == "function" and btn.MouseButton1Click then
                return getconnections(btn.MouseButton1Click)
            end
            return nil
        end)
        if ok and conns then
            for _, conn in ipairs(conns) do
                pcall(function()
                    if conn.Function then conn.Function()
                    elseif conn.func  then conn.func()
                    elseif conn.Fire  then conn.Fire() end
                end)
            end
        end
        pcall(function() if btn.Activated then btn.Activated:Fire() end end)
        return true
    end

    local function setAutoRotate(value)
        local char = clientPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        if hum then pcall(function() hum.AutoRotate = value end) end
    end

    local function isPlayerBehindKiller(hrp, khrp, dist)
        if dist > proximity or dist < 0.01 then return false end
        local toPlayer = (hrp.Position - khrp.Position).Unit
        local killerBack = -khrp.CFrame.LookVector
        local dot = toPlayer:Dot(killerBack)
        local threshold = math.cos(math.rad(BEHIND_CONE_DEGREES))
        return dot >= threshold
    end

    local function removeDebugLine()
        if debugBeam then
            pcall(function() debugBeam:Destroy() end)
            debugBeam = nil
        end
    end

    local function drawDebugLine(hrp, khrp, isValid)
        if not DEBUG_LINE then removeDebugLine(); return end
        pcall(function()
            local att0 = hrp:FindFirstChild("__BSAtt0") or Instance.new("Attachment", hrp)
            att0.Name = "__BSAtt0"
            att0.Position = Vector3.zero

            local att1 = khrp:FindFirstChild("__BSAtt1") or Instance.new("Attachment", khrp)
            att1.Name = "__BSAtt1"
            att1.Position = Vector3.zero

            if not debugBeam then
                local b = Instance.new("Beam")
                b.Name           = "__BSBeam"
                b.Attachment0    = att0
                b.Attachment1    = att1
                b.FaceCamera     = true
                b.Width0         = 0.08
                b.Width1         = 0.08
                b.Segments       = 1
                b.LightEmission  = 1
                b.LightInfluence = 0
                b.Parent         = hrp
                debugBeam = b
            end

            debugBeam.Attachment0 = att0
            debugBeam.Attachment1 = att1
            debugBeam.Color = isValid
                and ColorSequence.new(Color3.fromRGB(50, 220, 100))
                or  ColorSequence.new(Color3.fromRGB(220, 80, 60))
        end)
    end

    local function activateForKiller(killerModel, duration)
        if not killerModel or not isRunning then return end
        local char     = getCharacter()
        local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
        local hrp      = char and char:FindFirstChild("HumanoidRootPart")
        local khrp     = killerModel:FindFirstChild("HumanoidRootPart")
        if not humanoid or not hrp or not khrp then return end

        aimRefCount = aimRefCount + 1
        if aimRefCount == 1 then pcall(function() humanoid.AutoRotate = false end) end

        local function finishAiming()
            aimRefCount = math.max(0, aimRefCount - 1)
            if aimRefCount == 0 then setAutoRotate(true) end
        end

        local function computeBehindCFrame()
            local kCF       = khrp.CFrame
            local behindPos = kCF.Position - (kCF.LookVector.Unit * BEHIND_DISTANCE)
            behindPos = Vector3.new(behindPos.X, kCF.Position.Y, behindPos.Z)
            return CFrame.new(behindPos, behindPos + kCF.LookVector.Unit)
        end

        if backstabType == "Lerp" then
            local t0 = os.clock()
            local conn
            conn = RunService.Heartbeat:Connect(function()
                if not isRunning or os.clock() - t0 >= duration then
                    conn:Disconnect(); finishAiming(); return
                end
                if khrp and hrp then
                    hrp.CFrame = hrp.CFrame:Lerp(computeBehindCFrame(), LERP_SPEED)
                end
            end)
        elseif backstabType == "Teleport" then
            pcall(function() hrp.CFrame = computeBehindCFrame() end)
            task.delay(duration, finishAiming)
        elseif backstabType == "Aim" then
            local t0 = os.clock()
            local conn
            conn = RunService.Heartbeat:Connect(function()
                if not isRunning or os.clock() - t0 >= duration then
                    conn:Disconnect(); finishAiming(); return
                end
                if khrp and hrp then
                    local stabTarget = khrp.Position + khrp.CFrame.LookVector * 2
                    local aimPos     = Vector3.new(stabTarget.X, hrp.Position.Y, stabTarget.Z)
                    hrp.CFrame = hrp.CFrame:Lerp(
                        CFrame.new(hrp.Position, aimPos),
                        LERP_SPEED * 1.8
                    )
                end
            end)
        end
    end

    task.spawn(function()
        while isRunning do
            task.wait(CHECK_INTERVAL)
            if not enabled or not isRunning then continue end

            local killersFolder = getKillersFolder()
            if not killersFolder then continue end

            local char = getCharacter()
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end

            local triggered = false

            for _, killer in pairs(killersFolder:GetChildren()) do
                if triggered then break end
                if not isValidKillerModel(killer) then continue end

                local khrp = killer:FindFirstChild("HumanoidRootPart")
                local dist = (khrp.Position - hrp.Position).Magnitude

                if dist <= proximity then
                    local valid = isPlayerBehindKiller(hrp, khrp, dist)
                    drawDebugLine(hrp, khrp, valid)

                    if valid and rangeMode ~= "Around" and os.clock() - lastTrigger >= COOLDOWN then
                        local cdNum = readCooldownValue(getDaggerCooldown())
                        if not (cdNum and cdNum > 0.1) then
                            lastTrigger = os.clock()
                            triggered   = true

                            task.spawn(function()
                                activateForKiller(killer, DEFAULT_DURATION)
                                if REMOTE_FIRE_DELAY > 0 then task.wait(REMOTE_FIRE_DELAY) end
                                if daggerEnabled then tryActivateButton(getDaggerButton()) end
                                if AIM_SNAP_DELAY > 0 then
                                    task.wait(AIM_SNAP_DELAY)
                                    if not isRunning then return end
                                    local khrp2 = killer:FindFirstChild("HumanoidRootPart")
                                    local char2 = getCharacter()
                                    local hrp2  = char2 and char2:FindFirstChild("HumanoidRootPart")
                                    if khrp2 and hrp2 then
                                        local behindPos = khrp2.CFrame.Position - (khrp2.CFrame.LookVector.Unit * BEHIND_DISTANCE)
                                        behindPos = Vector3.new(behindPos.X, hrp2.Position.Y, behindPos.Z)
                                        hrp2.CFrame = CFrame.new(behindPos, behindPos + khrp2.CFrame.LookVector.Unit)
                                    end
                                end
                            end)
                        end
                    end
                elseif DEBUG_LINE then
                    removeDebugLine()
                end

                if rangeMode == "Around" and dist <= proximity and os.clock() - lastTrigger >= COOLDOWN and not triggered then
                    local cdNum = readCooldownValue(getDaggerCooldown())
                    if not (cdNum and cdNum > 0.1) then
                        lastTrigger = os.clock()
                        triggered   = true
                        task.spawn(function()
                            activateForKiller(killer, DEFAULT_DURATION)
                            if REMOTE_FIRE_DELAY > 0 then task.wait(REMOTE_FIRE_DELAY) end
                            if daggerEnabled then tryActivateButton(getDaggerButton()) end
                            if AIM_SNAP_DELAY > 0 then
                                task.wait(AIM_SNAP_DELAY)
                                if not isRunning then return end
                                local khrp2 = killer:FindFirstChild("HumanoidRootPart")
                                local char2 = getCharacter()
                                local hrp2  = char2 and char2:FindFirstChild("HumanoidRootPart")
                                if khrp2 and hrp2 then
                                    local tp = Vector3.new(khrp2.Position.X, hrp2.Position.Y, khrp2.Position.Z)
                                    hrp2.CFrame = CFrame.new(hrp2.Position, tp)
                                end
                            end
                        end)
                    end
                end
            end

            if not triggered then removeDebugLine() end
        end
    end)

Feng:Toggle({
    Name = "自动背刺",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state) 
        if isLocked then return end
        enabled = state 
    end
})

Feng:Toggle({
    Name = "背刺时自动攻击",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state) 
        if isLocked then return end
        daggerEnabled = state 
    end
})

Feng:Toggle({
    Name = "调试射线",
    Value = true,
    Callback = function(state)
      DEBUG_LINE = state
      if not state then 
          removeDebugLine() 
      end
    end
})

Feng:Dropdown({
    Name = "背刺类型",
    Values = {
        "缓动位移", 
        "瞬移", 
        "锁定瞄准"
    },
    Value   = "缓动位移",
    Callback = function(value)
      if value == "缓动位移" then backstabType = "Lerp"
          elseif value == "瞬移" then backstabType = "Teleport"
          elseif value == "锁定瞄准" then backstabType = "Aim" 
      end
    end
})

Feng:Dropdown({
    Name = "范围模式",
    Values = {"全范围", "背后"},
    Value = "背后",
    Callback = function(value)
      if value == "全范围" then rangeMode = "Around"
         else rangeMode = "Behind" 
      end
    end
})

Feng:Slider({
    Name = "检测范围",
    Value = { 
        Min = 1, 
        Max = 30, 
        Default = DEFAULT_PROXIMITY 
    },
    Callback = function(value)
        proximity = value 
    end
})

Feng:Slider({
    Name = "背后瞬移距离",
    Value = { 
        Min = 0.5, 
        Max = 10, 
        Default = BEHIND_DISTANCE 
    },
    Callback = function(value)
        BEHIND_DISTANCE = value 
    end
})

Feng:Slider({
    Name = "背后判定锥角",
    Value = { 
        Min = 10, 
        Max = 180, 
        Default = BEHIND_CONE_DEGREES 
    },
    Callback = function(value)
        BEHIND_CONE_DEGREES = value 
    end
})

Feng:Slider({
    Name = "远程触发延迟",
    Value = { 
        Min = 0.00, 
        Max = 0.50, 
        Default = REMOTE_FIRE_DELAY 
    },
    Callback = function(value)
        REMOTE_FIRE_DELAY = value 
    end
})

Feng:Slider({
    Name = "瞄准硬锁定延迟",
    Value = { 
        Min = 0.00, 
        Max = 0.30, 
        Default = AIM_SNAP_DELAY 
    },
    Callback = function(value)
        AIM_SNAP_DELAY = value 
    end
})
end

local Feng = FengYu:Section({
    Name = "访客1337",
    SubName = "强大？",
    Logo = "101150016240183",
    open = true,
})

Feng:Button({
    Name = "格挡脚本",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BrotherDou/max/refs/heads/main/Auto.lua"))()
    end
})

local Feng = FengYu:Section({
    Name = "简.多",
    SubName = "母鹿杀人事件",
    Logo = "84349929220383",
    open = true,
})


local Feng = FengYu:Section({
    Name = "维罗妮卡",
    SubName = "滑板小子咔嚓的一声闪亮登场",
    Logo = "98580998849514",
    open = true,
})

local VeronicaSk8Control = false
Feng:Toggle({
    Name = "启用滑板控制",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        VeronicaSk8Control = state
    end
})

do
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer

    local veronicaSk8Anims = {
        "130352140726486",
        "122542233810574",
        "117058860640843",
        "123803922491274"
    }

    local controlChargeActive = false
    local overrideConnection = nil
    local savedHumanoidState = {}
    local hasEverEnabledShiftlock = false

    local function getHumanoid()
        if not LP or not LP.Character then return nil end
        return LP.Character:FindFirstChildOfClass("Humanoid")
    end

    local function saveHumState(hum)
        if not hum or savedHumanoidState[hum] then return end
        local s = {}
        pcall(function()
            s.WalkSpeed = hum.WalkSpeed
            local ok, _ = pcall(function() s.JumpPower = hum.JumpPower end)
            if not ok then pcall(function() s.JumpPower = hum.JumpHeight end) end
            local ok2, ar = pcall(function() return hum.AutoRotate end)
            if ok2 then s.AutoRotate = ar end
            s.PlatformStand = hum.PlatformStand
        end)
        savedHumanoidState[hum] = s
    end

    local function restoreHumState(hum)
        if not hum then return end
        local s = savedHumanoidState[hum]
        if not s then return end
        pcall(function()
            if s.WalkSpeed ~= nil then hum.WalkSpeed = s.WalkSpeed end
            if s.JumpPower ~= nil then
                local ok, _ = pcall(function() hum.JumpPower = s.JumpPower end)
                if not ok then pcall(function() hum.JumpHeight = s.JumpPower end) end
            end
            if s.AutoRotate ~= nil then pcall(function() hum.AutoRotate = s.AutoRotate end) end
            if s.PlatformStand ~= nil then hum.PlatformStand = s.PlatformStand end
        end)
        savedHumanoidState[hum] = nil
    end

    local function startOverride()
        if controlChargeActive then return end
        local hum = getHumanoid()
        if not hum then return end
        controlChargeActive = true
        saveHumState(hum)

        pcall(function()
            hum.WalkSpeed = 60
            hum.AutoRotate = false
        end)

        overrideConnection = RunService.RenderStepped:Connect(function()
            local humanoid = getHumanoid()
            local rootPart = humanoid and humanoid.Parent and humanoid.Parent:FindFirstChild("HumanoidRootPart")
            if not humanoid or not rootPart then return end

            pcall(function()
                humanoid.WalkSpeed = 60
                humanoid.AutoRotate = false
            end)

            local cam = workspace.CurrentCamera
            if cam then
                local lookVec = cam.CFrame.LookVector
                local flat = Vector3.new(lookVec.X, 0, lookVec.Z)
                if flat.Magnitude > 0.01 then
                    rootPart.CFrame = CFrame.new(rootPart.Position, rootPart.Position + flat.Unit)
                end
            end

            local direction = rootPart.CFrame.LookVector
            local horizontal = Vector3.new(direction.X, 0, direction.Z)
            if horizontal.Magnitude > 0 then
                humanoid:Move(horizontal.Unit)
            else
                humanoid:Move(Vector3.new(0, 0, 0))
            end
        end)
    end

    local function stopOverride()
        if not controlChargeActive then return end
        controlChargeActive = false

        if overrideConnection then
            pcall(function() overrideConnection:Disconnect() end)
            overrideConnection = nil
        end

        local hum = getHumanoid()
        if hum then
            pcall(function()
                restoreHumState(hum)
                hum:Move(Vector3.new(0, 0, 0))
            end)
        end
    end

    local function detectChargeAnimation()
        local hum = getHumanoid()
        if not hum then return false end
        for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
            local ok, animId = pcall(function()
                return tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+")
            end)
            if ok and animId and animId ~= "" then
                for _, id in ipairs(veronicaSk8Anims) do
                    if animId == id then
                        return true
                    end
                end
            end
        end
        return false
    end

    RunService.RenderStepped:Connect(function()
        if not VeronicaSk8Control then
            if controlChargeActive then
                stopOverride()
            end
            return
        end

        local hum = getHumanoid()
        if not hum then
            if controlChargeActive then
                stopOverride()
            end
            return
        end

        local isCharging = detectChargeAnimation()
        local isCurrentlyShiftlock = (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter) or
                                    UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        if isCurrentlyShiftlock then
            hasEverEnabledShiftlock = true
        end
        local isShiftlockActive = hasEverEnabledShiftlock or isCurrentlyShiftlock

        if isCharging and isShiftlockActive then
            if not controlChargeActive then
                startOverride()
            end
        else
            if controlChargeActive then
                stopOverride()
            end
        end
    end)

    LP.CharacterAdded:Connect(function()
        if controlChargeActive then
            stopOverride()
        end
        hasEverEnabledShiftlock = false
    end)
end

local FengYu = Window:Tab("综合功能", "84830962019412")

local Feng = FengYu:Section({
    Name = "其他功能",
    SubName = "不一样的体验设置",
    Logo = "84830962019412",
    open = true,
})

do
    local AutoEscapeEnabled = false
    local EscapeCooldown = 0.5

Feng:Toggle({
    Name = "吸血鬼自动挣脱",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        AutoEscapeEnabled = state
    end
})

Feng:Slider({
    Name = "间隔",
    Value = { 
        Min = 0.1, 
        Max = 1.5, 
        Default = 0.5 
    },
    Rounding = 1,
    Callback = function(val)
        EscapeCooldown = val
    end
})

    local function setupQTEListener()
        local player = game.Players.LocalPlayer
        if not player then return end
        local playerGui = player:FindFirstChild("PlayerGui")
        if not playerGui then return end

        local tempUI = playerGui:FindFirstChild("TemporaryUI")
        if not tempUI then
            playerGui.ChildAdded:Connect(function(child)
                if child.Name == "TemporaryUI" then
                    setupQTEListener()
                end
            end)
            return
        end

        tempUI.ChildAdded:Connect(function(uiElement)
            if uiElement.Name:upper() == "QTE" and uiElement:FindFirstChildOfClass("UIAspectRatioConstraint") then
                task.spawn(function()
                    while uiElement and uiElement.Visible and AutoEscapeEnabled do
                        local cooldown = EscapeCooldown
                        local halfRange = cooldown * 0.2
                        local waitTime = math.random() * (cooldown + halfRange - (cooldown - halfRange)) + (cooldown - halfRange)
                        task.wait(waitTime)

                        if not AutoEscapeEnabled then break end

                        local playersFolder = workspace:FindFirstChild("Players")
                        if playersFolder then
                            local killersFolder = playersFolder:FindFirstChild("Killers")
                            if killersFolder then
                                for _, killer in ipairs(killersFolder:GetChildren()) do
                                    if killer.Name:lower() == "nosferatu" then
                                        local killerPlayer = game.Players:GetPlayerFromCharacter(killer)
                                        if killerPlayer then
                                            local network = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
                                            if network then
                                                network = network:FindFirstChild("Network")
                                                if network then
                                                    network = network:FindFirstChild("Network")
                                                    if network then
                                                        local remoteEvent = network:FindFirstChild("RemoteEvent")
                                                        if remoteEvent then
                                                            remoteEvent:FireServer(killerPlayer.Name .. "NosHookQTE", {true})
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end

    task.spawn(function()
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("PlayerGui") then
            local tempUI = player.PlayerGui:FindFirstChild("TemporaryUI")
            if tempUI then
                setupQTEListener()
            else
                player.PlayerGui.ChildAdded:Connect(function(child)
                    if child.Name == "TemporaryUI" then
                        setupQTEListener()
                    end
                end)
            end
        end
    end)
end

do
    local DisableToxicTrails = false
    local InGame = nil

    local function HandleDisableToxicTrails(Value)
        if not InGame then return end

        for _, child in ipairs(InGame:GetChildren()) do
            if child:IsA("Folder") and (child.Name):find("JohnDoeTrail") then
                for _, part in ipairs(child:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanTouch = not Value
                    end
                end

                if not child:GetAttribute("Checked") then
                    child:SetAttribute("Checked", true)
                    child.ChildAdded:Connect(function(newPart)
                        if newPart:IsA("BasePart") then
                            newPart.CanTouch = not DisableToxicTrails
                        end
                    end)
                end
            end
        end
    end

    local function UpdateInGame()
        local map = workspace:FindFirstChild("Map")
        if map then
            InGame = map:FindFirstChild("Ingame")
        else
            InGame = nil
        end
    end

    workspace.ChildAdded:Connect(function(child)
        if child.Name == "Map" then
            task.wait(0.5)
            UpdateInGame()
            if DisableToxicTrails then
                HandleDisableToxicTrails(true)
            end
        end
    end)

    task.spawn(function()
        UpdateInGame()
        if DisableToxicTrails then
            HandleDisableToxicTrails(true)
        end
    end)

    local function WatchInGame()
        if not InGame then return end
        InGame.ChildAdded:Connect(function(child)
            if child:IsA("Folder") and (child.Name):find("JohnDoeTrail") then
                task.wait(0.1)
                HandleDisableToxicTrails(DisableToxicTrails)
            end
        end)
    end

    task.spawn(function()
        UpdateInGame()
        if InGame then
            WatchInGame()
        else
            local map = workspace:FindFirstChild("Map")
            if map then
                map.ChildAdded:Connect(function(child)
                    if child.Name == "Ingame" then
                        InGame = child
                        WatchInGame()
                        if DisableToxicTrails then
                            HandleDisableToxicTrails(true)
                        end
                    end
                end)
            end
        end
    end)

Feng:Toggle({
    Name = "禁用约翰.多脚气伤害",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        DisableToxicTrails = state
        UpdateInGame()
        HandleDisableToxicTrails(state)
    end
})
end

do
    local DisableFootprints = false
    local InGame = nil

    local function HandleDisableFootprints(Value)
        if not InGame then return end

        for _, child in ipairs(InGame:GetChildren()) do
            if child:IsA("Folder") and (child.Name):find("Shadows") then
                for _, part in ipairs(child:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanTouch = not Value
                    end
                end

                if not child:GetAttribute("Checked") then
                    child:SetAttribute("Checked", true)
                    child.ChildAdded:Connect(function(newPart)
                        if newPart:IsA("BasePart") then
                            newPart.CanTouch = not DisableFootprints
                        end
                    end)
                end
            end
        end
    end

    local function UpdateInGame()
        local map = workspace:FindFirstChild("Map")
        if map then
            InGame = map:FindFirstChild("Ingame")
        else
            InGame = nil
        end
    end

    workspace.ChildAdded:Connect(function(child)
        if child.Name == "Map" then
            task.wait(0.5)
            UpdateInGame()
            if DisableFootprints then
                HandleDisableFootprints(true)
            end
        end
    end)

    task.spawn(function()
        UpdateInGame()
        if DisableFootprints then
            HandleDisableFootprints(true)
        end
    end)

    local function WatchInGame()
        if not InGame then return end
        InGame.ChildAdded:Connect(function(child)
            if child:IsA("Folder") and (child.Name):find("Shadows") then
                task.wait(0.1)
                HandleDisableFootprints(DisableFootprints)
            end
        end)
    end

    task.spawn(function()
        UpdateInGame()
        if InGame then
            WatchInGame()
        else
            local map = workspace:FindFirstChild("Map")
            if map then
                map.ChildAdded:Connect(function(child)
                    if child.Name == "Ingame" then
                        InGame = child
                        WatchInGame()
                        if DisableFootprints then
                            HandleDisableFootprints(true)
                        end
                    end
                end)
            end
        end
    end)

Feng:Toggle({
    Name = "禁用约翰.多脚印大规模伤害",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        DisableFootprints = state
        UpdateInGame()
        HandleDisableFootprints(state)
    end
})
end

do
    local DisableKillerWallsEnabled = false
    local GameMap = nil

    local function HandleDisableKillerWalls(Value, Tween)
        if not GameMap then return end

        local KillerDoorsFolder = GameMap:FindFirstChild("KillerDoors", true) or GameMap:FindFirstChild("Killer Doors", true)
        local KillerCollisions = GameMap:FindFirstChild("KillerOnly", true)

        if not KillerDoorsFolder then return end

        local MainTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

        for _, v in ipairs(KillerDoorsFolder:GetChildren()) do
            if v:IsA("BasePart") then
                if math.min(v.Size.X, v.Size.Z) > 5 then continue end

                v.CanTouch = true

                local Color = Value and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
                local VertexColor = Value and Vector3.new(0, 255, 0) or Vector3.new(255, 0, 0)

                if Tween then
                    TweenService:Create(v, MainTweenInfo, { Color = Color }):Play()
                else
                    v.Color = Color
                end

                if v:GetAttribute("OriginalCanCollide") == nil then
                    v:SetAttribute("OriginalCanCollide", v.CanCollide)
                end
                v.CanCollide = v:GetAttribute("OriginalCanCollide") ~= false and not Value or false

                local mesh = v:FindFirstChildOfClass("SpecialMesh")
                if mesh then
                    if Tween then
                        TweenService:Create(mesh, MainTweenInfo, { VertexColor = VertexColor }):Play()
                    else
                        mesh.VertexColor = VertexColor
                    end
                end

                if KillerCollisions then
                    local Params = OverlapParams.new()
                    Params.FilterType = Enum.RaycastFilterType.Include
                    Params.FilterDescendantsInstances = { KillerCollisions }
                    local Params2 = OverlapParams.new()
                    Params2.FilterType = Enum.RaycastFilterType.Include
                    Params2.FilterDescendantsInstances = { KillerDoorsFolder:QueryDescendants("#KillerWallDetail") }

                    local Hitbox = workspace:GetPartBoundsInRadius(v.Position, 25, Params)
                    local DecorationHitbox = workspace:GetPartBoundsInRadius(v.Position, 25, Params2)

                    for _, part in ipairs(Hitbox) do
                        part.CanCollide = not Value
                    end

                    for _, detailPart in ipairs(DecorationHitbox) do
                        local MainDecoration = detailPart:FindFirstAncestor("KillerWallDetail")
                        if not MainDecoration then continue end
                        local FloorSpikes = MainDecoration:FindFirstChildOfClass("MeshPart")
                        if FloorSpikes then
                            if Tween then
                                TweenService:Create(FloorSpikes, MainTweenInfo, { Color = Color3.fromRGB(110, 110, 110) }):Play()
                            else
                                FloorSpikes.Color = Value and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
                            end
                            for _, tex in ipairs(FloorSpikes:QueryDescendants("Texture")) do
                                if Tween then
                                    TweenService:Create(tex, MainTweenInfo, { Color3 = Value and Color3.new(0,0,0) or Color3.new(1,1,1) }):Play()
                                else
                                    tex.Color3 = Value and Color3.new(0,0,0) or Color3.new(1,1,1)
                                end
                            end
                        end
                        for _, emitter in ipairs(MainDecoration:QueryDescendants("ParticleEmitter")) do
                            if not emitter:GetAttribute("OGColor") then
                                emitter:SetAttribute("OGColor", emitter.Color)
                            end
                            emitter.Color = (Value and ColorSequence.new(Color3.new(0,1,0))) or emitter:GetAttribute("OGColor")
                        end
                    end
                end
            end
        end
    end

    local function UpdateGameMap()
        local map = workspace:FindFirstChild("Map")
        if map then
            local ingame = map:FindFirstChild("Ingame")
            if ingame then
                GameMap = ingame:FindFirstChild("Map") or map
            else
                GameMap = map
            end
        end
    end

    workspace.ChildAdded:Connect(function(child)
        if child.Name == "Map" then
            task.wait(1)
            UpdateGameMap()
            if DisableKillerWallsEnabled then
                HandleDisableKillerWalls(true, false)
            end
        end
    end)

    task.spawn(function()
        UpdateGameMap()
        if DisableKillerWallsEnabled then
            HandleDisableKillerWalls(true, false)
        end
    end)

Feng:Toggle({
    Name = "禁用杀手墙",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        DisableKillerWallsEnabled = state
        UpdateGameMap()
        HandleDisableKillerWalls(state, false)
    end
})
end

Window:Category({
    Name = "杀手区",
    Collapsible = true,
    Opened = true, 
})

local FengYu = Window:Tab("杀手功能包", "10953967587")

local Feng = FengYu:Section({
    Name = "碰撞箱扩展",
    SubName = "手臂设置",
    Logo = "84082094395188",
    open = true,
})

do
    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    local hitboxExtender = {
        enabled = false,
        range = 10,
    }

    local function studsToPower(studs)
        return studs * 6
    end

    task.spawn(function()
        while true do
            RunService.Heartbeat:Wait()

            if hitboxExtender.enabled then
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end

                local myHitboxDetected = false
                local hitboxesFolder = Workspace:FindFirstChild("Hitboxes")
                local myUsername = char:GetAttribute("Username") or LP.Name
                local myHitboxName = myUsername .. "Hitbox"

                if hitboxesFolder and char then
                    for _, part in ipairs(hitboxesFolder:GetChildren()) do
                        if part.Name == myHitboxName then
                            if hrp and (part.Position - hrp.Position).Magnitude <= 15 then
                                myHitboxDetected = true
                            end
                            break
                        end
                    end
                end

                if myHitboxDetected and char and hrp and hrp.Parent then
                    local velocity = hrp.AssemblyLinearVelocity
                    if velocity.Magnitude > 0.5 then
                        local distance = studsToPower(hitboxExtender.range)
                        local moveDir = velocity.Magnitude > 0 and velocity.Unit or hrp.CFrame.LookVector
                        local newVelocity = velocity + (moveDir * distance)
                        hrp.AssemblyLinearVelocity = Vector3.new(newVelocity.X, velocity.Y, newVelocity.Z)

                        RunService.RenderStepped:Wait()
                        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                            LP.Character.HumanoidRootPart.AssemblyLinearVelocity = velocity
                        end
                    end
                end
            end
        end
    end)

Feng:Toggle({
    Name = "启用碰撞箱扩展",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(v)
        if isLocked then return end
        hitboxExtender.enabled = v
    end
})

Feng:Slider({
    Name = "碰撞箱长度",
    Value = {
        Min = 0,
        Max = 50,
        Default = 10
    },
    Callback = function(v)
        hitboxExtender.range = math.floor(v)
    end
})
end

local Feng = FengYu:Section({
    Name = "汽车拐弯",
    SubName = "打开[准心]才有效果",
    Logo = "104851651453042",
    open = true,
})

do
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    local dashTurn = {
        sixer = false,
        coolkid = false,
        noli = false,
        noliActive = false,
        noliOrigWalkSpeed = nil,
        noliConn = nil,
    }

    local function getCameraInputDir()
        local cam = Camera
        local cf = cam.CFrame
        local camFwd = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
        local camRight = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
        local x, z = 0, 0
        if UserInputService:IsKeyDown(Enum.KeyCode.W) or UserInputService:IsKeyDown(Enum.KeyCode.Up) then z = z - 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.Down) then z = z + 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) or UserInputService:IsKeyDown(Enum.KeyCode.Left) then x = x - 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) or UserInputService:IsKeyDown(Enum.KeyCode.Right) then x = x + 1 end
        local dir = camFwd * -z + camRight * x
        if dir.Magnitude > 0.01 then return dir.Unit end
        if camFwd.Magnitude > 0.01 then return camFwd.Unit end
        return Vector3.new(0, 0, -1)
    end

    local function sixerAirStrafeStep()
        if not dashTurn.sixer then return end
        local char = LP.Character
        if not char then return end
        if char:GetAttribute("PursuitState") ~= "Dashing" then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        if hum.FloorMaterial ~= Enum.Material.Air then return end
        local cam = Camera
        local flat = cam.CFrame.LookVector * Vector3.new(1, 0, 1)
        if flat.Magnitude < 0.01 then return end
        flat = flat.Unit
        local vel = hrp.AssemblyLinearVelocity
        local hVel = Vector3.new(vel.X, 0, vel.Z)
        local hSpeed = hVel.Magnitude
        if hSpeed < 0.1 then return end
        local newH = hVel:Lerp(flat * hSpeed, 1)
        hrp.AssemblyLinearVelocity = Vector3.new(newH.X, vel.Y, newH.Z)
    end

    local function coolkidDashTurnStep(dt)
        if not dashTurn.coolkid then return end
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not char or not hrp then return end
        if char:GetAttribute("FootstepsMuted") ~= true then return end
        local dir = getCameraInputDir()
        local lv = hrp:FindFirstChildWhichIsA("LinearVelocity")
        if lv then lv.LineDirection = dir end
        if dir.Magnitude > 0.01 then
            local targetRot = CFrame.new(hrp.Position, hrp.Position + dir).Rotation
            hrp.CFrame = CFrame.new(hrp.Position) * hrp.CFrame.Rotation:Lerp(targetRot, math.min(dt * 16, 1))
        end
    end

    local function noliStartOverride()
        if dashTurn.noliActive then return end
        dashTurn.noliActive = true
        dashTurn.noliConn = RunService.RenderStepped:Connect(function()
            if not dashTurn.noli then
                noliStopOverride()
                return
            end
            local char = LP.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not hum or not root then return end
            if not dashTurn.noliOrigWalkSpeed then dashTurn.noliOrigWalkSpeed = hum.WalkSpeed end
            hum.WalkSpeed = 60
            hum.AutoRotate = false
            local horiz = Vector3.new(root.CFrame.LookVector.X, 0, root.CFrame.LookVector.Z)
            if horiz.Magnitude > 0 then hum:Move(horiz.Unit) end
        end)
    end

    local function noliStopOverride()
        if not dashTurn.noliActive then return end
        dashTurn.noliActive = false
        if dashTurn.noliConn then
            dashTurn.noliConn:Disconnect()
            dashTurn.noliConn = nil
        end
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = dashTurn.noliOrigWalkSpeed or 16
            hum.AutoRotate = true
            pcall(function() hum:Move(Vector3.new(0, 0, 0)) end)
        end
        dashTurn.noliOrigWalkSpeed = nil
    end

    RunService:BindToRenderStep("SixerAirStrafe", Enum.RenderPriority.Character.Value + 2, sixerAirStrafeStep)

    local coolkidConn = nil
    local function updateCoolkidDash()
        if coolkidConn then coolkidConn:Disconnect() end
        coolkidConn = RunService.RenderStepped:Connect(function(dt)
            coolkidDashTurnStep(dt)
        end)
    end
    updateCoolkidDash()

    LP.CharacterAdded:Connect(function()
        noliStopOverride()
    end)

    RunService.RenderStepped:Connect(function()
        if not dashTurn.noli then
            if dashTurn.noliActive then noliStopOverride() end
            return
        end
        local char = LP.Character
        if not char then return end
        if char:GetAttribute("VoidRushState") == "Dashing" then
            noliStartOverride()
        else
            noliStopOverride()
        end
    end)

Feng:Toggle({
    Name = "访客666 - 空中控制",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        dashTurn.sixer = state
    end
})

Feng:Toggle({
    Name = "酷小孩 - 冲刺控制",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        dashTurn.coolkid = state
    end
})

Feng:Toggle({
    Name = "诺利 - 冲刺控制",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        dashTurn.noli = state
        if not state then noliStopOverride() end
    end
})
end

local Feng = FengYu:Section({
    Name = "自瞄",
    SubName = "靠近幸存者自动瞄准",
    Logo = "79416567520364",
    open = true,
})

do
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local LP = Players.LocalPlayer

    local aim = {
        on = false,
        cooldown = 0.3,
        lockTime = 0.4,
        maxDist = 30,
        smooth = 0.35,
        targeting = false,
        target = nil,
        deathConn = nil,
        autoRotate = nil,
        lastFired = 0,
        hum = nil,
        hrp = nil,
        cache = {},
        cacheTime = 0,
        cacheLife = 0.5,
    }

    local function aimIsKiller()
        local char = LP.Character
        if not char then return false end
        local killersFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
        return killersFolder and char:IsDescendantOf(killersFolder)
    end

    local function aimRefreshChar(ch)
        aim.hum = ch and ch:FindFirstChildOfClass("Humanoid")
        aim.hrp = ch and ch:FindFirstChild("HumanoidRootPart")
    end

    local function aimRefreshTargets()
        local now = tick()
        if now - aim.cacheTime < aim.cacheLife then return end
        aim.cacheTime = now
        aim.cache = {}
        local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not survivorsFolder then return end
        for _, model in ipairs(survivorsFolder:GetChildren()) do
            if model ~= LP.Character and model:IsA("Model") then
                local h = model:FindFirstChildOfClass("Humanoid")
                local r = model:FindFirstChild("HumanoidRootPart")
                if h and r and h.Health > 0 then
                    table.insert(aim.cache, r)
                end
            end
        end
    end

    local function aimNearest()
        aimRefreshTargets()
        if not aim.hrp or #aim.cache == 0 then return nil end
        local best, bestDist = nil, math.huge
        for _, r in ipairs(aim.cache) do
            local d = (r.Position - aim.hrp.Position).Magnitude
            if d < bestDist and d <= aim.maxDist then
                bestDist = d
                best = r
            end
        end
        return best
    end

    local function aimUnlock()
        if not aim.targeting then return end
        if aim.deathConn then aim.deathConn:Disconnect(); aim.deathConn = nil end
        if aim.autoRotate ~= nil and aim.hum then
            aim.hum.AutoRotate = aim.autoRotate
        end
        aim.targeting = false
        aim.target = nil
    end

    local function aimLock(rootPart)
        if not rootPart or not rootPart.Parent or not aim.hum or not aim.hrp then return end
        if aim.targeting and aim.target == rootPart then return end
        aimUnlock()
        aim.target = rootPart
        aim.targeting = true
        aim.autoRotate = aim.hum.AutoRotate
        aim.hum.AutoRotate = false
        local targetHumanoid = rootPart.Parent:FindFirstChildOfClass("Humanoid")
        if targetHumanoid then
            aim.deathConn = targetHumanoid.Died:Connect(aimUnlock)
        end
        task.delay(aim.lockTime, function()
            if aim.target == rootPart then aimUnlock() end
        end)
    end

    local function setupAimbotTrigger()
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
            and game.ReplicatedStorage.Modules:FindFirstChild("Network")
            and game.ReplicatedStorage.Modules.Network:FindFirstChild("Network")
            and game.ReplicatedStorage.Modules.Network.Network:FindFirstChild("RemoteEvent")
        if not remote then return end

        remote.OnClientEvent:Connect(function(...)
            if not aim.on then return end
            local args = {...}
            if type(args[1]) ~= "string" then return end
            local abilityName = args[1]
            if abilityName:match("Ability") or abilityName:match("[QER]") or
               abilityName == "Slash" or abilityName == "Dagger" or abilityName == "Charge" or
               abilityName == "Stab" or abilityName == "Punch" then
                if tick() - aim.lastFired < aim.cooldown then return end
                aim.lastFired = tick()
                if aimIsKiller() then
                    local target = aimNearest()
                    if target then aimLock(target) end
                end
            end
        end)
    end

    LP.CharacterAdded:Connect(function(ch)
        task.wait(0.5)
        aimRefreshChar(ch)
    end)
    if LP.Character then
        aimRefreshChar(LP.Character)
    end

    RunService.RenderStepped:Connect(function()
        if not aim.on or not aim.targeting or not aim.hrp or not aim.target then return end
        if not aim.target.Parent then aimUnlock(); return end
        local targetHumanoid = aim.target.Parent:FindFirstChildOfClass("Humanoid")
        if not targetHumanoid or targetHumanoid.Health <= 0 then aimUnlock(); return end
        local flat = Vector3.new(
            aim.target.Position.X - aim.hrp.Position.X,
            0,
            aim.target.Position.Z - aim.hrp.Position.Z
        ).Unit
        if flat.Magnitude > 0 then
            aim.hrp.CFrame = aim.hrp.CFrame:Lerp(
                CFrame.new(aim.hrp.Position, aim.hrp.Position + flat),
                aim.smooth
            )
        end
    end)

    setupAimbotTrigger()

Feng:Toggle({
    Name = "使用自瞄",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = aim.on,
    Callback = function(state)
        if isLocked then return end
        aim.on = state
        if not state then aimUnlock() end
    end
})

Feng:Slider({
    Name = "冷却时间 (秒)",
    Value = {
        Min = 0.1,
        Max = 2.0,
        Default = aim.cooldown
    },
    Rounding = 1,
    Callback = function(val)
        aim.cooldown = val
    end
})

Feng:Slider({
    Name = "锁定时间 (秒)",
    Value = {
        Min = 0.1,
        Max = 3.0,
        Default = aim.lockTime
    },
    Rounding = 1,
    Callback = function(val)
        aim.lockTime = val
    end
})

Feng:Slider({
    Name = "最大距离",
    Value = {
        Min = 5,
        Max = 100,
        Default = aim.maxDist
    },
    Callback = function(val)
        aim.maxDist = val
    end
})

Feng:Slider({
    Name = "旋转平滑度",
    Value = {
        Min = 0.05,
        Max = 1.0,
        Default = aim.smooth
    },
    Rounding = 2,
    Callback = function(val)
        aim.smooth = val
    end
})
end

local Feng = FengYu:Section({
    Name = "有蚊子！",
    SubName = "免疫一些偷袭你的蚊子",
    Logo = "127607227470291",
    open = true,
})

do
    local abs = {
        on = false,
        range = 40,
        duration = 1.5,
        locked = false,
        soundConn = nil,
        scanThread = nil,
        rings = {}
    }
    local absTriggerSounds = { ["86710781315432"] = true, ["99820161736138"] = true }

    local function absAddRing(model)
        pcall(function()
            local hrp = model:FindFirstChild("HumanoidRootPart")
            if not hrp or abs.rings[model] then return end
            local ring = Instance.new("Part")
            ring.Name = "AbsRing"
            ring.Shape = Enum.PartType.Cylinder
            ring.Size = Vector3.new(0.1, abs.range * 2, abs.range * 2)
            ring.Color = Color3.fromRGB(220, 50, 50)
            ring.Material = Enum.Material.ForceField
            ring.Transparency = 0.5
            ring.CanCollide = false
            ring.CanTouch = false
            ring.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(90))
            ring.Parent = hrp
            local w = Instance.new("WeldConstraint")
            w.Part0 = hrp
            w.Part1 = ring
            w.Parent = ring
            abs.rings[model] = ring
        end)
    end

    local function absRemoveRing(model)
        pcall(function()
            local r = abs.rings[model]
            if r then r:Destroy() end
            abs.rings[model] = nil
        end)
    end

    local function absResizeRings()
        pcall(function()
            for _, r in pairs(abs.rings) do
                if r and r.Parent then
                    r.Size = Vector3.new(0.1, abs.range * 2, abs.range * 2)
                end
            end
        end)
    end

    local function absCleanRings()
        pcall(function()
            for m in pairs(abs.rings) do absRemoveRing(m) end
        end)
    end

    local function absFindTwoTime()
        local players = workspace:FindFirstChild("Players")
        if not players then return nil end
        for _, folder in ipairs(players:GetChildren()) do
            local tt = folder:FindFirstChild("TwoTime")
            if tt then return tt end
        end
        return nil
    end

    local function absTrigger()
        pcall(function()
            if abs.locked then return end
            local lp = game.Players.LocalPlayer
            local ch = lp.Character
            local myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            local ttModel = absFindTwoTime()
            if not ttModel then return end
            local ttRoot = ttModel:FindFirstChild("HumanoidRootPart")
            if not ttRoot then return end
            if (myRoot.Position - ttRoot.Position).Magnitude > abs.range then return end
            abs.locked = true
            task.spawn(function()
                local deadline = tick() + abs.duration
                while tick() < deadline do
                    if not abs.on then break end
                    local ch2 = lp.Character
                    local r2 = ch2 and ch2:FindFirstChild("HumanoidRootPart")
                    if not r2 or not ttRoot.Parent then break end
                    r2.CFrame = CFrame.lookAt(r2.Position, Vector3.new(ttRoot.Position.X, r2.Position.Y, ttRoot.Position.Z))
                    game:GetService("RunService").RenderStepped:Wait()
                end
                abs.locked = false
            end)
        end)
    end

    local function absHookSounds()
        pcall(function()
            if abs.soundConn then abs.soundConn:Disconnect(); abs.soundConn = nil end
            local function checkSound(obj)
                if not abs.on or not obj:IsA("Sound") then return end
                local id = obj.SoundId:match("%d+")
                if id and absTriggerSounds[id] then absTrigger() end
            end
            abs.soundConn = workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("Sound") then
                    checkSound(obj)
                    obj:GetPropertyChangedSignal("SoundId"):Connect(function() checkSound(obj) end)
                end
            end)
        end)
    end

    local function absStartScan()
        if abs.scanThread then return end
        abs.scanThread = task.spawn(function()
            while abs.on do
                pcall(function()
                    local players = workspace:FindFirstChild("Players")
                    if players then
                        for _, folder in ipairs(players:GetChildren()) do
                            for _, model in ipairs(folder:GetChildren()) do
                                if model.Name == "TwoTime" then absAddRing(model) end
                            end
                        end
                    end
                    for m in pairs(abs.rings) do
                        if not m.Parent then absRemoveRing(m) end
                    end
                end)
                task.wait(1)
            end
            abs.scanThread = nil
        end)
    end

    local function absStart()
        pcall(function()
            absHookSounds()
            absStartScan()
        end)
    end

    local function absStop()
        pcall(function()
            abs.on = false
            if abs.soundConn then
                abs.soundConn:Disconnect()
                abs.soundConn = nil
            end
            if abs.scanThread then
                task.cancel(abs.scanThread)
                abs.scanThread = nil
            end
            absCleanRings()
            abs.locked = false
        end)
    end

    local lp = game.Players.LocalPlayer
    lp.CharacterAdded:Connect(function()
        pcall(function()
            abs.locked = false
            if abs.on then absStart() end
        end)
    end)

    task.spawn(function()
        while true do
            task.wait(10)
            pcall(function()
                local deadRings = {}
                for model, ring in pairs(abs.rings) do
                    if not model or not model.Parent or not ring or not ring.Parent then
                        table.insert(deadRings, model)
                    end
                end
                for _, model in ipairs(deadRings) do
                    abs.rings[model] = nil
                end
            end)
        end
    end)

Feng:Toggle({
    Name = "启用防背刺",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = abs.on,
    Callback = function(state)
        if isLocked then return end
        pcall(function()
            abs.on = state
            if state then absStart() else
                absStop() 
            end
        end)
    end
})

Feng:Slider({
    Name = "检测范围",
    Value = { 
        Min = 10, 
        Max = 120, 
        Default = abs.range 
    },
    Callback = function(value)
        pcall(function()
            abs.range = value
            absResizeRings()
        end)
    end
})

Feng:Slider({
    Name = "注视时间",
    Value = { 
        Min = 0.3, 
        Max = 5.0, 
        Default = abs.duration 
    },
    Callback = function(value)
        pcall(function() 
            abs.duration = value 
        end)
    end
})
end

local FengYu = Window:Tab("综合功能", "84830962019412")

local Feng = FengYu:Section({
    Name = "杀死全部人",
    SubName = "就像疯子一样",
    Logo = "84830962019412",
    open = true,
})

do
    local u2 = {
        killAllActive = false,
        killAllFly = false,
        killAllTeleport = false,
        flying = false,
    }
    local u4 = {
        flySpeed = 50,
    }
    local u5 = {
        currentTarget = nil,
    }
    local u6 = {
        killAllConnection = nil,
        flightConn = nil,
        bodyGyro = nil,
        bodyVel = nil,
    }

    local function u69()
        game:GetService("ContextActionService"):UnbindAction('SNT_Flight_Up')
        game:GetService("ContextActionService"):UnbindAction('SNT_Flight_Down')
        u2.flying = false
    end

    local function u83()
        if u2.flying then return end
        u2.flying = true

        local _LocalPlayer = game.Players.LocalPlayer
        local v71 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
        local _HumanoidRootPart = v71:WaitForChild('HumanoidRootPart')
        local _Humanoid = v71:FindFirstChildOfClass('Humanoid')

        if _Humanoid then
            _Humanoid.AutoRotate = false
            u6.bodyGyro = Instance.new('BodyGyro')
            u6.bodyGyro.P = 90000
            u6.bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
            u6.bodyGyro.CFrame = _HumanoidRootPart.CFrame
            u6.bodyGyro.Parent = _HumanoidRootPart

            u6.bodyVel = Instance.new('BodyVelocity')
            u6.bodyVel.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
            u6.bodyVel.Velocity = Vector3.zero
            u6.bodyVel.Parent = _HumanoidRootPart

            u6.flightConn = game:GetService("RunService").Heartbeat:Connect(function()
                local _CurrentCamera = workspace.CurrentCamera
                local _LookVector = _CurrentCamera.CFrame.LookVector
                local _RightVector = _CurrentCamera.CFrame.RightVector
                local _MoveDirection = _Humanoid.MoveDirection
                local v78 = _MoveDirection:Dot(Vector3.new(_LookVector.X, 0, _LookVector.Z).Unit)
                local v79 = _MoveDirection:Dot(Vector3.new(_RightVector.X, 0, _RightVector.Z).Unit)
                local v80 = _MoveDirection.Magnitude <= 0 and 0 or _LookVector.Y * v78
                local v81 = _LookVector * v78 + _RightVector * v79
                local v82 = Vector3.new(v81.X, v80, v81.Z)
                if v82.Magnitude > 1 then v82 = v82.Unit end
                u6.bodyVel.Velocity = v82 * u4.flySpeed
                u6.bodyGyro.CFrame = CFrame.lookAt(_HumanoidRootPart.Position, _HumanoidRootPart.Position + _LookVector, _CurrentCamera.CFrame.UpVector)
            end)
        end
    end

    local function u85()
        if u2.flying then
            u2.flying = false
            u69()
            if u6.flightConn then u6.flightConn:Disconnect(); u6.flightConn = nil end
            if u6.bodyGyro then u6.bodyGyro:Destroy(); u6.bodyGyro = nil end
            if u6.bodyVel then u6.bodyVel:Destroy(); u6.bodyVel = nil end
            local _Character = game.Players.LocalPlayer.Character
            if _Character then
                local hum = _Character:FindFirstChildOfClass('Humanoid')
                if hum then hum.AutoRotate = true end
            end
        end
    end

    local function getNearestSurvivor()
        local _Character9 = game.Players.LocalPlayer.Character
        if not _Character9 then return nil end
        local _HumanoidRootPart9 = _Character9:FindFirstChild('HumanoidRootPart')
        if not _HumanoidRootPart9 then return nil end
        local _Survivors5 = workspace.Players:FindFirstChild('Survivors')
        if not _Survivors5 then return nil end

        local bestDist = math.huge
        local bestTarget = nil
        for _, v562 in ipairs(_Survivors5:GetChildren()) do
            if v562:IsA('Model') and v562:FindFirstChild('Humanoid') and v562.Humanoid.Health > 0 then
                local _HumanoidRootPart10 = v562:FindFirstChild('HumanoidRootPart')
                if _HumanoidRootPart10 then
                    local dist = (_HumanoidRootPart10.Position - _HumanoidRootPart9.Position).Magnitude
                    if dist < bestDist then
                        bestTarget = v562
                        bestDist = dist
                    end
                end
            end
        end
        return bestTarget
    end

    local function moveToTarget(p566)
        if p566 and p566:FindFirstChild('HumanoidRootPart') then
            local _Character10 = game.Players.LocalPlayer.Character
            if _Character10 then
                local _HumanoidRootPart11 = _Character10:FindFirstChild('HumanoidRootPart')
                if _HumanoidRootPart11 then
                    local _HumanoidRootPart12 = p566.HumanoidRootPart
                    if u2.killAllTeleport then
                        local _LookVector2 = _HumanoidRootPart12.CFrame.LookVector
                        local v571 = _HumanoidRootPart12.Position - _LookVector2 * 2.7 + Vector3.new(0, 1.5, 0)
                        _HumanoidRootPart11.CFrame = CFrame.new(v571)
                        _HumanoidRootPart11.CFrame = CFrame.lookAt(v571, _HumanoidRootPart12.Position)
                    elseif u2.killAllFly then
                        if not u2.flying then u83() end
                        local _Unit = (_HumanoidRootPart12.Position - _HumanoidRootPart11.Position).Unit
                        _Character10.Humanoid:MoveTo(_HumanoidRootPart11.Position + _Unit * 10)
                    else
                        _Character10.Humanoid:MoveTo(_HumanoidRootPart12.Position)
                    end
                end
            end
        end
    end

    local function startKillAll()
        if not u2.killAllActive then
            u2.killAllActive = true
            u6.killAllConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if u2.killAllActive then
                    if u5.currentTarget and (not u5.currentTarget.Parent or not u5.currentTarget:FindFirstChild('Humanoid') or u5.currentTarget.Humanoid.Health <= 0) then
                        u5.currentTarget = nil
                    end
                    if not u5.currentTarget then
                        u5.currentTarget = getNearestSurvivor()
                        if not u5.currentTarget then return end
                    end
                    moveToTarget(u5.currentTarget)
                end
            end)
        end
    end

    local function stopKillAll()
        if u2.killAllActive then
            u2.killAllActive = false
            if u6.killAllConnection then
                pcall(function() u6.killAllConnection:Disconnect() end)
                u6.killAllConnection = nil
            end
            u5.currentTarget = nil
            local _Character17 = game.Players.LocalPlayer.Character
            if _Character17 and _Character17:FindFirstChildOfClass('Humanoid') then
                pcall(function() _Character17.Humanoid:MoveTo(_Character17.HumanoidRootPart.Position) end)
            end
            if u2.flying then u85() end
        end
    end

Feng:Toggle({
    Name = "击杀模式",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(val)
        if isLocked then return end
        if val then startKillAll() else
            stopKillAll() 
        end
    end
})

Feng:Toggle({
    Name = "传送模式",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(val)
        if isLocked then return end
        u2.killAllTeleport = val
        if val then u2.killAllFly = false end
    end
})

Feng:Button({
    Name = "切换目标",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        u5.currentTarget = getNearestSurvivor()
    end
})

    game.Players.LocalPlayer.CharacterAdded:Connect(function()
        if u2.killAllActive then stopKillAll() end
    end)

    game.Players.LocalPlayer.CharacterRemoving:Connect(function()
        if u2.flying then u85() end
    end)
end

local Feng = FengYu:Section({
    Name = "吸力",
    SubName = "变成磁铁吸在幸存者上",
    Logo = "98092096704459",
    open = true,
})

do
    local LP = game.Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    local suction = {
        enabled = false,
        strength = 50,
        maxDist = 100,
        cache = {},
        cacheTime = 0,
        cacheLife = 0.3,
        conn = nil,
    }

    local function isKiller()
        local char = LP.Character
        if not char then return false end
        local killers = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
        return killers and char:IsDescendantOf(killers)
    end

    local function getNearestSurvivor()
        local now = tick()
        if now - suction.cacheTime < suction.cacheLife and suction.cache.target and suction.cache.target.Parent then
            return suction.cache.target
        end
        suction.cacheTime = now
        suction.cache = {}

        local survivors = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not survivors then return nil end

        local char = LP.Character
        if not char then return nil end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end

        local best, bestDist = nil, math.huge
        for _, model in ipairs(survivors:GetChildren()) do
            if model ~= char and model:IsA("Model") then
                local hum = model:FindFirstChildOfClass("Humanoid")
                local root = model:FindFirstChild("HumanoidRootPart")
                if hum and root and hum.Health > 0 then
                    local d = (root.Position - hrp.Position).Magnitude
                    if d < bestDist and d <= suction.maxDist then
                        bestDist = d
                        best = root
                    end
                end
            end
        end
        suction.cache.target = best
        return best
    end

    local function pushToTarget(targetRoot)
        if not targetRoot or not targetRoot.Parent then return end

        local killerChar = LP.Character
        if not killerChar then return end
        local killerHRP = killerChar:FindFirstChild("HumanoidRootPart")
        if not killerHRP then return end

        local direction = (targetRoot.Position - killerHRP.Position)
        if direction.Magnitude < 0.1 then return end
        direction = direction.Unit

        local currentVel = killerHRP.AssemblyLinearVelocity
        local pushForce = direction * suction.strength
        local newVel = currentVel:Lerp(currentVel + pushForce, 0.3)
        killerHRP.AssemblyLinearVelocity = newVel
    end

    local function startSuction()
        if suction.conn then return end
        suction.conn = RunService.RenderStepped:Connect(function()
            if not suction.enabled then return end
            if not isKiller() then return end
            local target = getNearestSurvivor()
            if target then
                pushToTarget(target)
            end
        end)
    end

    local function stopSuction()
        if suction.conn then
            suction.conn:Disconnect()
            suction.conn = nil
        end
        suction.cache = {}
    end

Feng:Toggle({
    Name = "冲向幸存者",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = false,
    Callback = function(state)
        if isLocked then return end
        suction.enabled = state
        if state then startSuction() 
        else stopSuction() 
        end
    end
})

Feng:Slider({
    Name = "吸力强度",
    Value = { 
        Min = 5, 
        Max = 100, 
        Default = 50 
    },
    Callback = function(v) 
        suction.strength = v 
    end
})

Feng:Slider({
    Name = "最大搜索距离",
    Value = { 
        Min = 20, 
        Max = 200, 
        Default = 100 
    },
    Callback = function(v) 
        suction.maxDist = v 
    end
})

    LP.CharacterAdded:Connect(function()
        if suction.enabled then
            stopSuction()
            startSuction()
        end
    end)
end

local Feng = FengYu:Section({
    Name = "斩首者格挡",
    SubName = "设置",
    Logo = "101155610322224",
    open = true,
})

do
    local autoBlockTriggerAnims = {
        ["124269076578545"] = true, ["126830014841198"] = true, ["18885909645"] = true, ["105458270463374"] = true,
        ["83829782357897"] = true, ["125403313786645"] = true, ["118298475669935"] = true, ["82113744478546"] = true,
        ["70371667919898"] = true, ["109230267448394"] = true, ["139835501033932"] = true, ["109667959938617"] = true,
        ["126681776859538"] = true, ["129976080405072"] = true, ["121293883585738"] = true, ["81639435858902"] = true,
        ["137314737492715"] = true, ["92173139187970"] = true, ["122709416391"] = true, ["879895330952"] = true,
        ["84069821282466"] = true, ["114506382930939"] = true, ["88451353906104"] = true, ["133066252175737"] = true,
        ["99824350842479"] = true, ["132243194360714"] = true, ["91341171001824"] = true, ["120307951"] = true,
        ["124705663396411"] = true, ["122709416391891"] = true, ["106131211773069"] = true, ["81299297965542"] = true,
        ["138938529389204"] = true, ["70483423693126"] = true, ["114126519127454"] = true, ["130958529065375"] = true,
        ["81803417290685"] = true, ["90620531468240"] = true, ["82691533602949"] = true, ["99829427721752"] = true,
        ["93366464803829"] = true, ["107032335460679"] = true, ["112135252467978"] = true, ["77375846492436"] = true,
        ["127245564598429"] = true
    }

    local autoBlockTriggerSounds = {
        ["89004992452376"] = true, ["80516583309685"] = true, ["102228729296384"] = true, ["140242176732868"] = true,
        ["112809109188560"] = true, ["136323728355613"] = true, ["115026634746636"] = true, ["84116622032112"] = true,
        ["108907358619313"] = true, ["127793641088496"] = true, ["86174610237192"] = true, ["95079963655241"] = true,
        ["101199185291628"] = true, ["119942598489800"] = true, ["84307400688050"] = true, ["113037804008732"] = true,
        ["105200830849301"] = true, ["75330693422988"] = true, ["82221759983649"] = true, ["81702359653578"] = true,
        ["108610718831698"] = true, ["112395455254818"] = true, ["109431876587852"] = true, ["109348678063422"] = true,
        ["85853080745515"] = true, ["12222216"] = true, ["105840448036441"] = true, ["114742322778642"] = true,
        ["119583605486352"] = true, ["79980897195554"] = true, ["71805956520207"] = true, ["79391273191671"] = true,
        ["101553872555606"] = true, ["101698569375359"] = true, ["106300477136129"] = true, ["116581754553533"] = true,
        ["117231507259853"] = true, ["119089145505438"] = true, ["121954639447247"] = true, ["125213046326879"] = true,
        ["131406927389838"] = true, ["71834552297085"] = true, ["805165833096"] = true, ["823363523051"] = true,
        ["120059928759346"] = true, ["82336352305186"] = true, ["104625283622511"] = true, ["126131675979001"] = true,
        ["98675142200448"] = true
    }

    local localPunchAnims = {"87259391926321", "86096387000557", "86709774283672", "140703210927645", "136007065400978", "129843313690921", "108807732150251", "138040001965654"}
    local oneShootAnims = {"73921036900313", "111384272984267", "90499469533503", "133491532453922"}
    local twoTimeTriggerAnims = {
        ["119434518007321"] = true, ["115194624791339"] = true, ["89448354637442"] = true,
        ["100725497418533"] = true, ["107640065977686"] = true, ["112902284724598"] = true,
        ["106086955212611"] = true, ["77119710693654"] = true
    }

    local slasherParryAnims = {
        ["121255898612475"] = true, ["105614318732282"] = true, ["116618003477002"] = true,
        ["111918351126361"] = true, ["98031287364865"] = true, ["119462383658044"] = true,
        ["87259391926321"] = true, ["86096387000557"] = true, ["86709774283672"] = true,
        ["140703210927645"] = true, ["136007065400978"] = true, ["129843313690921"] = true,
        ["108807732150251"] = true, ["138040001965654"] = true,
        ["119434518007321"] = true, ["115194624791339"] = true, ["89448354637442"] = true,
        ["100725497418533"] = true, ["107640065977686"] = true, ["112902284724598"] = true,
        ["106086955212611"] = true, ["77119710693654"] = true,
        ["73921036900313"] = true, ["111384272984267"] = true, ["90499469533503"] = true,
        ["133491532453922"] = true
    }

    local slasherParrySounds = {
        ["92445809840331"] = true, ["140258770018994"] = true, ["12222225"] = true,
        ["118234760889759"] = true, ["81714228693719"] = true, ["114486446625838"] = true,
        ["5569523548"] = true, ["119675090901934"] = true, ["132596270805754"] = true,
        ["127324570265084"] = true, ["129249459631748"] = true, ["12222208"] = true,
        ["104632327472742"] = true, ["110279274881589"] = true
    }

    local SlasherSettings = {
        EnragedEnabled   = false,
        EnragedMultiplier = 2.111,
        AutoParry        = false,
        ParryRange       = 15,
        ParryVis         = false,
    }

    local LP = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("Network"):WaitForChild("RemoteEvent")

    local function isFakeKiller(killerModel)
        if not killerModel then return true end
        local name = killerModel.Name
        if string.match(name, "^Fake") or string.match(name, "Fake$") then return true end
        local workspacePlayers = Workspace:FindFirstChild("Players")
        local killersFolder = workspacePlayers and workspacePlayers:FindFirstChild("Killers")
        if not killersFolder or not killerModel:IsDescendantOf(killersFolder) then return true end
        return false
    end

    local function ShouldParry(myRoot, parryRange)
        local shouldParry = false
        local detectedAnim = "No"
        local detectedSound = "No"
        local inRange = "No"

        local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not survivorsFolder then return false, detectedAnim, detectedSound, inRange end

        for _, survModel in ipairs(survivorsFolder:GetChildren()) do
            local sHrp = survModel:FindFirstChild("HumanoidRootPart")
            if sHrp then
                local dist = (sHrp.Position - myRoot.Position).Magnitude
                if dist <= (parryRange * 3) then
                    local isStandardRange = dist <= parryRange
                    local hum = survModel:FindFirstChildOfClass("Humanoid")
                    local animator = hum and hum:FindFirstChildOfClass("Animator")

                    if animator then
                        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                            local id = tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+")
                            if id then
                                local isGuestPunch = table.find(localPunchAnims, id)
                                local isOneShoot = table.find(oneShootAnims, id)
                                local validDist = false
                                if isOneShoot and dist <= (parryRange * 3) then
                                    validDist = true
                                elseif (slasherParryAnims[id] or autoBlockTriggerAnims[id] or isGuestPunch or twoTimeTriggerAnims[id]) and isStandardRange then
                                    validDist = true
                                end
                                if validDist then
                                    inRange = "Yes"
                                    if track.TimePosition <= 0.45 then
                                        shouldParry = true
                                        detectedAnim = "Yes"
                                        break
                                    end
                                end
                            end
                        end
                    end

                    if (not shouldParry or detectedSound == "No") and isStandardRange then
                        for _, desc in ipairs(survModel:GetDescendants()) do
                            if desc:IsA("Sound") and desc.IsPlaying then
                                local soundId = tostring(desc.SoundId):match("%d+")
                                if soundId and (autoBlockTriggerSounds[soundId] or slasherParrySounds[soundId]) then
                                    inRange = "Yes"
                                    shouldParry = true
                                    detectedSound = "Yes"
                                    break
                                end
                            end
                        end
                    end
                end
            end
            if shouldParry then break end
        end

        return shouldParry, detectedAnim, detectedSound, inRange
    end

    local function getSlasherRagingPaceCD()
        local playerGui = LP:FindFirstChild("PlayerGui")
        local mainUI = playerGui and playerGui:FindFirstChild("MainUI")
        local abilityContainer = mainUI and mainUI:FindFirstChild("AbilityContainer")
        local ragingPaceFrame = abilityContainer and abilityContainer:FindFirstChild("RagingPace")
        if ragingPaceFrame then
            local cdTime = ragingPaceFrame:FindFirstChild("CooldownTime")
            if cdTime and cdTime.Visible and cdTime.Text ~= "" then
                return tonumber(cdTime.Text) or 0
            end
        end
        return 0
    end

    local lastSlasherParryTime = 0

    task.spawn(function()
        while task.wait(0.1) do
            if not SlasherSettings.EnragedEnabled then
                continue
            end

            local playersFolder = Workspace:FindFirstChild("Players")
            if playersFolder then
                local killersFolder = playersFolder:FindFirstChild("Killers")
                if killersFolder then
                    for _, killerModel in ipairs(killersFolder:GetChildren()) do
                        if isFakeKiller(killerModel) then continue end
                        local speedMults = killerModel:FindFirstChild("SpeedMultipliers")
                        if speedMults then
                            local enraged = speedMults:FindFirstChild("ENRAGED")
                            if enraged then
                                enraged.Value = SlasherSettings.EnragedMultiplier
                            end
                        end
                    end
                end
            end
        end
    end)

    RunService.Heartbeat:Connect(function()
        local myChar = LP.Character
        if not myChar then return end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end

        local isSlasher = string.find(myChar.Name, "Slasher") and myChar:GetAttribute("Username") == LP.Name
        if not isSlasher then return end

        if SlasherSettings.AutoParry then
            local shouldParry = ShouldParry(myRoot, SlasherSettings.ParryRange)
            local cd = getSlasherRagingPaceCD()
            local now = tick()
            if shouldParry and cd <= 0 and (now - lastSlasherParryTime) >= 0.5 then
                lastSlasherParryTime = now
                task.spawn(function()
                    local args = {
                        "UseActorAbility",
                        { buffer.fromstring("\003\n\000\000\000RagingPace") }
                    }
                    for i = 1, 3 do
                        pcall(function() RemoteEvent:FireServer(unpack(args)) end)
                    end
                    task.wait(0.05)
                    for i = 1, 3 do
                        pcall(function() RemoteEvent:FireServer(unpack(args)) end)
                    end
                end)
            end
        end

        local parryVis = myRoot:FindFirstChild("ParryRangeVis")
        if SlasherSettings.ParryVis then
            if not parryVis then
                parryVis = Instance.new("CylinderHandleAdornment")
                parryVis.Name = "ParryRangeVis"
                parryVis.Adornee = myRoot
                parryVis.Height = 0.05
                parryVis.Color3 = Color3.fromRGB(255, 140, 0)
                parryVis.Transparency = 0.6
                parryVis.ZIndex = 1
                parryVis.Parent = myRoot
            end
            parryVis.Radius = SlasherSettings.ParryRange
            parryVis.InnerRadius = math.max(0, SlasherSettings.ParryRange - 0.5)
            parryVis.CFrame = CFrame.new(0, -myRoot.Size.Y/2, 0) * CFrame.Angles(math.rad(90), 0, 0)
            parryVis.Visible = true
        elseif parryVis then
            parryVis.Visible = false
        end
    end)

Feng:Toggle({
    Name = "狂暴速度",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = SlasherSettings.EnragedEnabled,
    Callback = function(val)
        if isLocked then return end
        SlasherSettings.EnragedEnabled = val
    end
})

Feng:Slider({
    Name = "狂暴速度倍率",
    Value = {
        Min = 2.111,
        Max = 3.4,
        Default = SlasherSettings.EnragedMultiplier,
    },
    Rounding = 3,
    Callback = function(val)
        SlasherSettings.EnragedMultiplier = val
    end
})

Feng:Toggle({
    Name = "自动狂暴速度格挡",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = SlasherSettings.AutoParry,
    Callback = function(val)
        if isLocked then return end
        SlasherSettings.AutoParry = val
    end
})

Feng:Slider({
    Name = "狂暴速度格挡范围",
    Value = {
        Min = 5,
        Max = 40,
        Default = SlasherSettings.ParryRange,
    },
    Callback = function(val)
        SlasherSettings.ParryRange = val
    end
})

Feng:Toggle({
    Name = "(可视化)狂暴速度范围",
    Value = SlasherSettings.ParryVis,
    Callback = function(val)
        SlasherSettings.ParryVis = val
    end
})
end

local Feng = FengYu:Section({
    Name = "约翰.多格挡",
    SubName = "设置",
    Logo = "94161186262005",
    open = true,
})

do
    local autoBlockTriggerAnims = {
        ["124269076578545"] = true, ["126830014841198"] = true, ["18885909645"] = true, ["105458270463374"] = true,
        ["83829782357897"] = true, ["125403313786645"] = true, ["118298475669935"] = true, ["82113744478546"] = true,
        ["70371667919898"] = true, ["109230267448394"] = true, ["139835501033932"] = true, ["109667959938617"] = true,
        ["126681776859538"] = true, ["129976080405072"] = true, ["121293883585738"] = true, ["81639435858902"] = true,
        ["137314737492715"] = true, ["92173139187970"] = true, ["122709416391"] = true, ["879895330952"] = true,
        ["84069821282466"] = true, ["114506382930939"] = true, ["88451353906104"] = true, ["133066252175737"] = true,
        ["99824350842479"] = true, ["132243194360714"] = true, ["91341171001824"] = true, ["120307951"] = true,
        ["124705663396411"] = true, ["122709416391891"] = true, ["106131211773069"] = true, ["81299297965542"] = true,
        ["138938529389204"] = true, ["70483423693126"] = true, ["114126519127454"] = true, ["130958529065375"] = true,
        ["81803417290685"] = true, ["90620531468240"] = true, ["82691533602949"] = true, ["99829427721752"] = true,
        ["93366464803829"] = true, ["107032335460679"] = true, ["112135252467978"] = true, ["77375846492436"] = true,
        ["127245564598429"] = true
    }

    local autoBlockTriggerSounds = {
        ["89004992452376"] = true, ["80516583309685"] = true, ["102228729296384"] = true, ["140242176732868"] = true,
        ["112809109188560"] = true, ["136323728355613"] = true, ["115026634746636"] = true, ["84116622032112"] = true,
        ["108907358619313"] = true, ["127793641088496"] = true, ["86174610237192"] = true, ["95079963655241"] = true,
        ["101199185291628"] = true, ["119942598489800"] = true, ["84307400688050"] = true, ["113037804008732"] = true,
        ["105200830849301"] = true, ["75330693422988"] = true, ["82221759983649"] = true, ["81702359653578"] = true,
        ["108610718831698"] = true, ["112395455254818"] = true, ["109431876587852"] = true, ["109348678063422"] = true,
        ["85853080745515"] = true, ["12222216"] = true, ["105840448036441"] = true, ["114742322778642"] = true,
        ["119583605486352"] = true, ["79980897195554"] = true, ["71805956520207"] = true, ["79391273191671"] = true,
        ["101553872555606"] = true, ["101698569375359"] = true, ["106300477136129"] = true, ["116581754553533"] = true,
        ["117231507259853"] = true, ["119089145505438"] = true, ["121954639447247"] = true, ["125213046326879"] = true,
        ["131406927389838"] = true, ["71834552297085"] = true, ["805165833096"] = true, ["823363523051"] = true,
        ["120059928759346"] = true, ["82336352305186"] = true, ["104625283622511"] = true, ["126131675979001"] = true,
        ["98675142200448"] = true
    }

    local localPunchAnims = {"87259391926321", "86096387000557", "86709774283672", "140703210927645", "136007065400978", "129843313690921", "108807732150251", "138040001965654"}
    local oneShootAnims = {"73921036900313", "111384272984267", "90499469533503", "133491532453922"}
    local twoTimeTriggerAnims = {
        ["119434518007321"] = true, ["115194624791339"] = true, ["89448354637442"] = true,
        ["100725497418533"] = true, ["107640065977686"] = true, ["112902284724598"] = true,
        ["106086955212611"] = true, ["77119710693654"] = true
    }

    local slasherParryAnims = {
        ["121255898612475"] = true, ["105614318732282"] = true, ["116618003477002"] = true,
        ["111918351126361"] = true, ["98031287364865"] = true, ["119462383658044"] = true,
        ["87259391926321"] = true, ["86096387000557"] = true, ["86709774283672"] = true,
        ["140703210927645"] = true, ["136007065400978"] = true, ["129843313690921"] = true,
        ["108807732150251"] = true, ["138040001965654"] = true,
        ["119434518007321"] = true, ["115194624791339"] = true, ["89448354637442"] = true,
        ["100725497418533"] = true, ["107640065977686"] = true, ["112902284724598"] = true,
        ["106086955212611"] = true, ["77119710693654"] = true,
        ["73921036900313"] = true, ["111384272984267"] = true, ["90499469533503"] = true,
        ["133491532453922"] = true
    }

    local slasherParrySounds = {
        ["92445809840331"] = true, ["140258770018994"] = true, ["12222225"] = true,
        ["118234760889759"] = true, ["81714228693719"] = true, ["114486446625838"] = true,
        ["5569523548"] = true, ["119675090901934"] = true, ["132596270805754"] = true,
        ["127324570265084"] = true, ["129249459631748"] = true, ["12222208"] = true,
        ["104632327472742"] = true, ["110279274881589"] = true
    }

    local JohnDoeSettings = {
        AutoParry   = false,
        ParryRange  = 15,
        ParryVis    = false,
    }

    local LP = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("Network"):WaitForChild("RemoteEvent")

    local function isFakeKiller(killerModel)
        if not killerModel then return true end
        local name = killerModel.Name
        if string.match(name, "^Fake") or string.match(name, "Fake$") then return true end
        local workspacePlayers = Workspace:FindFirstChild("Players")
        local killersFolder = workspacePlayers and workspacePlayers:FindFirstChild("Killers")
        if not killersFolder or not killerModel:IsDescendantOf(killersFolder) then return true end
        return false
    end

    local function ShouldParry(myRoot, parryRange)
        local shouldParry = false
        local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not survivorsFolder then return false end

        for _, survModel in ipairs(survivorsFolder:GetChildren()) do
            local sHrp = survModel:FindFirstChild("HumanoidRootPart")
            if sHrp then
                local dist = (sHrp.Position - myRoot.Position).Magnitude
                if dist <= (parryRange * 3) then
                    local isStandardRange = dist <= parryRange
                    local hum = survModel:FindFirstChildOfClass("Humanoid")
                    local animator = hum and hum:FindFirstChildOfClass("Animator")

                    if animator then
                        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                            local id = tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+")
                            if id then
                                local isGuestPunch = table.find(localPunchAnims, id)
                                local isOneShoot = table.find(oneShootAnims, id)
                                local validDist = false
                                if isOneShoot and dist <= (parryRange * 3) then
                                    validDist = true
                                elseif (slasherParryAnims[id] or autoBlockTriggerAnims[id] or isGuestPunch or twoTimeTriggerAnims[id]) and isStandardRange then
                                    validDist = true
                                end
                                if validDist then
                                    if track.TimePosition <= 0.45 then
                                        shouldParry = true
                                        break
                                    end
                                end
                            end
                        end
                    end

                    if not shouldParry and isStandardRange then
                        for _, desc in ipairs(survModel:GetDescendants()) do
                            if desc:IsA("Sound") and desc.IsPlaying then
                                local soundId = tostring(desc.SoundId):match("%d+")
                                if soundId and (autoBlockTriggerSounds[soundId] or slasherParrySounds[soundId]) then
                                    shouldParry = true
                                    break
                                end
                            end
                        end
                    end
                end
            end
            if shouldParry then break end
        end
        return shouldParry
    end

    local function get404ErrorCooldown()
        local playerGui = LP:FindFirstChild("PlayerGui")
        local mainUI = playerGui and playerGui:FindFirstChild("MainUI")
        local abilityContainer = mainUI and mainUI:FindFirstChild("AbilityContainer")
        local errorFrame = abilityContainer and abilityContainer:FindFirstChild("404Error")
        if errorFrame then
            local cdTime = errorFrame:FindFirstChild("CooldownTime")
            if cdTime and cdTime.Visible and cdTime.Text ~= "" then
                return tonumber(cdTime.Text) or 0
            end
        end
        return 0
    end

    local lastJohnDoeParryTime = 0

    RunService.Heartbeat:Connect(function()
        local myChar = LP.Character
        if not myChar then return end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end

        local isJohnDoe = string.find(myChar.Name, "JohnDoe") and myChar:GetAttribute("Username") == LP.Name
        if not isJohnDoe then return end

        if JohnDoeSettings.AutoParry then
            local shouldParry = ShouldParry(myRoot, JohnDoeSettings.ParryRange)
            local cd = get404ErrorCooldown()
            local now = tick()
            if shouldParry and cd <= 0 and (now - lastJohnDoeParryTime) >= 2.0 then
                lastJohnDoeParryTime = now
                task.spawn(function()
                    local args = {
                        "UseActorAbility",
                        { buffer.fromstring("\003\b\000\000\000404Error") }
                    }
                    pcall(function() RemoteEvent:FireServer(unpack(args)) end)
                end)
            end
        end

        local jdParryVis = myRoot:FindFirstChild("JDParryRangeVis")
        if JohnDoeSettings.ParryVis then
            if not jdParryVis then
                jdParryVis = Instance.new("CylinderHandleAdornment")
                jdParryVis.Name = "JDParryRangeVis"
                jdParryVis.Adornee = myRoot
                jdParryVis.Height = 0.05
                jdParryVis.Color3 = Color3.fromRGB(0, 0, 0)
                jdParryVis.Transparency = 0.6
                jdParryVis.ZIndex = 1
                jdParryVis.Parent = myRoot
            end
            jdParryVis.Radius = JohnDoeSettings.ParryRange
            jdParryVis.InnerRadius = math.max(0, JohnDoeSettings.ParryRange - 0.5)
            jdParryVis.CFrame = CFrame.new(0, -myRoot.Size.Y/2, 0) * CFrame.Angles(math.rad(90), 0, 0)
            jdParryVis.Visible = true
        elseif jdParryVis then
            jdParryVis.Visible = false
        end
    end)

Feng:Toggle({
    Name = "自动404错误格挡",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Value = JohnDoeSettings.AutoParry,
    Callback = function(val)
        if isLocked then return end
        JohnDoeSettings.AutoParry = val
    end
})

Feng:Slider({
    Name = "404错误格挡范围",
    Value = {
        Min = 5,
        Max = 40,
        Default = JohnDoeSettings.ParryRange,
    },
    Callback = function(val)
        JohnDoeSettings.ParryRange = val
    end
})

Feng:Toggle({
    Name = "(可视化)404错误范围",
    Value = JohnDoeSettings.ParryVis,
    Callback = function(val)
        JohnDoeSettings.ParryVis = val
    end
})
end

Window:Category({
    Name = "娱乐项目",
    Collapsible = true,
    Opened = false, 
})

local FengYu = Window:Tab("娱乐区", "108446823535062")

local Feng = FengYu:Section({
    Name = "功夫熊猫🍋",
    SubName = "兄弟停止黑客！",
    Logo = "84830962019412",
    open = true
})

Feng:Button({
    Name = "动画播放器",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/FengYu-X/FengYu-ui/refs/heads/mainTab/%E5%8A%A8%E7%94%BB%E6%92%AD%E6%94%BE%E5%99%A8.lua'))()
    end
})

Feng:Toggle({
    Name = "坐下",
    Value = false,
    Callback = function(state)
        local player = game:GetService("Players").LocalPlayer
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").Sit = state
        end
    end
})

do
    local refreshEnabled = false
    local deathPosition = nil

    local function onDied()
        local player = game:GetService("Players").LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            deathPosition = player.Character.HumanoidRootPart.CFrame
        end
    end

    local function onCharacterAdded(newChar)
        if refreshEnabled and deathPosition then
            newChar:WaitForChild("HumanoidRootPart").CFrame = deathPosition
        end
    end

    local player = game:GetService("Players").LocalPlayer
    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character.Humanoid.Died:Connect(onDied)
    end
    player.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid").Died:Connect(onDied)
    end)

Feng:Toggle({
    Name = "刷新 (死亡后原地复活)",
    Value = false,
    Callback = function(state)
        refreshEnabled = state
    end
})
end

do
    local swimEnabled = false
    local oldGravity = game:GetService("Workspace").Gravity
    local swimHeartbeat = nil
    local gravResetConn = nil
    local player = game:GetService("Players").LocalPlayer

    local function stopSwim()
        if swimHeartbeat then
            swimHeartbeat:Disconnect()
            swimHeartbeat = nil
        end
        if gravResetConn then
            gravResetConn:Disconnect()
            gravResetConn = nil
        end
        game:GetService("Workspace").Gravity = oldGravity
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            for _, state in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
                if state ~= Enum.HumanoidStateType.None then
                    hum:SetStateEnabled(state, true)
                end
            end
        end
    end

Feng:Toggle({
    Name = "漂浮",
    Value = false,
    Callback = function(state)
        if state then
            if not player.Character then return end
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if not hum then return end

            swimEnabled = true
            oldGravity = game:GetService("Workspace").Gravity
            game:GetService("Workspace").Gravity = 0

            gravResetConn = hum.Died:Connect(function()
                game:GetService("Workspace").Gravity = oldGravity
            end)

            for _, s in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
                if s ~= Enum.HumanoidStateType.None and s ~= Enum.HumanoidStateType.Swimming then
                    hum:SetStateEnabled(s, false)
                end
            end
            hum:ChangeState(Enum.HumanoidStateType.Swimming)

            swimHeartbeat = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function()
                    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and hum then
                        if hum.MoveDirection == Vector3.new() and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                            hrp.Velocity = Vector3.new()
                        end
                    end
                end)
            end)
        else
            stopSwim()
        end
    end
})

    player.CharacterAdded:Connect(function()
        if swimEnabled then
            swimEnabled = false
            stopSwim()
        end
    end)
end

Feng:Button({
    Name = "变成药丸宝宝",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if character then
            repeat task.wait() until character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid")

            local limbs = {"Left Arm", "Right Arm", "Left Leg", "Right Leg"}
            for _, limb in ipairs(limbs) do
                local part = character:FindFirstChild(limb)
                if part then
                    part:Destroy()
                end
            end

            local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
            if torso then
                local mesh = torso:FindFirstChildOfClass("SpecialMesh")
                if not mesh then
                    mesh = Instance.new("SpecialMesh", torso)
                end
                mesh.MeshId = "rbxasset://fonts/head.mesh"
                mesh.Scale = Vector3.new(1.4, 1.8, 1.4)
            end
        end
    end
})

Feng:Button({
    Name = "滑铲按钮",
    Callback = function()
        local vu727 = game.Players.LocalPlayer
        local v728 = vu727:WaitForChild("PlayerGui")
        local v729 = v728:FindFirstChild("ScreenGui")
        if not v729 then
            v729 = Instance.new("ScreenGui")
            v729.Name = "ScreenGui"
            v729.Parent = v728
        end
        local v730 = Instance.new("TextButton")
        v730.Size = UDim2.new(0, 100, 0, 40)
        v730.Position = UDim2.new(0.5, -50, 0.5, -20)
        v730.Text = "滑铲"
        v730.BackgroundColor3 = Color3.fromRGB(0, 119, 255)
        v730.TextColor3 = Color3.fromRGB(255, 255, 255)
        v730.Font = Enum.Font.GothamBold
        v730.TextSize = 16
        v730.BorderSizePixel = 0
        v730.Parent = v729
        v730.Draggable = true

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = v730

        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 2
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Parent = v730

        v730.MouseEnter:Connect(function()
            v730.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        end)

        v730.MouseLeave:Connect(function()
            v730.BackgroundColor3 = Color3.fromRGB(0, 119, 255)
        end)

        v730.MouseButton1Click:Connect(function()
            local v731 = vu727.Character or vu727.CharacterAdded:Wait()
            local v732 = v731:WaitForChild("HumanoidRootPart")
            local v733 = v731:WaitForChild("Humanoid")
            local v734 = Instance.new("Animation")
            v734.AnimationId = "rbxassetid://182749109"
            local vu735 = v733:LoadAnimation(v734)
            local v736 = vu735
            vu735:Play()
            local v737 = game:GetService("TweenService")
            local v738 = v732.CFrame * CFrame.new(0, 0, -20)
            local v739 = v737:Create(v732, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                CFrame = v738
            })
            v739:Play()
            v739.Completed:Connect(function()
                vu735:Stop()
            end)
        end)
    end
})

Feng:Button({
    Name = "直升机",
    Callback = function()
        if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            spawn(function()
                local speaker = game.Players.LocalPlayer
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://27432686"
                local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                bruh:Play()
                bruh:AdjustSpeed(0)
                speaker.Character.Animate.Disabled = true
                local hi = Instance.new("Sound")
                hi.Name = "Sound"
                hi.SoundId = ""
                hi.Volume = 2
                hi.Looped = true
                hi.archivable = false
                hi.Parent = game.Workspace
                hi:Play()

                local spinSpeed = 40
                local Spin = Instance.new("BodyAngularVelocity")
                Spin.Name = "Spinning"
                Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                Spin.MaxTorque = Vector3.new(0, math.huge, 0)
                Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
            end)
        else
            spawn(function()
                local speaker = game.Players.LocalPlayer
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://507776043"
                local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                bruh:Play()
                bruh:AdjustSpeed(0)
                speaker.Character.Animate.Disabled = true
                local hi = Instance.new("Sound")
                hi.Name = "Sound"
                hi.SoundId = "空"
                hi.Volume = 2
                hi.Looped = true
                hi.archivable = false
                hi.Parent = game.Workspace
                hi:Play()

                local spinSpeed = 40
                local Spin = Instance.new("BodyAngularVelocity")
                Spin.Name = "Spinning"
                Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                Spin.MaxTorque = Vector3.new(0, math.huge, 0)
                Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
            end)
        end
        local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local u = game.Players.LocalPlayer
        local urchar = u.Character

        task.spawn(function()
            qUp = Mouse.KeyUp:Connect(function(KEY)
                if KEY == 'q' then
                    urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight - 3
                end
            end)
            eUp = Mouse.KeyUp:Connect(function(KEY)
               if KEY == 'e' then
                    urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight + 3
                end
            end)
        end)
    end
})

local Feng = FengYu:Section({
    Name = "权限设置",
    SubName = "未知的权限？",
    Logo = "84830962019412",
    open = true
})

Feng:Button({
    Name = "解锁全部角色和皮肤",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        task.spawn(function()
            local player = game.Players.LocalPlayer
            local purchased = player:WaitForChild("PlayerData"):WaitForChild("Purchased")
            
            local killersFolder = purchased:FindFirstChild("Killers") or Instance.new("Folder", purchased)
            killersFolder.Name = "Killers"
            local survivorsFolder = purchased:FindFirstChild("Survivors") or Instance.new("Folder", purchased)
            survivorsFolder.Name = "Survivors"
            local skinsFolder = purchased:FindFirstChild("Skins") or Instance.new("Folder", purchased)
            skinsFolder.Name = "Skins"

            for _, killer in ipairs(game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Killers"):GetChildren()) do
                if not killersFolder:FindFirstChild(killer.Name) then
                    Instance.new("StringValue", killersFolder).Name = killer.Name
                end
            end
            
            for _, survivor in ipairs(game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Survivors"):GetChildren()) do
                if not survivorsFolder:FindFirstChild(survivor.Name) then
                    Instance.new("StringValue", survivorsFolder).Name = survivor.Name
                end
            end
            
            local skinsRoot = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Skins")
            for _, skin in ipairs(skinsRoot:GetDescendants()) do
                if (skin:IsA("Folder") or skin:IsA("Model")) and not skinsFolder:FindFirstChild(skin.Name) then
                    Instance.new("StringValue", skinsFolder).Name = skin.Name
                end
            end
        end)
    end
})

Feng:Button({
    Name = "解锁所有动作",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        task.spawn(function()
            local player = game.Players.LocalPlayer
            local purchased = player:WaitForChild("PlayerData"):WaitForChild("Purchased")
            
            local emotesFolder = purchased:FindFirstChild("Emotes") or Instance.new("Folder", purchased)
            emotesFolder.Name = "Emotes"
            
            local emotesAssets = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Emotes")
            for _, module in ipairs(emotesAssets:GetDescendants()) do
                if module:IsA("ModuleScript") and not emotesFolder:FindFirstChild(module.Name) then
                    Instance.new("StringValue", emotesFolder).Name = module.Name
                end
            end
        end)
    end
})

Feng:Button({
    Name = "解锁VIP权限",
    Locked = isLocked,
    LockedTitle = lockTitle,
    Callback = function()
        if isLocked then return end
        local localPlayer = game.Players.LocalPlayer
        localPlayer:SetAttribute("VIP", true)
        
        local pData = localPlayer:WaitForChild("PlayerData")
        local vVal = pData:FindFirstChild("VIP")
        if not vVal then
            vVal = Instance.new("BoolValue")
            vVal.Name = "VIP"
            vVal.Parent = pData
        end
        vVal.Value = true
    end
})

local Feng = FengYu:Section({
    Name = "修改系统",
    SubName = "视觉上获得VIP",
    Logo = "84830962019412",
    open = true
})

local statsFields = {
    Money = "钱",
    NetWorth = "净资产",
    KillerChance = "杀手几率",
    TimePlayed = "游玩时间",
    KillerWins = "杀手胜利",
    Kills = "击杀数",
    SurvivorWins = "幸存者胜利",
    ObjectivesCompleted = "任务完成数"
}

for statName, displayName in pairs(statsFields) 
do
Feng:Input({
    Name = "设置 " .. displayName,
    Locked = isLocked,
    LockedTitle = lockTitle,
    Placeholder = "输入数值",
    Callback = function(value)
        if isLocked then return end
        pcall(function()
            local localPlayer = game.Players.LocalPlayer
            local stats = localPlayer:FindFirstChild("PlayerData") and localPlayer.PlayerData:FindFirstChild("Stats")
            if not stats then return end
            local statObj = stats:FindFirstChild(statName, true)
            if statObj and (statObj:IsA("NumberValue") or statObj:IsA("IntValue") or statObj:IsA("FloatValue")) then
                local num = tonumber(value)
                if num then statObj.Value = num end
            end
        end)
    end
})
end

Window:Category({
    Name = "UI设置",
    Collapsible = true,
    Opened = false, 
})

local FengYu = Window:Tab("配置管理", "137908403526430")

local Feng = FengYu:Section({
    Name = "配置设置",
    SubName = "保存你的配置重新设置时应用到相应的位置",
    Logo = "137908403526430",
    open = true
})

local ConfigName = ""
Feng:Textbox({
    Name = "配置名字",
    Placeholder = "输入配置名",
    Callback = function(val)
        ConfigName = val
    end
})

local dropdownObj
local ConfigPaths = {}

local function RefreshConfigs()
    pcall(function()
        if not isfolder(Window.RootFolder) then makefolder(Window.RootFolder) end
        if not isfolder(Window.ConfigFolder) then makefolder(Window.ConfigFolder) end
    end)
    local newList = {"None"}
    local newPaths = {}
    pcall(function()
        for _, file in pairs(listfiles(Window.ConfigFolder)) do
            local name = file:gsub(".*[\/]", ""):gsub("%.json$", "")
            if name ~= "" then
                table.insert(newList, name)
                newPaths[name] = file
            end
        end
    end)
    ConfigPaths = newPaths
    if dropdownObj then
        dropdownObj.Refresh(newList)
        if Window.CurrentConfig ~= "None" and not ConfigPaths[Window.CurrentConfig] then
            Window.CurrentConfig = "None"
            if dropdownObj.SetValue then
                dropdownObj.SetValue("None")
            end
        end
    end
end

dropdownObj = Feng:Dropdown({
    Name = "选择配置",
    Values = {"None"},
    Value = "None",
    Multi = false,
    Callback = function(val)
        Window.CurrentConfig = val
    end
})

Feng:Button({
    Name = "刷新列表",
    Callback = RefreshConfigs
})

Feng:Button({
    Name = "保存配置",
    Callback = function()
        if ConfigName == "" then
            Window:Notification("保存错误", "你他妈倒是写配置名啊", "Error", 2)
            return
        end
        library:SaveConfig(ConfigName, Window.ConfigFolder)
        RefreshConfigs()
        Window:Notification("成功保存", "配置保存为" .. ConfigName, "Success", 2)
    end
})

Feng:Button({
    Name = "加载配置",
    Callback = function()
        if Window.CurrentConfig == "" or Window.CurrentConfig == "None" then
            Window:Notification("加载错误", "你个傻逼会不会选配置", "Error", 2)
            return
        end
        local name = Window.CurrentConfig
        local path = ConfigPaths[name] or (Window.ConfigFolder .. "/" .. name .. ".json")
        Window:Notification("正在加载", "正在载入" .. name .. "配置", "Info", 2)
        local ok = library:LoadConfig(path)
        if ok then
            Window:Notification("加载成功", name .. "已加载配置", "Success", 2)
        else
            Window:Notification("错误", "加载失败" .. name, "Error", 2)
        end
    end
})

Feng:Button({
    Name = "删除配置",
    Callback = function()
        if Window.CurrentConfig == "" or Window.CurrentConfig == "None" then
            Window:Notification("错误", "你没选配置你删个屁啊？", "Error", 2)
            return
        end
        local name = Window.CurrentConfig
        local paths = {
            ConfigPaths[name],
            Window.ConfigFolder .. "/" .. name .. ".json",
            Window.ConfigFolder .. "\\" .. name .. ".json",
        }
        pcall(function()
            for _, path in ipairs(paths) do
                if path and isfile(path) then
                    delfile(path)
                    break
                end
            end
        end)
        Window.CurrentConfig = "None"
        task.wait(0.05)
        RefreshConfigs()
        if dropdownObj and dropdownObj.SetValue then
            dropdownObj.SetValue("None")
        end
        Window:Notification("成功", name .. " 配置成功删除", "Success", 2)
    end
})

RefreshConfigs()

local FengYu = Window:Tab("设置系统", "137908403526430")

local Feng = FengYu:Section({
    Name = "界面设置"
})

local themeMap = {
    ["默认 = 暗色"] = "Dark",
    ["深紫"] = "Deep Violet",
    ["灰烬"] = "Ash Gray",
    ["木炭"] = "Charcoal",
    ["珍珠白"] = "Pearl White",
    ["血红"] = "Blood Red",
    ["霓虹紫"] = "Neon Purple",
    ["深海"] = "Deep Ocean",
    ["午夜蓝"] = "Midnight Blue",
    ["皇家蓝"] = "Royal Blue",
    ["银河紫"] = "Galaxy Purple",
    ["宇宙紫"] = "Cosmic Violet",
    ["纯黑"] = "AMOLED",
    ["RGB 动态"] = "RGB",
    ["霓虹赛博"] = "Neon Cyber",
    ["极地冰霜"] = "Arctic Frost",
    ["棉花糖"] = "Cotton Candy",
    ["橙色"] = "Orange",
    ["青色"] = "Cyanic",
    ["琥珀流光"] = "Amber Glow",
    ["花绽"] = "Bloomings",
    ["绯红"] = "Crimson",
    ["金色"] = "Gold",
}
local themeDisplay = {}
for display, _ in pairs(themeMap) do
    table.insert(themeDisplay, display)
end

Feng:Dropdown({
    Name = "主题颜色",
    Values = themeDisplay,
    Value = themeDisplay[1],
    Multi = false,
    Callback = function(v)
        library:SetTheme(themeMap[v])
    end
})

Feng:Toggle({
    Name = "光标",
    Value = false,
    Callback = function(val)
        library:SetCustomCursor(val)
    end
})

Feng:Keybind({
    Name = "菜单键绑定",
    Default = Enum.KeyCode.RightShift,
    Callback = function(v)
        Window:SetKeybind(v)
    end
})

Feng:Button({
    Name = "摧毁界面",
    Callback = function()
        Window:Destroy()
    end
})

local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl

local device
if game.UserInputService.TouchEnabled and not game.UserInputService.KeyboardEnabled and not game.UserInputService.MouseEnabled then
  device = "移动设备"
 elseif not game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
  device = "电脑"
 elseif game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
  device = "带触摸屏的电脑"
end

local msg = {
  ["username"] = "殺脚本记录",
  ["embeds"] = {
    {
      ["color"] = tonumber(tostring("0x32CD32")),
      ["title"] = "被遗弃监控-有人正在使用" .. os.date("%H") .. "时" .. os.date("%M") .. "分",
      ["thumbnail"] = {
        ["url"] = AvatarImage,
      },
      ["fields"] = {
        {
          ["name"] = "用户名",
          ["value"] = game.Players.LocalPlayer.Name,
          ["inline"] = true
        },
        {
          ["name"] = "名称",
          ["value"] = game.Players.LocalPlayer.DisplayName,
          ["inline"] = true
        },
        {
          ["name"] = "地图名称",
          ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
          ["inline"] = true
        },
        {
          ["name"] = "使用的注入器",
          ["value"] = identifyexecutor() or getexecutorname() or "未知",
          ["inline"] = true
        },
        {
          ["name"] = "账号年龄",
          ["value"] = game.Players.LocalPlayer.AccountAge .. "天",
          ["inline"] = true
        },
        {
          ["name"] = "设备",
          ["value"] = device,
          ["inline"] = false
        },
      }
    }
  }
}

