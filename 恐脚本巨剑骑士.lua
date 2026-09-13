game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "巨剑骑士脚本", Text = "创作者：恐拜大帝", Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150" })
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
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "错误", Text = "UI库加载失败", Duration = 5 })
return
end
local function Notify(msg)
Library:Notify(msg, 3)
end
local function sendNotification(title, text)
task.spawn(function()
local success = false
local retryTimes = 0
while not success and retryTimes < 5 do
retryTimes += 1
success = pcall(function()
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = title, Text = text, Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150", Duration = 2 })
end)
if not success then
task.wait(0.2)
end
end
end)
end
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
speeds = 1
local speaker = game:GetService("Players").LocalPlayer
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
nowe = false
sendNotification("飞行脚本", "创作者：恐拜大帝")
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
onof.Text = nowe and "飞" or "飞"
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
for i,v in next,hum:GetPlayingAnimationTracks() do
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
if success then
sendNotification("功能召唤", "飞行脚本已成功加载")
else
sendNotification("加载失败", "飞行脚本出错："..tostring(err))
end
end
local function clickButton(btn)
if not btn or not btn.Parent then
return
end
pcall(function()
if btn.Visible then
btn.MouseButton1Down:Fire(Vector2.new(0,0), Vector2.new(0,0))
task.wait()
btn.MouseButton1Up:Fire(Vector2.new(0,0), Vector2.new(0,0))
task.wait()
btn.MouseButton1Click:Fire()
end
end)
end
local function findButtons(keywords)
local result = {}
for _, item in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
if item:IsA("TextButton") or item:IsA("ImageButton") then
local btnName = string.lower(item.Name)
local btnText = string.lower(item.Text or "")
for _, kw in pairs(keywords) do
if string.find(btnName, kw, 1, true) or string.find(btnText, kw, 1, true) then
table.insert(result, item)
break
end
end
end
end
return result
end
local healthKeywords = { "生命","health","hp","最大生命","maxhealth","血","血量","HP","血量上限","生命上限","+生命","生命+", "vida","sangue","жизнь","vie","leben","salute","vitalité","здоровье"," الحياة","ชีวิต","건강","体力","スタミナ" }
local damageKeywords = { "攻击","damage","伤害","攻击力","伤害力","ATK","攻击上限","伤害上限","+攻击","攻击+", "damage","attaque","angriff","attacco","danno","дамаг","ataque","공격","攻击力","傷害","ダメージ","ความเสียหาย" }
local criticalKeywords = { "暴击","critical","crit","暴击率","爆伤","暴击伤害","+暴击","暴击+", "critique","kritisch","critico","crítico","крит","치명타","致命","クリティカル","วิกฤต" }
local speedKeywords = { "移速","speed","速度","移动速度","跑速","movespeed","移动力","速度上限","+移速","移速+", "vitesse","geschwindigkeit","velocità","velocidad","скорость","속도","速さ","ความเร็ว" }
getgenv().antiAfk = false
getgenv().autoHealth = false
getgenv().autoDamage = false
getgenv().autoCritical = false
getgenv().autoSpeed = false
task.spawn(function()
while true do
if getgenv().autoHealth then
for _, btn in pairs(findButtons(healthKeywords)) do
clickButton(btn)
end
end
if getgenv().autoDamage then
for _, btn in pairs(findButtons(damageKeywords)) do
clickButton(btn)
end
end
if getgenv().autoCritical then
for _, btn in pairs(findButtons(criticalKeywords)) do
clickButton(btn)
end
end
if getgenv().autoSpeed then
for _, btn in pairs(findButtons(speedKeywords)) do
clickButton(btn)
end
end
task.wait()
end
end)
spawn(function()
while task.wait(60) do
if getgenv().antiAfk then
game:GetService("Players").LocalPlayer.Idled = false
end
end
end)
local WorldConfig = {
[1] = { Name = "皇城", CFrame = CFrame.new(0, 24.69, 167.62) },
[2] = { Name = "前哨站", CFrame = CFrame.new(12090.74, 7.75, 125.76) },
[3] = { Name = "部落", CFrame = CFrame.new(-12904.61, 4.27, 172.02) },
[4] = { Name = "冰川峡谷", CFrame = CFrame.new(-26069.89, 4.34, 167.54) },
[5] = { Name = "黑暗堡垒", CFrame = CFrame.new(23111.76, -16.92, 57.33) },
[6] = { Name = "桃园", CFrame = CFrame.new(32178.70, 7.75, 97.84) },
[7] = { Name = "乱葬岗", CFrame = CFrame.new(-38958.29, 4.45, 162.08) },
[8] = { Name = "地狱", CFrame = CFrame.new(-50303.39, 5.30, 109.30) },
[9] = { Name = "天堂", CFrame = CFrame.new(36673.71, 19.49, 147.81) },
[10] = { Name = "沙堡", CFrame = CFrame.new(-12898.58, 5.47, 19520.76) },
}
local teleportToggleBtn = nil
local teleportMenuGui = nil
local function CloseTeleportMenu()
if teleportMenuGui then
teleportMenuGui:Destroy()
teleportMenuGui = nil
end
end
local function CreateTeleportMenu()
if teleportMenuGui then
return
end
teleportMenuGui = Instance.new("ScreenGui")
teleportMenuGui.Name = "TeleportMenuGui"
teleportMenuGui.Parent = game.Players.LocalPlayer.PlayerGui
teleportMenuGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local menuFrame = Instance.new("Frame")
menuFrame.Parent = teleportMenuGui
menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuFrame.BackgroundTransparency = 0.15
menuFrame.BorderSizePixel = 0
menuFrame.Size = UDim2.new(0, 400, 0, 500)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
menuFrame.AnchorPoint = Vector2.new(0, 0)
menuFrame.Active = true
menuFrame.Draggable = true
local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 12)
menuCorner.Parent = menuFrame
local menuStroke = Instance.new("UIStroke")
menuStroke.Thickness = 2
menuStroke.Color = Color3.fromRGB(100, 100, 100)
menuStroke.Parent = menuFrame
local titleBar = Instance.new("Frame")
titleBar.Parent = menuFrame
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = titleBar
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.Text = "世界传送"
titleLabel.TextColor3 = Color3.new(1,1,1)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.ArialBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
local closeMenuBtn = Instance.new("TextButton")
closeMenuBtn.Parent = titleBar
closeMenuBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeMenuBtn.Size = UDim2.new(0, 30, 0, 30)
closeMenuBtn.Position = UDim2.new(1, -40, 0, 5)
closeMenuBtn.Text = "X"
closeMenuBtn.TextColor3 = Color3.new(1,1,1)
closeMenuBtn.TextSize = 18
closeMenuBtn.Font = Enum.Font.ArialBold
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeMenuBtn
closeMenuBtn.MouseButton1Click:Connect(CloseTeleportMenu)
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = menuFrame
scrollFrame.BackgroundTransparency = 1
scrollFrame.Size = UDim2.new(1, -20, 1, -60)
scrollFrame.Position = UDim2.new(0, 10, 0, 50)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 8
scrollFrame.BorderSizePixel = 0
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollFrame
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 8)
for i = 1, 20 do
local btn = Instance.new("TextButton")
btn.Parent = scrollFrame
btn.Size = UDim2.new(1, -20, 0, 45)
btn.TextColor3 = Color3.new(1,1,1)
btn.TextSize = 16
btn.Font = Enum.Font.ArialBold
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = btn
local config = WorldConfig[i]
if config then
btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
btn.Text = config.Name .. " (" .. i .. ")"
btn.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
char.HumanoidRootPart.CFrame = config.CFrame
sendNotification("传送", "已传送至 " .. config.Name)
else
sendNotification("传送失败", "角色未准备好")
end
CloseTeleportMenu()
end)
else
btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
btn.Text = "世界 " .. i .. " (未探索)"
btn.MouseButton1Click:Connect(function()
sendNotification("未探索", "该地图作者都还没到（刚回坑）")
end)
end
end
local function UpdateCanvas()
local totalHeight = 0
for _, btn in pairs(scrollFrame:GetChildren()) do
if btn:IsA("TextButton") then
totalHeight = totalHeight + btn.AbsoluteSize.Y + uiListLayout.Padding.Offset
end
end
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight + 10)
end
task.wait(0.1)
UpdateCanvas()
scrollFrame.ChildAdded:Connect(UpdateCanvas)
scrollFrame.ChildRemoved:Connect(UpdateCanvas)
end
local function CreateTeleportToggleButton()
if teleportToggleBtn and teleportToggleBtn.Parent then
teleportToggleBtn:Destroy()
end
local toggleScreenGui = Instance.new("ScreenGui")
toggleScreenGui.Name = "TeleportToggleGui"
toggleScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
toggleScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
teleportToggleBtn = Instance.new("TextButton")
teleportToggleBtn.Parent = toggleScreenGui
teleportToggleBtn.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
teleportToggleBtn.Size = UDim2.new(0, 140, 0, 50)
teleportToggleBtn.Position = UDim2.new(0.85, 0, 0.5, 0)
teleportToggleBtn.Text = "传送菜单"
teleportToggleBtn.TextColor3 = Color3.new(1,1,1)
teleportToggleBtn.TextSize = 18
teleportToggleBtn.Font = Enum.Font.ArialBold
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = teleportToggleBtn
local dragging = false
local dragInput = nil
local dragStartPos = nil
local btnStartPos = nil
teleportToggleBtn.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
if not dragging and not dragInput then
dragging = true
dragInput = input
dragStartPos = input.Position
btnStartPos = teleportToggleBtn.Position
end
end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
if dragging and input == dragInput then
local delta = input.Position - dragStartPos
teleportToggleBtn.Position = UDim2.new(
btnStartPos.X.Scale, btnStartPos.X.Offset + delta.X,
btnStartPos.Y.Scale, btnStartPos.Y.Offset + delta.Y
)
end
end)
teleportToggleBtn.InputEnded:Connect(function(input)
if input == dragInput then
dragging = false
dragInput = nil
end
end)
teleportToggleBtn.MouseButton1Click:Connect(function()
if teleportMenuGui then
CloseTeleportMenu()
else
CreateTeleportMenu()
end
end)
end
local desiredWalkSpeed = 16
task.spawn(function()
while true do
task.wait(0.1)
local char = game.Players.LocalPlayer.Character
if char then
local humanoid = char:FindFirstChild("Humanoid")
if humanoid and humanoid.Health > 0 then
humanoid.WalkSpeed = desiredWalkSpeed
end
end
end
end)
local Window = Library:CreateWindow({
Title = "巨剑骑士脚本",
Footer = "By 恐拜大帝 | QQ:3999698324",
Icon = 131153193945220,
NotifySide = "Right",
ShowCustomCursor = true,
})
local Tabs = {
Notify = Window:AddTab("通知", "info"),
Main = Window:AddTab("主要", "settings"),
Secondary = Window:AddTab("次要", "map"),
Auto = Window:AddTab("自动化", "star"),
}
Tabs.Notify:AddLeftGroupbox("作者信息"):AddLabel("恐拜大帝 巨剑骑士专用脚本")
Tabs.Notify:AddLeftGroupbox("联系方式"):AddLabel("QQ：3999698324")
Tabs.Notify:AddLeftGroupbox("状态"):AddLabel("脚本持续更新中", true)
local mainGroup = Tabs.Main:AddLeftGroupbox("移动速度")
mainGroup:AddSlider("WalkSpeed", {
Text = "移动速度 (防回拉)",
Default = 16,
Min = 16,
Max = 100,
Rounding = 0,
Suffix = " studs",
Callback = function(val)
desiredWalkSpeed = val
local char = game.Players.LocalPlayer.Character
if char then
local humanoid = char:FindFirstChild("Humanoid")
if humanoid then
humanoid.WalkSpeed = val
end
end
Notify("速度已设为 " .. val)
end
})
local secGroup = Tabs.Secondary:AddLeftGroupbox("工具")
secGroup:AddButton({
Text = "召唤飞行脚本",
Func = loadFlightScript,
DoubleClick = false
})
secGroup:AddButton({
Text = "召唤传送按钮",
Func = function()
CreateTeleportToggleButton()
Notify("紫色传送按钮已出现在屏幕右中央")
end,
DoubleClick = false
})
local autoGroup = Tabs.Auto:AddLeftGroupbox("自动功能")
autoGroup:AddToggle("Afk", {
Text = "防挂机",
Default = false,
Callback = function(v)
getgenv().antiAfk = v
Notify("防挂机: "..(v and "开启" or "关闭"))
end
})
autoGroup:AddToggle("Health", {
Text = "自动生命",
Default = false,
Callback = function(v)
getgenv().autoHealth = v
Notify("自动生命: "..(v and "开启" or "关闭"))
end
})
autoGroup:AddToggle("Damage", {
Text = "自动攻击",
Default = false,
Callback = function(v)
getgenv().autoDamage = v
Notify("自动攻击: "..(v and "开启" or "关闭"))
end
})
autoGroup:AddToggle("Critical", {
Text = "自动暴击",
Default = false,
Callback = function(v)
getgenv().autoCritical = v
Notify("自动暴击: "..(v and "开启" or "关闭"))
end
})
autoGroup:AddToggle("Speed", {
Text = "自动移速",
Default = false,
Callback = function(v)
getgenv().autoSpeed = v
Notify("自动移速: "..(v and "开启" or "关闭"))
end
})
local controlGroup = Tabs.Auto:AddRightGroupbox("一键控制")
controlGroup:AddButton({
Text = "一键启动所有功能",
Func = function()
getgenv().antiAfk = true
getgenv().autoHealth = true
getgenv().autoDamage = true
getgenv().autoCritical = true
getgenv().autoSpeed = true
Notify("所有功能已启动")
end,
DoubleClick = false
})
controlGroup:AddButton({
Text = "一键关闭所有功能",
Func = function()
getgenv().antiAfk = false
getgenv().autoHealth = false
getgenv().autoDamage = false
getgenv().autoCritical = false
getgenv().autoSpeed = false
Notify("所有功能已关闭")
end,
DoubleClick = false
})
if ThemeManager then
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("GiantSwordKnight")
ThemeManager:ApplyToTab(Tabs.Notify)
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("GiantSwordKnight")
SaveManager:BuildConfigSection(Tabs.Notify)
end
Notify("巨剑骑士脚本已就绪")