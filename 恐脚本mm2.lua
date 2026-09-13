game:GetService("StarterGui"):SetCore("SendNotification", { Title = "破坏者谜团2脚本", Text = "创作者：恐拜大帝\nQQ: 3999698324", Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150" })
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
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local Camera = Workspace.CurrentCamera
local currentFollowLoop = nil
local jobEspEnabled = false
local jobEspLoop = nil
local autoKillLoop = nil
local autoPickGunEnabled = false
local autoPickGunLoop = nil
local autoCollectGoldEnabled = false
local autoCollectGoldLoop = nil
local trackLoop = nil
local crosshairUI = nil
local Notify
local Window
local function CreateCrosshair()
if crosshairUI then return end
crosshairUI = Instance.new("ScreenGui")
crosshairUI.Name = "CrosshairUI"
crosshairUI.Parent = PlayerGui
crosshairUI.IgnoreGuiInset = true
local dot = Instance.new("Frame")
dot.Parent = crosshairUI
dot.Size = UDim2.new(0, 4, 0, 4)
dot.Position = UDim2.new(0.5, -2, 0.5, -2)
dot.BackgroundColor3 = Color3.new(1, 1, 1)
dot.BorderSizePixel = 0
local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = dot
local outer = Instance.new("Frame")
outer.Parent = crosshairUI
outer.Size = UDim2.new(0, 20, 0, 20)
outer.Position = UDim2.new(0.5, -10, 0.5, -10)
outer.BackgroundTransparency = 1
outer.BorderSizePixel = 0
for i = 1, 4 do
local line = Instance.new("Frame")
line.Parent = outer
line.BackgroundColor3 = Color3.new(1, 1, 1)
line.BorderSizePixel = 0
if i == 1 or i == 2 then
line.Size = UDim2.new(0, 8, 0, 2)
line.Position = i == 1 and UDim2.new(0, -8, 0.5, -1) or UDim2.new(1, 0, 0.5, -1)
else
line.Size = UDim2.new(0, 2, 0, 8)
line.Position = i == 3 and UDim2.new(0.5, -1, 0, -8) or UDim2.new(0.5, -1, 1, 0)
end
end
end
local function RemoveCrosshair()
if crosshairUI then
crosshairUI:Destroy()
crosshairUI = nil
end
end
local function GetJob(p)
local k, s = false, false
local function c(it)
if it:IsA("Tool") then
local n = it.Name:lower()
if n:find("knife") or n:find("刀") then
k = true
end
if n:find("gun") or n:find("手枪") or n:find("警长") or n:find("revolver") then
s = true
end
end
end
if p.Backpack then
for _, v in pairs(p.Backpack:GetChildren()) do
c(v)
end
end
if p.Character then
for _, v in pairs(p.Character:GetChildren()) do
c(v)
end
end
return k and "杀手" or s and "警长" or "平民"
end
local function GetWeapon(p, weaponType)
local char = p.Character
local backpack = p.Backpack
if not char and not backpack then
return nil
end
local targetNames = weaponType == "knife" and {"knife", "刀"} or {"gun", "手枪", "警长", "revolver"}
local function checkTool(item)
if not item or not item:IsA("Tool") then
return false
end
local nameLower = item.Name:lower()
for _, keyword in ipairs(targetNames) do
if nameLower:find(keyword) then
return true
end
end
return false
end
if char then
for _, item in ipairs(char:GetChildren()) do
if checkTool(item) then
return item
end
end
end
if backpack then
for _, item in ipairs(backpack:GetChildren()) do
if checkTool(item) then
return item
end
end
end
return nil
end
local function FollowTargetByJob(targetJob)
if currentFollowLoop then
currentFollowLoop:Disconnect()
currentFollowLoop = nil
end
local targetPlayer = nil
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
if GetJob(player) == targetJob then
targetPlayer = player
break
end
end
end
if not targetPlayer then
Notify("未找到存活的"..targetJob.."目标")
return
end
Notify("跟随已开启，锁定 "..targetPlayer.Name)
currentFollowLoop = RunService.Heartbeat:Connect(function()
if not targetPlayer or not targetPlayer:IsDescendantOf(Players) or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") or not targetPlayer.Character:FindFirstChild("Humanoid") or targetPlayer.Character.Humanoid.Health <= 0 or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
currentFollowLoop:Disconnect()
currentFollowLoop = nil
Notify("跟随已停止")
return
end
local targetRoot = targetPlayer.Character.HumanoidRootPart
local myRoot = LocalPlayer.Character.HumanoidRootPart
myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
end)
end
local function ForceStopFollow()
if currentFollowLoop then
currentFollowLoop:Disconnect()
currentFollowLoop = nil
Notify("跟随已强制取消")
else
Notify("当前没有跟随目标")
end
end
local function StartTracking(targetJob)
if trackLoop then
trackLoop:Disconnect()
trackLoop = nil
end
RemoveCrosshair()
local targetPlayer = nil
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
if GetJob(player) == targetJob then
targetPlayer = player
break
end
end
end
if not targetPlayer then
Notify("未找到存活的"..targetJob)
return
end
Notify("自瞄已锁定 "..targetPlayer.Name)
CreateCrosshair()
trackLoop = RunService.RenderStepped:Connect(function()
if not targetPlayer or not targetPlayer:IsDescendantOf(Players) or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
trackLoop:Disconnect()
trackLoop = nil
RemoveCrosshair()
Notify("自瞄已停止")
return
end
local myChar = LocalPlayer.Character
if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
return
end
local targetRoot = targetPlayer.Character.HumanoidRootPart
Camera.CameraSubject = targetRoot
Camera.CameraType = Enum.CameraType.Scriptable
local cameraPos = Camera.CFrame.Position
local targetPos = targetRoot.Position
Camera.CFrame = CFrame.lookAt(cameraPos, targetPos)
end)
end
local function StopTracking()
if trackLoop then
trackLoop:Disconnect()
trackLoop = nil
end
RemoveCrosshair()
Camera.CameraSubject = LocalPlayer.Character
Camera.CameraType = Enum.CameraType.Custom
Notify("自瞄已停止")
end
local function EnableAutoCollectGold()
if autoCollectGoldLoop then
task.cancel(autoCollectGoldLoop)
autoCollectGoldLoop = nil
end
autoCollectGoldLoop = task.spawn(function()
while autoCollectGoldEnabled do
task.wait(0.3)
pcall(function()
local myChar = LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
local myHumanoid = myChar and myChar:FindFirstChild("Humanoid")
if not myChar or not myRoot or not myHumanoid or myHumanoid.Health <= 0 then
return
end
local goldList = {}
for _, descendant in pairs(Workspace:GetDescendants()) do
local nameLower = descendant.Name:lower()
local isGold = false
for _, keyword in ipairs({"coin", "金币", "gold", "money", "cash", "钱"}) do
if nameLower:find(keyword) then
isGold = true
break
end
end
if isGold and (descendant:IsA("Tool") or descendant:IsA("BasePart") or descendant:IsA("Model")) then
table.insert(goldList, descendant)
end
end
for _, gold in ipairs(goldList) do
if not autoCollectGoldEnabled then
break
end
if not myChar or not myChar.Parent or not myRoot or not myRoot.Parent then
break
end
if gold:IsA("Tool") then
if gold.Parent ~= LocalPlayer.Backpack and gold.Parent ~= myChar then
gold.Parent = LocalPlayer.Backpack
task.wait(0.3)
end
elseif gold:IsA("BasePart") or gold:IsA("Model") then
local goldPos = gold:IsA("Model") and gold:FindFirstChild("HumanoidRootPart") and gold.HumanoidRootPart.Position or (gold:IsA("BasePart") and gold.Position or nil)
if goldPos then
local originalPos = myRoot.CFrame
myRoot.CFrame = CFrame.new(goldPos + Vector3.new(0, 2, 0))
task.wait(0.05)
myRoot.CFrame = originalPos
task.wait(0.3)
end
end
end
end)
end
end)
end
local function DisableAutoCollectGold()
if autoCollectGoldLoop then
task.cancel(autoCollectGoldLoop)
autoCollectGoldLoop = nil
end
end
local function ClearHighlights()
for _, v in pairs(Workspace:GetDescendants()) do
if v:IsA("Highlight") and v.Name == "JobHighlight" then
v:Destroy()
end
end
end
local function UpdateHighlights()
for _, plr in ipairs(Players:GetPlayers()) do
if plr == LocalPlayer then
continue
end
local character = plr.Character
if not character then
continue
end
local humanoid = character:FindFirstChild("Humanoid")
if not humanoid or humanoid.Health <= 0 then
continue
end
local highlight = character:FindFirstChild("JobHighlight")
if not highlight then
highlight = Instance.new("Highlight")
highlight.Name = "JobHighlight"
highlight.Parent = character
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end
local job = GetJob(plr)
if job == "杀手" then
highlight.FillColor = Color3.new(1, 0, 0)
highlight.OutlineColor = Color3.new(1, 0, 0)
elseif job == "警长" then
highlight.FillColor = Color3.new(0, 0.5, 1)
highlight.OutlineColor = Color3.new(0, 0.5, 1)
else
highlight.FillColor = Color3.new(1, 1, 1)
highlight.OutlineColor = Color3.new(1, 1, 1)
end
end
end
local function EnableJobESP()
jobEspEnabled = true
if jobEspLoop then
task.cancel(jobEspLoop)
jobEspLoop = nil
end
jobEspLoop = task.spawn(function()
while jobEspEnabled do
pcall(function()
for _, plr in ipairs(Players:GetPlayers()) do
if plr.Character and plr.Character:FindFirstChild("Head") then
local head = plr.Character.Head
local jobLabel = head:FindFirstChild("JobLabel")
if not jobLabel then
jobLabel = Instance.new("BillboardGui")
jobLabel.Name = "JobLabel"
jobLabel.Parent = head
jobLabel.Size = UDim2.new(0, 100, 0, 30)
jobLabel.StudsOffset = Vector3.new(0, 2.5, 0)
jobLabel.AlwaysOnTop = true
local text = Instance.new("TextLabel")
text.Parent = jobLabel
text.BackgroundTransparency = 1
text.Size = UDim2.new(1, 0, 1, 0)
text.TextSize = 15
text.Font = Enum.Font.ArialBold
jobLabel.TextLabel = text
end
local text = jobLabel.TextLabel
local job = GetJob(plr)
text.Text = job
if job == "杀手" then
text.TextColor3 = Color3.new(1, 0, 0)
elseif job == "警长" then
text.TextColor3 = Color3.new(0, 0.5, 1)
else
text.TextColor3 = Color3.new(1, 1, 1)
end
end
end
UpdateHighlights()
end)
task.wait(0.3)
end
end)
end
local function DisableJobESP()
jobEspEnabled = false
if jobEspLoop then
task.cancel(jobEspLoop)
jobEspLoop = nil
end
for _, plr in ipairs(Players:GetPlayers()) do
if plr.Character and plr.Character:FindFirstChild("Head") then
local jobLabel = plr.Character.Head:FindFirstChild("JobLabel")
if jobLabel then
jobLabel:Destroy()
end
end
end
ClearHighlights()
end
local function EnableAutoPickGun()
autoPickGunEnabled = true
autoPickGunLoop = task.spawn(function()
while autoPickGunEnabled do
task.wait(0.3)
local myChar = LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
local myHumanoid = myChar and myChar:FindFirstChild("Humanoid")
if not myChar or not myRoot or not myHumanoid or myHumanoid.Health <= 0 then
continue
end
if GetWeapon(LocalPlayer, "gun") then
continue
end
local targetGun = nil
for _, descendant in pairs(Workspace:GetDescendants()) do
if descendant:IsA("Tool") then
local nameLower = descendant.Name:lower()
local isGun = false
for _, keyword in ipairs({"gun", "手枪", "警长", "revolver"}) do
if nameLower:find(keyword) then
isGun = true
break
end
end
if not isGun then
continue
end
if descendant:IsDescendantOf(Workspace) and not descendant:IsDescendantOf(LocalPlayer) then
targetGun = descendant
break
end
end
end
if targetGun then
local originalPos = myRoot.CFrame
local gunPos = targetGun:IsA("BasePart") and targetGun.Position or (targetGun:FindFirstChild("Handle") and targetGun.Handle.Position) or nil
if gunPos then
myRoot.CFrame = CFrame.new(gunPos + Vector3.new(0, 2, 0))
task.wait(0.3)
pcall(function()
targetGun.Parent = LocalPlayer.Backpack
end)
myRoot.CFrame = originalPos
Notify("已拾取一把警长枪械")
end
end
end
end)
end
local function DisableAutoPickGun()
autoPickGunEnabled = false
if autoPickGunLoop then
task.cancel(autoPickGunLoop)
autoPickGunLoop = nil
end
end
local function KillerAutoKillAll()
if GetJob(LocalPlayer) ~= "杀手" then
Notify("仅杀手可使用此功能")
return
end
if autoKillLoop then
task.cancel(autoKillLoop)
autoKillLoop = nil
Notify("自动清场已停止")
return
end
local targetList = {}
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
if GetJob(p) == "警长" then
table.insert(targetList, 1, p)
else
table.insert(targetList, p)
end
end
end
if #targetList == 0 then
Notify("未找到存活目标")
return
end
local knife = GetWeapon(LocalPlayer, "knife")
if not knife then
Notify("未找到你的刀，无法执行")
return
end
Notify("开始清场，共"..#targetList.."个目标")
autoKillLoop = task.spawn(function()
local killCount = 0
for index, target in ipairs(targetList) do
local myChar = LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
local myHumanoid = myChar and myChar:FindFirstChild("Humanoid")
local currentKnife = GetWeapon(LocalPlayer, "knife")
if not myChar or not myRoot or not myHumanoid or myHumanoid.Health <= 0 or not currentKnife then
autoKillLoop = nil
Notify("你已死亡或武器丢失，清场停止")
return
end
if not target or not target:IsDescendantOf(Players) or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") or not target.Character:FindFirstChild("Humanoid") or target.Character.Humanoid.Health <= 0 then
Notify("目标"..target.Name.."已死亡")
continue
end
local targetRoot = target.Character.HumanoidRootPart
myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
task.wait(0.1)
currentKnife:Equip()
task.wait(0.05)
currentKnife:Activate()
local waitStart = os.clock()
local targetDied = false
while os.clock() - waitStart < 5 do
task.wait(0.1)
local newTargetHumanoid = target.Character and target.Character:FindFirstChild("Humanoid")
if not newTargetHumanoid or newTargetHumanoid.Health <= 0 then
targetDied = true
break
end
local newMyHumanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
if not newMyHumanoid or newMyHumanoid.Health <= 0 then
autoKillLoop = nil
Notify("你已死亡，清场停止")
return
end
local newKnife = GetWeapon(LocalPlayer, "knife")
if not newKnife then
autoKillLoop = nil
Notify("武器丢失，清场停止")
return
end
local newTargetRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
local newMyRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if newTargetRoot and newMyRoot then
newMyRoot.CFrame = newTargetRoot.CFrame * CFrame.new(0, 0, 2)
newKnife:Equip()
task.wait(0.05)
newKnife:Activate()
end
end
if targetDied then
killCount += 1
Notify("已击杀 "..target.Name.." ("..killCount.."/"..#targetList..")")
else
Notify("超时，跳过 "..target.Name)
end
end
autoKillLoop = nil
Notify("清场完成，共击杀"..killCount.."个目标")
end)
end
local function TP(p)
local r = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local tr = p.Character:FindFirstChild("HumanoidRootPart")
if r and tr then
r.CFrame = tr.CFrame * CFrame.new(0, 0, 2)
Notify("已传送到 "..p.Name)
end
end
local function TPC()
local l = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if not l then return end
local m = math.huge
local t
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer and GetJob(p) == "平民" and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
local d = (p.Character.HumanoidRootPart.Position - l.Position).Magnitude
if d < m then
m = d
t = p
end
end
end
if t then
TP(t)
else
Notify("未找到平民")
end
end
local function TPS()
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer and GetJob(p) == "警长" and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
TP(p)
return
end
end
Notify("未找到警长")
end
local function TPK()
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer and GetJob(p) == "杀手" and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
TP(p)
return
end
end
Notify("未找到杀手")
end
local function TeleportKillerToSpawn()
local found = false
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and GetJob(player) == "杀手" then
local char = player.Character
if char and char:FindFirstChild("HumanoidRootPart") then
char.HumanoidRootPart.CFrame = CFrame.new(352.42, 522.05, -8.30)
found = true
Notify("已将杀手 "..player.Name.." 传送到出生点")
end
end
end
if not found then
Notify("未找到存活的杀手")
end
end
local function loadFlightScript()
local success, err = pcall(function()
do
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
speeds = 1
local speaker = game:GetService("Players").LocalPlayer
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
nowe = false
game:GetService("StarterGui"):SetCore("SendNotification", { Title = "飞行脚本", Text = "创作者：恐拜大帝", Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150" })
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
hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Running, false)
hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
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
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.CFrame = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.Velocity = Vector3.new(0, 0, 0)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
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
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.CFrame = UpperTorso.CFrame
local bv = Instance.new("BodyVelocity", UpperTorso)
bv.Velocity = Vector3.new(0, 0, 0)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe then
plr.Character.Humanoid.PlatformStand = true
end
while nowe and plr.Character.Humanoid.Health > 0 do
wait()
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
end
end)
if success then
Notify("飞行脚本已加载")
else
Notify("飞行脚本加载失败: "..tostring(err))
end
end
Window = Library:CreateWindow({
Title = "破坏者谜团2脚本",
Footer = "By 恐拜大帝 | QQ:3999698324",
Icon = 113517588654522,
NotifySide = "Right",
ShowCustomCursor = true,
})
Notify = function(msg)
Library:Notify(msg, 3)
end
local Tabs = {
Main = Window:AddTab("主要功能", "info"),
Teleport = Window:AddTab("传送与跟随", "map"),
Settings = Window:AddTab("设置", "settings"),
}
local selectedTexture = "恐脚本"
local function ApplyWindowIcon()
local id = (selectedTexture == "恐脚本" and "rbxassetid://113517588654522") or (selectedTexture == "巨魔" and "rbxassetid://131153193945220") or nil
for _, gui in ipairs(PlayerGui:GetChildren()) do
if gui:IsA("ScreenGui") then
for _, obj in ipairs(gui:GetDescendants()) do
if obj:IsA("ImageLabel") and obj.Image == "rbxassetid://113517588654522" then
if selectedTexture == "删除" then
obj.Image = ""
obj.ImageTransparency = 1
else
obj.Image = id
obj.ImageTransparency = 0
end
Notify("窗口图标已更新")
return
end
end
end
end
Notify("未找到图标元素")
end
local SettingsLeft = Tabs.Settings:AddLeftGroupbox("选图案")
SettingsLeft:AddDropdown('WindowIconSelector', {
Values = {"恐脚本图案", "巨魔图案", "删除图案"},
Default = 1,
Text = '窗口图标',
Callback = function(Value)
selectedTexture = Value
end
})
SettingsLeft:AddButton({
Text = '应用图标',
Func = ApplyWindowIcon,
DoubleClick = false,
Tooltip = '修改标题栏旁边的图片'
})
SettingsLeft:AddButton({
Text = '卸载脚本',
Func = function()
Library:Unload()
end
})
local MainLeft = Tabs.Main:AddLeftGroupbox("辅助开关")
local MainRight = Tabs.Main:AddRightGroupbox("特殊功能")
MainLeft:AddToggle('JobESP', {
Text = '透视所有人职业',
Default = false,
Tooltip = '杀手(红)/警长(蓝)/平民(白) 头顶文字+高亮',
Callback = function(Value)
if Value then
EnableJobESP()
Notify("透视已开启")
else
DisableJobESP()
Notify("透视已关闭")
end
end
})
MainLeft:AddToggle('AutoCollectGold', {
Text = '自动收集金币',
Default = false,
Tooltip = '每0.3秒收集全场金币',
Callback = function(Value)
autoCollectGoldEnabled = Value
if Value then
EnableAutoCollectGold()
Notify("自动收集金币已开启")
else
DisableAutoCollectGold()
Notify("自动收集金币已关闭")
end
end
})
MainLeft:AddToggle('AutoPickGun', {
Text = '自动拾取警长枪械',
Default = false,
Tooltip = '警长死后瞬移捡枪',
Callback = function(Value)
if Value then
EnableAutoPickGun()
Notify("自动拾取已开启")
else
DisableAutoPickGun()
Notify("自动拾取已关闭")
end
end
})
MainLeft:AddButton({
Text = '召唤飞行脚本',
Func = loadFlightScript,
DoubleClick = false,
Tooltip = '打开独立飞行UI'
})
MainRight:AddButton({
Text = '杀手自动杀光所有人',
Func = KillerAutoKillAll,
DoubleClick = false,
Tooltip = '仅杀手可用'
})
MainRight:AddButton({
Text = '追星（锁定杀手视角）',
Func = function()
if trackLoop then
StopTracking()
else
StartTracking("杀手")
end
end,
DoubleClick = false,
Tooltip = '视角自动跟踪杀手'
})
MainRight:AddButton({
Text = '自瞄（锁定警长视角）',
Func = function()
if trackLoop then
StopTracking()
else
StartTracking("警长")
end
end,
DoubleClick = false,
Tooltip = '视角自动跟踪警长'
})
local TeleLeft = Tabs.Teleport:AddLeftGroupbox("瞬间传送")
local TeleRight = Tabs.Teleport:AddRightGroupbox("取消跟随 & 传送")
TeleLeft:AddButton({ Text = '传送到最近平民', Func = TPC })
TeleLeft:AddButton({ Text = '传送到警长', Func = TPS })
TeleLeft:AddButton({ Text = '传送到杀手', Func = TPK })
TeleLeft:AddLabel('跟随目标（传送至身后并保持）')
TeleLeft:AddButton({ Text = '跟随平民', Func = function() FollowTargetByJob("平民") end })
TeleLeft:AddButton({ Text = '跟随警长', Func = function() FollowTargetByJob("警长") end })
TeleLeft:AddButton({ Text = '跟随杀手', Func = function() FollowTargetByJob("杀手") end })
TeleRight:AddButton({ Text = '强制取消跟随', Func = ForceStopFollow })
TeleRight:AddButton({ Text = '将杀手传送到出生点', Func = TeleportKillerToSpawn })
if ThemeManager then
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("DestroyerMystery2")
ThemeManager:ApplyToTab(Tabs.Settings)
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("DestroyerMystery2")
SaveManager:BuildConfigSection(Tabs.Settings)
end