local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
	Title = "大肉帮脚本",
	Footer = "作者大肉帮帮主 群921286406",
	Icon = 95816097006870,
	NotifySide = "Right",
	ShowCustomCursor = true,
	AutoShow = true,
})

local Tabs = {
	Combat = Window:AddTab("战斗", "sword"),
	ESP = Window:AddTab("透视", "eye"),
	Movement = Window:AddTab("移动", "move"),
	Heal = Window:AddTab("治疗", "heart"),
	Unload = Window:AddTab("卸载", "power"),
}

-- ============================================================
-- 通用工具
-- ============================================================
local FMH_Players = game:GetService("Players")
local FMH_LocalPlayer = FMH_Players.LocalPlayer
local FMH_RunService = game:GetService("RunService")
local FMH_UserInputService = game:GetService("UserInputService")
local FMH_Lighting = game:GetService("Lighting")

local function GetHealTool()
	local char = FMH_LocalPlayer.Character
	if not char then return nil end
	local tool = char:FindFirstChildOfClass("Tool")
	if tool and tool:FindFirstChild("HealPlayer") and tool:FindFirstChild("AddTags") then return tool end
	return nil
end

local function GetHealToolFromBackpack()
	local backpack = FMH_LocalPlayer:FindFirstChild("Backpack")
	if not backpack then return nil end
	for _, t in ipairs(backpack:GetChildren()) do
		if t:IsA("Tool") and t:FindFirstChild("HealPlayer") and t:FindFirstChild("AddTags") then return t end
	end
	return nil
end

local function EquipHealTool()
	local tool = GetHealTool()
	if tool then return tool end
	local bpTool = GetHealToolFromBackpack()
	if bpTool then
		local char = FMH_LocalPlayer.Character
		if char and char:FindFirstChildOfClass("Humanoid") then
			pcall(function() char.Humanoid:EquipTool(bpTool) end)
			task.wait(0.1)
			return GetHealTool()
		end
	end
	return nil
end

-- ============================================================
-- 僵尸受击范围扩大（透明 Hitbox）
-- ============================================================
local HitboxMod = {
	Enabled = false,
	Scale = 4,
	LoopConn = nil,
	Hitboxes = {},
}

local function HB_isZombie(obj)
	if obj.ClassName ~= "Model" then return false end
	if FMH_Players:GetPlayerFromCharacter(obj) then return false end
	local ancestor = obj
	for _ = 1, 3 do
		ancestor = ancestor.Parent
		if not ancestor then break end
		if ancestor.Name == "AliveZombies" then return true end
	end
	return false
end

local function HB_createHitbox(model)
	local hum = model:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return end
	local root = model:FindFirstChild("HumanoidRootPart")
		or model:FindFirstChild("UpperTorso")
		or model:FindFirstChild("Torso")
	if not root then return end

	local hb = Instance.new("Part")
	hb.Name = "_HitboxOverride"
	hb.Size = Vector3.new(8, 10, 8) * HitboxMod.Scale
	hb.Transparency = 1
	hb.CanCollide = false
	hb.CanTouch = false
	hb.CanQuery = true
	hb.Massless = true
	hb.Anchored = true
	hb.Locked = true
	hb.CFrame = root.CFrame
	hb.Parent = model

	HitboxMod.Hitboxes[model] = hb
end

local function HB_removeHitbox(model)
	local hb = HitboxMod.Hitboxes[model]
	if hb and hb.Parent then
		pcall(function() hb:Destroy() end)
	end
	HitboxMod.Hitboxes[model] = nil
end

local function HB_restoreAll()
	for model in pairs(HitboxMod.Hitboxes) do
		HB_removeHitbox(model)
	end
	HitboxMod.Hitboxes = {}
end

local function HB_start()
	if HitboxMod.LoopConn then return end
	HitboxMod.LoopConn = FMH_RunService.Heartbeat:Connect(function()
		if not HitboxMod.Enabled then return end
		local zf = workspace:FindFirstChild("AliveZombies")
		if not zf then return end

		local toRemove = {}
		for model in pairs(HitboxMod.Hitboxes) do
			local hum = model:FindFirstChildOfClass("Humanoid")
			if not model.Parent or not hum or hum.Health <= 0 then
				toRemove[#toRemove + 1] = model
			end
		end
		for _, m in ipairs(toRemove) do HB_removeHitbox(m) end

		for _, obj in ipairs(zf:GetChildren()) do
			if HB_isZombie(obj) then
				local hb = HitboxMod.Hitboxes[obj]
				if not hb or not hb.Parent then
					HB_createHitbox(obj)
					hb = HitboxMod.Hitboxes[obj]
				end
				if hb then
					local root = obj:FindFirstChild("HumanoidRootPart")
						or obj:FindFirstChild("UpperTorso")
						or obj:FindFirstChild("Torso")
					if root then
						hb.CFrame = root.CFrame
						hb.Size = Vector3.new(8, 10, 8) * HitboxMod.Scale
					end
				end
			end
		end
	end)
end

local function HB_stop()
	if HitboxMod.LoopConn then HitboxMod.LoopConn:Disconnect(); HitboxMod.LoopConn = nil end
	HB_restoreAll()
end

-- ============================================================
-- 动作播放器（UI 控制版，含中文名）
-- ============================================================
local AnimPlayer = {
	Enabled = false,
	currentTrack = nil,
	animator = nil,
	humanoid = nil,
	character = nil,
	Selected = nil,
}

local AnimLib = {
	RespawnAnimation = "rbxassetid://134357211337658",
	Running = "rbxassetid://94161185164143",
	Staggerv2 = "rbxassetid://84384220591289",
	RunnerSpawn = "rbxassetid://18995793649",
	RunnerEat = "rbxassetid://79825893428035",
	RunnerAttack = "rbxassetid://78054258382672",
	RunnerGRAB = "rbxassetid://101206134935798",
	RunnerStun = "rbxassetid://17698361300",
	RunnerMauled = "rbxassetid://87675641077272",
	WalkerAttack = "rbxassetid://71038809040364",
	WalkerEat = "rbxassetid://81237775972142",
	WalkerClaw = "rbxassetid://129710968176304",
	WalkerMaul = "rbxassetid://89440749137230",
	WalkerShoved = "rbxassetid://84102396082891",
	PlayerStagger = "rbxassetid://84520532471132",
	BleedLoop = "rbxassetid://90739531913123",
	BleedStart = "rbxassetid://119650374617755",
	BlockStun = "rbxassetid://131128430900538",
	EscapistShove = "rbxassetid://122506490797047",
	ZombieIdle = "rbxassetid://130160040074885",
	ZombieWalk = "rbxassetid://18418514157",
	ZombieEat = "rbxassetid://101998531930577",
	ZombieGRAB = "rbxassetid://18381484723",
	ZombieAttack = "rbxassetid://17641570205",
	RapierEquip = "rbxassetid://98213384363769",
	RapierIdle = "rbxassetid://74237429034411",
	RapierAttack1 = "rbxassetid://120146914014730",
	RapierQuickJab = "rbxassetid://77993741190871",
	RifleBayonetSwing = "rbxassetid://71732252302609",
	RifleBayonetSwing2 = "rbxassetid://103181422853099",
	RifleBayonetSwing3 = "rbxassetid://102486547226766",
	AxeHeavyAttack = "rbxassetid://119202425062610",
	ShovelAttack1 = "rbxassetid://76146025354153",
	LanceAttack1 = "rbxassetid://78964290032781",
	SledgehammerAttack1 = "rbxassetid://113410130586491",
	LumberAxeAttack1 = "rbxassetid://108044964349463",
	ChargeRunning = "rbxassetid://90670518840837",
	ChargeCry = "rbxassetid://125038863177512",
	Punch = "rbxassetid://117027378087360",
	Shove = "rbxassetid://128482034834595",
}

-- 动画中文名映射
local AnimNameCN = {
	RespawnAnimation = "重生动画",
	Running = "奔跑",
	Staggerv2 = "眩晕v2",
	RunnerSpawn = "奔跑者-生成",
	RunnerEat = "奔跑者-进食",
	RunnerAttack = "奔跑者-攻击",
	RunnerGRAB = "奔跑者-抓取",
	RunnerStun = "奔跑者-眩晕",
	RunnerMauled = "奔跑者-被撕咬",
	WalkerAttack = "步行者-攻击",
	WalkerEat = "步行者-进食",
	WalkerClaw = "步行者-爪击",
	WalkerMaul = "步行者-撕咬",
	WalkerShoved = "步行者-被推开",
	PlayerStagger = "玩家-踉跄",
	BleedLoop = "流血循环",
	BleedStart = "流血开始",
	BlockStun = "格挡眩晕",
	EscapistShove = "逃生者-推开",
	ZombieIdle = "僵尸-待机",
	ZombieWalk = "僵尸-行走",
	ZombieEat = "僵尸-进食",
	ZombieGRAB = "僵尸-抓取",
	ZombieAttack = "僵尸-攻击",
	RapierEquip = "细剑-装备",
	RapierIdle = "细剑-待机",
	RapierAttack1 = "细剑-攻击1",
	RapierQuickJab = "细剑-快速刺击",
	RifleBayonetSwing = "步枪刺刀-挥击1",
	RifleBayonetSwing2 = "步枪刺刀-挥击2",
	RifleBayonetSwing3 = "步枪刺刀-挥击3",
	AxeHeavyAttack = "斧头-重击",
	ShovelAttack1 = "铁锹-攻击1",
	LanceAttack1 = "骑枪-攻击1",
	SledgehammerAttack1 = "大锤-攻击1",
	LumberAxeAttack1 = "伐木斧-攻击1",
	ChargeRunning = "冲锋-奔跑",
	ChargeCry = "冲锋-喊叫",
	Punch = "出拳",
	Shove = "推开",
}

-- 中文名 → 英文 key 反查表
local AnimNameReverse = {}
for en, cn in pairs(AnimNameCN) do
	AnimNameReverse[cn] = en
end

-- 生成中文名列表（下拉框显示用）
local AnimNameList = {}
for name, _ in pairs(AnimLib) do
	local cn = AnimNameCN[name] or name
	table.insert(AnimNameList, cn)
end
table.sort(AnimNameList)

local function Anim_refreshChar()
	AnimPlayer.character = FMH_LocalPlayer.Character or FMH_LocalPlayer.CharacterAdded:Wait()
	AnimPlayer.humanoid = AnimPlayer.character:WaitForChild("Humanoid")
	AnimPlayer.animator = AnimPlayer.humanoid:WaitForChild("Animator")
end

local function Anim_stopCurrent()
	if AnimPlayer.currentTrack then
		pcall(function() AnimPlayer.currentTrack:Stop() end)
		AnimPlayer.currentTrack = nil
	end
end

local function Anim_play(name, looped, speed)
	if not name then return end
	-- 如果传进来的是中文名，反查成英文 key
	if AnimNameReverse[name] then
		name = AnimNameReverse[name]
	end
	if not AnimPlayer.animator then Anim_refreshChar() end
	local id = AnimLib[name]
	if not id then return end
	Anim_stopCurrent()
	local anim = Instance.new("Animation")
	anim.AnimationId = id
	local track = AnimPlayer.animator:LoadAnimation(anim)
	track.Priority = Enum.AnimationPriority.Action4
	track.Looped = looped ~= false
	pcall(function() track:Play() end)
	track:AdjustSpeed(speed or 1)
	AnimPlayer.currentTrack = track
end

FMH_LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.5)
	if AnimPlayer.Enabled then Anim_refreshChar() end
end)

-- ============================================================
-- 移动模块：飞行 / 穿墙 / 速度 / 高亮画面
-- ============================================================
local MoveMod = {
	FlyEnabled = false,
	FlySpeed = 60,
	NoclipEnabled = false,
	SpeedEnabled = false,
	SpeedValue = 30,
	HighlightEnabled = false,
}

local flyBV = nil
local flyConn = nil
local flyControl = nil
do
	local ok, module = pcall(function()
		return require(FMH_LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
	end)
	if ok and module then
		pcall(function() flyControl = module:GetControls() end)
	end
end

local function Fly_start()
	if flyConn then return end
	local char = FMH_LocalPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	flyBV = Instance.new("BodyVelocity")
	flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)
	flyBV.P = 1250
	flyBV.Parent = hrp

	flyConn = FMH_RunService.RenderStepped:Connect(function()
		if not MoveMod.FlyEnabled or not flyBV or not flyBV.Parent then
			if flyConn then flyConn:Disconnect(); flyConn = nil end
			if flyBV then flyBV:Destroy(); flyBV = nil end
			return
		end

		local moveVec = Vector3.new(0, 0, 0)
		if flyControl then
			local ok2, mv = pcall(function() return flyControl:GetMoveVector() end)
			if ok2 and mv then moveVec = mv end
		else
			if FMH_UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0, 0, -1) end
			if FMH_UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0, 0, 1) end
			if FMH_UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-1, 0, 0) end
			if FMH_UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(1, 0, 0) end
		end

		local cam = workspace.CurrentCamera
		local cf = cam.CFrame
		local dir = (cf.LookVector * -moveVec.Z) + (cf.RightVector * moveVec.X)

		if FMH_UserInputService:IsKeyDown(Enum.KeyCode.Space) then
			dir = dir + Vector3.new(0, 1, 0)
		end
		if FMH_UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			dir = dir - Vector3.new(0, 1, 0)
		end

		if dir.Magnitude > 0 then
			flyBV.Velocity = dir.Unit * MoveMod.FlySpeed
		else
			flyBV.Velocity = Vector3.new(0, 0.1, 0)
		end
	end)
end

local function Fly_stop()
	if flyConn then flyConn:Disconnect(); flyConn = nil end
	if flyBV then flyBV:Destroy(); flyBV = nil end
end

local noclipConn = nil
local function Noclip_apply()
	local char = FMH_LocalPlayer.Character
	if not char then return end
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then part.CanCollide = false end
	end
end

local function Noclip_start()
	if noclipConn then return end
	noclipConn = FMH_RunService.Stepped:Connect(function()
		if MoveMod.NoclipEnabled then pcall(Noclip_apply) end
	end)
end

local function Noclip_stop()
	if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
	local char = FMH_LocalPlayer.Character
	if char then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
				pcall(function() part.CanCollide = true end)
			end
		end
	end
end

local speedConn = nil
local function Speed_start()
	if speedConn then return end
	speedConn = FMH_RunService.Heartbeat:Connect(function()
		if not MoveMod.SpeedEnabled then return end
		local char = FMH_LocalPlayer.Character
		if not char then return end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not hum then return end
		if hum.WalkSpeed ~= MoveMod.SpeedValue then
			hum.WalkSpeed = MoveMod.SpeedValue
		end
	end)
end

local function Speed_stop()
	if speedConn then speedConn:Disconnect(); speedConn = nil end
	local char = FMH_LocalPlayer.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then hum.WalkSpeed = 16 end
	end
end

local Highlight_original = nil
local function Highlight_start()
	if MoveMod.HighlightEnabled then return end
	MoveMod.HighlightEnabled = true

	Highlight_original = {
		Brightness = FMH_Lighting.Brightness,
		ClockTime = FMH_Lighting.ClockTime,
		FogEnd = FMH_Lighting.FogEnd,
		FogStart = FMH_Lighting.FogStart,
		Ambient = FMH_Lighting.Ambient,
		OutdoorAmbient = FMH_Lighting.OutdoorAmbient,
		GlobalShadows = FMH_Lighting.GlobalShadows,
	}

	pcall(function()
		FMH_Lighting.Brightness = 3
		FMH_Lighting.ClockTime = 14
		FMH_Lighting.FogEnd = 100000
		FMH_Lighting.FogStart = 100000
		FMH_Lighting.Ambient = Color3.fromRGB(180, 180, 180)
		FMH_Lighting.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
		FMH_Lighting.GlobalShadows = false
	end)

	for _, v in ipairs(FMH_Lighting:GetChildren()) do
		if v:IsA("Atmosphere") then pcall(function() v:Destroy() end) end
	end
end

local function Highlight_stop()
	if not MoveMod.HighlightEnabled then return end
	MoveMod.HighlightEnabled = false
	if Highlight_original then
		pcall(function()
			FMH_Lighting.Brightness = Highlight_original.Brightness
			FMH_Lighting.ClockTime = Highlight_original.ClockTime
			FMH_Lighting.FogEnd = Highlight_original.FogEnd
			FMH_Lighting.FogStart = Highlight_original.FogStart
			FMH_Lighting.Ambient = Highlight_original.Ambient
			FMH_Lighting.OutdoorAmbient = Highlight_original.OutdoorAmbient
			FMH_Lighting.GlobalShadows = Highlight_original.GlobalShadows
		end)
	end
end

FMH_LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.5)
	if MoveMod.NoclipEnabled then Noclip_apply() end
	if MoveMod.SpeedEnabled then
		local char = FMH_LocalPlayer.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = MoveMod.SpeedValue end
		end
	end
end)

-- ============================================================
-- 全图治疗
-- ============================================================
local FullMapHeal = {
	Enabled = false, HealInterval = 0.5, HealThreshold = 100,
	FakeDistance = 0.5, AutoEquip = false,
	Whitelist = {}, WhitelistEmpty = true, LoopRunning = false,
}

local function FMH_isWhitelisted(player)
	if FullMapHeal.WhitelistEmpty then return true end
	return FullMapHeal.Whitelist[player] == true
end

local function FMH_getTargets()
	local targets = {}
	for _, player in ipairs(FMH_Players:GetPlayers()) do
		if player ~= FMH_LocalPlayer and FMH_isWhitelisted(player) then
			local char = player.Character
			if char then
				local hum = char:FindFirstChildOfClass("Humanoid")
				if hum and hum.Health > 0 and hum.Health < FullMapHeal.HealThreshold then
					targets[#targets + 1] = player
				end
			end
		end
	end
	return targets
end

local function FMH_healTarget(player, healTool)
	if not healTool then return end
	local targetChar = player.Character
	if not targetChar then return end
	local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
	if not targetHum or targetHum.Health <= 0 or targetHum.Health >= FullMapHeal.HealThreshold then return end

	local myChar = FMH_LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myRoot then return end
	local fakePos = myRoot.Position + Vector3.new(0, FullMapHeal.FakeDistance, 0)

	local addTagsEvent = healTool:FindFirstChild("AddTags")
	local healPlayerEvent = healTool:FindFirstChild("HealPlayer")

	if addTagsEvent then pcall(function() addTagsEvent:FireServer(FMH_LocalPlayer, player, true) end) end
	if healPlayerEvent then pcall(function() healPlayerEvent:FireServer(fakePos, fakePos, 90, targetHum, true, FMH_LocalPlayer) end) end
	task.delay(0.2, function()
		if addTagsEvent then pcall(function() addTagsEvent:FireServer(FMH_LocalPlayer, player, false) end) end
	end)
end

local function FMH_start()
	if FullMapHeal.LoopRunning then return end
	FullMapHeal.LoopRunning = true
	task.spawn(function()
		while FullMapHeal.LoopRunning do
			task.wait(FullMapHeal.HealInterval)
			if not FullMapHeal.Enabled then continue end
			local tool = FullMapHeal.AutoEquip and EquipHealTool() or GetHealTool()
			if not tool then continue end
			for _, player in ipairs(FMH_getTargets()) do
				FMH_healTarget(player, tool)
				task.wait(0.1)
			end
		end
	end)
end
local function FMH_stop() FullMapHeal.LoopRunning = false end

-- ============================================================
-- 自我治疗
-- ============================================================
local SelfHeal = {
	Enabled = false, HealInterval = 0.2, HealThreshold = 99,
	HealAmount = 90, StopThreshold = 100, AutoEquip = false,
	LoopRunning = false, isHealing = false,
}

local function SH_healSelf()
	if SelfHeal.isHealing then return end
	SelfHeal.isHealing = true

	local healTool = SelfHeal.AutoEquip and EquipHealTool() or GetHealTool()
	if not healTool then SelfHeal.isHealing = false; return end

	local myChar = FMH_LocalPlayer.Character
	if not myChar then SelfHeal.isHealing = false; return end
	local myHumanoid = myChar:FindFirstChildOfClass("Humanoid")
	local myRoot = myChar:FindFirstChild("HumanoidRootPart")
	if not myHumanoid or not myRoot then SelfHeal.isHealing = false; return end

	local addTagsEvent = healTool:FindFirstChild("AddTags")
	local healPlayerEvent = healTool:FindFirstChild("HealPlayer")

	task.spawn(function()
		if addTagsEvent then pcall(function() addTagsEvent:FireServer(FMH_LocalPlayer, FMH_LocalPlayer, true) end) end
		while SelfHeal.Enabled and myHumanoid.Health > 0 and myHumanoid.Health < SelfHeal.StopThreshold do
			local healPos = myRoot.Position
			if healPlayerEvent then
				pcall(function() healPlayerEvent:FireServer(healPos, healPos, SelfHeal.HealAmount, myHumanoid, true, FMH_LocalPlayer) end)
			end
			task.wait(SelfHeal.HealInterval)
		end
		if addTagsEvent then pcall(function() addTagsEvent:FireServer(FMH_LocalPlayer, FMH_LocalPlayer, false) end) end
		SelfHeal.isHealing = false
	end)
end

local function SH_start()
	if SelfHeal.LoopRunning then return end
	SelfHeal.LoopRunning = true
	task.spawn(function()
		while SelfHeal.LoopRunning do
			task.wait(SelfHeal.HealInterval)
			if not SelfHeal.Enabled then continue end
			local myChar = FMH_LocalPlayer.Character
			if not myChar then continue end
			local myHumanoid = myChar:FindFirstChildOfClass("Humanoid")
			if not myHumanoid or myHumanoid.Health <= 0 then continue end
			if myHumanoid.Health < SelfHeal.HealThreshold and not SelfHeal.isHealing then
				SH_healSelf()
			end
		end
	end)
end
local function SH_stop() SelfHeal.LoopRunning = false; SelfHeal.isHealing = false end

-- ============================================================
-- 细剑杀戮光环
-- ============================================================
local RapierKillAura = {
	Enabled = false, Range = 30, Interval = 0.5,
	AutoRotate = false, AutoEquip = false,
	AttackParams = {"Aga", 1}, LoopRunning = false,
}

local function RKA_getWeapon()
	local char = FMH_LocalPlayer.Character; if not char then return nil end
	local tool = char:FindFirstChildOfClass("Tool")
	if tool and tool.Name == "Rapier" and tool:FindFirstChild("Swing") then return tool end
	local backpack = FMH_LocalPlayer:FindFirstChild("Backpack")
	if backpack then
		for _, t in ipairs(backpack:GetChildren()) do
			if t:IsA("Tool") and t.Name == "Rapier" and t:FindFirstChild("Swing") then return t end
		end
	end
	return nil
end

local function RKA_getNearestEnemy()
	local char = FMH_LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart"); if not root then return nil end
	local nearest, minDist = nil, RapierKillAura.Range
	local zf = workspace:FindFirstChild("AliveZombies")
	if zf then
		for _, obj in ipairs(zf:GetChildren()) do
			if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
				local hum = obj:FindFirstChild("Humanoid")
				if hum.Health > 0 then
					local tr = obj:FindFirstChild("HumanoidRootPart")
					local dist = (tr.Position - root.Position).Magnitude
					if dist < minDist then minDist = dist; nearest = obj end
				end
			end
		end
	end
	if not nearest then
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
				local hum = obj:FindFirstChild("Humanoid")
				if hum.Health > 0 and not FMH_Players:GetPlayerFromCharacter(obj) then
					local tr = obj:FindFirstChild("HumanoidRootPart")
					local dist = (tr.Position - root.Position).Magnitude
					if dist < minDist then minDist = dist; nearest = obj end
				end
			end
		end
	end
	return nearest
end

local function RKA_attack(enemy, weapon)
	local swing = weapon:FindFirstChild("Swing"); if not swing then return end
	local char = FMH_LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local tr = enemy and enemy:FindFirstChild("HumanoidRootPart")
	if not root or not tr then return end
	if RapierKillAura.AutoRotate then
		local dir = (tr.Position - root.Position).Unit
		root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(dir.X, 0, dir.Z))
	end
	pcall(function() swing:FireServer(unpack(RapierKillAura.AttackParams)) end)
end

local function RKA_start()
	if RapierKillAura.LoopRunning then return end
	RapierKillAura.LoopRunning = true
	task.spawn(function()
		while RapierKillAura.LoopRunning do
			task.wait(RapierKillAura.Interval)
			if not RapierKillAura.Enabled then continue end
			local char = FMH_LocalPlayer.Character
			if not char or not char:FindFirstChild("HumanoidRootPart") then continue end
			local weapon = RKA_getWeapon(); if not weapon then continue end
			if RapierKillAura.AutoEquip and weapon.Parent == FMH_LocalPlayer.Backpack then
				pcall(function() char.Humanoid:EquipTool(weapon) end); task.wait(0.1)
			end
			local enemy = RKA_getNearestEnemy()
			if enemy then RKA_attack(enemy, weapon) end
		end
	end)
end
local function RKA_stop() RapierKillAura.LoopRunning = false end

-- ============================================================
-- 近战杀戮光环
-- ============================================================
local MeleeKillAura = {
	Enabled = false, Range = 30, Interval = 0.5,
	AutoRotate = false, AutoEquip = false, LoopRunning = false,
}

local function MKA_getWeapon()
	local char = FMH_LocalPlayer.Character; if not char then return nil end
	local tool = char:FindFirstChildOfClass("Tool")
	if tool and tool:FindFirstChild("Swing") then return tool end
	for _, t in ipairs(FMH_LocalPlayer.Backpack:GetChildren()) do
		if t:IsA("Tool") and t:FindFirstChild("Swing") then return t end
	end
	return nil
end

local function MKA_getNearestEnemy()
	local char = FMH_LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart"); if not root then return nil end
	local nearest, minDist = nil, MeleeKillAura.Range
	local zf = workspace:FindFirstChild("AliveZombies")
	if zf then
		for _, obj in ipairs(zf:GetChildren()) do
			if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
				local hum = obj:FindFirstChild("Humanoid")
				if hum.Health > 0 then
					local tr = obj:FindFirstChild("HumanoidRootPart")
					local dist = (tr.Position - root.Position).Magnitude
					if dist < minDist then minDist = dist; nearest = obj end
				end
			end
		end
	end
	if not nearest then
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
				local hum = obj:FindFirstChild("Humanoid")
				if hum.Health > 0 and not FMH_Players:GetPlayerFromCharacter(obj) then
					local tr = obj:FindFirstChild("HumanoidRootPart")
					local dist = (tr.Position - root.Position).Magnitude
					if dist < minDist then minDist = dist; nearest = obj end
				end
			end
		end
	end
	return nearest
end

local function MKA_attack(enemy, weapon)
	local swing = weapon:FindFirstChild("Swing"); if not swing then return end
	local char = FMH_LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local tr = enemy and enemy:FindFirstChild("HumanoidRootPart")
	if not root or not tr then return end
	if MeleeKillAura.AutoRotate then
		local dir = (tr.Position - root.Position).Unit
		root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(dir.X, 0, dir.Z))
	end
	pcall(function() swing:FireServer(1) end)
end

local function MKA_start()
	if MeleeKillAura.LoopRunning then return end
	MeleeKillAura.LoopRunning = true
	task.spawn(function()
		while MeleeKillAura.LoopRunning do
			task.wait(MeleeKillAura.Interval)
			if not MeleeKillAura.Enabled then continue end
			local char = FMH_LocalPlayer.Character
			if not char or not char:FindFirstChild("HumanoidRootPart") then continue end
			local weapon = MKA_getWeapon(); if not weapon then continue end
			if MeleeKillAura.AutoEquip and weapon.Parent == FMH_LocalPlayer.Backpack then
				pcall(function() char.Humanoid:EquipTool(weapon) end); task.wait(0.1)
			end
			local enemy = MKA_getNearestEnemy()
			if enemy then MKA_attack(enemy, weapon) end
		end
	end)
end
local function MKA_stop() MeleeKillAura.LoopRunning = false end

-- ============================================================
-- 步枪杀戮光环
-- ============================================================
local RifleKillAura = {
	Enabled = false, Range = 300, Interval = 0.3,
	AutoRotate = false, AutoEquip = false,
	AutoReload = false, ReloadInterval = 2.5, LastReload = 0,
	LoopRunning = false, Targets = {},
}

local RKA_targetNames = {
	"Walker", "Runner", "ZombieEngineer", "Prowler",
	"PugerlyMusician", "DefencelessCivilian", "MateoDupont",
	"Marksman", "EnemyPugrelian", "JollyLurker",
	"PugrelianDread", "PugrelianOfficer", "Defector",
}

local RKA_targetNameCN = {
	Walker = "步行者",
	Runner = "奔跑者",
	ZombieEngineer = "僵尸工程师",
	Prowler = "潜行者",
	PugerlyMusician = "音乐家僵尸",
	DefencelessCivilian = "无防御平民",
	MateoDupont = "马特奥·杜邦",
	Marksman = "神射手",
	EnemyPugrelian = "敌方普格瑞利安",
	JollyLurker = "欢乐潜伏者",
	PugrelianDread = "普格瑞利安·恐惧",
	PugrelianOfficer = "普格瑞利安·军官",
	Defector = "叛逃者",
}

for _, n in ipairs(RKA_targetNames) do RifleKillAura.Targets[n] = false end

local function RKA_nameMatches(name)
	for targetName, enabled in pairs(RifleKillAura.Targets) do
		if enabled then
			if name == targetName or name:sub(1, #targetName) == targetName then return true end
		end
	end
	return false
end

local function RKA_isEnabledTarget(obj)
	if RKA_nameMatches(obj.Name) then return true end
	local parent = obj.Parent
	if parent and parent.Name == "AliveZombies" then
		for targetName, enabled in pairs(RifleKillAura.Targets) do
			if enabled then
				if obj.Name == targetName or obj.Name:sub(1, #targetName) == targetName then
					return true
				end
			end
		end
	end
	return false
end

local function RKA_rifle_getWeapon()
	local char = FMH_LocalPlayer.Character; if not char then return nil end
	local tool = char:FindFirstChildOfClass("Tool")
	if tool and tool:FindFirstChild("Firing") then return tool end
	local backpack = FMH_LocalPlayer:FindFirstChild("Backpack")
	if backpack then
		for _, t in ipairs(backpack:GetChildren()) do
			if t:IsA("Tool") and t:FindFirstChild("Firing") then return t end
		end
	end
	return nil
end

local function RKA_rifle_isValidTarget(obj)
	if obj.ClassName ~= "Model" then return false end
	if not RKA_isEnabledTarget(obj) then return false end
	if FMH_Players:GetPlayerFromCharacter(obj) then return false end
	local hum = obj:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return false end
	if not obj:FindFirstChild("HumanoidRootPart") then return false end
	return true
end

local function RKA_rifle_getNearestEnemy()
	local char = FMH_LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart"); if not root then return nil end
	local nearest, minDist = nil, RifleKillAura.Range

	local zf = workspace:FindFirstChild("AliveZombies")
	local scanList = zf and zf:GetChildren() or {}
	for _, obj in ipairs(scanList) do
		if RKA_rifle_isValidTarget(obj) then
			local hrp = obj:FindFirstChild("HumanoidRootPart")
			local dist = (hrp.Position - root.Position).Magnitude
			if dist < minDist then minDist = dist; nearest = obj end
		end
	end

	if not nearest then
		for _, obj in ipairs(workspace:GetDescendants()) do
			if RKA_rifle_isValidTarget(obj) then
				local hrp = obj:FindFirstChild("HumanoidRootPart")
				local dist = (hrp.Position - root.Position).Magnitude
				if dist < minDist then minDist = dist; nearest = obj end
			end
		end
	end

	if type(getnilinstances) == "function" then
		pcall(function()
			for _, obj in next, getnilinstances() do
				if RKA_rifle_isValidTarget(obj) then
					local hrp = obj:FindFirstChild("HumanoidRootPart")
					local dist = (hrp.Position - root.Position).Magnitude
					if dist < minDist then minDist = dist; nearest = obj end
				end
			end
		end)
	end

	return nearest
end

local function RKA_rifle_tryReload(weapon)
	if not weapon then return false end
	local attemptReload = weapon:FindFirstChild("AttemptReload")
	if attemptReload then
		pcall(function() attemptReload:FireServer() end)
		return true
	end
	return false
end

local function RKA_rifle_getAmmo(weapon)
	if not weapon then return nil end
	local ok, ammo = pcall(function() return weapon:GetAttribute("Ammo") end)
	if ok then return ammo end
	return nil
end

local function RKA_rifle_attack(enemy, weapon)
	local firing = weapon:FindFirstChild("Firing"); if not firing then return end
	local char = FMH_LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local targetRoot = enemy and enemy:FindFirstChild("HumanoidRootPart")
	if not root or not targetRoot then return end

	if RifleKillAura.AutoRotate then
		local dir = (targetRoot.Position - root.Position).Unit
		root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(dir.X, 0, dir.Z))
	end

	local fireArea = weapon:FindFirstChild("Handle")
		and weapon.Handle:FindFirstChild("Grip2")
		and weapon.Handle.Grip2:FindFirstChild("FireArea")
	local origin = (fireArea and fireArea.WorldPosition) or root.Position
	local direction = (targetRoot.Position - origin).Unit

	local filterList = {char}
	if workspace:FindFirstChild("Buildings") then table.insert(filterList, workspace.Buildings) end
	if workspace:FindFirstChild("Corpses") then table.insert(filterList, workspace.Corpses) end
	if workspace:FindFirstChild("AlivePlayers") then table.insert(filterList, workspace.AlivePlayers) end

	pcall(function()
		firing:FireServer(origin, direction, filterList, targetRoot)
	end)
end

local function RKA_rifle_start()
	if RifleKillAura.LoopRunning then return end
	RifleKillAura.LoopRunning = true
	task.spawn(function()
		while RifleKillAura.LoopRunning do
			task.wait(RifleKillAura.Interval)
			if not RifleKillAura.Enabled then continue end
			local char = FMH_LocalPlayer.Character
			if not char or not char:FindFirstChild("HumanoidRootPart") then continue end

			local weapon = RKA_rifle_getWeapon()
			if not weapon then continue end

			if RifleKillAura.AutoEquip and weapon.Parent == FMH_LocalPlayer.Backpack then
				pcall(function() char.Humanoid:EquipTool(weapon) end)
				task.wait(0.1)
			end

			if RifleKillAura.AutoReload then
				local ammo = RKA_rifle_getAmmo(weapon)
				if ammo ~= nil and ammo <= 0 then
					if tick() - RifleKillAura.LastReload >= RifleKillAura.ReloadInterval then
						RifleKillAura.LastReload = tick()
						RKA_rifle_tryReload(weapon)
					end
					continue
				end
			end

			local enemy = RKA_rifle_getNearestEnemy()
			if enemy then RKA_rifle_attack(enemy, weapon) end
		end
	end)
end
local function RKA_rifle_stop() RifleKillAura.LoopRunning = false end

-- ============================================================
-- 自动持续格挡
-- ============================================================
local BKA_RS = game:GetService("ReplicatedStorage")
local BKA_Run = game:GetService("RunService")
local BKA_player = FMH_Players.LocalPlayer

local AutoBlock = {
	Enabled = false, ToolName = "Sabre", AnimSpeed = 20, RestartDelay = 0.05,
	blocking = false, blockTrack = nil, blockMarker = nil, blockLoop = nil,
	character = nil, humanoid = nil, animator = nil,
}

local function BKA_refresh()
	AutoBlock.character = BKA_player.Character or BKA_player.CharacterAdded:Wait()
	AutoBlock.humanoid = AutoBlock.character:WaitForChild("Humanoid")
	AutoBlock.animator = AutoBlock.humanoid:WaitForChild("Animator")
end

local function BKA_stopBlocking()
	if AutoBlock.blockLoop then AutoBlock.blockLoop:Disconnect(); AutoBlock.blockLoop = nil end
	if AutoBlock.blockTrack then pcall(function() AutoBlock.blockTrack:Stop() end); AutoBlock.blockTrack = nil end
	if AutoBlock.blockMarker then AutoBlock.blockMarker:Destroy(); AutoBlock.blockMarker = nil end
	if AutoBlock.humanoid then AutoBlock.humanoid.WalkSpeed = 16 end
	AutoBlock.blocking = false
end

local function BKA_startBlockCycle(tool)
	if AutoBlock.blocking then return end
	AutoBlock.blocking = true

	local char, hum, anim = AutoBlock.character, AutoBlock.humanoid, AutoBlock.animator
	if not char or not hum or not anim then AutoBlock.blocking = false; return end

	local ok = pcall(function()
		local melee = BKA_RS:WaitForChild("GlobalGunAnimations"):WaitForChild("Melee")
		local toolFolder = melee:WaitForChild(AutoBlock.ToolName, 5); if not toolFolder then return end
		local blockAnim = toolFolder:WaitForChild("Block", 5); if not blockAnim then return end
		AutoBlock.blockTrack = anim:LoadAnimation(blockAnim)
		AutoBlock.blockTrack:Play()
		AutoBlock.blockTrack.Looped = false
		AutoBlock.blockTrack:AdjustSpeed(AutoBlock.AnimSpeed)
		hum.WalkSpeed = 12
	end)
	if not ok then AutoBlock.blocking = false; return end

	AutoBlock.blockMarker = Instance.new("BoolValue")
	AutoBlock.blockMarker.Name = "WeaponBlocking2"
	AutoBlock.blockMarker.Parent = char

	local blockedEvent = tool:FindFirstChild("Blocked")
	if blockedEvent and blockedEvent:IsA("RemoteEvent") then blockedEvent:FireServer() end

	AutoBlock.blockLoop = BKA_Run.Heartbeat:Connect(function()
		if AutoBlock.blocking and blockedEvent and os.clock() % 0.3 < 0.05 then
			blockedEvent:FireServer()
		end
	end)

	if AutoBlock.blockTrack then
		AutoBlock.blockTrack.Stopped:Connect(function()
			if AutoBlock.blocking then
				BKA_stopBlocking()
				task.wait(AutoBlock.RestartDelay)
				if AutoBlock.Enabled then
					local t = AutoBlock.character and AutoBlock.character:FindFirstChild(AutoBlock.ToolName)
					if t then BKA_startBlockCycle(t) end
				end
			end
		end)
	end
end

local function BKA_checkTool()
	if not AutoBlock.Enabled then return end
	if not AutoBlock.character then BKA_refresh() end
	local tool = AutoBlock.character and AutoBlock.character:FindFirstChild(AutoBlock.ToolName)
	if tool then BKA_startBlockCycle(tool) else BKA_stopBlocking() end
end

local function BKA_start()
	if not AutoBlock.character then BKA_refresh() end
	local char = AutoBlock.character
	char.ChildAdded:Connect(function(child)
		if AutoBlock.Enabled and child:IsA("Tool") and child.Name == AutoBlock.ToolName then
			BKA_startBlockCycle(child)
		end
	end)
	char.ChildRemoved:Connect(function(child)
		if child:IsA("Tool") and child.Name == AutoBlock.ToolName then BKA_stopBlocking() end
	end)
	BKA_checkTool()
end

BKA_player.CharacterAdded:Connect(function(newChar)
	AutoBlock.character = newChar
	AutoBlock.humanoid = newChar:WaitForChild("Humanoid")
	AutoBlock.animator = AutoBlock.humanoid:WaitForChild("Animator")
	BKA_stopBlocking()
	if AutoBlock.Enabled then task.wait(0.3); BKA_checkTool() end
end)

local function BKA_stop() AutoBlock.Enabled = false; BKA_stopBlocking() end

-- ============================================================
-- 身体透视（Highlight）
-- ============================================================
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "NanokaESP"
ESPFolder.Parent = workspace

local ESP = {
	PlayerEnabled = false,
	ZombieEnabled = false,
	MaxDistance = 1000,
	PlayerColor = Color3.fromRGB(0, 255, 0),
	ZombieColor = Color3.fromRGB(255, 60, 60),
	Tracked = {},
}

local function ESP_isZombie(obj)
	if obj.ClassName ~= "Model" then return false end
	if FMH_Players:GetPlayerFromCharacter(obj) then return false end
	local ancestor = obj
	for _ = 1, 3 do
		ancestor = ancestor.Parent
		if not ancestor then break end
		if ancestor.Name == "AliveZombies" then return true end
	end
	return false
end

local function ESP_create(model, isPlayer)
	if ESP.Tracked[model] then return end

	local highlight = Instance.new("Highlight")
	highlight.Name = "ESP_Highlight"
	highlight.Adornee = model
	pcall(function()
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	end)
	highlight.FillTransparency = 0.4
	highlight.OutlineTransparency = 0
	if isPlayer then
		highlight.FillColor = ESP.PlayerColor
		highlight.OutlineColor = ESP.PlayerColor
	else
		highlight.FillColor = ESP.ZombieColor
		highlight.OutlineColor = ESP.ZombieColor
	end
	highlight.Parent = ESPFolder

	ESP.Tracked[model] = {
		Highlight = highlight,
		IsPlayer = isPlayer,
	}
end

local function ESP_remove(model)
	local e = ESP.Tracked[model]
	if e and e.Highlight then
		pcall(function() e.Highlight:Destroy() end)
	end
	ESP.Tracked[model] = nil
end

local function ESP_getRefPos()
	local myChar = FMH_LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if myRoot then return myRoot.Position end
	local cam = workspace.CurrentCamera
	if cam then return cam.CFrame.Position end
	return Vector3.new(0, 0, 0)
end

local function ESP_update()
	local myPos = ESP_getRefPos()

	local toRemove = {}
	for model, e in pairs(ESP.Tracked) do
		if not model.Parent or not e.Highlight or not e.Highlight.Parent then
			toRemove[#toRemove + 1] = model
		end
	end
	for _, model in ipairs(toRemove) do ESP_remove(model) end

	if ESP.PlayerEnabled then
		for _, plr in ipairs(FMH_Players:GetPlayers()) do
			if plr ~= FMH_LocalPlayer and plr.Character then
				local char = plr.Character
				local hum = char:FindFirstChildOfClass("Humanoid")
				local root = char:FindFirstChild("HumanoidRootPart")
				if hum and hum.Health > 0 and root then
					local dist = (root.Position - myPos).Magnitude
					if dist <= ESP.MaxDistance then
						ESP_create(char, true)
					else
						ESP_remove(char)
					end
				else
					ESP_remove(char)
				end
			end
		end
	else
		local toDel = {}
		for model, e in pairs(ESP.Tracked) do
			if e.IsPlayer then toDel[#toDel + 1] = model end
		end
		for _, m in ipairs(toDel) do ESP_remove(m) end
	end

	if ESP.ZombieEnabled then
		local zf = workspace:FindFirstChild("AliveZombies")
		local zombieList = zf and zf:GetDescendants() or workspace:GetDescendants()
		for _, obj in ipairs(zombieList) do
			if ESP_isZombie(obj) then
				local hum = obj:FindFirstChildOfClass("Humanoid")
				local root = obj:FindFirstChild("HumanoidRootPart")
					or obj:FindFirstChild("UpperTorso")
					or obj:FindFirstChild("Torso")
				if hum and hum.Health > 0 and root then
					local dist = (root.Position - myPos).Magnitude
					if dist <= ESP.MaxDistance then
						ESP_create(obj, false)
					else
						ESP_remove(obj)
					end
				else
					ESP_remove(obj)
				end
			end
		end
	else
		local toDel = {}
		for model, e in pairs(ESP.Tracked) do
			if not e.IsPlayer then toDel[#toDel + 1] = model end
		end
		for _, m in ipairs(toDel) do ESP_remove(m) end
	end
end

local function ESP_start()
	task.spawn(function()
		while true do
			task.wait(0.15)
			if ESP.PlayerEnabled or ESP.ZombieEnabled then
				pcall(ESP_update)
			end
		end
	end)
end

local function ESP_stop()
	for model in pairs(ESP.Tracked) do
		ESP_remove(model)
	end
	ESP.PlayerEnabled = false
	ESP.ZombieEnabled = false
end

ESP_start()

-- ============================================================
-- 战斗标签页
-- ============================================================
local CombatLeft = Tabs.Combat:AddLeftGroupbox("近战杀戮光环", "sword")
local CombatMid = Tabs.Combat:AddRightGroupbox("步枪杀戮光环", "crosshair")
local CombatRight = Tabs.Combat:AddRightGroupbox("格挡与碰撞箱", "shield")

CombatLeft:AddToggle("RapierKillAuraToggle", {Text = "细剑杀戮光环", Default = false, Callback = function(Value) RapierKillAura.Enabled = Value; if Value then RKA_start() end end})
CombatLeft:AddSlider("RapierKillAuraRange", {Text = "细剑攻击范围", Default = 30, Min = 5, Max = 100, Rounding = 0, Callback = function(Value) RapierKillAura.Range = Value end})
CombatLeft:AddSlider("RapierKillAuraInterval", {Text = "细剑攻击间隔", Default = 0.5, Min = 0.1, Max = 3, Rounding = 1, Callback = function(Value) RapierKillAura.Interval = Value end})
CombatLeft:AddToggle("RapierAutoRotate", {Text = "细剑·自动转向", Default = false, Callback = function(Value) RapierKillAura.AutoRotate = Value end})
CombatLeft:AddToggle("RapierAutoEquip", {Text = "细剑·自动装备", Default = false, Callback = function(Value) RapierKillAura.AutoEquip = Value end})
CombatLeft:AddDivider()

CombatLeft:AddToggle("MeleeKillAuraToggle", {Text = "近战杀戮光环", Default = false, Callback = function(Value) MeleeKillAura.Enabled = Value; if Value then MKA_start() end end})
CombatLeft:AddSlider("MeleeKillAuraRange", {Text = "近战攻击范围", Default = 30, Min = 5, Max = 100, Rounding = 0, Callback = function(Value) MeleeKillAura.Range = Value end})
CombatLeft:AddSlider("MeleeKillAuraInterval", {Text = "近战攻击间隔", Default = 0.5, Min = 0.1, Max = 3, Rounding = 1, Callback = function(Value) MeleeKillAura.Interval = Value end})
CombatLeft:AddToggle("MeleeAutoRotate", {Text = "近战·自动转向", Default = false, Callback = function(Value) MeleeKillAura.AutoRotate = Value end})
CombatLeft:AddToggle("MeleeAutoEquip", {Text = "近战·自动装备", Default = false, Callback = function(Value) MeleeKillAura.AutoEquip = Value end})

CombatMid:AddToggle("RifleKillAuraToggle", {Text = "步枪杀戮光环", Default = false, Callback = function(Value) RifleKillAura.Enabled = Value; if Value then RKA_rifle_start() end end})
CombatMid:AddSlider("RifleKillAuraRange", {Text = "步枪攻击范围", Default = 300, Min = 10, Max = 1000, Rounding = 0, Callback = function(Value) RifleKillAura.Range = Value end})
CombatMid:AddSlider("RifleKillAuraInterval", {Text = "步枪攻击间隔", Default = 0.3, Min = 0.05, Max = 2, Rounding = 2, Callback = function(Value) RifleKillAura.Interval = Value end})
CombatMid:AddToggle("RifleAutoRotate", {Text = "步枪·自动转向", Default = false, Callback = function(Value) RifleKillAura.AutoRotate = Value end})
CombatMid:AddToggle("RifleAutoEquip", {Text = "步枪·自动装备", Default = false, Callback = function(Value) RifleKillAura.AutoEquip = Value end})
CombatMid:AddToggle("RifleAutoReload", {Text = "步枪·自动换弹", Default = false, Callback = function(Value) RifleKillAura.AutoReload = Value end})
CombatMid:AddSlider("RifleReloadInterval", {Text = "换弹检测间隔", Default = 2.5, Min = 0.5, Max = 10, Rounding = 1, Callback = function(Value) RifleKillAura.ReloadInterval = Value end})
CombatMid:AddDivider()

for _, name in ipairs(RKA_targetNames) do
	local cn = RKA_targetNameCN[name] or name
	CombatMid:AddToggle("RifleTarget_" .. name, {
		Text = "攻击 " .. cn, Default = false,
		Callback = function(Value) RifleKillAura.Targets[name] = Value end,
	})
end

CombatRight:AddToggle("AutoBlockToggle", {Text = "自动持续格挡", Default = false, Callback = function(Value) AutoBlock.Enabled = Value; if Value then BKA_start() else BKA_stop() end end})
CombatRight:AddDropdown("AutoBlockWeapon", {Values = { "Sabre", "Rapier" }, Default = 1, Multi = false, Text = "格挡武器", Callback = function(Value) AutoBlock.ToolName = Value; if AutoBlock.Enabled then BKA_stopBlocking(); task.wait(0.1); BKA_checkTool() end end})
CombatRight:AddSlider("AutoBlockAnimSpeed", {Text = "格挡动画速度", Default = 20, Min = 1, Max = 50, Rounding = 0, Callback = function(Value) AutoBlock.AnimSpeed = Value end})
CombatRight:AddDivider()

CombatRight:AddToggle("HitboxModToggle", {
	Text = "僵尸受击范围扩大",
	Default = false,
	Tooltip = "在僵尸身上挂透明大盒子，命中更容易（不改外形）",
	Callback = function(Value)
		HitboxMod.Enabled = Value
		if Value then HB_start() else HB_stop() end
	end,
})

CombatRight:AddSlider("HitboxModScale", {
	Text = "受击范围倍数",
	Default = 4.0, Min = 1.0, Max = 10.0, Rounding = 1,
	Callback = function(Value)
		HitboxMod.Scale = Value
	end,
})

-- ============================================================
-- 透视标签页
-- ============================================================
local ESPLeft = Tabs.ESP:AddLeftGroupbox("身体透视", "eye")
local ESPRight = Tabs.ESP:AddRightGroupbox("设置", "settings")

ESPLeft:AddToggle("ESPPlayerToggle", {
	Text = "玩家透视",
	Default = false,
	Callback = function(Value) ESP.PlayerEnabled = Value end,
})

ESPLeft:AddToggle("ESPZombieToggle", {
	Text = "僵尸透视",
	Default = false,
	Callback = function(Value) ESP.ZombieEnabled = Value end,
})

ESPRight:AddSlider("ESPMaxDistance", {
	Text = "最大显示距离",
	Default = 1000, Min = 50, Max = 5000, Rounding = 0,
	Callback = function(Value) ESP.MaxDistance = Value end,
})

-- ============================================================
-- 移动标签页
-- ============================================================
local MoveLeft = Tabs.Movement:AddLeftGroupbox("移动", "move")
local MoveRight = Tabs.Movement:AddRightGroupbox("视觉与动画", "eye")

MoveLeft:AddToggle("FlyToggle", {
	Text = "飞行",
	Default = false,
	Tooltip = "WASD移动，空格上升，左Shift下降",
	Callback = function(Value)
		MoveMod.FlyEnabled = Value
		if Value then Fly_start() else Fly_stop() end
	end,
})

MoveLeft:AddSlider("FlySpeedSlider", {
	Text = "飞行速度",
	Default = 60, Min = 10, Max = 300, Rounding = 0,
	Callback = function(Value) MoveMod.FlySpeed = Value end,
})

MoveLeft:AddDivider()

MoveLeft:AddToggle("NoclipToggle", {
	Text = "穿墙",
	Default = false,
	Callback = function(Value)
		MoveMod.NoclipEnabled = Value
		if Value then Noclip_start() else Noclip_stop() end
	end,
})

MoveLeft:AddDivider()

MoveLeft:AddToggle("SpeedToggle", {
	Text = "修改速度",
	Default = false,
	Callback = function(Value)
		MoveMod.SpeedEnabled = Value
		if Value then Speed_start() else Speed_stop() end
	end,
})

MoveLeft:AddSlider("SpeedValueSlider", {
	Text = "速度值",
	Default = 30, Min = 16, Max = 100, Rounding = 0,
	Callback = function(Value)
		MoveMod.SpeedValue = Value
		if MoveMod.SpeedEnabled then
			local char = FMH_LocalPlayer.Character
			if char then
				local hum = char:FindFirstChildOfClass("Humanoid")
				if hum then hum.WalkSpeed = Value end
			end
		end
	end,
})

MoveRight:AddToggle("AnimPlayerToggle", {
	Text = "动作播放器",
	Default = false,
	Tooltip = "开启后可从下方选择动作播放",
	Callback = function(Value)
		AnimPlayer.Enabled = Value
		if Value then Anim_refreshChar() else Anim_stopCurrent() end
	end,
})

MoveRight:AddDropdown("AnimSelect", {
	Values = AnimNameList,
	Default = 1,
	Multi = false,
	Text = "选择动作",
	Searchable = true,
	Callback = function(Value)
		AnimPlayer.Selected = Value
	end,
})

MoveRight:AddButton({
	Text = "播放选中动作",
	Func = function()
		if not AnimPlayer.Enabled then return end
		if not AnimPlayer.Selected then return end
		Anim_play(AnimPlayer.Selected)
	end,
})

MoveRight:AddButton({
	Text = "停止动作",
	Func = function()
		Anim_stopCurrent()
	end,
})

MoveRight:AddDivider()

MoveRight:AddToggle("HighlightScreenToggle", {
	Text = "高亮画面",
	Default = false,
	Tooltip = "提升亮度、移除雾和大气效果",
	Callback = function(Value)
		if Value then Highlight_start() else Highlight_stop() end
	end,
})

-- ============================================================
-- 治疗标签页
-- ============================================================
local HealLeft = Tabs.Heal:AddLeftGroupbox("全图治疗", "users")
local HealRight = Tabs.Heal:AddRightGroupbox("自我治疗", "heart")

HealLeft:AddToggle("FullMapHealToggle", {Text = "全图治疗", Default = false, Callback = function(Value) FullMapHeal.Enabled = Value; if Value then FMH_start() end end})
HealLeft:AddSlider("FullMapHealThreshold", {Text = "治疗血量阈值", Default = 100, Min = 10, Max = 150, Rounding = 0, Callback = function(Value) FullMapHeal.HealThreshold = Value end})
HealLeft:AddToggle("FullMapHealAutoEquip", {Text = "自动装备治疗工具", Default = false, Callback = function(Value) FullMapHeal.AutoEquip = Value end})
HealLeft:AddDropdown("HealWhitelist", {
	SpecialType = "Player", Multi = true, ExcludeLocalPlayer = true,
	Text = "治疗白名单（空=全部）",
	Tooltip = "选择要治疗的玩家。都不选则治疗所有人",
	Callback = function(Value)
		FullMapHeal.Whitelist = Value or {}
		local count = 0
		for _ in pairs(FullMapHeal.Whitelist) do count = count + 1 end
		FullMapHeal.WhitelistEmpty = (count == 0)
	end,
})

HealRight:AddToggle("SelfHealToggle", {Text = "自我治疗", Default = false, Callback = function(Value) SelfHeal.Enabled = Value; if Value then SH_start() else SH_stop() end end})
HealRight:AddSlider("SelfHealThreshold", {Text = "开始治疗血量", Default = 99, Min = 1, Max = 150, Rounding = 0, Callback = function(Value) SelfHeal.HealThreshold = Value end})
HealRight:AddSlider("SelfHealStopThreshold", {Text = "停止治疗血量", Default = 100, Min = 10, Max = 200, Rounding = 0, Callback = function(Value) SelfHeal.StopThreshold = Value end})
HealRight:AddToggle("SelfHealAutoEquip", {Text = "自动装备治疗工具", Default = false, Callback = function(Value) SelfHeal.AutoEquip = Value end})

-- ============================================================
-- 卸载标签页
-- ============================================================
local UnloadLeft = Tabs.Unload:AddLeftGroupbox("控制", "power")

UnloadLeft:AddButton({
	Text = "卸载脚本",
	Func = function()
		pcall(function() FullMapHeal.Enabled = false; FMH_stop() end)
		pcall(function() SelfHeal.Enabled = false; SH_stop() end)
		pcall(function() RapierKillAura.Enabled = false; RKA_stop() end)
		pcall(function() MeleeKillAura.Enabled = false; MKA_stop() end)
		pcall(function() RifleKillAura.Enabled = false; RKA_rifle_stop() end)
		pcall(function() AutoBlock.Enabled = false; BKA_stopBlocking() end)
		pcall(function() ESP_stop() end)
		pcall(function() ESPFolder:Destroy() end)
		pcall(function() Fly_stop() end)
		pcall(function() Noclip_stop() end)
		pcall(function() Speed_stop() end)
		pcall(function() Highlight_stop() end)
		pcall(function() HB_stop() end)
		pcall(function() Anim_stopCurrent() end)
		task.spawn(function() task.wait(0.1); Library:Unload() end)
	end,
	DoubleClick = false, Tooltip = "关闭界面并停止所有功能", Risky = true,
})

Window:Show()

-- ============================================================
-- 作者：大肉帮帮主    群：921286406
-- ============================================================
print("大肉帮脚本已加载 | 作者大肉帮帮主 群921286406")