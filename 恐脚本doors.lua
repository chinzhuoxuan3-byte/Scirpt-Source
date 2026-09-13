game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "doors脚本", Text = "作者：恐拜大帝\nQQ：3999698324\n持续更新中，敬请关注", Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150" })
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local function Notify(msg)
if Library then
pcall(function()
Library:Notify(msg,3)
end)
else
game:GetService("StarterGui"):SetCore("SendNotification",{Title="",Text=msg,Duration=2})
end
end
local repo = 'https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/'
local function safeLoad(url)
local s,r = pcall(function()
return loadstring(game:HttpGet(url))()
end)
if not s then
return nil
end
return r
end
local Library, ThemeManager, SaveManager = safeLoad(repo..'Library.lua'), safeLoad(repo..'addons/ThemeManager.lua'), safeLoad(repo..'addons/SaveManager.lua')
local desiredWalkSpeed = 16
task.spawn(function()
while true do
task.wait(0.1)
local char = LocalPlayer.Character
if char and char:FindFirstChild("Humanoid") then
char.Humanoid.WalkSpeed = desiredWalkSpeed
end
end
end)
local interactRange = 15
local espConnections = {}
local function clearESPGroup(name)
if espConnections[name] then
for _,v in ipairs(espConnections[name]) do
pcall(function()
if typeof(v)=="RBXScriptConnection" then
v:Disconnect()
elseif v:IsA("Highlight") then
v:Destroy()
end
end)
end
espConnections[name] = nil
end
end
local function enableESP(name,filterFunc,fillColor,outlineColor)
clearESPGroup(name)
local group = {}
local HighlightColor = fillColor or Color3.fromRGB(255,255,255)
local OutlineColor = outlineColor or HighlightColor
local function add(obj)
if not obj:IsA("Model") and not obj:IsA("Tool") then
return
end
if not filterFunc(obj) then
return
end
local h = Instance.new("Highlight")
h.Adornee = obj
h.FillColor = HighlightColor
h.OutlineColor = OutlineColor
h.FillTransparency = 0.5
h.Parent = obj
table.insert(group,h)
end
for _,o in ipairs(Workspace:GetDescendants()) do
add(o)
end
local conn = Workspace.DescendantAdded:Connect(add)
table.insert(group,conn)
espConnections[name] = group
end
local function disableESP(name)
clearESPGroup(name)
end
local doorNames = {
["Door"]=true
}
local fakeDoorNames = {
["DupeDoor"]=true
}
local monsterNames = {
["Rush"]=true,
["Ambush"]=true,
["Seek"]=true,
["Figure"]=true,
["Eyes"]=true,
["Screech"]=true,
["Halt"]=true,
["Dupe"]=true,
["Jack"]=true,
["Hide"]=true,
["Timothy"]=true,
["Window"]=true
}
local itemNames = {
["Flashlight"]=true,
["Lighter"]=true,
["Lockpick"]=true,
["Vitamins"]=true,
["Crucifix"]=true,
["Candle"]=true,
["Shears"]=true,
["Bandage"]=true,
["SkeletonKey"]=true,
["Gold"]=true,
["Key"]=true,
["Shakelight"]=true,
["Battery"]=true,
["Glowstick"]=true,
["Herb of Viridis"]=true,
["Scanner"]=true,
["LibraryBook"]=true,
["RoomKey"]=true,
["Bandage Pack"]=true,
["Starlight Bottle"]=true,
["Aloe"]=true
}
local function EnableDoorESP()
enableESP("door",function(o)
return o:IsA("Model") and doorNames[o.Name]
end, Color3.fromRGB(0,255,0))
end
local function DisableDoorESP()
disableESP("door")
end
local function EnableFakeDoorESP()
enableESP("fakedoor",function(o)
return o:IsA("Model") and fakeDoorNames[o.Name]
end, Color3.fromRGB(255,0,0))
end
local function DisableFakeDoorESP()
disableESP("fakedoor")
end
local function EnableMonsterESP()
enableESP("monster",function(o)
return o:IsA("Model") and monsterNames[o.Name]
end, Color3.fromRGB(128,0,128))
end
local function DisableMonsterESP()
disableESP("monster")
end
local function EnableItemESP()
enableESP("item",function(o)
return (o:IsA("Tool") or o:IsA("Model")) and itemNames[o.Name]
end, Color3.fromRGB(0,0,255))
end
local function DisableItemESP()
disableESP("item")
end
local loops = {}
local function toggleLoop(name,active,func)
if loops[name] then
loops[name]:Disconnect()
loops[name]=nil
end
if active then
loops[name] = RunService.Heartbeat:Connect(func)
end
end
local function autoPickupItems()
local char = LocalPlayer.Character
if not char then
return
end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then
return
end
for _,v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Tool") and v.Parent == Workspace then
local handle = v:FindFirstChild("Handle")
if handle and (handle.Position - hrp.Position).Magnitude <= interactRange then
firetouchinterest(hrp,handle,0)
firetouchinterest(hrp,handle,1)
end
end
end
end
local function autoPickupCoins()
local char = LocalPlayer.Character
if not char then
return
end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then
return
end
for _,v in ipairs(Workspace:GetDescendants()) do
if v.Name == "Gold" or v.Name == "Coin" then
local part = v
if v:IsA("Model") then
part = v.PrimaryPart or v:FindFirstChild("Handle") or v:FindFirstChildWhichIsA("BasePart")
end
if part and (part.Position - hrp.Position).Magnitude <= interactRange then
firetouchinterest(hrp,part,0)
firetouchinterest(hrp,part,1)
end
end
end
end
local containerNames = {
["Chest"]=true,
["Container"]=true,
["Drawer"]=true,
["Cabinet"]=true,
["Locker"]=true,
["Supply"]=true,
["Crate"]=true,
["Box"]=true
}
local function autoOpenContainers()
local char = LocalPlayer.Character
if not char then
return
end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then
return
end
for _,v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Model") and containerNames[v.Name] and (v:GetPivot().Position - hrp.Position).Magnitude <= interactRange then
for _,pr in ipairs(v:GetDescendants()) do
if pr:IsA("ProximityPrompt") then
fireproximityprompt(pr)
end
end
end
end
end
local function autoOpenDoors()
local char = LocalPlayer.Character
if not char then
return
end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then
return
end
for _,v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "Door" and (v:GetPivot().Position - hrp.Position).Magnitude <= interactRange then
for _,pr in ipairs(v:GetDescendants()) do
if pr:IsA("ProximityPrompt") then
fireproximityprompt(pr)
end
end
for _,p in ipairs(v:GetDescendants()) do
if p:IsA("BasePart") and p.Name == "Door" then
p.CanCollide = false
end
end
end
end
end
local function teleportToNearestDoor()
local char = LocalPlayer.Character
if not char then
return
end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then
return
end
local nearest,dist = nil,math.huge
for _,v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "Door" then
local d = (v:GetPivot().Position - hrp.Position).Magnitude
if d<dist then
dist=d
nearest=v
end
end
end
if nearest then
hrp.CFrame = nearest:GetPivot() + Vector3.new(0,3,0)
Notify("已传送到最近的门")
else
Notify("未找到门")
end
end
local function loadFlightScript()
pcall(function()
local main = Instance.new("ScreenGui",CoreGui)
main.Name = "FlightGui_"..tostring(math.random())
main.ResetOnSpawn = false
local Frame = Instance.new("Frame",main)
Frame.BackgroundColor3 = Color3.fromRGB(163,255,137)
Frame.BorderColor3 = Color3.fromRGB(103,221,213)
Frame.Position = UDim2.new(0.1,0,0.38,0)
Frame.Size = UDim2.new(0,190,0,57)
local function makeBtn(text,size,pos,bg)
local btn = Instance.new("TextButton",Frame)
btn.BackgroundColor3 = bg
btn.Size = size
btn.Position = pos
btn.Font = Enum.Font.SourceSans
btn.Text = text
btn.TextColor3 = Color3.new(0,0,0)
btn.TextSize = 14
return btn
end
local up = makeBtn("上升",UDim2.new(0,44,0,28),UDim2.new(0,0,0,0),Color3.fromRGB(79,255,152))
local down = makeBtn("下落",UDim2.new(0,44,0,28),UDim2.new(0,0,0.5,0),Color3.fromRGB(215,255,121))
local onof = makeBtn("飞",UDim2.new(0,56,0,28),UDim2.new(0.7,0,0.5,0),Color3.fromRGB(255,249,74))
local TextLabel = Instance.new("TextLabel",Frame)
TextLabel.BackgroundColor3 = Color3.fromRGB(242,60,255)
TextLabel.Position = UDim2.new(0.5,0,0,0)
TextLabel.Size = UDim2.new(0,100,0,28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "恐拜大帝"
TextLabel.TextColor3 = Color3.new(0,0,0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
local plus = makeBtn("+",UDim2.new(0,45,0,28),UDim2.new(0.23,0,0,0),Color3.fromRGB(133,145,255))
local speed = Instance.new("TextLabel",Frame)
speed.BackgroundColor3 = Color3.fromRGB(255,85,0)
speed.Position = UDim2.new(0.47,0,0.5,0)
speed.Size = UDim2.new(0,44,0,28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.new(0,0,0)
speed.TextScaled = true
speed.TextSize = 14
local mine = makeBtn("-",UDim2.new(0,45,0,29),UDim2.new(0.23,0,0.5,0),Color3.fromRGB(123,255,247))
local closeBtn = makeBtn("X",UDim2.new(0,45,0,28),UDim2.new(0,0,-1,27),Color3.fromRGB(225,25,0))
closeBtn.TextSize = 30
closeBtn.Font = Enum.Font.ArialBold
local mini = makeBtn("-",UDim2.new(0,45,0,28),UDim2.new(0,44,-1,27),Color3.fromRGB(192,150,230))
mini.TextSize = 40
local mini2 = makeBtn("+",UDim2.new(0,45,0,28),UDim2.new(0,44,0,30),Color3.fromRGB(192,150,230))
mini2.TextSize = 40
mini2.Visible = false
local speeds = 1
local nowe = false
local chr = LocalPlayer.Character
local hum = chr and chr:FindFirstChildOfClass("Humanoid")
Frame.Active = true
Frame.Draggable = true
closeBtn.MouseButton1Click:Connect(function()
main:Destroy()
end)
up.MouseButton1Click:Connect(function()
if chr and chr:FindFirstChild("HumanoidRootPart") then
chr.HumanoidRootPart.CFrame = chr.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
end
end)
down.MouseButton1Click:Connect(function()
if chr and chr:FindFirstChild("HumanoidRootPart") then
chr.HumanoidRootPart.CFrame = chr.HumanoidRootPart.CFrame + Vector3.new(0,-3,0)
end
end)
mini.MouseButton1Click:Connect(function()
up.Visible=false
down.Visible=false
onof.Visible=false
plus.Visible=false
speed.Visible=false
mine.Visible=false
closeBtn.Visible=false
mini.Visible=false
mini2.Visible=true
Frame.Size = UDim2.new(0,100,0,28)
TextLabel.Position = UDim2.new(0,0,0,0)
end)
mini2.MouseButton1Click:Connect(function()
up.Visible=true
down.Visible=true
onof.Visible=true
plus.Visible=true
speed.Visible=true
mine.Visible=true
closeBtn.Visible=true
mini.Visible=true
mini2.Visible=false
Frame.Size = UDim2.new(0,190,0,57)
TextLabel.Position = UDim2.new(0.47,0,0,0)
end)
plus.MouseButton1Click:Connect(function()
speeds=speeds+1
speed.Text=tostring(speeds)
end)
mine.MouseButton1Click:Connect(function()
if speeds>1 then
speeds=speeds-1
speed.Text=tostring(speeds)
else
speed.Text="错误"
task.wait(0.2)
speed.Text="1"
end
end)
LocalPlayer.CharacterAdded:Connect(function(c)
chr=c
hum=c:FindFirstChildOfClass("Humanoid")
end)
onof.MouseButton1Click:Connect(function()
nowe = not nowe
if nowe then
if hum then
for _,s in pairs(Enum.HumanoidStateType:GetEnumItems()) do
hum:SetStateEnabled(s,false)
end
hum:ChangeState(Enum.HumanoidStateType.Swimming)
end
if chr.Animate then
chr.Animate.Disabled=true
end
if hum then
for _,t in pairs(hum:GetPlayingAnimationTracks()) do
t:AdjustSpeed(0)
end
end
task.spawn(function()
while nowe and chr and hum do
RunService.Heartbeat:Wait()
if hum.MoveDirection.Magnitude>0 then
chr:TranslateBy(hum.MoveDirection*speeds)
end
end
end)
local root = hum.RigType == Enum.HumanoidRigType.R6 and chr.Torso or chr.UpperTorso
local bg = Instance.new("BodyGyro",root)
bg.P=9e4
bg.MaxTorque=Vector3.new(9e9,9e9,9e9)
bg.CFrame=root.CFrame
local bv = Instance.new("BodyVelocity",root)
bv.Velocity=Vector3.new(0,0,0)
bv.MaxForce=Vector3.new(9e9,9e9,9e9)
if nowe then
chr.Humanoid.PlatformStand=true
end
while nowe and chr.Humanoid.Health>0 do
RunService.RenderStepped:Wait()
bg.CFrame = workspace.CurrentCamera.CoordinateFrame
end
bg:Destroy()
bv:Destroy()
chr.Humanoid.PlatformStand=false
chr.Animate.Disabled=false
else
if hum then
for _,s in pairs(Enum.HumanoidStateType:GetEnumItems()) do
hum:SetStateEnabled(s,true)
end
hum:ChangeState(Enum.HumanoidStateType.Running)
end
if chr.Animate then
chr.Animate.Disabled=false
end
end
end)
Notify("飞行脚本已加载")
end)
end
local function EnableGodMode()
local char = LocalPlayer.Character
if not char then
return
end
local hum = char:FindFirstChildOfClass("Humanoid")
if not hum then
return
end
pcall(function()
hum.MaxHealth = math.huge
hum.Health = math.huge
end)
local function apply(c)
local hu = c:FindFirstChildOfClass("Humanoid")
if hu then
hu.MaxHealth = math.huge
hu.Health = math.huge
end
for _,v in ipairs(c:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
end
apply(char)
LocalPlayer.CharacterAdded:Connect(apply)
end
local function DisableGodMode()
local char = LocalPlayer.Character
if not char then
return
end
local hum = char:FindFirstChildOfClass("Humanoid")
if not hum then
return
end
pcall(function()
hum.MaxHealth = 100
hum.Health = 100
end)
end
local function EnableItemSpawn()
pcall(function()
for _,v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Tool") then
local cl = v:Clone()
cl.Parent = Workspace
local pos = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and LocalPlayer.Character.PrimaryPart.Position or Vector3.new(0,10,0)
cl.Handle.Position = pos + Vector3.new(0,5,0)
end
end
end)
end
local function createFallbackUI()
local sg = Instance.new("ScreenGui",CoreGui)
sg.Name = "FallbackUI"
sg.ResetOnSpawn = false
local main = Instance.new("Frame",sg)
main.Size = UDim2.new(0,300,0,600)
main.Position = UDim2.new(0.5,-150,0.5,-300)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Active = true
main.Draggable = true
Instance.new("UICorner",main).CornerRadius = UDim.new(0,8)
local title = Instance.new("TextLabel",main)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundColor3 = Color3.fromRGB(30,30,30)
title.Text = "doors脚本 Fallback"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
local closeBtn = Instance.new("TextButton",main)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,0)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner",closeBtn).CornerRadius = UDim.new(0,6)
closeBtn.MouseButton1Click:Connect(function()
sg:Destroy()
end)
local scroll = Instance.new("ScrollingFrame",main)
scroll.Size = UDim2.new(1,-10,1,-35)
scroll.Position = UDim2.new(0,5,0,35)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 5
scroll.CanvasSize = UDim2.new(0,0,0,10)
local toggleStates = {}
local function addToggle(text,y,callback)
local btn = Instance.new("TextButton",scroll)
btn.Size = UDim2.new(1,0,0,35)
btn.Position = UDim2.new(0,0,0,y)
btn.Text = text.." [关]"
btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
btn.TextColor3 = Color3.new(1,1,1)
btn.Font = Enum.Font.SourceSans
btn.TextSize = 14
Instance.new("UICorner",btn)
toggleStates[text] = false
btn.MouseButton1Click:Connect(function()
toggleStates[text] = not toggleStates[text]
btn.Text = text..(toggleStates[text] and " [开]" or " [关]")
callback(toggleStates[text])
end)
end
local function addButton(text,y,callback)
local btn = Instance.new("TextButton",scroll)
btn.Size = UDim2.new(1,0,0,35)
btn.Position = UDim2.new(0,0,0,y)
btn.Text = text
btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
btn.TextColor3 = Color3.new(1,1,1)
btn.Font = Enum.Font.SourceSans
btn.TextSize = 14
Instance.new("UICorner",btn)
btn.MouseButton1Click:Connect(callback)
end
local y = 5
addToggle("无敌模式",y,function(v)
if v then
EnableGodMode()
else
DisableGodMode()
end
end)
y = y+40
addButton("克隆全部道具",y,function()
EnableItemSpawn()
Notify("道具已克隆")
end)
y = y+40
addToggle("自动拾取",y,function(v)
toggleLoop("pickup",v,autoPickupItems)
end)
y = y+40
addToggle("自动捡金币",y,function(v)
toggleLoop("coin",v,autoPickupCoins)
end)
y = y+40
addToggle("自动开容器",y,function(v)
toggleLoop("container",v,autoOpenContainers)
end)
y = y+40
addToggle("自动开门",y,function(v)
toggleLoop("dooropen",v,autoOpenDoors)
end)
y = y+40
addToggle("透视真门",y,function(v)
if v then
EnableDoorESP()
else
DisableDoorESP()
end
end)
y = y+40
addToggle("透视假门",y,function(v)
if v then
EnableFakeDoorESP()
else
DisableFakeDoorESP()
end
end)
y = y+40
addToggle("透视怪物",y,function(v)
if v then
EnableMonsterESP()
else
DisableMonsterESP()
end
end)
y = y+40
addToggle("透视道具",y,function(v)
if v then
EnableItemESP()
else
DisableItemESP()
end
end)
y = y+40
addButton("传送到最近的门",y,teleportToNearestDoor)
y = y+40
addButton("召唤飞行脚本",y,loadFlightScript)
y = y+40
local speedLabel = Instance.new("TextLabel",scroll)
speedLabel.Size = UDim2.new(1,0,0,25)
speedLabel.Position = UDim2.new(0,0,0,y)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "移动速度: 16"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextSize = 14
y = y+25
local speedSlider = Instance.new("Frame",scroll)
speedSlider.Size = UDim2.new(1,0,0,15)
speedSlider.Position = UDim2.new(0,0,0,y)
speedSlider.BackgroundColor3 = Color3.fromRGB(100,100,100)
Instance.new("UICorner",speedSlider)
local speedFill = Instance.new("Frame",speedSlider)
speedFill.Size = UDim2.new(0,0,1,0)
speedFill.BackgroundColor3 = Color3.fromRGB(0,255,0)
local speedDragging = false
speedSlider.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
speedDragging = true
end
end)
speedSlider.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
speedDragging = false
end
end)
UIS.InputChanged:Connect(function(input)
if speedDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
local relX = math.clamp(input.Position.X - speedSlider.AbsolutePosition.X, 0, speedSlider.AbsoluteSize.X)
local ratio = relX / speedSlider.AbsoluteSize.X
desiredWalkSpeed = math.floor(16 + ratio * (100 - 16))
speedFill.Size = UDim2.new(ratio,0,1,0)
speedLabel.Text = "移动速度: "..desiredWalkSpeed
end
end)
y = y+20
local rangeLabel = Instance.new("TextLabel",scroll)
rangeLabel.Size = UDim2.new(1,0,0,25)
rangeLabel.Position = UDim2.new(0,0,0,y)
rangeLabel.BackgroundTransparency = 1
rangeLabel.Text = "交互范围: 15"
rangeLabel.TextColor3 = Color3.new(1,1,1)
rangeLabel.Font = Enum.Font.SourceSans
rangeLabel.TextSize = 14
y = y+25
local rangeSlider = Instance.new("Frame",scroll)
rangeSlider.Size = UDim2.new(1,0,0,15)
rangeSlider.Position = UDim2.new(0,0,0,y)
rangeSlider.BackgroundColor3 = Color3.fromRGB(100,100,100)
Instance.new("UICorner",rangeSlider)
local rangeFill = Instance.new("Frame",rangeSlider)
rangeFill.Size = UDim2.new(0,0,1,0)
rangeFill.BackgroundColor3 = Color3.fromRGB(0,255,255)
local rangeDragging = false
rangeSlider.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
rangeDragging = true
end
end)
rangeSlider.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
rangeDragging = false
end
end)
UIS.InputChanged:Connect(function(input)
if rangeDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
local relX = math.clamp(input.Position.X - rangeSlider.AbsolutePosition.X, 0, rangeSlider.AbsoluteSize.X)
local ratio = relX / rangeSlider.AbsoluteSize.X
interactRange = math.floor(5 + ratio * (1000 - 5))
rangeFill.Size = UDim2.new(ratio,0,1,0)
rangeLabel.Text = "交互范围: "..interactRange
end
end)
y = y+20
scroll.CanvasSize = UDim2.new(0,0,0,y+10)
Notify("已启用备用界面")
end
local uiCreated = false
if Library then
local success, err = pcall(function()
local Window = Library:CreateWindow({
Title = "doors脚本",
Footer = "By 恐拜大帝 | QQ:3999698324",
Icon = 131153193945220,
NotifySide = "Right",
ShowCustomCursor = true,
})
local Tabs = {
Info = Window:AddTab("通知","info"),
Main = Window:AddTab("主要","star"),
ESP = Window:AddTab("透视","search"),
Settings = Window:AddTab("设置","settings"),
}
Tabs.Info:AddLeftGroupbox("作者信息"):AddLabel("恐拜大帝 doors脚本")
Tabs.Info:AddLeftGroupbox("联系方式"):AddLabel("QQ：3999698324")
Tabs.Info:AddLeftGroupbox("状态"):AddLabel("持续更新中",true)
local SettingsGroup = Tabs.Settings:AddLeftGroupbox("菜单")
SettingsGroup:AddButton("卸载脚本",function()
Library:Unload()
end)
SettingsGroup:AddLabel("菜单快捷键"):AddKeyPicker('MenuKeybind',{
Default='RightShift',
NoUI=true,
Text='Menu keybind'
})
Library.ToggleKeybind = Library.Options.MenuKeybind
local mainLeft = Tabs.Main:AddLeftGroupbox("核心功能")
mainLeft:AddToggle("GodMode",{
Text="无敌模式",
Default=false,
Callback=function(v)
if v then
EnableGodMode()
Notify("无敌已开")
else
DisableGodMode()
Notify("无敌已关")
end
end
})
mainLeft:AddButton("克隆全部道具",function()
EnableItemSpawn()
Notify("道具已克隆")
end)
mainLeft:AddToggle("AutoPickup",{
Text="自动拾取道具",
Default=false,
Callback=function(v)
toggleLoop("pickup",v,autoPickupItems)
Notify("自动拾取"..(v and "开" or "关"))
end
})
mainLeft:AddSlider("WalkSpeed",{
Text="移动速度",
Default=16,
Min=16,
Max=100,
Rounding=0,
Suffix=" studs",
Callback=function(v)
desiredWalkSpeed=v
Notify("速度:"..v)
end
})
mainLeft:AddSlider("Range",{
Text="交互范围",
Default=15,
Min=5,
Max=1000,
Rounding=0,
Suffix=" studs",
Callback=function(v)
interactRange=v
Notify("范围:"..v)
end
})
local mainRight = Tabs.Main:AddRightGroupbox("自动化与传送")
mainRight:AddToggle("AutoCoin",{
Text="自动捡金币",
Default=false,
Callback=function(v)
toggleLoop("coin",v,autoPickupCoins)
Notify("捡金币"..(v and "开" or "关"))
end
})
mainRight:AddToggle("AutoContainer",{
Text="自动打开容器",
Default=false,
Callback=function(v)
toggleLoop("container",v,autoOpenContainers)
Notify("容器自动"..(v and "开" or "关"))
end
})
mainRight:AddToggle("AutoDoor",{
Text="自动开门",
Default=false,
Callback=function(v)
toggleLoop("dooropen",v,autoOpenDoors)
Notify("自动开门"..(v and "开" or "关"))
end
})
mainRight:AddButton("传送到最近的门",teleportToNearestDoor)
mainRight:AddButton("召唤飞行脚本",loadFlightScript)
local espGroup = Tabs.ESP:AddLeftGroupbox("透视设置")
espGroup:AddToggle("DoorESP",{
Text="透视真门",
Default=false,
Callback=function(v)
if v then
EnableDoorESP()
else
DisableDoorESP()
end
Notify("真门:"..(v and "开" or "关"))
end
})
espGroup:AddToggle("FakeDoorESP",{
Text="透视假门",
Default=false,
Callback=function(v)
if v then
EnableFakeDoorESP()
else
DisableFakeDoorESP()
end
Notify("假门:"..(v and "开" or "关"))
end
})
espGroup:AddToggle("MonsterESP",{
Text="透视怪物",
Default=false,
Callback=function(v)
if v then
EnableMonsterESP()
else
DisableMonsterESP()
end
Notify("怪物:"..(v and "开" or "关"))
end
})
espGroup:AddToggle("ItemESP",{
Text="透视道具",
Default=false,
Callback=function(v)
if v then
EnableItemESP()
else
DisableItemESP()
end
Notify("道具:"..(v and "开" or "关"))
end
})
if ThemeManager then
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("DoorsScript")
ThemeManager:ApplyToTab(Tabs.Settings)
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("DoorsScript")
SaveManager:BuildConfigSection(Tabs.Settings)
end
Notify("doors脚本已就绪 - 按RightShift打开菜单")
uiCreated = true
end)
if not success then
warn("Library UI 创建失败: "..tostring(err))
end
end
if not uiCreated then
createFallbackUI()
end