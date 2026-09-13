--请停止使用无能垃圾野鸡混淆保护加载器，rob叶鸡ai生成混淆

local player = game:GetService("Players").LocalPlayer
local plrId = player.UserId
local filename = "script_count_" .. plrId .. ".txt"
local count = 0
if pcall(function() return readfile(filename) end) then
    local data = readfile(filename)
    count = tonumber(data) or 0
end
count = count + 1
pcall(function()
    writefile(filename, tostring(count))
end)

local Player = player
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Gui = Instance.new("ScreenGui")
Gui.Parent = Player.PlayerGui
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.ResetOnSpawn = false

local Image = Instance.new("ImageLabel")
Image.Parent = Gui
Image.Size = UDim2.new(1, 0, 1, 0)
Image.Position = UDim2.new(0, 0, 0, 0)
Image.BackgroundTransparency = 1
Image.Image = "rbxassetid://113517588654522"
Image.ScaleType = Enum.ScaleType.Stretch
Image.ImageTransparency = 1
Image.ZIndex = 99999

task.wait(1)
local show = TweenService:Create(Image, TweenInfo.new(0.5), {ImageTransparency = 0})
show:Play()
task.wait(0.5)
task.wait(1)
local hide = TweenService:Create(Image, TweenInfo.new(0.5), {ImageTransparency = 1})
hide:Play()
task.wait(0.5)
Gui:Destroy()

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "恐脚本--通用",
    Text = "作者：恐拜大帝\nQQ：3999698324",
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
})

local espEnabled = false
local function enableESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    if not char:FindFirstChild("EspHighlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "EspHighlight"
        highlight.Parent = char
        highlight.FillTransparency = 1
        highlight.OutlineColor = Color3.new(1, 0, 0)
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end
local function disableESP(player)
    local char = player.Character
    if char and char:FindFirstChild("EspHighlight") then
        char.EspHighlight:Destroy()
    end
end
RunService.RenderStepped:Connect(function()
    if not espEnabled then return end
    for _, player in ipairs(Players:GetPlayers()) do
        enableESP(player)
    end
end)
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        char:WaitForChild("HumanoidRootPart")
        if espEnabled then enableESP(player) end
    end)
end)
Players.PlayerRemoving:Connect(function(player)
    disableESP(player)
end)

local InfiniteJumpEnabled = false
local NoclipEnabled = false
local JumpHeight = 50
local NightVisionEnabled = false
local AntiPushEnabled = false
local AutoTranslateEnabled = false
local SmoothFollowEnabled = false
local FollowNearestEnabled = false
local AimbotEnabled = false
local AimbotRadius = math.floor(Camera.ViewportSize.Y / 3)
local LockViewEnabled = false
local CrosshairEnabled = false
local CrosshairSpinEnabled = false
local translateLoop = nil
local translatedTexts = {}
local speedAntiPull = nil

local AimbotCircle = Instance.new("Frame")
AimbotCircle.Name = "AimbotCircle"
AimbotCircle.Parent = CoreGui
AimbotCircle.Size = UDim2.new(0, AimbotRadius*2, 0, AimbotRadius*2)
AimbotCircle.Position = UDim2.new(0.5, -AimbotRadius, 0.5, -AimbotRadius)
AimbotCircle.BackgroundTransparency = 1
AimbotCircle.BorderSizePixel = 0
AimbotCircle.ZIndex = 100
local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.new(1,1,1)
circleStroke.Thickness = 2
circleStroke.LineJoinMode = Enum.LineJoinMode.Round
circleStroke.Parent = AimbotCircle
local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1,0)
circleCorner.Parent = AimbotCircle

local function getHumanoid()
    local char = LocalPlayer.Character
    if char then return char:FindFirstChild("Humanoid") end
end

UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local char = LocalPlayer.Character
        if char then
            local HRP = char:FindFirstChild("HumanoidRootPart")
            if HRP then
                HRP.Velocity = Vector3.new(HRP.Velocity.X, JumpHeight, HRP.Velocity.Z)
            end
        end
    end
end)

local noclipConnection
local lastGroundY = 0
local function startNoclip()
    if noclipConnection then noclipConnection:Disconnect() end
    noclipConnection = RunService.Stepped:Connect(function()
        if not NoclipEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.FloorMaterial ~= Enum.Material.Air then
            lastGroundY = root.Position.Y
        end
        root.CanCollide = false
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
            end
        end
        if lastGroundY ~= 0 and root.Position.Y < lastGroundY - 5 then
            root.CFrame = CFrame.new(root.CFrame.X, lastGroundY, root.CFrame.Z)
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Landed)
            end
        end
    end)
end
local function stopNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then root.CanCollide = true end
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") and not v.CanCollide then
                v.CanCollide = true
            end
        end
    end
end

RunService.Stepped:Connect(function()
    if AntiPushEnabled then
        local char = LocalPlayer.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CanCollide = false
            end
        end
    end
end)

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
            if dist < minDist then minDist = dist; nearest = p end
        end
    end
    if nearest then
        local targetRoot = nearest.Character.HumanoidRootPart
        local offset = targetRoot.CFrame.LookVector * -2.5
        myRoot.CFrame = CFrame.new(targetRoot.Position + offset, targetRoot.Position)
    end
end)

task.spawn(function()
    while true do
        if FollowNearestEnabled then
            local nearest = nil
            local minDist = math.huge
            local myChar = LocalPlayer.Character
            if myChar then
                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (p.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
                            if dist < minDist then minDist = dist; nearest = p end
                        end
                    end
                    if nearest then
                        myRoot.CFrame = nearest.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 3)
                    end
                end
            end
        end
        task.wait(0.1)
    end
end)

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

local CrosshairGui = Instance.new("ScreenGui")
CrosshairGui.Name = "CrosshairGui"
CrosshairGui.Parent = LocalPlayer.PlayerGui
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

RunService.Heartbeat:Connect(function()
    if CrosshairEnabled and CrosshairSpinEnabled then
        CrosshairFrame.Rotation = (CrosshairFrame.Rotation + 1) % 360
    elseif CrosshairEnabled and not CrosshairSpinEnabled then
        CrosshairFrame.Rotation = 0
    end
    CrosshairFrame.Visible = CrosshairEnabled
end)

local isStealing = false
local function stealAllItems()
    if isStealing then return 0 end
    isStealing = true
    local count = 0
    local myBackpack = LocalPlayer:FindFirstChild("Backpack")
    if not myBackpack then
        myBackpack = Instance.new("Backpack")
        myBackpack.Parent = LocalPlayer
    end
    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer == LocalPlayer or not targetPlayer.Character then continue end
        local itemContainers = {
            targetPlayer:FindFirstChild("Backpack"),
            targetPlayer:FindFirstChild("Inventory"),
            targetPlayer:FindFirstChild("Storage"),
            targetPlayer:FindFirstChild("Bag"),
            targetPlayer.Character:FindFirstChild("Backpack")
        }
        for _, container in ipairs(itemContainers) do
            if not container then continue end
            for _, item in ipairs(container:GetChildren()) do
                if item:IsA("Tool") or item:IsA("Model") or item:IsA("Part") or item:IsA("Accessory") then
                    local success = pcall(function() item.Parent = myBackpack end)
                    if success then count = count + 1; task.wait(0.1) end
                end
            end
        end
    end
    isStealing = false
    return count
end

local function beautifyStats()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if leaderstats then for _, stat in ipairs(leaderstats:GetChildren()) do if stat:IsA("IntValue") or stat:IsA("NumberValue") then stat.Value = 999 end end end
    local stats = LocalPlayer:FindFirstChild("Stats") or LocalPlayer:FindFirstChild("stats")
    if stats then for _, v in ipairs(stats:GetChildren()) do if v:IsA("IntValue") or v:IsA("NumberValue") then v.Value = 999 end end end
end

local function isEnglish(text)
    if not text or text == "" then return false end
    local englishCount = 0
    local totalCount = 0
    for char in text:gmatch(".") do
        local byte = string.byte(char)
        if byte then totalCount = totalCount + 1; if (byte >= 65 and byte <= 90) or (byte >= 97 and byte <= 122) then englishCount = englishCount + 1 end end
    end
    if totalCount == 0 then return false end
    return (englishCount / totalCount) > 0.5
end

local function translateText(text)
    if not text or text == "" or #text < 2 then return nil end
    if translatedTexts[text] then return translatedTexts[text] end
    local success, result = pcall(function()
        local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=zh-CN&dt=t&q=" .. HttpService:UrlEncode(text)
        local response = game:HttpGet(url)
        local decoded = HttpService:JSONDecode(response)
        if decoded and decoded[1] and decoded[1][1] and decoded[1][1][1] then return decoded[1][1][1] end
        return nil
    end)
    if success and result then translatedTexts[text] = result; return result end
    return nil
end

local function processTextObject(obj)
    if not AutoTranslateEnabled then return end
    if not obj:IsA("TextLabel") and not obj:IsA("TextButton") and not obj:IsA("TextBox") then return end
    local originalText = obj.Text
    if not originalText or originalText == "" then return end
    if not isEnglish(originalText) then return end
    local translated = translateText(originalText)
    if translated and translated ~= originalText then obj.Text = translated end
end

local function scanAndTranslate(container, maxCount)
    local c = 0
    for _, obj in ipairs(container:GetDescendants()) do
        if c >= maxCount then break end
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            if isEnglish(obj.Text) then processTextObject(obj); c = c + 1 end
        end
    end
end

local function startAutoTranslate()
    if translateLoop then return end
    translateLoop = true
    task.spawn(function()
        while translateLoop and AutoTranslateEnabled do
            local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
            if PlayerGui then scanAndTranslate(PlayerGui, 5) end
            pcall(function() for _, gui in ipairs(CoreGui:GetChildren()) do if gui:IsA("ScreenGui") then scanAndTranslate(gui, 5) end end end)
            task.wait(0.1)
        end
    end)
end

local function stopAutoTranslate() translateLoop = false end

local function teleportToPlayer(p)
    if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        local myChar = LocalPlayer.Character
        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
            myChar.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 3)
        end
    end
end

local function showPlayerSelect()
    local selectGui = Instance.new("ScreenGui")
    selectGui.Name = "PlayerSelect"
    selectGui.Parent = LocalPlayer.PlayerGui
    selectGui.IgnoreGuiInset = true
    selectGui.ResetOnSpawn = false
    local bg = Instance.new("Frame")
    bg.Parent = selectGui
    bg.Size = UDim2.new(0, 200, 0, 250)
    bg.Position = UDim2.new(0.5, -100, 0.5, -125)
    bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 12); corner.Parent = bg
    local title = Instance.new("TextLabel")
    title.Parent = bg
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "选择玩家"
    title.TextColor3 = Color3.new(1,1,1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 16
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Parent = bg
    scrollFrame.Size = UDim2.new(1, -10, 1, -40)
    scrollFrame.Position = UDim2.new(0, 5, 0, 35)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 4
    local playersList = Players:GetPlayers()
    local y = 0
    for _, p in ipairs(playersList) do
        if p ~= LocalPlayer then
            local btn = Instance.new("TextButton")
            btn.Parent = scrollFrame
            btn.Size = UDim2.new(1, -10, 0, 30)
            btn.Position = UDim2.new(0, 5, 0, y)
            btn.Text = p.Name
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 14
            local btnCorner = Instance.new("UICorner"); btnCorner.CornerRadius = UDim.new(0, 6); btnCorner.Parent = btn
            btn.MouseButton1Click:Connect(function() teleportToPlayer(p); selectGui:Destroy() end)
            y = y + 35
        end
    end
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Parent = bg
    closeBtn.Size = UDim2.new(0, 30, 0, 20)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.Font = Enum.Font.SourceSansBold
    closeBtn.TextSize = 14
    local closeCorner = Instance.new("UICorner"); closeCorner.CornerRadius = UDim.new(0, 4); closeCorner.Parent = closeBtn
    closeBtn.MouseButton1Click:Connect(function() selectGui:Destroy() end)
end

local function startSpeedAntiPull(speed)
    if speedAntiPull then speedAntiPull:Disconnect() end
    speedAntiPull = RunService.Heartbeat:Connect(function()
        local hum = getHumanoid()
        if hum then if hum.WalkSpeed ~= speed then hum.WalkSpeed = speed end end
    end)
end

local function stopSpeedAntiPull()
    if speedAntiPull then speedAntiPull:Disconnect(); speedAntiPull = nil end
end

local UILibrary = {}
do
    local PlayerGui = LocalPlayer.PlayerGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UniversalUI"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.Position = UDim2.new(0.5, 0, 0.5, 10)
    Main.Size = UDim2.new(0, 650, 0, 280)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Visible = false
    Main.ZIndex = 10
    Main.ClipsDescendants = true
    local UICorner = Instance.new("UICorner"); UICorner.CornerRadius = UDim.new(0, 10); UICorner.Parent = Main
    local MainStroke = Instance.new("UIStroke"); MainStroke.Thickness = 2; MainStroke.Color = Color3.new(1, 0, 0); MainStroke.Parent = Main

    local BeanBack = Instance.new("Frame")
    BeanBack.Name = "BeanBackground"
    BeanBack.Parent = Main
    BeanBack.BackgroundTransparency = 1
    BeanBack.Size = UDim2.new(1, 0, 1, 0)
    BeanBack.ZIndex = 1

    local Line = Instance.new("Frame")
    Line.Parent = Main
    Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Line.Position = UDim2.new(0.3, 0, 0, 40)
    Line.Size = UDim2.new(0, 2, 1, -40)
    Line.ZIndex = 11

    local CategoryArea = Instance.new("Frame")
    CategoryArea.Name = "CategoryArea"
    CategoryArea.Parent = Main
    CategoryArea.BackgroundTransparency = 1
    CategoryArea.Size = UDim2.new(0.3, -10, 1, -40)
    CategoryArea.Position = UDim2.new(0, 10, 0, 40)
    CategoryArea.ZIndex = 20

    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = Main
    ContentArea.BackgroundTransparency = 1
    ContentArea.Size = UDim2.new(0.7, -12, 1, -40)
    ContentArea.Position = UDim2.new(0.3, 12, 0, 40)
    ContentArea.ZIndex = 20
    ContentArea.ClipsDescendants = true

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = ContentArea
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Size = UDim2.new(1,0,1,0)
    ScrollingFrame.CanvasSize = UDim2.new(0,0,5,0)
    ScrollingFrame.ScrollBarThickness = 6
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.ZIndex = 20

    local categories = {}
    local pages = {}
    local selected = nil
    local catNames = { "通知", "主要", "次要", "杂项", "支持服务器" }

    local speedPanel = nil
    local coordPanel = nil
    local aimbotPanel = nil

    local function copyToClipboard(text, label)
        local success = pcall(function()
            if setclipboard then setclipboard(text)
            elseif game:GetService("ClipboardService") then game:GetService("ClipboardService"):SetClipboard(text)
            else error("无法访问剪贴板") end
        end)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = label or "提示",
            Text = success and ("✅ 已复制: " .. text) or ("❌ 复制失败，请手动复制：" .. text),
            Duration = 3,
        })
    end

    local function createSpeedPanel()
        if speedPanel then return speedPanel end
        speedPanel = Instance.new("Frame")
        speedPanel.Name = "SpeedPanel"
        speedPanel.Parent = Main
        speedPanel.Size = UDim2.new(0, 250, 0, 160)
        speedPanel.Position = UDim2.new(0.5, -125, 0.5, -80)
        speedPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        speedPanel.BackgroundTransparency = 0.2
        speedPanel.Visible = false
        speedPanel.ZIndex = 200  
        local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 12); corner.Parent = speedPanel
        local stroke = Instance.new("UIStroke"); stroke.Thickness = 1.5; stroke.Color = Color3.fromRGB(100, 100, 100); stroke.Parent = speedPanel

        local title = Instance.new("TextLabel")
        title.Parent = speedPanel
        title.Size = UDim2.new(1, 0, 0, 25)
        title.Position = UDim2.new(0, 10, 0, 8)
        title.BackgroundTransparency = 1
        title.Text = "修改移速"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 16

        local slider = Instance.new("Frame")
        slider.Parent = speedPanel
        slider.Size = UDim2.new(1, -40, 0, 30)
        slider.Position = UDim2.new(0, 20, 0, 45)
        slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        local sliderCorner = Instance.new("UICorner"); sliderCorner.CornerRadius = UDim.new(0, 6); sliderCorner.Parent = slider

        local fill = Instance.new("Frame")
        fill.Parent = slider
        fill.Size = UDim2.new(0, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        fill.BorderSizePixel = 0
        local fillCorner = Instance.new("UICorner"); fillCorner.CornerRadius = UDim.new(0, 6); fillCorner.Parent = fill

        local knob = Instance.new("TextButton")
        knob.Parent = slider
        knob.Size = UDim2.new(0, 20, 0, 20)
        knob.Position = UDim2.new(0, -10, 0.5, -10)
        knob.Text = ""
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.AutoButtonColor = false
        local knobCorner = Instance.new("UICorner"); knobCorner.CornerRadius = UDim.new(1, 0); knobCorner.Parent = knob

        local sliderValue = 16
        local minSpeed, maxSpeed = 5, 1000

        local inputBox = Instance.new("TextBox")
        inputBox.Parent = speedPanel
        inputBox.Size = UDim2.new(0, 80, 0, 28)
        inputBox.Position = UDim2.new(0, 20, 0, 85)
        inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        inputBox.Text = tostring(sliderValue)
        inputBox.TextColor3 = Color3.new(1, 1, 1)
        inputBox.Font = Enum.Font.SourceSans
        inputBox.TextSize = 16
        inputBox.PlaceholderText = "速度"
        local inputCorner = Instance.new("UICorner"); inputCorner.CornerRadius = UDim.new(0, 6); inputCorner.Parent = inputBox

        local function updateSliderDisplay(val)
            local percent = (val - minSpeed) / (maxSpeed - minSpeed)
            fill.Size = UDim2.new(percent, 0, 1, 0)
            knob.Position = UDim2.new(percent, -10, 0.5, -10)
        end

        local function setSpeed(val)
            val = math.clamp(math.floor(val), minSpeed, maxSpeed)
            sliderValue = val
            inputBox.Text = tostring(val)
            updateSliderDisplay(val)
            local hum = getHumanoid()
            if hum then hum.WalkSpeed = val end
            startSpeedAntiPull(val)
        end

        local confirmBtn = Instance.new("TextButton")
        confirmBtn.Parent = speedPanel
        confirmBtn.Size = UDim2.new(0, 80, 0, 28)
        confirmBtn.Position = UDim2.new(0, 110, 0, 85)
        confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        confirmBtn.Text = "确认"
        confirmBtn.TextColor3 = Color3.new(1, 1, 1)
        confirmBtn.Font = Enum.Font.SourceSansBold
        confirmBtn.TextSize = 14
        local confirmCorner = Instance.new("UICorner"); confirmCorner.CornerRadius = UDim.new(0, 6); confirmCorner.Parent = confirmBtn
        confirmBtn.MouseButton1Click:Connect(function()
            local num = tonumber(inputBox.Text)
            if num then setSpeed(num) end
        end)

        local resetBtn = Instance.new("TextButton")
        resetBtn.Parent = speedPanel
        resetBtn.Size = UDim2.new(0, 80, 0, 28)
        resetBtn.Position = UDim2.new(0, 200, 0, 85)
        resetBtn.BackgroundColor3 = Color3.fromRGB(180, 80, 0)
        resetBtn.Text = "重置默认"
        resetBtn.TextColor3 = Color3.new(1, 1, 1)
        resetBtn.Font = Enum.Font.SourceSansBold
        resetBtn.TextSize = 14
        local resetCorner = Instance.new("UICorner"); resetCorner.CornerRadius = UDim.new(0, 6); resetCorner.Parent = resetBtn
        resetBtn.MouseButton1Click:Connect(function() setSpeed(16) end)

        local closeBtn = Instance.new("TextButton")
        closeBtn.Parent = speedPanel
        closeBtn.Size = UDim2.new(0, 22, 0, 22)
        closeBtn.Position = UDim2.new(1, -26, 0, 6)
        closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        closeBtn.Text = "X"
        closeBtn.TextSize = 12
        closeBtn.Font = Enum.Font.SourceSansBold
        local closeCorner = Instance.new("UICorner"); closeCorner.CornerRadius = UDim.new(0, 4); closeCorner.Parent = closeBtn
        closeBtn.MouseButton1Click:Connect(function() speedPanel.Visible = false end)

        local dragging = false
        knob.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local mousePos = UserInputService:GetMouseLocation()
                local sliderAbs = slider.AbsolutePosition
                local sliderSize = slider.AbsoluteSize
                local relativeX = math.clamp(mousePos.X - sliderAbs.X, 0, sliderSize.X)
                local percent = relativeX / sliderSize.X
                local newVal = math.floor(minSpeed + (maxSpeed - minSpeed) * percent)
                setSpeed(newVal)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
        end)
        inputBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then local num = tonumber(inputBox.Text); if num then setSpeed(num) end end
        end)
        updateSliderDisplay(16)
        return speedPanel
    end

    local function createCoordPanel()
        if coordPanel then return coordPanel end
        coordPanel = Instance.new("Frame")
        coordPanel.Name = "CoordPanel"
        coordPanel.Parent = Main
        coordPanel.Size = UDim2.new(0, 280, 0, 140)
        coordPanel.Position = UDim2.new(0.5, -140, 0.5, -70)
        coordPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        coordPanel.BackgroundTransparency = 0.2
        coordPanel.Visible = false
        coordPanel.ZIndex = 200
        local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 12); corner.Parent = coordPanel
        local stroke = Instance.new("UIStroke"); stroke.Thickness = 1.5; stroke.Color = Color3.fromRGB(100, 100, 100); stroke.Parent = coordPanel

        local title = Instance.new("TextLabel")
        title.Parent = coordPanel
        title.Size = UDim2.new(1, 0, 0, 25)
        title.Position = UDim2.new(0, 10, 0, 8)
        title.BackgroundTransparency = 1
        title.Text = "实时坐标"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 16

        local coordLabel = Instance.new("TextLabel")
        coordLabel.Name = "CoordText"
        coordLabel.Parent = coordPanel
        coordLabel.Size = UDim2.new(1, -20, 0, 30)
        coordLabel.Position = UDim2.new(0, 10, 0, 40)
        coordLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        coordLabel.Text = "X: 0, Y: 0, Z: 0"
        coordLabel.TextColor3 = Color3.new(1, 1, 1)
        coordLabel.Font = Enum.Font.SourceSans
        coordLabel.TextSize = 14
        local coordCorner = Instance.new("UICorner"); coordCorner.CornerRadius = UDim.new(0, 6); coordCorner.Parent = coordLabel

        local inputBox = Instance.new("TextBox")
        inputBox.Parent = coordPanel
        inputBox.Size = UDim2.new(1, -20, 0, 28)
        inputBox.Position = UDim2.new(0, 10, 0, 80)
        inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        inputBox.PlaceholderText = "X Y Z 或 X,Y,Z"
        inputBox.TextColor3 = Color3.new(1, 1, 1)
        inputBox.Font = Enum.Font.SourceSans
        inputBox.TextSize = 14
        local inputCorner = Instance.new("UICorner"); inputCorner.CornerRadius = UDim.new(0, 6); inputCorner.Parent = inputBox

        local teleportBtn = Instance.new("TextButton")
        teleportBtn.Parent = coordPanel
        teleportBtn.Size = UDim2.new(0, 70, 0, 28)
        teleportBtn.Position = UDim2.new(0, 10, 0, 115)
        teleportBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        teleportBtn.Text = "传送"
        teleportBtn.TextColor3 = Color3.new(1, 1, 1)
        teleportBtn.Font = Enum.Font.SourceSansBold
        teleportBtn.TextSize = 14
        local teleportCorner = Instance.new("UICorner"); teleportCorner.CornerRadius = UDim.new(0, 6); teleportCorner.Parent = teleportBtn

        local copyBtn = Instance.new("TextButton")
        copyBtn.Parent = coordPanel
        copyBtn.Size = UDim2.new(0, 80, 0, 28)
        copyBtn.Position = UDim2.new(0, 90, 0, 115)
        copyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        copyBtn.Text = "复制坐标"
        copyBtn.TextColor3 = Color3.new(1, 1, 1)
        copyBtn.Font = Enum.Font.SourceSansBold
        copyBtn.TextSize = 14
        local copyCorner = Instance.new("UICorner"); copyCorner.CornerRadius = UDim.new(0, 6); copyCorner.Parent = copyBtn

        local closeBtn = Instance.new("TextButton")
        closeBtn.Parent = coordPanel
        closeBtn.Size = UDim2.new(0, 22, 0, 22)
        closeBtn.Position = UDim2.new(1, -26, 0, 6)
        closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        closeBtn.Text = "X"
        closeBtn.TextSize = 12
        closeBtn.Font = Enum.Font.SourceSansBold
        local closeCorner = Instance.new("UICorner"); closeCorner.CornerRadius = UDim.new(0, 4); closeCorner.Parent = closeBtn
        closeBtn.MouseButton1Click:Connect(function() coordPanel.Visible = false end)

        local function parseCoords(str)
            local parts = str:split(",")
            if #parts >= 3 then local x, y, z = tonumber(parts[1]), tonumber(parts[2]), tonumber(parts[3]); if x and y and z then return x, y, z end end
            parts = str:split(" ")
            if #parts >= 3 then local x, y, z = tonumber(parts[1]), tonumber(parts[2]), tonumber(parts[3]); if x and y and z then return x, y, z end end
            return nil
        end

        teleportBtn.MouseButton1Click:Connect(function()
            local input = inputBox.Text
            if input == "" or input:match("^%s*$") then
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "传送失败", Text = "请输入坐标", Duration = 3 })
                return
            end
            local x, y, z = parseCoords(input)
            if not x or not y or not z then
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "传送失败", Text = "坐标格式错误", Duration = 3 })
                return
            end
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "传送成功", Text = string.format("已传送到 %.1f, %.1f, %.1f", x, y, z), Duration = 3 })
            else
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "传送失败", Text = "角色未加载", Duration = 3 })
            end
        end)

        local function updateCoordDisplay()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local pos = char.HumanoidRootPart.Position
                coordLabel.Text = string.format("X: %.1f, Y: %.1f, Z: %.1f", pos.X, pos.Y, pos.Z)
            end
        end

        copyBtn.MouseButton1Click:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local pos = char.HumanoidRootPart.Position
                local coordText = string.format("%.1f,%.1f,%.1f", pos.X, pos.Y, pos.Z)
                copyToClipboard(coordText, "坐标")
            end
        end)

        local heartbeatConnection
        coordPanel:GetPropertyChangedSignal("Visible"):Connect(function()
            if coordPanel.Visible then
                updateCoordDisplay()
                if not heartbeatConnection then
                    heartbeatConnection = RunService.Heartbeat:Connect(function()
                        if coordPanel.Visible then updateCoordDisplay() end
                    end)
                end
            else
                if heartbeatConnection then heartbeatConnection:Disconnect(); heartbeatConnection = nil end
            end
        end)

        return coordPanel
    end

    local function createAimbotPanel()
        if aimbotPanel then return aimbotPanel end
        aimbotPanel = Instance.new("Frame")
        aimbotPanel.Name = "AimbotPanel"
        aimbotPanel.Parent = Main
        aimbotPanel.Size = UDim2.new(0, 250, 0, 160)
        aimbotPanel.Position = UDim2.new(0.5, -125, 0.5, -80)
        aimbotPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        aimbotPanel.BackgroundTransparency = 0.2
        aimbotPanel.Visible = false
        aimbotPanel.ZIndex = 200
        local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 12); corner.Parent = aimbotPanel
        local stroke = Instance.new("UIStroke"); stroke.Thickness = 1.5; stroke.Color = Color3.fromRGB(100, 100, 100); stroke.Parent = aimbotPanel

        local title = Instance.new("TextLabel")
        title.Parent = aimbotPanel
        title.Size = UDim2.new(1, 0, 0, 25)
        title.Position = UDim2.new(0, 10, 0, 8)
        title.BackgroundTransparency = 1
        title.Text = "自瞄半径"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 16

        local slider = Instance.new("Frame")
        slider.Parent = aimbotPanel
        slider.Size = UDim2.new(1, -40, 0, 30)
        slider.Position = UDim2.new(0, 20, 0, 45)
        slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        local sliderCorner = Instance.new("UICorner"); sliderCorner.CornerRadius = UDim.new(0, 6); sliderCorner.Parent = slider

        local fill = Instance.new("Frame")
        fill.Parent = slider
        fill.Size = UDim2.new(0, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        fill.BorderSizePixel = 0
        local fillCorner = Instance.new("UICorner"); fillCorner.CornerRadius = UDim.new(0, 6); fillCorner.Parent = fill

        local knob = Instance.new("TextButton")
        knob.Parent = slider
        knob.Size = UDim2.new(0, 20, 0, 20)
        knob.Position = UDim2.new(0, -10, 0.5, -10)
        knob.Text = ""
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.AutoButtonColor = false
        local knobCorner = Instance.new("UICorner"); knobCorner.CornerRadius = UDim.new(1, 0); knobCorner.Parent = knob

        local minRadius = 50
        local maxRadius = math.floor(Camera.ViewportSize.Y * 0.8)
        local defaultRadius = math.floor(Camera.ViewportSize.Y / 3)
        local currentRadius = defaultRadius

        local function updateSliderDisplay(val)
            local percent = (val - minRadius) / (maxRadius - minRadius)
            fill.Size = UDim2.new(percent, 0, 1, 0)
            knob.Position = UDim2.new(percent, -10, 0.5, -10)
        end

        local function setRadius(val)
            val = math.clamp(math.floor(val), minRadius, maxRadius)
            currentRadius = val
            if AimbotEnabled then AimbotRadius = val end
            updateSliderDisplay(val)
        end

        local confirmBtn = Instance.new("TextButton")
        confirmBtn.Parent = aimbotPanel
        confirmBtn.Size = UDim2.new(0, 80, 0, 28)
        confirmBtn.Position = UDim2.new(0, 110, 0, 85)
        confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        confirmBtn.Text = "确定"
        confirmBtn.TextColor3 = Color3.new(1, 1, 1)
        confirmBtn.Font = Enum.Font.SourceSansBold
        confirmBtn.TextSize = 14
        local confirmCorner = Instance.new("UICorner"); confirmCorner.CornerRadius = UDim.new(0, 6); confirmCorner.Parent = confirmBtn
        confirmBtn.MouseButton1Click:Connect(function()
            AimbotRadius = currentRadius
            aimbotPanel.Visible = false
        end)

        local resetBtn = Instance.new("TextButton")
        resetBtn.Parent = aimbotPanel
        resetBtn.Size = UDim2.new(0, 80, 0, 28)
        resetBtn.Position = UDim2.new(0, 200, 0, 85)
        resetBtn.BackgroundColor3 = Color3.fromRGB(180, 80, 0)
        resetBtn.Text = "恢复默认"
        resetBtn.TextColor3 = Color3.new(1, 1, 1)
        resetBtn.Font = Enum.Font.SourceSansBold
        resetBtn.TextSize = 14
        local resetCorner = Instance.new("UICorner"); resetCorner.CornerRadius = UDim.new(0, 6); resetCorner.Parent = resetBtn
        resetBtn.MouseButton1Click:Connect(function()
            setRadius(defaultRadius)
            AimbotRadius = defaultRadius
            aimbotPanel.Visible = false
        end)

        local closeBtn = Instance.new("TextButton")
        closeBtn.Parent = aimbotPanel
        closeBtn.Size = UDim2.new(0, 22, 0, 22)
        closeBtn.Position = UDim2.new(1, -26, 0, 6)
        closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        closeBtn.Text = "X"
        closeBtn.TextSize = 12
        closeBtn.Font = Enum.Font.SourceSansBold
        local closeCorner = Instance.new("UICorner"); closeCorner.CornerRadius = UDim.new(0, 4); closeCorner.Parent = closeBtn
        closeBtn.MouseButton1Click:Connect(function() aimbotPanel.Visible = false end)

        local dragging = false
        knob.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local mousePos = UserInputService:GetMouseLocation()
                local sliderAbs = slider.AbsolutePosition
                local sliderSize = slider.AbsoluteSize
                local relativeX = math.clamp(mousePos.X - sliderAbs.X, 0, sliderSize.X)
                local percent = relativeX / sliderSize.X
                local newVal = math.floor(minRadius + (maxRadius - minRadius) * percent)
                setRadius(newVal)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
        end)

        updateSliderDisplay(defaultRadius)
        return aimbotPanel
    end

    local function AddCat(i)
        local cat = Instance.new("TextButton")
        cat.Name = "Cat"..i
        cat.Parent = CategoryArea
        cat.BackgroundTransparency = 0.8
        cat.BackgroundColor3 = Color3.fromRGB(25,25,25)
        cat.Size = UDim2.new(1,0,0,35)
        cat.Position = UDim2.new(0,0,0,(i-1)*40)
        cat.Text = catNames[i]
        cat.TextColor3 = Color3.new(1,1,1)
        cat.TextSize = 14
        cat.AutoButtonColor = false
        cat.ZIndex = 21

        local page = Instance.new("Frame")
        page.Name = "Page"..i
        page.Parent = ScrollingFrame
        page.BackgroundTransparency = 1
        page.Size = UDim2.new(1,0,1,0)
        page.Visible = false
        page.ZIndex = 20

        if i == 1 then
            local info = Instance.new("TextLabel")
            info.Parent = page
            info.Size = UDim2.new(1, -20, 0, 60)
            info.Position = UDim2.new(0, 10, 0, 10)
            info.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            info.Text = "通用脚本\n创作者：恐拜大帝"
            info.TextColor3 = Color3.new(1, 1, 1)
            info.TextWrapped = true
            info.Font = Enum.Font.SourceSans
            info.TextSize = 16
            info.TextXAlignment = Enum.TextXAlignment.Center
            info.TextYAlignment = Enum.TextYAlignment.Center
            local infoCorner = Instance.new("UICorner"); infoCorner.CornerRadius = UDim.new(0, 6); infoCorner.Parent = info

            local startY = info.Position.Y.Offset + info.Size.Y.Offset + 15
            local blackColor = Color3.fromRGB(35, 35, 35)

            local function createCopyButton(parent, groupLabel, code, posX, posY)
                local label = Instance.new("TextLabel")
                label.Parent = parent
                label.Size = UDim2.new(0, 40, 0, 18)
                label.Position = UDim2.new(0, posX, 0, posY - 20)
                label.BackgroundTransparency = 1
                label.Text = groupLabel
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                label.TextSize = 13
                label.Font = Enum.Font.SourceSansBold
                label.TextXAlignment = Enum.TextXAlignment.Left

                local btn = Instance.new("TextButton")
                btn.Parent = parent
                btn.Size = UDim2.new(0, 150, 0, 30)
                btn.Position = UDim2.new(0, posX, 0, posY)
                btn.BackgroundColor3 = blackColor
                btn.Text = code
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.TextSize = 16
                btn.Font = Enum.Font.SourceSansBold
                btn.AutoButtonColor = false
                local btnCorner = Instance.new("UICorner"); btnCorner.CornerRadius = UDim.new(0, 6); btnCorner.Parent = btn

                local hint = Instance.new("TextLabel")
                hint.Parent = parent
                hint.Size = UDim2.new(0, 70, 0, 30)
                hint.Position = UDim2.new(0, posX + 160, 0, posY)
                hint.BackgroundTransparency = 1
                hint.Text = "点击复制"
                hint.TextColor3 = Color3.fromRGB(200, 200, 200)
                hint.TextSize = 14
                hint.Font = Enum.Font.SourceSans
                hint.TextXAlignment = Enum.TextXAlignment.Left

                btn.MouseButton1Click:Connect(function() copyToClipboard(code, groupLabel) end)
                return btn
            end

            createCopyButton(page, "QQ群", "1106203175", 10, startY)
            createCopyButton(page, "QQ", "3999698324", 10, startY + 45)

        elseif i == 2 then
            local function addSemiTransparentButton(page, txt, posX, posY, callback)
                local btn = Instance.new("TextButton")
                btn.Parent = page
                btn.BackgroundColor3 = Color3.new(0, 0, 0)
                btn.BackgroundTransparency = 0.5
                btn.Size = UDim2.new(0.48, 0, 0, 40)
                btn.Position = UDim2.new(0, posX, 0, posY)
                btn.Text = txt
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.TextSize = 14
                btn.AutoButtonColor = false
                btn.ZIndex = 21
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 6); corner.Parent = btn
                if callback then btn.MouseButton1Click:Connect(callback) end
                return btn
            end

            local posX1, posX2 = 4, page.AbsoluteSize.X * 0.52
            local rowHeight = 45

            local espBtn = addSemiTransparentButton(page, "透视：关", posX1, 4)
            local infiniteJumpBtn = addSemiTransparentButton(page, "无限跳：关", posX1, 4 + rowHeight)
            local noclipBtn = addSemiTransparentButton(page, "穿墙：关", posX1, 4 + 2*rowHeight)
            local nightVisionBtn = addSemiTransparentButton(page, "夜视：关", posX1, 4 + 3*rowHeight)

            addSemiTransparentButton(page, "飞行", posX2, 4, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "飞行脚本", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/fly.lua"))() end)
            end)
            addSemiTransparentButton(page, "建造方块", posX2, 4 + rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "建造方块", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://pastebin.com/raw/Zt4kkQG9"))() end)
            end)
            addSemiTransparentButton(page, "修改移速", posX2, 4 + 2*rowHeight, function()
                local panel = createSpeedPanel()
                panel.Visible = not panel.Visible
            end)
            addSemiTransparentButton(page, "偷取道具", posX2, 4 + 3*rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "偷取道具", Text = "正在偷取道具中...", Duration = 5 })
                task.spawn(function()
                    local cnt = stealAllItems()
                    game:GetService("StarterGui"):SetCore("SendNotification", { Title = "偷取完成", Text = "共偷取 " .. tostring(cnt) .. " 个道具", Duration = 3 })
                end)
            end)

            espBtn.MouseButton1Click:Connect(function()
                espEnabled = not espEnabled
                espBtn.Text = espEnabled and "透视：开" or "透视：关"
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "透视", Text = espEnabled and "已打开" or "已关闭", Duration = 3 })
                if espEnabled then for _, p in ipairs(Players:GetPlayers()) do enableESP(p) end else for _, p in ipairs(Players:GetPlayers()) do disableESP(p) end end
            end)

            infiniteJumpBtn.MouseButton1Click:Connect(function()
                InfiniteJumpEnabled = not InfiniteJumpEnabled
                infiniteJumpBtn.Text = InfiniteJumpEnabled and "无限跳：开" or "无限跳：关"
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "无限跳", Text = InfiniteJumpEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

            noclipBtn.MouseButton1Click:Connect(function()
                NoclipEnabled = not NoclipEnabled
                noclipBtn.Text = NoclipEnabled and "穿墙：开" or "穿墙：关"
                if NoclipEnabled then startNoclip() else stopNoclip() end
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "穿墙", Text = NoclipEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

            nightVisionBtn.MouseButton1Click:Connect(function()
                NightVisionEnabled = not NightVisionEnabled
                nightVisionBtn.Text = NightVisionEnabled and "夜视：开" or "夜视：关"
                local Lighting = game:GetService("Lighting")
                if NightVisionEnabled then
                    Lighting.Ambient = Color3.new(1, 1, 1); Lighting.ColorShift_Bottom = Color3.new(1, 1, 1); Lighting.ColorShift_Top = Color3.new(1, 1, 1)
                    Lighting.FogEnd = 100000; Lighting.FogStart = 100000; Lighting.Brightness = 1; Lighting.GlobalShadows = false; Lighting.OutdoorAmbient = Color3.new(1, 1, 1); Lighting.ClockTime = 12
                else
                    Lighting.Ambient = Color3.new(0, 0, 0); Lighting.ColorShift_Bottom = Color3.new(0, 0, 0); Lighting.ColorShift_Top = Color3.new(0, 0, 0)
                    Lighting.FogEnd = 1000; Lighting.FogStart = 0; Lighting.Brightness = 1; Lighting.GlobalShadows = true; Lighting.OutdoorAmbient = Color3.new(0.7, 0.7, 0.7)
                end
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "夜视", Text = NightVisionEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

        elseif i == 3 then
            local function addSemiTransparentButton(page, txt, posX, posY, callback)
                local btn = Instance.new("TextButton")
                btn.Parent = page
                btn.BackgroundColor3 = Color3.new(0, 0, 0)
                btn.BackgroundTransparency = 0.5
                btn.Size = UDim2.new(0.48, 0, 0, 40)
                btn.Position = UDim2.new(0, posX, 0, posY)
                btn.Text = txt
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.TextSize = 14
                btn.AutoButtonColor = false
                btn.ZIndex = 21
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 6); corner.Parent = btn
                if callback then btn.MouseButton1Click:Connect(callback) end
                return btn
            end

            local posX1, posX2 = 4, page.AbsoluteSize.X * 0.52
            local rowHeight = 45

            local autoTranslateBtn = addSemiTransparentButton(page, "自动翻译：关", posX1, 4)
            local antiPushBtn = addSemiTransparentButton(page, "防甩飞：关", posX1, 4 + rowHeight)
            local coordBtn = addSemiTransparentButton(page, "查询坐标传送", posX1, 4 + 2*rowHeight)

            local aimbotBtn = addSemiTransparentButton(page, "自瞄：关", posX1, 4 + 3*rowHeight)
            aimbotBtn.MouseButton1Click:Connect(function()
                AimbotEnabled = not AimbotEnabled
                aimbotBtn.Text = AimbotEnabled and "自瞄：开" or "自瞄：关"
                if AimbotEnabled then
                    local panel = createAimbotPanel()
                    panel.Visible = true
                else
                    AimbotCircle.Visible = false
                    if aimbotPanel then aimbotPanel.Visible = false end
                end
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "自瞄",
                    Text = AimbotEnabled and "已开启，请在面板中调整半径" or "已关闭",
                    Duration = 3,
                })
            end)

            local lockViewBtn = addSemiTransparentButton(page, "锁定视角：关", posX1, 4 + 4*rowHeight)
            lockViewBtn.MouseButton1Click:Connect(function()
                LockViewEnabled = not LockViewEnabled
                lockViewBtn.Text = LockViewEnabled and "锁定视角：开" or "锁定视角：关"
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "锁定视角", Text = LockViewEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

            local teleportNearestBtn = addSemiTransparentButton(page, "传送最近玩家", posX2, 4)
            local followNearestBtn = addSemiTransparentButton(page, "跟随最近玩家：关", posX2, 4 + rowHeight)
            local teleportPlayerBtn = addSemiTransparentButton(page, "传送到指定玩家", posX2, 4 + 2*rowHeight)
            local smoothFollowBtn = addSemiTransparentButton(page, "平滑跟随：关", posX2, 4 + 3*rowHeight)

            followNearestBtn.MouseButton1Click:Connect(function()
                FollowNearestEnabled = not FollowNearestEnabled
                followNearestBtn.Text = FollowNearestEnabled and "跟随最近玩家：开" or "跟随最近玩家：关"
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "跟随最近玩家", Text = FollowNearestEnabled and "已开启" or "已关闭", Duration = 3 })
            end)
            smoothFollowBtn.MouseButton1Click:Connect(function()
                SmoothFollowEnabled = not SmoothFollowEnabled
                smoothFollowBtn.Text = SmoothFollowEnabled and "平滑跟随：开" or "平滑跟随：关"
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "平滑跟随", Text = SmoothFollowEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

            autoTranslateBtn.MouseButton1Click:Connect(function()
                AutoTranslateEnabled = not AutoTranslateEnabled
                autoTranslateBtn.Text = AutoTranslateEnabled and "自动翻译：开" or "自动翻译：关"
                if AutoTranslateEnabled then startAutoTranslate() else stopAutoTranslate() end
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "自动翻译", Text = AutoTranslateEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

            antiPushBtn.MouseButton1Click:Connect(function()
                AntiPushEnabled = not AntiPushEnabled
                antiPushBtn.Text = AntiPushEnabled and "防甩飞：开" or "防甩飞：关"
                if not AntiPushEnabled then
                    local char = LocalPlayer.Character
                    if char then local root = char:FindFirstChild("HumanoidRootPart"); if root then root.CanCollide = true end end
                end
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "防甩飞", Text = AntiPushEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

            coordBtn.MouseButton1Click:Connect(function()
                local panel = createCoordPanel()
                panel.Visible = not panel.Visible
            end)

            teleportNearestBtn.MouseButton1Click:Connect(function()
                local nearest = nil
                local minDist = math.huge
                local myPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position
                if not myPos then return end
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (p.Character.HumanoidRootPart.Position - myPos).Magnitude
                        if dist < minDist then minDist = dist; nearest = p end
                    end
                end
                if nearest and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = nearest.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 3)
                end
            end)

            teleportPlayerBtn.MouseButton1Click:Connect(function() showPlayerSelect() end)

        elseif i == 4 then
            local function addSemiTransparentButton(page, txt, posX, posY, callback)
                local btn = Instance.new("TextButton")
                btn.Parent = page
                btn.BackgroundColor3 = Color3.new(0, 0, 0)
                btn.BackgroundTransparency = 0.5
                btn.Size = UDim2.new(0.48, 0, 0, 40)
                btn.Position = UDim2.new(0, posX, 0, posY)
                btn.Text = txt
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.TextSize = 14
                btn.AutoButtonColor = false
                btn.ZIndex = 21
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 6); corner.Parent = btn
                if callback then btn.MouseButton1Click:Connect(callback) end
                return btn
            end

            addSemiTransparentButton(page, "显示时间", 4, 4, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "显示时间", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://pastebin.com/raw/0zKLyd4W"))() end)
            end)
            addSemiTransparentButton(page, "美化包排行榜第一", page.AbsoluteSize.X * 0.52, 4, function()
                beautifyStats()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "美化包", Text = "数值已修改为999（若游戏支持）", Duration = 3 })
            end)

            local crosshairBtn = addSemiTransparentButton(page, "准星：关", 4, 4 + 45)
            crosshairBtn.MouseButton1Click:Connect(function()
                CrosshairEnabled = not CrosshairEnabled
                crosshairBtn.Text = CrosshairEnabled and "准星：开" or "准星：关"
                CrosshairFrame.Visible = CrosshairEnabled
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "准星", Text = CrosshairEnabled and "已显示" or "已隐藏", Duration = 3 })
            end)
            local crosshairSpinBtn = addSemiTransparentButton(page, "准星旋转：关", page.AbsoluteSize.X * 0.52, 4 + 45)
            crosshairSpinBtn.MouseButton1Click:Connect(function()
                CrosshairSpinEnabled = not CrosshairSpinEnabled
                crosshairSpinBtn.Text = CrosshairSpinEnabled and "准星旋转：开" or "准星旋转：关"
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "准星旋转", Text = CrosshairSpinEnabled and "已开启" or "已关闭", Duration = 3 })
            end)

        elseif i == 5 then
            local function addSemiTransparentButton(page, txt, posX, posY, callback)
                local btn = Instance.new("TextButton")
                btn.Parent = page
                btn.BackgroundColor3 = Color3.new(0, 0, 0)
                btn.BackgroundTransparency = 0.5
                btn.Size = UDim2.new(0.48, 0, 0, 40)
                btn.Position = UDim2.new(0, posX, 0, posY)
                btn.Text = txt
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.TextSize = 14
                btn.AutoButtonColor = false
                btn.ZIndex = 21
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 6); corner.Parent = btn
                if callback then btn.MouseButton1Click:Connect(callback) end
                return btn
            end

            local posX1, posX2 = 4, page.AbsoluteSize.X * 0.52
            local rowHeight = 45

            addSemiTransparentButton(page, "破坏者谜团2", posX1, 4, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "破坏者谜团2", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/PHZMT.NB"))() end)
            end)
            addSemiTransparentButton(page, "吃吃世界", posX2, 4, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "吃吃世界", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/CCSJ.NB"))() end)
            end)
            addSemiTransparentButton(page, "在超市生活一周", posX1, 4 + rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "在超市生活一周", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/ZCSSHYZ.NB"))() end)
            end)
            addSemiTransparentButton(page, "亡命速递", posX2, 4 + rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "亡命速递", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/WMSD.NB"))() end)
            end)
            addSemiTransparentButton(page, "巨剑骑士", posX1, 4 + 2*rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "巨剑骑士", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/JJQS.NB"))() end)
            end)
            addSemiTransparentButton(page, "doors", posX2, 4 + 2*rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "doors", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/DOORS.NB"))() end)
            end)
            addSemiTransparentButton(page, "盲射", posX1, 4 + 3*rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "盲射", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/MS.NB"))() end)
            end)
            addSemiTransparentButton(page, "找到按钮", posX2, 4 + 3*rowHeight, function()
                game:GetService("StarterGui"):SetCore("SendNotification", { Title = "找到按钮", Text = "正在加载中...", Duration = 5 })
                task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/ZDNN.NB"))() end)
            end)
        end

        cat.MouseButton1Click:Connect(function()
            if selected then
                selected.BackgroundTransparency = 0.8; selected.BackgroundColor3 = Color3.fromRGB(25,25,25)
            end
            cat.BackgroundTransparency = 0.5; cat.BackgroundColor3 = Color3.fromRGB(70,70,70)
            selected = cat
            for _,p in pairs(pages) do p.Visible = false end
            if speedPanel then speedPanel.Visible = false end
            if coordPanel then coordPanel.Visible = false end
            if aimbotPanel then aimbotPanel.Visible = false end
            page.Visible = true
        end)
        categories[i] = cat; pages[i] = page
    end

    for i = 1, 5 do AddCat(i) end

    task.defer(function() if categories[1] then categories[1]:MouseButton1Click() end end)

    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.ZIndex = 15
    local TopUICorner = Instance.new("UICorner"); TopUICorner.CornerRadius = UDim.new(0, 10); TopUICorner.Parent = TopBar
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.Font = Enum.Font.ArialBold
    Title.Text = "恐脚本--通用" .. string.rep(" ", 6) .. "您已执行 " .. count .. " 次，谢谢您的支持！"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 16

    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Parent = TopBar
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MinimizeBtn.Size = UDim2.new(0, 36, 0, 32)
    MinimizeBtn.Position = UDim2.new(1, -86, 0, 4)
    MinimizeBtn.Font = Enum.Font.ArialBold
    MinimizeBtn.Text = "—"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 20
    MinimizeBtn.ZIndex = 17
    local MinCorner = Instance.new("UICorner"); MinCorner.CornerRadius = UDim.new(0, 6); MinCorner.Parent = MinimizeBtn

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    CloseBtn.Size = UDim2.new(0, 36, 0, 32)
    CloseBtn.Position = UDim2.new(1, -46, 0, 4)
    CloseBtn.Font = Enum.Font.ArialBold
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.new(1,1,1)
    CloseBtn.TextSize = 20
    CloseBtn.ZIndex = 17
    local CloseCorner = Instance.new("UICorner"); CloseCorner.CornerRadius = UDim.new(0, 6); CloseCorner.Parent = CloseBtn

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = ScreenGui
    ToggleBtn.BackgroundColor3 = Color3.new(0, 0, 0)
    ToggleBtn.BackgroundTransparency = 0.5
    ToggleBtn.Position = UDim2.new(0.8, 0, 0.3, 0)
    ToggleBtn.Size = UDim2.new(0, 140, 0, 50)
    ToggleBtn.Font = Enum.Font.ArialBold
    ToggleBtn.Text = "打开菜单"
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 20
    ToggleBtn.ZIndex = 100
    local ToggleCorner = Instance.new("UICorner"); ToggleCorner.CornerRadius = UDim.new(0, 8); ToggleCorner.Parent = ToggleBtn

    local dragging, dragInput, dragStartPos, btnStartPos = false, nil, nil, nil
    ToggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if not dragging and not dragInput then dragging = true; dragInput = input; dragStartPos = input.Position; btnStartPos = ToggleBtn.Position end
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStartPos
            ToggleBtn.Position = UDim2.new(btnStartPos.X.Scale, btnStartPos.X.Offset + delta.X, btnStartPos.Y.Scale, btnStartPos.Y.Offset + delta.Y)
        end
    end)
    ToggleBtn.InputEnded:Connect(function(input) if input == dragInput then dragging = false; dragInput = nil end end)
    ToggleBtn.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
        ToggleBtn.Text = Main.Visible and "关闭菜单" or "打开菜单"
    end)
    MinimizeBtn.MouseButton1Click:Connect(function() Main.Visible = false; ToggleBtn.Text = "打开菜单" end)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local beans = {"🤓", "😎", "🥳"}
    local weight = {1, 1, 5}
    local function GetRandomBean()
        local total = 0; for _,v in pairs(weight) do total += v end
        local r = math.random(1, total); local curr = 0
        for i = 1, #weight do curr += weight[i]; if r <= curr then return beans[i] end end
        return "🥳"
    end
    local function SpawnBean()
        if #BeanBack:GetChildren() > 25 then return end
        local label = Instance.new("TextLabel")
        label.Parent = BeanBack; label.BackgroundTransparency = 1
        label.Size = UDim2.new(0, 22, 0, 22); label.Text = GetRandomBean(); label.TextSize = 18; label.Font = Enum.Font.Unknown; label.ZIndex = 1
        local x = math.random(0, Main.AbsoluteSize.X - 22)
        label.Position = UDim2.new(0, x, 0, -22)
        local speed = math.random(30, 50); local drift = math.random(-15, 15); local alpha = 0
        local conn; conn = RunService.Heartbeat:Connect(function(dt)
            if not label or not label.Parent then conn:Disconnect() return end
            if not Main.Visible then return end
            alpha += dt; local newY = alpha * speed - 22
            if newY > Main.AbsoluteSize.Y then conn:Disconnect(); label:Destroy() return end
            label.Position = UDim2.new(0, x + math.sin(alpha * 1.2) * drift, 0, newY)
        end)
    end
    task.spawn(function()
        while task.wait(math.random(150, 300)/1000) do
            if ScreenGui and ScreenGui.Parent then SpawnBean() else break end
        end
    end)
end
