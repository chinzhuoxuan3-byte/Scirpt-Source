local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

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
		local speaker = LocalPlayer
		local chr = speaker.Character
		local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
		local nowe = false

		local Notify = function() end

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
				speeds = 1
			end
		end)

		speaker.CharacterAdded:Connect(function(newChar)
			chr = newChar
			hum = chr:FindFirstChildOfClass("Humanoid")
		end)

		local function startFlight()
			nowe = true
			onof.Text = "飞"
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
				for _, v in next, hum:GetPlayingAnimationTracks() do
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

			local rootPart
			if hum.RigType == Enum.HumanoidRigType.R6 then
				rootPart = chr.Torso
			else
				rootPart = chr.UpperTorso
			end
			if rootPart then
				local bg = Instance.new("BodyGyro", rootPart)
				bg.P = 9e4
				bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				bg.CFrame = rootPart.CFrame
				local bv = Instance.new("BodyVelocity", rootPart)
				bv.Velocity = Vector3.new(0, 0, 0)
				bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

				if nowe then
					LocalPlayer.Character.Humanoid.PlatformStand = true
				end

				while nowe and LocalPlayer.Character.Humanoid.Health > 0 do
					RunService.RenderStepped:Wait()
					bg.CFrame = workspace.CurrentCamera.CoordinateFrame
				end
				bg:Destroy()
				bv:Destroy()
				LocalPlayer.Character.Humanoid.PlatformStand = false
				LocalPlayer.Character.Animate.Disabled = false
			end
		end

		local function stopFlight()
			nowe = false
			onof.Text = "飞"
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

		onof.MouseButton1Click:Connect(function()
			if not nowe then
				startFlight()
			else
				stopFlight()
			end
		end)
	end)

	if not success then
		warn("飞行脚本加载失败：" .. tostring(err))
	end
end

local AutoTranslateEnabled = false
local translateLoop = false
local translatedTexts = {}

local function isEnglish(text)
	if not text or text == "" then return false end
	local englishCount, totalCount = 0, 0
	for char in text:gmatch(".") do
		local byte = string.byte(char)
		if byte then
			totalCount = totalCount + 1
			if (byte >= 65 and byte <= 90) or (byte >= 97 and byte <= 122) then
				englishCount = englishCount + 1
			end
		end
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
		if decoded and decoded[1] and decoded[1][1] and decoded[1][1][1] then
			return decoded[1][1][1]
		end
		return nil
	end)
	if success and result then
		translatedTexts[text] = result
		return result
	end
	return nil
end

local function processTextObject(obj)
	if not AutoTranslateEnabled then return end
	if not obj:IsA("TextLabel") and not obj:IsA("TextButton") and not obj:IsA("TextBox") then return end
	local originalText = obj.Text
	if not originalText or originalText == "" then return end
	if not isEnglish(originalText) then return end
	local translated = translateText(originalText)
	if translated and translated ~= originalText then
		obj.Text = translated
	end
end

local function scanAndTranslate(container, maxCount)
	local count = 0
	for _, obj in ipairs(container:GetDescendants()) do
		if count >= maxCount then break end
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
			if isEnglish(obj.Text) then
				processTextObject(obj)
				count = count + 1
			end
		end
	end
end

local function startAutoTranslate()
	AutoTranslateEnabled = true
	if translateLoop then return end
	translateLoop = true
	task.spawn(function()
		while translateLoop and AutoTranslateEnabled do
			local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
			if PlayerGui then
				scanAndTranslate(PlayerGui, 5)
			end
			pcall(function()
				for _, gui in ipairs(CoreGui:GetChildren()) do
					if gui:IsA("ScreenGui") then
						scanAndTranslate(gui, 5)
					end
				end
			end)
			task.wait(0.1)
		end
	end)
end

local function stopAutoTranslate()
	AutoTranslateEnabled = false
	translateLoop = false
end

local espEnabled = false
local espLabels = {}
local minPrice = 0

local containerESPEnabled = false
local containerLabels = {}

local monsterESPEnabled = false
local monsterLabels = {}

local teammateESPEnabled = false
local teammateLabels = {}

local elevatorESPEnabled = false
local elevatorLabels = {}

local containerKeywords = {
	"柜","柜子","储物柜","置物柜","电视柜","床头柜","橱柜","衣柜",
	"箱","箱子","木箱","集装箱","容器",
	"桶","油桶","铁桶","冰箱","冰柜",
	"cabinet","locker","cupboard","wardrobe","drawer","closet","shelf",
	"box","crate","chest","container","case",
	"barrel","drum","canister","fridge","refrigerator","freezer",
	"шкаф","тумба","комод","ящик","сундук",
	"armario","estante","cajon","cofre","vitrina",
	"placard","étagère","coffre","armoire",
	"schrank","regal","kiste","truhe","fass",
	"armadio","scaffale","cassaforte",
	"ロッカー","キャビネット","棚","箱","コンテナ",
	"사물함","캐비닛","상자","통",
	"ตู้","ชั้นวาง","กล่อง","ถัง",
}

local elevatorKeywords = {"elevator", "lift", "电梯", "升降梯", "エレベーター", "엘리베이터", "ascenseur", "aufzug", "elevador", "лифт"}

local function isContainer(obj)
	if not obj:IsA("Model") and not obj:IsA("BasePart") then return false end
	if getItemPrice(obj) > 0 then return false end
	if isPlayerCharacter(obj) then return false end
	if isMonster(obj) then return false end

	-- 无价格的物品/拾取物一律视为容器
	if isItemOrContainer(obj) then return true end

	-- 带交互提示的物体
	if obj:FindFirstChildWhichIsA("ProximityPrompt") or obj:FindFirstChildWhichIsA("ClickDetector") then
		return true
	end

	-- 名称匹配关键词
	local nameLower = obj.Name:lower()
	for _, kw in ipairs(containerKeywords) do
		if nameLower:find(kw:lower()) then return true end
	end

	-- 任何有动画（非锚定）的物体也视为容器（排除怪物）
	if obj:IsA("Model") then
		for _, p in ipairs(obj:GetDescendants()) do
			if p:IsA("BasePart") and not p.Anchored then return true end
		end
	elseif obj:IsA("BasePart") and not obj.Anchored then
		return true
	end

	return false
end

local function isElevator(obj)
	if not obj:IsA("Model") and not obj:IsA("BasePart") then return false end
	local nameLower = obj.Name:lower()
	for _, kw in ipairs(elevatorKeywords) do
		if nameLower:find(kw:lower()) then return true end
	end
	return false
end

local function isMonster(obj)
	if not obj:IsA("Model") then return false end
	local hum = obj:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return false end
	return Players:GetPlayerFromCharacter(obj) == nil
end

local function isTeammate(obj)
	if not obj:IsA("Model") then return false end
	if obj == LocalPlayer.Character then return false end
	local player = Players:GetPlayerFromCharacter(obj)
	return player ~= nil and player ~= LocalPlayer
end

local function getColorByPrice(price)
	if price <= 15 then return Color3.new(1, 1, 1)
	elseif price <= 120 then return Color3.new(0, 1, 0)
	elseif price <= 338 then return Color3.new(0, 0, 1)
	elseif price <= 1000 then return Color3.new(0.5, 0, 0.5)
	elseif price <= 10000 then return Color3.new(1, 0.84, 0)
	else return Color3.new(1, 0, 0) end
end

local function parsePriceFromTexts(obj)
	local function scanTexts(parent)
		for _, child in ipairs(parent:GetDescendants()) do
			if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
				local text = child.Text
				if text then
					local price = text:match("%$(%d+)") or text:match("(%d+)%s*%$")
					if price then return tonumber(price) end
				end
			end
		end
		return nil
	end
	local price = scanTexts(obj)
	if price then return price end
	if obj:IsA("Model") then price = scanTexts(obj) end
	return price
end

local priceKeywords = {
	"price", "cost", "value", "価格", "가격", "价格", "prix", "preis", "precio",
	"costo", "ราคา", "giá", "harga", "cena", "Цена",
}

local function getItemPrice(obj)
	local textPrice = parsePriceFromTexts(obj)
	if textPrice then return textPrice end
	local found = 0
	for _, child in ipairs(obj:GetChildren()) do
		local nameLower = child.Name:lower()
		for _, kw in ipairs(priceKeywords) do
			if nameLower:find(kw) then
				if child:IsA("IntValue") or child:IsA("NumberValue") then
					found = math.max(found, child.Value)
				elseif child:IsA("StringValue") then
					local num = tonumber(child.Value)
					if num then found = math.max(found, num) end
				end
			end
		end
	end
	return found
end

local function isItemOrContainer(obj)
	if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then return false end
	for _, p in pairs(Players:GetPlayers()) do
		if obj == p.Character or obj:FindFirstAncestor(p.Name) then return false end
	end
	if obj:FindFirstAncestorOfClass("Model") and obj:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") then
		return false
	end
	return obj:FindFirstChild("Item", true) or obj:FindFirstChild("Pickup", true) or
		obj:FindFirstChild("Handle", true) or obj:FindFirstChild("Package", true) or
		obj:FindFirstChild("Collectable", true) or obj:FindFirstChild("Container", true) or
		obj:FindFirstChild("Box", true)
end

local function getTargetPart(obj)
	if obj:IsA("BasePart") then return obj end
	if obj:IsA("Model") then
		local primary = obj.PrimaryPart
		if primary then return primary end
		for _, child in ipairs(obj:GetChildren()) do
			if child:IsA("BasePart") then return child end
		end
	end
	return obj
end

local function isPlayerCharacter(obj)
	for _, p in pairs(Players:GetPlayers()) do
		if obj == p.Character then return true end
		if obj:FindFirstAncestor(p.Name) then return true end
	end
	return false
end

local function isNearElevator(pos)
	for _, part in ipairs(Workspace:GetDescendants()) do
		if part:IsA("BasePart") then
			local nameLower = part.Name:lower()
			for _, kw in ipairs(elevatorKeywords) do
				if nameLower:find(kw) and (part.Position - pos).Magnitude < 10 then
					return true
				end
			end
		end
	end
	return false
end

local function clearESP()
	for _, v in pairs(espLabels) do pcall(function() v:Destroy() end) end
	espLabels = {}
end

local function clearContainerESP()
	for _, v in pairs(containerLabels) do pcall(function() v:Destroy() end) end
	containerLabels = {}
end

local function clearMonsterESP()
	for _, v in pairs(monsterLabels) do pcall(function() v:Destroy() end) end
	monsterLabels = {}
end

local function clearTeammateESP()
	for _, v in pairs(teammateLabels) do pcall(function() v:Destroy() end) end
	teammateLabels = {}
end

local function clearElevatorESP()
	for _, v in pairs(elevatorLabels) do pcall(function() v:Destroy() end) end
	elevatorLabels = {}
end

local function drawESP()
	clearESP()
	if not espEnabled then return end
	for _, v in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if not isItemOrContainer(v) then return end
			local price = getItemPrice(v)
			if price < minPrice then return end
			local target = getTargetPart(v)
			if isNearElevator(target.Position) then return end
			local displayText = "$" .. price
			local color = getColorByPrice(price)

			local bill = Instance.new("BillboardGui")
			bill.Adornee = target
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(0, 120, 0, 30)
			bill.Parent = target
			local txt = Instance.new("TextLabel")
			txt.Parent = bill
			txt.Size = UDim2.new(1, 0, 1, 0)
			txt.BackgroundTransparency = 1
			txt.TextColor3 = color
			txt.TextScaled = true
			txt.Text = displayText
			txt.Font = Enum.Font.SourceSansBold

			local hr = Instance.new("Highlight")
			hr.Adornee = target
			hr.Parent = target
			hr.FillColor = color
			hr.OutlineColor = color
			hr.FillTransparency = 0.4
			hr.OutlineTransparency = 0
			hr.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			table.insert(espLabels, bill)
			table.insert(espLabels, hr)
		end)
	end
end

local function drawContainerESP()
	clearContainerESP()
	if not containerESPEnabled then return end
	local handledModels = {}
	for _, v in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if not isContainer(v) then return end
			local target = getTargetPart(v)
			local model = v:IsA("Model") and v or v:FindFirstAncestorOfClass("Model")
			if model and handledModels[model] then return end
			if model then handledModels[model] = true end
			local hr = Instance.new("Highlight")
			hr.Adornee = target
			hr.Parent = target
			hr.FillColor = Color3.new(1, 1, 0)
			hr.OutlineColor = Color3.new(1, 1, 0)
			hr.FillTransparency = 0.7
			hr.OutlineTransparency = 0
			hr.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			table.insert(containerLabels, hr)
		end)
	end
end

local function drawMonsterESP()
	clearMonsterESP()
	if not monsterESPEnabled then return end
	local handledModels = {}
	for _, v in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if not isMonster(v) then return end
			local target = getTargetPart(v)
			local model = v:IsA("Model") and v or v:FindFirstAncestorOfClass("Model")
			if model and handledModels[model] then return end
			if model then handledModels[model] = true end
			local hr = Instance.new("Highlight")
			hr.Adornee = target
			hr.Parent = target
			hr.FillColor = Color3.new(1, 0, 0)
			hr.OutlineColor = Color3.new(1, 0, 0)
			hr.FillTransparency = 0.7
			hr.OutlineTransparency = 0
			hr.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			table.insert(monsterLabels, hr)
		end)
	end
end

local function drawTeammateESP()
	clearTeammateESP()
	if not teammateESPEnabled then return end
	local handledModels = {}
	for _, v in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if not isTeammate(v) then return end
			local target = getTargetPart(v)
			local model = v:IsA("Model") and v or v:FindFirstAncestorOfClass("Model")
			if model and handledModels[model] then return end
			if model then handledModels[model] = true end
			local hr = Instance.new("Highlight")
			hr.Adornee = target
			hr.Parent = target
			hr.FillColor = Color3.new(1, 1, 1)
			hr.OutlineColor = Color3.new(1, 1, 1)
			hr.FillTransparency = 0.7
			hr.OutlineTransparency = 0
			hr.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			table.insert(teammateLabels, hr)
		end)
	end
end

local function drawElevatorESP()
	clearElevatorESP()
	if not elevatorESPEnabled then return end
	local handledModels = {}
	for _, v in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if not isElevator(v) then return end
			local target = getTargetPart(v)
			local model = v:IsA("Model") and v or v:FindFirstAncestorOfClass("Model")
			if model and handledModels[model] then return end
			if model then handledModels[model] = true end
			local hr = Instance.new("Highlight")
			hr.Adornee = target
			hr.Parent = target
			hr.FillColor = Color3.new(0, 1, 0)
			hr.OutlineColor = Color3.new(0, 1, 0)
			hr.FillTransparency = 0.3
			hr.OutlineTransparency = 0
			hr.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			table.insert(elevatorLabels, hr)
		end)
	end
end

local function startESPWatcher()
	Workspace.DescendantAdded:Connect(function(obj)
		if espEnabled and isItemOrContainer(obj) then drawESP() end
		if containerESPEnabled and isContainer(obj) then drawContainerESP() end
		if monsterESPEnabled and isMonster(obj) then drawMonsterESP() end
		if teammateESPEnabled and isTeammate(obj) then drawTeammateESP() end
		if elevatorESPEnabled and isElevator(obj) then drawElevatorESP() end
	end)
end

local function refreshAllESP()
	if espEnabled then drawESP() end
	if containerESPEnabled then drawContainerESP() end
	if monsterESPEnabled then drawMonsterESP() end
	if teammateESPEnabled then drawTeammateESP() end
	if elevatorESPEnabled then drawElevatorESP() end
end

local killMovingActive = false
local killMovingConnection

local function isNonPlayerCharacter(model)
	if not model:IsA("Model") then return false end
	local hum = model:FindFirstChildOfClass("Humanoid")
	if not hum then return false end
	return Players:GetPlayerFromCharacter(model) == nil
end

local function killMovingMonsters()
	for _, obj in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if obj:IsA("BasePart") then
				local model = obj:FindFirstAncestorOfClass("Model")
				if model and isNonPlayerCharacter(model) then
					local hum = model:FindFirstChildOfClass("Humanoid")
					if hum and hum.Health > 0 then
						local root = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
						if root and (root.Velocity.Magnitude > 0.5 or hum.MoveDirection.Magnitude > 0.1) then
							model:Destroy()
						end
					end
				end
			end
		end)
	end
end

local function toggleKillMoving(state)
	killMovingActive = state
	if state then
		if killMovingConnection then killMovingConnection:Disconnect() end
		killMovingConnection = RunService.Heartbeat:Connect(killMovingMonsters)
	else
		if killMovingConnection then killMovingConnection:Disconnect() killMovingConnection = nil end
	end
end

local freezeActive = false
local freezeConnection
local originalSpeeds = {}

local function freezeMonsters()
	for _, obj in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if obj:IsA("BasePart") then
				local model = obj:FindFirstAncestorOfClass("Model")
				if model and isNonPlayerCharacter(model) then
					local hum = model:FindFirstChildOfClass("Humanoid")
					if hum and hum.Health > 0 then
						if not originalSpeeds[model] then
							originalSpeeds[model] = hum.WalkSpeed
							hum.WalkSpeed = 0
							hum.JumpPower = 0
							hum.PlatformStand = true
						end
					end
				end
			end
		end)
	end
end

local function unfreezeMonsters()
	for model, origSpeed in pairs(originalSpeeds) do
		pcall(function()
			local hum = model:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.WalkSpeed = origSpeed
				hum.JumpPower = 50
				hum.PlatformStand = false
			end
		end)
	end
	originalSpeeds = {}
end

local function toggleFreeze(state)
	freezeActive = state
	if state then
		freezeMonsters()
		if freezeConnection then freezeConnection:Disconnect() end
		freezeConnection = RunService.Heartbeat:Connect(freezeMonsters)
	else
		if freezeConnection then freezeConnection:Disconnect() freezeConnection = nil end
		unfreezeMonsters()
	end
end

local function findNearestElevator(pos)
	local nearest, minDist = nil, math.huge
	for _, part in pairs(Workspace:GetDescendants()) do
		if part:IsA("BasePart") then
			local nameLower = part.Name:lower()
			for _, kw in ipairs(elevatorKeywords) do
				if nameLower:find(kw) then
					local dist = (part.Position - pos).Magnitude
					if dist < minDist then minDist = dist; nearest = part end
					break
				end
			end
		end
	end
	return nearest
end

local function teleportToElevator()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local elevator = findNearestElevator(hrp.Position)
	if elevator then hrp.CFrame = elevator.CFrame + Vector3.new(0, 2, 0) end
end

local function gatherLootToElevator()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local elevator = findNearestElevator(char.HumanoidRootPart.Position)
	if not elevator then return end
	for _, obj in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if isItemOrContainer(obj) then
				local primary = obj:IsA("Model") and obj.PrimaryPart or (obj:IsA("BasePart") and obj)
				if primary then
					primary.CFrame = CFrame.new(elevator.Position + Vector3.new(math.random(-2,2),2,math.random(-2,2)))
				end
			end
		end)
	end
end

local teleportedLoot = {}
local function cleanupInvalidMarks()
	for obj, _ in pairs(teleportedLoot) do
		if not obj.Parent or not isItemOrContainer(obj) then teleportedLoot[obj] = nil end
	end
end

local function teleportToNearestLoot()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	cleanupInvalidMarks()
	local candidates = {}
	for _, obj in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if isItemOrContainer(obj) and not teleportedLoot[obj] then
				local primary = obj:IsA("Model") and obj.PrimaryPart or (obj:IsA("BasePart") and obj)
				if primary then
					table.insert(candidates, {obj=obj, primary=primary, dist=(primary.Position - hrp.Position).Magnitude})
				end
			end
		end)
	end
	if #candidates == 0 then teleportedLoot = {} return end
	table.sort(candidates, function(a,b) return a.dist < b.dist end)
	local target = candidates[1]
	hrp.CFrame = target.primary.CFrame + Vector3.new(0,2,0)
	teleportedLoot[target.obj] = true
end

local function teleportToNearestPlayer()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local nearest, minDist = nil, math.huge
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
			if dist < minDist then minDist = dist; nearest = p.Character.HumanoidRootPart end
		end
	end
	if nearest then hrp.CFrame = nearest.CFrame + Vector3.new(0,2,0) end
end

local remoteOpenActive = false
local remoteOpenLoop

local function forceOpenContainers()
	for _, obj in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if isContainer(obj) then
				if obj:IsA("Model") then
					for _, part in ipairs(obj:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
							part.Transparency = math.max(part.Transparency, 0.5)
						end
						if part:IsA("ClickDetector") then part:FireClick(LocalPlayer) end
						if part:IsA("ProximityPrompt") then
							part.MaxActivationDistance = 500
							part.RequiresLineOfSight = false
							part:Prompt(LocalPlayer)
							part:InputHoldBegin()
							task.wait(0.1)
							part:InputHoldEnd()
						end
					end
					local openValue = obj:FindFirstChild("Open")
					if openValue and openValue:IsA("BoolValue") then openValue.Value = true end
					local lockedValue = obj:FindFirstChild("Locked")
					if lockedValue and lockedValue:IsA("BoolValue") then lockedValue.Value = false end
				elseif obj:IsA("BasePart") then
					obj.CanCollide = false
					obj.Transparency = 0.5
					for _, child in ipairs(obj:GetDescendants()) do
						if child:IsA("ClickDetector") then child:FireClick(LocalPlayer) end
						if child:IsA("ProximityPrompt") then
							child.MaxActivationDistance = 500
							child.RequiresLineOfSight = false
							child:Prompt(LocalPlayer)
							child:InputHoldBegin()
							task.wait(0.1)
							child:InputHoldEnd()
						end
					end
				end
			end
		end)
	end
end

local function fireAllClickDetectors()
	for _, obj in pairs(Workspace:GetDescendants()) do
		pcall(function()
			if obj:IsA("BasePart") then
				for _, child in ipairs(obj:GetDescendants()) do
					if child:IsA("ClickDetector") then child:FireClick(LocalPlayer) end
					if child:IsA("ProximityPrompt") then
						child:Prompt(LocalPlayer)
						if child.RequiresLineOfSight == false then child:InputHoldBegin() end
					end
				end
				if obj:FindFirstChild("Open") and obj.Open:IsA("BoolValue") then obj.Open.Value = true end
			end
			if obj:IsA("Model") then
				for _, child in ipairs(obj:GetDescendants()) do
					if child:IsA("ClickDetector") then child:FireClick(LocalPlayer) end
					if child:IsA("ProximityPrompt") then
						child:Prompt(LocalPlayer)
						if child.RequiresLineOfSight == false then child:InputHoldBegin() end
					end
				end
				if obj:FindFirstChild("Open") and obj.Open:IsA("BoolValue") then obj.Open.Value = true end
			end
		end)
	end
end

local function toggleRemoteOpen(state)
	remoteOpenActive = state
	if state then
		if remoteOpenLoop then task.cancel(remoteOpenLoop) end
		remoteOpenLoop = task.spawn(function()
			while remoteOpenActive do
				fireAllClickDetectors()
				forceOpenContainers()
				task.wait(0.5)
			end
		end)
	else
		if remoteOpenLoop then task.cancel(remoteOpenLoop) remoteOpenLoop = nil end
	end
end

local desiredWalkSpeed = 16
RunService.Heartbeat:Connect(function()
	local char = LocalPlayer.Character
	if char then
		local humanoid = char:FindFirstChild("Humanoid")
		if humanoid and humanoid.WalkSpeed ~= desiredWalkSpeed then
			humanoid.WalkSpeed = desiredWalkSpeed
		end
	end
end)
LocalPlayer.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid")
	humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if humanoid.WalkSpeed ~= desiredWalkSpeed then
			humanoid.WalkSpeed = desiredWalkSpeed
		end
	end)
end)

local noClipActive = false
local function setNoClip(state)
	noClipActive = state
	local char = LocalPlayer.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local minY = math.huge
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			local pos = part.Position
			if pos.Y < minY then minY = pos.Y end
		end
	end
	local threshold = minY + 1
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			if state then
				part.CanCollide = part.Position.Y <= threshold
			else
				part.CanCollide = true
			end
		end
	end
	if state then Notify("穿墙已开启") else Notify("穿墙已关闭") end
end

local nightVisionEnabled = false
local originalLighting = {}
local function enableNightVision()
	nightVisionEnabled = true
	originalLighting = {
		Brightness = Lighting.Brightness,
		Ambient = Lighting.Ambient,
		OutdoorAmbient = Lighting.OutdoorAmbient,
		ClockTime = Lighting.ClockTime,
		FogEnd = Lighting.FogEnd,
		FogStart = Lighting.FogStart,
		FogColor = Lighting.FogColor,
	}
	Lighting.Brightness = 3
	Lighting.Ambient = Color3.new(1,1,1)
	Lighting.OutdoorAmbient = Color3.new(1,1,1)
	Lighting.ClockTime = 12
	Lighting.FogEnd = 10000
	Lighting.FogStart = 5000
	Lighting.FogColor = Color3.new(1,1,1)
end
local function disableNightVision()
	nightVisionEnabled = false
	if originalLighting.Brightness then
		Lighting.Brightness = originalLighting.Brightness
		Lighting.Ambient = originalLighting.Ambient
		Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
		Lighting.ClockTime = originalLighting.ClockTime
		Lighting.FogEnd = originalLighting.FogEnd
		Lighting.FogStart = originalLighting.FogStart
		Lighting.FogColor = originalLighting.FogColor
	end
end

local jumpFloatGui, jumpFloatBtn, jumpPanel, jumpHeight = nil, nil, nil, 24
local jumpEnabled = false
local function createJumpFloat()
	if jumpFloatGui then jumpFloatGui:Destroy() end
	jumpFloatGui = Instance.new("ScreenGui", CoreGui)
	jumpFloatGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	jumpFloatBtn = Instance.new("TextButton", jumpFloatGui)
	jumpFloatBtn.Size = UDim2.new(0,60,0,60)
	jumpFloatBtn.Position = UDim2.new(1,-80,1,-80)
	jumpFloatBtn.BackgroundColor3 = Color3.new(0,0.5,1)
	jumpFloatBtn.Text = "↑"
	jumpFloatBtn.TextColor3 = Color3.new(1,1,1)
	jumpFloatBtn.TextSize = 40
	jumpFloatBtn.Font = Enum.Font.SourceSansBold
	Instance.new("UICorner", jumpFloatBtn).CornerRadius = UDim.new(1,0)
	local gearBtn = Instance.new("TextButton", jumpFloatGui)
	gearBtn.Size = UDim2.new(0,24,0,24)
	gearBtn.Position = UDim2.new(1,-86,1,-86)
	gearBtn.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
	gearBtn.Text = "⚙"
	gearBtn.TextColor3 = Color3.new(1,1,1)
	gearBtn.TextSize = 18
	gearBtn.Font = Enum.Font.SourceSansBold
	Instance.new("UICorner", gearBtn).CornerRadius = UDim.new(1,0)
	jumpPanel = Instance.new("Frame", jumpFloatGui)
	jumpPanel.Size = UDim2.new(0,220,0,140)
	jumpPanel.Position = UDim2.new(1,-240,1,-160)
	jumpPanel.BackgroundColor3 = Color3.fromRGB(30,30,30)
	jumpPanel.Visible = false
	Instance.new("UICorner", jumpPanel).CornerRadius = UDim.new(0,8)
	local closeBtn = Instance.new("TextButton", jumpPanel)
	closeBtn.Size = UDim2.new(0,20,0,20)
	closeBtn.Position = UDim2.new(1,-25,0,5)
	closeBtn.BackgroundColor3 = Color3.new(0.8,0.2,0.2)
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.new(1,1,1)
	closeBtn.Font = Enum.Font.SourceSansBold
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1,0)
	closeBtn.MouseButton1Click:Connect(function() jumpPanel.Visible = false end)
	local heightLabel = Instance.new("TextLabel", jumpPanel)
	heightLabel.Size = UDim2.new(1,-30,0,30)
	heightLabel.Position = UDim2.new(0,10,0,5)
	heightLabel.BackgroundTransparency = 1
	heightLabel.Text = "跳跃高度：" .. jumpHeight
	heightLabel.TextColor3 = Color3.new(1,1,1)
	heightLabel.Font = Enum.Font.SourceSansBold
	local inputBox = Instance.new("TextBox", jumpPanel)
	inputBox.Size = UDim2.new(0.6,0,0,30)
	inputBox.Position = UDim2.new(0.2,0,0,50)
	inputBox.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
	inputBox.Text = tostring(jumpHeight)
	inputBox.TextColor3 = Color3.new(1,1,1)
	inputBox.Font = Enum.Font.SourceSansBold
	Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0,6)
	local confirmBtn = Instance.new("TextButton", jumpPanel)
	confirmBtn.Size = UDim2.new(0.4,0,0,30)
	confirmBtn.Position = UDim2.new(0.1,0,0,90)
	confirmBtn.BackgroundColor3 = Color3.new(0,0.6,0)
	confirmBtn.Text = "确认"
	confirmBtn.TextColor3 = Color3.new(1,1,1)
	confirmBtn.Font = Enum.Font.SourceSansBold
	Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0,6)
	confirmBtn.MouseButton1Click:Connect(function()
		local num = tonumber(inputBox.Text)
		if num and num >= 16 and num <= 100 then
			jumpHeight = num
			heightLabel.Text = "跳跃高度：" .. jumpHeight
		end
	end)
	local resetBtn = Instance.new("TextButton", jumpPanel)
	resetBtn.Size = UDim2.new(0.4,0,0,30)
	resetBtn.Position = UDim2.new(0.5,0,0,90)
	resetBtn.BackgroundColor3 = Color3.new(0.8,0.4,0)
	resetBtn.Text = "默认"
	resetBtn.TextColor3 = Color3.new(1,1,1)
	resetBtn.Font = Enum.Font.SourceSansBold
	Instance.new("UICorner", resetBtn).CornerRadius = UDim.new(0,6)
	resetBtn.MouseButton1Click:Connect(function()
		jumpHeight = 24
		inputBox.Text = "24"
		heightLabel.Text = "跳跃高度：" .. jumpHeight
	end)
	gearBtn.MouseButton1Click:Connect(function() jumpPanel.Visible = not jumpPanel.Visible end)
	local function performJump()
		if not jumpEnabled then return end
		local char = LocalPlayer.Character
		if not char then return end
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hrp and hum and hum.Health > 0 and hum.FloorMaterial ~= Enum.Material.Air then
			hrp.Velocity = Vector3.new(hrp.Velocity.X, jumpHeight, hrp.Velocity.Z)
		end
	end
	jumpFloatBtn.MouseButton1Click:Connect(performJump)
end
local function destroyJumpFloat()
	if jumpFloatGui then jumpFloatGui:Destroy() jumpFloatGui = nil jumpPanel = nil jumpFloatBtn = nil end
end

local function showTimeWindow(mode)
	local g = Instance.new("ScreenGui", CoreGui)
	local f = Instance.new("Frame", g)
	f.Size = UDim2.new(0,200,0, mode=="both" and 55 or 30)
	f.Position = UDim2.new(0.5,-100,0,80)
	f.BackgroundColor3 = Color3.new(0,0,0)
	f.BackgroundTransparency = 0.3
	f.Active = true
	f.Draggable = true
	Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)
	local t1 = Instance.new("TextLabel", f)
	t1.Size = UDim2.new(1,0,0,30)
	t1.BackgroundTransparency = 1
	t1.TextColor3 = Color3.new(1,1,1)
	t1.Font = Enum.Font.SourceSansBold
	t1.TextSize = 16
	local t2
	if mode == "both" then
		t2 = Instance.new("TextLabel", f)
		t2.Size = UDim2.new(1,0,0,25)
		t2.Position = UDim2.new(0,0,0,30)
		t2.BackgroundTransparency = 1
		t2.TextColor3 = Color3.new(1,0,0)
		t2.Font = Enum.Font.SourceSansBold
		t2.TextSize = 14
	end
	local startTime = tick()
	local conn; conn = g.AncestryChanged:Connect(function() if not g.Parent then conn:Disconnect() end end)
	task.spawn(function()
		while f.Parent do
			local now = os.date("*t")
			local nowStr = string.format("%02d:%02d:%02d", now.hour, now.min, now.sec)
			local elapsed = tick() - startTime
			local h = math.floor(elapsed/3600) local m = math.floor((elapsed%3600)/60) local s = math.floor(elapsed%60)
			local usedStr = string.format("已用 %02d:%02d:%02d", h,m,s)
			if mode == "now" then t1.Text = "现在时间："..nowStr
			elseif mode == "used" then t1.Text = usedStr
			elseif mode == "both" then t1.Text = nowStr if t2 then t2.Text = usedStr end end
			task.wait(1)
		end
	end)
end

local repo = 'https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/'
local function safeLoad(url)
	local success, result = pcall(function() return loadstring(game:HttpGet(url))() end)
	if not success then warn("加载失败: "..url) return nil end
	return result
end

local Library = safeLoad(repo..'Library.lua')
local ThemeManager = safeLoad(repo..'addons/ThemeManager.lua')
local SaveManager = safeLoad(repo..'addons/SaveManager.lua')

if not Library then
	StarterGui:SetCore("SendNotification",{ Title="错误", Text="UI库加载失败", Duration=5 })
	return
end

local Notify = function(msg) Library:Notify(msg,3) end

StarterGui:SetCore("SendNotification",{
	Title = "亡命速递脚本",
	Text = "恐拜大帝 持续更新\nQQ：3999698324",
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
})

local Window = Library:CreateWindow({
	Title = "亡命速递脚本",
	Footer = "By 恐拜大帝 | QQ:3999698324",
	Icon = 131153193945220,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Notification = Window:AddTab("通知","info"),
	Main = Window:AddTab("主要功能","star"),
	ESP = Window:AddTab("透视","eye"),
	Settings = Window:AddTab("设置","settings"),
}

local NotifyGroup = Tabs.Notification:AddLeftGroupbox("作者信息")
NotifyGroup:AddLabel("恐拜大帝 持续更新此脚本")
NotifyGroup:AddLabel("QQ：3999698324", true)

local MainLeft = Tabs.Main:AddLeftGroupbox("核心功能")
MainLeft:AddButton({ Text="召唤飞行脚本", Func=function()
	local success, err = pcall(loadFlightScript)
	if success then Notify("飞行脚本已加载") else Notify("飞行脚本加载失败: "..tostring(err)) end
end, DoubleClick=false })
MainLeft:AddToggle("AutoTranslate",{ Text="自动翻译界面", Default=false, Callback=function(v)
	if v then startAutoTranslate() Notify("自动翻译已开启") else stopAutoTranslate() Notify("自动翻译已关闭") end
end})
MainLeft:AddToggle("KillMoving",{ Text="杀死移动怪物", Default=false, Callback=function(v)
	toggleKillMoving(v) Notify("杀死移动怪物: "..(v and "开启" or "关闭"))
end})
MainLeft:AddToggle("Freeze",{ Text="冻结怪物", Default=false, Callback=function(v)
	toggleFreeze(v) Notify("冻结怪物: "..(v and "开启" or "关闭"))
end})
MainLeft:AddButton({ Text="一键开启所有容器", Func=function()
	fireAllClickDetectors() forceOpenContainers() Notify("已尝试开启所有容器")
end, DoubleClick=false })
MainLeft:AddButton({ Text="物资聚集到电梯", Func=function()
	gatherLootToElevator() Notify("物资已聚集到电梯")
end, DoubleClick=false })
MainLeft:AddButton({ Text="一键传送回电梯", Func=function()
	teleportToElevator() Notify("已传送回电梯")
end, DoubleClick=false })
MainLeft:AddButton({ Text="传送到最近物资", Func=function()
	teleportToNearestLoot() Notify("已传送至最近物资")
end, DoubleClick=false })

local MainRight = Tabs.Main:AddRightGroupbox("辅助与传送")
MainRight:AddButton({ Text="传送到最近玩家", Func=function()
	teleportToNearestPlayer() Notify("已传送至最近玩家")
end, DoubleClick=false })
MainRight:AddToggle("RemoteOpen",{ Text="远程打开所有容器 (持续)", Default=false, Callback=function(v)
	toggleRemoteOpen(v) Notify("远程打开容器: "..(v and "开启" or "关闭"))
end})
MainRight:AddSlider("WalkSpeed",{ Text="移动速度 (防回拉)", Default=16, Min=16, Max=100, Rounding=0, Suffix=" studs", Callback=function(v)
	desiredWalkSpeed = v
	local char = LocalPlayer.Character
	if char then local hum = char:FindFirstChild("Humanoid") if hum then hum.WalkSpeed = v end end
	Notify("移动速度已设为 "..v)
end})
MainRight:AddButton({ Text="显示现在时间", Func=function() showTimeWindow("now") end, DoubleClick=false })
MainRight:AddButton({ Text="显示已用时长", Func=function() showTimeWindow("used") end, DoubleClick=false })
MainRight:AddButton({ Text="我全都要", Func=function() showTimeWindow("both") end, DoubleClick=false })
MainRight:AddToggle("JumpToggle",{ Text="显示跳跃按钮", Default=false, Callback=function(v)
	jumpEnabled = v
	if v then if not jumpFloatGui then createJumpFloat() end Notify("跳跃按钮已显示") else destroyJumpFloat() Notify("跳跃按钮已隐藏") end
end})
MainRight:AddToggle("NightVision",{ Text="夜视", Default=false, Callback=function(v)
	if v then enableNightVision() Notify("夜视已开启") else disableNightVision() Notify("夜视已关闭") end
end})
MainRight:AddToggle("NoClip",{ Text="穿墙", Default=false, Callback=function(v) setNoClip(v) end})

local ESPGroup = Tabs.ESP:AddLeftGroupbox("透视设置")
ESPGroup:AddToggle("ESP",{ Text="透视物资 (显示价格)", Default=false, Callback=function(v)
	espEnabled = v
	if v then drawESP() Notify("物资透视已开启") else clearESP() Notify("物资透视已关闭") end
end})
ESPGroup:AddToggle("ContainerESP",{ Text="透视容器 (黄色)", Default=false, Callback=function(v)
	containerESPEnabled = v
	if v then drawContainerESP() Notify("容器透视已开启") else clearContainerESP() Notify("容器透视已关闭") end
end})
ESPGroup:AddToggle("MonsterESP",{ Text="透视怪物 (红色)", Default=false, Callback=function(v)
	monsterESPEnabled = v
	if v then drawMonsterESP() Notify("怪物透视已开启") else clearMonsterESP() Notify("怪物透视已关闭") end
end})
ESPGroup:AddToggle("TeammateESP",{ Text="透视队友 (白色)", Default=false, Callback=function(v)
	teammateESPEnabled = v
	if v then drawTeammateESP() Notify("队友透视已开启") else clearTeammateESP() Notify("队友透视已关闭") end
end})
ESPGroup:AddToggle("ElevatorESP",{ Text="透视电梯 (绿色)", Default=false, Callback=function(v)
	elevatorESPEnabled = v
	if v then drawElevatorESP() Notify("电梯透视已开启") else clearElevatorESP() Notify("电梯透视已关闭") end
end})
ESPGroup:AddSlider("MinPrice",{ Text="最低价格过滤", Default=0, Min=0, Max=1000, Rounding=0, Suffix="$", Callback=function(v)
	minPrice = v
	if espEnabled then drawESP() end
	-- 取消价格过滤通知
end})

local SettingsGroup = Tabs.Settings:AddLeftGroupbox("全局设置")
SettingsGroup:AddButton({ Text="卸载脚本", Func=function() Library:Unload() end, DoubleClick=false })

if ThemeManager then
	ThemeManager:SetLibrary(Library)
	ThemeManager:SetFolder("DeadlyDelivery")
	ThemeManager:ApplyToTab(Tabs.Settings)
end
if SaveManager then
	SaveManager:SetLibrary(Library)
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetFolder("DeadlyDelivery")
	SaveManager:BuildConfigSection(Tabs.Settings)
end

startESPWatcher()
Notify("亡命速递脚本已加载")