game:GetService("StarterGui"):SetCore("SendNotification", { Title = "在超市生存一周脚本", Text = "不知名创作者创造\n恐拜大帝修复", Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150" })
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
game:GetService("StarterGui"):SetCore("SendNotification", { Title = "错误", Text = "UI 库加载失败，请检查网络或脚本资源", Duration = 5, })
return
end
local function Notify(msg)
Library:Notify(msg, 3)
end
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
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
main.Parent = LocalPlayer:WaitForChild("PlayerGui")
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
up.Text = "上升"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14
down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "下落"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14
onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "飞"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "恐拜大帝"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
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
plus.TextSize = 14
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
speed.TextSize = 14
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
mine.TextSize = 14
mine.TextWrapped = true
closebutton.Name = "Close"
closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = Enum.Font.SourceSans
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27)
mini.Name = "minimize"
mini.Parent = Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = Enum.Font.SourceSans
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)
mini2.Name = "minimize2"
mini2.Parent = Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = Enum.Font.SourceSans
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, 0, 30)
mini2.Visible = false
local speeds = 1
local chr = LocalPlayer.Character
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
chr.HumanoidRootPart.CFrame += Vector3.new(0, 3, 0)
end
end)
down.MouseButton1Click:Connect(function()
if chr and chr:FindFirstChild("HumanoidRootPart") then
chr.HumanoidRootPart.CFrame += Vector3.new(0, -3, 0)
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
speeds += 1
speed.Text = tostring(speeds)
end)
mine.MouseButton1Click:Connect(function()
if speeds > 1 then
speeds -= 1
speed.Text = tostring(speeds)
else
speed.Text = "错误"
task.wait(0.2)
speed.Text = "1"
end
end)
LocalPlayer.CharacterAdded:Connect(function(newChar)
chr = newChar
hum = chr:FindFirstChildWhichIsA("Humanoid")
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
for _, v in pairs(hum:GetPlayingAnimationTracks()) do
v:AdjustSpeed(0)
end
end
task.spawn(function()
while nowe and chr and hum do
RunService.Heartbeat:Wait()
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection * speeds)
end
end
end)
if hum.RigType == Enum.HumanoidRigType.R6 then
local plr = LocalPlayer
local torso = plr.Character.Torso
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.CFrame = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.Velocity = Vector3.new(0, 0, 0)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe then
plr.Character.Humanoid.PlatformStand = true
end
while nowe and plr.Character.Humanoid.Health > 0 do
RunService.RenderStepped:Wait()
bg.CFrame = workspace.CurrentCamera.CoordinateFrame
end
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
plr.Character.Animate.Disabled = false
else
local plr = LocalPlayer
local UpperTorso = plr.Character.UpperTorso
local bg = Instance.new("BodyGyro", UpperTorso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.CFrame = UpperTorso.CFrame
local bv = Instance.new("BodyVelocity", UpperTorso)
bv.Velocity = Vector3.new(0, 0, 0)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
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
Notify("飞行脚本加载失败：" .. tostring(err))
end
end
local nightVisionActive = false
task.spawn(function()
while true do
if nightVisionActive then
pcall(function()
game.Lighting.Brightness = 2
end)
end
task.wait(0.1)
end
end)
local function toggleNightVision()
nightVisionActive = not nightVisionActive
if not nightVisionActive then
pcall(function()
game.Lighting.Brightness = 1
end)
end
Notify("夜视" .. (nightVisionActive and "已开启" or "已关闭"))
end
local states = {
food = false,
flashlight = false,
melee = false,
gun = false,
health = false,
reload = false,
shoot = false,
superGun = false,
infiniteStats = false,
nightHide = false,
infiniteJump = false
}
local function autoPickup(itemType)
local itemsFolder = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Util") and Workspace.Map.Util:FindFirstChild("Items")
if not itemsFolder then
return
end
for _, v in ipairs(itemsFolder:GetChildren()) do
pcall(function()
if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("ItemType") and v.ToolStats.ItemType.Value == itemType then
local remote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("RequestPickupItem")
if remote then
remote:FireServer(v)
end
task.wait(0.1)
end
end)
end
end
task.spawn(function()
while true do
if states.food then
autoPickup("Food")
end
if states.flashlight then
autoPickup("Flashlight")
end
if states.melee then
autoPickup("Melee")
end
if states.gun then
autoPickup("Gun")
end
if states.health then
autoPickup("Health")
end
task.wait(0.3)
end
end)
task.spawn(function()
while true do
if states.reload then
local char = LocalPlayer.Character
if char then
local weapon = char:FindFirstChildWhichIsA("Tool")
if weapon and weapon:FindFirstChild("ToolStats") and weapon.ToolStats:FindFirstChild("Ammo") then
local reloadRemote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Weapon") and ReplicatedStorage.Remotes.Weapon:FindFirstChild("GunReloaded")
if reloadRemote then
reloadRemote:FireServer(weapon, 1)
end
end
end
end
task.wait(0.5)
end
end)
local lastShoot = 0
task.spawn(function()
while true do
if states.shoot and tick() - lastShoot > 0.1 then
local char = LocalPlayer.Character
if char then
local weapon = char:FindFirstChildWhichIsA("Tool")
if weapon and weapon:FindFirstChild("ToolStats") and weapon.ToolStats:FindFirstChild("Ammo") then
local enemies = Workspace:FindFirstChild("Enemies")
if enemies then
local closest, minDist = nil, math.huge
for _, e in ipairs(enemies:GetChildren()) do
if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("Head") then
local dist = (e.Head.Position - char:GetPivot().Position).Magnitude
if dist < minDist and dist < 100 then
minDist = dist
closest = e
end
end
end
if closest then
local BulletsPerShot = weapon.ToolStats:FindFirstChild("BulletsPerShot") and weapon.ToolStats.BulletsPerShot.Value or 1
local DirectionTbl = {}
for i = 1, BulletsPerShot do
table.insert(DirectionTbl, (closest.Head.Position - char:GetPivot().Position).Unit)
end
local args = {
[1] = {
FiringPlayer = LocalPlayer,
FiredTime = os.time(),
FiringPlayerUserId = LocalPlayer.UserId,
Origin = char:GetPivot().Position,
UID = LocalPlayer.UserId .. "_" .. tostring(tick()),
WeaponInstance = weapon,
ThisBulletProperties = {
BulletSpread = weapon.ToolStats:FindFirstChild("BulletSpread") and weapon.ToolStats.BulletSpread.Value or 0,
BulletsPerShot = BulletsPerShot,
BulletPenetration = weapon.ToolStats:FindFirstChild("BulletPenetration") and weapon.ToolStats.BulletPenetration.Value or 1,
BulletSpeed = weapon.ToolStats:FindFirstChild("BulletSpeed") and weapon.ToolStats.BulletSpeed.Value or 1000,
FireSound = weapon.ToolStats:FindFirstChild("FireSound") and weapon.ToolStats.FireSound.Value or "",
BulletSize = weapon.ToolStats:FindFirstChild("BulletSize") and weapon.ToolStats.BulletSize.Value or 1
},
DirectionTbl = DirectionTbl
}
}
local gunFiredRemote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Weapon") and ReplicatedStorage.Remotes.Weapon:FindFirstChild("GunFired")
if gunFiredRemote then
gunFiredRemote:FireServer(unpack(args))
lastShoot = tick()
end
end
end
end
end
end
task.wait(0.05)
end
end)
task.spawn(function()
while true do
if states.superGun then
for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do
pcall(function()
if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("Ammo") then
if v.ToolStats:FindFirstChild("ReloadTime") then
v.ToolStats.ReloadTime.Value = 0
end
if v.ToolStats:FindFirstChild("FireDelay") then
v.ToolStats.FireDelay.Value = 0
end
if v.ToolStats:FindFirstChild("Ammo") then
v.ToolStats.Ammo.Value = 999999
end
if v.ToolStats:FindFirstChild("Damage") then
v.ToolStats.Damage.Value = 999999
end
end
end)
end
end
task.wait(0.5)
end
end)
task.spawn(function()
while true do
if states.infiniteStats then
local char = LocalPlayer.Character
if char and char:FindFirstChild("CharacterData") then
local data = char.CharacterData
pcall(function()
if data:FindFirstChild("MaxStamina") then
data.MaxStamina.Value = math.huge
end
if data:FindFirstChild("MaxEnergy") then
data.MaxEnergy.Value = math.huge
end
if data:FindFirstChild("Energy") then
data.Energy.Value = data.MaxEnergy.Value
end
if data:FindFirstChild("Stamina") then
data.Stamina.Value = data.MaxStamina.Value
end
end)
end
end
task.wait(0.5)
end
end)
local safePos = CFrame.new(306.18927001953125, 36.67450714111328, -519.2435913085938)
local isHiding = false
task.spawn(function()
while true do
if states.nightHide and not isHiding then
local timeRemote = ReplicatedStorage:FindFirstChild("GameInfo") and ReplicatedStorage.GameInfo:FindFirstChild("TimeOfDay")
if timeRemote and timeRemote.Value == "Night" then
isHiding = true
local char = LocalPlayer.Character
if char then
local hrp = char:FindFirstChild("HumanoidRootPart")
if hrp then
local originalPos = hrp.CFrame
hrp.CFrame = safePos
hrp.Anchored = true
repeat
task.wait(0.5)
until not timeRemote or timeRemote.Value ~= "Night"
hrp.Anchored = false
hrp.CFrame = originalPos
end
end
isHiding = false
end
end
task.wait(1)
end
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if states.infiniteJump and input.KeyCode == Enum.KeyCode.Space and not gameProcessed then
local char = LocalPlayer.Character
if char then
local humanoid = char:FindFirstChild("Humanoid")
local hrp = char:FindFirstChild("HumanoidRootPart")
if humanoid and hrp and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
local jumpPower = humanoid.JumpPower or 50
hrp.Velocity = Vector3.new(hrp.Velocity.X, jumpPower, hrp.Velocity.Z)
end
end
end
end)
local desiredWalkSpeed = 16
task.spawn(function()
while true do
task.wait(0.1)
local char = LocalPlayer.Character
if char then
local humanoid = char:FindFirstChild("Humanoid")
if humanoid then
humanoid.WalkSpeed = desiredWalkSpeed
end
end
end
end)
local Window = Library:CreateWindow({
Title = "在超市生存一周脚本",
Footer = "By 恐拜大帝",
Icon = 131153193945220,
NotifySide = "Right",
ShowCustomCursor = true,
})
local Tabs = {
Main = Window:AddTab("主要功能", "star"),
Other = Window:AddTab("其他", "settings"),
}
local function addToggleWithNotify(group, flag, text, stateKey)
group:AddToggle(flag, {
Text = text,
Default = false,
Callback = function(Value)
states[stateKey] = Value
Notify(text .. (Value and "已开启" or "已关闭"))
end
})
end
local LeftGroup = Tabs.Main:AddLeftGroupbox("收集与战斗")
addToggleWithNotify(LeftGroup, 'AutoFood', '自动收集食物', 'food')
addToggleWithNotify(LeftGroup, 'AutoFlashlight', '自动收集手电筒', 'flashlight')
addToggleWithNotify(LeftGroup, 'AutoMelee', '自动收集近战武器', 'melee')
addToggleWithNotify(LeftGroup, 'AutoGun', '自动收集枪', 'gun')
addToggleWithNotify(LeftGroup, 'AutoHealth', '自动收集药品', 'health')
addToggleWithNotify(LeftGroup, 'AutoReload', '自动装弹', 'reload')
addToggleWithNotify(LeftGroup, 'AutoShoot', '自动开枪', 'shoot')
addToggleWithNotify(LeftGroup, 'SuperGun', '超级枪', 'superGun')
addToggleWithNotify(LeftGroup, 'InfiniteStats', '无限体力/饥饿', 'infiniteStats')
addToggleWithNotify(LeftGroup, 'NightHide', '夜晚自动躲避', 'nightHide')
local RightGroup = Tabs.Main:AddRightGroupbox("角色增强")
RightGroup:AddToggle('NightVision', {
Text = '夜视',
Default = false,
Callback = function(Value)
if nightVisionActive ~= Value then
toggleNightVision()
end
end
})
RightGroup:AddToggle('InfiniteJump', {
Text = '无限跳（空中再次跳跃）',
Default = false,
Callback = function(Value)
states.infiniteJump = Value
Notify("无限跳" .. (Value and "已开启" or "已关闭"))
end
})
RightGroup:AddSlider('WalkSpeed', {
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
if humanoid then
humanoid.WalkSpeed = Value
end
end
Notify("移动速度已设为 " .. Value)
end
})
RightGroup:AddButton({
Text = '召唤飞行脚本',
Func = loadFlightScript,
DoubleClick = false
})
local SetLeft = Tabs.Other:AddLeftGroupbox("杂项")
SetLeft:AddLabel("不知名创作者创造 | 恐拜大帝修复")
SetLeft:AddLabel("QQ：3999698324", true)
SetLeft:AddButton({
Text = '卸载脚本',
Func = function()
Library:Unload()
end
})
if ThemeManager then
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("SupermarketSurvival")
ThemeManager:ApplyToTab(Tabs.Other)
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("SupermarketSurvival")
SaveManager:BuildConfigSection(Tabs.Other)
end
Notify("在超市生存一周脚本已就绪")