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
local Options = Library.Options
local Toggles = Library.Toggles
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local isButtonESPActive = false
local espRange = 1000
local visitedButtons = {}
local noRepeatTeleport = false
local moveSpeed = 16
local isInfiniteJump = false
local isNoClip = false
local CurrentCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local CurrentHumanoid = CurrentCharacter:WaitForChild("Humanoid", 10)
LocalPlayer.CharacterAdded:Connect(function(newChar)
CurrentCharacter = newChar
CurrentHumanoid = newChar:WaitForChild("Humanoid", 10)
if CurrentHumanoid then
CurrentHumanoid.WalkSpeed = moveSpeed
end
if isNoClip then
setNoClip(true)
end
end)
local function getWebContent(url)
return game:HttpGet(url)
end
local function runLuaCode(code)
loadstring(code)()
end
local function addTrueButtonMarker(part)
if not part:IsA("BasePart") then
return
end
if part:FindFirstChild("ButtonMarker") then
return
end
if not part:FindFirstChildOfClass("ClickDetector") then
return
end
local highlight = Instance.new("Highlight")
highlight.Name = "ButtonMarker"
highlight.FillColor = Color3.new(1, 1, 0)
highlight.OutlineColor = Color3.new(1, 0.3, 0)
highlight.FillTransparency = 0.7
highlight.OutlineTransparency = 0.1
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlight.Enabled = false
highlight.Parent = part
local bill = Instance.new("BillboardGui")
bill.Name = "ButtonText"
bill.Adornee = part
bill.AlwaysOnTop = true
bill.Size = UDim2.new(0, 30, 0, 15)
bill.StudsOffset = Vector3.new(0, 1, 0)
bill.MaxDistance = 99999
bill.Enabled = false
bill.Parent = part
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "按钮"
text.TextColor3 = Color3.new(1, 1, 0)
text.TextScaled = true
text.TextSize = 12
text.Parent = bill
end
local function updateButtonESPRange()
local hrp = CurrentCharacter and CurrentCharacter:FindFirstChild("HumanoidRootPart")
local maxDist = espRange
local isUnlimited = (espRange >= 1000)
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and v:FindFirstChildOfClass("ClickDetector") then
local marker = v:FindFirstChild("ButtonMarker")
local text = v:FindFirstChild("ButtonText")
if marker and text then
local active = isButtonESPActive
if active and not isUnlimited and hrp then
local dist = (v.Position - hrp.Position).Magnitude
active = dist <= maxDist
end
marker.Enabled = active
text.Enabled = active
end
end
end
end
local function setAllButtonESPState(state)
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then
local marker = v:FindFirstChild("ButtonMarker")
local text = v:FindFirstChild("ButtonText")
if marker then
marker.Enabled = state
end
if text then
text.Enabled = state
end
end
end
end
local function startButtonESP()
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then
addTrueButtonMarker(v)
end
end
workspace.DescendantAdded:Connect(function(v)
task.wait(0.1)
if v:IsA("BasePart") then
addTrueButtonMarker(v)
updateButtonESPRange()
end
end)
RunService.RenderStepped:Connect(function()
if isButtonESPActive then
updateButtonESPRange()
end
end)
end
local function teleportToNearestButton()
local char = LocalPlayer.Character
if not char then
Library:Notify("角色不存在", 3)
return
end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then
Library:Notify("未找到 HumanoidRootPart", 3)
return
end
local nearest = nil
local minDist = math.huge
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and v:FindFirstChildOfClass("ClickDetector") then
if noRepeatTeleport and visitedButtons[v] then
else
local dist = (v.Position - hrp.Position).Magnitude
if dist < minDist then
minDist = dist
nearest = v
end
end
end
end
if nearest then
hrp.CFrame = CFrame.new(nearest.Position + Vector3.new(0, 3, 0))
visitedButtons[nearest] = true
Library:Notify("已传送到最近按钮", 2)
else
Library:Notify("附近没有按钮或所有按钮已访问", 3)
end
end
local function applyWalkSpeed(speed)
moveSpeed = speed
if CurrentHumanoid then
CurrentHumanoid.WalkSpeed = speed
end
end
local function setNoClip(enable)
isNoClip = enable
if not CurrentCharacter then
return
end
for _, part in ipairs(CurrentCharacter:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = not enable
end
end
end
local infiniteJumpConnections = {}
local function startInfiniteJump()
local jumpRequest = false
local conn1 = UIS.InputBegan:Connect(function(input, processed)
if processed then
return
end
if input.KeyCode == Enum.KeyCode.Space then
jumpRequest = true
end
end)
local conn2 = UIS.InputEnded:Connect(function(input)
if input.KeyCode == Enum.KeyCode.Space then
jumpRequest = false
end
end)
local conn3 = RunService.RenderStepped:Connect(function()
if not isInfiniteJump then
return
end
if not CurrentHumanoid or not CurrentCharacter then
return
end
if jumpRequest and CurrentHumanoid:GetState() == Enum.HumanoidStateType.Landed then
CurrentHumanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
end)
table.insert(infiniteJumpConnections, conn1)
table.insert(infiniteJumpConnections, conn2)
table.insert(infiniteJumpConnections, conn3)
end
startButtonESP()
local Window = Library:CreateWindow({
Title = "找到按钮脚本",
Footer = "By 恐拜大帝",
Icon = 131153193945220,
NotifySide = "Right",
ShowCustomCursor = true,
})
Library:Notify("找到按钮脚本 - 创作者：恐拜大帝", 5)
local Tabs = {
Notice = Window:AddTab("通知", "info"),
Main = Window:AddTab("功能", "info"),
Settings = Window:AddTab("设置", "settings"),
}
local NoticeGroup = Tabs.Notice:AddLeftGroupbox("作者消息")
NoticeGroup:AddLabel('恐拜大帝将持续更新此脚本')
NoticeGroup:AddLabel('创作者：恐拜大帝')
local FuncGroup = Tabs.Main:AddLeftGroupbox("按钮工具")
local espToggle = FuncGroup:AddToggle('ButtonESPToggle', {
Text = '开启按钮透视',
Default = false,
Tooltip = '高亮并标注所有可点击按钮',
Callback = function(Value)
isButtonESPActive = Value
updateButtonESPRange()
end
})
FuncGroup:AddSlider('ESPRange', {
Text = '透视范围（拉满=全图）',
Default = 1000,
Min = 0,
Max = 1000,
Rounding = 0,
Suffix = " m",
Callback = function(Value)
espRange = Value
if isButtonESPActive then
updateButtonESPRange()
end
end
})
FuncGroup:AddButton('传送最近按钮', function()
teleportToNearestButton()
end)
local noRepeatToggle = FuncGroup:AddToggle('NoRepeatTeleport', {
Text = '不再传送到传送过的按钮',
Default = false,
Tooltip = '开启后，已传送过的按钮将被忽略',
Callback = function(Value)
noRepeatTeleport = Value
if not Value then
table.clear(visitedButtons)
end
end
})
FuncGroup:AddButton('召唤飞行脚本', function()
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
local BoostGroup = Tabs.Main:AddRightGroupbox("角色增强")
BoostGroup:AddSlider('WalkSpeedSlider', {
Text = '移动速度',
Default = 16,
Min = 0,
Max = 200,
Rounding = 0,
Suffix = "",
Callback = function(Value)
applyWalkSpeed(Value)
end
})
BoostGroup:AddToggle('InfiniteJumpToggle', {
Text = '无限跳跃',
Default = false,
Tooltip = '按住空格可连续跳跃',
Callback = function(Value)
isInfiniteJump = Value
if Value then
startInfiniteJump()
else
for _, conn in ipairs(infiniteJumpConnections) do
conn:Disconnect()
end
infiniteJumpConnections = {}
end
end
})
BoostGroup:AddToggle('NoClipToggle', {
Text = '穿墙',
Default = false,
Tooltip = '角色可穿越墙体',
Callback = function(Value)
setNoClip(Value)
end
})
local SettingsGroup = Tabs.Settings:AddLeftGroupbox("菜单")
SettingsGroup:AddButton('卸载脚本', function()
isButtonESPActive = false
setAllButtonESPState(false)
setNoClip(false)
isInfiniteJump = false
for _, conn in ipairs(infiniteJumpConnections) do
conn:Disconnect()
end
Library:Unload()
end)
SettingsGroup:AddButton('重载界面', function()
Library:Notify("重载功能未配置脚本地址", 3)
end)
SettingsGroup:AddLabel('菜单快捷键'):AddKeyPicker('MenuKeybind', {
Default = 'RightShift',
NoUI = true,
Text = 'Menu keybind'
})
Library.ToggleKeybind = Options.MenuKeybind
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