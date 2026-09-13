local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local LG=game:GetService("Lighting")
local CG=game:GetService("CoreGui")
local LP=Players.LocalPlayer
local Cam=workspace.CurrentCamera
local function N(t,x,d)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title=tostring(t),Text=tostring(x),Duration=d or 3})end)end
pcall(function()local v=game:GetService("VirtualUser")LP.Idled:Connect(function()v:Button2Down(Vector2.new(0,0),Cam.CFrame)task.wait(1)v:Button2Up(Vector2.new(0,0),Cam.CFrame)end)end)
local W=loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
W:SetDefaultTheme("Dark")W:SetDefaultRainbowMode("流动")W:SetLanguage("中文")
local _N=W.Notify
W.Notify=function(s,o)if o and o.Title then o.Title="兔小黑🐰 · "..tostring(o.Title)end return _N(s,o)end
local MW=W:CreateWindow({Title="兔小黑🐰",WelcomeText="脚本演示.lua",MinimizedText="兔小黑🐰",Theme="Dark",RainbowMode="流动",DialogTitle="确认关闭",GroupText="加入兔小黑🐰群",GroupCopy="1124808244",SnowEnabled=false,Folder="TuXiaoHei_Config",TitleTag={{text="ai制作",backgroundColor=Color3.fromRGB(255,130,180),textColor=Color3.new(1,1,1)}}})

local T1=MW:Tab({Title="信息"})
T1:Paragraph({Title="作者",Desc="兔小黑🐰出品",Icon="user"})
T1:Paragraph({Title="QQ群",Desc="1124808244",Icon="users"})
T1:Paragraph({Title="用户名",Desc=LP.Name,Icon="hash"})
T1:Paragraph({Title="用户ID",Desc=tostring(LP.UserId),Icon="hash"})
T1:Paragraph({Title="账号年龄",Desc=tostring(LP.AccountAge).." 天",Icon="calendar"})
T1:Paragraph({Title="执行器",Desc=tostring(identifyexecutor and identifyexecutor() or "未知"),Icon="terminal"})
T1:Button({Text="复制群号",Icon="copy",Callback=function()pcall(function()setclipboard("1124808244")end)N("提示","已复制",2)end})

local T2=MW:Tab({Title="通用"})
local C2F=T2:Category({Title="飞行",IconName="send"})
C2F:Paragraph({Title="飞行功能",Desc="点击下面按钮加载飞行脚本",Icon="info"})
C2F:Button({Text="启动飞行",Icon="play",Callback=function()
local ok,err=pcall(function()loadstring(game:HttpGet("https://pastefy.app/z1mFBr9I/raw"))()end)
if ok then N("飞行","启动成功",2)else N("失败",tostring(err):sub(1,80),4)end
end})
local C2N=T2:Category({Title="穿墙",IconName="shield-off"})
C2N:Paragraph({Title="穿墙说明",Desc="开启后角色可穿所有墙体和地面",Icon="info"})
local nConn
local function enNC()local c=LP.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end nConn=RS.Stepped:Connect(function()local ch=LP.Character if not ch then return end for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end)end
local function disNC()if nConn then nConn:Disconnect()nConn=nil end local c=LP.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=true end end end end
C2N:Toggle({Title="穿墙",Value=false,FeatureName="穿墙",Icon="shield-off",Callback=function(s)if s then enNC()else disNC()end end})
local C2C=T2:Category({Title="相机",IconName="camera"})
C2C:Paragraph({Title="强制第三人称",Desc="开启后强制切到第三人称",Icon="info"})
local forceTPSOn=false
local forceTPSConn=nil
C2C:Toggle({Title="强制第三人称",Value=false,FeatureName="第三人称",Icon="camera",Callback=function(s)
forceTPSOn=s
if s then
if forceTPSConn then forceTPSConn:Disconnect()end
LP.CameraMode=Enum.CameraMode.Classic
forceTPSConn=RS.RenderStepped:Connect(function()
if not forceTPSOn then return end
if LP.CameraMode~=Enum.CameraMode.Classic then LP.CameraMode=Enum.CameraMode.Classic end
end)
N("相机","已强制第三人称",2)
else
if forceTPSConn then forceTPSConn:Disconnect()forceTPSConn=nil end
N("相机","已关闭强制",2)
end
end})
C2C:Paragraph({Title="放大距离",Desc="默认128，数字改大镜头能拉更远",Icon="info"})
C2C:TextInput({Title="",Placeholder="输入最大视距，如 500",Value="128",Callback=function(t)local n=tonumber(t)if n then LP.CameraMaxZoomDistance=n N("相机","最大视距 "..n,2)end end})
local C2W=T2:Category({Title="踏空行走",IconName="wind"})
C2W:Paragraph({Title="踏空行走",Desc="点击下方按钮加载外部踏空脚本",Icon="info"})
C2W:Button({Text="启动踏空行走",Icon="play",Callback=function()
local ok,err=pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()end)
if ok then N("踏空","启动成功",2)else N("失败",tostring(err):sub(1,80),4)end
end})
local C2T=T2:Category({Title="传送工具",IconName="navigation"})
C2T:Paragraph({Title="点击传送工具",Desc="点下面按钮获得一个工具，装备后点哪传哪",Icon="info"})
C2T:Button({Text="获取点击传送工具",Icon="navigation",Callback=function()
local ok,err=pcall(function()
local mouse=LP:GetMouse()
local tool=Instance.new("Tool")
tool.RequiresHandle=false
tool.Name="[FE] 点击传送"
tool.Activated:Connect(function()
local pos=mouse.Hit+Vector3.new(0,2.5,0)
pos=CFrame.new(pos.X,pos.Y,pos.Z)
local c=LP.Character
if c then
local hrp=c:FindFirstChild("HumanoidRootPart")
if hrp then hrp.CFrame=pos end
end
end)
tool.Parent=LP:WaitForChild("Backpack")
end)
if ok then N("传送工具","已放入背包",2)else N("失败",tostring(err):sub(1,80),4)end
end})
local C2D=T2:Category({Title="防摔伤害",IconName="shield"})
C2D:Paragraph({Title="防摔伤害",Desc="从高处掉下来不会扣血",Icon="info"})
local noFallOn=false
local noFallConn=nil
local lastHP=nil
C2D:Toggle({Title="防摔伤害",Value=false,FeatureName="防摔",Icon="shield",Callback=function(s)
noFallOn=s
if s then
lastHP=nil
noFallConn=RS.Heartbeat:Connect(function()
if not noFallOn then return end
local c=LP.Character
if not c then lastHP=nil return end
local hum=c:FindFirstChildOfClass("Humanoid")
if not hum then lastHP=nil return end
if lastHP==nil then lastHP=hum.Health return end
if hum.Health<lastHP then
local st=hum:GetState()
if st==Enum.HumanoidStateType.Freefall or st==Enum.HumanoidStateType.FallingDown or st==Enum.HumanoidStateType.Landed then
hum.Health=lastHP
else
lastHP=hum.Health
end
else
lastHP=hum.Health
end
end)
N("防摔","已开启",2)
else
if noFallConn then noFallConn:Disconnect()noFallConn=nil end
lastHP=nil
N("防摔","已关闭",2)
end
end})
local C2R=T2:Category({Title="旋转恶搞",IconName="refresh-cw"})
C2R:Paragraph({Title="旋转说明",Desc="开启后角色原地高速旋转（R6/R15 自动适配）",Icon="info"})
local function TXH_Spin(spinSpeed)
local c=LP.Character
if not c then N("错误","无角色",2)return end
local hum=c:FindFirstChildOfClass("Humanoid")
if not hum then N("错误","无Humanoid",2)return end
local hrp=c:FindFirstChild("HumanoidRootPart")
if not hrp then N("错误","无HRP",2)return end
task.spawn(function()
local animId=hum.RigType==Enum.HumanoidRigType.R6 and "rbxassetid://27432686" or "rbxassetid://507776043"
local anim=Instance.new("Animation")
anim.AnimationId=animId
local track=hum:LoadAnimation(anim)
track:Play()
track:AdjustSpeed(0)
local animate=c:FindFirstChild("Animate")
if animate then animate.Disabled=true end
local oldSpin=hrp:FindFirstChild("TXH_Spin")
if oldSpin then oldSpin:Destroy()end
local spin=Instance.new("BodyAngularVelocity")
spin.Name="TXH_Spin"
spin.Parent=hrp
spin.MaxTorque=Vector3.new(0,math.huge,0)
spin.AngularVelocity=Vector3.new(0,spinSpeed,0)
N("旋转","速度 "..spinSpeed.." 已开启",2)
end)
end
C2R:Button({Text="快速旋转",Icon="refresh-cw",Callback=function()TXH_Spin(30)end})
C2R:Button({Text="极速旋转",Icon="rotate-cw",Callback=function()TXH_Spin(500)end})
C2R:Button({Text="停止旋转",Icon="square",Callback=function()
local c=LP.Character
if c then
local hrp=c:FindFirstChild("HumanoidRootPart")
if hrp then
local sp=hrp:FindFirstChild("TXH_Spin")
if sp then sp:Destroy()end
end
local hum=c:FindFirstChildOfClass("Humanoid")
if hum then
local animate=c:FindFirstChild("Animate")
if animate then animate.Disabled=false end
for _,t in pairs(hum:GetPlayingAnimationTracks())do
if t.Animation and(t.Animation.AnimationId:find("27432686")or t.Animation.AnimationId:find("507776043"))then
t:Stop()
end
end
end
end
N("旋转","已停止",2)
end})
local C2A=T2:Category({Title="防甩飞",IconName="shield"})
C2A:Paragraph({Title="防甩飞",Desc="保护自己不被别的脚本甩飞。开启后速度突变会被拦下来",Icon="info"})
local antiFlingConn=nil
local antiFlingCharConn=nil
local antiFlingVelConn=nil
local origFallenHeight=workspace.FallenPartsDestroyHeight
C2A:Toggle({Title="防甩飞",Value=false,FeatureName="防甩飞",Icon="shield",Callback=function(s)
if s then
origFallenHeight=workspace.FallenPartsDestroyHeight
if antiFlingConn then antiFlingConn:Disconnect()end
if antiFlingCharConn then antiFlingCharConn:Disconnect()end
if antiFlingVelConn then antiFlingVelConn:Disconnect()end
local function protectChar(char)
if not char then return end
local hrp=char:FindFirstChild("HumanoidRootPart")
local hum=char:FindFirstChildOfClass("Humanoid")
if not hrp then return end
if antiFlingVelConn then antiFlingVelConn:Disconnect()end
antiFlingVelConn=hrp:GetPropertyChangedSignal("Velocity"):Connect(function()
pcall(function()
if not s then return end
if hrp.Velocity.Magnitude>300 then
hrp.Velocity=Vector3.new(0,0,0)
hrp.RotVelocity=Vector3.new(0,0,0)
end
end)
end)
end
protectChar(LP.Character)
antiFlingCharConn=LP.CharacterAdded:Connect(function(c)
task.wait(0.5)
protectChar(c)
end)
antiFlingConn=RS.Heartbeat:Connect(function()
pcall(function()
local c=LP.Character
if not c then return end
local hrp=c:FindFirstChild("HumanoidRootPart")
if not hrp then return end
local hum=c:FindFirstChildOfClass("Humanoid")
if hum then
local st=hum:GetState()
if st==Enum.HumanoidStateType.Physics or st==Enum.HumanoidStateType.Ragdoll then
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end
if hrp.Velocity.Magnitude>500 then
hrp.Velocity=Vector3.new(0,0,0)
hrp.RotVelocity=Vector3.new(0,0,0)
end
for _,child in ipairs(hrp:GetChildren())do
if child:IsA("BodyVelocity")or child:IsA("BodyAngularVelocity")or child:IsA("BodyThrust")then
if child.Name~="TXHVel"then
child:Destroy()
end
end
end
end)
end)
N("防甩飞","已开启",2)
else
if antiFlingConn then antiFlingConn:Disconnect()antiFlingConn=nil end
if antiFlingCharConn then antiFlingCharConn:Disconnect()antiFlingCharConn=nil end
if antiFlingVelConn then antiFlingVelConn:Disconnect()antiFlingVelConn=nil end
workspace.FallenPartsDestroyHeight=origFallenHeight
local c=LP.Character
if c then
for _,p in ipairs(c:GetDescendants())do
if p:IsA("BasePart")then
p.CanCollide=true
end
end
end
N("防甩飞","已关闭",2)
end
end})

local T3=MW:Tab({Title="玩家"})
local C3L=T3:Category({Title="本地玩家",IconName="user"})
C3L:Paragraph({Title="移动速度",Desc="默认16",Icon="info"})
C3L:TextInput({Title="",Placeholder="输入速度数字，如 16",Value="16",Callback=function(t)local n=tonumber(t)if n and LP.Character then local h=LP.Character:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=n end end end})
C3L:Paragraph({Title="跳跃高度",Desc="默认50",Icon="info"})
C3L:TextInput({Title="",Placeholder="输入跳跃数字，如 50",Value="50",Callback=function(t)local n=tonumber(t)if n and LP.Character then local h=LP.Character:FindFirstChildOfClass("Humanoid")if h then h.UseJumpPower=true h.JumpPower=n end end end})
C3L:Paragraph({Title="重力",Desc="默认196.2",Icon="info"})
C3L:TextInput({Title="",Placeholder="输入重力数字，如 196.2",Value="196.2",Callback=function(t)local n=tonumber(t)if n then workspace.Gravity=n N("重力","已设为 "..n,2)end end})
C3L:Paragraph({Title="无限跳",Desc="开启后空中也能跳",Icon="info"})
local IJ
C3L:Toggle({Title="无限跳",Value=false,FeatureName="无限跳",Icon="arrow-up",Callback=function(s)
if s then IJ=UIS.JumpRequest:Connect(function()if LP.Character then local h=LP.Character:FindFirstChildOfClass("Humanoid")if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end end end)N("无限跳","已开启",2)
else if IJ then IJ:Disconnect()IJ=nil end N("无限跳","已关闭",2)end
end})
local C3P=T3:Category({Title="玩家列表",IconName="users"})
local selP=nil
local function bldP()local l={}for _,p in ipairs(Players:GetPlayers())do table.insert(l,p.Name)end if #l==0 then l={"无"}end return l end
local pList=bldP()
local pDD
pDD=C3P:Dropdown({Title="选择玩家",Values=pList,Value=pList[1],Multi=false,Callback=function(s)selP=s N("玩家","已选 "..tostring(s),1)end})
C3P:Button({Text="刷新列表",Icon="refresh-cw",Callback=function()pList=bldP()pDD:UpdateOptions(pList,pList[1])selP=pList[1]N("刷新","共 "..#pList.." 名",2)end})
C3P:Button({Text="传送到所选玩家",Icon="send",Callback=function()if not selP or selP=="无" then N("错误","请先选",2)return end local t=Players:FindFirstChild(selP)if t and t.Character and LP.Character then LP.Character:PivotTo(t.Character:GetPivot())N("传送","已传送",2)end end})
C3P:Button({Text="拉到身边",Icon="arrow-down",Callback=function()if not selP or selP=="无" then N("错误","请先选",2)return end local t=Players:FindFirstChild(selP)if t and t.Character and LP.Character then t.Character:PivotTo(LP.Character:GetPivot())N("拉取","已拉",2)end end})
C3P:Paragraph({Title="甩飞",Desc="强力甩飞，结束归位。自己也会飞，正常",Icon="info"})
local function TXH_SkidFling(TargetPlayer)
local Player=LP
local Character=Player.Character
local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
local RootPart=Humanoid and Humanoid.RootPart
if not(Character and Humanoid and RootPart)then return end
local TCharacter=TargetPlayer.Character
if not TCharacter then return end
local THumanoid=TCharacter:FindFirstChildOfClass("Humanoid")
local TRootPart=THumanoid and THumanoid.RootPart
local THead=TCharacter:FindFirstChild("Head")
local Accessory=TCharacter:FindFirstChildOfClass("Accessory")
local Handle=Accessory and Accessory:FindFirstChild("Handle")
if RootPart.Velocity.Magnitude<50 then getgenv().TXH_OldPos=RootPart.CFrame end
if THumanoid and THumanoid.Sit then return end
if THead then workspace.CurrentCamera.CameraSubject=THead
elseif Handle then workspace.CurrentCamera.CameraSubject=Handle
elseif THumanoid and TRootPart then workspace.CurrentCamera.CameraSubject=THumanoid end
if not TCharacter:FindFirstChildWhichIsA("BasePart")then return end
local oldFPDH=workspace.FallenPartsDestroyHeight
local function FPos(BasePart,Pos,Ang)
RootPart.CFrame=CFrame.new(BasePart.Position)*Pos*Ang
Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position)*Pos*Ang)
RootPart.Velocity=Vector3.new(9e7,9e7*10,9e7)
RootPart.RotVelocity=Vector3.new(9e8,9e8,9e8)
end
local function SFBasePart(BasePart)
local TimeToWait=2
local Time=tick()
local Angle=0
repeat
if RootPart and THumanoid then
if BasePart.Velocity.Magnitude<50 then
Angle=Angle+100
FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(2.25,1.5,-2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(-2.25,-1.5,2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))task.wait()
else
FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,-TRootPart.Velocity.Magnitude/1.25),CFrame.Angles(0,0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()
end
else break end
until BasePart.Velocity.Magnitude>500 or BasePart.Parent~=TargetPlayer.Character or TargetPlayer.Parent~=Players or not TargetPlayer.Character==TCharacter or THumanoid.Sit or Humanoid.Health<=0 or tick()>Time+TimeToWait
end
workspace.FallenPartsDestroyHeight=0/0
local BV=Instance.new("BodyVelocity")
BV.Name="TXHVel"
BV.Parent=RootPart
BV.Velocity=Vector3.new(9e8,9e8,9e8)
BV.MaxForce=Vector3.new(1/0,1/0,1/0)
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
if TRootPart and THead then
if (TRootPart.CFrame.p-THead.CFrame.p).Magnitude>5 then SFBasePart(THead)else SFBasePart(TRootPart)end
elseif TRootPart then SFBasePart(TRootPart)
elseif THead then SFBasePart(THead)
elseif Handle then SFBasePart(Handle)end
BV:Destroy()
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
workspace.CurrentCamera.CameraSubject=Humanoid
workspace.FallenPartsDestroyHeight=oldFPDH
repeat
RootPart.CFrame=getgenv().TXH_OldPos*CFrame.new(0,.5,0)
Character:SetPrimaryPartCFrame(getgenv().TXH_OldPos*CFrame.new(0,.5,0))
Humanoid:ChangeState("GettingUp")
for _,x in ipairs(Character:GetChildren())do if x:IsA("BasePart")then x.Velocity=Vector3.new()x.RotVelocity=Vector3.new()end end
task.wait()
until (RootPart.Position-getgenv().TXH_OldPos.p).Magnitude<25
end
C3P:Button({Text="甩飞所选玩家",Icon="alert-triangle",Callback=function()
if not selP or selP=="无" then N("错误","请先选玩家",2)return end
local t=Players:FindFirstChild(selP)
if not t then N("错误","目标无效",2)return end
local ok,err=pcall(function()TXH_SkidFling(t)end)
if ok then N("甩飞","已甩 "..selP,2)else N("失败",tostring(err):sub(1,80),4)end
end})
C3P:Paragraph({Title="循环甩飞",Desc="持续甩飞所选玩家。很猛但容易被踢",Icon="info"})
local autoFlingOn=false
C3P:Toggle({Title="循环甩飞",Value=false,FeatureName="循环甩飞",Icon="repeat",Callback=function(t)
autoFlingOn=t
if t then
if not selP or selP=="无" then N("错误","请先选玩家",2)autoFlingOn=false return false end
task.spawn(function()
while autoFlingOn do
task.wait()
pcall(function()
local target=Players:FindFirstChild(selP)
if target then TXH_SkidFling(target)end
end)
end
end)
N("循环甩飞","已开启",2)
else N("循环甩飞","已关闭",2)end
end})

local TM=MW:Tab({Title="消息"})
local CM=TM:Category({Title="自动发言设置",IconName="message-circle"})
local sayMessage=""
local sayCount=1
local isSpeaking=false
local speakThread=nil
local function SendChatMessage(msg)
local TCS=game:GetService("TextChatService")
local RS2=game:GetService("ReplicatedStorage")
if TCS.ChatVersion==Enum.ChatVersion.TextChatService then TCS.TextChannels.RBXGeneral:SendAsync(msg)
else RS2.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All")end
end
CM:Paragraph({Title="消息内容",Desc="输入你要说的话",Icon="info"})
CM:TextInput({Title="",Placeholder="在此输入消息",Value="",Callback=function(txt)sayMessage=txt end})
CM:Paragraph({Title="发言次数",Desc="默认1次",Icon="info"})
CM:TextInput({Title="",Placeholder="输入次数，如 1",Value="1",Callback=function(txt)sayCount=tonumber(txt) or 1 end})
CM:Paragraph({Title="发言开关",Desc="开启后按上方次数自动发送",Icon="info"})
CM:Toggle({Title="发言开关",Value=false,FeatureName="自动发言",Icon="send",Callback=function(s)
isSpeaking=s
if s then
if sayMessage=="" then N("错误","请先输入要说的内容",3)isSpeaking=false return false end
speakThread=task.spawn(function()
for i=1,sayCount do
if not isSpeaking then break end
SendChatMessage(sayMessage)
task.wait(0.5)
end
isSpeaking=false
end)
N("消息","开始发送",2)
else if speakThread then task.cancel(speakThread)speakThread=nil end N("消息","已停止",2)end
end})

local TI=MW:Tab({Title="互动"})
local CI=TI:Category({Title="交互优化",IconName="zap"})
CI:Paragraph({Title="快速互动",Desc="把长按交互时间缩短",Icon="info"})
CI:Toggle({Title="快速互动",Value=false,FeatureName="快速互动",Icon="zap",Callback=function(s)
if s then
local PPS=game:GetService("ProximityPromptService")
getgenv().TXH_FastPrompt=PPS.PromptButtonHoldBegan:Connect(function(prompt)pcall(function()prompt.HoldDuration=0 end)end)
getgenv().TXH_FastPromptNew=workspace.DescendantAdded:Connect(function(v)if v:IsA("ProximityPrompt")then pcall(function()v.HoldDuration=0 end)end end)
for _,prompt in pairs(workspace:GetDescendants())do if prompt:IsA("ProximityPrompt")then pcall(function()prompt.HoldDuration=0 end)end end
N("快速互动","已开启",2)
else
if getgenv().TXH_FastPrompt then getgenv().TXH_FastPrompt:Disconnect()getgenv().TXH_FastPrompt=nil end
if getgenv().TXH_FastPromptNew then getgenv().TXH_FastPromptNew:Disconnect()getgenv().TXH_FastPromptNew=nil end
for _,prompt in pairs(workspace:GetDescendants())do if prompt:IsA("ProximityPrompt")then pcall(function()prompt.HoldDuration=0.5 end)end end
N("快速互动","已关闭",2)
end
end})
CI:Paragraph({Title="交互距离",Desc="默认10，推荐50~200",Icon="info"})
CI:TextInput({Title="",Placeholder="输入距离数字，默认 10",Value="10",Callback=function(t)
local n=tonumber(t)
if n then
getgenv().TXH_InteractDist=n
for _,v in pairs(workspace:GetDescendants())do if v:IsA("ProximityPrompt")then pcall(function()v.MaxActivationDistance=n end)end end
N("交互距离","已设为 "..n,2)
end
end})
CI:Paragraph({Title="自动互动",Desc="每0.25秒扫一次自动触发附近按钮",Icon="info"})
local autoInteractOn=false
CI:Toggle({Title="自动互动",Value=false,FeatureName="自动互动",Icon="refresh-cw",Callback=function(s)
autoInteractOn=s
if s then
task.spawn(function()
while autoInteractOn do
for _,descendant in pairs(workspace:GetDescendants())do
if descendant:IsA("ProximityPrompt")then pcall(function()fireproximityprompt(descendant)end)end
end
task.wait(0.25)
end
end)
N("自动互动","已开启",2)
else N("自动互动","已关闭",2)end
end})

-- ========== 互动物体高亮（通用版） ==========
local EMFConn=nil
local EMFTracked={}
local EMFConfig={Color=Color3.fromRGB(0,200,255),UseHighlight=true,UseBox=false,ShowLabel=true,LabelText="互动"}

local function emfGetPart(obj)
    local a=obj
    for _=1,5 do
        if not a or a==workspace then return nil end
        if a:IsA("BasePart") then return a end
        a=a.Parent
    end
    return nil
end

local function emfMark(part)
    if not part or EMFTracked[part] then return end
    if Players:GetPlayerFromCharacter(part) then return end
    local d={}
    pcall(function()
        if EMFConfig.UseHighlight then
            local h=Instance.new("Highlight")
            h.Name="TXH_EMF_HL"
            h.FillColor=EMFConfig.Color
            h.OutlineColor=EMFConfig.Color
            h.FillTransparency=0.6
            h.OutlineTransparency=0
            h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
            h.Adornee=part
            h.Parent=part
            d.hl=h
        end
        if EMFConfig.UseBox then
            local sb=Instance.new("SelectionBox")
            sb.Name="TXH_EMF_SB"
            sb.Color3=EMFConfig.Color
            sb.LineThickness=0.1
            sb.Adornee=part
            sb.Parent=part
            d.sb=sb
        end
        if EMFConfig.ShowLabel then
            local bb=Instance.new("BillboardGui")
            bb.Name="TXH_EMF_BB"
            bb.Size=UDim2.new(0,120,0,32)
            bb.StudsOffset=Vector3.new(0,2.5,0)
            bb.AlwaysOnTop=true
            bb.MaxDistance=math.huge
            bb.Adornee=part
            local lbl=Instance.new("TextLabel")
            lbl.Size=UDim2.new(1,0,1,0)
            lbl.BackgroundTransparency=1
            lbl.Text=EMFConfig.LabelText
            lbl.TextColor3=EMFConfig.Color
            lbl.TextStrokeTransparency=0
            lbl.TextStrokeColor3=Color3.new(0,0,0)
            lbl.TextScaled=true
            lbl.Font=Enum.Font.GothamBold
            lbl.Parent=bb
            bb.Parent=part
            d.bb=bb
            d.lbl=lbl
        end
    end)
    EMFTracked[part]=d
end

local function emfUnmark(part)
    local d=EMFTracked[part]
    if d then
        pcall(function() if d.hl then d.hl:Destroy() end end)
        pcall(function() if d.sb then d.sb:Destroy() end end)
        pcall(function() if d.bb then d.bb:Destroy() end end)
        EMFTracked[part]=nil
    end
end

local function emfScanAll()
    for _,obj in ipairs(workspace:GetDescendants())do
        if obj:IsA("ProximityPrompt") or obj:IsA("ClickDetector") then
            local part=emfGetPart(obj)
            if part then emfMark(part) end
        end
    end
end

local function emfOnAdded(obj)
    if obj:IsA("ProximityPrompt") or obj:IsA("ClickDetector") then
        task.wait(0.1)
        local part=emfGetPart(obj)
        if part then emfMark(part) end
    end
end

local function emfClearAll()
    for part,_ in pairs(EMFTracked)do emfUnmark(part) end
    EMFTracked={}
end

CI:Paragraph({Title="互动透视",Desc="高亮场景里所有可交互物体",Icon="eye"})
CI:Toggle({Title="内部发光",Value=true,FeatureName="互动发光",Icon="sun",Callback=function(s)
    EMFConfig.UseHighlight=s
    if s then for part,d in pairs(EMFTracked)do if not d.hl then emfMark(part) end end
    else for part,d in pairs(EMFTracked)do if d.hl then pcall(function()d.hl:Destroy()end) d.hl=nil end end end
end})
CI:Toggle({Title="方框描边",Value=false,FeatureName="互动方框",Icon="square",Callback=function(s)
    EMFConfig.UseBox=s
    if s then for part,d in pairs(EMFTracked)do if not d.sb then emfMark(part) end end
    else for part,d in pairs(EMFTracked)do if d.sb then pcall(function()d.sb:Destroy()end) d.sb=nil end end end
end})
CI:Toggle({Title="显示文字",Value=true,FeatureName="互动文字",Icon="type",Callback=function(s)
    EMFConfig.ShowLabel=s
    if s then for part,d in pairs(EMFTracked)do if not d.bb then emfMark(part) end end
    else for part,d in pairs(EMFTracked)do if d.bb then pcall(function()d.bb:Destroy()end) d.bb=nil end end end
end})
CI:Paragraph({Title="文字内容",Desc="改完重开透视生效",Icon="info"})
CI:TextInput({Title="",Placeholder="默认: 互动",Value="互动",Callback=function(t)
    if t and t~="" then
        EMFConfig.LabelText=t
        for _,d in pairs(EMFTracked)do if d.lbl then d.lbl.Text=t end end
    end
end})
CI:Paragraph({Title="颜色",Desc="高亮颜色",Icon="palette"})
CI:ColorPickerButton({Title="互动颜色",Default=Color3.fromRGB(0,200,255),Callback=function(color)
    EMFConfig.Color=color
    for _,d in pairs(EMFTracked)do
        pcall(function() if d.hl then d.hl.FillColor=color d.hl.OutlineColor=color end end)
        pcall(function() if d.sb then d.sb.Color3=color end end)
        pcall(function() if d.lbl then d.lbl.TextColor3=color end end)
    end
end})
CI:Toggle({Title="开启互动透视",Value=false,FeatureName="互动透视开关",Icon="eye",Callback=function(s)
if s then
    emfScanAll()
    EMFConn=workspace.DescendantAdded:Connect(emfOnAdded)
    N("互动透视","已开启",2)
else
    if EMFConn then EMFConn:Disconnect()EMFConn=nil end
    emfClearAll()
    N("互动透视","已关闭",2)
end
end})

local TN=MW:Tab({Title="夜视"})
local C4V=TN:Category({Title="夜视",IconName="sun"})
C4V:Paragraph({Title="夜视",Desc="开启后环境变亮，夜里也能看清",Icon="info"})
C4V:Toggle({Title="夜视",Value=false,FeatureName="夜视",Icon="sun",Callback=function(s)
if s then LG.Ambient=Color3.new(1,1,1)else LG.Ambient=Color3.new(0,0,0)end
end})
C4V:Paragraph({Title="去雾",Desc="开启后去除雾气，关闭恢复原状",Icon="info"})
local fogOrigStart=LG.FogStart
local fogOrigEnd=LG.FogEnd
C4V:Toggle({Title="去雾",Value=false,FeatureName="去雾",Icon="cloud-off",Callback=function(s)
if s then
fogOrigStart=LG.FogStart
fogOrigEnd=LG.FogEnd
LG.FogStart=0
LG.FogEnd=100000000000000000000000
N("去雾","已开启",2)
else
LG.FogStart=fogOrigStart
LG.FogEnd=fogOrigEnd
N("去雾","已关闭",2)
end
end})

-- ===== 去阴影 =====
C4V:Paragraph({Title="去阴影",Desc="去掉全局阴影和所有部件的投影（手机端性能也会更好）",Icon="moon"})
local shadowOriginals={}
local noShadowConn=nil
local origGlobalShadows=LG.GlobalShadows

local function noShadowApply(part)
    if part:IsA("BasePart") and part.CastShadow then
        if shadowOriginals[part]==nil then shadowOriginals[part]=true end
        pcall(function() part.CastShadow=false end)
    end
end

C4V:Toggle({Title="去阴影",Value=false,FeatureName="去阴影",Icon="moon",Callback=function(s)
    if s then
        origGlobalShadows=LG.GlobalShadows
        pcall(function() LG.GlobalShadows=false end)
        for _,d in ipairs(workspace:GetDescendants())do
            if d:IsA("BasePart") then noShadowApply(d) end
        end
        noShadowConn=workspace.DescendantAdded:Connect(function(d)
            if d:IsA("BasePart") then noShadowApply(d) end
        end)
        N("去阴影","已开启",2)
    else
        pcall(function() LG.GlobalShadows=origGlobalShadows end)
        if noShadowConn then noShadowConn:Disconnect()noShadowConn=nil end
        for part,_ in pairs(shadowOriginals)do
            pcall(function()
                if part and part.Parent then part.CastShadow=true end
            end)
        end
        shadowOriginals={}
        N("去阴影","已关闭",2)
    end
end})

local T4=MW:Tab({Title="透视"})
local C4F=T4:Category({Title="玩家ESP",IconName="eye"})
local ESPConfig={Enabled=false,ShowName=true,ShowHealth=false,ShowDistance=false,ShowWeapon=false,ShowTeam=false,ShowBackpack=false,FillTransparency=0.5,OutlineTransparency=0.2,TextSize=14,TextOutline=true,TeammateColor=Color3.fromRGB(0,255,100),EnemyColor=Color3.fromRGB(255,50,50),MaxDistance=2000,UseDistanceFade=true,TeamCheck=true,HighlightEnabled=true,BoxOutlineEnabled=true,WallhackEnabled=false,NameTagSize=1.0,HealthBarEnabled=true,DistanceScale=true,UpdateRate=30}
local ESPCache={}
local LastUpdateTime=0
local function CalcVis(d,mx)if d>mx then return 0 end local fs=mx*0.8 if d>fs then return 1-((d-fs)/(mx-fs))end return 1 end
local function CalcColor(esp,hum,d)local isT=ESPConfig.TeamCheck and esp.Player.Team==LP.Team return isT and ESPConfig.TeammateColor or ESPConfig.EnemyColor end
local function IsBehindWall(c)if not ESPConfig.WallhackEnabled then return false end local hrp=c:FindFirstChild("HumanoidRootPart")if not hrp then return true end local ray=Ray.new(Cam.CFrame.Position,(hrp.Position-Cam.CFrame.Position).Unit*100)local f={Cam}if LP.Character then table.insert(f,LP.Character)end table.insert(f,c)local part,_=workspace:FindPartOnRayWithIgnoreList(ray,f)return part~=nil end
local function GetWeapon(c)local t=c:FindFirstChildOfClass("Tool")return t and t.Name or "没武器" end
local function GetBackpack(p)local w={}if p:FindFirstChild("Backpack")then for _,t in ipairs(p.Backpack:GetChildren())do if t:IsA("Tool")then table.insert(w,t.Name)end end end return #w>0 and table.concat(w,", ")or "没武器" end
local CleanupESP
local function CreateESP(c,p)
if not c or not c.Parent or ESPCache[c]then return end
local hrp=c:FindFirstChild("HumanoidRootPart")if not hrp then return end
local esp={Character=c,Player=p,Highlight=nil,Billboard=nil,HealthBar=nil,Connections={}}
esp.Highlight=Instance.new("Highlight")esp.Highlight.Name="ESP_HL"esp.Highlight.FillColor=Color3.new(1,1,1)esp.Highlight.OutlineColor=Color3.new(0,0,0)esp.Highlight.FillTransparency=ESPConfig.FillTransparency esp.Highlight.OutlineTransparency=ESPConfig.OutlineTransparency esp.Highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop esp.Highlight.Enabled=ESPConfig.Enabled and ESPConfig.HighlightEnabled esp.Highlight.Parent=c
esp.Billboard=Instance.new("BillboardGui")esp.Billboard.Name="ESP_BB"esp.Billboard.AlwaysOnTop=true esp.Billboard.Size=UDim2.new(0,200*ESPConfig.NameTagSize,0,60*ESPConfig.NameTagSize)esp.Billboard.StudsOffset=Vector3.new(0,3,0)esp.Billboard.Adornee=hrp esp.Billboard.Enabled=ESPConfig.Enabled esp.Billboard.MaxDistance=ESPConfig.MaxDistance esp.Billboard.Parent=c
local lbl=Instance.new("TextLabel")lbl.Name="ESP_LBL"lbl.BackgroundTransparency=1 lbl.Size=UDim2.new(1,0,1,0)lbl.TextColor3=Color3.new(1,1,1)lbl.TextSize=ESPConfig.TextSize*ESPConfig.NameTagSize lbl.Font=Enum.Font.SourceSansBold lbl.TextStrokeTransparency=ESPConfig.TextOutline and 0.5 or 1 lbl.TextStrokeColor3=Color3.new(0,0,0)lbl.Text=""lbl.ZIndex=10 lbl.Parent=esp.Billboard
if ESPConfig.HealthBarEnabled then
local hb=Instance.new("Frame")hb.Name="ESP_HB"hb.BackgroundColor3=Color3.new(0.2,0.2,0.2)hb.BorderSizePixel=0 hb.Size=UDim2.new(1,0,0,4*ESPConfig.NameTagSize)hb.Position=UDim2.new(0,0,1,0)hb.ZIndex=11 hb.Parent=esp.Billboard
local hf=Instance.new("Frame")hf.Name="ESP_HF"hf.BackgroundColor3=Color3.new(0,1,0)hf.BorderSizePixel=0 hf.Size=UDim2.new(1,0,1,0)hf.ZIndex=12 hf.Parent=hb
esp.HealthBar=hf
end
esp.Connections.cr=c.AncestryChanged:Connect(function(_,par)if not par then CleanupESP(c)end end)
ESPCache[c]=esp
end
CleanupESP=function(c)
local esp=ESPCache[c]
if esp then
for _,cn in pairs(esp.Connections)do cn:Disconnect()end
if esp.Highlight then esp.Highlight:Destroy()end
if esp.Billboard then esp.Billboard:Destroy()end
ESPCache[c]=nil
end
end
local function UpdateESP()
local ct=tick()
if ct-LastUpdateTime<(1/ESPConfig.UpdateRate)then return end
LastUpdateTime=ct
if not ESPConfig.Enabled then
for _,esp in pairs(ESPCache)do
if esp.Highlight then esp.Highlight.Enabled=false end
if esp.Billboard then esp.Billboard.Enabled=false end
end
return
end
for c,esp in pairs(ESPCache)do
if not c or not c.Parent then CleanupESP(c)continue end
local hrp=c:FindFirstChild("HumanoidRootPart")if not hrp then continue end
local hum=c:FindFirstChildOfClass("Humanoid")
if not hum or hum.Health<=0 then
if esp.Highlight then esp.Highlight.Enabled=false end
if esp.Billboard then esp.Billboard.Enabled=false end
continue
end
local d=(hrp.Position-Cam.CFrame.Position).Magnitude
local v=CalcVis(d,ESPConfig.MaxDistance)
if v<=0 then
if esp.Highlight then esp.Highlight.Enabled=false end
if esp.Billboard then esp.Billboard.Enabled=false end
continue
end
local col=CalcColor(esp,hum,d)
local am=ESPConfig.UseDistanceFade and v or 1
local bw=IsBehindWall(c)
if esp.Highlight then
esp.Highlight.FillColor=col esp.Highlight.OutlineColor=Color3.new(0,0,0)
esp.Highlight.FillTransparency=ESPConfig.FillTransparency+(0.3*(1-am))
if ESPConfig.BoxOutlineEnabled then esp.Highlight.OutlineTransparency=ESPConfig.OutlineTransparency+(0.3*(1-am))else esp.Highlight.OutlineTransparency=1 end
esp.Highlight.Enabled=ESPConfig.HighlightEnabled and(not bw or ESPConfig.WallhackEnabled)
end
local lbl=esp.Billboard:FindFirstChildOfClass("TextLabel")
if lbl then
local parts={}
if ESPConfig.ShowName then table.insert(parts,esp.Player.Name)end
if ESPConfig.ShowHealth then table.insert(parts,string.format("HP: %d/%d",math.floor(hum.Health),math.floor(hum.MaxHealth)))end
if ESPConfig.ShowDistance then table.insert(parts,string.format("%dm",math.floor(d)))end
if ESPConfig.ShowWeapon then table.insert(parts,GetWeapon(c))end
if ESPConfig.ShowBackpack then local bwp=GetBackpack(esp.Player)if bwp~="没武器"then table.insert(parts,"背包: "..bwp)end end
if ESPConfig.ShowTeam then local isT=ESPConfig.TeamCheck and esp.Player.Team==LP.Team table.insert(parts,isT and "队友"or "敌人")end
if bw and ESPConfig.WallhackEnabled then table.insert(parts,"[墙后]")end
lbl.Text=table.concat(parts," | ")
lbl.TextColor3=col
lbl.TextTransparency=ESPConfig.UseDistanceFade and(0.3*(1-am))or 0
lbl.TextSize=ESPConfig.TextSize*(ESPConfig.DistanceScale and math.clamp(1.5-(d/1000)*0.5,0.8,1.5)or 1)*ESPConfig.NameTagSize
esp.Billboard.Enabled=#parts>0 and(not bw or ESPConfig.WallhackEnabled)
end
if esp.HealthBar then
local hp=hum.Health/hum.MaxHealth
esp.HealthBar.Size=UDim2.new(hp,0,1,0)
esp.HealthBar.BackgroundColor3=Color3.new(1-hp,hp,0)
end
end
end
local function RecreateAllESP()
for c,_ in pairs(ESPCache)do CleanupESP(c)end
if ESPConfig.Enabled then
for _,p in ipairs(Players:GetPlayers())do
if p~=LP and p.Character then CreateESP(p.Character,p)end
end
end
UpdateESP()
end
local function InitPlayerESP(p)
if p==LP then return end
local function CharAdd(c)task.wait(0.5)if ESPConfig.Enabled then CreateESP(c,p)end end
if p.Character and ESPConfig.Enabled then task.spawn(CharAdd,p.Character)end
p.CharacterAdded:Connect(CharAdd)
p.CharacterRemoving:Connect(function(c)CleanupESP(c)end)
end
RS.Heartbeat:Connect(function()if not LP.Character then return end pcall(UpdateESP)end)
if ESPConfig.Enabled then
for _,p in ipairs(Players:GetPlayers())do if p~=LP then InitPlayerESP(p)end end
end
Players.PlayerAdded:Connect(InitPlayerESP)
C4F:Paragraph({Title="ESP 主开关",Desc="开启后下方元素生效",Icon="info"})
C4F:Toggle({Title="开启ESP",Value=false,FeatureName="ESP",Icon="eye",Callback=function(s)
ESPConfig.Enabled=s
if s then RecreateAllESP()
else
for c,esp in pairs(ESPCache)do
if esp.Highlight then esp.Highlight:Destroy()end
if esp.Billboard then esp.Billboard:Destroy()end
end
ESPCache={}
end
end})
C4F:Paragraph({Title="视觉效果",Desc="Highlight 的填充和描边",Icon="info"})
C4F:Toggle({Title="内部发光",Value=false,FeatureName="发光",Icon="sun",Callback=function(s)
ESPConfig.HighlightEnabled=s
for _,esp in pairs(ESPCache)do if esp.Highlight then esp.Highlight.Enabled=s and ESPConfig.Enabled end end
end})
C4F:Toggle({Title="方框描边",Value=false,FeatureName="描边",Icon="square",Callback=function(s)
ESPConfig.BoxOutlineEnabled=s
for _,esp in pairs(ESPCache)do if esp.Highlight then esp.Highlight.OutlineTransparency=s and ESPConfig.OutlineTransparency or 1 end end
end})
C4F:Paragraph({Title="显示内容",Desc="勾选你想看的元素",Icon="info"})
C4F:Toggle({Title="显示玩家名字",Value=true,FeatureName="名字",Icon="type",Callback=function(s)ESPConfig.ShowName=s UpdateESP()end})
C4F:Toggle({Title="显示血量",Value=false,FeatureName="血量",Icon="heart",Callback=function(s)ESPConfig.ShowHealth=s UpdateESP()end})
C4F:Toggle({Title="显示距离",Value=false,FeatureName="距离",Icon="ruler",Callback=function(s)ESPConfig.ShowDistance=s UpdateESP()end})
C4F:Toggle({Title="显示武器",Value=false,FeatureName="武器",Icon="sword",Callback=function(s)ESPConfig.ShowWeapon=s UpdateESP()end})
C4F:Toggle({Title="显示背包",Value=false,FeatureName="背包",Icon="package",Callback=function(s)ESPConfig.ShowBackpack=s UpdateESP()end})
C4F:Toggle({Title="显示队伍",Value=false,FeatureName="队伍",Icon="users",Callback=function(s)ESPConfig.ShowTeam=s UpdateESP()end})
C4F:Paragraph({Title="颜色",Desc="自定义队友和敌人的颜色",Icon="palette"})
C4F:ColorPickerButton({Title="队友颜色",Default=Color3.fromRGB(0,255,100),Callback=function(color,alpha)ESPConfig.TeammateColor=color UpdateESP()end})
C4F:ColorPickerButton({Title="敌人颜色",Default=Color3.fromRGB(255,50,50),Callback=function(color,alpha)ESPConfig.EnemyColor=color UpdateESP()end})
C4F:Paragraph({Title="高级检测",Desc="队伍 / 穿墙 / 距离",Icon="info"})
C4F:Toggle({Title="队伍检测",Value=true,FeatureName="队伍检测",Icon="users",Callback=function(s)ESPConfig.TeamCheck=s UpdateESP()end})
C4F:Toggle({Title="穿墙显示",Value=false,FeatureName="穿墙",Icon="shield-off",Callback=function(s)ESPConfig.WallhackEnabled=s UpdateESP()end})
C4F:Toggle({Title="距离缩放",Value=true,FeatureName="距离缩放",Icon="maximize",Callback=function(s)ESPConfig.DistanceScale=s UpdateESP()end})
C4F:Toggle({Title="距离淡化",Value=true,FeatureName="距离淡化",Icon="eye-off",Callback=function(s)ESPConfig.UseDistanceFade=s UpdateESP()end})
C4F:Paragraph({Title="其他",Desc="距离和样式",Icon="info"})
C4F:Slider({Title="最大距离",Min=500,Max=5000,Default=2000,Ticks=45,Callback=function(v)ESPConfig.MaxDistance=v end})
C4F:Slider({Title="名字大小",Min=0.5,Max=2,Default=1,Ticks=15,Callback=function(v)
ESPConfig.NameTagSize=v
if ESPConfig.Enabled then RecreateAllESP()end
end})

local TF=MW:Tab({Title="滤镜与光影"})
local CF1=TF:Category({Title="画质设置",IconName="sun"})
CF1:Paragraph({Title="外部光影",Desc="点按钮加载对应的光影脚本",Icon="info"})
CF1:Button({Text="自定义画质包",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet('https://pastefy.app/xXkUxA0P/raw',true))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="巨好看光影",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="高亮全图",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="着色器",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/JeckAsChristopher/h/refs/heads/main/loader.lua"))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="自定义光影",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/lyraEz/gvb/refs/heads/main/DeepGraphicsHub.lua'))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="白光影",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%99%BD%E5%85%89%E5%BD%B1.txt"))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="夜晚",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%A4%9C%E6%99%9A.txt"))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CF1:Button({Text="RTX光影V1",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/RTXv1.txt"))()end)if ok then N("光影","加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
local CF2=TF:Category({Title="环境光颜色",IconName="palette"})
CF2:Paragraph({Title="环境光",Desc="快速切换环境光颜色",Icon="info"})
CF2:Button({Text="恢复默认",Icon="refresh-cw",Callback=function()LG.Ambient=Color3.new(0,0,0)N("滤镜","已恢复默认",2)end})
CF2:Button({Text="全亮",Icon="sun",Callback=function()LG.Ambient=Color3.new(1,1,1)N("滤镜","全亮",2)end})
CF2:Button({Text="超亮",Icon="sun",Callback=function()LG.Ambient=Color3.new(2,2,2)N("滤镜","超亮",2)end})
CF2:Button({Text="红色",Icon="palette",Callback=function()LG.Ambient=Color3.new(1,0,0)end})
CF2:Button({Text="绿色",Icon="palette",Callback=function()LG.Ambient=Color3.new(0,1,0)end})
CF2:Button({Text="蓝色",Icon="palette",Callback=function()LG.Ambient=Color3.new(0,0,1)end})
local CF3=TF:Category({Title="一键滤镜",IconName="sparkles"})
CF3:Paragraph({Title="内置滤镜",Desc="点一下直接应用",Icon="info"})
local function clearPost()for _,v in ipairs(LG:GetDescendants())do if v:IsA("PostEffect")and v.Name:sub(1,4)=="TXH_"then v:Destroy()end end end
CF3:Button({Text="电影感",Icon="video",Callback=function()clearPost()local cc=Instance.new("ColorCorrectionEffect")cc.Name="TXH_CC"cc.Saturation=0.1 cc.Contrast=0.2 cc.Brightness=-0.05 cc.Parent=LG LG.FogColor=Color3.fromRGB(80,80,90)LG.FogEnd=600 N("滤镜","电影感",2)end})
CF3:Button({Text="鲜艳",Icon="palette",Callback=function()clearPost()local cc=Instance.new("ColorCorrectionEffect")cc.Name="TXH_CC"cc.Saturation=0.5 cc.Contrast=0.15 cc.Brightness=0.05 cc.Parent=LG N("滤镜","鲜艳",2)end})
CF3:Button({Text="暗黑",Icon="moon",Callback=function()clearPost()local cc=Instance.new("ColorCorrectionEffect")cc.Name="TXH_CC"cc.Saturation=-0.3 cc.Contrast=0.4 cc.Brightness=-0.2 cc.Parent=LG LG.Ambient=Color3.new(0.1,0.1,0.1)N("滤镜","暗黑",2)end})
CF3:Button({Text="复古",Icon="camera",Callback=function()clearPost()local cc=Instance.new("ColorCorrectionEffect")cc.Name="TXH_CC"cc.Saturation=-0.2 cc.TintColor=Color3.fromRGB(255,220,180)cc.Contrast=0.1 cc.Parent=LG N("滤镜","复古",2)end})
CF3:Button({Text="霓虹",Icon="sparkles",Callback=function()clearPost()local b=Instance.new("BloomEffect")b.Name="TXH_Bloom"b.Intensity=2 b.Size=30 b.Threshold=0.6 b.Parent=LG local cc=Instance.new("ColorCorrectionEffect")cc.Name="TXH_CC"cc.Saturation=0.4 cc.Parent=LG N("滤镜","霓虹",2)end})
CF3:Button({Text="恢复原状",Icon="refresh-cw",Callback=function()clearPost()LG.Ambient=Color3.fromRGB(0,0,0)LG.OutdoorAmbient=Color3.fromRGB(128,128,128)LG.Brightness=1 LG.ExposureCompensation=0 LG.FogStart=0 LG.FogEnd=1000 LG.FogColor=Color3.fromRGB(192,192,192)N("滤镜","已恢复原状",2)end})

-- ============ 动画区（手机端兼容版·修复版） ============
local TA=MW:Tab({Title="动画"})
local CA=TA:Category({Title="动画包",IconName="star"})

local function LoadTrack(hum,anim)
    local animator=hum:FindFirstChildOfClass("Animator")
    if animator then return animator:LoadAnimation(anim) end
    return hum:LoadAnimation(anim)
end

local function SetAnimations(animData, packName)
    local c=LP.Character
    if not c then N("错误","角色未加载",3) return end
    local Animate=c:FindFirstChild("Animate")
    local hum=c:FindFirstChildOfClass("Humanoid")
    if not (Animate and hum) then N("错误","缺少 Animate/Humanoid",3) return end
    Animate.Disabled=true
    for _,track in pairs(hum:GetPlayingAnimationTracks()) do
        pcall(function() track:Stop() end)
    end
    pcall(function() Animate.idle.Animation1.AnimationId=animData.idle1 end)
    pcall(function() Animate.idle.Animation2.AnimationId=animData.idle2 end)
    pcall(function() Animate.walk.WalkAnim.AnimationId=animData.walk end)
    pcall(function() Animate.run.RunAnim.AnimationId=animData.run end)
    pcall(function() Animate.jump.JumpAnim.AnimationId=animData.jump end)
    pcall(function() Animate.climb.ClimbAnim.AnimationId=animData.climb end)
    pcall(function() Animate.fall.FallAnim.AnimationId=animData.fall end)
    pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
    Animate.Disabled=false
    N("动画",(packName or "动画").." 已应用",3)
end

local AnimationPacks={
    {name="吸血鬼",data={idle1="http://www.roblox.com/asset/?id=1083445855",idle2="http://www.roblox.com/asset/?id=1083450166",walk="http://www.roblox.com/asset/?id=1083473930",run="http://www.roblox.com/asset/?id=1083462077",jump="http://www.roblox.com/asset/?id=1083455352",climb="http://www.roblox.com/asset/?id=1083439238",fall="http://www.roblox.com/asset/?id=1083443587"}},
    {name="英雄",data={idle1="http://www.roblox.com/asset/?id=616111295",idle2="http://www.roblox.com/asset/?id=616113536",walk="http://www.roblox.com/asset/?id=616122287",run="http://www.roblox.com/asset/?id=616117076",jump="http://www.roblox.com/asset/?id=616115533",climb="http://www.roblox.com/asset/?id=616104706",fall="http://www.roblox.com/asset/?id=616108001"}},
    {name="经典僵尸",data={idle1="http://www.roblox.com/asset/?id=616158929",idle2="http://www.roblox.com/asset/?id=616160636",walk="http://www.roblox.com/asset/?id=616168032",run="http://www.roblox.com/asset/?id=616163682",jump="http://www.roblox.com/asset/?id=616161997",climb="http://www.roblox.com/asset/?id=616156119",fall="http://www.roblox.com/asset/?id=616157476"}},
    {name="法师",data={idle1="http://www.roblox.com/asset/?id=707742142",idle2="http://www.roblox.com/asset/?id=707855907",walk="http://www.roblox.com/asset/?id=707897309",run="http://www.roblox.com/asset/?id=707861613",jump="http://www.roblox.com/asset/?id=707853694",climb="http://www.roblox.com/asset/?id=707826056",fall="http://www.roblox.com/asset/?id=707829716"}},
    {name="幽灵",data={idle1="http://www.roblox.com/asset/?id=616006778",idle2="http://www.roblox.com/asset/?id=616008087",walk="http://www.roblox.com/asset/?id=616010382",run="http://www.roblox.com/asset/?id=616013216",jump="http://www.roblox.com/asset/?id=616008936",climb="http://www.roblox.com/asset/?id=616003713",fall="http://www.roblox.com/asset/?id=616005863"}},
    {name="长者",data={idle1="http://www.roblox.com/asset/?id=845397899",idle2="http://www.roblox.com/asset/?id=845400520",walk="http://www.roblox.com/asset/?id=845403856",run="http://www.roblox.com/asset/?id=845386501",jump="http://www.roblox.com/asset/?id=845398858",climb="http://www.roblox.com/asset/?id=845392038",fall="http://www.roblox.com/asset/?id=845396048"}},
    {name="悬浮",data={idle1="http://www.roblox.com/asset/?id=616006778",idle2="http://www.roblox.com/asset/?id=616008087",walk="http://www.roblox.com/asset/?id=616013216",run="http://www.roblox.com/asset/?id=616010382",jump="http://www.roblox.com/asset/?id=616008936",climb="http://www.roblox.com/asset/?id=616003713",fall="http://www.roblox.com/asset/?id=616005863"}},
    {name="宇航员",data={idle1="http://www.roblox.com/asset/?id=891621366",idle2="http://www.roblox.com/asset/?id=891633237",walk="http://www.roblox.com/asset/?id=891667138",run="http://www.roblox.com/asset/?id=891636393",jump="http://www.roblox.com/asset/?id=891627522",climb="http://www.roblox.com/asset/?id=891609353",fall="http://www.roblox.com/asset/?id=891617961"}},
    {name="忍者",data={idle1="http://www.roblox.com/asset/?id=656117400",idle2="http://www.roblox.com/asset/?id=656118341",walk="http://www.roblox.com/asset/?id=656121766",run="http://www.roblox.com/asset/?id=656118852",jump="http://www.roblox.com/asset/?id=656117878",climb="http://www.roblox.com/asset/?id=656114359",fall="http://www.roblox.com/asset/?id=656115606"}},
    {name="狼人",data={idle1="http://www.roblox.com/asset/?id=1083195517",idle2="http://www.roblox.com/asset/?id=1083214717",walk="http://www.roblox.com/asset/?id=1083178339",run="http://www.roblox.com/asset/?id=1083216690",jump="http://www.roblox.com/asset/?id=1083218792",climb="http://www.roblox.com/asset/?id=1083182000",fall="http://www.roblox.com/asset/?id=1083189019"}},
    {name="卡通",data={idle1="http://www.roblox.com/asset/?id=742637544",idle2="http://www.roblox.com/asset/?id=742638445",walk="http://www.roblox.com/asset/?id=742640026",run="http://www.roblox.com/asset/?id=742638842",jump="http://www.roblox.com/asset/?id=742637942",climb="http://www.roblox.com/asset/?id=742636889",fall="http://www.roblox.com/asset/?id=742637151"}},
    {name="海盗",data={idle1="http://www.roblox.com/asset/?id=750781874",idle2="http://www.roblox.com/asset/?id=750782770",walk="http://www.roblox.com/asset/?id=750785693",run="http://www.roblox.com/asset/?id=750783738",jump="http://www.roblox.com/asset/?id=750782230",climb="http://www.roblox.com/asset/?id=750779899",fall="http://www.roblox.com/asset/?id=750780242"}},
    {name="潜行",data={idle1="http://www.roblox.com/asset/?id=1132473842",idle2="http://www.roblox.com/asset/?id=1132477671",walk="http://www.roblox.com/asset/?id=1132510133",run="http://www.roblox.com/asset/?id=1132494274",jump="http://www.roblox.com/asset/?id=1132489853",climb="http://www.roblox.com/asset/?id=1132461372",fall="http://www.roblox.com/asset/?id=1132469004"}},
    {name="玩具",data={idle1="http://www.roblox.com/asset/?id=782841498",idle2="http://www.roblox.com/asset/?id=782845736",walk="http://www.roblox.com/asset/?id=782843345",run="http://www.roblox.com/asset/?id=782842708",jump="http://www.roblox.com/asset/?id=782847020",climb="http://www.roblox.com/asset/?id=782843869",fall="http://www.roblox.com/asset/?id=782846423"}},
    {name="骑士",data={idle1="http://www.roblox.com/asset/?id=657595757",idle2="http://www.roblox.com/asset/?id=657568135",walk="http://www.roblox.com/asset/?id=657552124",run="http://www.roblox.com/asset/?id=657564596",jump="http://www.roblox.com/asset/?id=658409194",climb="http://www.roblox.com/asset/?id=658360781",fall="http://www.roblox.com/asset/?id=657600338"}},
    {name="自信",data={idle1="http://www.roblox.com/asset/?id=1069977950",idle2="http://www.roblox.com/asset/?id=1069987858",walk="http://www.roblox.com/asset/?id=1070017263",run="http://www.roblox.com/asset/?id=1070001516",jump="http://www.roblox.com/asset/?id=1069984524",climb="http://www.roblox.com/asset/?id=1069946257",fall="http://www.roblox.com/asset/?id=1069973677"}},
    {name="流行明星",data={idle1="http://www.roblox.com/asset/?id=1212900985",idle2="http://www.roblox.com/asset/?id=1212900985",walk="http://www.roblox.com/asset/?id=1212980338",run="http://www.roblox.com/asset/?id=1212980348",jump="http://www.roblox.com/asset/?id=1212954642",climb="http://www.roblox.com/asset/?id=1213044953",fall="http://www.roblox.com/asset/?id=1212900995"}},
    {name="公主",data={idle1="http://www.roblox.com/asset/?id=941003647",idle2="http://www.roblox.com/asset/?id=941013098",walk="http://www.roblox.com/asset/?id=941028902",run="http://www.roblox.com/asset/?id=941015281",jump="http://www.roblox.com/asset/?id=941008832",climb="http://www.roblox.com/asset/?id=940996062",fall="http://www.roblox.com/asset/?id=941000007"}},
    {name="牛仔",data={idle1="http://www.roblox.com/asset/?id=1014390418",idle2="http://www.roblox.com/asset/?id=1014398616",walk="http://www.roblox.com/asset/?id=1014421541",run="http://www.roblox.com/asset/?id=1014401683",jump="http://www.roblox.com/asset/?id=1014394726",climb="http://www.roblox.com/asset/?id=1014380606",fall="http://www.roblox.com/asset/?id=1014384571"}},
    {name="巡逻",data={idle1="http://www.roblox.com/asset/?id=1149612882",idle2="http://www.roblox.com/asset/?id=1150842221",walk="http://www.roblox.com/asset/?id=1151231493",run="http://www.roblox.com/asset/?id=1150967949",jump="http://www.roblox.com/asset/?id=1150944216",climb="http://www.roblox.com/asset/?id=1148811837",fall="http://www.roblox.com/asset/?id=1148863382"}},
}

for _,pack in ipairs(AnimationPacks) do
    CA:Button({Text=pack.name,Icon="play",Callback=function()
        local c=LP.Character
        if c and c:FindFirstChild("Animate") then
            local ok,err=pcall(SetAnimations,pack.data,pack.name)
            if not ok then N("错误",tostring(err):sub(1,80),4) end
        else
            N("错误","角色未加载完成，请稍后再试",3)
        end
    end})
end

local CA2=TA:Category({Title="自定义动画",IconName="play"})
local active={}
local curTrack=nil
local looped=true
local animSpeed=1

local function playAnimation(id,speed,timepos)
    local c=LP.Character
    if not c then N("错误","角色未加载",3) return end
    local hum=c:FindFirstChildOfClass("Humanoid")
    if not hum then N("错误","缺少 Humanoid",3) return end
    for _,track in pairs(active) do
        if track then pcall(function() track:Stop() end) end
    end
    active={}
    local anim=Instance.new("Animation")
    anim.AnimationId="rbxassetid://"..id
    local track=LoadTrack(hum,anim)
    if track then
        track.Looped=looped
        track:Play()
        track:AdjustSpeed(speed or animSpeed)
        track.TimePosition=timepos or 0
        active[id]=track
        curTrack=track
        N("动画","播放 "..id,2)
    end
end

CA2:Paragraph({Title="输入动画ID",Desc="支持纯数字ID，如 507776043",Icon="info"})
local animIdInput=""
CA2:TextInput({Title="",Placeholder="输入动画ID",Value="",Callback=function(v) animIdInput=v end})
CA2:Button({Text="播放动画",Icon="play",Callback=function()
    if animIdInput=="" then N("错误","请输入动画ID",2) return end
    local id=string.match(animIdInput,"id=(%d+)") or string.match(animIdInput,"rbxassetid://(%d+)") or animIdInput
    if not tonumber(id) then N("错误","ID无效",2) return end
    pcall(playAnimation,tostring(id),animSpeed,0)
end})
CA2:Button({Text="停止所有动画",Icon="square",Callback=function()
    pcall(function()
        local c=LP.Character
        if c then
            local hum=c:FindFirstChildOfClass("Humanoid")
            if hum then
                for _,t in pairs(hum:GetPlayingAnimationTracks()) do t:Stop() end
            end
        end
    end)
    active={} curTrack=nil
    N("动画","已停止",2)
end})
CA2:Toggle({Title="循环播放",Value=true,FeatureName="循环",Icon="repeat",Callback=function(s)
    looped=s
    if curTrack then curTrack.Looped=s end
end})
CA2:Slider({Title="动画速度",Min=0,Max=10,Default=1,Ticks=20,Callback=function(v)
    animSpeed=v
    if curTrack then pcall(function() curTrack:AdjustSpeed(v) end) end
end})
-- ============ 动画区结束 ============

local T5=MW:Tab({Title="杂项"})
local C5=T5:Category({Title="快捷操作",IconName="zap"})
C5:Paragraph({Title="刷新角色",Desc="让角色重生一次",Icon="info"})
C5:Button({Text="刷新角色",Icon="refresh-cw",Callback=function()if LP.Character then LP.Character:BreakJoints()end end})
C5:Paragraph({Title="重新加入",Desc="重新连接到当前服务器",Icon="info"})
C5:Button({Text="重新加入",Icon="log-out",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId,LP)end})
C5:Button({Text="复制群号",Icon="copy",Callback=function()pcall(function()setclipboard("1124808244")end)N("提示","已复制",2)end})
C5:Paragraph({Title="显示时间",Desc="屏幕左上角显示当前真实时间",Icon="clock"})
local timeGui=nil
local timeConn=nil
local function updateTime()
local t=os.date("*t")
local s=string.format("%02d:%02d:%02d",t.hour,t.min,t.sec)
if timeGui then
local lbl=timeGui:FindFirstChild("TimeLabel")
if lbl then lbl.Text="🕐 "..s end
end
end
C5:Toggle({Title="显示时间",Value=false,FeatureName="显示时间",Icon="clock",Callback=function(s)
if s then
timeGui=Instance.new("ScreenGui")
timeGui.Name="TXH_Time"
timeGui.ResetOnSpawn=false
pcall(function()timeGui.Parent=CG end)
if not timeGui.Parent then timeGui.Parent=LP:WaitForChild("PlayerGui")end
local lbl=Instance.new("TextLabel")
lbl.Name="TimeLabel"
lbl.Parent=timeGui
lbl.BackgroundTransparency=1
lbl.Position=UDim2.new(0,10,0,10)
lbl.Size=UDim2.new(0,150,0,30)
lbl.Font=Enum.Font.GothamBold
lbl.TextSize=16
lbl.TextColor3=Color3.new(1,1,1)
lbl.TextStrokeTransparency=0
lbl.TextXAlignment=Enum.TextXAlignment.Left
lbl.Text="🕐 --:--:--"
updateTime()
timeConn=RS.Heartbeat:Connect(updateTime)
N("显示时间","已开启",2)
else
if timeConn then timeConn:Disconnect()timeConn=nil end
if timeGui then timeGui:Destroy()timeGui=nil end
N("显示时间","已关闭",2)
end
end})
C5:Paragraph({Title="显示FPS",Desc="屏幕右上角显示帧率",Icon="info"})
C5:Toggle({Title="显示FPS",Value=false,FeatureName="显示帧率",Icon="activity",Callback=function(s)if s then local g=Instance.new("ScreenGui")g.Name="TXH_FPS"g.ResetOnSpawn=false pcall(function()g.Parent=CG end)if not g.Parent then g.Parent=LP:WaitForChild("PlayerGui")end local l=Instance.new("TextLabel")l.Parent=g l.BackgroundTransparency=1 l.Position=UDim2.new(.78,0,0,0)l.Size=UDim2.new(0,130,0,30)l.Font=Enum.Font.GothamBold l.TextSize=14 l.TextColor3=Color3.new(1,1,1)l.TextStrokeTransparency=0 l.Text="FPS: 0"local n=0 RS.RenderStepped:Connect(function(dt)n=n+1 if n>=10 then l.Text="FPS: "..math.floor(1/dt)n=0 end end)else local g=CG:FindFirstChild("TXH_FPS")if g then g:Destroy()end local g2=LP:FindFirstChild("PlayerGui")if g2 then local g3=g2:FindFirstChild("TXH_FPS")if g3 then g3:Destroy()end end end end})

local TS=MW:Tab({Title="脚本大全"})
local CS=TS:Category({Title="外部脚本加载器",IconName="download"})
CS:Paragraph({Title="提示",Desc="点按钮加载对应脚本",Icon="info"})
CS:Button({Text="XA脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()end)if ok then N("脚本大全","XA脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="夜脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ylt410/roblox-Script/refs/heads/main/yejiaoben"))()end)if ok then N("脚本大全","夜脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="黑脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x72\x61\x77\x2e\x67\x69\x74\x68\x75\x62\x75\x73\x65\x72\x63\x6f\x6e\x74\x65\x6e\x74\x2e\x63\x6f\x6d\x2f\x68\x67\x76\x75\x79\x67\x75\x79\x67\x2f\x48\x45\x49\x4a\x49\x41\x4f\x42\x45\x4e\x2f\x6d\x61\x69\x6e\x2f\x61\x61\x61"))()end)if ok then N("脚本大全","黑脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="R6🦌管",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()end)if ok then N("脚本大全","R6加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="R15🦌管",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()end)if ok then N("脚本大全","R15加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="皮脚本",Icon="play",Callback=function()local ok,err=pcall(function()getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()end)if ok then N("脚本大全","皮脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="BS黑洞脚本",Icon="play",Callback=function()local ok,err=pcall(function()BS="\104\116\116\112\115\58\47\47\103\105\116\101\101\46\99\111\109\47\66\83\95\115\99\114\105\112\116\47\115\99\114\105\112\116\47\114\97\119\47\109\97\115\116\101\114\47\66\83\95\83\99\114\105\112\116\46\76\117\97\117" loadstring(game:HttpGet(BS))()end)if ok then N("脚本大全","BS黑洞加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="汉堡包🍔脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/mazihao62-beep/burger-game-script/main/burger_script.lua"))()end)if ok then N("脚本大全","汉堡包脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="恐脚本😱",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/恐脚本.NB"))()end)if ok then N("脚本大全","恐脚本😱加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="黑白脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/tfcygvunbind/Apple/main/黑白脚本加载器'))()end)if ok then N("脚本大全","黑白脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Paragraph({Title="说明",Desc="所有脚本均来自网络，用之前请用小号测试",Icon="alert-triangle"})

W:Notify({Title="加载完成",Content="兔小黑🐰 已就绪",Duration=4})
print("[兔小黑🐰] 加载完成 | 群:1124808244")
