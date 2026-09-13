local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local repo = "https://raw.githubusercontent.com/YirdeX-Dev/obsidian_UI/refs/heads/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "SaveManager.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "ThemeManager.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Options = Library.Options
local Toggles = Library.Toggles
local A1 = game:GetService("Players")
local A2 = A1.LocalPlayer
local A3 = game:GetService("RunService")
local A4 = game:GetService("Lighting")
local A5 = game:GetService("CoreGui")
local A6 = game:GetService("UserInputService")
local A7 = game:GetService("TeleportService")
local A8 = workspace
local A9 = game:GetService("HttpService")

local Window = Library:CreateWindow({
    Title = "YX-脚本中心",
    Footer = "脚本中心",
    Size = UDim2.fromOffset(750, 650),
    Icon = "rbxassetid://71400987113958", 
    AutoShow = true,
    NotifySide = "Right",
    ShowCustomCursor = true,
    IconSize = UDim2.fromOffset(35, 35),
    Resizable = true,
    MobileButtonsSide = "Left",
    DisableSearch = false,
    SearchbarSize = UDim2.new(0.8, 0, 1, 0),
    GlobalSearch = false,
    
    Position = UDim2.fromOffset(100, 100),
    Center = true,
    
    EnableSidebarResize = true,
    EnableCompacting = true,
    SidebarCompacted = false,
    MinContainerWidth = 256,
})

if Window and Window.TitleLabel then
    Window.TitleLabel.RichText = true
end

local Tabs = {
    Main = Window:AddTab("玩家通用", "user"),
    ScriptCenter = Window:AddTab("脚本中心", "code"),
    Afhubyyds = Window:AddTab("付费功能", "star"),
    YXIKB = Window:AddTab("YX加载", "menu"),    
    Settings = Window:AddTab("设置", "settings"),
}
local scriptCategories = {
    {
        GroupName = "各大脚本",
        List = {
            {Name = "AF脚本中心", Url = "https://api.jnkie.com/api/v1/luascripts/public/4e025c3c0ccda1554634165acb8f8ee2c1de5f0f8d7f60e7b396c622d7e6e9b0/download"},
            {Name = "叶脚本", Url = "https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-CNVIP-XIAOYE.lua"},
            {Name = "xk脚本", Url = "https://github.com/devslopo/DVES/raw/main/XK%20Hub"},
            {Name = "新版XA脚本", Url = "https://github.com/YunLua/Lua/raw/main/XA_Hub.lua"},
            {Name = "皮脚本", Url = "https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"},
            {Name = "落叶脚本", Url = "https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"},
            {Name = "Rb脚本中心＿汉化中心", Url = "https://api.luarmor.net/files/v3/loaders/4fe525637e43a1be8cb0cdf902d107c2.lua"},
            {Name = "sky Hub", Url = "https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/Skyhub.lua"},
            {Name = "NOL免费版", Url = "https://raw.githubusercontent.com/Syndromehsh/BETA2/refs/heads/main/NOL"},
            {Name = "BS中心", Url = "https://gitee.com/BS_script/script/raw/master/黑洞中心(BS).txt"},
            {Name = "Rb脚本中心", Url = "https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"},
            {Name = "sa脚本", Url = "https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"},
            {Name = "霖溺通用", Url = "https://raw.githubusercontent.com/ShenJiaoBen/Partial-Server-Ribbon/refs/heads/main/Linni_Universal.txt"},
        }
    },
    {
        GroupName = "FE",
        List = {
            {Name = "放置我的世界方块", Url = "https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/MozCraft"},
            {Name = "可让尾巴饰品动起来()", Url = "https://rawscripts.net/raw/Universal-Script-physics-based-tail-animator-86591"},
            {Name = "可做动作脚本", Url = "https://raw.githubusercontent.com/sypcerr/scripts/refs/heads/main/c15.lua"},
            {Name = "valout动作脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/valout%E8%A1%A8%E6%83%85"},
        }
    },
    {
        GroupName = "99夜",
        List = {
            {Name = "虚空99夜脚本汉化", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/99%E5%A4%9C%E6%B1%89%E5%8C%96"},
            {Name = "Foxname99夜汉化脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Foxname99"},
            {Name = "99夜脚本可杀队友", Url = "https://raw.githubusercontent.com/358545698555/roblox-/refs/heads/main/%E5%8F%AF%E6%9D%80%E9%98%9F%E5%8F%8B99%E5%A4%9C"},
            {Name = "RINGTA汉化脚本", Url = "https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/99Nights"},
            {Name = "99夜汉化脚本(无敌有效果)", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E7%A7%8B%E8%BE%9E99%E5%A4%9C%E6%B1%89%E5%8C%96"},
            {Name = "AF Hub 99夜", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/99%E5%A4%9C%E8%84%9A%E6%9C%AC"},
        }
    },
    {
        GroupName = "亡命速递",
        List = {
            {Name = "亡命速递脚本无法使用", Url = "https://raw.githubusercontent.com/JanseJYC/Script/refs/heads/main/Deadly-Deliver.lua"},
            {Name = "亡命速递英文脚本", Url = "https://raw.githubusercontent.com/xxdaysheus01/RuneX/refs/heads/main/DeadlyDeliveryScript.lua"},
            {Name = "亡命速递", Url = "https://pandadevelopment.net/virtual/file/c96973c95ae3aaec"},
            {Name = "亡命速递汉化脚本", Url = "https://raw.githubusercontent.com/JanseJYC/Script/refs/heads/main/Deadly-Deliver.lua"},
        }
    },
    {
        GroupName = "死铁轨",
        List = {
            {Name = "仿红叶脚本汉化", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E4%BB%BF%E7%BA%A2%E5%8F%B6%E8%84%9A%E6%9C%AC%E6%B1%89%E5%8C%96"},
            {Name = "红叶脚本", Url = "https://getnative.cc/script/loader"},
            {Name = "速通脚本汉化", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E6%AD%BB%E9%93%81%E8%BD%A8%E6%B1%89%E5%8C%96%E8%84%9A%E6%9C%AC"},
            {Name = "死铁轨脚本", Url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
            {Name = "死铁轨脚本(好用)", Url = "https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"},
        }
    },
    {
        GroupName = "墨水游戏",
        List = {
            {Name = "AX-有芙同享汉化", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/ax%E8%84%9A%E6%9C%AC%E7%A7%8B%E8%BE%9E%E6%B1%89%E5%8C%96"},
            {Name = "AX-YirdeX汉化脚本", Url = "https://raw.githubusercontent.com/YirdeX-Dev/China/refs/heads/main/Ax%E6%B1%89%E5%8C%96%E8%84%9A%E6%9C%AC"},   
             {Name = "HSX汉化脚本", Url = "https://raw.githubusercontent.com/YirdeX-Dev/China/refs/heads/main/HSX%E5%A2%A8%E6%B0%B4%E6%B8%B8%E6%88%8F"},   
            {Name = "墨水Ringta汉化", Url = "https://raw.githubusercontent.com/YirdeX-Dev/China/refs/heads/main/RINGTA/ink%20Game.lua"},
            {Name = "Unm汉化，卡密ink50", Url = "https://raw.githubusercontent.com/Youfutongxiang1/unm-CN/refs/heads/main/README.md"},
        }
    },
    {
        GroupName = "doors",
        List = {
            {Name = "Doors脚本", Url = "https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/mshax(prohax).txt"},
            {Name = "doors最新脚本", Url = "https://raw.githubusercontent.com/TheHunterSolo1/Scripts/refs/heads/main/Protected_2809220311826785.lua.txt"},
            {Name = "doorsDP汉化脚本", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/doors-DP-robot"},
            {Name = "doors abysall汉化脚本", Url = "https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/Abysallcn-hub"},
        }
    },
    {
        GroupName = "监狱生活",
        List = {
            {Name = "监狱生活汉化", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E7%9B%91%E7%8B%B1%E7%94%9F%E6%B4%BB%E8%84%9A%E6%9C%AC"},
        }
    },
    {
        GroupName = "战争大亨",
        List = {
            {Name = "战争大亨最强脚本", Url = "https://raw.githubusercontent.com/MaxPikaa/PureLove/refs/heads/main/520"},
            {Name = "战争大亨无卡密高级脚本", Url = "https://raw.githubusercontent.com/Macintosh1983/ChillHubMain/main/ChillHubOilWarfareTycoon.lua"},
        }
    },
    {
        GroupName = "被遗弃",
        List = {
            {Name = "RINGTA汉化脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/RINGTA/forsaken"},
            {Name = "Fart汉化脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/fartsaken"},
            {Name = "访客中心汉化脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/fartsaken"},
        }
    },
    {
        GroupName = "俄亥俄州",
        List = {
            {Name = "俄亥俄州自动捡彩蛋脚本", Url = "https://pastebin.com/raw/TrPbSbkm"},
            {Name = "Rb脚本俄亥俄州", Url = "https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/RbHub-OHIO"},
        }
    },
    {
        GroupName = "画我",
        List = {
            {Name = "无卡密画我脚本", Url = "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/KENNY画我.lua"},
        }
    },
    {
        GroupName = "通缉脚本",
        List = {
            {Name = "SX HUB", Url = "https://api.luarmor.net/files/v3/loaders/87a8a4f4c2d2ef535ccd1bdb949218fe.lua"},
            {Name = "KENNY", Url = "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/KENNY通缉换服.lua"},
            {Name = "通缉", Url = "https://raw.githubusercontent.com/combatlegnd/combatlegnd/refs/heads/main/NH-Loader"},
        }
    },
    {
        GroupName = "闪光",
        List = {
            {Name = "闪光脚本", Url = "https://apigetunx.vercel.app/UNX.lua"},
            {Name = "闪光脚本(英文)", Url = "https://raw.githubusercontent.com/Jager-Hub/Scripts/refs/heads/main/loader.lua"},
        }
    },
    {
        GroupName = "最坚强的战场",
        List = {
            {Name = "最强战场Phantasm汉化脚本", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/thestongestbattlegrounds-Phantasm-robot"},
            {Name = "最坚强的战场脚本2", Url = "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/phantasm.lua"},
            {Name = "最坚强的战场脚本(好用)", Url = "https://eltonshub-loader.netlify.app/UBG1.lua"},
            {Name = "角色扮演搜sans汉化脚本", Url = "https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/Merebennie"},
            {Name = "Phantasm汉化脚本", Url = "https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/Phantasm"},
            {Name = "AlanbeikersFF汉化脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/AlanbeikersFF"},
            {Name = "Combat汉化脚本", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Combat"},
            {Name = "最坚强的战场open脚本", Url = "https://api.luarmor.net/files/v3/loaders/6f502e252308fb97855295005faa73a0.lua"},
        }
    },
    {
        GroupName = "偷走脑红",
        List = {
            {Name = "偷走脑红脚本", Url = "https://raw.githubusercontent.com/DynaFetchy/Scripts/refs/heads/main/Loader.lua"},
            {Name = "偷走脑红脚本2", Url = "https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/偷走脑红"},
            {Name = "偷走脑红KURD汉化脚本", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/Brainrot-KURD-robot"},
        }
    },
    {
        GroupName = "竞争对手",
        List = {
            {Name = "竞争对手脚本汉化", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/竞争对手汉化脚本"},
        }
    },
    {
        GroupName = "chain脚本",
        List = {
            {Name = "chain英文脚本", Url = "https://api.getpolsec.com/scripts/hosted/79fcede2ce14619990c741986e6123ddbc41cd9e4a25c4dc4da13c5f63a25f2b.lua"},
        }
    },
    {
        GroupName = "跳跃对决",
        List = {
            {Name = "跳跃对决脚本", Url = "https://raw.githubusercontent.com/solarastuff/sorryjimpee/refs/heads/main/Jumper.lua"},
        }
    },
    {
        GroupName = "死亡球",
        List = {
            {Name = "死亡球Fluxin汉化脚本(要卡密)", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/deathball-Fluxin-robot"},
            {Name = "死亡球stark汉化脚本(要卡密)", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/Deathballs-stark-robot"},
            {Name = "NodeX死亡球", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/NodeX%E5%88%80%E5%88%83%E5%89%91.lua"},
            {Name = "Achaotic死亡球", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Achaotic%E5%88%80%E5%88%83%E7%90%83"},
        }
    },
    {
        GroupName = "监狱人生",
        List = {
            {Name = "监狱人生人机汉化脚本", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/PrisonLife-Serk4rx-robot"},
        }
    },
    {
        GroupName = "逃脱海啸",
        List = {
            {Name = "逃脱海啸并带走红Merqur汉化脚本(要卡密)", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/EscapeTsunamiForBrinrots-Merqury-robot"},
            {Name = "逃脱海啸并拿走脑红Solix汉化脚本(要卡密)", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/EscapeTsunamiForBrinrots-Solix-robot"},
        }
    },
    {
        GroupName = "盲射",
        List = {
            {Name = "盲射ToraIsMe汉化脚本", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/blindshot-ToraIsMe-robot"},
        }
    },
    {
        GroupName = "彩虹朋友",
        List = {
            {Name = "彩虹朋友二UB汉化脚本(要卡密)", Url = "https://raw.githubusercontent.com/Clover781/m/refs/heads/main/RainbowFriends-UB-robot"},
        }
    },
    {
        GroupName = "撕咬之夜",
        List = {
            {Name = "撕咬之夜", Url = "https://raw.githubusercontent.com/Youfutongxiang1/Msploit-v2-CN/refs/heads/main/Msploit-v2-CN"},
            {Name = "殺脚本撕咬之夜", Url = "https://raw.githubusercontent.com/FengYu-X/Max/refs/heads/X/BBN.lua"},
            {Name = "Ringta撕咬之夜(汉化)", Url = "https://raw.githubusercontent.com/Youfutongxiang1/RINGTA-BitebyNight-CN/refs/heads/main/RINGTA/Bite%20by%20Night-CN"},
            {Name = "撕咬之夜", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Cerberus"},
        }
    },
    {
        GroupName = "死刑",
        List = {
            {Name = "死刑脚本(无卡密)", Url = "https://api.luarmor.net/files/v3/loaders/8c08b8f2252eec7dbb77d253d269bb65.lua"},
        }
    },
    {
        GroupName = "活了7天",
        List = {
            {Name = "活了7天刷废料", Url = "https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server87"},
            {Name = "活了7天汉化", Url = "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E4%B8%83%E6%97%A5%E7%94%9F%E6%88%90kkk.txt"},
        }
    },
    {
        GroupName = "终极战场",
        List = {
            {Name = "终极战场脚本", Url = "https://raw.githubusercontent.com/YQANTGV3/YQANTGV3/refs/heads/main/antitamper.txt"},
        }
    },
    {
        GroupName = "餐厅大亨",
        List = {
            {Name = "餐厅大亨脚本(自动解卡无卡密)", Url = "https://rawscripts.net/raw/Universal-Script-Samuraa1-Hub-Best-Keyless-Script-For-EA-ByB-RT3-etc-88197"},
        }
    },
    {
        GroupName = "恐鬼症",
        List = {
            {Name = "恐鬼症脚本", Url = "https://raw.githubusercontent.com/longchneg/GAl/refs/heads/Dragon/%E6%81%90%E9%AC%BC%E7%97%87%20%E5%85%8D%E8%B4%B9%E7%89%88"},
            {Name = "恐鬼症付费脚本(免费用)", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E6%81%90%E9%AC%BC%E7%97%87"},
        }
    },
    {
        GroupName = "力量传奇",
        List = {
            {Name = "Yttrium力量传奇付费脚本(免费用)", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87%E8%84%9A%E6%9C%AC"},
        }
    },
    {
        GroupName = "通缉",
        List = {
            {Name = "Yttrium通缉付费脚本(免费用)", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E9%80%9A%E7%BC%89%E8%84%9A%E6%9C%AC%E5%85%8D%E8%B4%B9%E7%89%88"},
        }
    },
    {
        GroupName = "GB内脏与黑火药",
        List = {
            {Name = "GB汉化脚本(需要解卡和AX一样)", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/AF%20%E7%A7%8B%E5%AE%B9GB"},
        }
    },
    {
        GroupName = "攻击泰坦革命",
        List = {
            {Name = "攻击泰坦革命脚本(英文版)", Url = "https://api.luarmor.net/files/v4/loaders/705e7fe7aa288f0fe86900cedb1119b1.lua"},
        }
    },
    {
        GroupName = "犯罪",
        List = {
            {Name = "犯罪脚本付费版(免费用)", Url = "https://raw.githubusercontent.com/fningna51-stack/-/main/%E7%8A%AF%E7%BD%AA"},
        }
    },
    {
        GroupName = "破坏者谜团",
        List = {
            {Name = "破坏者谜团脚本", Url = "https://pastebin.com/raw/VRwdkSG3"},
            {Name = "Foxname MM2", Url = "https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Foxnamemm2.lua"},
        }
    }
}
local function CreateScriptButton(group, scriptName, scriptUrl, isLeft)
    local btn = group:AddButton({
        Text = scriptName,
        Func = function()
            Library:Notify("YX正在努力加载: " .. scriptName, 3)
            local success, result = pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)
            if success then
                Library:Notify("脚本加载成功: " .. scriptName, 3)
            else
                Library:Notify("加载失败: " .. tostring(result), 5)
            end
        end,
        DoubleClick = false,
    })
    return btn
end

local function BuildScriptCenter()
    local leftGroups = {}
    local rightGroups = {}
    local totalCategories = #scriptCategories
    local halfCount = math.ceil(totalCategories / 2)
    
    -- 左侧GroupBoxes
    for i = 1, halfCount do
        local category = scriptCategories[i]
        local group = Tabs.ScriptCenter:AddLeftGroupbox(category.GroupName, "folder")
        leftGroups[#leftGroups + 1] = group
        
        for _, script in ipairs(category.List) do
            CreateScriptButton(group, script.Name, script.Url, true)
        end
    end
    for i = halfCount + 1, totalCategories do
        local category = scriptCategories[i]
        local group = Tabs.ScriptCenter:AddRightGroupbox(category.GroupName, "folder")
        rightGroups[#rightGroups + 1] = group
        
        for _, script in ipairs(category.List) do
            CreateScriptButton(group, script.Name, script.Url, false)
        end
    end
end
BuildScriptCenter()

local YX = Tabs.YXIKB:AddLeftGroupbox("加载服务器")
YX:AddButton({
    Text = "MM2(破坏者谜团)",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YirdeX-Dev/scripts/refs/heads/main/Game/YX-HubMM2%E5%8A%A0%E5%AF%86%E8%84%9A%E6%9C%AC.lua"))()
    end
})
YX:AddButton({
    Text = "一击竞技场",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YirdeX-Dev/scripts/refs/heads/main/Game/一击竞技场.lua"))()
    end
})
YX:AddButton({
    Text = "伪装欺骗",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YirdeX-Dev/scripts/refs/heads/main/%E4%BC%AA%E8%A3%85%E6%AC%BA%E9%AA%97.lua"))()
    end
})


local Qczhdh = Tabs.YXIKB:AddRightTabbox()
local Tab2 = Qczhdh:AddTab("服务器","menu")
Tab2:AddLabel("🟩MM2")
Tab2:AddLabel("🟩一击竞技场")
Tab2:AddLabel("🟩伪装欺骗")


local Tab1 = Qczhdh:AddTab("服务器状态", "menu")
Tab1:AddLabel("🟩可用")
Tab1:AddLabel("🟨可用但有缺陷")
Tab1:AddLabel("⬛已停更")


local LeftGroup = Tabs.Main:AddLeftGroupbox("主要功能（全部可在墨水使用）")
local Afhubfygj = Tabs.Main:AddLeftGroupbox("翻译工具")
local Wjgjgn = Tabs.Main:AddLeftGroupbox("全游戏通用攻击", "sword")
local Cnmb = Tabs.Main:AddLeftGroupbox("外部加载功能", "download")
local Tong = Tabs.Main:AddLeftGroupbox("通用功能", "layers")
local Nbcoos = Tabs.Main:AddLeftGroupbox("传送", "plane")
local RightGroup = Tabs.Main:AddRightGroupbox("外部加载", "cloud-upload")
local Ksqcnbcos = Tabs.Main:AddRightGroupbox("透视（全部可在墨水使用）", "eye")
local Sjgnfh = Tabs.Main:AddRightGroupbox("视觉功能", "palette")
local Bofang = Tabs.Main:AddRightGroupbox("播放功能", "film")
local Yule = Tabs.Main:AddRightGroupbox("娱乐脚本功能", "gamepad")
local RotationControlGroup = Tabs.Main:AddRightGroupbox("旋转控制", "redo")

Tabs.Main:UpdateWarningBox({
        Title = '脚本信息',
        Text = '这里的功能请谨慎使用可能会被封禁，主要以缝合和二改不要再说我缝合我已经说了这个就是个缝合脚本中心OK？  \n致辞：秋辞 脚本中心汉化者：有芙同享  人机[<font color=\"rgb(255, 0, 0)\">谢谢您的使用，感谢大家</font>]',
        IsNormal = true,
        Visible = true,
        LockSize = true,
    })
local A17 = nil;
local A18 = false;
local A19 = false;
local A20 = false;
local A21 = false;
local A22 = nil;
local A23 = nil;
local A24 = nil;
local A25 = nil;
local A26 = nil;
local A27 = {};
local A28 = false;
local A29 = true;
local PL = {};
local CP = nil;
local bulletTrackingHook = nil;
local function safeNotify(title, message, duration)
        warn(title .. ": " .. message);
end
LeftGroup:AddToggle('JumpToggle', {
    Text = '超级跳跃',
    Default = false,
    Tooltip = '开启后跳跃高度大幅提升',
    Callback = function(Value)
        local JumpEnabled = Value
        local CurrentJump = 500
        
        local function updateJumpInternal()
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = JumpEnabled and CurrentJump or 50
            end
        end
        
        updateJumpInternal()
        
        Wjty2:SetData('JumpToggle_JumpEnabled', JumpEnabled)
        Wjty2:SetData('JumpToggle_CurrentJump', CurrentJump)
        
        Library:Notify(JumpEnabled and "超级跳跃已开启" or "超级跳跃已关闭", 1)
    end
})

LeftGroup:AddSlider('JumpPowerSlider', {
    Text = '跳跃力度值',
    Default = 100,
    Min = 50,
    Max = 500,
    Suffix = " 力量",
    Tooltip = '设置跳跃力度（需开启超级跳跃）',
    Callback = function(Value)
        local JumpEnabled = Wjty2:GetData('JumpToggle_JumpEnabled') or false
        local LocalPlayer = game:GetService("Players").LocalPlayer
        
        Wjty2:SetData('JumpToggle_CurrentJump', Value)
        
        if JumpEnabled then
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
            end
        end
        
        Library:Notify("跳跃力度已设置为: " .. Value, 1)
    end
})
LeftGroup:AddSlider("WalkSpeedSlider", {Text="移动速度(可在墨水使用)",Default=16,Min=16,Max=200,Rounding=0,Compact=false,Callback=function(Value)
        if (A2 and A2.Character) then
                local Humanoid = A2.Character:FindFirstChild("Humanoid");
                if Humanoid then
                        Humanoid.WalkSpeed = Value;
                end
        end
end});
LeftGroup:AddInput("WalkSpeedInput", {Text="移动速度设置",Default="",Placeholder="输入移动速度值",Numeric=true,Finished=false,Callback=function(Value)
        local numValue = tonumber(Value);
        if (numValue and A2 and A2.Character) then
                local Humanoid = A2.Character:FindFirstChild("Humanoid");
                if Humanoid then
                        Humanoid.WalkSpeed = numValue;
                end
        end
end});
LeftGroup:AddButton({Text="无限跳",Func=function()
        A20 = not A20;
        if A25 then
                A25:Disconnect();
                A25 = nil;
        end
        if A20 then
                A25 = A6.JumpRequest:Connect(function()
                        if A2.Character then
                                local Humanoid = A2.Character:FindFirstChildOfClass("Humanoid");
                                if Humanoid then
                                        Humanoid:ChangeState("Jumping");
                                end
                        end
                end);
        end
end});
LeftGroup:AddToggle("Full Bright", {
    Text = "夜视（高亮）",
    Default = false, 
    Callback = function(Value) 
_G.FullBright = Value
while _G.FullBright do
game.Lighting.Brightness = 2
game.Lighting.ClockTime = 14
game.Lighting.FogEnd = 100000
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
task.wait()
end
for i, v in pairs(_G.GetOldBright) do
game.Lighting[i] = v
end
    end
})
local FlyingEnabled = false
local SpinningEnabled = false
local FlightSpeed = 50
local SpinSpeed = 5

local CurrentAO, CurrentLV, CurrentMoverAttachment
local FlightConnection
local Control = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function getControlModule()
    local PlayerModule = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
    return require(PlayerModule:WaitForChild("ControlModule"))
end

local function setupBodyMovers(character)
    local hrp = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local moverParent = workspace:FindFirstChildOfClass("Terrain") or workspace

    local moverAttachment = Instance.new("Attachment", hrp)
    moverAttachment.Name = "FlightAttachment"

    local alignOrientation = Instance.new("AlignOrientation")
    alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    alignOrientation.RigidityEnabled = true
    alignOrientation.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    alignOrientation.CFrame = hrp.CFrame
    alignOrientation.Attachment0 = moverAttachment
    alignOrientation.Parent = moverParent

    local linearVelocity = Instance.new("LinearVelocity")
    linearVelocity.VectorVelocity = Vector3.zero
    linearVelocity.MaxForce = 9e9
    linearVelocity.Attachment0 = moverAttachment
    linearVelocity.Parent = moverParent

    return alignOrientation, linearVelocity, humanoid, moverAttachment
end

local function getFlightVector(controlModule)
    local moveVector = controlModule:GetMoveVector()

    Control.F = -moveVector.Z
    Control.B = moveVector.Z
    Control.L = -moveVector.X
    Control.R = moveVector.X
    Control.Q = moveVector.Y
    Control.E = -moveVector.Y

    if UserInputService:IsKeyDown(Enum.KeyCode.W) then Control.F = 1 end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then Control.B = 1 end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then Control.L = 1 end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then Control.R = 1 end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then Control.Q = 1 end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then Control.E = 1 end

    local flightVector =
        Camera.CFrame.LookVector * (Control.F - Control.B) +
        Camera.CFrame.RightVector * (Control.R - Control.L) +
        Vector3.new(0, 1, 0) * (Control.Q - Control.E)

    return flightVector.Magnitude > 0 and flightVector.Unit or flightVector
end

local function startFlying()
    if FlyingEnabled then return end

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if not character then return end

    FlyingEnabled = true
    SpinningEnabled = false

    if CurrentAO then CurrentAO:Destroy() end
    if CurrentLV then CurrentLV:Destroy() end
    if CurrentMoverAttachment then CurrentMoverAttachment:Destroy() end

    CurrentAO, CurrentLV, humanoid, CurrentMoverAttachment = setupBodyMovers(character)

    local controlModule = getControlModule()

    FlightConnection = RunService.Heartbeat:Connect(function()
        if not FlyingEnabled or not CurrentLV or not CurrentAO then return end

        local flightVector = getFlightVector(controlModule)

        if flightVector.Magnitude > 0 then
            CurrentLV.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
            CurrentLV.VectorVelocity = flightVector * FlightSpeed
        else
            CurrentLV.VectorVelocity = Vector3.zero
        end

        if SpinningEnabled then
            local targetPart = humanoid.SeatPart or character.HumanoidRootPart
            CurrentAO.CFrame = targetPart.CFrame * CFrame.Angles(0, math.rad(SpinSpeed), 0)
        else
            CurrentAO.CFrame = Camera.CFrame
        end

        humanoid.PlatformStand = true
    end)

    character.AncestryChanged:Connect(function(_, parent)
        if not parent and FlyingEnabled then
            stopFlying()
        end
    end)
end

local function stopFlying()
    if not FlyingEnabled then return end

    FlyingEnabled = false
    SpinningEnabled = false

    if FlightConnection then
        FlightConnection:Disconnect()
        FlightConnection = nil
    end

    if CurrentAO then CurrentAO:Destroy() end
    if CurrentLV then CurrentLV:Destroy() end
    if CurrentMoverAttachment then CurrentMoverAttachment:Destroy() end

    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.PlatformStand = false
    end
end

LeftGroup:AddToggle('MyToggle', {
    Text = '飞行模式(能在墨水使用可能会被反作弊击杀)',
    Default = false,
    Tooltip = '开启 / 关闭飞行功能',
    Callback = function(Value)
        if Value then
            startFlying()
        else
            stopFlying()
        end
    end
})
LeftGroup:AddSlider('MyIntSlider', {
    Text = '飞行速度',
    Default = 50,
    Min = 1,
    Max = 200,
    Rounding = 0,
    Suffix = '',
    Compact = false,
    Callback = function(Value)
        FlightSpeed = Value
    end
})
local Workspace = game:GetService("Workspace")
local CurrentCamera = Workspace.CurrentCamera
LeftGroup:AddSlider('UltraWideSlider', {
    Text = "超广角设置(可在墨水使用)（已修复）",
    Default = 70,
    Min = 20,
    Max = 120,
    Rounding = 0,
    Suffix = "°",
    Compact = false,
    Callback = function(Value)
        local fov = tonumber(Value)
        if fov and CurrentCamera then
            CurrentCamera.FieldOfView = fov
        end
    end
})
LeftGroup:AddCheckbox("ESP", {
    Text = "透视[墨水可用]",
    Default = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")

        local highlights = {}
        local connections = {}

        local function clearHighlights()
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local hl = plr.Character.HumanoidRootPart:FindFirstChild("Highlight")
                    if hl then
                        hl:Destroy()
                    end
                end
            end
            for _, conn in pairs(connections) do
                if typeof(conn) == "RBXScriptConnection" then
                    conn:Disconnect()
                end
            end
            table.clear(highlights)
            table.clear(connections)
        end

        if enabled then
            for _, plr in pairs(Players:GetPlayers()) do
                task.spawn(function()
                    repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if not plr.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "Highlight"
                        highlight.Adornee = plr.Character
                        highlight.Parent = plr.Character.HumanoidRootPart
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlights[plr] = highlight
                    end
                end)
            end

            connections["PlayerAdded"] = Players.PlayerAdded:Connect(function(plr)
                task.spawn(function()
                    repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if not plr.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "Highlight"
                        highlight.Adornee = plr.Character
                        highlight.Parent = plr.Character.HumanoidRootPart
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlights[plr] = highlight
                    end
                end)
            end)

            connections["PlayerRemoving"] = Players.PlayerRemoving:Connect(function(plr)
                if highlights[plr] then
                    highlights[plr]:Destroy()
                    highlights[plr] = nil
                end
            end)

        else
            clearHighlights()
        end
    end
})
LeftGroup:AddToggle('AntiFlingToggle', {
    Text = '防甩飞(可在墨水使用)',
    Default = false,
    Tooltip = '开启后防止玩家被甩飞',

    Callback = function(state)
        if state then
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local LocalPlayer = Players.LocalPlayer

            local ANTI_FLING_FORCE = 1e6
            local UPDATE_RATE = 0.01

            _G.ActiveHandles = {
                Connections = {},
                Constraints = {},
                Alignments = {}
            }

            local function CreateSuperConstraint(part)
                local bodyPos = Instance.new("BodyPosition")
                bodyPos.P = ANTI_FLING_FORCE
                bodyPos.D = ANTI_FLING_FORCE / 10
                bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyPos.Position = part.Position
                bodyPos.Parent = part

                local bodyGyro = Instance.new("BodyGyro")
                bodyGyro.P = ANTI_FLING_FORCE
                bodyGyro.D = ANTI_FLING_FORCE / 10
                bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                bodyGyro.CFrame = part.CFrame
                bodyGyro.Parent = part

                local alignPos = Instance.new("AlignPosition")
                alignPos.RigidityEnabled = true
                alignPos.MaxForce = ANTI_FLING_FORCE
                alignPos.Responsiveness = ANTI_FLING_FORCE
                alignPos.Parent = part

                local alignOri = Instance.new("AlignOrientation")
                alignOri.RigidityEnabled = true
                alignOri.MaxTorque = ANTI_FLING_FORCE
                alignOri.Responsiveness = ANTI_FLING_FORCE
                alignOri.Parent = part

                table.insert(_G.ActiveHandles.Constraints, bodyPos)
                table.insert(_G.ActiveHandles.Constraints, bodyGyro)
                table.insert(_G.ActiveHandles.Alignments, alignPos)
                table.insert(_G.ActiveHandles.Alignments, alignOri)

                return bodyPos, bodyGyro, alignPos, alignOri
            end

            local function ApplyUltimateProtection(character)
                if not character then return end

                local rootPart = character:FindFirstChild("HumanoidRootPart")
                    or character:FindFirstChild("Torso")

                if not rootPart then return end

                local bodyPos, bodyGyro, alignPos, alignOri =
                    CreateSuperConstraint(rootPart)

                local updateConn = RunService.Heartbeat:Connect(function()
                    if not character:IsDescendantOf(workspace) then return end

                    bodyPos.Position = rootPart.Position
                    bodyGyro.CFrame = rootPart.CFrame

                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                            part.CustomPhysicalProperties =
                                PhysicalProperties.new(0, 0, 0)
                            part.AssemblyAngularVelocity = Vector3.new()
                            part.AssemblyLinearVelocity = Vector3.new()
                            part.Velocity = Vector3.new()
                            part.RotVelocity = Vector3.new()
                            part:SetAttribute("LastPosition", part.Position)
                        end
                    end
                end)

                table.insert(_G.ActiveHandles.Connections, updateConn)

                local velConn =
                    rootPart:GetPropertyChangedSignal("AssemblyLinearVelocity")
                        :Connect(function()
                            rootPart.AssemblyLinearVelocity = Vector3.new()
                            rootPart.Velocity = Vector3.new()
                        end)

                table.insert(_G.ActiveHandles.Connections, velConn)

                local rotConn =
                    rootPart:GetPropertyChangedSignal("AssemblyAngularVelocity")
                        :Connect(function()
                            rootPart.AssemblyAngularVelocity = Vector3.new()
                            rootPart.RotVelocity = Vector3.new()
                        end)

                table.insert(_G.ActiveHandles.Connections, rotConn)

                local posCheck = RunService.Heartbeat:Connect(function()
                    if not character:IsDescendantOf(workspace) then return end

                    local lastPos = rootPart:GetAttribute("LastPosition")
                    if lastPos then
                        local dist =
                            (rootPart.Position - lastPos).Magnitude
                        if dist > 5 then
                            rootPart.CFrame = CFrame.new(lastPos)
                        end
                    end
                    rootPart:SetAttribute("LastPosition", rootPart.Position)
                end)

                table.insert(_G.ActiveHandles.Connections, posCheck)
            end

            local function MonitorPlayer(player)
                if player == LocalPlayer then return end

                local function HandleCharacter(character)
                    if not character then return end
                    repeat task.wait() until
                        character:FindFirstChild("HumanoidRootPart")
                        or character:FindFirstChild("Torso")

                    ApplyUltimateProtection(character)
                end

                if player.Character then
                    HandleCharacter(player.Character)
                end

                local charConn =
                    player.CharacterAdded:Connect(HandleCharacter)
                table.insert(_G.ActiveHandles.Connections, charConn)
            end

            for _, player in ipairs(Players:GetPlayers()) do
                MonitorPlayer(player)
            end

            local playerConn =
                Players.PlayerAdded:Connect(MonitorPlayer)
            table.insert(_G.ActiveHandles.Connections, playerConn)

        else
            for _, conn in ipairs(_G.ActiveHandles.Connections or {}) do
                if conn.Connected then
                    conn:Disconnect()
                end
            end

            for _, constraint in ipairs(
                _G.ActiveHandles.Constraints or {}
            ) do
                if constraint and constraint.Parent then
                    constraint:Destroy()
                end
            end

            for _, align in ipairs(
                _G.ActiveHandles.Alignments or {}
            ) do
                if align and align.Parent then
                    align:Destroy()
                end
            end

            for _, player in ipairs(
                game:GetService("Players"):GetPlayers()
            ) do
                if player ~= LocalPlayer and player.Character then
                    for _, part in ipairs(
                        player.Character:GetDescendants()
                    ) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                            part.CustomPhysicalProperties = nil
                            part.AssemblyAngularVelocity = Vector3.new()
                            part.AssemblyLinearVelocity = Vector3.new()
                            part:SetAttribute("LastPosition", nil)
                        end
                    end
                end
            end

            _G.ActiveHandles = {
                Connections = {},
                Constraints = {},
                Alignments = {}
            }
        end
    end
})
LeftGroup:AddButton({Text="墨水飞行",Func=function()
        local FlyModule = {};
        FlyModule.Config = {MoveSpeed=10,FreezeEnabled=false,FreezeY=nil};
        FlyModule.State = {UI=nil,Connections={},Initialized=false};
        FlyModule.Init = function()
                if FlyModule.State.Initialized then
                        return;
                end
                FlyModule.Services = {Players=game:GetService("Players"),UserInputService=game:GetService("UserInputService"),RunService=game:GetService("RunService"),CoreGui=game:GetService("CoreGui")};
                FlyModule.Player = FlyModule.Services.Players.LocalPlayer;
                FlyModule.State.Initialized = true;
        end;
        FlyModule.CreateUI = function()
                if FlyModule.State.UI then
                        FlyModule.State.UI:Destroy();
                        FlyModule.State.UI = nil;
                end
                local ScreenGui = Instance.new("ScreenGui");
                ScreenGui.Name = "QC_FlyUI";
                ScreenGui.Parent = FlyModule.Services.CoreGui;
                ScreenGui.DisplayOrder = 2000;
                ScreenGui.ResetOnSpawn = false;
                local SpeedInput = Instance.new("TextBox");
                SpeedInput.Name = "SpeedInput";
                SpeedInput.Parent = ScreenGui;
                SpeedInput.Size = UDim2.new(0, 120, 0, 30);
                SpeedInput.Position = UDim2.new(0.95, -120, 0.05, 38);
                SpeedInput.Text = tostring(FlyModule.Config.MoveSpeed);
                SpeedInput.TextSize = 18;
                SpeedInput.PlaceholderText = "移动速度";
                SpeedInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                SpeedInput.BackgroundTransparency = 0.2;
                SpeedInput.TextColor3 = Color3.fromRGB(0, 0, 0);
                Instance.new("UICorner").Parent = SpeedInput;
                SpeedInput.FocusLost:Connect(function()
                        local num = tonumber(SpeedInput.Text);
                        if (num and (num > 0)) then
                                FlyModule.Config.MoveSpeed = num;
                        else
                                SpeedInput.Text = tostring(FlyModule.Config.MoveSpeed);
                        end
                end);
                local FreezeBtn = Instance.new("TextButton");
                FreezeBtn.Name = "FreezeBtn";
                FreezeBtn.Parent = ScreenGui;
                FreezeBtn.Size = UDim2.new(0, 120, 0, 38);
                FreezeBtn.Position = UDim2.new(0.95, -120, 0.05, 0);
                FreezeBtn.Text = "开启空中悬挂";
                FreezeBtn.TextSize = 20;
                FreezeBtn.BackgroundColor3 = Color3.fromRGB(210, 240, 255);
                FreezeBtn.BackgroundTransparency = 0.2;
                FreezeBtn.TextColor3 = Color3.fromRGB(0, 0, 0);
                Instance.new("UICorner").Parent = FreezeBtn;
                FreezeBtn.MouseButton1Click:Connect(function()
                        FlyModule.Config.FreezeEnabled = not FlyModule.Config.FreezeEnabled;
                        FreezeBtn.Text = (FlyModule.Config.FreezeEnabled and "悬挂√") or "开启空中悬挂";
                        FreezeBtn.BackgroundColor3 = (FlyModule.Config.FreezeEnabled and Color3.fromRGB(255, 200, 200)) or Color3.fromRGB(210, 240, 255);
                        if not FlyModule.Config.FreezeEnabled then
                                FlyModule.Config.FreezeY = nil;
                        end
                end);
                FlyModule.State.UI = ScreenGui;
                return ScreenGui;
        end;
        FlyModule.SetupCharacter = function(Character)
                FlyModule.Character = Character;
                FlyModule.Humanoid = Character:WaitForChild("Humanoid", 10);
                FlyModule.HRP = Character:WaitForChild("HumanoidRootPart", 10);
                FlyModule.Humanoid.Died:Connect(function()
                        FlyModule.Config.FreezeEnabled = false;
                        FlyModule.Config.FreezeY = nil;
                        if FlyModule.State.UI then
                                local FreezeBtn = FlyModule.State.UI:FindFirstChild("FreezeBtn");
                                if FreezeBtn then
                                        FreezeBtn.Text = "开启空中悬挂";
                                        FreezeBtn.BackgroundColor3 = Color3.fromRGB(210, 240, 255);
                                end
                        end
                end);
        end;
        FlyModule.SetupInfiniteJump = function()
                table.insert(FlyModule.State.Connections, FlyModule.Services.UserInputService.JumpRequest:Connect(function()
                        if (FlyModule.Humanoid and (FlyModule.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead)) then
                                FlyModule.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                        end
                end));
        end;
        FlyModule.SetupMainLoop = function()
                table.insert(FlyModule.State.Connections, FlyModule.Services.RunService.Heartbeat:Connect(function(dt)
                        if (FlyModule.Humanoid and FlyModule.HRP and (FlyModule.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead)) then
                                local MoveDirection = FlyModule.Humanoid.MoveDirection;
                                if FlyModule.Config.FreezeEnabled then
                                        local State = FlyModule.Humanoid:GetState();
                                        if ((State == Enum.HumanoidStateType.Freefall) and (FlyModule.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping)) then
                                                if (MoveDirection.Magnitude > 0) then
                                                        if not FlyModule.Config.FreezeY then
                                                                FlyModule.Config.FreezeY = FlyModule.HRP.Position.Y;
                                                        end
                                                        local Move = Vector3.new(MoveDirection.X, 0, MoveDirection.Z) * FlyModule.Config.MoveSpeed * dt;
                                                        local CurrentPos = FlyModule.HRP.Position;
                                                        local NewPos = Vector3.new(CurrentPos.X, FlyModule.Config.FreezeY, CurrentPos.Z) + Move;
                                                        FlyModule.HRP.CFrame = CFrame.new(NewPos, NewPos + FlyModule.HRP.CFrame.LookVector);
                                                        FlyModule.HRP.Velocity = Vector3.new(0, 0, 0);
                                                else
                                                        FlyModule.Config.FreezeY = nil;
                                                end
                                                return;
                                        else
                                                FlyModule.Config.FreezeY = nil;
                                        end
                                end
                                if (MoveDirection.Magnitude > 0) then
                                        FlyModule.HRP.CFrame = FlyModule.HRP.CFrame + (MoveDirection.Unit * FlyModule.Config.MoveSpeed * dt);
                                end
                        end
                end));
        end;
        FlyModule.SetupCharacterListeners = function()
                if FlyModule.Player.Character then
                        FlyModule.SetupCharacter(FlyModule.Player.Character);
                end
                table.insert(FlyModule.State.Connections, FlyModule.Player.CharacterAdded:Connect(function(Character)
                        FlyModule.SetupCharacter(Character);
                end));
                table.insert(FlyModule.State.Connections, FlyModule.Player.CharacterRemoving:Connect(function()
                        FlyModule.Character = nil;
                        FlyModule.Humanoid = nil;
                        FlyModule.HRP = nil;
                        FlyModule.Config.FreezeEnabled = false;
                        FlyModule.Config.FreezeY = nil;
                end));
        end;
        FlyModule.Start = function()
                FlyModule.Init();
                FlyModule.CreateUI();
                FlyModule.SetupInfiniteJump();
                FlyModule.SetupMainLoop();
                FlyModule.SetupCharacterListeners();
        end;
        FlyModule.Start();
end});

local function getUserIdByUsername(username)
    local HttpService = game:GetService("HttpService")
    local success, result = pcall(function()
        return game:HttpGet("https://users.roblox.com/v1/users/search?keyword=" .. username, true)
    end)
    if not success then return nil, nil, nil end
    local data = HttpService:JSONDecode(result)
    if data and data.data and #data.data > 0 then
        return data.data[1].id, data.data[1].name, data.data[1].displayName
    end
    return nil, nil, nil
end

local function applyCharacterAppearance(character, userId)
    local appearance = Players:GetCharacterAppearanceAsync(userId)

    for _, v in pairs(character:GetChildren()) do
        if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
            v:Destroy()
        end
    end

    for _, v in pairs(appearance:GetChildren()) do
        if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
            v.Parent = character
        elseif v:IsA("Accessory") then
            character.Humanoid:AddAccessory(v)
        end
    end

    if appearance:FindFirstChild("face") then
        if character:WaitForChild("Head"):FindFirstChild("face") then
            character.Head.face:Destroy()
        end
        appearance.face.Parent = character.Head
    end

    local parent = character.Parent
    character.Parent = nil
    character.Parent = parent
end
Afhubfygj:AddButton({
    Text = "翻译工具YX Hub",
    Func = function()
        local repo = 'https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "YX Hub丨自动翻译",
    Footer = "By Linni",
    Icon = 122936242690381,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Translate = Window:AddTab("自动翻译", "languages"),
    Settings = Window:AddTab("设置", "settings"),
}

local TranslateGroup = Tabs.Translate:AddLeftGroupbox("翻译设置")

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Chat = game:GetService("Chat")
local LocalPlayer = Players.LocalPlayer

local targetLang = "zh-CN"
local maxTextLength = 500
local baseScanInterval = 1.5
local speedMultiplier = 2
local translationMode = "智能翻译"
local translateNumbers = false
local translateSymbolsOnly = false
local skipPlayerNames = false
local autoTranslateEnabled = false
local heartbeatConnection = nil
local lastScanTime = 0

local translationCache = {}
local translatedInstances = {}

local emoteKeywords = {
    "neon", "shine", "ghost", "gold", "spin",
    "bighead", "smallhead", "giant", "squash",
}

local function detectLanguage(text)
    if not text or #text == 0 then
        return "en"
    end

    local counts = {
        cjk = 0,
        zht = 0,
        ko = 0,
        ja = 0,
        en = 0,
    }

    for _, code in utf8.codes(text) do
        local char = utf8.char(code)
        if char:match("[\228-\233][\128-\191][\128-\191]") then
            counts.cjk += 1
        elseif char:match("[\227][\128-\191][\128-\191]") then
            counts.zht += 1
        elseif char:match("[\234-\237][\128-\191]") then
            counts.ko += 1
        elseif char:match("[\227-\227][\128-\191][\128-\191]*") or char:match("[\227-\233][\128-\191]") then
            counts.ja += 1
        elseif char:match("[%a]") then
            counts.en += 1
        end
    end

    if counts.cjk > 3 then
        return counts.zht > 3 and "zh-TW" or "zh-CN"
    end
    if counts.ko > 2 then
        return "ko"
    end
    if counts.ja > 2 then
        return "ja"
    end
    if counts.en > 5 then
        return "en"
    end
    return "en"
end

local function shouldSkipText(text)
    if not text or text == "" or translationCache[text] then
        return true
    end
    if text:match("^%s*$") then
        return true
    end
    if not translateNumbers and text:match("^[%d%.%%,%s:/]+$") then
        return true
    end
    if not translateSymbolsOnly and text:match("^[^%w%s]+$") then
        return true
    end
    if #text > maxTextLength then
        return true
    end
    if not skipPlayerNames then
        if Players:FindFirstChild(text) then
            return true
        end
    end
    local lower = string.lower(text)
    for _, keyword in ipairs(emoteKeywords) do
        if string.find(lower, keyword) then
            return true
        end
    end
    return false
end

local function shouldTranslateByMode(text, detectedLang)
    if translationMode == "仅翻译英文" and detectedLang ~= "en" then
        return false
    end
    if translationMode == "仅翻译日文" and detectedLang ~= "ja" then
        return false
    end
    if translationMode == "仅翻译韩文" and detectedLang ~= "ko" then
        return false
    end
    if translationMode == "快速翻译" and #text > 50 then
        return false
    end
    return true
end

local function translateGoogle(text, fromLang, toLang)
    local url = string.format(
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s",
        fromLang,
        toLang,
        HttpService:UrlEncode(text)
    )

    local ok, body = pcall(function()
        return game:HttpGet(url, false, {
            ["User-Agent"] = "Mozilla/5.0",
        })
    end)
    if not ok or not body then
        return nil
    end

    local decodeOk, data = pcall(HttpService.JSONDecode, HttpService, body)
    if not decodeOk or not data or not data[1] then
        return nil
    end

    local result = ""
    for _, part in ipairs(data[1]) do
        if part[1] then
            result ..= part[1]
        end
    end
    return result ~= "" and result or nil
end

local function translateMyMemory(text, fromLang, toLang)
    local url = string.format(
        "https://api.mymemory.translated.net/get?q=%s&langpair=%s|%s",
        HttpService:UrlEncode(text),
        fromLang,
        toLang
    )

    local ok, body = pcall(function()
        return game:HttpGet(url, false, {
            ["User-Agent"] = "Roblox",
        })
    end)
    if not ok or not body then
        return nil
    end

    local decodeOk, data = pcall(HttpService.JSONDecode, HttpService, body)
    if not decodeOk or not data or not data.responseData then
        return nil
    end
    return data.responseData.translatedText
end

local function translateText(text)
    if shouldSkipText(text) then
        return translationCache[text] or text
    end

    local detected = detectLanguage(text)
    if detected == "zh-CN" then
        return text
    end
    if not shouldTranslateByMode(text, detected) then
        return text
    end

    local translated = translateGoogle(text, detected, targetLang)
    if translated then
        translationCache[text] = translated
        return translated
    end

    translated = translateMyMemory(text, detected, targetLang)
    if translated then
        translationCache[text] = translated
        return translated
    end

    return text
end

local function isTextInstance(obj)
    return obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")
end

local function shouldSkipInstance(obj)
    if not obj then
        return true
    end
    if obj == Chat or obj.Parent == Chat then
        return true
    end
    local ancestor = obj:FindFirstAncestorWhichIsA("TextChannel")
    if ancestor then
        return true
    end
    return false
end

local function getText(instance)
    if not isTextInstance(instance) then
        return nil
    end
    if not instance.Text or instance.Text == "" or shouldSkipInstance(instance) then
        return nil
    end
    return instance.Text
end

local function setText(instance, text)
    if isTextInstance(instance) and not shouldSkipInstance(instance) then
        instance.Text = text
    end
end

local function translateInstance(instance)
    if not isTextInstance(instance) or translatedInstances[instance] then
        return false
    end

    local original = getText(instance)
    if not original then
        return false
    end

    translatedInstances[instance] = true
    if getText(instance) == original then
        setText(instance, translateText(original))
        return true
    end
    return false
end

local function scanAndTranslate(root)
    local now = tick()
    if now - lastScanTime < baseScanInterval / speedMultiplier then
        return 0
    end
    lastScanTime = now

    local count = 0
    for _, descendant in ipairs(root:GetDescendants()) do
        if isTextInstance(descendant) and not translatedInstances[descendant] and not shouldSkipInstance(descendant) then
            if translateInstance(descendant) then
                count += 1
            end
        end
    end
    return count
end

local function onDescendantAdded(obj)
    if not autoTranslateEnabled or not isTextInstance(obj) then
        return
    end
    task.delay(0.1, function()
        if obj.Parent and not shouldSkipInstance(obj) then
            translateInstance(obj)
        end
    end)
end

TranslateGroup:AddLabel("注意：请先加载此脚本开启翻译，再加载你需要翻译的脚本", false)
TranslateGroup:AddLabel("小部分特殊UI无法翻译", false)

TranslateGroup:AddDropdown("TranslationMode", {
    Values = { "智能翻译", "仅翻译英文", "仅翻译日文", "仅翻译韩文", "快速翻译" },
    Default = 1,
    Multi = false,
    Text = "翻译模式",
    Callback = function(Value)
        translationMode = Value
    end
})

TranslateGroup:AddToggle("AutoTranslate", {
    Text = "启用自动翻译",
    Default = false,
    Callback = function(Value)
        autoTranslateEnabled = Value
        if Value then
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
            end
            scanAndTranslate(LocalPlayer:WaitForChild("PlayerGui"))
            heartbeatConnection = RunService.Heartbeat:Connect(function()
                if autoTranslateEnabled then
                    scanAndTranslate(LocalPlayer.PlayerGui)
                end
            end)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
        end
    end
})

TranslateGroup:AddSlider("TranslationSpeed", {
    Text = "翻译速度",
    Default = 2,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Suffix = "x",
    Callback = function(Value)
        speedMultiplier = Value
    end
})

TranslateGroup:AddToggle("TranslateNumbers", {
    Text = "翻译数字",
    Default = false,
    Callback = function(Value)
        translateNumbers = Value
    end
})
TranslateGroup:AddToggle("TranslateSymbolsOnly", {
    Text = "翻译纯符号",
    Default = false,
    Callback = function(Value)
        translateSymbolsOnly = Value
    end
})
TranslateGroup:AddToggle("SkipPlayerNames", {
    Text = "跳过玩家名称",
    Default = false,
    Callback = function(Value)
        skipPlayerNames = Value
    end
})
TranslateGroup:AddButton({
    Text = "官方群聊",
    Desc = "点击复制群号",
    Func = function()
        if setclipboard then
            setclipboard("766691084")
            Library:Notify("已复制群号: 766691084", 3)
        end
    end,
    DoubleClick = false,
})

local MenuGroup = Tabs.Settings:AddLeftGroupbox('菜单')
MenuGroup:AddButton('卸载脚本', function() Library:Unload() end)
MenuGroup:AddLabel('菜单快捷键'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder("MyScriptTheme")
SaveManager:SetFolder("MyScriptConfig")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

LocalPlayer:WaitForChild("PlayerGui").DescendantAdded:Connect(onDescendantAdded)
game:GetService("CoreGui").DescendantAdded:Connect(onDescendantAdded)
    end
})
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local CONFIG = {
    FollowDistance = 3,
    FollowHiders = true,
    FollowPosition = "后面",
}
local followConnection = nil
local currentTarget = nil
local isFollowing = false
local function IsPlayerSeeker(Player)
    if not Player or not Player.Character then return false end
    if Player.Backpack:FindFirstChild("Knife") then return true end
    if Player.Character:FindFirstChild("Knife") then return true end
    return false
end
local function GetHiders()
    local hiders = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not IsPlayerSeeker(player) then
                table.insert(hiders, player)
            end
        end
    end
    return hiders
end
local function GetSeekers()
    local seekers = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if IsPlayerSeeker(player) then
                table.insert(seekers, player)
            end
        end
    end
    return seekers
end
local function getTarget()
    if CONFIG.FollowHiders then
        local hiders = GetHiders()
        if #hiders > 0 then
            return hiders[math.random(1, #hiders)]
        end
        return nil
    else
        local allPlayers = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(allPlayers, player)
            end
        end
        if #allPlayers > 0 then
            return allPlayers[math.random(1, #allPlayers)]
        end
        return nil
    end
end
local function getPositionOffset()
    local distance = CONFIG.FollowDistance
    local position = CONFIG.FollowPosition
    
    if position == "前面" then
        return CFrame.new(0, 0, -distance)
    elseif position == "后面" then
        return CFrame.new(0, 0, distance)
    elseif position == "头顶" then
        return CFrame.new(0, distance, 0) * CFrame.Angles(math.rad(-90), 0, 0)
    elseif position == "下面" then
        return CFrame.new(0, -distance, 0)
    elseif position == "左面" then
        return CFrame.new(-distance, 0, 0)
    elseif position == "右面" then
        return CFrame.new(distance, 0, 0)
    else
        return CFrame.new(0, 0, distance)
    end
end
local function startFollowing()
    if isFollowing then
        stopFollowing()
        task.wait()
    end        
    currentTarget = getTarget()
    if not currentTarget then
        local targetType = CONFIG.FollowHiders and "躲藏者" or "任意玩家"
        warn("未找到可依附的目标（" .. targetType .. "）！")
        return
    end    
    isFollowing = true
    local targetType = CONFIG.FollowHiders and "躲藏者" or (IsPlayerSeeker(currentTarget) and "搜寻者" or "躲藏者")
    print("开始依附: " .. currentTarget.Name .. " (" .. targetType .. ") 位置: " .. CONFIG.FollowPosition)        
    followConnection = RunService.Heartbeat:Connect(function()
        if not currentTarget or not currentTarget.Character then
            return
        end
        local targetChar = currentTarget.Character
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetHRP then return end        
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end        
        local offset = getPositionOffset()
        myHRP.CFrame = targetHRP.CFrame * offset
    end)
end
local function stopFollowing()
    if not isFollowing then return end
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
    isFollowing = false
    currentTarget = nil
    print("已停止依附")
end
Wjgjgn:AddToggle('AutoFollow', {
    Text = '自动依附',
    Default = false,
    Tooltip = '开启后自动依附目标',
    Callback = function(Value)
        if Value then
            startFollowing()
        else
            stopFollowing()
        end
    end
})
Wjgjgn:AddDropdown('FollowPosition', {
    Values = {'前面', '后面', '头顶', '下面', '左面', '右面'},
    Default = 2,
    Multi = false,
    Text = '依附位置',
    Tooltip = '选择依附在目标的哪个方向',
    Callback = function(Value)
        CONFIG.FollowPosition = Value
        if isFollowing then
            print("依附位置已切换至: " .. Value)
        end
    end
})
Wjgjgn:AddSlider('FollowDistance', {
    Text = '依附距离',
    Default = 3,
    Min = 1,
    Max = 10,
    Increment = 0.5,
    Tooltip = '与目标的距离（越近越贴身）',
    Callback = function(Value)
        CONFIG.FollowDistance = Value
    end
})
RightGroup:AddButton({
    Text = "Dex工具",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/Dex-Explorer-TX-Fixed.lua"))()
    end
})
RightGroup:AddButton({Text="加载AX汉化",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fningna51-stack/-/main/%E6%96%B0AX%E6%B1%89%E5%8C%96%E5%BA%93"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RightGroup:AddButton({Text="柳叶碰飞(墨水可以使用)",Func=function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local Enabled = false
local targetPlayer = nil
local originalCFrame = nil

local function findPlayer(text)
    text = text:lower()
    for _, plr in pairs(Players:GetPlayers()) do
        if string.find(plr.Name:lower(), text) or string.find(plr.DisplayName:lower(), text) then
            return plr
        end
    end
end

lp.Chatted:Connect(function(msg)
    if not Enabled then return end
    if msg:sub(1,6):lower() == ";kill " then
        local name = msg:sub(7)
        local plr = findPlayer(name)
        if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            targetPlayer = plr
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                originalCFrame = lp.Character.HumanoidRootPart.CFrame
            end
            if statusLabel then
                statusLabel.Text = "已锁定 " .. plr.Name
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if not Enabled then continue end
        if not targetPlayer then continue end

        local char = targetPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then
            targetPlayer = nil
            if statusLabel then statusLabel.Text = "开启 (未锁定)" end
            continue
        end

        local hum = char.Humanoid
        if hum.Health <= 0 then
            targetPlayer = nil
            if statusLabel then statusLabel.Text = "开启 (未锁定)" end
            continue
        end

        local myChar = lp.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetHRP = char:FindFirstChild("HumanoidRootPart")

        if myHRP and targetHRP then
            local offset = targetHRP.Velocity.Magnitude < 0.1 and 0 or 7
            local goal = targetHRP.CFrame * CFrame.new(0,0,-offset) * CFrame.Angles(0, math.rad(-3), 0)
            myHRP.CFrame = myHRP.CFrame:Lerp(goal, 0.4)
            myHRP.Velocity = Vector3.new(0,0,0)
            myHRP.RotVelocity = Vector3.new(0,0,0)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not Enabled then continue end
        local hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if hum then
            hum:Move(Vector3.one * 1e31)
        end
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyOffGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = lp:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 130)
mainFrame.Position = UDim2.new(0.5, -110, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BackgroundTransparency = 0.25
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 1
stroke.Transparency = 0.8
stroke.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.BackgroundTransparency = 1
title.Text = "碰飞(碰到人就让对面甩飞)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 160, 0, 32)
toggleBtn.Position = UDim2.new(0.5, -80, 0, 38)
toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleBtn.Text = "开启碰飞"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamSemibold
toggleBtn.TextSize = 12
toggleBtn.Parent = mainFrame
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleBtn

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 78)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "状态: 关闭"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 80, 0, 24)
closeBtn.Position = UDim2.new(0.5, -40, 0, 102)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "关闭甩飞脚本(关了需要重新加载)"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamSemibold
closeBtn.TextSize = 10
closeBtn.Parent = mainFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

toggleBtn.MouseButton1Click:Connect(function()
    Enabled = not Enabled
    if Enabled then
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        toggleBtn.Text = "关闭碰飞"
        statusLabel.Text = "开启"
        targetPlayer = nil
    else
        toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        toggleBtn.Text = "开启碰飞"
        statusLabel.Text = "状态: 关闭"
        targetPlayer = nil
        originalCFrame = nil
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    Enabled = false
    targetPlayer = nil
    originalCFrame = nil
    screenGui:Destroy()
end)

Enabled = false
targetPlayer = nil

print("😝😝😝")
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RightGroup:AddButton({Text="TX全自动翻译",Func=function()
        TX = "TX Script"
Script = "全自动翻译"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/Auto-language"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RightGroup:AddButton({Text="TX死铁轨全自动刷债券",Func=function()
        TX = "TX Script"
Script = "TX自动刷债券V4"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/Auto-Bond-V4"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RightGroup:AddButton({Text="SX翻译",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SQ182/y/refs/heads/main/翻译.lua"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RightGroup:AddButton({Text="音乐播放器脚本",Func=function()
        loadstring(game:HttpGet("http://music.567099.xyz/music.php"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RightGroup:AddButton({Text="秋辞音乐播放器（绕过反作弊墨水可用）",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fningna51-stack/-/main/AF%20%E9%9F%B3%E4%B9%90%E8%84%9A%E6%9C%AC"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Ksqcnbcos:AddButton({Text="下面不好用，用这个透视",Func=function()
        loadstring(game:HttpGet("https://vss.pandauth.com/kv/5fce9c01afe67a71"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Ksqcnbcos:AddToggle('ESPToggle', {
    Text = '方框透视',
    Default = false,
    Tooltip = '显示玩家方框 ESP',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        if Value then
            if getgenv().cyberline_esp_boxes then
                for _, v in pairs(getgenv().cyberline_esp_boxes) do
                    pcall(function() v.box:Remove() end)
                    pcall(function() v.outline:Remove() end)
                end
            end
            getgenv().cyberline_esp_boxes = {}

            local function create_box()
                local outline = Drawing.new("Square")
                outline.Color = Color3.new(0, 0, 0)
                outline.Thickness = 1
                outline.Filled = false
                outline.Visible = false

                local box = Drawing.new("Square")
                box.Color = Color3.fromRGB(255, 255, 255)
                box.Thickness = 1
                box.Filled = false
                box.Visible = false

                return { box = box, outline = outline }
            end

            local function get_bounds(char)
                local min = Vector3.new(1e9, 1e9, 1e9)
                local max = Vector3.new(-1e9, -1e9, -1e9)
                for _, p in char:GetDescendants() do
                    if p:IsA("BasePart") then
                        local pos = p.Position
                        min = Vector3.new(
                            math.min(min.X, pos.X),
                            math.min(min.Y, pos.Y),
                            math.min(min.Z, pos.Z)
                        )
                        max = Vector3.new(
                            math.max(max.X, pos.X),
                            math.max(max.Y, pos.Y),
                            math.max(max.Z, pos.Z)
                        )
                    end
                end
                return min, max
            end

            getgenv().cyberline_esp_conn = RunService.RenderStepped:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer
                        and plr.Character
                        and plr.Character:FindFirstChild("HumanoidRootPart") then

                        local min, max = get_bounds(plr.Character)
                        local points = {
                            Vector3.new(min.X, min.Y, min.Z),
                            Vector3.new(min.X, max.Y, min.Z),
                            Vector3.new(max.X, min.Y, min.Z),
                            Vector3.new(max.X, max.Y, min.Z),
                            Vector3.new(min.X, min.Y, max.Z),
                            Vector3.new(min.X, max.Y, max.Z),
                            Vector3.new(max.X, min.Y, max.Z),
                            Vector3.new(max.X, max.Y, max.Z),
                        }

                        local min2d = Vector2.new(1e9, 1e9)
                        local max2d = Vector2.new(-1e9, -1e9)
                        local visible = false

                        for _, pt in ipairs(points) do
                            local screen, onScreen = Camera:WorldToViewportPoint(pt)
                            if onScreen then
                                visible = true
                                min2d = Vector2.new(
                                    math.min(min2d.X, screen.X),
                                    math.min(min2d.Y, screen.Y)
                                )
                                max2d = Vector2.new(
                                    math.max(max2d.X, screen.X),
                                    math.max(max2d.Y, screen.Y)
                                )
                            end
                        end

                        if not getgenv().cyberline_esp_boxes[plr] then
                            getgenv().cyberline_esp_boxes[plr] = create_box()
                        end

                        local b = getgenv().cyberline_esp_boxes[plr]
                        if visible then
                            local size = max2d - min2d
                            b.box.Position = min2d
                            b.box.Size = size
                            b.box.Visible = true

                            b.outline.Position = min2d - Vector2.new(1, 1)
                            b.outline.Size = size + Vector2.new(2, 2)
                            b.outline.Visible = true
                        else
                            b.box.Visible = false
                            b.outline.Visible = false
                        end
                    end
                end
            end)

            Library:Notify("方框透视 已开启", 2)
        else
            if getgenv().cyberline_esp_conn then
                getgenv().cyberline_esp_conn:Disconnect()
            end
            if getgenv().cyberline_esp_boxes then
                for _, v in pairs(getgenv().cyberline_esp_boxes) do
                    pcall(function() v.box:Remove() end)
                    pcall(function() v.outline:Remove() end)
                end
            end
            getgenv().cyberline_esp_boxes = nil
            Library:Notify("方框透视 已关闭", 2)
        end
    end
})
getgenv().cyberline_chams = {}
getgenv().cyberline_chams_conn = nil
getgenv().cyberline_chams_color = Color3.fromRGB(255, 255, 255)

Ksqcnbcos:AddToggle('ChamsToggle', {
    Text = '人物透视',
    Default = false,
    Tooltip = '显示玩家模型高亮透视',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer

        if Value then
            if getgenv().cyberline_chams then
                for _, hl in pairs(getgenv().cyberline_chams) do
                    pcall(function() hl:Destroy() end)
                end
            end
            getgenv().cyberline_chams = {}

            getgenv().cyberline_chams_conn = RunService.RenderStepped:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer
                        and plr.Character
                        and not getgenv().cyberline_chams[plr] then

                        local highlight = Instance.new("Highlight")
                        highlight.Name = "CyberlineChams"
                        highlight.FillColor = getgenv().cyberline_chams_color
                        highlight.OutlineColor = Color3.new(0, 0, 0)
                        highlight.FillTransparency = 0.8
                        highlight.OutlineTransparency = 1
                        highlight.Adornee = plr.Character
                        highlight.Parent = game.CoreGui

                        getgenv().cyberline_chams[plr] = highlight
                    end
                end
            end)

            Library:Notify("人物透视 已开启", 2)
        else
            if getgenv().cyberline_chams_conn then
                getgenv().cyberline_chams_conn:Disconnect()
            end
            if getgenv().cyberline_chams then
                for _, hl in pairs(getgenv().cyberline_chams) do
                    pcall(function() hl:Destroy() end)
                end
            end
            getgenv().cyberline_chams = nil
            Library:Notify("人物透视 已关闭", 2)
        end
    end
}):AddColorPicker('ChamsColorPicker', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = '透视颜色',
    Transparency = 0,
    Callback = function(Value)
        getgenv().cyberline_chams_color = Value

        if getgenv().cyberline_chams then
            for _, hl in pairs(getgenv().cyberline_chams) do
                if hl and hl:IsA("Highlight") then
                    hl.FillColor = Value
                end
            end
        end
    end
})
Ksqcnbcos:AddToggle('NameESPToggle', {
    Text = '名字透视',
    Default = false,
    Tooltip = '显示玩家头顶名字',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        if Value then
            if getgenv().cyberline_name_esp then
                for _, txt in pairs(getgenv().cyberline_name_esp) do
                    pcall(function() txt:Remove() end)
                end
            end
            getgenv().cyberline_name_esp = {}

            local function create_name_label()
                local text = Drawing.new("Text")
                text.Size = 12
                text.Center = true
                text.Outline = true
                text.Font = 2 -- Inconsolata
                text.Color = Color3.fromRGB(255, 255, 255)
                text.Visible = false
                return text
            end

            getgenv().cyberline_name_esp_conn = RunService.RenderStepped:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer
                        and plr.Character
                        and plr.Character:FindFirstChild("Head") then

                        local head = plr.Character.Head
                        local screenPos, onScreen =
                            Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.8, 0))

                        if not getgenv().cyberline_name_esp[plr] then
                            getgenv().cyberline_name_esp[plr] = create_name_label()
                        end

                        local text = getgenv().cyberline_name_esp[plr]

                        if onScreen then
                            text.Position = Vector2.new(screenPos.X, screenPos.Y)
                            text.Text = plr.Name
                            text.Visible = true
                        else
                            text.Visible = false
                        end
                    elseif getgenv().cyberline_name_esp[plr] then
                        getgenv().cyberline_name_esp[plr].Visible = false
                    end
                end
            end)

            Library:Notify("名字透视 已开启", 2)
        else
            if getgenv().cyberline_name_esp_conn then
                getgenv().cyberline_name_esp_conn:Disconnect()
            end
            if getgenv().cyberline_name_esp then
                for _, txt in pairs(getgenv().cyberline_name_esp) do
                    pcall(function() txt:Remove() end)
                end
            end
            getgenv().cyberline_name_esp = nil
            Library:Notify("名字透视 已关闭", 2)
        end
    end
})
Ksqcnbcos:AddToggle('HealthBarToggle', {
    Text = '血量条透视',
    Default = false,
    Tooltip = '显示玩家血量条',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        if Value then
            if getgenv().cyberline_health_bars then
                for _, v in pairs(getgenv().cyberline_health_bars) do
                    pcall(function() v.bar:Remove() end)
                    pcall(function() v.outline:Remove() end)
                end
            end
            getgenv().cyberline_health_bars = {}

            local function create_bar()
                local outline = Drawing.new("Square")
                outline.Color = Color3.new(0, 0, 0)
                outline.Filled = true
                outline.Transparency = 1
                outline.Visible = false

                local bar = Drawing.new("Square")
                bar.Color = Color3.fromRGB(0, 255, 0)
                bar.Filled = true
                bar.Transparency = 1
                bar.Visible = false

                return { bar = bar, outline = outline }
            end

            local function get_bounds(char)
                local min = Vector3.new(1e9, 1e9, 1e9)
                local max = Vector3.new(-1e9, -1e9, -1e9)
                for _, p in char:GetDescendants() do
                    if p:IsA("BasePart") then
                        local pos = p.Position
                        min = Vector3.new(
                            math.min(min.X, pos.X),
                            math.min(min.Y, pos.Y),
                            math.min(min.Z, pos.Z)
                        )
                        max = Vector3.new(
                            math.max(max.X, pos.X),
                            math.max(max.Y, pos.Y),
                            math.max(max.Z, pos.Z)
                        )
                    end
                end
                return min, max
            end

            getgenv().cyberline_health_bar_conn = RunService.RenderStepped:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer
                        and plr.Character
                        and plr.Character:FindFirstChild("HumanoidRootPart") then

                        local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
                        if humanoid then
                            local min, max = get_bounds(plr.Character)
                            local points = {
                                Vector3.new(min.X, min.Y, min.Z),
                                Vector3.new(min.X, max.Y, min.Z),
                                Vector3.new(max.X, min.Y, min.Z),
                                Vector3.new(max.X, max.Y, min.Z),
                                Vector3.new(min.X, min.Y, max.Z),
                                Vector3.new(min.X, max.Y, max.Z),
                                Vector3.new(max.X, min.Y, max.Z),
                                Vector3.new(max.X, max.Y, max.Z),
                            }

                            local min2d = Vector2.new(1e9, 1e9)
                            local max2d = Vector2.new(-1e9, -1e9)
                            local visible = false

                            for _, pt in ipairs(points) do
                                local screen, onScreen = Camera:WorldToViewportPoint(pt)
                                if onScreen then
                                    visible = true
                                    min2d = Vector2.new(
                                        math.min(min2d.X, screen.X),
                                        math.min(min2d.Y, screen.Y)
                                    )
                                    max2d = Vector2.new(
                                        math.max(max2d.X, screen.X),
                                        math.max(max2d.Y, screen.Y)
                                    )
                                end
                            end

                            if not getgenv().cyberline_health_bars[plr] then
                                getgenv().cyberline_health_bars[plr] = create_bar()
                            end

                            local bar = getgenv().cyberline_health_bars[plr].bar
                            local outline = getgenv().cyberline_health_bars[plr].outline

                            if visible then
                                local height = max2d.Y - min2d.Y
                                local ratio = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                                local barHeight = height * ratio

                                bar.Size = Vector2.new(2, barHeight)
                                bar.Position = Vector2.new(min2d.X - 5, max2d.Y - barHeight)
                                bar.Visible = true

                                outline.Size = Vector2.new(4, height + 2)
                                outline.Position = Vector2.new(min2d.X - 6, min2d.Y - 1)
                                outline.Visible = true
                            else
                                bar.Visible = false
                                outline.Visible = false
                            end
                        end
                    elseif getgenv().cyberline_health_bars[plr] then
                        getgenv().cyberline_health_bars[plr].bar.Visible = false
                        getgenv().cyberline_health_bars[plr].outline.Visible = false
                    end
                end
            end)

            Library:Notify("血量条透视 已开启", 2)
        else
            if getgenv().cyberline_health_bar_conn then
                getgenv().cyberline_health_bar_conn:Disconnect()
            end
            if getgenv().cyberline_health_bars then
                for _, v in pairs(getgenv().cyberline_health_bars) do
                    pcall(function() v.bar:Remove() end)
                    pcall(function() v.outline:Remove() end)
                end
            end
            getgenv().cyberline_health_bars = nil
            Library:Notify("血量条透视 已关闭", 2)
        end
    end
})
Ksqcnbcos:AddToggle('SkeletonToggle', {
    Text = '骨骼透视',
    Default = false,
    Tooltip = '显示玩家骨骼线条',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        if Value then
            if getgenv().cyberline_skeleton then
                for _, skel in pairs(getgenv().cyberline_skeleton) do
                    for _, line in pairs(skel) do
                        pcall(function() line:Remove() end)
                    end
                end
            end
            getgenv().cyberline_skeleton = {}

            local function create_line()
                local line = Drawing.new("Line")
                line.Color = Color3.new(1, 1, 1)
                line.Thickness = 1
                line.Transparency = 1
                line.Visible = false
                return line
            end

            local function create_skeleton()
                return {
                    head = create_line(),
                    torso = create_line(),
                    left_arm = create_line(),
                    right_arm = create_line(),
                    left_leg = create_line(),
                    right_leg = create_line()
                }
            end

            getgenv().cyberline_skeleton_conn = RunService.RenderStepped:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local char = plr.Character

                        local parts = {
                            head = char:FindFirstChild("Head"),
                            upper = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"),
                            lower = char:FindFirstChild("LowerTorso") or char:FindFirstChild("HumanoidRootPart"),
                            left_arm = char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm"),
                            right_arm = char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm"),
                            left_leg = char:FindFirstChild("LeftUpperLeg") or char:FindFirstChild("Left Leg"),
                            right_leg = char:FindFirstChild("RightUpperLeg") or char:FindFirstChild("Right Leg"),
                        }

                        if not getgenv().cyberline_skeleton[plr] then
                            getgenv().cyberline_skeleton[plr] = create_skeleton()
                        end

                        local skel = getgenv().cyberline_skeleton[plr]

                        local function to_screen(part)
                            local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                            return Vector2.new(pos.X, pos.Y), onScreen
                        end

                        local allVisible = true
                        for _, part in pairs(parts) do
                            if not part then
                                allVisible = false
                                break
                            end
                        end

                        if allVisible then
                            local head_pos = to_screen(parts.head)
                            local upper_pos = to_screen(parts.upper)
                            local lower_pos = to_screen(parts.lower)
                            local larm_pos = to_screen(parts.left_arm)
                            local rarm_pos = to_screen(parts.right_arm)
                            local lleg_pos = to_screen(parts.left_leg)
                            local rleg_pos = to_screen(parts.right_leg)

                            skel.head.From = head_pos
                            skel.head.To = upper_pos

                            skel.torso.From = upper_pos
                            skel.torso.To = lower_pos

                            skel.left_arm.From = upper_pos
                            skel.left_arm.To = larm_pos

                            skel.right_arm.From = upper_pos
                            skel.right_arm.To = rarm_pos

                            skel.left_leg.From = lower_pos
                            skel.left_leg.To = lleg_pos

                            skel.right_leg.From = lower_pos
                            skel.right_leg.To = rleg_pos

                            for _, line in pairs(skel) do
                                line.Visible = true
                            end
                        else
                            for _, line in pairs(skel) do
                                line.Visible = false
                            end
                        end
                    elseif getgenv().cyberline_skeleton[plr] then
                        for _, line in pairs(getgenv().cyberline_skeleton[plr]) do
                            line.Visible = false
                        end
                    end
                end
            end)

            Library:Notify("骨骼透视 已开启", 2)
        else
            if getgenv().cyberline_skeleton_conn then
                getgenv().cyberline_skeleton_conn:Disconnect()
            end
            if getgenv().cyberline_skeleton then
                for _, skel in pairs(getgenv().cyberline_skeleton) do
                    for _, line in pairs(skel) do
                        pcall(function() line:Remove() end)
                    end
                end
            end
            getgenv().cyberline_skeleton = nil
            Library:Notify("骨骼透视 已关闭", 2)
        end
    end
})
Ksqcnbcos:AddToggle('TracerToggle', {
    Text = '射线透视',
    Default = false,
    Tooltip = '从屏幕顶部指向玩家',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        if Value then
            if getgenv().cyberline_tracers then
                for _, line in pairs(getgenv().cyberline_tracers) do
                    pcall(function() line:Remove() end)
                end
            end
            getgenv().cyberline_tracers = {}

            local function create_tracer()
                local line = Drawing.new("Line")
                line.Color = Color3.fromRGB(255, 255, 255)
                line.Thickness = 1
                line.Transparency = 1
                line.Visible = false
                return line
            end

            getgenv().cyberline_tracer_conn = RunService.RenderStepped:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer
                        and plr.Character
                        and plr.Character:FindFirstChild("HumanoidRootPart") then

                        local root = plr.Character.HumanoidRootPart
                        local screenPos, onScreen =
                            Camera:WorldToViewportPoint(root.Position)

                        if not getgenv().cyberline_tracers[plr] then
                            getgenv().cyberline_tracers[plr] = create_tracer()
                        end

                        local tracer = getgenv().cyberline_tracers[plr]

                        if onScreen then
                            tracer.From = Vector2.new(
                                Camera.ViewportSize.X / 2,
                                0
                            )
                            tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                            tracer.Visible = true
                        else
                            tracer.Visible = false
                        end
                    elseif getgenv().cyberline_tracers[plr] then
                        getgenv().cyberline_tracers[plr].Visible = false
                    end
                end
            end)

            Library:Notify("射线透视 已开启", 2)
        else
            if getgenv().cyberline_tracer_conn then
                getgenv().cyberline_tracer_conn:Disconnect()
            end
            if getgenv().cyberline_tracers then
                for _, line in pairs(getgenv().cyberline_tracers) do
                    pcall(function() line:Remove() end)
                end
            end
            getgenv().cyberline_tracers = nil
            Library:Notify("射线透视 已关闭", 2)
        end
    end
})
Sjgnfh:AddLabel("这些功能均为缝合(除了环绕光环以外)")
Sjgnfh:AddLabel("视觉源码群聊：798869680")
Sjgnfh:AddLabel("作者：妖月季")
Sjgnfh:AddLabel("QQ号：647511412")
Sjgnfh:AddToggle('MyToggle', {
	Text = '残影',
	Default = false,
	Tooltip = '开启后走路有残影无法关闭',
	Callback = function(Value)
		print('[回调] 开关状态改变:', Value)

		if not Value then return end

		local Players = game:GetService("Players")
		local TweenService = game:GetService("TweenService")
		local Debris = game:GetService("Debris")
		local RunService = game:GetService("RunService")

		local localPlayer = Players.LocalPlayer

		local CONFIG = {
			GhostDuration = 0.5,
			GhostColor = Color3.fromRGB(255, 255, 255),
			BodyTransparency = 0.3,
			MinMoveDistance = 1.2,
			GhostScale = 0.9,
			TpWalkSpeed = 5,
		}

		local function createLocalSmoke()
			local attachment = Instance.new("Attachment")
			local emitter = Instance.new("ParticleEmitter")

			emitter.Name = "LocalDissolveSmoke"
			emitter.Texture = "rbxassetid://241901177"
			emitter.Rate = 2
			emitter.Lifetime = NumberRange.new(0.2, CONFIG.GhostDuration)
			emitter.Speed = NumberRange.new(0.1, 0.3)
			emitter.VelocitySpread = 360
			emitter.Size = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.4),
				NumberSequenceKeypoint.new(1, 0.9)
			})
			emitter.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.7),
				NumberSequenceKeypoint.new(1, 1)
			})
			emitter.Color = ColorSequence.new(CONFIG.GhostColor)
			emitter.Parent = attachment

			return attachment
		end

		local smokeTemplate = createLocalSmoke()
		local lastGhostPosition = Vector3.new(0, 0, 0)

		local function createSingleGhost(character)
			if not character then return end

			local rootPart = character:FindFirstChild("HumanoidRootPart")
			if not rootPart then return end

			local ghostModel = Instance.new("Model")
			ghostModel.Name = "MyPerfectGhostInstance"

			local highlight = Instance.new("Highlight")
			highlight.Name = "TrueNeonOutline"
			highlight.FillColor = CONFIG.GhostColor
			highlight.FillTransparency = 0.65
			highlight.OutlineColor = CONFIG.GhostColor
			highlight.OutlineTransparency = 0.3
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Parent = ghostModel

			for _, part in ipairs(character:GetDescendants()) do
				if part:IsA("BasePart")
					and part.Name ~= "HumanoidRootPart"
					and part.Transparency < 0.9 then

					local clonePart = Instance.new("Part")
					clonePart.Size = part.Size * CONFIG.GhostScale
					clonePart.CFrame = part.CFrame
					clonePart.Anchored = true
					clonePart.CanCollide = false
					clonePart.CanTouch = false
					clonePart.CanQuery = false

					if part:IsA("MeshPart") then
						local mesh = Instance.new("SpecialMesh")
						mesh.MeshType = Enum.MeshType.FileMesh
						mesh.MeshId = part.MeshId
						mesh.Scale = Vector3.new(
							CONFIG.GhostScale,
							CONFIG.GhostScale,
							CONFIG.GhostScale
						)
						mesh.Parent = clonePart
					elseif part:FindFirstChildOfClass("SpecialMesh") then
						local meshClone = part:FindFirstChildOfClass("SpecialMesh"):Clone()
						meshClone.Scale *= CONFIG.GhostScale
						meshClone.Parent = clonePart
					end

					clonePart.Material = Enum.Material.Neon
					clonePart.Color = CONFIG.GhostColor
					clonePart.Transparency = CONFIG.BodyTransparency
					clonePart.Parent = ghostModel

					local tween = TweenService:Create(
						clonePart,
						TweenInfo.new(CONFIG.GhostDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Transparency = 1 }
					)
					tween:Play()
				end
			end

			if #ghostModel:GetChildren() > 1 then
				ghostModel.Parent = workspace

				local hlTween = TweenService:Create(
					highlight,
					TweenInfo.new(CONFIG.GhostDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ OutlineTransparency = 1, FillTransparency = 1 }
				)
				hlTween:Play()

				local smokeClone = smokeTemplate:Clone()
				smokeClone.Parent = workspace
				smokeClone.Position = rootPart.Position - Vector3.new(0, 1.8, 0)

				Debris:AddItem(ghostModel, CONFIG.GhostDuration)
				Debris:AddItem(smokeClone, CONFIG.GhostDuration)
			else
				ghostModel:Destroy()
			end
		end

		RunService.RenderStepped:Connect(function()
			pcall(function()
				local character = localPlayer.Character
				if character
					and character:FindFirstChild("Humanoid")
					and character:FindFirstChild("HumanoidRootPart") then

					local humanoid = character.Humanoid
					local rootPart = character.HumanoidRootPart

					if humanoid.MoveDirection.Magnitude > 0 then
						character:TranslateBy(
							humanoid.MoveDirection * CONFIG.TpWalkSpeed / 100
						)

						local currentPosition = rootPart.Position
						local distanceMoved =
							(currentPosition - lastGhostPosition).Magnitude

						if distanceMoved >= CONFIG.MinMoveDistance then
							createSingleGhost(character)
							lastGhostPosition = currentPosition
						end
					end
				end
			end)
		end)
	end
})
Sjgnfh:AddToggle('MyToggle', {
	Text = '3D信息栏',
	Default = false,
	Tooltip = '开启后会出现信息栏',
	Callback = function(Value)
		print('[回调] 开关状态改变:', Value)

		if not Value then return end

		if getgenv().QuantumHUD_Running then
			pcall(function()
				game:GetService("RunService"):UnbindFromRenderStep("Quantum_Stationary_Engine")
				local legacy = game:GetService("Workspace"):FindFirstChild("QUANTUM_STATIONARY_STORAGE")
				if legacy then legacy:Destroy() end
			end)
		end
		getgenv().QuantumHUD_Running = true

		getgenv().LaunchQuantumGraphicsPipeline = function(customConfig)
			customConfig = customConfig or {}

			local QuantumHUD = {}
			QuantumHUD.__index = QuantumHUD

			local Players = game:GetService("Players")
			local Workspace = game:GetService("Workspace")
			local RunService = game:GetService("RunService")
			local Lighting = game:GetService("Lighting")

			function QuantumHUD.new()
				local self = setmetatable({}, QuantumHUD)

				self.Config = {
					MaxHUDs = customConfig.MaxHUDs or 5,
					MaxDistance = customConfig.MaxDistance or 110,
					StorageName = "QUANTUM_STATIONARY_STORAGE",

					BodyReflectance = customConfig.BodyReflectance or 0.15,
					HeadReflectance = customConfig.HeadReflectance or 0.01,
					LightBrightness = customConfig.LightBrightness or 0.45,
					LightRange = customConfig.LightRange or 11.0,
					OutlineTransparency = customConfig.OutlineTransparency or 0.05,

					PinkGlassBg = Color3.fromRGB(255, 230, 238),
					PinkGlassStroke = Color3.fromRGB(255, 230, 238),
					MyCardBg = Color3.fromRGB(45, 15, 22),
					MyCardStroke = Color3.fromRGB(45, 15, 22),

					HealthBarProgressColor = Color3.fromRGB(255, 120, 160),
					HealthBarContainerColor = Color3.fromRGB(255, 255, 255),

					TextHDMain = Color3.fromRGB(255, 255, 255),
					TextHDSub = Color3.fromRGB(255, 190, 210),
					ShadowColor = Color3.fromRGB(20, 5, 10),

					CardSize = Vector3.new(4.6, 1.75, 0.05),
					ShoulderHeight = 1.6,
					EyeSeparation = 4.3,
					ViewAngleThreshold = 0.12,

					BaseStiffness = 18.5,
					FluidDragCoeff = 0.25,
					ParallaxIntensity = 0.35,
					MicroVibeFreq = 8.5
				}

				self.LocalPlayer = Players.LocalPlayer
				self.Slots = {}
				self.IsRunning = false
				self.StorageFolder = nil

				self.MyFluidState = {
					Position = Vector3.new(),
					Velocity = Vector3.new(),
					Rotation = Vector3.new()
				}
				self.SlotFluidStates = {}
				self.GlobalCurrentAlpha = 1.0

				return self
			end

			function QuantumHUD:_updateFluidEngine(state, targetPos, dt)
				local displacement = state.Position - targetPos
				local distance = displacement.Magnitude
				local dynamicDamping = 0.45 + math.clamp(1 / (distance + 0.1), 0, 1.8)

				local springForce = -self.Config.BaseStiffness * displacement
				local baseDampingForce = -dynamicDamping * state.Velocity
				local fluidDragForce = -state.Velocity.Unit * (state.Velocity.Magnitude ^ 2) * self.Config.FluidDragCoeff

				if state.Velocity.Magnitude == 0 then fluidDragForce = Vector3.new() end
				local acceleration = springForce + baseDampingForce + fluidDragForce

				state.Velocity = state.Velocity + acceleration * dt
				state.Position = state.Position + state.Velocity * dt
				return state.Position
			end

			function QuantumHUD:_isTargetVisibleThroughCover(camera, myChar, targetChar, targetRoot)
				if not myChar or not targetChar then return false end

				local raycastParams = RaycastParams.new()
				local ignoreList = {myChar, targetChar}
				if self.StorageFolder then table.insert(ignoreList, self.StorageFolder) end
				raycastParams.FilterDescendantsInstances = ignoreList
				raycastParams.FilterType = Enum.RaycastFilterType.Exclude

				local camPos = camera.CFrame.Position
				local checkPoints = { targetRoot.Position }

				local head = targetChar:FindFirstChild("Head")
				if head then table.insert(checkPoints, head.Position) end

				local leftLeg = targetChar:FindFirstChild("Left Leg") or targetChar:FindFirstChild("LeftLowerLeg")
				if leftLeg then table.insert(checkPoints, leftLeg.Position) end

				local rightLeg = targetChar:FindFirstChild("Right Leg") or targetChar:FindFirstChild("RightLowerLeg")
				if rightLeg then table.insert(checkPoints, rightLeg.Position) end

				for _, point in ipairs(checkPoints) do
					local direction = point - camPos
					local result = Workspace:Raycast(camPos, direction, raycastParams)
					if not result then return true end
				end
				return false
			end

			function QuantumHUD:PurgeLegacyPipelines()
				pcall(function()
					RunService:UnbindFromRenderStep("Quantum_Stationary_Engine")
				end)
				local legacy = Workspace:FindFirstChild(self.Config.StorageName)
				if legacy then
					pcall(function()
						legacy:Destroy()
					end)
					task.wait(0.02)
				end
			end

			function QuantumHUD:_buildGlassContainer(name)
				if not self.StorageFolder then
					self.StorageFolder = Workspace:FindFirstChild(self.Config.StorageName) or Instance.new("Folder")
					self.StorageFolder.Name = self.Config.StorageName
					self.StorageFolder.Parent = Workspace
				end

				local masterPart = Instance.new("Part")
				masterPart.Name = "ST_Master_" .. name
				masterPart.Size = self.Config.CardSize
				masterPart.Transparency = 1
				masterPart.CanCollide = false
				masterPart.CanTouch = false
				masterPart.CanQuery = false
				masterPart.Anchored = true
				masterPart.Parent = self.StorageFolder

				local blurFilter = Instance.new("Part")
				blurFilter.Name = "GlassBlurFilter"
				blurFilter.Size = Vector3.new(self.Config.CardSize.X - 0.02, self.Config.CardSize.Y - 0.02, 0.01)
				blurFilter.Material = Enum.Material.Glass
				blurFilter.Transparency = 1
				blurFilter.Color = self.Config.PinkGlassBg
				blurFilter.CanCollide = false
				blurFilter.CanTouch = false
				blurFilter.CanQuery = false
				blurFilter.Anchored = true
				blurFilter.Parent = masterPart

				return masterPart
			end

			function QuantumHUD:_attachUltraHDCanvas(parentPart, isLocal)
				local sGui = Instance.new("SurfaceGui")
				sGui.Name = "CanvasEngine"
				sGui.Face = Enum.NormalId.Front
				sGui.CanvasSize = Vector2.new(1380, 525)
				sGui.PixelsPerStud = 300
				sGui.AlwaysOnTop = true
				sGui.LightInfluence = 0.0
				sGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				sGui.Enabled = false
				sGui.Parent = parentPart

				local canvas = Instance.new("CanvasGroup")
				canvas.Name = "AlphaGroup"
				canvas.Size = UDim2.new(1, 0, 1, 0)
				canvas.BackgroundColor3 = isLocal and self.Config.MyCardBg or self.Config.PinkGlassBg
				canvas.GroupTransparency = 1
				canvas.BorderSizePixel = 0
				canvas.Parent = sGui
				Instance.new("UICorner", canvas).CornerRadius = UDim.new(0, 42)

				local stroke = Instance.new("UIStroke", canvas)
				stroke.Thickness = 6.5
				stroke.Color = isLocal and self.Config.MyCardStroke or self.Config.PinkGlassStroke

				local avatar = Instance.new("ImageLabel")
				avatar.Name = "UserAvatar"
				avatar.Size = UDim2.new(0, 130, 0, 130)
				avatar.Position = UDim2.new(0, 45, 0.5, -65)
				avatar.BackgroundTransparency = 1
				avatar.Parent = canvas
				Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)

				local avStroke = Instance.new("UIStroke", avatar)
				avStroke.Thickness = 4
				avStroke.Color = stroke.Color

				local function CreateHDText(name, size, pos, color, font)
					local label = Instance.new("TextLabel")
					label.Name = name
					label.Size = UDim2.new(0.75, 0, 0.22, 0)
					label.Position = pos
					label.BackgroundTransparency = 1
					label.TextColor3 = color
					label.TextSize = size
					label.Font = font
					label.TextXAlignment = Enum.TextXAlignment.Left
					label.TextStrokeTransparency = 1

					local shadow = Instance.new("UIStroke", label)
					shadow.Color = self.Config.ShadowColor
					shadow.Thickness = 3.5
					shadow.LineJoinMode = Enum.LineJoinMode.Round
					label.Parent = canvas
					return label
				end

				CreateHDText("TitleLabel", 46, UDim2.new(0, 210, 0.16, 0), self.Config.TextHDMain, Enum.Font.GothamBold)
				CreateHDText("SubTagLabel", 32, UDim2.new(0, 210, 0.46, 0), self.Config.TextHDSub, Enum.Font.GothamBold)
				CreateHDText("StatusLabel", 34, UDim2.new(0, 210, 0.72, 0), self.Config.TextHDMain, Enum.Font.Code)

				if isLocal then
					local coordLabel = CreateHDText("CoordLabel", 28, UDim2.new(0, 210, 0.73, 0), self.Config.TextHDSub, Enum.Font.Code)
					coordLabel.Size = UDim2.new(0.75, 0, 0.18, 0)
					canvas.StatusLabel.Position = UDim2.new(0, 210, 0.56, 0)
					canvas.StatusLabel.TextSize = 30

					local hpContainer = Instance.new("Frame")
					hpContainer.Name = "HPContainer"
					hpContainer.Size = UDim2.new(0, 1120, 0, 14)
					hpContainer.Position = UDim2.new(0, 210, 0.43, 0)
					hpContainer.BackgroundColor3 = self.Config.HealthBarContainerColor
					hpContainer.BorderSizePixel = 0
					hpContainer.Parent = canvas
					Instance.new("UICorner", hpContainer).CornerRadius = UDim.new(0, 7)

					local hpProgress = Instance.new("Frame")
					hpProgress.Name = "HPProgress"
					hpProgress.Size = UDim2.new(1, 0, 1, 0)
					hpProgress.BackgroundColor3 = self.Config.HealthBarProgressColor
					hpProgress.BorderSizePixel = 0
					hpProgress.Parent = hpContainer
					Instance.new("UICorner", hpProgress).CornerRadius = UDim.new(0, 7)
				end

				return canvas
			end

			function QuantumHUD:_calculateCinematicTransform(targetRoot, camera, state, gameTime, deltaTime)
				local camCF = camera.CFrame
				local baseShoulderPos = targetRoot.Position + Vector3.new(0, self.Config.ShoulderHeight, 0)
				local targetWorldPos = baseShoulderPos + (camCF.RightVector * self.Config.EyeSeparation)

				local slowLayer = math.sin(gameTime * 0.95) * math.cos(gameTime * 0.3) * 0.09
				local fastLayer = math.sin(gameTime * self.Config.MicroVibeFreq) * 0.006
				local finalBobY = slowLayer + fastLayer
				local finalBobX = math.cos(gameTime * 1.1) * math.sin(gameTime * 0.4) * 0.06

				targetWorldPos += Vector3.new(finalBobX, finalBobY, finalBobX * 0.3)

				local dt = math.min(deltaTime, 0.03)
				local currentPhysicsPos = self:_updateFluidEngine(state, targetWorldPos, dt)

				local lookAtCF = CFrame.lookAt(currentPhysicsPos, camCF.Position, Vector3.new(0, 1, 0))
				local localTargetVec = camCF:ToObjectSpace(lookAtCF).Position.Unit

				local targetTiltX = -localTargetVec.Y * self.Config.ParallaxIntensity
				local targetTiltY = localTargetVec.X * self.Config.ParallaxIntensity
				state.Rotation = state.Rotation + (Vector3.new(targetTiltX, targetTiltY, 0) - state.Rotation) * 0.15

				return lookAtCF * CFrame.Angles(state.Rotation.X, state.Rotation.Y, math.sin(gameTime * 0.5) * 0.005)
			end

			function QuantumHUD:_evaluateGlobalState(myRoot, myHum, camera)
				if myHum.MoveDirection.Magnitude > 0.01 then
					return 1.0
				end
				local cameraToMeDirection = (camera.CFrame.Position - myRoot.Position).Unit
				local lookDirectionDot = myRoot.CFrame.LookVector:Dot(cameraToMeDirection)
				if lookDirectionDot > self.Config.ViewAngleThreshold then
					return 0.0
				else
					return 1.0
				end
			end

			function QuantumHUD:_launchPipelineLoop()
				RunService:BindToRenderStep("Quantum_Stationary_Engine", Enum.RenderPriority.Camera.Value + 1, function(dt)
					if not self.IsRunning then return end

					local camera = Workspace.CurrentCamera
					local myChar = self.LocalPlayer.Character
					local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
					local myHum = myChar and myChar:FindFirstChild("Humanoid")
					local currentTime = os.clock()

					if not (camera and myRoot and myHum) then return end

					local targetGlobalAlpha = self:_evaluateGlobalState(myRoot, myHum, camera)
					local wasHidden = (self.GlobalCurrentAlpha > 0.95)

					local alphaSpeed = targetGlobalAlpha == 0 and 0.09 or 0.25
					self.GlobalCurrentAlpha = self.GlobalCurrentAlpha + (targetGlobalAlpha - self.GlobalCurrentAlpha) * alphaSpeed

					local isGlobalVisible = self.GlobalCurrentAlpha < 0.95
					local computedBlurTransparency = 0.45 + (self.GlobalCurrentAlpha * 0.55)

					if self.My3DInstance then
						if isGlobalVisible then
							self.My3DInstance.CanvasEngine.Enabled = true
							local alphaGroup = self.My3DInstance.CanvasEngine.AlphaGroup
							alphaGroup.GroupTransparency = self.GlobalCurrentAlpha
							self.My3DInstance.GlassBlurFilter.Transparency = computedBlurTransparency

							local hpRatio = math.clamp(myHum.Health / myHum.MaxHealth, 0, 1)
							alphaGroup.StatusLabel.Text = "💖 状态: " .. tostring(math.floor(hpRatio * 100)) .. "%"
							alphaGroup.HPContainer.HPProgress.Size = UDim2.new(hpRatio, 0, 1, 0)

							local pos = myRoot.Position
							alphaGroup.CoordLabel.Text = string.format(
								"坐标: X:%.1f / Y:%.1f / Z:%.1f",
								pos.X, pos.Y, pos.Z
							)

							if wasHidden then
								local basePos = myRoot.Position + (camera.CFrame.RightVector * self.Config.EyeSeparation)
								self.MyFluidState.Position = basePos
								self.MyFluidState.Velocity = Vector3.new()
								self.MyFluidState.Rotation = Vector3.new()
							end

							local finalCF = self:_calculateCinematicTransform(myRoot, camera, self.MyFluidState, currentTime, dt)
							self.My3DInstance.CFrame = finalCF
							self.My3DInstance.GlassBlurFilter.CFrame = finalCF * CFrame.new(0, 0, -0.01)
						else
							self.My3DInstance.CanvasEngine.Enabled = false
							self.My3DInstance.GlassBlurFilter.Transparency = 1
						end
					end

					local targetPool = {}
					for _, player in pairs(Players:GetPlayers()) do
						if player ~= self.LocalPlayer
							and player.Character
							and player.Character:FindFirstChild("HumanoidRootPart")
							and player.Character:FindFirstChild("Humanoid") then

							local tChar = player.Character
							local tRoot = tChar.HumanoidRootPart
							local tHum = tChar.Humanoid

							if tHum.Health > 0 then
								local _, inViewport = camera:WorldToScreenPoint(tRoot.Position)
								local distance = (myRoot.Position - tRoot.Position).Magnitude

								if inViewport and distance <= self.Config.MaxDistance then
									local isVisible = self:_isTargetVisibleThroughCover(camera, myChar, tChar, tRoot)
									if isVisible then
										table.insert(targetPool, {
											player = player,
											root = tRoot,
											hum = tHum,
											dist = distance,
											char = tChar
										})
									end
								end
							end
						end
					end

					table.sort(targetPool, function(a, b)
						return a.dist < b.dist
					end)

					for i = 1, self.Config.MaxHUDs do
						local slot = self.Slots[i]
						local data = targetPool[i]

						if data and isGlobalVisible then
							slot.Part.CanvasEngine.Enabled = true
							local alphaGroup = slot.Part.CanvasEngine.AlphaGroup
							alphaGroup.GroupTransparency = self.GlobalCurrentAlpha
							slot.Part.GlassBlurFilter.Transparency = computedBlurTransparency

							if wasHidden
								or not self.SlotFluidStates[i]
								or slot.LastTarget ~= data.player then

								local basePos = data.root.Position + (camera.CFrame.RightVector * self.Config.EyeSeparation)
								self.SlotFluidStates[i] = {
									Position = basePos,
									Velocity = Vector3.new(),
									Rotation = Vector3.new()
								}
							end

							local finalCF = self:_calculateCinematicTransform(
								data.root,
								camera,
								self.SlotFluidStates[i],
								currentTime,
								dt
							)

							slot.Part.CFrame = finalCF
							slot.Part.GlassBlurFilter.CFrame = finalCF * CFrame.new(0, 0, -0.01)

							if slot.LastTarget ~= data.player then
								slot.LastTarget = data.player
								alphaGroup.TitleLabel.Text = data.player.DisplayName

								local avatarUrl = "rbxthumb://type=AvatarHeadShot&id="
									.. tostring(data.player.UserId)
									.. "&w=150&h=150"

								if alphaGroup.UserAvatar.Image ~= avatarUrl then
									alphaGroup.UserAvatar.Image = avatarUrl
								end

								local tool = data.char:FindFirstChildOfClass("Tool")
								alphaGroup.SubTagLabel.Text = tool and ("🌸 " .. tool.Name) or "[ UNARMED ]"
							end

							alphaGroup.StatusLabel.Text =
								"💢 HP: "
								.. tostring(math.floor(data.hum.Health))
								.. " / "
								.. tostring(data.hum.MaxHealth)
						else
							if slot.Part then
								slot.Part.CanvasEngine.Enabled = false
								slot.Part.GlassBlurFilter.Transparency = 1
							end
							if not data then
								slot.LastTarget = nil
								self.SlotFluidStates[i] = nil
							end
						end
					end
				end)
			end

			function QuantumHUD:_applyVisualEnhancements(character)
				if not character then return end

				for _, item in ipairs(character:GetDescendants()) do
					if item.Name == "Quantum_Self_Highlight" or item.Name == "Quantum_Self_PointLight" then
						item:Destroy()
					end
				end

				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("MeshPart") or part:IsA("BasePart") then
						if part:IsA("MeshPart") then
							part.RenderFidelity = Enum.RenderFidelity.Precise
						end
						part.CastShadow = true

						pcall(function()
							if part.Material == Enum.Material.Plastic then
								part.Material = Enum.Material.SmoothPlastic
							end

							if part.Name == "Head" or part.Name == "Face" or part.Name:find("Face") then
								part.Reflectance = self.Config.HeadReflectance
							else
								part.Reflectance = self.Config.BodyReflectance
							end
						end)
					end
				end

				local lowerTorso = character:FindFirstChild("LowerTorso") or character:FindFirstChild("Torso")
				if lowerTorso then
					local light = Instance.new("PointLight")
					light.Name = "Quantum_Self_PointLight"
					light.Color = Color3.fromRGB(255, 245, 250)
					light.Brightness = self.Config.LightBrightness
					light.Range = self.Config.LightRange
					light.Shadows = true
					light.Parent = lowerTorso
				end

				local highlight = Instance.new("Highlight")
				highlight.Name = "Quantum_Self_Highlight"
				highlight.FillColor = Color3.fromRGB(255, 255, 255)
				highlight.FillTransparency = 1.0
				highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
				highlight.OutlineTransparency = self.Config.OutlineTransparency
				highlight.Adornee = character
				highlight.Parent = character
			end

			function QuantumHUD:_maximizeMobileGraphicsPipeline()
				pcall(function()
					settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
					Lighting.Technology = Enum.Technology.Future
					Lighting.ShadowMapEnabled = true
					Lighting.GlobalShadows = true
					Lighting.EnvironmentDiffuseScale = 1.0
					Lighting.EnvironmentSpecularScale = 1.0
					Lighting.Ambient = Color3.fromRGB(35, 32, 38)
					Lighting.OutdoorAmbient = Color3.fromRGB(45, 42, 50)
				end)

				for _, fx in ipairs(Lighting:GetChildren()) do
					if fx.Name:find("QuantumFX_") then
						fx:Destroy()
					end
				end

				local colorCorrection = Instance.new("ColorCorrectionEffect")
				colorCorrection.Name = "QuantumFX_ColorMax"
				colorCorrection.Brightness = 0.02
				colorCorrection.Contrast = 0.20
				colorCorrection.Saturation = 0.16
				colorCorrection.TintColor = Color3.fromRGB(255, 252, 248)
				colorCorrection.Parent = Lighting

				local bloom = Instance.new("BloomEffect")
				bloom.Name = "QuantumFX_BloomMax"
				bloom.Intensity = 0.95
				bloom.Size = 32
				bloom.Threshold = 0.80
				bloom.Parent = Lighting

				local sunRays = Instance.new("SunRaysEffect")
				sunRays.Name = "QuantumFX_SunRaysMax"
				sunRays.Intensity = 0.40
				sunRays.Spread = 0.92
				sunRays.Parent = Lighting

				local blur = Instance.new("BlurEffect")
				blur.Name = "QuantumFX_MotionBlurMax"
				blur.Size = 2.6
				blur.Parent = Lighting

				task.spawn(function()
					for _, desc in ipairs(Workspace:GetDescendants()) do
						if desc:IsA("BasePart")
							and not desc:IsDescendantOf(Players.LocalPlayer.Character) then

							pcall(function()
								if desc.Material == Enum.Material.Plastic then
									desc.Material = Enum.Material.SmoothPlastic
								end
								if desc.Reflectance < 0.05 then
									desc.Reflectance = 0.06
								end
							end)
						end
					end
				end)
			end

			function QuantumHUD:Start()
				self:PurgeLegacyPipelines()
				self.IsRunning = true

				self:_maximizeMobileGraphicsPipeline()

				self.My3DInstance = self:_buildGlassContainer("LocalPlayer")
				local myCanvas = self:_attachUltraHDCanvas(self.My3DInstance, true)
				myCanvas.TitleLabel.Text = "👑 " .. self.LocalPlayer.DisplayName
				myCanvas.SubTagLabel.Text = "🌸如果没人爱着你，还有开发者爱着你(=^▽^=)"
				myCanvas.UserAvatar.Image =
					"rbxthumb://type=AvatarHeadShot&id="
					.. tostring(self.LocalPlayer.UserId)
					.. "&w=150&h=150"

				if self.LocalPlayer.Character then
					self:_applyVisualEnhancements(self.LocalPlayer.Character)
				end

				self.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
					self:_applyVisualEnhancements(newCharacter)
				end)

				for i = 1, self.Config.MaxHUDs do
					local part = self:_buildGlassContainer("Slot_" .. i)
					local canvas = self:_attachUltraHDCanvas(part, false)
					self.Slots[i] = {
						Part = part,
						Canvas = canvas,
						LastTarget = nil
					}
				end

				self:_launchPipelineLoop()
			end

			local RunInstance = QuantumHUD.new()
			RunInstance:Start()
		end

		LaunchQuantumGraphicsPipeline({
			MaxHUDs = 5,
			MaxDistance = 110,
			BodyReflectance = 0.15,
			HeadReflectance = 0.01,
			LightBrightness = 0.45,
			LightRange = 11.0,
			OutlineTransparency = 0.05
		})
	end
})
Sjgnfh:AddToggle('MyToggle', {
	Text = '2D信息栏',
	Default = false,
	Tooltip = '开启后无法关闭哦🤔',
	Callback = function(Value)
		print('[回调] 开关状态改变:', Value)

		if not Value then return end

		local TweenService = game:GetService("TweenService")
		local Players = game:GetService("Players")
		local CoreGui = game:GetService("CoreGui")
		local Workspace = game:GetService("Workspace")

		local localPlayer = Players.LocalPlayer

		local Config = {
			MaxHUDs = 4,
			MaxDistance = 90,
			HysteresisBuffer = 10,
			MySnowCount = 20,
			DevUsername = "此处填写你的名字",

			BgColor = Color3.fromRGB(255, 255, 255),
			BgTransparency = 0.15,
			TextMain = Color3.fromRGB(30, 30, 35),
			TextSub = Color3.fromRGB(115, 120, 130),
			ActiveColor = Color3.fromRGB(25, 25, 30),
			StrokeColor = Color3.fromRGB(255, 255, 255),

			MyCardBg = Color3.fromRGB(10, 10, 18),
			MyCardStroke = Color3.fromRGB(180, 220, 255),
			DevCardBg = Color3.fromRGB(25, 10, 15),
			DevCardStroke = Color3.fromRGB(255, 100, 150),

			ShoulderSwitch = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		}

		_G.HUDFeatureStates = {
			ShowSelfHUD = true,
			ShowOthersHUD = true
		}

		local Slots = {}

		local function getAbsoluteAvatar(userId)
			return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(userId or 0) .. "&w=150&h=150"
		end

		local function isDeveloper(username)
			return string.lower(username) == string.lower(Config.DevUsername)
		end

		local function getOptimalShoulderOffset(character, camera)
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if not hrp then return Vector3.new(2.8, 1.2, -0.6), "Right" end
			local rightVec = hrp.CFrame.RightVector
			local leftPos = hrp.Position - (rightVec * 2.2)
			local rightPos = hrp.Position + (rightVec * 2.2)
			local camPos = camera.CFrame.Position

			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			rayParams.FilterDescendantsInstances = {character, localPlayer.Character}

			local rayLeft = Workspace:Raycast(leftPos, camPos - leftPos, rayParams)
			local rayRight = Workspace:Raycast(rightPos, camPos - rightPos, rayParams)

			if rayRight and not rayLeft then
				return Vector3.new(-2.8, 1.2, -0.6), "Left"
			elseif rayLeft and not rayRight then
				return Vector3.new(2.8, 1.2, -0.6), "Right"
			else
				return Vector3.new(2.8, 1.2, -0.6), "Right"
			end
		end

		local function isObstructedFromCamera(camera, targetRoot)
			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			local allCharacters = {}
			for _, p in pairs(Players:GetPlayers()) do
				if p.Character then table.insert(allCharacters, p.Character) end
			end
			rayParams.FilterDescendantsInstances = allCharacters

			local hitResult = Workspace:Raycast(camera.CFrame.Position, targetRoot.Position - camera.CFrame.Position, rayParams)
			if hitResult and hitResult.Instance and (hitResult.Instance.CanCollide or hitResult.Instance:IsA("Terrain")) then
				return true
			end
			return false
		end

		local function createPersonal3DHUD()
			local my3DHUD = Instance.new("BillboardGui")
			my3DHUD.Name = "MyPersonal3DHUD"
			my3DHUD.Size = UDim2.new(3.5, 0, 1.4, 0)
			my3DHUD.AlwaysOnTop = true
			my3DHUD.ResetOnSpawn = false
			my3DHUD.Enabled = false
			my3DHUD.Parent = CoreGui

			local myFrame = Instance.new("CanvasGroup")
			myFrame.Name = "HUDFrame"
			myFrame.Size = UDim2.new(1, 0, 1, 0)
			myFrame.BorderSizePixel = 0
			myFrame.Parent = my3DHUD
			Instance.new("UICorner", myFrame).CornerRadius = UDim.new(0, 8)

			local myStroke = Instance.new("UIStroke", myFrame)
			myStroke.Thickness = 1.2
			myStroke.Transparency = 0.3

			if isDeveloper(localPlayer.Name) then
				myFrame.BackgroundColor3 = Config.DevCardBg
				myStroke.Color = Config.DevCardStroke
			else
				myFrame.BackgroundColor3 = Config.MyCardBg
				myStroke.Color = Config.MyCardStroke
			end

			local mySnowContainer = Instance.new("Frame")
			mySnowContainer.Size = UDim2.new(1, 0, 1, 0)
			mySnowContainer.BackgroundTransparency = 1
			mySnowContainer.ClipsDescendants = true
			mySnowContainer.Parent = myFrame

			for i = 1, Config.MySnowCount do
				local flake = Instance.new("Frame")
				flake.Size = UDim2.new(0, 4, 0, 4)
				flake.Position = UDim2.new(math.random(), 0, math.random(), 0)
				flake.BackgroundColor3 = Color3.fromRGB(240, 250, 255)
				flake.BackgroundTransparency = math.random(3, 7) * 0.1
				flake.Parent = mySnowContainer
				Instance.new("UICorner", flake).CornerRadius = UDim.new(1, 0)

				local speed = math.random(5, 10) * 0.003
				task.spawn(function()
					while flake and flake.Parent do
						flake.Position = UDim2.new(flake.Position.X.Scale, 0, flake.Position.Y.Scale + speed, 0)
						if flake.Position.Y.Scale > 1 then
							flake.Position = UDim2.new(math.random(), 0, -0.05, 0)
						end
						task.wait(0.03)
					end
				end)
			end

			local myAvatarImage = Instance.new("ImageLabel")
			myAvatarImage.Name = "AvatarImage"
			myAvatarImage.Size = UDim2.new(0.22, 0, 0.65, 0)
			myAvatarImage.Position = UDim2.new(0, 8, 0.175, 0)
			myAvatarImage.BackgroundTransparency = 1
			myAvatarImage.Image = getAbsoluteAvatar(localPlayer.UserId)
			myAvatarImage.Parent = myFrame
			Instance.new("UICorner", myAvatarImage).CornerRadius = UDim.new(1, 0)

			local myAvStroke = Instance.new("UIStroke", myAvatarImage)
			myAvStroke.Thickness = 1
			myAvStroke.Color = isDeveloper(localPlayer.Name) and Config.DevCardStroke or Config.MyCardStroke
			myAvStroke.Transparency = 0.4

			local myNameLabel = Instance.new("TextLabel")
			myNameLabel.Size = UDim2.new(0.72, -12, 0.26, 0)
			myNameLabel.Position = UDim2.new(0.26, 6, 0.12, 0)
			myNameLabel.BackgroundTransparency = 1
			myNameLabel.Text = (isDeveloper(localPlayer.Name) and "🛠️ " or "👑 ") .. localPlayer.DisplayName
			myNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			myNameLabel.TextScaled = true
			myNameLabel.Font = Enum.Font.GothamBold
			myNameLabel.TextXAlignment = Enum.TextXAlignment.Left
			myNameLabel.Parent = myFrame

			local myTagLabel = Instance.new("TextLabel")
			myTagLabel.Size = UDim2.new(0.72, -12, 0.18, 0)
			myTagLabel.Position = UDim2.new(0.26, 6, 0.45, 0)
			myTagLabel.BackgroundTransparency = 1
			myTagLabel.Text = isDeveloper(localPlayer.Name) and "🔥 FOUNDER / DEVELOPER" or "✨ TACTICAL LIGHTING"
			myTagLabel.TextColor3 = isDeveloper(localPlayer.Name) and Color3.fromRGB(255, 120, 150) or Color3.fromRGB(160, 210, 255)
			myTagLabel.TextScaled = true
			myTagLabel.Font = Enum.Font.GothamBold
			myTagLabel.TextXAlignment = Enum.TextXAlignment.Left
			myTagLabel.Parent = myFrame

			local myStatusLabel = Instance.new("TextLabel")
			myStatusLabel.Size = UDim2.new(0.72, -12, 0.16, 0)
			myStatusLabel.Position = UDim2.new(0.26, 6, 0.72, 0)
			myStatusLabel.BackgroundTransparency = 1
			myStatusLabel.Text = "❤️ HEALTH: --%"
			myStatusLabel.TextColor3 = Color3.fromRGB(255, 110, 110)
			myStatusLabel.TextScaled = true
			myStatusLabel.Font = Enum.Font.Code
			myStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
			myStatusLabel.Parent = myFrame

			return my3DHUD, myStatusLabel
		end

		local function buildOthersHUDInstancePool()
			for i = 1, Config.MaxHUDs do
				local bGui = Instance.new("BillboardGui")
				bGui.Name = "SlotHUD_" .. i
				bGui.Size = UDim2.new(3.2, 0, 1.2, 0)
				bGui.AlwaysOnTop = true
				bGui.MaxDistance = Config.MaxDistance + Config.HysteresisBuffer
				bGui.Enabled = false
				bGui.Parent = CoreGui

				local frame = Instance.new("CanvasGroup")
				frame.Name = "HUDFrame"
				frame.Size = UDim2.new(1, 0, 1, 0)
				frame.BorderSizePixel = 0
				frame.Parent = bGui
				Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

				local slotStroke = Instance.new("UIStroke", frame)
				slotStroke.Thickness = 1

				local playerAvatar = Instance.new("ImageLabel")
				playerAvatar.Name = "PlayerAvatar"
				playerAvatar.Size = UDim2.new(0.2, 0, 0.6, 0)
				playerAvatar.Position = UDim2.new(0, 6, 0.2, 0)
				playerAvatar.BackgroundTransparency = 1
				playerAvatar.Parent = frame
				Instance.new("UICorner", playerAvatar).CornerRadius = UDim.new(1, 0)

				local paStroke = Instance.new("UIStroke", playerAvatar)
				paStroke.Thickness = 1
				paStroke.Transparency = 0.4

				local nameLabel = Instance.new("TextLabel")
				nameLabel.Name = "NameLabel"
				nameLabel.Size = UDim2.new(0.76, -10, 0.24, 0)
				nameLabel.Position = UDim2.new(0.24, 6, 0.1, 0)
				nameLabel.BackgroundTransparency = 1
				nameLabel.TextScaled = true
				nameLabel.Font = Enum.Font.GothamBold
				nameLabel.TextXAlignment = Enum.TextXAlignment.Left
				nameLabel.Parent = frame

				local healthBg = Instance.new("Frame")
				healthBg.Name = "HealthBg"
				healthBg.Size = UDim2.new(0.76, -10, 0.06, 0)
				healthBg.Position = UDim2.new(0.24, 6, 0.42, 0)
				healthBg.BackgroundTransparency = 0.88
				healthBg.Parent = frame

				local healthBar = Instance.new("Frame")
				healthBar.Name = "Bar"
				healthBar.Size = UDim2.new(1, 0, 1, 0)
				healthBar.BorderSizePixel = 0
				healthBar.Parent = healthBg

				local inventoryLabel = Instance.new("TextLabel")
				inventoryLabel.Name = "InventoryLabel"
				inventoryLabel.Size = UDim2.new(0.76, -10, 0.32, 0)
				inventoryLabel.Position = UDim2.new(0.24, 6, 0.58, 0)
				inventoryLabel.BackgroundTransparency = 1
				inventoryLabel.TextScaled = true
				inventoryLabel.Font = Enum.Font.Gotham
				inventoryLabel.TextXAlignment = Enum.TextXAlignment.Left
				inventoryLabel.Parent = frame

				Slots[i] = {
					Gui = bGui,
					Frame = frame,
					Stroke = slotStroke,
					PaStroke = paStroke,
					CurrentSide = nil,
					LastTarget = nil
				}
			end
		end

		local function startHUDHeartbeat(my3DHUD, myStatusLabel)
			task.spawn(function()
				local myCurrentSide = nil

				while task.wait(0.05) do
					local camera = Workspace.CurrentCamera
					local myChar = localPlayer.Character
					local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
					local myHum = myChar and myChar:FindFirstChild("Humanoid")

					if camera and myRoot and myHum then
						local camPosition = camera.CFrame.Position

						local _, myInViewport = camera:WorldToScreenPoint(myRoot.Position)
						local myValid =
							_G.HUDFeatureStates.ShowSelfHUD
							and myInViewport
							and (camPosition - myRoot.Position).Magnitude <= (Config.MaxDistance + Config.HysteresisBuffer)
							and not isObstructedFromCamera(camera, myRoot)

						if myValid then
							my3DHUD.Adornee = myRoot
							my3DHUD.Enabled = true
							myStatusLabel.Text = "❤️ HEALTH: "
								.. tostring(math.clamp(math.floor((myHum.Health / myHum.MaxHealth) * 100), 0, 100))
								.. "%"

							local targetOffset, side = getOptimalShoulderOffset(myChar, camera)
							if myCurrentSide ~= side then
								myCurrentSide = side
								TweenService:Create(my3DHUD, Config.ShoulderSwitch, { StudsOffsetWorldSpace = targetOffset }):Play()
							end
						else
							my3DHUD.Enabled = false
						end

						local validTargets = {}
						local currentMappedSlots = {}
						for i = 1, Config.MaxHUDs do
							if Slots[i].LastTarget then
								currentMappedSlots[Slots[i].LastTarget] = i
							end
						end

						if _G.HUDFeatureStates.ShowOthersHUD then
							for _, player in pairs(Players:GetPlayers()) do
								if player ~= localPlayer
									and player.Character
									and player.Character:FindFirstChild("HumanoidRootPart")
									and player.Character:FindFirstChild("Humanoid") then

									local tChar = player.Character
									local tRoot = tChar.HumanoidRootPart
									local hum = tChar.Humanoid

									if hum.Health > 0 then
										local _, inViewport = camera:WorldToScreenPoint(tRoot.Position)
										if inViewport
											and (camPosition - tRoot.Position).Magnitude <= (currentMappedSlots[player] and (Config.MaxDistance + Config.HysteresisBuffer) or Config.MaxDistance)
											and not isObstructedFromCamera(camera, tRoot) then

											table.insert(validTargets, {
												player = player,
												char = tChar,
												root = tRoot,
												hum = hum,
												dist = (camPosition - tRoot.Position).Magnitude
											})
										end
									end
								end
							end
						end

						local nextSlotAllocations = {}
						local remainingTargets = {}

						for _, targetData in ipairs(validTargets) do
							local oldSlotIndex = currentMappedSlots[targetData.player]
							if oldSlotIndex and not nextSlotAllocations[oldSlotIndex] then
								nextSlotAllocations[oldSlotIndex] = targetData
							else
								table.insert(remainingTargets, targetData)
							end
						end

						table.sort(remainingTargets, function(a, b)
							return a.dist < b.dist
						end)

						for i = 1, Config.MaxHUDs do
							if not nextSlotAllocations[i] and #remainingTargets > 0 then
								nextSlotAllocations[i] = table.remove(remainingTargets, 1)
							end
						end

						for i = 1, Config.MaxHUDs do
							local slot = Slots[i]
							local gui = slot.Gui
							local frame = slot.Frame
							local data = nextSlotAllocations[i]

							if data and _G.HUDFeatureStates.ShowOthersHUD then
								gui.Adornee = data.root
								gui.Enabled = true

								local targetOffset, side = getOptimalShoulderOffset(data.char, camera)
								if slot.CurrentSide ~= side then
									slot.CurrentSide = side
									TweenService:Create(gui, Config.ShoulderSwitch, { StudsOffsetWorldSpace = targetOffset }):Play()
								end

								if isDeveloper(data.player.Name) then
									frame.BackgroundColor3 = Config.DevCardBg
									frame.BackgroundTransparency = 0.15
									slot.Stroke.Color = Config.DevCardStroke
									slot.PaStroke.Color = Config.DevCardStroke
									frame.NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
									frame.NameLabel.Text = "🛠️ " .. data.player.DisplayName
									frame.HealthBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									frame.HealthBg.Bar.BackgroundColor3 = Config.DevCardStroke
									frame.InventoryLabel.Text = "⚡ [ CORE DEVELOPER ]"
									frame.InventoryLabel.TextColor3 = Color3.fromRGB(255, 180, 200)
								else
									frame.BackgroundColor3 = Config.BgColor
									frame.BackgroundTransparency = Config.BgTransparency
									slot.Stroke.Color = Config.StrokeColor
									slot.PaStroke.Color = Config.StrokeColor
									frame.NameLabel.TextColor3 = Config.TextMain
									frame.NameLabel.Text = data.player.DisplayName
									frame.HealthBg.BackgroundColor3 = Config.ActiveColor
									frame.HealthBg.Bar.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
									local tool = data.char:FindFirstChildOfClass("Tool")
									frame.InventoryLabel.Text = tool and ("⚡ " .. tool.Name) or "[ UNARMED ]"
									frame.InventoryLabel.TextColor3 = Config.TextSub
								end

								if slot.LastTarget ~= data.player then
									slot.LastTarget = data.player
									frame.PlayerAvatar.Image = getAbsoluteAvatar(data.player.UserId)
								end

								frame.HealthBg.Bar.Size = UDim2.new(
									math.clamp(data.hum.Health / data.hum.MaxHealth, 0, 1),
									0,
									1,
									0
								)
							else
								gui.Enabled = false
								gui.Adornee = nil
								slot.CurrentSide = nil
								slot.LastTarget = nil
							end
						end
					end
				end
			end)
		end

		for _, v in pairs(CoreGui:GetChildren()) do
			if v.Name == "MyPersonal3DHUD" or v.Name:sub(1, 8) == "SlotHUD_" then
				v:Destroy()
			end
		end

		local my3DHUD, myStatusLabel = createPersonal3DHUD()
		buildOthersHUDInstancePool()
		startHUDHeartbeat(my3DHUD, myStatusLabel)
	end
})
Sjgnfh:AddButton({
	Text = '雪景(需要双击)',
	Func = function()
		Library:Notify("我艹你妈", 3)
		print('你妈飞了')

		local Lighting = game:GetService("Lighting")
		local Workspace = game:GetService("Workspace")
		local TweenService = game:GetService("TweenService")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		local EnvironmentEngine = {
			ActivePreset = {
				SkyboxID = "rbxassetid://13540026264",
				DayColor = Color3.fromRGB(140, 160, 195),
				DecayColor = Color3.fromRGB(12, 16, 30),
				ClockTime = 0.0,
				Brightness = 0.1
			},
			BlizzardConfig = {
				MaxSnowflakes = 1800,
				SpawnInterval = 0.01,
				SnowRadius = 75,
				WindX = -45,
				WindZ = 20
			},
			SnowflakePool = {},
			PoolIndex = 1,
			peFolder = nil,
			SeaPlane = nil
		}

		function EnvironmentEngine:ClearPreviousSession()
			pcall(function()
				if Workspace:FindFirstChild("Quantum_PESnowLayer") then
					Workspace.Quantum_PESnowLayer:Destroy()
				end
				if Workspace:FindFirstChild("Atmosphere_Forced_Sea") then
					Workspace.Atmosphere_Forced_Sea:Destroy()
				end
			end)
		end

		function EnvironmentEngine:InitializeSkybox()
			local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", Lighting)
			sky.SkyboxBk = self.ActivePreset.SkyboxID
			sky.SkyboxDn = self.ActivePreset.SkyboxID
			sky.SkyboxFt = self.ActivePreset.SkyboxID
			sky.SkyboxLf = self.ActivePreset.SkyboxID
			sky.SkyboxRt = self.ActivePreset.SkyboxID
			sky.SkyboxUp = self.ActivePreset.SkyboxID
			sky.CelestialBodiesShown = false
		end

		function EnvironmentEngine:ApplyLightingBaking()
			Lighting.ClockTime = self.ActivePreset.ClockTime
			Lighting.Brightness = self.ActivePreset.Brightness
			Lighting.Ambient = self.ActivePreset.DecayColor
			Lighting.OutdoorAmbient = self.ActivePreset.DayColor

			local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
			atmosphere.Density = 0.42
			atmosphere.Haze = 3.6
			atmosphere.Color = self.ActivePreset.DayColor
			atmosphere.Decay = self.ActivePreset.DecayColor
			atmosphere.Glare = 0.6
		end

		function EnvironmentEngine:BuildCustomSea()
			local seaContainer = Instance.new("Folder")
			seaContainer.Name = "Atmosphere_Forced_Sea"
			seaContainer.Parent = Workspace

			local seaPlane = Instance.new("Part")
			seaPlane.Name = "ReflectiveSea"
			seaPlane.Size = Vector3.new(12000, 1, 12000)
			seaPlane.Position = Vector3.new(0, -3, 0)
			seaPlane.Anchored = true
			seaPlane.CanCollide = false
			seaPlane.CastShadow = false
			seaPlane.Material = Enum.Material.Glass
			seaPlane.Color = Color3.fromRGB(15, 20, 32)
			seaPlane.Transparency = 0.15
			seaPlane.Parent = seaContainer

			local function createWave(textureId, speed, trans, scale)
				local tex = Instance.new("Texture")
				tex.Texture = textureId
				tex.Face = Enum.NormalId.Top
				tex.Transparency = trans
				tex.StudsPerTileU = scale
				tex.StudsPerTileV = scale
				tex.Color3 = self.ActivePreset.DayColor
				tex.Parent = seaPlane

				task.spawn(function()
					local u, v = 0, 0
					while seaPlane.Parent do
						u = (u + speed.X) % 1
						v = (v + speed.Y) % 1
						tex.OffsetStudsU = u * scale
						tex.OffsetStudsV = v * scale
						task.wait(0.03)
					end
				end)
			end

			createWave("rbxassetid://6687848609", Vector2.new(0.002, 0.003), 0.4, 180)
			createWave("rbxassetid://6687848609", Vector2.new(-0.0015, 0.0025), 0.5, 140)

			self.SeaPlane = seaPlane
		end

		function EnvironmentEngine:StartAtmosphereBreathing()
			local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
			if not atmosphere then return end

			task.spawn(function()
				local isHigh = false
				while atmosphere.Parent do
					isHigh = not isHigh
					local targetHaze = isHigh and 4.3 or 3.2
					local targetGlare = isHigh and 0.8 or 0.4

					TweenService:Create(atmosphere, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
						Haze = targetHaze,
						Glare = targetGlare
					}):Play()

					task.wait(4)
				end
			end)
		end

		function EnvironmentEngine:InitializeSnowPool()
			self.peFolder = Instance.new("Folder")
			self.peFolder.Name = "Quantum_PESnowLayer"
			self.peFolder.Parent = Workspace

			for i = 1, self.BlizzardConfig.MaxSnowflakes do
				local snowball = Instance.new("Part")
				snowball.Shape = Enum.PartType.Ball
				local microSize = math.random(6, 16) / 100
				snowball.Size = Vector3.new(microSize, microSize, microSize)
				snowball.Color = self.ActivePreset.DayColor
				snowball.Material = Enum.Material.Neon
				snowball.CanCollide = false
				snowball.CanTouch = false
				snowball.CanQuery = false
				snowball.Anchored = true
				snowball.CastShadow = false
				snowball.Transparency = 1
				snowball.Position = Vector3.new(0, 9999, 0)
				snowball.Parent = self.peFolder

				self.SnowflakePool[i] = {
					Part = snowball,
					Tween1 = nil,
					Tween2 = nil
				}
			end
		end

		function EnvironmentEngine:EmitBlizzard(playerRoot)
			if not playerRoot then return end

			local slot = self.SnowflakePool[self.PoolIndex]
			self.PoolIndex = (self.PoolIndex % self.BlizzardConfig.MaxSnowflakes) + 1

			if slot.Tween1 then slot.Tween1:Cancel() end
			if slot.Tween2 then slot.Tween2:Cancel() end

			local snowball = slot.Part
			local localRadius = self.BlizzardConfig.SnowRadius

			local startPos = playerRoot.Position + Vector3.new(
				math.random(-localRadius * 10, localRadius * 10) / 10 - (self.BlizzardConfig.WindX * 0.5),
				math.random(400, 1100) / 10,
				math.random(-localRadius * 10, localRadius * 10) / 10 - (self.BlizzardConfig.WindZ * 0.5)
			)

			local fallDuration = math.random(11, 20) / 10
			local endPos = startPos + Vector3.new(
				self.BlizzardConfig.WindX + math.random(-80, 80) / 10,
				-125,
				self.BlizzardConfig.WindZ + math.random(-80, 80) / 10
			)

			snowball.Position = startPos
			snowball.Transparency = 1

			slot.Tween1 = TweenService:Create(snowball, TweenInfo.new(0.08, Enum.EasingStyle.Sine), { Transparency = 0.08 })
			slot.Tween2 = TweenService:Create(snowball, TweenInfo.new(fallDuration, Enum.EasingStyle.Linear), { Position = endPos })

			slot.Tween1:Play()
			slot.Tween2:Play()

			task.delay(fallDuration - 0.25, function()
				if snowball.Position.Y ~= 9999 then
					TweenService:Create(snowball, TweenInfo.new(0.25, Enum.EasingStyle.Sine), { Transparency = 1 }):Play()
				end
			end)

			task.delay(fallDuration, function()
				if snowball.Position.Y ~= 9999 then
					snowball.Transparency = 1
					snowball.Position = Vector3.new(0, 9999, 0)
				end
			end)
		end

		function EnvironmentEngine:ConnectTrackingLoop()
			local camera = Workspace.CurrentCamera

			RunService.RenderStepped:Connect(function()
				if camera and self.SeaPlane and self.SeaPlane.Parent then
					self.SeaPlane.Position = Vector3.new(
						camera.CFrame.Position.X,
						self.SeaPlane.Position.Y,
						camera.CFrame.Position.Z
					)
				end
			end)
		end

		function EnvironmentEngine:StartBlizzardLoop()
			task.spawn(function()
				while true do
					local myChar = LocalPlayer.Character
					local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

					if myRoot then
						for _ = 1, 18 do
							self:EmitBlizzard(myRoot)
						end
					end
					task.wait(self.BlizzardConfig.SpawnInterval)
				end
			end)
		end

		function EnvironmentEngine:Run()
			self:ClearPreviousSession()
			self:InitializeSkybox()
			self:ApplyLightingBaking()
			self:BuildCustomSea()
			self:StartAtmosphereBreathing()
			self:InitializeSnowPool()
			self:ConnectTrackingLoop()
			self:StartBlizzardLoop()
		end

		EnvironmentEngine:Run()
	end,
	DoubleClick = true
})
Sjgnfh:AddToggle('AuraToggle', {
    Text = '普通环绕光环',
    Default = false,
    Tooltip = '以玩家为中心生成 3D 环绕光环',
    Callback = function(Value)
        print('[回调] 环绕光环:', Value)

        if not Value then return end

        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local TweenService = game:GetService("TweenService")

        local LocalPlayer = Players.LocalPlayer
        local Audio = Instance.new("Sound")
        Audio.SoundId = "rbxassetid://183763324"
        Audio.Looped = true
        Audio.Volume = 0.8
        Audio.Parent = Workspace
        Audio:Play()

        local bars = {}
        local numBars = 64
        local radius = 3

        for i = 1, numBars do
            local bar = Instance.new("Part")
            bar.Anchored = true
            bar.CanCollide = false
            bar.Material = Enum.Material.Neon
            bar.Color = Color3.fromRGB(10, 90, 390)
            bar.Size = Vector3.new(0.12, 0.12, 0.12)
            bar.Parent = Workspace
            table.insert(bars, bar)
        end

        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not Audio.Parent then
                connection:Disconnect()
                for _, b in ipairs(bars) do b:Destroy() end
                return
            end

            local target = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not target then return end

            local center = target.CFrame * CFrame.new(0, -2, 0)
            local loudness = Audio.PlaybackLoudness
            local scale = math.clamp(loudness / 400, 0.05, 1)
            local rotation = tick() * 0.8

            for i, bar in ipairs(bars) do
                local noise = math.noise(tick() * 4, i * 0.15, 0)
                local height = math.clamp(scale + noise * scale * 0.6, 0.05, 1) * 5

                bar.Size = bar.Size:Lerp(Vector3.new(0.14, height, 0.14), 0.3)

                local angle = (i / numBars) * math.pi * 2 + rotation
                local x = math.cos(angle) * radius
                local z = math.sin(angle) * radius
                local pos = center.Position + Vector3.new(x, 0, z)

                bar.CFrame = bar.CFrame:Lerp(
                    CFrame.lookAt(pos, Vector3.new(center.Position.X, pos.Y, center.Position.Z)),
                    0.4
                )

                bar.Color = Color3.fromRGB(10, 132, 255):Lerp(Color3.new(1, 1, 1), scale - 0.3)
            end
        end)
    end
})
local connection
local bars = {}
local currentSound = nil
local musicDropdown = nil

Sjgnfh:AddToggle('AuraToggle', {
    Text = '环绕光环(音乐版)',
    Default = false,
    Tooltip = '以玩家为中心生成 3D 环绕音浪光环',
    Callback = function(Enabled)
        print('[回调] 环绕光环:', Enabled)

        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")

        local LocalPlayer = Players.LocalPlayer

        local MusicList = {
            ["雨爱"] = "rbxassetid://79277371759525",
            ["将军😭😭"] = "rbxassetid://117061993775129",
            ["iQOO进行曲"] = "rbxassetid://109693244185458",
            ["不值得"] = "rbxassetid://131649148795563",
            ["山楂树之恋"] = "rbxassetid://114372452919028",
            ["银河奥特曼主题曲"] = "rbxassetid://91550314012338",
            ["纯DJ"] = "rbxassetid://99498025749186"
        }

        local function CreateSound(id)
            if currentSound then
                currentSound:Stop()
                currentSound:Destroy()
            end

            currentSound = Instance.new("Sound")
            currentSound.SoundId = id
            currentSound.Volume = 0.8
            currentSound.Looped = true
            currentSound.Parent = Workspace
            currentSound:Play()
        end

        if not Enabled then
            if connection then
                connection:Disconnect()
                connection = nil
            end

            for _, b in ipairs(bars) do
                if b then b:Destroy() end
            end
            bars = {}

            if currentSound then
                currentSound:Stop()
                currentSound:Destroy()
                currentSound = nil
            end

            if musicDropdown then
                musicDropdown:SetVisible(false)
                musicDropdown:SetValue("无")
            end

            return
        end

        local numBars = 72
        local radius = 6

        for i = 1, numBars do
            local bar = Instance.new("Part")
            bar.Anchored = true
            bar.CanCollide = false
            bar.Material = Enum.Material.Neon
            bar.Color = Color3.fromRGB(10, 132, 255)
            bar.Size = Vector3.new(0.12, 0.12, 0.12)
            bar.Parent = Workspace
            table.insert(bars, bar)
        end

        connection = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp or not currentSound then return end

            local center = hrp.CFrame * CFrame.new(0, -2, 0)
            local loudness = currentSound.PlaybackLoudness
            local scale = math.clamp(loudness / 400, 0.05, 1)
            local rotation = tick() * 0.8

            for i, bar in ipairs(bars) do
                local noise = math.noise(tick() * 4, i * 0.15, 0)
                local height = math.clamp(scale + noise * scale * 0.6, 0.05, 1) * 5

                bar.Size = bar.Size:Lerp(Vector3.new(0.14, height, 0.14), 0.3)

                local angle = (i / numBars) * math.pi * 2 + rotation
                local x = math.cos(angle) * radius
                local z = math.sin(angle) * radius
                local pos = center.Position + Vector3.new(x, 0, z)

                bar.CFrame = bar.CFrame:Lerp(
                    CFrame.lookAt(pos, Vector3.new(center.Position.X, pos.Y, center.Position.Z)),
                    0.4
                )

                bar.Color = Color3.fromRGB(10, 132, 255):Lerp(Color3.new(1, 1, 1), scale - 0.3)
            end
        end)

        if not musicDropdown then
            musicDropdown = Sjgnfh:AddDropdown("MusicSelect", {
                Text = "选择音乐",
                Default = "无",
                Values = {
                    "无",
                    "雨爱",
                    "将军😭😭",
                    "iQOO进行曲",
                    "不值得",
                    "山楂树之恋",
                    "银河奥特曼主题曲",
                    "纯DJ"
                },
                Callback = function(Value)
                    if Value == "无" then
                        if currentSound then
                            currentSound:Stop()
                            currentSound:Destroy()
                            currentSound = nil
                        end
                        return
                    end

                    if MusicList[Value] then
                        CreateSound(MusicList[Value])
                    end
                end
            })
        else
            musicDropdown:SetVisible(true)
        end
    end
})
Bofang:AddLabel("选择即可播放")
Bofang:AddDropdown("MusicSelect", {
    Text = "选择音乐",
    Default = "无",
    Values = {
        "无",
        "雨爱",
        "将军😭😭",
        "iQOO进行曲",
        "不值得",
        "山楂树之恋",
        "银河奥特曼主题曲",
        "青衣DJ",
        "纯DJ"
    },
    Callback = function(Value)
        local Workspace = game:GetService("Workspace")

        local MusicList = {
            ["雨爱"] = "rbxassetid://79277371759525",
            ["将军😭😭"] = "rbxassetid://117061993775129",
            ["iQOO进行曲"] = "rbxassetid://109693244185458",
            ["不值得"] = "rbxassetid://131649148795563",
            ["山楂树之恋"] = "rbxassetid://114372452919028",
            ["银河奥特曼主题曲"] = "rbxassetid://91550314012338",
            ["青衣DJ"] = "rbxassetid://92109686971870",
            ["纯DJ"] = "rbxassetid://99498025749186"
        }

        for _, sound in ipairs(Workspace:GetDescendants()) do
            if sound:IsA("Sound") then
                for _, id in pairs(MusicList) do
                    if sound.SoundId == id then
                        sound:Stop()
                        sound:Destroy()
                    end
                end
            end
        end

        if Value ~= "无" then
            local sound = Instance.new("Sound")
            sound.SoundId = MusicList[Value]
            sound.Volume = 0.5
            sound.Looped = false
            sound.Parent = Workspace
            sound:Play()

            sound.Ended:Connect(function()
                sound:Destroy()
            end)

            task.delay(10, function()
                if sound and sound.Parent and not sound.IsPlaying then
                    sound:Destroy()
                end
            end)

            Library:Notify("正在播放：" .. Value, 2)
        else
            Library:Notify("已停止播放音乐", 2)
        end
    end
})
Bofang:AddButton({
    Text = "停止音乐",
    Callback = function()
        local Workspace = game:GetService("Workspace")

        for _, sound in ipairs(Workspace:GetDescendants()) do
            if sound:IsA("Sound") then
                sound:Stop()
                sound:Destroy()
            end
        end

        Library:Notify("已停止播放音乐", 2)
    end
})
Yule:AddLabel("柳宗权同款撸屌脚本(不能在墨水使用)");
Yule:AddButton({Text="撸屌R6",Func=function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="撸屌R15",Func=function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddLabel("动作类");
Yule:AddButton({Text="飞踢脚本",Func=function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-DropKick-Script-165813"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="无敌少侠脚本",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqvi1/Omni-man-fly-by-GioBolqv1/refs/heads/main/omniman.lua"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="新版甩飞（墨水可用）",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fningna51-stack/-/main/%E7%94%A9%E9%A3%9E"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="祖国人脚本",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqv1/homelander-by-GioBolqv1-/main/homelander.lua"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="VR脚本",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="4000种动作脚本",Func=function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddLabel("飞行类");
Yule:AddButton({Text="无敌少侠飞行脚本",Func=function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="联邦GUI飞行脚本",Func=function()
        local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local old = LocalPlayer.PlayerGui:FindFirstChild("ClimateV11_Fixed")
if old then old:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "ClimateV11_Fixed"
sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
sg.ZIndexBehavior = Enum.ZIndexBehavior.Global
sg.ResetOnSpawn = false

local isFlying = false
local flySpeed = 1
local walkSpeedMult = 1
local bg, bv

local Logo = Instance.new("TextButton")
Logo.Parent = sg
Logo.Size = UDim2.new(0, 45, 0, 45)
Logo.Position = UDim2.new(0.05, 0, 0.4, 0)
Logo.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
Logo.Text = "Fly"
Logo.TextColor3 = Color3.new(0,0,0)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 20
Logo.Visible = false
Logo.ZIndex = 50
Instance.new("UICorner", Logo).CornerRadius = UDim.new(1, 0)
Logo.Draggable = true
Logo.Active = true
Logo.Selectable = true

local MainFrame = Instance.new("Frame")
MainFrame.Parent = sg
MainFrame.Size = UDim2.new(0, 190, 0, 260)
MainFrame.Position = UDim2.new(0.5, -95, 0.4, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 127)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Selectable = true
MainFrame.ZIndex = 5
MainFrame.ClipsDescendants = true

local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 15
TopBar.Active = true
TopBar.Selectable = true

local function makeDraggable(dragBar, targetFrame)
    local dragging = false
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        targetFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    dragBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = targetFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            update(dragInput)
        end
    end)
end

makeDraggable(TopBar, MainFrame)
makeDraggable(Logo, Logo)

local Watermark = Instance.new("TextLabel")
Watermark.Parent = MainFrame
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 0, 35)
Watermark.BackgroundTransparency = 1
Watermark.Text = "FLY GUI by Trash"
Watermark.TextColor3 = Color3.fromRGB(0, 255, 127)
Watermark.TextSize = 14
Watermark.Font = Enum.Font.GothamBold
Watermark.ZIndex = 10

local QQGroup = Instance.new("TextLabel")
QQGroup.Parent = MainFrame
QQGroup.Size = UDim2.new(1, 0, 0, 16)
QQGroup.Position = UDim2.new(0, 0, 0, 52)
QQGroup.BackgroundTransparency = 1
QQGroup.Text = "QQ群: 1082973754"
QQGroup.TextColor3 = Color3.fromRGB(255, 255, 255)
QQGroup.TextSize = 10
QQGroup.Font = Enum.Font.Gotham
QQGroup.ZIndex = 10

local function createTab(name, pos, txt)
    local t = Instance.new("TextButton")
    t.Size = UDim2.new(0.4, 0, 0, 35)
    t.Position = pos
    t.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    t.Text = txt
    t.TextColor3 = Color3.new(1,1,1)
    t.Font = Enum.Font.GothamBold
    t.Parent = MainFrame
    t.ZIndex = 20 
    t.Active = true
    t.Selectable = true
    return t
end

local TabFly = createTab("T1", UDim2.new(0,0,0,0), "飞行")
local TabPlayer = createTab("T2", UDim2.new(0.4,0,0,0), "玩家")
local Mini = Instance.new("TextButton", MainFrame)
Mini.Size = UDim2.new(0, 38, 0, 35)
Mini.Position = UDim2.new(0.8, 0, 0, 0)
Mini.BackgroundTransparency = 1
Mini.Text = "_"
Mini.TextColor3 = Color3.new(1,1,1)
Mini.TextSize = 20
Mini.ZIndex = 20
Mini.Active = true
Mini.Selectable = true

local function createScrollPage(name)
    local s = Instance.new("ScrollingFrame")
    s.Name = name
    s.Size = UDim2.new(1, 0, 1, -75)
    s.Position = UDim2.new(0, 0, 0, 75)
    s.BackgroundTransparency = 1
    s.BorderSizePixel = 0
    s.ScrollBarThickness = 2
    s.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 127)
    s.CanvasSize = UDim2.new(0, 0, 0, 280)
    s.ZIndex = 6
    s.Visible = false
    s.Parent = MainFrame
    s.Active = true
    s.Selectable = true
    return s
end

local PageFly = createScrollPage("PageFly")
PageFly.Visible = true
local PagePlayer = createScrollPage("PagePlayer")

local function addBtn(parent, txt, y, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = UDim2.new(0.05, 0, 0, y)
    b.BackgroundColor3 = color or Color3.fromRGB(45, 45, 45)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.Parent = parent
    b.ZIndex = 8
    b.Active = true
    b.Selectable = true
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
    return b
end

local FlyBtn = addBtn(PageFly, "开启飞行", 10, Color3.fromRGB(0, 100, 50))
local SpeedLab = Instance.new("TextLabel", PageFly)
SpeedLab.Size = UDim2.new(1, 0, 0, 20)
SpeedLab.Position = UDim2.new(0, 0, 0, 50)
SpeedLab.Text = "飞行速度: 1"
SpeedLab.TextColor3 = Color3.new(1,1,0)
SpeedLab.BackgroundTransparency = 1
SpeedLab.ZIndex = 8
SpeedLab.Active = false

local FlyPlus = addBtn(PageFly, "增加速度 (+)", 75)
local FlyMinus = addBtn(PageFly, "减少速度 (-)", 115)

local SpeedLab2 = Instance.new("TextLabel", PagePlayer)
SpeedLab2.Size = UDim2.new(1, 0, 0, 25)
SpeedLab2.Position = UDim2.new(0, 0, 0, 10)
SpeedLab2.Text = "跑步加速倍率: 1"
SpeedLab2.TextColor3 = Color3.new(1,1,0)
SpeedLab2.BackgroundTransparency = 1
SpeedLab2.ZIndex = 8
SpeedLab2.Active = false

local WSPlus = addBtn(PagePlayer, "增加跑步速度", 40)
local WSMinus = addBtn(PagePlayer, "减少跑步速度", 80)
local ResetWS = addBtn(PagePlayer, "重置人物速度", 120, Color3.fromRGB(100, 100, 100))
local Unload = addBtn(PagePlayer, "卸载脚本", 165, Color3.fromRGB(150, 0, 0))

local function switchTab(isFly)
    PageFly.Visible = isFly
    PagePlayer.Visible = not isFly
    TabFly.BackgroundColor3 = isFly and Color3.fromRGB(45, 45, 45) or Color3.fromRGB(25, 25, 25)
    TabPlayer.BackgroundColor3 = not isFly and Color3.fromRGB(45, 45, 45) or Color3.fromRGB(25, 25, 25)
    TabFly.TextColor3 = isFly and Color3.fromRGB(0, 255, 127) or Color3.new(1,1,1)
    TabPlayer.TextColor3 = not isFly and Color3.fromRGB(0, 255, 127) or Color3.new(1,1,1)
end

TabFly.MouseButton1Click:Connect(function() switchTab(true) end)
TabPlayer.MouseButton1Click:Connect(function() switchTab(false) end)

Mini.MouseButton1Click:Connect(function() MainFrame.Visible = false Logo.Visible = true end)
Logo.MouseButton1Click:Connect(function() Logo.Visible = false MainFrame.Visible = true end)

local function stopFly()
    isFlying = false
    if bg then bg:Destroy() bg = nil end
    if bv then bv:Destroy() bv = nil end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.PlatformStand = false
    end
end

FlyBtn.MouseButton1Click:Connect(function()
    if isFlying then
        stopFly()
        FlyBtn.Text = "开启飞行"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
    else
        isFlying = true
        FlyBtn.Text = "关闭飞行"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        local char = LocalPlayer.Character
        local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
        local hum = char:FindFirstChild("Humanoid")
        
        if root and hum then
            bg = Instance.new("BodyGyro", root); bg.maxTorque = Vector3.new(9e9, 9e9, 9e9); bg.P = 9e4; bg.cframe = root.CFrame
            bv = Instance.new("BodyVelocity", root); bv.maxForce = Vector3.new(9e9, 9e9, 9e9); bv.velocity = Vector3.new(0, 0, 0)
            hum.PlatformStand = true
            spawn(function()
                while isFlying do
                    RunService.RenderStepped:Wait()
                    if hum.MoveDirection.Magnitude > 0 then
                        bv.velocity = workspace.CurrentCamera.CFrame.LookVector * (flySpeed * 50)
                    else
                        bv.velocity = Vector3.new(0, 0, 0)
                    end
                    bg.cframe = workspace.CurrentCamera.CFrame
                end
            end)
        end
    end
end)

FlyPlus.MouseButton1Click:Connect(function() flySpeed = flySpeed + 1 SpeedLab.Text = "飞行速度: "..flySpeed end)
FlyMinus.MouseButton1Click:Connect(function() if flySpeed > 1 then flySpeed = flySpeed - 1 SpeedLab.Text = "飞行速度: "..flySpeed end end)
WSPlus.MouseButton1Click:Connect(function() walkSpeedMult = walkSpeedMult + 1 SpeedLab2.Text = "跑步加速倍率: "..walkSpeedMult end)
WSMinus.MouseButton1Click:Connect(function() if walkSpeedMult > 1 then walkSpeedMult = walkSpeedMult - 1 SpeedLab2.Text = "跑步加速倍率: "..walkSpeedMult end end)
ResetWS.MouseButton1Click:Connect(function() walkSpeedMult = 1 SpeedLab2.Text = "跑步加速倍率: 1" end)
Unload.MouseButton1Click:Connect(function() stopFly() sg:Destroy() end)

RunService.Stepped:Connect(function()
    if walkSpeedMult > 1 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16 * walkSpeedMult
    end
end)
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddLabel("武器类");
Yule:AddButton({Text="AK47脚本(别人看不到)",Func=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ak47", true))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Yule:AddButton({Text="通用枪械脚本愤怒机器人",Func=function()
        loadstring(string.char(
    83,99,114,105,112,116,95,75,101,121,32,61,32,34,55,85,74,70,121,104,101,74,70,70,104,34,10,
    108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,
    104,116,116,112,115,58,47,47,97,112,105,46,99,104,101,97,116,103,112,116,46,99,99,34,44,32,
    116,114,117,101,41,41,40,41
))()
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
RotationControlGroup:AddButton({Text="旋转 10",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 10, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="旋转 20",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 20, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="旋转 30",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 30, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="旋转 50",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 50, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="旋转 100",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 100, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="旋转 200",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 200, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="旋转 500",Func=function()
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if A17 then
                                A17:Destroy();
                        end
                        A17 = Instance.new("BodyAngularVelocity");
                        A17.Parent = HRP;
                        A17.Name = "CustomSpin";
                        A17.MaxTorque = Vector3.new(0, 400000, 0);
                        A17.AngularVelocity = Vector3.new(0, 500, 0);
                end
        end
end});
RotationControlGroup:AddButton({Text="停止旋转",Func=function()
        if A17 then
                A17:Destroy();
                A17 = nil;
        end
end});
Cnmb:AddSlider("SpinSpeedSlider", {Text="旋转速度",Default=0,Min=0,Max=500,Rounding=0,Compact=false,Callback=function(Value)
        if (A2 and A2.Character) then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        if (Value > 0) then
                                if A17 then
                                        A17:Destroy();
                                end
                                A17 = Instance.new("BodyAngularVelocity");
                                A17.Parent = HRP;
                                A17.Name = "CustomSpin";
                                A17.MaxTorque = Vector3.new(0, 400000, 0);
                                A17.AngularVelocity = Vector3.new(0, Value, 0);
                        elseif A17 then
                                A17:Destroy();
                                A17 = nil;
                        end
                end
        end
end});
Cnmb:AddButton({Text="YX Hub飞行（秋辞飞行修复版）",Func=function()
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
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "飞行"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "秋辞飞行 V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
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
plus.TextSize = 14.000
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
speed.TextSize = 14.000
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
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Fly GUI V3";
	Text = "By me_ozone and Quandale The Dinglish XII#3550";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Cnmb:AddButton({Text="重新加载角色",Func=function()
        if A2.Character then
                A2.Character:BreakJoints();
        end
end});
Cnmb:AddButton({Text="通用甩飞[不能在墨水使用，秒封]",Func=function()
        local ScriptContent = game:HttpGet("https://pastebin.com/raw/zqyDSUWX");
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
Cnmb:AddButton({
    Text = "无敌",
    Func = function()
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character:FindFirstChild("Head") then
            local char = lp.Character
            char.Archivable = true
            local new = char:Clone()
            new.Parent = workspace
            lp.Character = new
            wait(2)
            local oldhum = char:FindFirstChildWhichIsA("Humanoid")
            local newhum = oldhum:Clone()
            newhum.Parent = char
            newhum.RequiresNeck = false
            oldhum.Parent = nil
            wait(2)
            lp.Character = char
            new:Destroy()
            wait(1)
            newhum:GetPropertyChangedSignal("Health"):Connect(
                function()
                    if newhum.Health <= 0 then
                        oldhum.Parent = lp.Character
                        wait(1)
                        oldhum:Destroy()
                    end
                end
            )
            workspace.CurrentCamera.CameraSubject = char
            if char:FindFirstChild("Animate") then
                char.Animate.Disabled = true
                wait(.1)
                char.Animate.Disabled = false
            end
            lp.Character:FindFirstChild("Head"):Destroy()
        end
    end
})
Cnmb:AddButton({Text="取消坠落伤害",Func=function()
        if A2.Character then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        local ScriptContent = game:HttpGet("http://rawscripts.net/raw/Universal-Script-Touch-fling-script-22447");
                        local Func = loadstring(ScriptContent);
                        if Func then
                                Func();
                        end
                end
        end
end});
Cnmb:AddButton({Text="走路创人",Func=function()
        if A2.Character then
                local HRP = A2.Character:FindFirstChild("HumanoidRootPart");
                if HRP then
                        local ScriptContent = game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI");
                        local Func = loadstring(ScriptContent);
                        if Func then
                                Func();
                        end
                end
        end
end});
Cnmb:AddButton({Text="穿墙模式",Func=function()
        A19 = not A19;
        if A22 then
                A22:Disconnect();
                A22 = nil;
        end
        if A19 then
                A22 = A3.Stepped:Connect(function()
                        if A2.Character then
                                for _, Part in pairs(A2.Character:GetDescendants()) do
                                        if Part:IsA("BasePart") then
                                                Part.CanCollide = false;
                                        end
                                end
                        end
                end);
        end
end});
Tong:AddToggle("AntiAfkToggle", {
    Text = "防止掉线（反挂机）",
    Default = false,
    Callback = function(Value)
        _G.AntiAfkEnabled = Value

        if Value then
            local vu = game:GetService("VirtualUser")
            _G.AntiAfkConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            print("Anti Afk On")
        else
            if _G.AntiAfkConnection then
                _G.AntiAfkConnection:Disconnect()
                _G.AntiAfkConnection = nil
            end
            print("Anti Afk Off")
        end
    end
});
Tong:AddToggle("AntiVoidToggle", {
    Text = "防虚空掉落",
    Default = false,
    Callback = function(Value)
        if Value then
            if antivoidloop then antivoidloop:Disconnect() end
            local OrgDestroyHeight = Workspace.FallenPartsDestroyHeight
            antivoidloop = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    local root = getRoot(char)
                    if root and root.Position.Y <= OrgDestroyHeight + 25 then
                        root.Velocity = root.Velocity + Vector3.new(0, 250, 0)
                    end
                end
            end)
        else
            if antivoidloop then
                antivoidloop:Disconnect()
                antivoidloop = nil
            end
        end
    end
})
Tong:AddToggle("MotionBlurToggle", {
	Text = "动态模糊",
	Default = false,
	Callback = function(Value)
		if Value then
			local camera = workspace.CurrentCamera
			local blurAmount = 10
			local blurAmplifier = 5
			local lastVector = camera.CFrame.LookVector

			local motionBlur = Instance.new("BlurEffect")
			motionBlur.Size = 0
			motionBlur.Parent = camera

			local runService = game:GetService("RunService")

			workspace.Changed:Connect(function(property)
				if property == "CurrentCamera" then
					if motionBlur and motionBlur.Parent then
						motionBlur.Parent = workspace.CurrentCamera
					else
						motionBlur = Instance.new("BlurEffect", workspace.CurrentCamera)
					end
				end
			end)

			runService.Heartbeat:Connect(function()
				if not motionBlur or motionBlur.Parent == nil then
					motionBlur = Instance.new("BlurEffect", camera)
				end

				local magnitude = (camera.CFrame.LookVector - lastVector).Magnitude
				motionBlur.Size = math.abs(magnitude) * blurAmount * blurAmplifier / 2
				lastVector = camera.CFrame.LookVector
			end)
		else
			for _, v in pairs(workspace.CurrentCamera:GetDescendants()) do
				if v:IsA("BlurEffect") then
					v:Destroy()
				end
			end
		end
	end
})
Tong:AddToggle('FastInteractToggle', {
    Text = '快速交互',
    Default = false,
    Tooltip = '开启后所有 ProximityPrompt 无需长按',
    Callback = function(Value)
        if Value then
            game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                prompt.HoldDuration = 0
            end)
        else
            game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                prompt.HoldDuration = 3
            end)
        end

        print('[回调] 快速交互状态:', Value)
    end
})
Tong:AddSlider('AimbotFOVSlider', {
    Text = "自瞄范围 FOV",
    Default = 150,
    Min = 50,
    Max = 400,
    Rounding = 0,
    Suffix = "px",
    Compact = false,

    Callback = function(Value)
        AimbotFOV = tonumber(Value)
    end
})

Tong:AddToggle('AimbotToggle', {
    Text = '强制自瞄[无法关闭，带墙壁检测]',
    Default = false,
    Tooltip = 'FOV模式 + 墙壁检测',
    Callback = function(Value)
        local Cam = workspace.CurrentCamera
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")

        local MAX_DISTANCE = 800
        local connection
        local fovCircle

        if Value then
            fovCircle = Drawing.new("Circle")
            fovCircle.Color = Color3.fromRGB(255, 0, 0)
            fovCircle.Thickness = 1.5
            fovCircle.Filled = false
            fovCircle.Visible = true

            connection = RunService.RenderStepped:Connect(function()
                fovCircle.Position = Vector2.new(
                    Cam.ViewportSize.X / 2,
                    Cam.ViewportSize.Y / 2
                )
                fovCircle.Radius = AimbotFOV

                local nearest = nil
                local last = math.huge

                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= Players.LocalPlayer
                        and v.Character
                        and v.Character:FindFirstChild("Head") then

                        local head = v.Character.Head
                        local pos, visible =
                            Cam:WorldToViewportPoint(head.Position)

                        if visible then
                            local accPos = Vector2.new(pos.X, pos.Y)
                            local center = Vector2.new(
                                Cam.ViewportSize.X / 2,
                                Cam.ViewportSize.Y / 2
                            )

                            local dist = (accPos - center).Magnitude

                            if dist < last and dist <= AimbotFOV then
                                local rayParams = RaycastParams.new()
                                rayParams.FilterDescendantsInstances = {
                                    Players.LocalPlayer.Character
                                }
                                rayParams.FilterType = Enum.RaycastFilterType.Blacklist

                                local origin = Cam.CFrame.Position
                                local direction =
                                    (head.Position - origin).Unit * MAX_DISTANCE

                                local result =
                                    workspace:Raycast(origin, direction, rayParams)

                                if not result or result.Instance:IsDescendantOf(v.Character) then
                                    last = dist
                                    nearest = v
                                end
                            end
                        end
                    end
                end

                if nearest and nearest.Character and nearest.Character:FindFirstChild("Head") then
                    Cam.CFrame = CFrame.new(
                        Cam.CFrame.Position,
                        nearest.Character.Head.Position
                    )
                end
            end)

        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
            if fovCircle then
                fovCircle:Remove()
                fovCircle = nil
            end
        end
    end
})
Tong:AddToggle('MyToggle', {
    Text = '极速旋转（不能在墨水使用）',
    Default = false,
    Tooltip = '开启将会快速旋转',
    Callback = function(Value)
    local Character = LocalPlayer.Character
        local Humanoid = Character:FindFirstChild("Humanoid")
        
        spawn(function()
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://507776043"
            local track = Humanoid:LoadAnimation(anim)
            track:Play()
            track:AdjustSpeed(0)
            
            if Character:FindFirstChild("Animate") then
                Character.Animate.Disabled = true
            end
            
            local sound = Instance.new("Sound")
            sound.Name = "Sound"
            sound.SoundId = "http://www.roblox.com/asset/?id=8114290584"
            sound.Volume = 0
            sound.Looped = false
            sound.Parent = Workspace
            sound:Play()
            
            wait()
            
            local bav = Instance.new("BodyAngularVelocity")
            bav.Name = "Spinning"
            bav.Parent = Character.HumanoidRootPart
            bav.MaxTorque = Vector3.new(0, math.huge, 0)
            bav.AngularVelocity = Vector3.new(0, 30, 0)
            
            wait(3.5)
        end)
    end
})
Tong:AddToggle("BulletTrackingToggle", {Text="通用子弹追踪",Default=false,Callback=function(Enabled)
        if Enabled then
                if not bulletTrackingHook then
                        local Workspace = game:GetService("Workspace");
                        local Camera = Workspace.CurrentCamera;
                        local function getClosestHead()
                                if not A2.Character then
                                        return nil;
                                end
                                if not A2.Character:FindFirstChild("HumanoidRootPart") then
                                        return nil;
                                end
                                local closestHead = nil;
                                local closestDistance = math.huge;
                                for _, player in ipairs(A1:GetPlayers()) do
                                        if ((player ~= A2) and player.Character) then
                                                local character = player.Character;
                                                local root = character:FindFirstChild("HumanoidRootPart");
                                                local head = character:FindFirstChild("Head");
                                                local humanoid = character:FindFirstChildOfClass("Humanoid");
                                                local forcefield = character:FindFirstChild("ForceField");
                                                if (root and head and humanoid and not forcefield and (humanoid.Health > 0)) then
                                                        local distance = (root.Position - A2.Character.HumanoidRootPart.Position).Magnitude;
                                                        if (distance < closestDistance) then
                                                                closestHead = head;
                                                                closestDistance = distance;
                                                        end
                                                end
                                        end
                                end
                                return closestHead;
                        end
                        bulletTrackingHook = hookmetamethod(game, "__namecall", function(self, ...)
                                local method = getnamecallmethod();
                                local args = {...};
                                if ((method == "Raycast") and not checkcaller()) then
                                        local origin = args[1] or Camera.CFrame.Position;
                                        local closestHead = getClosestHead();
                                        if closestHead then
                                                return {Instance=closestHead,Position=closestHead.Position,Normal=(origin - closestHead.Position).Unit,Material=Enum.Material.Plastic,Distance=(closestHead.Position - origin).Magnitude};
                                        end
                                end
                                return bulletTrackingHook(self, ...);
                        end);
                end
        elseif bulletTrackingHook then
                hookmetamethod(game, "__namecall", bulletTrackingHook);
                bulletTrackingHook = nil;
        end
end});

Cnmb:AddButton({Text="刷新游戏",Func=function()
        A7:Teleport(game.PlaceId, A2);
end});
local selectedPlayer = nil
Nbcoos:AddDropdown('PlayerList', {
    SpecialType = 'Player',
    Text = '玩家列表',
    Tooltip = '自动获取当前服务器玩家',
    Callback = function(Value)
        selectedPlayer = Value
        if Value then
            print('[回调] 选中玩家:', Value.Name)
        else
            print('[回调] 未选中任何玩家')
        end
    end
})
Cnmb:AddButton({
    Text = '获取传送工具',
    Tooltip = '点击后获得一个点击传送工具',
    Callback = function()
        if not Toggles.TeleportToolToggle.Value then
            warn("[传送工具] 请先开启开关")
            return
        end

        local Mouse = LocalPlayer:GetMouse()

        local Tool = Instance.new("Tool")
        Tool.RequiresHandle = false
        Tool.Name = "[bs中心]传送工具"

        Tool.Activated:Connect(function()
            local pos = Mouse.Hit.Position + Vector3.new(0, 2.5, 0)
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(pos)
            end
        end)

        Tool.Parent = LocalPlayer.Backpack
    end
})
Nbcoos:AddButton({
    Text = "选择玩家传送",
    Func = function()
        if not selectedPlayer then
            Library:Notify("请先在下拉列表中选择一个玩家！", 3)
            return
        end

        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        if not selectedPlayer.Parent then
            Library:Notify("目标玩家已退出游戏！", 3)
            selectedPlayer = nil
            return
        end

        if selectedPlayer == localPlayer then
            Library:Notify("不能传送到自己！", 3)
            return
        end

        local targetChar = selectedPlayer.Character
        if not targetChar or not targetChar.Parent then
            Library:Notify("目标玩家尚未加载角色！", 3)
            return
        end

        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetHRP then
            targetHRP = targetChar:WaitForChild("HumanoidRootPart", 2)
            if not targetHRP then
                Library:Notify("无法获取目标玩家位置！", 3)
                return
            end
        end

        local myChar = localPlayer.Character
        if not myChar or not myChar.Parent then
            local charAdded = localPlayer.CharacterAdded:Wait(3)
            if not charAdded then
                Library:Notify("等待角色加载超时！", 3)
                return
            end
            myChar = charAdded
        end
        
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then
            myHRP = myChar:WaitForChild("HumanoidRootPart", 2)
            if not myHRP then
                Library:Notify("无法获取你的位置！", 3)
                return
            end
        end

        local offset = Vector3.new(0, 0, 3)
        myHRP.CFrame = targetHRP.CFrame + targetHRP.CFrame:VectorToWorldSpace(offset)
        
        Library:Notify("已传送到玩家：" .. selectedPlayer.Name, 3)
    end,
    DoubleClick = false
})

Tabs.ScriptCenter:UpdateWarningBox({
        Title = '脚本信息',
        Text = '添加了更多新的脚本有些功能需要在游戏当中执行\n[<font color=\"rgb(255, 0, 0)\">谢谢您的使用，感谢大家</font>]',
        IsNormal = true,
        Visible = true,
        LockSize = true,
    })
local MenuGroup = Tabs.Settings:AddLeftGroupbox("菜单", "menu")
MenuGroup:AddToggle("KeybindMenuOpen", {
    Text = "显示按键绑定菜单",
    Default = Library.KeybindFrame.Visible,
    Callback = function(State)
        Library.KeybindFrame.Visible = State
    end
})
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "自定义光标",
    Default = false,
    Callback = function(State)
        Library.ShowCustomCursor = State
    end
})
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "自定义鼠标指针",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})
MenuGroup:AddDropdown("NotificationSide", {
    Text = "通知位置",
    Values = { "Left", "Right" },
    Default = "Right",
    Callback = function(v)
        Library:SetNotifySide(v)
    end
})
MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI 缩放比例",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value)
        Library:SetDPIScale(DPI)
    end,
})
MenuGroup:AddSlider("UICornerSlider", {
    Text = "界面圆角大小",
    Default = Library.CornerRadius,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Callback = function(value)
        Window:SetCornerRadius(value)
    end
})
MenuGroup:AddToggle('MyToggle', {
    Text = 'YX贵宾标识',
    Default = true,
    Tooltip = '在头顶显示YX Hub贵宾动态标识',
    Callback = function(Value)
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        local LP = Players.LocalPlayer
        local currentText = nil
        local currentTween = nil
        local isEnabled = false
        local charConn = nil
        
        local function createFloatingText(player, text)
            if not player or not player.Character then return end
            local head = player.Character:FindFirstChild("Head")
            if not head then return end
            if currentText then currentText:Destroy() currentText = nil end
            if currentTween then currentTween:Cancel() currentTween = nil end
            local existingText = head:FindFirstChild("WUScriptText")
            if existingText then existingText:Destroy() end
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "WUScriptText"
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = head
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = text or "YX贵宾"
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 20
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.Parent = billboard
            local colorSequence = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211))
            })
            local uigradient = Instance.new("UIGradient")
            uigradient.Color = colorSequence
            uigradient.Rotation = 0
            uigradient.Offset = Vector2.new(-1, 0)
            uigradient.Parent = textLabel
            local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
            currentTween = TweenService:Create(uigradient, tweenInfo, {Offset = Vector2.new(1, 0)})
            currentTween:Play()
            currentText = billboard
        end
        
        local function removeText()
            if currentText then currentText:Destroy() currentText = nil end
            if currentTween then currentTween:Cancel() currentTween = nil end
        end
        
        local function toggleText(enable)
            isEnabled = enable
            if enable then
                if LP.Character then createFloatingText(LP, "YX Hub 贵宾") end
                if not charConn then
                    charConn = LP.CharacterAdded:Connect(function(character)
                        wait(0.5)
                        if isEnabled then createFloatingText(LP, "YX Hub 贵宾") end
                    end)
                end
            else
                removeText()
                if charConn then charConn:Disconnect() charConn = nil end
            end
        end
        
        toggleText(Value)
        if WindUI and WindUI.Notify then
            WindUI:Notify({
                Title = Value and "已开启" or "已关闭",
                Content = Value and "YX贵宾标识已显示" or "YX贵宾标识已隐藏",
                Duration = 2
            })
        end
    end
})
MenuGroup:AddDivider()

MenuGroup:AddLabel("菜单快捷键")
    :AddKeyPicker("MenuKeybind", {
        Default = "RightShift",
        NoUI = true,
        Text = "菜单快捷键"
    })

MenuGroup:AddButton("卸载脚本", function()
    Library:Unload()
end)

Library:AddDraggableLabel("欢迎使用YX HUB\n科技与你无限\nYX重启未来")
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder("MyScriptTheme")
SaveManager:SetFolder("MyScriptConfig")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)
Library:Notify("YX Hub - YX Hub脚本中心 已加载", 3)
Library:Notify("尊贵的 " .. game.Players.LocalPlayer.Name .. " 欢迎使用", 3)
