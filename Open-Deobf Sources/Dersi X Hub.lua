-- ts file was generated at discord.gg/25ms

local v1 = loadstring(game:HttpGet('https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua'))()

loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua'))()

local v2 = v1:CreateWindow({
    Title = 'Dersi X Hub',
    SubTitle = 'Blox Fruit',
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = false,
    Theme = 'Darker',
    MinimizeKey = Enum.KeyCode.End,
})
local v3 = {
    Main = v2:AddTab({
        Title = 'Main',
        Icon = 'home',
    }),
    Setting = v2:AddTab({
        Title = 'Settings',
        Icon = 'settings',
    }),
    Player = v2:AddTab({
        Title = 'PvP',
        Icon = 'baby',
    }),
    Teleport = v2:AddTab({
        Title = 'Teleport',
        Icon = 'palmtree',
    }),
    Fruit = v2:AddTab({
        Title = 'Fruit',
        Icon = 'cherry',
    }),
    Raid = v2:AddTab({
        Title = 'Raid',
        Icon = 'swords',
    }),
    Race = v2:AddTab({
        Title = 'Race',
        Icon = 'chevrons-right',
    }),
    Shop = v2:AddTab({
        Title = 'Shop',
        Icon = 'shopping-cart',
    }),
    Misc = v2:AddTab({
        Title = 'Misc',
        Icon = 'list-plus',
    }),
}
local _Options = v1.Options
local _PlaceId = game.PlaceId

if _PlaceId == 2753915549 then
    World1 = true
elseif _PlaceId == 4442272183 then
    World2 = true
elseif _PlaceId == 7449423635 then
    World3 = true
else
    game:Shutdown()
end

game:GetService('Players').LocalPlayer.Idled:connect(function()
    game:GetService('VirtualUser'):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService('VirtualUser'):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local _ScreenGui = Instance.new('ScreenGui')
local _ImageButton = Instance.new('ImageButton')
local _UICorner = Instance.new('UICorner')

_ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_ImageButton.Parent = _ScreenGui
_ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
_ImageButton.BorderSizePixel = 0
_ImageButton.Position = UDim2.new(0.103761353, 0, 0.214939028, 0)
_ImageButton.Size = UDim2.new(0, 58, 0, 55)
_ImageButton.Image = 'rbxassetid://100170894166021'
_UICorner.Parent = _ImageButton

local function v9()
    Instance.new('LocalScript', _ImageButton).Parent.MouseButton1Click:Connect(function()
        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.End, false, game)
    end)
end

coroutine.wrap(v9)()

First_Sea = false
Second_Sea = false
Third_Sea = false

local _PlaceId2 = game.PlaceId

if _PlaceId2 == 2753915549 then
    First_Sea = true
elseif _PlaceId2 == 4442272183 then
    Second_Sea = true
elseif _PlaceId2 == 7449423635 then
    Third_Sea = true
end

function FindQuest()
    local _Value = game:GetService('Players').LocalPlayer.Data.Level.Value

    if First_Sea then
        if _Value == 1 or (_Value <= 9 or (SelectMonster == 'Bandit' or SelectArea == '')) then
            Ms = 'Bandit'
            NameQuest = 'BanditQuest1'
            QuestLv = 1
            NameMon = 'Bandit'
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif _Value == 10 or (_Value <= 14 or (SelectMonster == 'Monkey' or SelectArea == 'Jungle')) then
            Ms = 'Monkey'
            NameQuest = 'JungleQuest'
            QuestLv = 1
            NameMon = 'Monkey'
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif _Value == 15 or (_Value <= 29 or (SelectMonster == 'Gorilla' or SelectArea == 'Jungle')) then
            Ms = 'Gorilla'
            NameQuest = 'JungleQuest'
            QuestLv = 2
            NameMon = 'Gorilla'
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif _Value == 30 or (_Value <= 39 or (SelectMonster == 'Pirate' or SelectArea == 'Buggy')) then
            Ms = 'Pirate'
            NameQuest = 'BuggyQuest1'
            QuestLv = 1
            NameMon = 'Pirate'
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif _Value == 40 or (_Value <= 59 or (SelectMonster == 'Brute' or SelectArea == 'Buggy')) then
            Ms = 'Brute'
            NameQuest = 'BuggyQuest1'
            QuestLv = 2
            NameMon = 'Brute'
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif _Value == 60 or (_Value <= 74 or (SelectMonster == 'Desert Bandit' or SelectArea == 'Desert')) then
            Ms = 'Desert Bandit'
            NameQuest = 'DesertQuest'
            QuestLv = 1
            NameMon = 'Desert Bandit'
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif _Value == 75 or (_Value <= 89 or (SelectMonster == 'Desert Officer' or SelectArea == 'Desert')) then
            Ms = 'Desert Officer'
            NameQuest = 'DesertQuest'
            QuestLv = 2
            NameMon = 'Desert Officer'
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif _Value == 90 or (_Value <= 99 or (SelectMonster == 'Snow Bandit' or SelectArea == 'Snow')) then
            Ms = 'Snow Bandit'
            NameQuest = 'SnowQuest'
            QuestLv = 1
            NameMon = 'Snow Bandit'
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif _Value == 100 or (_Value <= 119 or (SelectMonster == 'Snowman' or SelectArea == 'Snow')) then
            Ms = 'Snowman'
            NameQuest = 'SnowQuest'
            QuestLv = 2
            NameMon = 'Snowman'
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif _Value == 120 or (_Value <= 149 or (SelectMonster == 'Chief Petty Officer' or SelectArea == 'Marine')) then
            Ms = 'Chief Petty Officer'
            NameQuest = 'MarineQuest2'
            QuestLv = 1
            NameMon = 'Chief Petty Officer'
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif _Value == 150 or (_Value <= 174 or (SelectMonster == 'Sky Bandit' or SelectArea == 'Sky')) then
            Ms = 'Sky Bandit'
            NameQuest = 'SkyQuest'
            QuestLv = 1
            NameMon = 'Sky Bandit'
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif _Value == 175 or (_Value <= 189 or (SelectMonster == 'Dark Master' or SelectArea == 'Sky')) then
            Ms = 'Dark Master'
            NameQuest = 'SkyQuest'
            QuestLv = 2
            NameMon = 'Dark Master'
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif _Value == 190 or (_Value <= 209 or (SelectMonster == 'Prisoner' or SelectArea == 'Prison')) then
            Ms = 'Prisoner'
            NameQuest = 'PrisonerQuest'
            QuestLv = 1
            NameMon = 'Prisoner'
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
        elseif _Value == 210 or (_Value <= 249 or (SelectMonster == 'Dangerous Prisoner' or SelectArea == 'Prison')) then
            Ms = 'Dangerous Prisoner'
            NameQuest = 'PrisonerQuest'
            QuestLv = 2
            NameMon = 'Dangerous Prisoner'
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
        elseif _Value == 250 or (_Value <= 274 or (SelectMonster == 'Toga Warrior' or SelectArea == 'Colosseum')) then
            Ms = 'Toga Warrior'
            NameQuest = 'ColosseumQuest'
            QuestLv = 1
            NameMon = 'Toga Warrior'
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif _Value == 275 or (_Value <= 299 or (SelectMonster == 'Gladiator' or SelectArea == 'Colosseum')) then
            Ms = 'Gladiator'
            NameQuest = 'ColosseumQuest'
            QuestLv = 2
            NameMon = 'Gladiator'
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif _Value == 300 or (_Value <= 324 or (SelectMonster == 'Military Soldier' or SelectArea == 'Magma')) then
            Ms = 'Military Soldier'
            NameQuest = 'MagmaQuest'
            QuestLv = 1
            NameMon = 'Military Soldier'
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif _Value == 325 or (_Value <= 374 or (SelectMonster == 'Military Spy' or SelectArea == 'Magma')) then
            Ms = 'Military Spy'
            NameQuest = 'MagmaQuest'
            QuestLv = 2
            NameMon = 'Military Spy'
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
        elseif _Value == 375 or (_Value <= 399 or (SelectMonster == 'Fishman Warrior' or SelectArea == 'Fishman')) then
            Ms = 'Fishman Warrior'
            NameQuest = 'FishmanQuest'
            QuestLv = 1
            NameMon = 'Fishman Warrior'
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif _Value == 400 or (_Value <= 449 or (SelectMonster == 'Fishman Commando' or SelectArea == 'Fishman')) then
            Ms = 'Fishman Commando'
            NameQuest = 'FishmanQuest'
            QuestLv = 2
            NameMon = 'Fishman Commando'
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif _Value == 10 or (_Value <= 474 or (SelectMonster == "God's Guard" or SelectArea == 'Sky Island')) then
            Ms = "God's Guard"
            NameQuest = 'SkyExp1Quest'
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif _Value == 475 or (_Value <= 524 or (SelectMonster == 'Shanda' or SelectArea == 'Sky Island')) then
            Ms = 'Shanda'
            NameQuest = 'SkyExp1Quest'
            QuestLv = 2
            NameMon = 'Shanda'
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif _Value == 525 or (_Value <= 549 or (SelectMonster == 'Royal Squad' or SelectArea == 'Sky Island')) then
            Ms = 'Royal Squad'
            NameQuest = 'SkyExp2Quest'
            QuestLv = 1
            NameMon = 'Royal Squad'
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif _Value == 550 or (_Value <= 624 or (SelectMonster == 'Royal Soldier' or SelectArea == 'Sky Island')) then
            Ms = 'Royal Soldier'
            NameQuest = 'SkyExp2Quest'
            QuestLv = 2
            NameMon = 'Royal Soldier'
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif _Value == 625 or (_Value <= 649 or (SelectMonster == 'Galley Pirate' or SelectArea == 'Fountain')) then
            Ms = 'Galley Pirate'
            NameQuest = 'FountainQuest'
            QuestLv = 1
            NameMon = 'Galley Pirate'
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif _Value >= 650 or (SelectMonster == 'Galley Captain' or SelectArea == 'Fountain') then
            Ms = 'Galley Captain'
            NameQuest = 'FountainQuest'
            QuestLv = 2
            NameMon = 'Galley Captain'
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Second_Sea then
        if _Value == 700 or (_Value <= 724 or (SelectMonster == 'Raider' or SelectArea == 'Area 1')) then
            Ms = 'Raider'
            NameQuest = 'Area1Quest'
            QuestLv = 1
            NameMon = 'Raider'
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif _Value == 725 or (_Value <= 774 or (SelectMonster == 'Mercenary' or SelectArea == 'Area 1')) then
            Ms = 'Mercenary'
            NameQuest = 'Area1Quest'
            QuestLv = 2
            NameMon = 'Mercenary'
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif _Value == 775 or (_Value <= 799 or (SelectMonster == 'Swan Pirate' or SelectArea == 'Area 2')) then
            Ms = 'Swan Pirate'
            NameQuest = 'Area2Quest'
            QuestLv = 1
            NameMon = 'Swan Pirate'
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif _Value == 800 or (_Value <= 874 or (SelectMonster == 'Factory Staff' or SelectArea == 'Area 2')) then
            Ms = 'Factory Staff'
            NameQuest = 'Area2Quest'
            QuestLv = 2
            NameMon = 'Factory Staff'
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif _Value == 875 or (_Value <= 899 or (SelectMonster == 'Marine Lieutenan' or SelectArea == 'Marine')) then
            Ms = 'Marine Lieutenant'
            NameQuest = 'MarineQuest3'
            QuestLv = 1
            NameMon = 'Marine Lieutenant'
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif _Value == 900 or (_Value <= 949 or (SelectMonster == 'Marine Captain' or SelectArea == 'Marine')) then
            Ms = 'Marine Captain'
            NameQuest = 'MarineQuest3'
            QuestLv = 2
            NameMon = 'Marine Captain'
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif _Value == 950 or (_Value <= 974 or (SelectMonster == 'Zombie' or SelectArea == 'Zombie')) then
            Ms = 'Zombie'
            NameQuest = 'ZombieQuest'
            QuestLv = 1
            NameMon = 'Zombie'
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif _Value == 975 or (_Value <= 999 or (SelectMonster == 'Vampire' or SelectArea == 'Zombie')) then
            Ms = 'Vampire'
            NameQuest = 'ZombieQuest'
            QuestLv = 2
            NameMon = 'Vampire'
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif _Value == 1000 or (_Value <= 1049 or (SelectMonster == 'Snow Trooper' or SelectArea == 'Snow Mountain')) then
            Ms = 'Snow Trooper'
            NameQuest = 'SnowMountainQuest'
            QuestLv = 1
            NameMon = 'Snow Trooper'
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif _Value == 1050 or (_Value <= 1099 or (SelectMonster == 'Winter Warrior' or SelectArea == 'Snow Mountain')) then
            Ms = 'Winter Warrior'
            NameQuest = 'SnowMountainQuest'
            QuestLv = 2
            NameMon = 'Winter Warrior'
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif _Value == 1100 or (_Value <= 1124 or (SelectMonster == 'Lab Subordinate' or SelectArea == 'Ice Fire')) then
            Ms = 'Lab Subordinate'
            NameQuest = 'IceSideQuest'
            QuestLv = 1
            NameMon = 'Lab Subordinate'
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif _Value == 1125 or (_Value <= 1174 or (SelectMonster == 'Horned Warrior' or SelectArea == 'Ice Fire')) then
            Ms = 'Horned Warrior'
            NameQuest = 'IceSideQuest'
            QuestLv = 2
            NameMon = 'Horned Warrior'
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif _Value == 1175 or (_Value <= 1199 or (SelectMonster == 'Magma Ninja' or SelectArea == 'Ice Fire')) then
            Ms = 'Magma Ninja'
            NameQuest = 'FireSideQuest'
            QuestLv = 1
            NameMon = 'Magma Ninja'
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif _Value == 1200 or (_Value <= 1249 or (SelectMonster == 'Lava Pirate' or SelectArea == 'Ice Fire')) then
            Ms = 'Lava Pirate'
            NameQuest = 'FireSideQuest'
            QuestLv = 2
            NameMon = 'Lava Pirate'
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif _Value == 1250 or (_Value <= 1274 or (SelectMonster == 'Ship Deckhand' or SelectArea == 'Ship')) then
            Ms = 'Ship Deckhand'
            NameQuest = 'ShipQuest1'
            QuestLv = 1
            NameMon = 'Ship Deckhand'
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1275 or (_Value <= 1299 or (SelectMonster == 'Ship Engineer' or SelectArea == 'Ship')) then
            Ms = 'Ship Engineer'
            NameQuest = 'ShipQuest1'
            QuestLv = 2
            NameMon = 'Ship Engineer'
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1300 or (_Value <= 1324 or (SelectMonster == 'Ship Steward' or SelectArea == 'Ship')) then
            Ms = 'Ship Steward'
            NameQuest = 'ShipQuest2'
            QuestLv = 1
            NameMon = 'Ship Steward'
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1325 or (_Value <= 1349 or (SelectMonster == 'Ship Officer' or SelectArea == 'Ship')) then
            Ms = 'Ship Officer'
            NameQuest = 'ShipQuest2'
            QuestLv = 2
            NameMon = 'Ship Officer'
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif _Value == 1350 or (_Value <= 1374 or (SelectMonster == 'Arctic Warrior' or SelectArea == 'Frost')) then
            Ms = 'Arctic Warrior'
            NameQuest = 'FrostQuest'
            QuestLv = 1
            NameMon = 'Arctic Warrior'
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)

            if _G.LevelFarm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        elseif _Value == 1375 or (_Value <= 1424 or (SelectMonster == 'Snow Lurker' or SelectArea == 'Frost')) then
            Ms = 'Snow Lurker'
            NameQuest = 'FrostQuest'
            QuestLv = 2
            NameMon = 'Snow Lurker'
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif _Value == 1425 or (_Value <= 1449 or (SelectMonster == 'Sea Soldier' or SelectArea == 'Forgotten')) then
            Ms = 'Sea Soldier'
            NameQuest = 'ForgottenQuest'
            QuestLv = 1
            NameMon = 'Sea Soldier'
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif _Value >= 1450 or (SelectMonster == 'Water Fighter' or SelectArea == 'Forgotten') then
            Ms = 'Water Fighter'
            NameQuest = 'ForgottenQuest'
            QuestLv = 2
            NameMon = 'Water Fighter'
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    end
    if Third_Sea then
        if _Value == 1500 or (_Value <= 1524 or (SelectMonster == 'Pirate Millionaire' or SelectArea == 'Pirate Port')) then
            Ms = 'Pirate Millionaire'
            NameQuest = 'PiratePortQuest'
            QuestLv = 1
            NameMon = 'Pirate Millionaire'
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
        elseif _Value == 1525 or (_Value <= 1574 or (SelectMonster == 'Pistol Billionaire' or SelectArea == 'Pirate Port')) then
            Ms = 'Pistol Billionaire'
            NameQuest = 'PiratePortQuest'
            QuestLv = 2
            NameMon = 'Pistol Billionaire'
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
        elseif _Value == 1575 or (_Value <= 1599 or (SelectMonster == 'Dragon Crew Warrior' or SelectArea == 'Amazon')) then
            Ms = 'Dragon Crew Warrior'
            NameQuest = 'AmazonQuest'
            QuestLv = 1
            NameMon = 'Dragon Crew Warrior'
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
        elseif _Value == 1600 or (_Value <= 1624 or (SelectMonster == 'Dragon Crew Archer' or SelectArea == 'Amazon')) then
            Ms = 'Dragon Crew Archer'
            NameQuest = 'AmazonQuest'
            QuestLv = 2
            NameMon = 'Dragon Crew Archer'
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
        elseif _Value == 1625 or (_Value <= 1649 or (SelectMonster == 'Female Islander' or SelectArea == 'Amazon')) then
            Ms = 'Female Islander'
            NameQuest = 'AmazonQuest2'
            QuestLv = 1
            NameMon = 'Female Islander'
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
        elseif _Value == 1650 or (_Value <= 1699 or (SelectMonster == 'Giant Islander' or SelectArea == 'Amazon')) then
            Ms = 'Giant Islander'
            NameQuest = 'AmazonQuest2'
            QuestLv = 2
            NameMon = 'Giant Islander'
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
        elseif _Value == 1700 or (_Value <= 1724 or (SelectMonster == 'Marine Commodore' or SelectArea == 'Marine Tree')) then
            Ms = 'Marine Commodore'
            NameQuest = 'MarineTreeIsland'
            QuestLv = 1
            NameMon = 'Marine Commodore'
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif _Value == 1725 or (_Value <= 1774 or (SelectMonster == 'Marine Rear Admiral' or SelectArea == 'Marine Tree')) then
            Ms = 'Marine Rear Admiral'
            NameQuest = 'MarineTreeIsland'
            QuestLv = 2
            NameMon = 'Marine Rear Admiral'
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif _Value == 1775 or (_Value <= 1799 or (SelectMonster == 'Fishman Raider' or SelectArea == 'Deep Forest')) then
            Ms = 'Fishman Raider'
            NameQuest = 'DeepForestIsland3'
            QuestLv = 1
            NameMon = 'Fishman Raider'
            CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
        elseif _Value == 1800 or (_Value <= 1824 or (SelectMonster == 'Fishman Captain' or SelectArea == 'Deep Forest')) then
            Ms = 'Fishman Captain'
            NameQuest = 'DeepForestIsland3'
            QuestLv = 2
            NameMon = 'Fishman Captain'
            CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif _Value == 1825 or (_Value <= 1849 or (SelectMonster == 'Forest Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Forest Pirate'
            NameQuest = 'DeepForestIsland'
            QuestLv = 1
            NameMon = 'Forest Pirate'
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif _Value == 1850 or (_Value <= 1899 or (SelectMonster == 'Mythological Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Mythological Pirate'
            NameQuest = 'DeepForestIsland'
            QuestLv = 2
            NameMon = 'Mythological Pirate'
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif _Value == 1900 or (_Value <= 1924 or (SelectMonster == 'Jungle Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Jungle Pirate'
            NameQuest = 'DeepForestIsland2'
            QuestLv = 1
            NameMon = 'Jungle Pirate'
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif _Value == 1925 or (_Value <= 1974 or (SelectMonster == 'Musketeer Pirate' or SelectArea == 'Deep Forest')) then
            Ms = 'Musketeer Pirate'
            NameQuest = 'DeepForestIsland2'
            QuestLv = 2
            NameMon = 'Musketeer Pirate'
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif _Value == 1975 or (_Value <= 1999 or (SelectMonster == 'Reborn Skeleton' or SelectArea == 'Haunted Castle')) then
            Ms = 'Reborn Skeleton'
            NameQuest = 'HauntedQuest1'
            QuestLv = 1
            NameMon = 'Reborn Skeleton'
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-8, -0.999978542, 2.04920472e-8, 1, 4.51620679e-8, 0.999978542, -2.01955679e-8, -0.00655503059)
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -0.000013950732, -0.208259016, -1.08073925e-6, 1, -0.0000720630269, 0.208259016, 0.0000707080399, 0.978073597)
        elseif _Value == 2000 or (_Value <= 2024 or (SelectMonster == 'Living Zombie' or SelectArea == 'Haunted Castle')) then
            Ms = 'Living Zombie'
            NameQuest = 'HauntedQuest1'
            QuestLv = 2
            NameMon = 'Living Zombie'
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-8, -0.999978542, 2.04920472e-8, 1, 4.51620679e-8, 0.999978542, -2.01955679e-8, -0.00655503059)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.7754714099999998e-8, 0.0324240364, -2.58006327e-8, 1, -6.06848474e-8, -0.0324240364, 5.98163865e-8, 0.999474227)
        elseif _Value == 2025 or (_Value <= 2049 or (SelectMonster == 'Demonic Soul' or SelectArea == 'Haunted Castle')) then
            Ms = 'Demonic Soul'
            NameQuest = 'HauntedQuest2'
            QuestLv = 1
            NameMon = 'Demonic Soul'
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif _Value == 2050 or (_Value <= 2074 or (SelectMonster == 'Posessed Mummy' or SelectArea == 'Haunted Castle')) then
            Ms = 'Posessed Mummy'
            NameQuest = 'HauntedQuest2'
            QuestLv = 2
            NameMon = 'Posessed Mummy'
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif _Value == 2075 or (_Value <= 2099 or (SelectMonster == 'Peanut Scout' or SelectArea == 'Nut Island')) then
            Ms = 'Peanut Scout'
            NameQuest = 'NutsIslandQuest'
            QuestLv = 1
            NameMon = 'Peanut Scout'
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif _Value == 2100 or (_Value <= 2124 or (SelectMonster == 'Peanut President' or SelectArea == 'Nut Island')) then
            Ms = 'Peanut President'
            NameQuest = 'NutsIslandQuest'
            QuestLv = 2
            NameMon = 'Peanut President'
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif _Value == 2125 or (_Value <= 2149 or (SelectMonster == 'Ice Cream Chef' or SelectArea == 'Ice Cream Island')) then
            Ms = 'Ice Cream Chef'
            NameQuest = 'IceCreamIslandQuest'
            QuestLv = 1
            NameMon = 'Ice Cream Chef'
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
        elseif _Value == 2150 or (_Value <= 2199 or (SelectMonster == 'Ice Cream Commander' or SelectArea == 'Ice Cream Island')) then
            Ms = 'Ice Cream Commander'
            NameQuest = 'IceCreamIslandQuest'
            QuestLv = 2
            NameMon = 'Ice Cream Commander'
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
        elseif _Value == 2200 or (_Value <= 2224 or (SelectMonster == 'Cookie Crafter' or SelectArea == 'Cake Island')) then
            Ms = 'Cookie Crafter'
            NameQuest = 'CakeQuest1'
            QuestLv = 1
            NameMon = 'Cookie Crafter'
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
        elseif _Value == 2225 or (_Value <= 2249 or (SelectMonster == 'Cake Guard' or SelectArea == 'Cake Island')) then
            Ms = 'Cake Guard'
            NameQuest = 'CakeQuest1'
            QuestLv = 2
            NameMon = 'Cake Guard'
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
        elseif _Value == 2250 or (_Value <= 2274 or (SelectMonster == 'Baking Staff' or SelectArea == 'Cake Island')) then
            Ms = 'Baking Staff'
            NameQuest = 'CakeQuest2'
            QuestLv = 1
            NameMon = 'Baking Staff'
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
        elseif _Value == 2275 or (_Value <= 2299 or (SelectMonster == 'Head Baker' or SelectArea == 'Cake Island')) then
            Ms = 'Head Baker'
            NameQuest = 'CakeQuest2'
            QuestLv = 2
            NameMon = 'Head Baker'
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
        elseif _Value == 2300 or (_Value <= 2324 or (SelectMonster == 'Cocoa Warrior' or SelectArea == 'Choco Island')) then
            Ms = 'Cocoa Warrior'
            NameQuest = 'ChocQuest1'
            QuestLv = 1
            NameMon = 'Cocoa Warrior'
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
        elseif _Value == 2325 or (_Value <= 2349 or (SelectMonster == 'Chocolate Bar Battler' or SelectArea == 'Choco Island')) then
            Ms = 'Chocolate Bar Battler'
            NameQuest = 'ChocQuest1'
            QuestLv = 2
            NameMon = 'Chocolate Bar Battler'
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
        elseif _Value == 2350 or (_Value <= 2374 or (SelectMonster == 'Sweet Thief' or SelectArea == 'Choco Island')) then
            Ms = 'Sweet Thief'
            NameQuest = 'ChocQuest2'
            QuestLv = 1
            NameMon = 'Sweet Thief'
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
        elseif _Value == 2375 or (_Value <= 2400 or (SelectMonster == 'Candy Rebel' or SelectArea == 'Choco Island')) then
            Ms = 'Candy Rebel'
            NameQuest = 'ChocQuest2'
            QuestLv = 2
            NameMon = 'Candy Rebel'
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
        elseif _Value == 2400 or (_Value <= 2424 or (SelectMonster == 'Candy Pirate' or SelectArea == 'Candy Island')) then
            Ms = 'Candy Pirate'
            NameQuest = 'CandyQuest1'
            QuestLv = 1
            NameMon = 'Candy Pirate'
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
        elseif _Value == 2425 or (_Value <= 2449 or (SelectMonster == 'Snow Demon' or SelectArea == 'Candy Island')) then
            Ms = 'Snow Demon'
            NameQuest = 'CandyQuest1'
            QuestLv = 2
            NameMon = 'Snow Demon'
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif _Value == 2450 or (_Value <= 2474 or (SelectMonster == 'Isle Outlaw' or SelectArea == 'Tiki Outpost')) then
            Ms = 'Isle Outlaw'
            NameQuest = 'TikiQuest1'
            QuestLv = 1
            NameMon = 'Isle Outlaw'
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
            CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
        elseif _Value == 2475 or (_Value <= 2524 or (SelectMonster == 'Island Boy' or SelectArea == 'Tiki Outpost')) then
            Ms = 'Island Boy'
            NameQuest = 'TikiQuest1'
            QuestLv = 2
            NameMon = 'Island Boy'
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
            CFrameMon = CFrame.new(-16912.130859375, 11.787443161010742, -133.0850830078125)
        elseif _Value >= 2525 or (SelectMonster == 'Isle Champion' or SelectArea == 'Tiki Outpost') then
            Ms = 'Isle Champion'
            NameQuest = 'TikiQuest2'
            QuestLv = 2
            NameMon = 'Isle Champion'
            CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
            CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
        elseif _Value == 2550 or (_Value <= 2575 or (SelectMonster == 'Serpent Hunter' or SelectArea == 'Tiki Outpost 2')) then
            Ms = 'Serpent Hunter'
            NameQuest = 'TikiQuest3'
            QuestLv = 1
            NameMon = 'Serpent Hunter'
            CFrameQ = CFrame.new(-16668.0312, 105.315765, 1568.60132, -0.999815822, 2.53269654e-8, 0.0191932656, 2.47972114e-8, 1, -2.7839025299999998e-8, -0.0191932656, -2.73579577e-8, -0.999815822)
            CFrameMon = CFrame.new(-16645.6426, 163.092682, 1352.87317, 0.999801993, -7.3039903e-9, 0.0198997185, 5.12876497e-9, 1, 1.09360379e-7, -0.0198997185, -1.09236666e-7, 0.999801993)
        elseif _Value == 2600 or (SelectMonster == 'Skull Slayer' or SelectArea == 'Tiki Outpost 2') then
            Ms = 'Skull Slayer'
            NameQuest = 'TikiQuest3'
            QuestLv = 2
            NameMon = 'Skull Slayer'
            CFrameQ = CFrame.new(-16668.0312, 105.315765, 1568.60132, -0.999815822, 2.53269654e-8, 0.0191932656, 2.47972114e-8, 1, -2.7839025299999998e-8, -0.0191932656, -2.73579577e-8, -0.999815822)
            CFrameMon = CFrame.new(-16838.25, 122.900497, 1722.86694, 0.998448908, 3.55804843e-8, -0.0556759238, -3.229162e-8, 1, 5.997121379999999e-8, 0.0556759238, -5.80803281e-8, 0.998448908)
        end
    end
end

if First_Sea then
    tableMon = {
        'Bandit',
        'Monkey',
        'Gorilla',
        'Pirate',
        'Brute',
        'Desert Bandit',
        'Desert Officer',
        'Snow Bandit',
        'Snowman',
        'Chief Petty Officer',
        'Sky Bandit',
        'Dark Master',
        'Prisoner',
        'Dangerous Prisoner',
        'Toga Warrior',
        'Gladiator',
        'Military Soldier',
        'Military Spy',
        'Fishman Warrior',
        'Fishman Commando',
        "God's Guard",
        'Shanda',
        'Royal Squad',
        'Royal Soldier',
        'Galley Pirate',
        'Galley Captain',
    }
elseif Second_Sea then
    tableMon = {
        'Raider',
        'Mercenary',
        'Swan Pirate',
        'Factory Staff',
        'Marine Lieutenant',
        'Marine Captain',
        'Zombie',
        'Vampire',
        'Snow Trooper',
        'Winter Warrior',
        'Lab Subordinate',
        'Horned Warrior',
        'Magma Ninja',
        'Lava Pirate',
        'Ship Deckhand',
        'Ship Engineer',
        'Ship Steward',
        'Ship Officer',
        'Arctic Warrior',
        'Snow Lurker',
        'Sea Soldier',
        'Water Fighter',
    }
elseif Third_Sea then
    tableMon = {
        'Pirate Millionaire',
        'Dragon Crew Warrior',
        'Dragon Crew Archer',
        'Female Islander',
        'Giant Islander',
        'Marine Commodore',
        'Marine Rear Admiral',
        'Fishman Raider',
        'Fishman Captain',
        'Forest Pirate',
        'Mythological Pirate',
        'Jungle Pirate',
        'Musketeer Pirate',
        'Reborn Skeleton',
        'Living Zombie',
        'Demonic Soul',
        'Posessed Mummy',
        'Peanut Scout',
        'Peanut President',
        'Ice Cream Chef',
        'Ice Cream Commander',
        'Cookie Crafter',
        'Cake Guard',
        'Baking Staff',
        'Head Baker',
        'Cocoa Warrior',
        'Chocolate Bar Battler',
        'Sweet Thief',
        'Candy Rebel',
        'Candy Pirate',
        'Snow Demon',
        'Isle Outlaw',
        'Island Boy',
        'Isle Champion',
    }
end
if First_Sea then
    AreaList = {
        'Jungle',
        'Buggy',
        'Desert',
        'Snow',
        'Marine',
        'Sky',
        'Prison',
        'Colosseum',
        'Magma',
        'Fishman',
        'Sky Island',
        'Fountain',
    }
elseif Second_Sea then
    AreaList = {
        'Area 1',
        'Area 2',
        'Zombie',
        'Marine',
        'Snow Mountain',
        'Ice fire',
        'Ship',
        'Frost',
        'Forgotten',
    }
elseif Third_Sea then
    AreaList = {
        'Pirate Port',
        'Amazon',
        'Marine Tree',
        'Deep Forest',
        'Haunted Castle',
        'Nut Island',
        'Ice Cream Island',
        'Cake Island',
        'Choco Island',
        'Candy Island',
        'Tiki Outpost',
    }
end

function CheckBossQuest()
    if First_Sea then
        if SelectBoss ~= 'The Gorilla King' then
            if SelectBoss ~= 'Bobby' then
                if SelectBoss ~= 'The Saw' then
                    if SelectBoss ~= 'Yeti' then
                        if SelectBoss ~= 'Mob Leader' then
                            if SelectBoss ~= 'Vice Admiral' then
                                if SelectBoss ~= 'Saber Expert' then
                                    if SelectBoss ~= 'Warden' then
                                        if SelectBoss ~= 'Chief Warden' then
                                            if SelectBoss ~= 'Swan' then
                                                if SelectBoss ~= 'Magma Admiral' then
                                                    if SelectBoss ~= 'Fishman Lord' then
                                                        if SelectBoss ~= 'Wysper' then
                                                            if SelectBoss ~= 'Thunder God' then
                                                                if SelectBoss ~= 'Cyborg' then
                                                                    if SelectBoss ~= 'Ice Admiral' then
                                                                        if SelectBoss == 'Greybeard' then
                                                                            BossMon = 'Greybeard'
                                                                            NameBoss = 'Greybeard'
                                                                            CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
                                                                        end
                                                                    else
                                                                        BossMon = 'Ice Admiral'
                                                                        NameBoss = 'Ice Admiral'
                                                                        CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
                                                                    end
                                                                else
                                                                    BossMon = 'Cyborg'
                                                                    NameBoss = 'Cyborg'
                                                                    NameQuestBoss = 'FountainQuest'
                                                                    QuestLvBoss = 3
                                                                    RewardBoss = 'Reward:\n$20,000\n7,500,000 Exp.'
                                                                    CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                                                                    CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
                                                                end
                                                            else
                                                                BossMon = 'Thunder God'
                                                                NameBoss = 'Thunder God'
                                                                NameQuestBoss = 'SkyExp2Quest'
                                                                QuestLvBoss = 3
                                                                RewardBoss = 'Reward:\n$20,000\n5,800,000 Exp.'
                                                                CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                                                                CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
                                                            end
                                                        else
                                                            BossMon = 'Wysper'
                                                            NameBoss = 'Wysper'
                                                            NameQuestBoss = 'SkyExp1Quest'
                                                            QuestLvBoss = 3
                                                            RewardBoss = 'Reward:\n$15,000\n4,800,000 Exp.'
                                                            CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
                                                            CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
                                                        end
                                                    else
                                                        BossMon = 'Fishman Lord'
                                                        NameBoss = 'Fishman Lord'
                                                        NameQuestBoss = 'FishmanQuest'
                                                        QuestLvBoss = 3
                                                        RewardBoss = 'Reward:\n$15,000\n4,000,000 Exp.'
                                                        CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                                                        CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
                                                    end
                                                else
                                                    BossMon = 'Magma Admiral'
                                                    NameBoss = 'Magma Admiral'
                                                    NameQuestBoss = 'MagmaQuest'
                                                    QuestLvBoss = 3
                                                    RewardBoss = 'Reward:\n$15,000\n2,800,000 Exp.'
                                                    CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
                                                    CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
                                                end
                                            else
                                                BossMon = 'Swan'
                                                NameBoss = 'Swan'
                                                NameQuestBoss = 'ImpelQuest'
                                                QuestLvBoss = 3
                                                RewardBoss = 'Reward:\n$15,000\n1,600,000 Exp.'
                                                CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
                                                CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
                                            end
                                        else
                                            BossMon = 'Chief Warden'
                                            NameBoss = 'Chief Warden'
                                            NameQuestBoss = 'ImpelQuest'
                                            QuestLvBoss = 2
                                            RewardBoss = 'Reward:\n$10,000\n1,000,000 Exp.'
                                            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939)
                                            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
                                        end
                                    else
                                        BossMon = 'Warden'
                                        NameBoss = 'Warden'
                                        NameQuestBoss = 'ImpelQuest'
                                        QuestLvBoss = 1
                                        RewardBoss = 'Reward:\n$6,000\n850,000 Exp.'
                                        CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.4994640100000005e-6, 0.975376427, -0.0000195412576, 1, 9.031620720000001e-6, -0.975376427, -0.0000210519756, 0.220546961)
                                        CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
                                    end
                                else
                                    NameBoss = 'Saber Expert'
                                    BossMon = 'Saber Expert'
                                    CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
                                end
                            else
                                BossMon = 'Vice Admiral'
                                NameBoss = 'Vice Admiral'
                                NameQuestBoss = 'MarineQuest2'
                                QuestLvBoss = 2
                                RewardBoss = 'Reward:\n$10,000\n180,000 Exp.'
                                CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
                                CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
                            end
                        else
                            BossMon = 'Mob Leader'
                            NameBoss = 'Mob Leader'
                            CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
                        end
                    else
                        BossMon = 'Yeti'
                        NameBoss = 'Yeti'
                        NameQuestBoss = 'SnowQuest'
                        QuestLvBoss = 3
                        RewardBoss = 'Reward:\n$10,000\n180,000 Exp.'
                        CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                        CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
                    end
                else
                    BossMon = 'The Saw'
                    NameBoss = 'The Saw'
                    CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
                end
            else
                BossMon = 'Bobby'
                NameBoss = 'Bobby'
                NameQuestBoss = 'BuggyQuest1'
                QuestLvBoss = 3
                RewardBoss = 'Reward:\n$8,000\n35,000 Exp.'
                CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
            end
        else
            BossMon = 'The Gorilla King'
            NameBoss = 'The Gorrila King'
            NameQuestBoss = 'JungleQuest'
            QuestLvBoss = 3
            RewardBoss = 'Reward:\n$2,000\n7,000 Exp.'
            CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
        end
    end
    if Second_Sea then
        if SelectBoss ~= 'Diamond' then
            if SelectBoss ~= 'Jeremy' then
                if SelectBoss ~= 'Fajita' then
                    if SelectBoss ~= 'Don Swan' then
                        if SelectBoss ~= 'Smoke Admiral' then
                            if SelectBoss ~= 'Awakened Ice Admiral' then
                                if SelectBoss ~= 'Tide Keeper' then
                                    if SelectBoss ~= 'Darkbeard' then
                                        if SelectBoss ~= 'Cursed Captain' then
                                            if SelectBoss == 'Order' then
                                                BossMon = 'Order'
                                                NameBoss = 'Order'
                                                CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
                                            end
                                        else
                                            BossMon = 'Cursed Captain'
                                            NameBoss = 'Cursed Captain'
                                            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
                                        end
                                    else
                                        BossMon = 'Darkbeard'
                                        NameBoss = 'Darkbeard'
                                        CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
                                    end
                                else
                                    BossMon = 'Tide Keeper'
                                    NameBoss = 'Tide Keeper'
                                    NameQuestBoss = 'ForgottenQuest'
                                    QuestLvBoss = 3
                                    RewardBoss = 'Reward:\n$12,500\n38,000,000 Exp.'
                                    CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
                                    CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
                                end
                            else
                                BossMon = 'Awakened Ice Admiral'
                                NameBoss = 'Awakened Ice Admiral'
                                NameQuestBoss = 'FrostQuest'
                                QuestLvBoss = 3
                                RewardBoss = 'Reward:\n$20,000\n36,000,000 Exp.'
                                CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
                                CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
                            end
                        else
                            BossMon = 'Smoke Admiral'
                            NameBoss = 'Smoke Admiral'
                            NameQuestBoss = 'IceSideQuest'
                            QuestLvBoss = 3
                            RewardBoss = 'Reward:\n$20,000\n25,000,000 Exp.'
                            CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                            CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
                        end
                    else
                        BossMon = 'Don Swan'
                        NameBoss = 'Don Swan'
                        CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
                    end
                else
                    BossMon = 'Fajita'
                    NameBoss = 'Fajita'
                    NameQuestBoss = 'MarineQuest3'
                    QuestLvBoss = 3
                    RewardBoss = 'Reward:\n$25,000\n15,000,000 Exp.'
                    CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
                    CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
                end
            else
                BossMon = 'Jeremy'
                NameBoss = 'Jeremy'
                NameQuestBoss = 'Area2Quest'
                QuestLvBoss = 3
                RewardBoss = 'Reward:\n$25,000\n11,500,000 Exp.'
                CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            end
        else
            BossMon = 'Diamond'
            NameBoss = 'Diamond'
            NameQuestBoss = 'Area1Quest'
            QuestLvBoss = 3
            RewardBoss = 'Reward:\n$25,000\n9,000,000 Exp.'
            CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        end
    end
    if Third_Sea then
        if SelectBoss ~= 'Stone' then
            if SelectBoss ~= 'Island Empress' then
                if SelectBoss ~= 'Kilo Admiral' then
                    if SelectBoss ~= 'Captain Elephant' then
                        if SelectBoss ~= 'Beautiful Pirate' then
                            if SelectBoss ~= 'Cake Queen' then
                                if SelectBoss ~= 'Longma' then
                                    if SelectBoss ~= 'Soul Reaper' then
                                        if SelectBoss == 'rip_indra True Form' then
                                            BossMon = 'rip_indra True Form'
                                            NameBoss = 'rip_indra True Form'
                                            CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
                                        end
                                    else
                                        BossMon = 'Soul Reaper'
                                        NameBoss = 'Soul Reaper'
                                        CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
                                    end
                                else
                                    BossMon = 'Longma'
                                    NameBoss = 'Longma'
                                    CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
                                end
                            else
                                BossMon = 'Cake Queen'
                                NameBoss = 'Cake Queen'
                                NameQuestBoss = 'IceCreamIslandQuest'
                                QuestLvBoss = 3
                                RewardBoss = 'Reward:\n$30,000\n112,500,000 Exp.'
                                CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
                                CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
                            end
                        else
                            BossMon = 'Beautiful Pirate'
                            NameBoss = 'Beautiful Pirate'
                            NameQuestBoss = 'DeepForestIsland2'
                            QuestLvBoss = 3
                            RewardBoss = 'Reward:\n$50,000\n70,000,000 Exp.'
                            CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
                        end
                    else
                        BossMon = 'Captain Elephant'
                        NameBoss = 'Captain Elephant'
                        NameQuestBoss = 'DeepForestIsland'
                        QuestLvBoss = 3
                        RewardBoss = 'Reward:\n$40,000\n67,000,000 Exp.'
                        CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
                        CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
                    end
                else
                    BossMon = 'Kilo Admiral'
                    NameBoss = 'Kilo Admiral'
                    NameQuestBoss = 'MarineTreeIsland'
                    QuestLvBoss = 3
                    RewardBoss = 'Reward:\n$35,000\n56,000,000 Exp.'
                    CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
                    CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
                end
            else
                BossMon = 'Island Empress'
                NameBoss = 'Island Empress'
                NameQuestBoss = 'AmazonQuest2'
                QuestLvBoss = 3
                RewardBoss = 'Reward:\n$30,000\n52,000,000 Exp.'
                CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
                CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
            end
        else
            BossMon = 'Stone'
            NameBoss = 'Stone'
            NameQuestBoss = 'PiratePortQuest'
            QuestLvBoss = 3
            RewardBoss = 'Reward:\n$25,000\n40,000,000 Exp.'
            CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        end
    end
end
function MaterialMon()
    if SelectMaterial ~= 'Radioactive Material' then
        if SelectMaterial ~= 'Mystic Droplet' then
            if SelectMaterial ~= 'Magma Ore' then
                if SelectMaterial ~= 'Angel Wings' then
                    if SelectMaterial ~= 'Leather' then
                        if SelectMaterial ~= 'Scrap Metal' then
                            if SelectMaterial ~= 'Fish Tail' then
                                if SelectMaterial ~= 'Demonic Wisp' then
                                    if SelectMaterial ~= 'Vampire Fang' then
                                        if SelectMaterial ~= 'Conjured Cocoa' then
                                            if SelectMaterial ~= 'Dragon Scale' then
                                                if SelectMaterial ~= 'Gunpowder' then
                                                    if SelectMaterial == 'Mini Tusk' then
                                                        MMon = 'Mythological Pirate'
                                                        MPos = CFrame.new(-13545, 470, -6917)
                                                        SP = 'Default'
                                                    end
                                                else
                                                    MMon = 'Pistol Billionaire'
                                                    MPos = CFrame.new(-469, 74, 5904)
                                                    SP = 'Default'
                                                end
                                            else
                                                MMon = 'Dragon Crew Archer'
                                                MPos = CFrame.new(6594, 383, 139)
                                                SP = 'Default'
                                            end
                                        else
                                            MMon = 'Chocolate Bar Battler'
                                            MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
                                            SP = 'Default'
                                        end
                                    else
                                        MMon = 'Vampire'
                                        MPos = CFrame.new(-6033, 7, -1317)
                                        SP = 'Default'
                                    end
                                else
                                    MMon = 'Demonic Soul'
                                    MPos = CFrame.new(-9507, 172, 6158)
                                    SP = 'Default'
                                end
                            elseif Third_Sea then
                                MMon = 'Fishman Raider'
                                MPos = CFrame.new(-10993, 332, -8940)
                                SP = 'Default'
                            elseif First_Sea then
                                MMon = 'Fishman Warrior'
                                MPos = CFrame.new(61123, 19, 1569)
                                SP = 'Default'

                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
                                end
                            end
                        elseif First_Sea then
                            MMon = 'Brute'
                            MPos = CFrame.new(-1145, 15, 4350)
                            SP = 'Default'
                        elseif Second_Sea then
                            MMon = 'Swan Pirate'
                            MPos = CFrame.new(878, 122, 1235)
                            SP = 'Default'
                        elseif Third_Sea then
                            MMon = 'Jungle Pirate'
                            MPos = CFrame.new(-12107, 332, -10549)
                            SP = 'Default'
                        end
                    elseif First_Sea then
                        MMon = 'Brute'
                        MPos = CFrame.new(-1145, 15, 4350)
                        SP = 'Default'
                    elseif Second_Sea then
                        MMon = 'Marine Captain'
                        MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
                        SP = 'Default'
                    elseif Third_Sea then
                        MMon = 'Jungle Pirate'
                        MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
                        SP = 'Default'
                    end
                else
                    MMon = "God's Guard"
                    MPos = CFrame.new(-4698, 845, -1912)
                    SP = 'Default'

                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7859.09814, 5544.19043, -381.476196))
                    end
                end
            elseif First_Sea then
                MMon = 'Military Spy'
                MPos = CFrame.new(-5815, 84, 8820)
                SP = 'Default'
            elseif Second_Sea then
                MMon = 'Magma Ninja'
                MPos = CFrame.new(-5428, 78, -5959)
                SP = 'Default'
            end
        else
            MMon = 'Water Fighter'
            MPos = CFrame.new(-3385, 239, -10542)
            SP = 'Default'
        end
    else
        MMon = 'Factory Staff'
        MPos = CFrame.new(295, 73, -56)
        SP = 'Default'
    end
end
function UpdateIslandESP()
    local v12, v13, v14 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

    while true do
        local u15

        v14, u15 = v12(v13, v14)

        if v14 == nil then
            break
        end

        pcall(function()
            if IslandESP then
                if u15.Name ~= 'Sea' then
                    if u15:FindFirstChild('NameEsp') then
                        u15.NameEsp.TextLabel.Text = u15.Name .. '   \n' .. round((game:GetService('Players').LocalPlayer.Character.Head.Position - u15.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui = Instance.new('BillboardGui', u15)

                        _BillboardGui.Name = 'NameEsp'
                        _BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui.Adornee = u15
                        _BillboardGui.AlwaysOnTop = true

                        local _TextLabel = Instance.new('TextLabel', _BillboardGui)

                        _TextLabel.Font = 'GothamBold'
                        _TextLabel.FontSize = 'Size14'
                        _TextLabel.TextWrapped = true
                        _TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel.TextYAlignment = 'Top'
                        _TextLabel.BackgroundTransparency = 1
                        _TextLabel.TextStrokeTransparency = 0.5
                        _TextLabel.TextColor3 = Color3.fromRGB(8, 0, 0)
                    end
                end
            elseif u15:FindFirstChild('NameEsp') then
                u15:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function isnil(p18)
    return p18 == nil
end

local function u20(p19)
    return math.floor(tonumber(p19) + 0.5)
end

Number = math.random(1, 1000000)

function UpdatePlayerChams()
    local v21, v22, v23 = pairs(game:GetService('Players'):GetChildren())

    while true do
        local u24

        v23, u24 = v21(v22, v23)

        if v23 == nil then
            break
        end

        pcall(function()
            if not isnil(u24.Character) then
                if ESPPlayer then
                    if isnil(u24.Character.Head) or u24.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        u24.Character.Head['NameEsp' .. Number].TextLabel.Text = u24.Name .. ' | ' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u24.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth : ' .. u20(u24.Character.Humanoid.Health * 100 / u24.Character.Humanoid.MaxHealth) .. '%'
                    else
                        local _BillboardGui2 = Instance.new('BillboardGui', u24.Character.Head)

                        _BillboardGui2.Name = 'NameEsp' .. Number
                        _BillboardGui2.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui2.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui2.Adornee = u24.Character.Head
                        _BillboardGui2.AlwaysOnTop = true

                        local _TextLabel2 = Instance.new('TextLabel', _BillboardGui2)

                        _TextLabel2.Font = Enum.Font.GothamSemibold
                        _TextLabel2.FontSize = 'Size10'
                        _TextLabel2.TextWrapped = true
                        _TextLabel2.Text = u24.Name .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u24.Character.Head.Position).Magnitude / 3) .. ' Distance'
                        _TextLabel2.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel2.TextYAlignment = 'Top'
                        _TextLabel2.BackgroundTransparency = 1
                        _TextLabel2.TextStrokeTransparency = 0.5

                        if u24.Team ~= game.Players.LocalPlayer.Team then
                            _TextLabel2.TextColor3 = Color3.new(255, 0, 0)
                        else
                            _TextLabel2.TextColor3 = Color3.new(0, 0, 254)
                        end
                    end
                elseif u24.Character.Head:FindFirstChild('NameEsp' .. Number) then
                    u24.Character.Head:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
    local v27, v28, v29 = pairs(game.Workspace:GetChildren())

    while true do
        local u30

        v29, u30 = v27(v28, v29)

        if v29 == nil then
            break
        end

        pcall(function()
            if string.find(u30.Name, 'Chest') then
                if ChestESP then
                    if string.find(u30.Name, 'Chest') then
                        if u30:FindFirstChild('NameEsp' .. Number) then
                            u30['NameEsp' .. Number].TextLabel.Text = u30.Name .. '   \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u30.Position).Magnitude / 3) .. ' Distance'
                        else
                            local _BillboardGui3 = Instance.new('BillboardGui', u30)

                            _BillboardGui3.Name = 'NameEsp' .. Number
                            _BillboardGui3.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui3.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui3.Adornee = u30
                            _BillboardGui3.AlwaysOnTop = true

                            local _TextLabel3 = Instance.new('TextLabel', _BillboardGui3)

                            _TextLabel3.Font = Enum.Font.GothamSemibold
                            _TextLabel3.FontSize = 'Size14'
                            _TextLabel3.TextWrapped = true
                            _TextLabel3.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel3.TextYAlignment = 'Top'
                            _TextLabel3.BackgroundTransparency = 1
                            _TextLabel3.TextStrokeTransparency = 0.5

                            if u30.Name == 'Chest1' then
                                _TextLabel3.TextColor3 = Color3.fromRGB(109, 109, 109)
                                _TextLabel3.Text = 'Chest 1' .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u30.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u30.Name == 'Chest2' then
                                _TextLabel3.TextColor3 = Color3.fromRGB(173, 158, 21)
                                _TextLabel3.Text = 'Chest 2' .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u30.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u30.Name == 'Chest3' then
                                _TextLabel3.TextColor3 = Color3.fromRGB(85, 255, 255)
                                _TextLabel3.Text = 'Chest 3' .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u30.Position).Magnitude / 3) .. ' Distance'
                            end
                        end
                    end
                elseif u30:FindFirstChild('NameEsp' .. Number) then
                    u30:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
    local v33, v34, v35 = pairs(game.Workspace:GetChildren())

    while true do
        local u36

        v35, u36 = v33(v34, v35)

        if v35 == nil then
            break
        end

        pcall(function()
            if DevilFruitESP then
                if string.find(u36.Name, 'Fruit') then
                    if u36.Handle:FindFirstChild('NameEsp' .. Number) then
                        u36.Handle['NameEsp' .. Number].TextLabel.Text = u36.Name .. '   \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u36.Handle.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui4 = Instance.new('BillboardGui', u36.Handle)

                        _BillboardGui4.Name = 'NameEsp' .. Number
                        _BillboardGui4.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui4.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui4.Adornee = u36.Handle
                        _BillboardGui4.AlwaysOnTop = true

                        local _TextLabel4 = Instance.new('TextLabel', _BillboardGui4)

                        _TextLabel4.Font = Enum.Font.GothamSemibold
                        _TextLabel4.FontSize = 'Size14'
                        _TextLabel4.TextWrapped = true
                        _TextLabel4.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel4.TextYAlignment = 'Top'
                        _TextLabel4.BackgroundTransparency = 1
                        _TextLabel4.TextStrokeTransparency = 0.5
                        _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
                        _TextLabel4.Text = u36.Name .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u36.Handle.Position).Magnitude / 3) .. ' Distance'
                    end
                end
            elseif u36.Handle:FindFirstChild('NameEsp' .. Number) then
                u36.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
    local v39, v40, v41 = pairs(game.Workspace:GetChildren())

    while true do
        local u42

        v41, u42 = v39(v40, v41)

        if v41 == nil then
            break
        end

        pcall(function()
            if u42.Name == 'Flower2' or u42.Name == 'Flower1' then
                if FlowerESP then
                    if u42:FindFirstChild('NameEsp' .. Number) then
                        u42['NameEsp' .. Number].TextLabel.Text = u42.Name .. '   \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u42.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui5 = Instance.new('BillboardGui', u42)

                        _BillboardGui5.Name = 'NameEsp' .. Number
                        _BillboardGui5.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui5.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui5.Adornee = u42
                        _BillboardGui5.AlwaysOnTop = true

                        local _TextLabel5 = Instance.new('TextLabel', _BillboardGui5)

                        _TextLabel5.Font = Enum.Font.GothamSemibold
                        _TextLabel5.FontSize = 'Size14'
                        _TextLabel5.TextWrapped = true
                        _TextLabel5.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel5.TextYAlignment = 'Top'
                        _TextLabel5.BackgroundTransparency = 1
                        _TextLabel5.TextStrokeTransparency = 0.5
                        _TextLabel5.TextColor3 = Color3.fromRGB(255, 0, 0)

                        if u42.Name == 'Flower1' then
                            _TextLabel5.Text = 'Blue Flower' .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u42.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel5.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if u42.Name == 'Flower2' then
                            _TextLabel5.Text = 'Red Flower' .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u42.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel5.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif u42:FindFirstChild('NameEsp' .. Number) then
                    u42:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
    local v45, v46, v47 = pairs(game.Workspace.AppleSpawner:GetChildren())

    while true do
        local v48

        v47, v48 = v45(v46, v47)

        if v47 == nil then
            break
        end
        if v48:IsA('Tool') then
            if RealFruitESP then
                if v48.Handle:FindFirstChild('NameEsp' .. Number) then
                    v48.Handle['NameEsp' .. Number].TextLabel.Text = v48.Name .. ' ' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - v48.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui6 = Instance.new('BillboardGui', v48.Handle)

                    _BillboardGui6.Name = 'NameEsp' .. Number
                    _BillboardGui6.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui6.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui6.Adornee = v48.Handle
                    _BillboardGui6.AlwaysOnTop = true

                    local _TextLabel6 = Instance.new('TextLabel', _BillboardGui6)

                    _TextLabel6.Font = Enum.Font.GothamSemibold
                    _TextLabel6.FontSize = 'Size14'
                    _TextLabel6.TextWrapped = true
                    _TextLabel6.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel6.TextYAlignment = 'Top'
                    _TextLabel6.BackgroundTransparency = 1
                    _TextLabel6.TextStrokeTransparency = 0.5
                    _TextLabel6.TextColor3 = Color3.fromRGB(255, 0, 0)
                    _TextLabel6.Text = v48.Name .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - v48.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v48.Handle:FindFirstChild('NameEsp' .. Number) then
                v48.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v51, v52, v53 = pairs(game.Workspace.PineappleSpawner:GetChildren())

    while true do
        local v54

        v53, v54 = v51(v52, v53)

        if v53 == nil then
            break
        end
        if v54:IsA('Tool') then
            if RealFruitESP then
                if v54.Handle:FindFirstChild('NameEsp' .. Number) then
                    v54.Handle['NameEsp' .. Number].TextLabel.Text = v54.Name .. ' ' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - v54.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui7 = Instance.new('BillboardGui', v54.Handle)

                    _BillboardGui7.Name = 'NameEsp' .. Number
                    _BillboardGui7.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui7.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui7.Adornee = v54.Handle
                    _BillboardGui7.AlwaysOnTop = true

                    local _TextLabel7 = Instance.new('TextLabel', _BillboardGui7)

                    _TextLabel7.Font = Enum.Font.GothamSemibold
                    _TextLabel7.FontSize = 'Size14'
                    _TextLabel7.TextWrapped = true
                    _TextLabel7.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel7.TextYAlignment = 'Top'
                    _TextLabel7.BackgroundTransparency = 1
                    _TextLabel7.TextStrokeTransparency = 0.5
                    _TextLabel7.TextColor3 = Color3.fromRGB(255, 174, 0)
                    _TextLabel7.Text = v54.Name .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - v54.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v54.Handle:FindFirstChild('NameEsp' .. Number) then
                v54.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v57, v58, v59 = pairs(game.Workspace.BananaSpawner:GetChildren())

    while true do
        local v60

        v59, v60 = v57(v58, v59)

        if v59 == nil then
            break
        end
        if v60:IsA('Tool') then
            if RealFruitESP then
                if v60.Handle:FindFirstChild('NameEsp' .. Number) then
                    v60.Handle['NameEsp' .. Number].TextLabel.Text = v60.Name .. ' ' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - v60.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui8 = Instance.new('BillboardGui', v60.Handle)

                    _BillboardGui8.Name = 'NameEsp' .. Number
                    _BillboardGui8.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui8.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui8.Adornee = v60.Handle
                    _BillboardGui8.AlwaysOnTop = true

                    local _TextLabel8 = Instance.new('TextLabel', _BillboardGui8)

                    _TextLabel8.Font = Enum.Font.GothamSemibold
                    _TextLabel8.FontSize = 'Size14'
                    _TextLabel8.TextWrapped = true
                    _TextLabel8.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel8.TextYAlignment = 'Top'
                    _TextLabel8.BackgroundTransparency = 1
                    _TextLabel8.TextStrokeTransparency = 0.5
                    _TextLabel8.TextColor3 = Color3.fromRGB(251, 255, 0)
                    _TextLabel8.Text = v60.Name .. ' \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - v60.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v60.Handle:FindFirstChild('NameEsp' .. Number) then
                v60.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end
end
function UpdateIslandESP()
    local v63, v64, v65 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

    while true do
        local u66

        v65, u66 = v63(v64, v65)

        if v65 == nil then
            break
        end

        pcall(function()
            if IslandESP then
                if u66.Name ~= 'Sea' then
                    if u66:FindFirstChild('NameEsp') then
                        u66.NameEsp.TextLabel.Text = u66.Name .. '   \n' .. u20((game:GetService('Players').LocalPlayer.Character.Head.Position - u66.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui9 = Instance.new('BillboardGui', u66)

                        _BillboardGui9.Name = 'NameEsp'
                        _BillboardGui9.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui9.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui9.Adornee = u66
                        _BillboardGui9.AlwaysOnTop = true

                        local _TextLabel9 = Instance.new('TextLabel', _BillboardGui9)

                        _TextLabel9.Font = 'GothamBold'
                        _TextLabel9.FontSize = 'Size14'
                        _TextLabel9.TextWrapped = true
                        _TextLabel9.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel9.TextYAlignment = 'Top'
                        _TextLabel9.BackgroundTransparency = 1
                        _TextLabel9.TextStrokeTransparency = 0.5
                        _TextLabel9.TextColor3 = Color3.fromRGB(7, 236, 240)
                    end
                end
            elseif u66:FindFirstChild('NameEsp') then
                u66:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function isnil(p69)
    return p69 == nil
end

local function u71(p70)
    return math.floor(tonumber(p70) + 0.5)
end

Number = math.random(1, 1000000)

function UpdatePlayerChams()
    local v72, v73, v74 = pairs(game:GetService('Players'):GetChildren())

    while true do
        local u75

        v74, u75 = v72(v73, v74)

        if v74 == nil then
            break
        end

        pcall(function()
            if not isnil(u75.Character) then
                if ESPPlayer then
                    if isnil(u75.Character.Head) or u75.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        u75.Character.Head['NameEsp' .. Number].TextLabel.Text = u75.Name .. ' | ' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u75.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth : ' .. u71(u75.Character.Humanoid.Health * 100 / u75.Character.Humanoid.MaxHealth) .. '%'
                    else
                        local _BillboardGui10 = Instance.new('BillboardGui', u75.Character.Head)

                        _BillboardGui10.Name = 'NameEsp' .. Number
                        _BillboardGui10.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui10.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui10.Adornee = u75.Character.Head
                        _BillboardGui10.AlwaysOnTop = true

                        local _TextLabel10 = Instance.new('TextLabel', _BillboardGui10)

                        _TextLabel10.Font = Enum.Font.GothamSemibold
                        _TextLabel10.FontSize = 'Size14'
                        _TextLabel10.TextWrapped = true
                        _TextLabel10.Text = u75.Name .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u75.Character.Head.Position).Magnitude / 3) .. ' Distance'
                        _TextLabel10.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel10.TextYAlignment = 'Top'
                        _TextLabel10.BackgroundTransparency = 1
                        _TextLabel10.TextStrokeTransparency = 0.5

                        if u75.Team ~= game.Players.LocalPlayer.Team then
                            _TextLabel10.TextColor3 = Color3.new(255, 0, 0)
                        else
                            _TextLabel10.TextColor3 = Color3.new(0, 255, 0)
                        end
                    end
                elseif u75.Character.Head:FindFirstChild('NameEsp' .. Number) then
                    u75.Character.Head:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
    local v78, v79, v80 = pairs(game.Workspace:GetChildren())

    while true do
        local u81

        v80, u81 = v78(v79, v80)

        if v80 == nil then
            break
        end

        pcall(function()
            if string.find(u81.Name, 'Chest') then
                if ChestESP then
                    if string.find(u81.Name, 'Chest') then
                        if u81:FindFirstChild('NameEsp' .. Number) then
                            u81['NameEsp' .. Number].TextLabel.Text = u81.Name .. '   \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u81.Position).Magnitude / 3) .. ' Distance'
                        else
                            local _BillboardGui11 = Instance.new('BillboardGui', u81)

                            _BillboardGui11.Name = 'NameEsp' .. Number
                            _BillboardGui11.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui11.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui11.Adornee = u81
                            _BillboardGui11.AlwaysOnTop = true

                            local _TextLabel11 = Instance.new('TextLabel', _BillboardGui11)

                            _TextLabel11.Font = Enum.Font.GothamSemibold
                            _TextLabel11.FontSize = 'Size14'
                            _TextLabel11.TextWrapped = true
                            _TextLabel11.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel11.TextYAlignment = 'Top'
                            _TextLabel11.BackgroundTransparency = 1
                            _TextLabel11.TextStrokeTransparency = 0.5

                            if u81.Name == 'Chest1' then
                                _TextLabel11.TextColor3 = Color3.fromRGB(109, 109, 109)
                                _TextLabel11.Text = 'Chest 1' .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u81.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u81.Name == 'Chest2' then
                                _TextLabel11.TextColor3 = Color3.fromRGB(173, 158, 21)
                                _TextLabel11.Text = 'Chest 2' .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u81.Position).Magnitude / 3) .. ' Distance'
                            end
                            if u81.Name == 'Chest3' then
                                _TextLabel11.TextColor3 = Color3.fromRGB(85, 255, 255)
                                _TextLabel11.Text = 'Chest 3' .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u81.Position).Magnitude / 3) .. ' Distance'
                            end
                        end
                    end
                elseif u81:FindFirstChild('NameEsp' .. Number) then
                    u81:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
    local v84, v85, v86 = pairs(game.Workspace:GetChildren())

    while true do
        local u87

        v86, u87 = v84(v85, v86)

        if v86 == nil then
            break
        end

        pcall(function()
            if DevilFruitESP then
                if string.find(u87.Name, 'Fruit') then
                    if u87.Handle:FindFirstChild('NameEsp' .. Number) then
                        u87.Handle['NameEsp' .. Number].TextLabel.Text = u87.Name .. '   \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u87.Handle.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui12 = Instance.new('BillboardGui', u87.Handle)

                        _BillboardGui12.Name = 'NameEsp' .. Number
                        _BillboardGui12.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui12.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui12.Adornee = u87.Handle
                        _BillboardGui12.AlwaysOnTop = true

                        local _TextLabel12 = Instance.new('TextLabel', _BillboardGui12)

                        _TextLabel12.Font = Enum.Font.GothamSemibold
                        _TextLabel12.FontSize = 'Size14'
                        _TextLabel12.TextWrapped = true
                        _TextLabel12.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel12.TextYAlignment = 'Top'
                        _TextLabel12.BackgroundTransparency = 1
                        _TextLabel12.TextStrokeTransparency = 0.5
                        _TextLabel12.TextColor3 = Color3.fromRGB(255, 255, 255)
                        _TextLabel12.Text = u87.Name .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u87.Handle.Position).Magnitude / 3) .. ' Distance'
                    end
                end
            elseif u87.Handle:FindFirstChild('NameEsp' .. Number) then
                u87.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
    local v90, v91, v92 = pairs(game.Workspace:GetChildren())

    while true do
        local u93

        v92, u93 = v90(v91, v92)

        if v92 == nil then
            break
        end

        pcall(function()
            if u93.Name == 'Flower2' or u93.Name == 'Flower1' then
                if FlowerESP then
                    if u93:FindFirstChild('NameEsp' .. Number) then
                        u93['NameEsp' .. Number].TextLabel.Text = u93.Name .. '   \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u93.Position).Magnitude / 3) .. ' Distance'
                    else
                        local _BillboardGui13 = Instance.new('BillboardGui', u93)

                        _BillboardGui13.Name = 'NameEsp' .. Number
                        _BillboardGui13.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui13.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui13.Adornee = u93
                        _BillboardGui13.AlwaysOnTop = true

                        local _TextLabel13 = Instance.new('TextLabel', _BillboardGui13)

                        _TextLabel13.Font = Enum.Font.GothamSemibold
                        _TextLabel13.FontSize = 'Size14'
                        _TextLabel13.TextWrapped = true
                        _TextLabel13.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel13.TextYAlignment = 'Top'
                        _TextLabel13.BackgroundTransparency = 1
                        _TextLabel13.TextStrokeTransparency = 0.5
                        _TextLabel13.TextColor3 = Color3.fromRGB(255, 0, 0)

                        if u93.Name == 'Flower1' then
                            _TextLabel13.Text = 'Blue Flower' .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u93.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel13.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if u93.Name == 'Flower2' then
                            _TextLabel13.Text = 'Red Flower' .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - u93.Position).Magnitude / 3) .. ' Distance'
                            _TextLabel13.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif u93:FindFirstChild('NameEsp' .. Number) then
                    u93:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
    local v96, v97, v98 = pairs(game.Workspace.AppleSpawner:GetChildren())

    while true do
        local v99

        v98, v99 = v96(v97, v98)

        if v98 == nil then
            break
        end
        if v99:IsA('Tool') then
            if RealFruitESP then
                if v99.Handle:FindFirstChild('NameEsp' .. Number) then
                    v99.Handle['NameEsp' .. Number].TextLabel.Text = v99.Name .. ' ' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - v99.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui14 = Instance.new('BillboardGui', v99.Handle)

                    _BillboardGui14.Name = 'NameEsp' .. Number
                    _BillboardGui14.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui14.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui14.Adornee = v99.Handle
                    _BillboardGui14.AlwaysOnTop = true

                    local _TextLabel14 = Instance.new('TextLabel', _BillboardGui14)

                    _TextLabel14.Font = Enum.Font.GothamSemibold
                    _TextLabel14.FontSize = 'Size14'
                    _TextLabel14.TextWrapped = true
                    _TextLabel14.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel14.TextYAlignment = 'Top'
                    _TextLabel14.BackgroundTransparency = 1
                    _TextLabel14.TextStrokeTransparency = 0.5
                    _TextLabel14.TextColor3 = Color3.fromRGB(255, 0, 0)
                    _TextLabel14.Text = v99.Name .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - v99.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v99.Handle:FindFirstChild('NameEsp' .. Number) then
                v99.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v102, v103, v104 = pairs(game.Workspace.PineappleSpawner:GetChildren())

    while true do
        local v105

        v104, v105 = v102(v103, v104)

        if v104 == nil then
            break
        end
        if v105:IsA('Tool') then
            if RealFruitESP then
                if v105.Handle:FindFirstChild('NameEsp' .. Number) then
                    v105.Handle['NameEsp' .. Number].TextLabel.Text = v105.Name .. ' ' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - v105.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui15 = Instance.new('BillboardGui', v105.Handle)

                    _BillboardGui15.Name = 'NameEsp' .. Number
                    _BillboardGui15.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui15.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui15.Adornee = v105.Handle
                    _BillboardGui15.AlwaysOnTop = true

                    local _TextLabel15 = Instance.new('TextLabel', _BillboardGui15)

                    _TextLabel15.Font = Enum.Font.GothamSemibold
                    _TextLabel15.FontSize = 'Size14'
                    _TextLabel15.TextWrapped = true
                    _TextLabel15.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel15.TextYAlignment = 'Top'
                    _TextLabel15.BackgroundTransparency = 1
                    _TextLabel15.TextStrokeTransparency = 0.5
                    _TextLabel15.TextColor3 = Color3.fromRGB(255, 174, 0)
                    _TextLabel15.Text = v105.Name .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - v105.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v105.Handle:FindFirstChild('NameEsp' .. Number) then
                v105.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end

    local v108, v109, v110 = pairs(game.Workspace.BananaSpawner:GetChildren())

    while true do
        local v111

        v110, v111 = v108(v109, v110)

        if v110 == nil then
            break
        end
        if v111:IsA('Tool') then
            if RealFruitESP then
                if v111.Handle:FindFirstChild('NameEsp' .. Number) then
                    v111.Handle['NameEsp' .. Number].TextLabel.Text = v111.Name .. ' ' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - v111.Handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local _BillboardGui16 = Instance.new('BillboardGui', v111.Handle)

                    _BillboardGui16.Name = 'NameEsp' .. Number
                    _BillboardGui16.ExtentsOffset = Vector3.new(0, 1, 0)
                    _BillboardGui16.Size = UDim2.new(1, 200, 1, 30)
                    _BillboardGui16.Adornee = v111.Handle
                    _BillboardGui16.AlwaysOnTop = true

                    local _TextLabel16 = Instance.new('TextLabel', _BillboardGui16)

                    _TextLabel16.Font = Enum.Font.GothamSemibold
                    _TextLabel16.FontSize = 'Size14'
                    _TextLabel16.TextWrapped = true
                    _TextLabel16.Size = UDim2.new(1, 0, 1, 0)
                    _TextLabel16.TextYAlignment = 'Top'
                    _TextLabel16.BackgroundTransparency = 1
                    _TextLabel16.TextStrokeTransparency = 0.5
                    _TextLabel16.TextColor3 = Color3.fromRGB(251, 255, 0)
                    _TextLabel16.Text = v111.Name .. ' \n' .. u71((game:GetService('Players').LocalPlayer.Character.Head.Position - v111.Handle.Position).Magnitude / 3) .. ' Distance'
                end
            elseif v111.Handle:FindFirstChild('NameEsp' .. Number) then
                v111.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end
end

spawn(function()
    while wait() do
        pcall(function()
            if MobESP then
                local v114, v115, v116 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v117

                    v116, v117 = v114(v115, v116)

                    if v116 == nil then
                        break
                    end
                    if v117:FindFirstChild('HumanoidRootPart') then
                        if not v117:FindFirstChild('MobEap') then
                            local _BillboardGui17 = Instance.new('BillboardGui')
                            local _TextLabel17 = Instance.new('TextLabel')

                            _BillboardGui17.Parent = v117
                            _BillboardGui17.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            _BillboardGui17.Active = true
                            _BillboardGui17.Name = 'MobEap'
                            _BillboardGui17.AlwaysOnTop = true
                            _BillboardGui17.LightInfluence = 1
                            _BillboardGui17.Size = UDim2.new(0, 200, 0, 50)
                            _BillboardGui17.StudsOffset = Vector3.new(0, 2.5, 0)
                            _TextLabel17.Parent = _BillboardGui17
                            _TextLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel17.BackgroundTransparency = 1
                            _TextLabel17.Size = UDim2.new(0, 200, 0, 50)
                            _TextLabel17.Font = Enum.Font.GothamBold
                            _TextLabel17.TextColor3 = Color3.fromRGB(7, 236, 240)
                            _TextLabel17.Text.Size = 35
                        end

                        local v120 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v117.HumanoidRootPart.Position).Magnitude)

                        v117.MobEap.TextLabel.Text = v117.Name .. ' - ' .. v120 .. ' Distance'
                    end
                end
            else
                local v121, v122, v123 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v124

                    v123, v124 = v121(v122, v123)

                    if v123 == nil then
                        break
                    end
                    if v124:FindFirstChild('MobEap') then
                        v124.MobEap:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if SeaESP then
                local v125, v126, v127 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                while true do
                    local v128

                    v127, v128 = v125(v126, v127)

                    if v127 == nil then
                        break
                    end
                    if v128:FindFirstChild('HumanoidRootPart') then
                        if not v128:FindFirstChild('Seaesps') then
                            local _BillboardGui18 = Instance.new('BillboardGui')
                            local _TextLabel18 = Instance.new('TextLabel')

                            _BillboardGui18.Parent = v128
                            _BillboardGui18.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            _BillboardGui18.Active = true
                            _BillboardGui18.Name = 'Seaesps'
                            _BillboardGui18.AlwaysOnTop = true
                            _BillboardGui18.LightInfluence = 1
                            _BillboardGui18.Size = UDim2.new(0, 200, 0, 50)
                            _BillboardGui18.StudsOffset = Vector3.new(0, 2.5, 0)
                            _TextLabel18.Parent = _BillboardGui18
                            _TextLabel18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel18.BackgroundTransparency = 1
                            _TextLabel18.Size = UDim2.new(0, 200, 0, 50)
                            _TextLabel18.Font = Enum.Font.GothamBold
                            _TextLabel18.TextColor3 = Color3.fromRGB(7, 236, 240)
                            _TextLabel18.Text.Size = 35
                        end

                        local v131 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v128.HumanoidRootPart.Position).Magnitude)

                        v128.Seaesps.TextLabel.Text = v128.Name .. ' - ' .. v131 .. ' Distance'
                    end
                end
            else
                local v132, v133, v134 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                while true do
                    local v135

                    v134, v135 = v132(v133, v134)

                    if v134 == nil then
                        break
                    end
                    if v135:FindFirstChild('Seaesps') then
                        v135.Seaesps:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if NpcESP then
                local v136, v137, v138 = pairs(game:GetService('Workspace').NPCs:GetChildren())

                while true do
                    local v139

                    v138, v139 = v136(v137, v138)

                    if v138 == nil then
                        break
                    end
                    if v139:FindFirstChild('HumanoidRootPart') then
                        if not v139:FindFirstChild('NpcEspes') then
                            local _BillboardGui19 = Instance.new('BillboardGui')
                            local _TextLabel19 = Instance.new('TextLabel')

                            _BillboardGui19.Parent = v139
                            _BillboardGui19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            _BillboardGui19.Active = true
                            _BillboardGui19.Name = 'NpcEspes'
                            _BillboardGui19.AlwaysOnTop = true
                            _BillboardGui19.LightInfluence = 1
                            _BillboardGui19.Size = UDim2.new(0, 200, 0, 50)
                            _BillboardGui19.StudsOffset = Vector3.new(0, 2.5, 0)
                            _TextLabel19.Parent = _BillboardGui19
                            _TextLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel19.BackgroundTransparency = 1
                            _TextLabel19.Size = UDim2.new(0, 200, 0, 50)
                            _TextLabel19.Font = Enum.Font.GothamBold
                            _TextLabel19.TextColor3 = Color3.fromRGB(7, 236, 240)
                            _TextLabel19.Text.Size = 35
                        end

                        local v142 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v139.HumanoidRootPart.Position).Magnitude)

                        v139.NpcEspes.TextLabel.Text = v139.Name .. ' - ' .. v142 .. ' Distance'
                    end
                end
            else
                local v143, v144, v145 = pairs(game:GetService('Workspace').NPCs:GetChildren())

                while true do
                    local v146

                    v145, v146 = v143(v144, v145)

                    if v145 == nil then
                        break
                    end
                    if v146:FindFirstChild('NpcEspes') then
                        v146.NpcEspes:Destroy()
                    end
                end
            end
        end)
    end
end)

function isnil(p147)
    return p147 == nil
end

local function u149(p148)
    return math.floor(tonumber(p148) + 0.5)
end

Number = math.random(1, 1000000)

function UpdateIslandMirageESP()
    local v150, v151, v152 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

    while true do
        local u153

        v152, u153 = v150(v151, v152)

        if v152 == nil then
            break
        end

        pcall(function()
            if MirageIslandESP then
                if u153.Name == 'Mirage Island' then
                    if u153:FindFirstChild('NameEsp') then
                        u153.NameEsp.TextLabel.Text = u153.Name .. '   \n' .. u149((game:GetService('Players').LocalPlayer.Character.Head.Position - u153.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui20 = Instance.new('BillboardGui', u153)

                        _BillboardGui20.Name = 'NameEsp'
                        _BillboardGui20.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui20.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui20.Adornee = u153
                        _BillboardGui20.AlwaysOnTop = true

                        local _TextLabel20 = Instance.new('TextLabel', _BillboardGui20)

                        _TextLabel20.Font = 'Code'
                        _TextLabel20.FontSize = 'Size14'
                        _TextLabel20.TextWrapped = true
                        _TextLabel20.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel20.TextYAlignment = 'Top'
                        _TextLabel20.BackgroundTransparency = 1
                        _TextLabel20.TextStrokeTransparency = 0.5
                        _TextLabel20.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u153:FindFirstChild('NameEsp') then
                u153:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function isnil(p156)
    return p156 == nil
end

local function u158(p157)
    return math.floor(tonumber(p157) + 0.5)
end

Number = math.random(1, 1000000)

function UpdateAfdESP()
    local v159, v160, v161 = pairs(game:GetService('Workspace').NPCs:GetChildren())

    while true do
        local u162

        v161, u162 = v159(v160, v161)

        if v161 == nil then
            break
        end

        pcall(function()
            if AfdESP then
                if u162.Name == 'Advanced Fruit Dealer' then
                    if u162:FindFirstChild('NameEsp') then
                        u162.NameEsp.TextLabel.Text = u162.Name .. '   \n' .. u158((game:GetService('Players').LocalPlayer.Character.Head.Position - u162.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui21 = Instance.new('BillboardGui', u162)

                        _BillboardGui21.Name = 'NameEsp'
                        _BillboardGui21.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui21.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui21.Adornee = u162
                        _BillboardGui21.AlwaysOnTop = true

                        local _TextLabel21 = Instance.new('TextLabel', _BillboardGui21)

                        _TextLabel21.Font = 'Code'
                        _TextLabel21.FontSize = 'Size14'
                        _TextLabel21.TextWrapped = true
                        _TextLabel21.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel21.TextYAlignment = 'Top'
                        _TextLabel21.BackgroundTransparency = 1
                        _TextLabel21.TextStrokeTransparency = 0.5
                        _TextLabel21.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u162:FindFirstChild('NameEsp') then
                u162:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function UpdateAuraESP()
    local v165, v166, v167 = pairs(game:GetService('Workspace').NPCs:GetChildren())

    while true do
        local u168

        v167, u168 = v165(v166, v167)

        if v167 == nil then
            break
        end

        pcall(function()
            if AuraESP then
                if u168.Name == 'Master of Enhancement' then
                    if u168:FindFirstChild('NameEsp') then
                        u168.NameEsp.TextLabel.Text = u168.Name .. '   \n' .. u158((game:GetService('Players').LocalPlayer.Character.Head.Position - u168.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui22 = Instance.new('BillboardGui', u168)

                        _BillboardGui22.Name = 'NameEsp'
                        _BillboardGui22.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui22.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui22.Adornee = u168
                        _BillboardGui22.AlwaysOnTop = true

                        local _TextLabel22 = Instance.new('TextLabel', _BillboardGui22)

                        _TextLabel22.Font = 'Code'
                        _TextLabel22.FontSize = 'Size14'
                        _TextLabel22.TextWrapped = true
                        _TextLabel22.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel22.TextYAlignment = 'Top'
                        _TextLabel22.BackgroundTransparency = 1
                        _TextLabel22.TextStrokeTransparency = 0.5
                        _TextLabel22.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u168:FindFirstChild('NameEsp') then
                u168:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function UpdateLSDESP()
    local v171, v172, v173 = pairs(game:GetService('Workspace').NPCs:GetChildren())

    while true do
        local u174

        v173, u174 = v171(v172, v173)

        if v173 == nil then
            break
        end

        pcall(function()
            if LADESP then
                if u174.Name == 'Legendary Sword Dealer' then
                    if u174:FindFirstChild('NameEsp') then
                        u174.NameEsp.TextLabel.Text = u174.Name .. '   \n' .. u158((game:GetService('Players').LocalPlayer.Character.Head.Position - u174.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui23 = Instance.new('BillboardGui', u174)

                        _BillboardGui23.Name = 'NameEsp'
                        _BillboardGui23.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui23.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui23.Adornee = u174
                        _BillboardGui23.AlwaysOnTop = true

                        local _TextLabel23 = Instance.new('TextLabel', _BillboardGui23)

                        _TextLabel23.Font = 'Code'
                        _TextLabel23.FontSize = 'Size14'
                        _TextLabel23.TextWrapped = true
                        _TextLabel23.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel23.TextYAlignment = 'Top'
                        _TextLabel23.BackgroundTransparency = 1
                        _TextLabel23.TextStrokeTransparency = 0.5
                        _TextLabel23.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u174:FindFirstChild('NameEsp') then
                u174:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function UpdateGeaESP()
    local v177, v178, v179 = pairs(game:GetService('Workspace').Map.MysticIsland:GetChildren())

    while true do
        local u180

        v179, u180 = v177(v178, v179)

        if v179 == nil then
            break
        end

        pcall(function()
            if GearESP then
                if u180.Name == 'MeshPart' then
                    if u180:FindFirstChild('NameEsp') then
                        u180.NameEsp.TextLabel.Text = u180.Name .. '   \n' .. u158((game:GetService('Players').LocalPlayer.Character.Head.Position - u180.Position).Magnitude / 3) .. ' M'
                    else
                        local _BillboardGui24 = Instance.new('BillboardGui', u180)

                        _BillboardGui24.Name = 'NameEsp'
                        _BillboardGui24.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui24.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui24.Adornee = u180
                        _BillboardGui24.AlwaysOnTop = true

                        local _TextLabel24 = Instance.new('TextLabel', _BillboardGui24)

                        _TextLabel24.Font = 'Code'
                        _TextLabel24.FontSize = 'Size14'
                        _TextLabel24.TextWrapped = true
                        _TextLabel24.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel24.TextYAlignment = 'Top'
                        _TextLabel24.BackgroundTransparency = 1
                        _TextLabel24.TextStrokeTransparency = 0.5
                        _TextLabel24.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif u180:FindFirstChild('NameEsp') then
                u180:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
function Tween2(p183)
    local _Magnitude = (p183.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

    if _Magnitude >= 1 then
        Speed = 300
    end

    game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(_Magnitude / Speed, Enum.EasingStyle.Linear), {CFrame = p183}):Play()

    if _G.CancelTween2 then
        game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(_Magnitude / Speed, Enum.EasingStyle.Linear), {CFrame = p183}):Cancel()
    end

    _G.Clip2 = true

    wait(_Magnitude / Speed)

    _G.Clip2 = false
end
function BTP(p185)
    game.Players.LocalPlayer.Character.Head:Destroy()

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p185

    wait(0.5)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p185

    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('SetSpawnPoint')
end
function BTPZ(p186)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p186

    task.wait()

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p186
end
function GetIsLand(...)
    local v187 = {...}
    local v188 = v187[1]
    local v189 = nil

    if type(v188) ~= 'vector' then
        if type(v188) ~= 'userdata' then
            if type(v188) == 'number' then
                v189 = CFrame.new(unpack(v187)).p
            end
        else
            v189 = v188.Position
        end
    else
        v189 = v188
    end

    local v190 = nil
    local _huge = math.huge

    if game.Players.LocalPlayer.Team then
        local v192, v193, v194 = pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren())

        while true do
            local v195

            v194, v195 = v192(v193, v194)

            if v194 == nil then
                break
            end

            local _Magnitude2 = (v189 - v195:GetModelCFrame().p).Magnitude

            if _Magnitude2 < _huge then
                v190 = v195.Name
                _huge = _Magnitude2
            end
        end

        if v190 then
            return v190
        end
    end
end
function toTarget(...)
    local v197 = {...}
    local v198 = v197[1]
    local u199 = nil

    if type(v198) ~= 'vector' then
        if type(v198) ~= 'userdata' then
            if type(v198) == 'number' then
                u199 = CFrame.new(unpack(v197))
            end
        else
            u199 = v198
        end
    else
        u199 = CFrame.new(v198)
    end
    if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health == 0 then
        if tween then
            tween:Cancel()
        end

        repeat
            wait()
        until game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health > 0

        wait(0.2)
    end

    local v200 = {}
    local _Magnitude3 = (u199.Position - game:GetService('Players').LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position).Magnitude

    if _Magnitude3 < 1000 then
        Speed = 315
    elseif _Magnitude3 >= 1000 then
        Speed = 300
    end
    if BypassTP and (3000 < _Magnitude3 and not AutoNextIsland) and (not game.Players.LocalPlayer.Backpack:FindFirstChild('Special Microchip') and (not game.Players.LocalPlayer.Character:FindFirstChild('Special Microchip') and (not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and (not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") and (not game.Players.LocalPlayer.Backpack:FindFirstChild('Hallow Essence') and (not game.Players.LocalPlayer.Character:FindFirstChild('Hallow Essence') and (not game.Players.LocalPlayer.Character:FindFirstChild('Sweet Chalice') and (not game.Players.LocalPlayer.Backpack:FindFirstChild('Sweet Chalice') and (Name ~= 'Fishman Commando' and Name ~= 'Fishman Warrior'))))))))) then
        pcall(function()
            tween:Cancel()

            fkwarp = false

            if game:GetService('Players').LocalPlayer.Data:FindFirstChild('SpawnPoint').Value ~= tostring(GetIsLand(u199)) then
                if game:GetService('Players').LocalPlayer.Data:FindFirstChild('LastSpawnPoint').Value ~= tostring(GetIsLand(u199)) then
                    if game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0 then
                        if fkwarp == false then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u199
                        end

                        fkwarp = true
                    end

                    wait(0.08)
                    game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid'):ChangeState(15)

                    repeat
                        wait()
                    until game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0

                    wait(0.1)
                    Com('F_', 'SetSpawnPoint')
                else
                    game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid'):ChangeState(15)
                    wait(0.1)

                    repeat
                        wait()
                    until game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0
                end
            else
                wait(0.1)
                Com('F_', 'TeleportToSpawn')
            end

            wait(0.2)
        end)
    end

    local _TweenService = game:service('TweenService')
    local u203 = TweenInfo.new((u199.Position - game:GetService('Players').LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position).Magnitude / Speed, Enum.EasingStyle.Linear)
    local _, _ = pcall(function()
        local v204 = {CFrame = u199}

        tween = _TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, u203, v204)

        tween:Play()
    end)

    function v200.Stop(_)
        tween:Cancel()
    end
    function v200.Wait(_)
        tween.Completed:Wait()
    end

    return v200
end
function Tween(p205)
    Distance = (p205.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end

    pcall(function()
        local v206 = {CFrame = p205}

        tween = game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / 300, Enum.EasingStyle.Linear), v206)
    end)
    tween:Play()

    if Distance <= 300 then
        tween:Cancel()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p205
    end
    if _G.StopTween == true then
        tween:Cancel()

        _G.Clip = false
    end
end
function toTargetP(p207)
    if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health > 0 and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') then
        if (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - p207.Position).Magnitude <= 150 then
            pcall(function()
                tween:Cancel()

                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = p207
            end)
        end

        local _TweenService2 = game:service('TweenService')
        local v209 = TweenInfo.new((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - p207.Position).Magnitude / 325, Enum.EasingStyle.Linear)

        tween = _TweenService2:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v209, {CFrame = p207})

        tween:Play()

        return {
            Stop = function(_)
                tween:Cancel()
            end,
        }
    end

    tween:Cancel()

    repeat
        wait()
    until game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0

    wait(7)
end
function TweenShip(p210)
    local _TweenService3 = game:service('TweenService')
    local v212 = TweenInfo.new((game:GetService('Workspace').Boats.MarineBrigade.VehicleSeat.CFrame.Position - p210.Position).Magnitude / 300, Enum.EasingStyle.Linear)

    tween = _TweenService3:Create(game:GetService('Workspace').Boats.MarineBrigade.VehicleSeat, v212, {CFrame = p210})

    tween:Play()

    return {
        Stop = function(_)
            tween:Cancel()
        end,
    }
end
function TweenBoat(p213)
    if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health > 0 and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') then
        local _TweenService4 = game:service('TweenService')
        local v215 = TweenInfo.new((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - p213.Position).Magnitude / 325, Enum.EasingStyle.Linear)

        tween = _TweenService4:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v215, {CFrame = p213})

        tween:Play()

        return {
            Stop = function(_)
                tween:Cancel()
            end,
        }
    end

    tween:Cancel()

    repeat
        wait()
    until game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid') and game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid').Health > 0

    wait(7)
end
function EquipTool(p216)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(p216) then
        local v217 = game.Players.LocalPlayer.Backpack:FindFirstChild(p216)

        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v217)
    end
end

spawn(function()
    local v218 = getrawmetatable(game)
    local ___namecall = v218.__namecall

    setreadonly(v218, false)

    v218.__namecall = newcclosure(function(...)
        local v220 = getnamecallmethod()
        local v221 = {...}

        if tostring(v220) ~= 'FireServer' or (tostring(v221[1]) ~= 'RemoteEvent' or (tostring(v221[2]) == 'true' or (tostring(v221[2]) == 'false' or not _G.UseSkill))) then
            return ___namecall(...)
        end
        if type(v221[2]) ~= 'vector' then
            v221[2] = CFrame.new(PositionSkillMasteryDevilFruit)
        else
            v221[2] = PositionSkillMasteryDevilFruit
        end

        return ___namecall(unpack(v221))
    end)
end)
spawn(function()
    pcall(function()
        while task.wait() do
            local v222, v223, v224 = pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren())

            while true do
                local v225

                v224, v225 = v222(v223, v224)

                if v224 == nil then
                    break
                end
                if v225:IsA('Tool') and v225:FindFirstChild('RemoteFunctionShoot') then
                    CurrentEquipGun = v225.Name
                end
            end
        end
    end)
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.TeleportIsland or (AutoFarmChest or (_G.chestsea2 or (_G.chestsea3 or (_G.CastleRaid or (_G.CollectAzure or (_G.TweenToKitsune or (_G.AutoCandy or (_G.GhostShip or (_G.Ship or (_G.SailBoat or (_G.Auto_Holy_Torch or (_G.FindMirageIsland or (_G.TeleportPly or (_G.Tweenfruit or (_G.AutoFishCrew or (_G.AutoShark or (_G.AutoCakeV2 or (_G.AutoMysticIsland or (_G.AutoQuestRace or (_G.AutoBuyBoat or (_G.dao or (_G.AutoMirage or (AutoFarmAcient or (_G.AutoQuestRace or (Auto_Law or (_G.AutoAllBoss or (AutoTushita or (_G.AutoHolyTorch or (_G.AutoTerrorshark or (_G.farmpiranya or (_G.DriveMytic or (_G.AutoCakeV2V2 or (PirateShip or (_G.AutoSeaBeast or (_G.AutoNear or (_G.BossRaid or (_G.GrabChest or (AutoCitizen or (_G.Ectoplasm or (AutoEvoRace or (AutoBartilo or (AutoFactory or (BringChestz or (BringFruitz or (_G.LevelFarm or (_G.Clip2 or (AutoFarmNoQuest or (_G.AutoBone or (AutoFarmSelectMonsterQuest or (AutoFarmSelectMonsterNoQuest or (_G.AutoBoss or (AutoFarmBossQuest or (AutoFarmMasGun or (AutoFarmMasDevilFruit or (AutoFarmSelectArea or (AutoSecondSea or (AutoThirdSea or (AutoDeathStep or (AutoSuperhuman or (AutoSharkman or (AutoElectricClaw or (AutoDragonTalon or (AutoGodhuman or (AutoRengoku or (AutoBuddySword or (AutoPole or (AutoHallowSycthe or (AutoCavander or (AutoTushita or (AutoDarkDagger or (_G.CakePrince or (_G.AutoElite or (AutoRainbowHaki or (AutoSaber or (AutoFarmKen or (AutoKenHop or (AutoKenV2 or (_G.AutoKillPlayerMelee or (_G.AutoKillPlayerGun or (_G.AutoKillPlayerFruit or (AutoDungeon or (AutoNextIsland or (AutoAdvanceDungeon or (Musketeer or (RipIndra or (Auto_Serpent_Bow or (AutoTorch or (AutoSoulGuitar or (Auto_Cursed_Dual_Katana or (_G.AutoMaterial or (Auto_Quest_Yama_1 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_3 or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (_G.Factory or (_G.SwanGlasses or (AutoBartilo or (AutoEvoRace or _G.Ectoplasm)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                if not game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyClip') then
                    local _BodyVelocity = Instance.new('BodyVelocity')

                    _BodyVelocity.Name = 'BodyClip'
                    _BodyVelocity.Parent = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
                    _BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                    _BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            else
                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyClip'):Destroy()
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        game:GetService('RunService').Stepped:Connect(function()
            if _G.TeleportIsland or (_G.CastleRaid or (AutoFarmChest or (_G.CollectAzure or (_G.TweenToKitsune or (_G.AutoCandy or (_G.GhostShip or (_G.Ship or (_G.SailBoat or (_G.Auto_Holy_Torch or (_G.Tweenfruit or (_G.FindMirageIsland or (_G.TeleportPly or (_G.AutoFishCrew or (_G.AutoShark or (_G.AutoMysticIsland or (_G.AutoCakeV2 or (_G.AutoQuestRace or (_G.AutoBuyBoat or (_G.dao or (AutoFarmAcient or (_G.AutoMirage or (Auto_Law or (_G.AutoQuestRace or (_G.AutoAllBoss or (_G.AutoHolyTorch or (AutoTushita or (_G.farmpiranya or (_G.AutoTerrorshark or (_G.AutoNear or (_G.AutoCakeV2V2 or (PirateShip or (_G.AutoSeaBeast or (_G.DriveMytic or (_G.BossRaid or (_G.GrabChest or (AutoCitizen or (_G.Ectoplasm or (AutoEvoRace or (AutoBartilo or (AutoFactory or (BringChestz or (BringFruitz or (_G.LevelFarm or (_G.Clip2 or (AutoFarmNoQuest or (_G.AutoBone or (AutoFarmSelectMonsterQuest or (AutoFarmSelectMonsterNoQuest or (_G.AutoBoss or (AutoFarmBossQuest or (AutoFarmMasGun or (AutoFarmMasDevilFruit or (AutoFarmSelectArea or (AutoSecondSea or (AutoThirdSea or (AutoDeathStep or (AutoSuperhuman or (AutoSharkman or (AutoElectricClaw or (AutoDragonTalon or (AutoGodhuman or (AutoRengoku or (AutoBuddySword or (AutoPole or (AutoHallowSycthe or (AutoCavander or (AutoTushita or (AutoDarkDagger or (_G.CakePrince or (_G.AutoElite or (AutoRainbowHaki or (AutoSaber or (AutoFarmKen or (AutoKenHop or (AutoKenV2 or (_G.AutoKillPlayerMelee or (_G.AutoKillPlayerGun or (_G.AutoKillPlayerFruit or (AutoDungeon or (AutoNextIsland or (AutoAdvanceDungeon or (Musketeer or (RipIndra or (Auto_Serpent_Bow or (AutoTorch or (AutoSoulGuitar or (Auto_Cursed_Dual_Katana or (_G.AutoMaterial or (Auto_Quest_Yama_1 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_3 or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (_G.Factory or (_G.SwanGlasses or (AutoBartilo or (AutoEvoRace or _G.Ectoplasm)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                local v227, v228, v229 = pairs(game:GetService('Players').LocalPlayer.Character:GetDescendants())

                while true do
                    local v230

                    v229, v230 = v227(v228, v229)

                    if v229 == nil then
                        break
                    end
                    if v230:IsA('BasePart') then
                        v230.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

function CheckMaterial(p231)
    local v232, v233, v234 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory'))

    while true do
        local v235

        v234, v235 = v232(v233, v234)

        if v234 == nil then
            break
        end
        if type(v235) == 'table' and (v235.Type == 'Material' and v235.Name == p231) then
            return v235.Count
        end
    end

    return 0
end
function GetWeaponInventory(p236)
    local v237, v238, v239 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory'))

    while true do
        local v240

        v239, v240 = v237(v238, v239)

        if v239 == nil then
            break
        end
        if type(v240) == 'table' and (v240.Type == 'Sword' and v240.Name == p236) then
            return true
        end
    end

    return false
end

Type1 = 1

spawn(function()
    while wait(0.1) do
        if Type ~= 1 then
            if Type ~= 2 then
                if Type ~= 3 then
                    if Type == 4 then
                        Pos = CFrame.new(-40, 10, 10)
                    end
                else
                    Pos = CFrame.new(10, 10, -40)
                end
            else
                Pos = CFrame.new(-30, 10, -30)
            end
        else
            Pos = CFrame.new(10, 40, 10)
        end
    end
end)
spawn(function()
    while wait(0.1) do
        Type = 1

        wait(1)

        Type = 2

        wait(1)

        Type = 3

        wait(1)

        Type = 4

        wait(1)
    end
end)

function AutoHaki()
    if not game:GetService('Players').LocalPlayer.Character:FindFirstChild('HasBuso') then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
    end
end
function BTP(p241)
    repeat
        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p241

        task.wait()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p241
    until (p241.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function BTP(p242)
    pcall(function()
        if (p242.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and (not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
            if NameMon ~= 'FishmanQuest' then
                if Mon ~= "God's Guard" then
                    if NameMon ~= 'SkyExp1Quest' then
                        if NameMon ~= 'ShipQuest1' then
                            if NameMon ~= 'ShipQuest2' then
                                if NameMon ~= 'FrostQuest' then
                                    repeat
                                        wait(0.5)

                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p242

                                        wait(0.05)
                                        game.Players.LocalPlayer.Character.Head:Destroy()

                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p242
                                    until (p242.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0

                                    wait()
                                else
                                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                    wait()
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                                end
                            else
                                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait()
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            end
                        else
                            Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                            wait()
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                    else
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                    end
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end
            else
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        end
    end)
end
function nHgshEJpoqgHTBEJZ(p243)
    tab = {}

    for v244 = 1, #p243 do
        x = string.len(p243[v244])
        y = string.char(x)

        table.insert(tab, y)
    end

    x = table.concat(tab)

    return x
end

local v245 = game:GetService(nHgshEJpoqgHTBEJZ({
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
}))
local u246 = v245.Modules.Net:FindFirstChild(nHgshEJpoqgHTBEJZ({
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
}))
local u247 = v245.Modules.Net:FindFirstChild(nHgshEJpoqgHTBEJZ({
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888',
    '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
    '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
}))

local function u258(p248)
    local v249 = next
    local v250, v251 = workspace.Characters:GetChildren()
    local v252 = {}

    while true do
        local v253

        v251, v253 = v249(v250, v251)

        if v251 == nil then
            break
        end
        if v253 ~= p248.Character and (v253:FindFirstChild(nHgshEJpoqgHTBEJZ({
            '888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
        })) and p248:DistanceFromCharacter(v253.HumanoidRootPart.Position) < 5522) then
            table.insert(v252, {
                v253,
                v253.HumanoidRootPart,
            })
        end
    end

    local v254 = next
    local v255, v256 = workspace.Enemies:GetChildren()

    while true do
        local v257

        v256, v257 = v254(v255, v256)

        if v256 == nil then
            break
        end
        if v257:FindFirstChild(nHgshEJpoqgHTBEJZ({
            '888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
            '88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888',
        })) and p248:DistanceFromCharacter(v257.HumanoidRootPart.Position) < 5325 then
            table.insert(v252, {
                v257,
                v257.HumanoidRootPart,
            })
        end
    end

    return v252
end

spawn(function()
    while true do
        if AutoFarmMasDevilFruit then
            wait(0.6)
        else
            wait()
        end
        if _G.FastAttack then
            local v259 = u258(game.Players.LocalPlayer)

            if #v259 > 0 then
                u246:FireServer(0.4)

                local v260 = next
                local v261 = v259
                local v262 = nil

                while true do
                    local v263

                    v262, v263 = v260(v259, v262)

                    if v262 == nil then
                        break
                    end

                    u247:FireServer(v261[v262][2], v261)
                end
            end
        end
    end
end)

_G.FastAttack = true

local _DropdownSelectWeapon = v3.Main:AddDropdown('DropdownSelectWeapon', {
    Title = 'Weapon',
    Values = {
        'Melee',
        'Sword',
        'Blox Fruit',
    },
    Multi = false,
    Default = 1,
})

_DropdownSelectWeapon:SetValue('Melee')
_DropdownSelectWeapon:OnChanged(function(p265)
    ChooseWeapon = p265
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if ChooseWeapon ~= 'Melee' then
                if ChooseWeapon ~= 'Sword' then
                    if ChooseWeapon ~= ' Blox Fruit' then
                        local v266, v267, v268 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v269

                            v268, v269 = v266(v267, v268)

                            if v268 == nil then
                                break
                            end
                            if v269.ToolTip == 'Melee' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v269.Name)) then
                                SelectWeapon = v269.Name
                            end
                        end
                    else
                        local v270, v271, v272 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v273

                            v272, v273 = v270(v271, v272)

                            if v272 == nil then
                                break
                            end
                            if v273.ToolTip == 'Blox Fruit' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v273.Name)) then
                                SelectWeapon = v273.Name
                            end
                        end
                    end
                else
                    local v274, v275, v276 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                    while true do
                        local v277

                        v276, v277 = v274(v275, v276)

                        if v276 == nil then
                            break
                        end
                        if v277.ToolTip == 'Sword' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v277.Name)) then
                            SelectWeapon = v277.Name
                        end
                    end
                end
            else
                local v278, v279, v280 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                while true do
                    local v281

                    v280, v281 = v278(v279, v280)

                    if v280 == nil then
                        break
                    end
                    if v281.ToolTip == 'Melee' and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v281.Name)) then
                        SelectWeapon = v281.Name
                    end
                end
            end
        end)
    end
end)
v3.Main:AddToggle('ToggleLevel', {
    Title = 'Auto Level',
    Default = false,
}):OnChanged(function(p282)
    _G.LevelFarm = p282
end)
_Options.ToggleLevel:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.LevelFarm then
            pcall(function()
                FindQuest()

                if string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                    if string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local v283, v284, v285 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v286

                            v285, v286 = v283(v284, v285)

                            if v285 == nil then
                                break
                            end
                            if v286:FindFirstChild('Humanoid') and (v286:FindFirstChild('HumanoidRootPart') and (v286.Humanoid.Health > 0 and v286.Name == Ms)) then
                                repeat
                                    wait(0)

                                    bringmob = true

                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v286.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    v286.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v286.HumanoidRootPart.Transparency = 1
                                    v286.Humanoid.JumpPower = 0
                                    v286.Humanoid.WalkSpeed = 0
                                    v286.HumanoidRootPart.CanCollide = false
                                    FarmPos = v286.HumanoidRootPart.CFrame
                                    MonFarm = v286.Name
                                until not _G.LevelFarm or (not v286.Parent or v286.Humanoid.Health <= 0) or (not game:GetService('Workspace').Enemies:FindFirstChild(v286.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)

                                bringmob = false
                            end
                        end

                        local v287, v288, v289 = pairs(game:GetService('Workspace')._WorldOrigin.EnemySpawns:GetChildren())

                        while true do
                            local v290

                            v289, v290 = v287(v288, v289)

                            if v289 == nil then
                                break
                            end
                            if string.find(v290.Name, NameMon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v290.Position).Magnitude >= 10 then
                                Tween(v290.CFrame * CFrame.new(posX, posY, posZ))
                            end
                        end
                    end
                else
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')

                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <= 2500 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude < 2500 then
                                Tween(CFrameQ)
                            end
                        else
                            BTP(CFrameQ)
                        end
                    else
                        Tween(CFrameQ)
                    end
                    if (CFrameQ.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuest, QuestLv)
                    end
                end
            end)
        end
    end
end)
v3.Main:AddToggle('ToggleMobAura', {
    Title = 'Farm Near',
    Default = false,
}):OnChanged(function(p291)
    _G.AutoNear = p291
end)
_Options.ToggleMobAura:SetValue(false)
spawn(function()
    while wait(0.1) do
        if _G.AutoNear then
            pcall(function()
                local v292, v293, v294 = pairs(game.Workspace.Enemies:GetChildren())

                while true do
                    local v295

                    v294, v295 = v292(v293, v294)

                    if v294 == nil then
                        break
                    end
                    if v295:FindFirstChild('Humanoid') and (v295:FindFirstChild('HumanoidRootPart') and (v295.Humanoid.Health > 0 and (v295.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v295:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 5000))) then
                        repeat
                            wait(0)

                            bringmob = true

                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(v295.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                            v295.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                            v295.HumanoidRootPart.Transparency = 1
                            v295.Humanoid.JumpPower = 0
                            v295.Humanoid.WalkSpeed = 0
                            v295.HumanoidRootPart.CanCollide = false
                            FarmPos = v295.HumanoidRootPart.CFrame
                            MonFarm = v295.Name
                        until not _G.AutoNear or (not v295.Parent or v295.Humanoid.Health <= 0) or not game.Workspace.Enemies:FindFirstChild(v295.Name)

                        bringmob = false
                    end
                end
            end)
        end
    end
end)
v3.Main:AddToggle('ToggleCastleRaid', {
    Title = 'Auto Castle Raid',
    Default = false,
}):OnChanged(function(p296)
    _G.CastleRaid = p296
end)
_Options.ToggleCastleRaid:SetValue(false)
spawn(function()
    while wait() do
        if _G.CastleRaid then
            pcall(function()
                local v297 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-9, 0.380223751, 3.5881019e-8, 1, -1.06665446e-7, -0.380223751, 1.12297109e-7, 0.924894512)

                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v297.Position).Magnitude <= 2500 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v297.Position).Magnitude < 2500 then
                                Tween(v297)
                            end
                        else
                            BTP(v297)
                        end
                    end
                else
                    local v298, v299, v300 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v301

                        v300, v301 = v298(v299, v300)

                        if v300 == nil then
                            break
                        end
                        if _G.CastleRaid and (v301:FindFirstChild('HumanoidRootPart') and (v301:FindFirstChild('Humanoid') and (v301.Humanoid.Health > 0 and (v301.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
                            repeat
                                wait(0)

                                bringmob = true

                                AutoHaki()
                                EquipTool(SelectWeapon)

                                v301.HumanoidRootPart.CanCollide = false
                                v301.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                                Tween(v301.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                            until v301.Humanoid.Health <= 0 or not (v301.Parent and _G.CastleRaid)

                            bringmob = false
                        end
                    end
                end
            end)
        end
    end
end)
v3.Main:AddSection('Mastery Farm')

local _DropdownMastery = v3.Main:AddDropdown('DropdownMastery', {
    Title = 'Mastery Mode',
    Values = {
        'Level',
        'Near Mobs',
    },
    Multi = false,
    Default = 1,
})

_DropdownMastery:SetValue('Level')
_DropdownMastery:OnChanged(function(p303)
    TypeMastery = p303
end)
v3.Main:AddToggle('ToggleMasteryFruit', {
    Title = 'Auto BF Mastery',
    Default = false,
}):OnChanged(function(p304)
    AutoFarmMasDevilFruit = p304
end)
_Options.ToggleMasteryFruit:SetValue(false)

local _SliderHealt = v3.Main:AddSlider('SliderHealt', {
    Title = 'Health (%) Mob',
    Description = '',
    Default = 25,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(p305)
        KillPercent = p305
    end,
})

_SliderHealt:OnChanged(function(p307)
    KillPercent = p307
end)
_SliderHealt:SetValue(25)
spawn(function()
    while task.wait(1) do
        if _G.UseSkill then
            pcall(function()
                if not _G.UseSkill then
                    return
                end

                local v308, v309, v310 = pairs(game:GetService('Workspace').Enemies:GetChildren())
                local v311

                v310, v311 = v308(v309, v310)

                if v310 == nil then
                end
                if v311.Name ~= MonFarm or (not v311:FindFirstChild('Humanoid') or (not v311:FindFirstChild('HumanoidRootPart') or v311.Humanoid.Health > v311.Humanoid.MaxHealth * KillPercent / 100)) then
                end

                game:GetService('RunService').Heartbeat:wait()
                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                Tween(v311.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                PositionSkillMasteryDevilFruit = v311.HumanoidRootPart.Position

                if game:GetService('Players').LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                    game:GetService('Players').LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit

                    local _Value2 = game:GetService('Players').LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value

                    if SkillZ and 1 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
                    end
                    if SkillX and 2 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
                        wait(0.2)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
                    end
                    if SkillC and 3 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                        wait(0.3)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                    end
                    if SkillV and 4 <= _Value2 then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'V', false, game)
                        wait(0.4)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'V', false, game)
                    end
                    if SkillF and 5 <= _Value2 then
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'F', false, game)
                        wait(0.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 'F', false, game)
                    end
                end
                if AutoFarmMasDevilFruit and (_G.UseSkill and v311.Humanoid.Health ~= 0) then
                else
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait(0.1) do
        if AutoFarmMasDevilFruit and TypeMastery == 'Level' then
            pcall(function()
                CheckLevel(SelectMonster)

                if not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')

                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <= 2500 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude < 2500 then
                                Tween(CFrameQ)
                            end
                        else
                            BTP(CFrameQ)
                            wait(0.2)
                        end
                    else
                        Tween(CFrameQ)
                    end
                    if (CFrameQ.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', NameQuest, QuestLv)
                    end
                end
                if not string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                    return
                end

                local v313, v314, v315 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v316

                    v315, v316 = v313(v314, v315)

                    if v315 == nil then
                    end
                    if v316:FindFirstChild('Humanoid') and (v316:FindFirstChild('HumanoidRootPart') and v316.Name == Ms) then
                        if true then
                            game:GetService('RunService').Heartbeat:wait()

                            if v316.Humanoid.Health > v316.Humanoid.MaxHealth * KillPercent / 100 then
                                _G.UseSkill = false

                                AutoHaki()

                                bringmob = true

                                EquipTool(SelectWeapon)
                                Tween(v316.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                v316.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                v316.HumanoidRootPart.Transparency = 1
                                v316.Humanoid.JumpPower = 0
                                v316.Humanoid.WalkSpeed = 0
                                v316.HumanoidRootPart.CanCollide = false
                                FarmPos = v316.HumanoidRootPart.CFrame
                                MonFarm = v316.Name

                                NormalAttack()
                            else
                                _G.UseSkill = true
                            end
                        end
                        if AutoFarmMasDevilFruit and (v316.Parent and v316.Humanoid.Health ~= 0) and (game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false and (game:GetService('Workspace').Enemies:FindFirstChild(v316.Name) and not TypeMastery ~= 'Level')) then
                        end

                        bringmob = false
                        _G.UseSkill = false
                    end
                end
            end)
        elseif AutoFarmMasDevilFruit and TypeMastery == 'Near Mobs' then
            pcall(function()
                local v317, v318, v319 = pairs(game.Workspace.Enemies:GetChildren())

                while true do
                    local v320

                    v319, v320 = v317(v318, v319)

                    if v319 == nil then
                        return
                    end
                    if v320.Name and (v320:FindFirstChild('Humanoid') and (v320:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v320:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 5000)) then
                        repeat
                            if true then
                                game:GetService('RunService').Heartbeat:wait()

                                if v320.Humanoid.Health > v320.Humanoid.MaxHealth * KillPercent / 100 then
                                    _G.UseSkill = false

                                    AutoHaki()

                                    bringmob = true

                                    EquipTool(SelectWeapon)
                                    Tween(v320.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    v320.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    v320.HumanoidRootPart.Transparency = 1
                                    v320.Humanoid.JumpPower = 0
                                    v320.Humanoid.WalkSpeed = 0
                                    v320.HumanoidRootPart.CanCollide = false
                                    FarmPos = v320.HumanoidRootPart.CFrame
                                    MonFarm = v320.Name

                                    NormalAttack()
                                else
                                    _G.UseSkill = true
                                end
                            end
                        until not AutoFarmMasDevilFruit or (not MasteryType == 'Near Mobs' or (not v320.Parent or (v320.Humanoid.Health == 0 or not TypeMastery == 'Near Mobs')))

                        bringmob = false
                        _G.UseSkill = false
                    end
                end
            end)
        end
    end
end)
v3.Main:AddSection('Misc Farm')

if Third_Sea then
    v3.Main:AddToggle('ToggleBone', {
        Title = 'Auto Bone',
        Default = false,
    }):OnChanged(function(p321)
        _G.AutoBone = p321
    end)
    _Options.ToggleBone:SetValue(false)

    local u322 = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
    local u323 = CFrame.new(-9359.453125, 141.32679748535156, 5446.81982421875)

    spawn(function()
        while wait() do
            if _G.AutoBone then
                pcall(function()
                    local _Text = game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text

                    if not string.find(_Text, 'Demonic Soul') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')
                    end
                    if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                        if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == true and (game:GetService('Workspace').Enemies:FindFirstChild('Reborn Skeleton') or (game:GetService('Workspace').Enemies:FindFirstChild('Living Zombie') or (game:GetService('Workspace').Enemies:FindFirstChild('Demonic Soul') or game:GetService('Workspace').Enemies:FindFirstChild('Posessed Mummy')))) then
                            local v325, v326, v327 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v328

                                v327, v328 = v325(v326, v327)

                                if v327 == nil then
                                    break
                                end
                                if v328:FindFirstChild('HumanoidRootPart') and (v328:FindFirstChild('Humanoid') and (v328.Humanoid.Health > 0 and (v328.Name == 'Reborn Skeleton' or (v328.Name == 'Living Zombie' or (v328.Name == 'Demonic Soul' or v328.Name == 'Posessed Mummy'))))) then
                                    if string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Demonic Soul') then
                                        repeat
                                            wait(0)
                                            AutoHaki()

                                            bringmob = true

                                            EquipTool(SelectWeapon)
                                            Tween(v328.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                            v328.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                            v328.HumanoidRootPart.Transparency = 1
                                            v328.Humanoid.JumpPower = 0
                                            v328.Humanoid.WalkSpeed = 0
                                            v328.HumanoidRootPart.CanCollide = false
                                            FarmPos = v328.HumanoidRootPart.CFrame
                                            MonFarm = v328.Name
                                        until not _G.AutoBone or (v328.Humanoid.Health <= 0 or not v328.Parent) or game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')

                                        bringmob = false
                                    end
                                end
                            end
                        end
                    else
                        if BypassTP then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - u323.Position).Magnitude <= 2500 then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - u322.Position).Magnitude < 2500 then
                                    Tween(u322)
                                end
                            else
                                BTP(u323)
                            end
                        else
                            Tween(u322)
                        end
                        if (u322.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', 'HauntedQuest2', 1)
                        end
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('ToggleCake', {
        Title = 'Auto Cake Prince',
        Default = false,
    }):OnChanged(function(p329)
        _G.CakePrince = p329
    end)
    _Options.ToggleCake:SetValue(false)
    spawn(function()
        while wait() do
            if _G.CakePrince then
                pcall(function()
                    local v330 = CFrame.new(-2142.66821, 71.2588654, -12327.4619, 0.996939838, -4.33107843e-8, 0.078172572, 4.20252917e-8, 1, 1.8089425099999998e-8, -0.078172572, -1.47488439e-8, 0.996939838)

                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v330.Position).Magnitude <= 2000 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v330.Position).Magnitude < 2000 then
                                Tween(v330)
                            end
                        else
                            BTP(v330)
                            wait(3)
                        end
                    end
                    if game.ReplicatedStorage:FindFirstChild('Cake Prince') or game:GetService('Workspace').Enemies:FindFirstChild('Cake Prince') then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Cake Prince') then
                            local v331, v332, v333 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v334

                                v333, v334 = v331(v332, v333)

                                if v333 == nil then
                                    break
                                end
                                if v334.Name == 'Cake Prince' then
                                    repeat
                                        wait(0)
                                        AutoHaki()
                                        EquipTool(SelectWeapon)

                                        v334.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                        v334.HumanoidRootPart.CanCollide = false

                                        Tween(v334.HumanoidRootPart.CFrame * Pos)
                                    until _G.CakePrince == false or (not v334.Parent or v334.Humanoid.Health <= 0)

                                    bringmob = false
                                end
                            end
                        else
                            Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
                        end
                    elseif game.Workspace.Enemies:FindFirstChild('Baking Staff') or (game.Workspace.Enemies:FindFirstChild('Head Baker') or (game.Workspace.Enemies:FindFirstChild('Cake Guard') or game.Workspace.Enemies:FindFirstChild('Cookie Crafter'))) then
                        local v335, v336, v337 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v338

                            v337, v338 = v335(v336, v337)

                            if v337 == nil then
                                break
                            end
                            if (v338.Name == 'Baking Staff' or (v338.Name == 'Head Baker' or (v338.Name == 'Cake Guard' or v338.Name == 'Cookie Crafter'))) and v338.Humanoid.Health > 0 then
                                repeat
                                    wait(0)
                                    AutoHaki()

                                    bringmob = true

                                    EquipTool(SelectWeapon)

                                    v338.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    FarmPos = v338.HumanoidRootPart.CFrame
                                    MonFarm = v338.Name

                                    Tween(v338.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                until _G.CakePrince == false or (game:GetService('ReplicatedStorage'):FindFirstChild('Cake Prince') or (not v338.Parent or v338.Humanoid.Health <= 0))

                                bringmob = false
                            end
                        end
                    else
                        Tween(v330)
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('ToggleSpawnCake', {
        Title = 'Auto Spawn Cake Prince',
        Default = true,
    }):OnChanged(function(p339)
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CakePrinceSpawner', p339)
    end)
    _Options.ToggleSpawnCake:SetValue(true)
end
if Second_Sea then
    v3.Main:AddToggle('ToggleVatChatKiDi', {
        Title = 'Auto Ectoplasm',
        Default = false,
    }):OnChanged(function(p340)
        _G.Ectoplasm = p340
    end)
    _Options.ToggleVatChatKiDi:SetValue(false)
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.Ectoplasm then
                    if game:GetService('Workspace').Enemies:FindFirstChild('Ship Deckhand') or (game:GetService('Workspace').Enemies:FindFirstChild('Ship Engineer') or (game:GetService('Workspace').Enemies:FindFirstChild('Ship Steward') or game:GetService('Workspace').Enemies:FindFirstChild('Ship Officer'))) then
                        local v341, v342, v343 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v344

                            v343, v344 = v341(v342, v343)

                            if v343 == nil then
                                break
                            end
                            if (v344.Name == 'Ship Steward' or (v344.Name == 'Ship Engineer' or (v344.Name == 'Ship Deckhand' or v344.Name == 'Ship Officer' and v344:FindFirstChild('Humanoid')))) and v344.Humanoid.Health > 0 then
                                repeat
                                    wait(0)
                                    AutoHaki()

                                    bringmob = true

                                    EquipTool(SelectWeapon)
                                    Tween(v344.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    v344.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v344.HumanoidRootPart.Transparency = 1
                                    v344.Humanoid.JumpPower = 0
                                    v344.Humanoid.WalkSpeed = 0
                                    v344.HumanoidRootPart.CanCollide = false
                                    FarmPos = v344.HumanoidRootPart.CFrame
                                    MonFarm = v344.Name
                                until _G.Ectoplasm == false or (not v344.Parent or v344.Humanoid.Health == 0) or not game:GetService('Workspace').Enemies:FindFirstChild(v344.Name)

                                bringmob = false
                            end
                        end
                    else
                        if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end

                        Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                    end
                end
            end)
        end
    end)
end

v3.Main:AddSection('Boss Farm')

if First_Sea then
    tableBoss = {
        'DauCoGhe Raid Boss [Lv. 7000]',
        'The Gorilla King',
        'Bobby',
        'Yeti',
        'Mob Leader',
        'Vice Admiral',
        'Warden',
        'Chief Warden',
        'Swan',
        'Magma Admiral',
        'Fishman Lord',
        'Wysper',
        'Thunder God',
        'Cyborg',
        'Saber Expert',
    }
elseif Second_Sea then
    tableBoss = {
        'DauCoGhe Raid Boss [Lv. 8000]',
        'Diamond',
        'Jeremy',
        'Fajita',
        'Don Swan',
        'Smoke Admiral',
        'Cursed Captain',
        'Darkbeard',
        'Order',
        'Awakened Ice Admiral',
        'Tide Keeper',
    }
elseif Third_Sea then
    tableBoss = {
        'DauCoGhe Raid Boss [Lv. 9000]',
        'Stone',
        'Island Empress',
        'Kilo Admiral',
        'Captain Elephant',
        'Beautiful Pirate',
        'rip_indra True Form',
        'Longma',
        'Soul Reaper',
        'Cake Queen',
    }
end

local _DropdownBoss = v3.Main:AddDropdown('DropdownBoss', {
    Title = 'Dropdown',
    Values = tableBoss,
    Multi = false,
    Default = 1,
})

_DropdownBoss:SetValue('')
_DropdownBoss:OnChanged(function(p346)
    _G.SelectBoss = p346
end)
v3.Main:AddToggle('ToggleAutoFarmBoss', {
    Title = 'Kill Boss',
    Default = false,
}):OnChanged(function(p347)
    _G.AutoBoss = p347
end)
_Options.ToggleAutoFarmBoss:SetValue(false)
spawn(function()
    while wait() do
        if _G.AutoBoss and BypassTP then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild(_G.SelectBoss) then
                    local v348, v349, v350 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v351

                        v350, v351 = v348(v349, v350)

                        if v350 == nil then
                            break
                        end
                        if v351.Name == _G.SelectBoss and (v351:FindFirstChild('Humanoid') and (v351:FindFirstChild('HumanoidRootPart') and v351.Humanoid.Health > 0)) then
                            repeat
                                wait(0)
                                AutoHaki()

                                bringmob = true

                                EquipTool(SelectWeapon)

                                v351.HumanoidRootPart.CanCollide = false
                                v351.Humanoid.WalkSpeed = 0
                                v351.HumanoidRootPart.Size = Vector3.new(80, 80, 80)

                                Tween(v351.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                            until not _G.AutoBoss or (not v351.Parent or v351.Humanoid.Health <= 0)

                            bringmob = false
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                    if (game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 1500 then
                        BTP(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                    else
                        Tween(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoBoss and not BypassTP then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild(_G.SelectBoss) then
                    local v352, v353, v354 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v355

                        v354, v355 = v352(v353, v354)

                        if v354 == nil then
                            break
                        end
                        if v355.Name == _G.SelectBoss and (v355:FindFirstChild('Humanoid') and (v355:FindFirstChild('HumanoidRootPart') and v355.Humanoid.Health > 0)) then
                            repeat
                                wait(0)
                                AutoHaki()

                                bringmob = true

                                EquipTool(SelectWeapon)

                                v355.HumanoidRootPart.CanCollide = false
                                v355.Humanoid.WalkSpeed = 0
                                v355.HumanoidRootPart.Size = Vector3.new(80, 80, 80)

                                Tween(v355.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)
                            until not _G.AutoBoss or (not v355.Parent or v355.Humanoid.Health <= 0)

                            bringmob = false
                        end
                    end
                elseif game:GetService('ReplicatedStorage'):FindFirstChild(_G.SelectBoss) then
                    Tween(game:GetService('ReplicatedStorage'):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                end
            end)
        end
    end
end)
v3.Main:AddSection('Material Farm')

if First_Sea then
    MaterialList = {
        'Scrap Metal',
        'Leather',
        'Angel Wings',
        'Magma Ore',
        'Fish Tail',
    }
elseif Second_Sea then
    MaterialList = {
        'Scrap Metal',
        'Leather',
        'Radioactive Material',
        'Mystic Droplet',
        'Magma Ore',
        'Vampire Fang',
    }
elseif Third_Sea then
    MaterialList = {
        'Scrap Metal',
        'Leather',
        'Demonic Wisp',
        'Conjured Cocoa',
        'Dragon Scale',
        'Gunpowder',
        'Fish Tail',
        'Mini Tusk',
    }
end

local _DropdownMaterial = v3.Main:AddDropdown('DropdownMaterial', {
    Title = 'Dropdown',
    Values = MaterialList,
    Multi = false,
    Default = 1,
})

_DropdownMaterial:SetValue('Conjured Cocoa')
_DropdownMaterial:OnChanged(function(p357)
    SelectMaterial = p357
end)
v3.Main:AddToggle('ToggleMaterial', {
    Title = 'Auto Material',
    Default = false,
}):OnChanged(function(p358)
    _G.AutoMaterial = p358
end)
_Options.ToggleMaterial:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon(SelectMaterial)

                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position).Magnitude <= 3500 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position).Magnitude < 3500 then
                            Tween(MPos)
                        end
                    else
                        BTP(MPos)
                    end
                else
                    Tween(MPos)
                end
                if game:GetService('Workspace').Enemies:FindFirstChild(MMon) then
                    local v359, v360, v361 = pairs(game.Workspace.Enemies:GetChildren())

                    while true do
                        local v362

                        v361, v362 = v359(v360, v361)

                        if v361 == nil then
                            break
                        end
                        if v362:FindFirstChild('Humanoid') and (v362:FindFirstChild('HumanoidRootPart') and (v362.Humanoid.Health > 0 and v362.Name == MMon)) then
                            repeat
                                wait(0)
                                AutoHaki()

                                bringmob = true

                                EquipTool(SelectWeapon)
                                Tween(v362.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                v362.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v362.HumanoidRootPart.Transparency = 1
                                v362.Humanoid.JumpPower = 0
                                v362.Humanoid.WalkSpeed = 0
                                v362.HumanoidRootPart.CanCollide = false
                                FarmPos = v362.HumanoidRootPart.CFrame
                                MonFarm = v362.Name
                            until not _G.AutoMaterial or (not v362.Parent or v362.Humanoid.Health <= 0)

                            bringmob = false
                        end
                    end
                else
                    local v363, v364, v365 = pairs(game:GetService('Workspace')._WorldOrigin.EnemySpawns:GetChildren())

                    while true do
                        local v366

                        v365, v366 = v363(v364, v365)

                        if v365 == nil then
                            break
                        end
                        if string.find(v366.Name, Mon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v366.Position).Magnitude >= 10 then
                            Tween(v366.CFrame * CFrame.new(posX, posY, posZ))
                        end
                    end
                end
            end)
        end
    end
end)

if Third_Sea then
    v3.Main:AddSection('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Kitsune \u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}')
    v3.Main:AddToggle('ToggleEspKitsune', {
        Title = 'Esp Kitsune Island',
        Default = false,
    }):OnChanged(function(p367)
        KitsuneEsp = p367

        while IslandESP do
            wait()
            UpdateKitsune()
        end
    end)
    _Options.ToggleEspKitsune:SetValue(false)

    function UpdateKitsune()
        local v368, v369, v370 = pairs(game:GetService('Workspace').Map.KitsuneIsalnd.ShrineActive:GetChildren())

        while true do
            local u371

            v370, u371 = v368(v369, v370)

            if v370 == nil then
                break
            end

            pcall(function()
                if KitsuneEsp then
                    if u371.Name ~= 'NeonShrinePart' then
                        if u371:FindFirstChild('IslandESP') then
                            u371.IslandESP.TextLabel.Text = 'Kitsune Island'
                        else
                            local _BillboardGui25 = Instance.new('BillboardGui', u371)

                            _BillboardGui25.Name = 'IslandESP'
                            _BillboardGui25.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui25.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui25.Adornee = u371
                            _BillboardGui25.AlwaysOnTop = true

                            local _TextLabel25 = Instance.new('TextLabel', _BillboardGui25)

                            _TextLabel25.Font = 'Code'
                            _TextLabel25.FontSize = 'Size14'
                            _TextLabel25.TextWrapped = true
                            _TextLabel25.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel25.TextYAlignment = 'Top'
                            _TextLabel25.BackgroundTransparency = 1
                            _TextLabel25.TextStrokeTransparency = 0.5
                            _TextLabel25.TextColor3 = Color3.fromRGB(80, 245, 245)
                            _TextLabel25.Text = 'Kitsune Island'
                        end
                    end
                elseif u371:FindFirstChild('IslandESP') then
                    u371:FindFirstChild('IslandESP'):Destroy()
                end
            end)
        end
    end

    v3.Main:AddToggle('ToggleTPKitsune', {
        Title = 'Tween To Kitsune Island',
        Default = false,
    }):OnChanged(function(p374)
        _G.TweenToKitsune = p374
    end)
    _Options.ToggleTPKitsune:SetValue(false)
    spawn(function()
        local v375 = nil

        while not v375 do
            v375 = game:GetService('Workspace').Map:FindFirstChild('KitsuneIsland')

            wait(1)
        end
        while wait() do
            if _G.TweenToKitsune then
                local _ShrineActive = v375:FindFirstChild('ShrineActive')

                if _ShrineActive then
                    local v377, v378, v379 = pairs(_ShrineActive:GetDescendants())

                    while true do
                        local v380

                        v379, v380 = v377(v378, v379)

                        if v379 == nil then
                            break
                        end
                        if v380:IsA('BasePart') and v380.Name:find('NeonShrinePart') then
                            Tween(v380.CFrame)
                        end
                    end
                end
            end
        end
    end)
    v3.Main:AddToggle('ToggleCollectAzure', {
        Title = 'Collect Azure Ambers',
        Default = false,
    }):OnChanged(function(p381)
        _G.CollectAzure = p381
    end)
    _Options.ToggleCollectAzure:SetValue(false)
    spawn(function()
        while wait() do
            if _G.CollectAzure then
                pcall(function()
                    if game:GetService('Workspace'):FindFirstChild('AttachedAzureEmber') then
                        Tween(game:GetService('Workspace'):WaitForChild('EmberTemplate'):FindFirstChild('Part').CFrame)
                        print('Azure')
                    end
                end)
            end
        end
    end)
end
if Third_Sea then
    v3.Main:AddSection('Rough Sea')
    v3.Main:AddToggle('ToggleSailBoat', {
        Title = 'Auto Buy Ship',
        Default = false,
    }):OnChanged(function(p382)
        _G.SailBoat = p382
    end)
    _Options.ToggleSailBoat:SetValue(false)
    spawn(function()
        while wait() do
            pcall(function()
                if not _G.SailBoat or game:GetService('Workspace').Enemies:FindFirstChild('Shark') and (game:GetService('Workspace').Enemies:FindFirstChild('Terrorshark') and (game:GetService('Workspace').Enemies:FindFirstChild('Piranha') and game:GetService('Workspace').Enemies:FindFirstChild('Fish Crew Member'))) then
                    return
                end
                if not game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                    buyb = TweenBoat(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))

                    if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                        if buyb then
                            buyb:Stop()
                        end

                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                            'BuyBoat',
                            'PirateGrandBrigade',
                        }))
                    end
                end
                if not game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                end
                if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit == false then
                    TweenBoat(game:GetService('Workspace').Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                end

                local v383, v384, v385 = pairs(game:GetService('Workspace').Boats:GetChildren())
                local v386

                v385, v386 = v383(v384, v385)

                if v385 == nil then
                end
                if v386.Name ~= 'PirateGrandBrigade' then
                end
                if true then
                    wait()

                    if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 10 then
                        if (CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 10 then
                            if (CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                TweenShip(CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094))
                            end
                        else
                            TweenShip(CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375))
                        end
                    else
                        TweenShip(CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094))
                    end
                end
                if game:GetService('Workspace').Enemies:FindFirstChild('Shark') or (game:GetService('Workspace').Enemies:FindFirstChild('Terrorshark') or (game:GetService('Workspace').Enemies:FindFirstChild('Piranha') or (game:GetService('Workspace').Enemies:FindFirstChild('Fish Crew Member') or _G.SailBoat == false))) then
                else
                end
            end)
        end
    end)
    spawn(function()
        pcall(function()
            while wait() do
                if _G.SailBoat and (game:GetService('Workspace').Enemies:FindFirstChild('Shark') or (game:GetService('Workspace').Enemies:FindFirstChild('Terrorshark') or (game:GetService('Workspace').Enemies:FindFirstChild('Piranha') or game:GetService('Workspace').Enemies:FindFirstChild('Fish Crew Member')))) then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            end
        end)
    end)
    v3.Main:AddToggle('ToggleTerrorshark', {
        Title = ' Kill Terrorshark',
        Default = false,
    }):OnChanged(function(p387)
        _G.AutoTerrorshark = p387
    end)
    _Options.ToggleTerrorshark:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoTerrorshark then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Terrorshark') then
                        local v388, v389, v390 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v391

                            v390, v391 = v388(v389, v390)

                            if v390 == nil then
                                break
                            end
                            if v391.Name == 'Terrorshark' and (v391:FindFirstChild('Humanoid') and (v391:FindFirstChild('HumanoidRootPart') and v391.Humanoid.Health > 0)) then
                                repeat
                                    wait(0)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v391.HumanoidRootPart.CanCollide = false
                                    v391.Humanoid.WalkSpeed = 0
                                    v391.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Tween(v391.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                until not _G.AutoTerrorshark or (not v391.Parent or v391.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService('ReplicatedStorage'):FindFirstChild('Terrorshark') then
                        Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Terrorshark').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('TogglePiranha', {
        Title = ' Kill Piranha',
        Default = false,
    }):OnChanged(function(p392)
        _G.farmpiranya = p392
    end)
    _Options.TogglePiranha:SetValue(false)
    spawn(function()
        while wait() do
            if _G.farmpiranya then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Piranha') then
                        local v393, v394, v395 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v396

                            v395, v396 = v393(v394, v395)

                            if v395 == nil then
                                break
                            end
                            if v396.Name == 'Piranha' and (v396:FindFirstChild('Humanoid') and (v396:FindFirstChild('HumanoidRootPart') and v396.Humanoid.Health > 0)) then
                                repeat
                                    wait(0)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v396.HumanoidRootPart.CanCollide = false
                                    v396.Humanoid.WalkSpeed = 0
                                    v396.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Tween(v396.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                until not _G.farmpiranya or (not v396.Parent or v396.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService('ReplicatedStorage'):FindFirstChild('Piranha') then
                        Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Piranha').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('ToggleShark', {
        Title = ' Kill Shark',
        Default = false,
    }):OnChanged(function(p397)
        _G.AutoShark = p397
    end)
    _Options.ToggleShark:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoShark then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Shark') then
                        local v398, v399, v400 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v401

                            v400, v401 = v398(v399, v400)

                            if v400 == nil then
                                break
                            end
                            if v401.Name == 'Shark' and (v401:FindFirstChild('Humanoid') and (v401:FindFirstChild('HumanoidRootPart') and v401.Humanoid.Health > 0)) then
                                repeat
                                    wait(0)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v401.HumanoidRootPart.CanCollide = false
                                    v401.Humanoid.WalkSpeed = 0
                                    v401.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Tween(v401.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoShark or (not v401.Parent or v401.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(game:GetService('Workspace').Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))

                        if game:GetService('ReplicatedStorage'):FindFirstChild('Terrorshark') then
                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Terrorshark').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('ToggleFishCrew', {
        Title = ' Kill Fish Crew',
        Default = false,
    }):OnChanged(function(p402)
        _G.AutoFishCrew = p402
    end)
    _Options.ToggleFishCrew:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoFishCrew then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Fish Crew Member') then
                        local v403, v404, v405 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v406

                            v405, v406 = v403(v404, v405)

                            if v405 == nil then
                                break
                            end
                            if v406.Name == 'Fish Crew Member' and (v406:FindFirstChild('Humanoid') and (v406:FindFirstChild('HumanoidRootPart') and v406.Humanoid.Health > 0)) then
                                repeat
                                    wait(0)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v406.HumanoidRootPart.CanCollide = false
                                    v406.Humanoid.WalkSpeed = 0
                                    v406.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Tween(v406.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoFishCrew or (not v406.Parent or v406.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(game:GetService('Workspace').Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))

                        if game:GetService('ReplicatedStorage'):FindFirstChild('Fish Crew Member') then
                            Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Fish Crew Member').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('ToggleShip', {
        Title = 'Kill Ship',
        Default = false,
    }):OnChanged(function(p407)
        _G.Ship = p407
    end)
    _Options.ToggleShip:SetValue(false)

    function CheckPirateBoat()
        local v408 = next
        local v409, v410 = game:GetService('Workspace').Enemies:GetChildren()
        local v411 = {
            'PirateGrandBrigade',
            'PirateBrigade',
        }

        while true do
            local v412

            v410, v412 = v408(v409, v410)

            if v410 == nil then
                break
            end
            if table.find(v411, v412.Name) and (v412:FindFirstChild('Health') and v412.Health.Value > 0) then
                return v412
            end
        end
    end

    spawn(function()
        while wait() do
            if _G.Ship then
                pcall(function()
                    if CheckPirateBoat() then
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 32, false, game)
                        wait(0.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 32, false, game)

                        local v413 = CheckPirateBoat()

                        repeat
                            wait()
                            spawn(Tween(v413.Engine.CFrame * CFrame.new(0, -20, 0)), 1)

                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                            Skillaimbot = true
                            AutoSkill = false
                        until not v413 or (not v413.Parent or (v413.Health.Value <= 0 or not CheckPirateBoat()))

                        Skillaimbot = true
                        AutoSkill = false
                    end
                end)
            end
        end
    end)
    v3.Main:AddToggle('ToggleGhostShip', {
        Title = 'Kill Ghost Ship',
        Default = false,
    }):OnChanged(function(p414)
        _G.GhostShip = p414
    end)
    _Options.ToggleGhostShip:SetValue(false)

    function CheckPirateBoat()
        local v415 = next
        local v416, v417 = game:GetService('Workspace').Enemies:GetChildren()
        local v418 = {
            'FishBoat',
        }

        while true do
            local v419

            v417, v419 = v415(v416, v417)

            if v417 == nil then
                break
            end
            if table.find(v418, v419.Name) and (v419:FindFirstChild('Health') and v419.Health.Value > 0) then
                return v419
            end
        end
    end

    spawn(function()
        while wait() do
            pcall(function()
                if _G.bjirFishBoat and CheckPirateBoat() then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 32, false, game)
                    wait(0.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 32, false, game)

                    local v420 = CheckPirateBoat()

                    repeat
                        wait()
                        spawn(Tween(v420.Engine.CFrame * CFrame.new(0, -20, 0), 1))

                        AutoSkill = true
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    until v420.Parent or (v420.Health.Value <= 0 or not CheckPirateBoat())

                    AutoSkill = false
                    Skillaimbot = false
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            if _G.bjirFishBoat then
                pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki()
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))

                        local v421, v422, v423 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v424

                            v423, v424 = v421(v422, v423)

                            if v423 == nil then
                                break
                            end
                            if v424:IsA('Tool') and v424.ToolTip == 'Melee' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v424)
                            end
                        end

                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 'C', false, game.Players.LocalPlayer.Character.HumanoidRootPart)

                        local v425, v426, v427 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v428

                            v427, v428 = v425(v426, v427)

                            if v427 == nil then
                                break
                            end
                            if v428:IsA('Tool') and v428.ToolTip == 'Blox Fruit' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v428)
                            end
                        end

                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'V', false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 'V', false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.6)

                        local v429, v430, v431 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v432

                            v431, v432 = v429(v430, v431)

                            if v431 == nil then
                                break
                            end
                            if v432:IsA('Tool') and v432.ToolTip == 'Sword' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v432)
                            end
                        end

                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)

                        local v433, v434, v435 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                        while true do
                            local v436

                            v435, v436 = v433(v434, v435)

                            if v435 == nil then
                                break
                            end
                            if v436:IsA('Tool') and v436.ToolTip == 'Gun' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v436)
                            end
                        end

                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end)
            end
        end
    end)
    v3.Main:AddSection('Elite Hunter Farm')
    v3.Main:AddToggle('ToggleElite', {
        Title = 'Auto Elite Hunter',
        Default = false,
    }):OnChanged(function(p437)
        _G.AutoElite = p437
    end)
    _Options.ToggleElite:SetValue(false)
    spawn(function()
        while task.wait() do
            if _G.AutoElite then
                pcall(function()
                    if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EliteHunter')
                    elseif string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Diablo') or (string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Deandre') or string.find(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Urban')) then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Diablo') or (game:GetService('Workspace').Enemies:FindFirstChild('Deandre') or game:GetService('Workspace').Enemies:FindFirstChild('Urban')) then
                            local v438, v439, v440 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v441

                                v440, v441 = v438(v439, v440)

                                if v440 == nil then
                                    break
                                end
                                if v441:FindFirstChild('Humanoid') and (v441:FindFirstChild('HumanoidRootPart') and (v441.Humanoid.Health > 0 and (v441.Name == 'Diablo' or (v441.Name == 'Deandre' or v441.Name == 'Urban')))) then
                                    repeat
                                        wait(0)
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        toTarget(v441.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                        MonsterPosition = v441.HumanoidRootPart.CFrame
                                        v441.HumanoidRootPart.CFrame = v441.HumanoidRootPart.CFrame
                                        v441.Humanoid.JumpPower = 0
                                        v441.Humanoid.WalkSpeed = 0
                                        v441.HumanoidRootPart.CanCollide = false
                                        v441.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    until _G.AutoElite == false or (v441.Humanoid.Health <= 0 or not v441.Parent)
                                end
                            end
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Diablo') then
                            toTarget(game:GetService('ReplicatedStorage'):FindFirstChild('Diablo').HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Deandre') then
                            toTarget(game:GetService('ReplicatedStorage'):FindFirstChild('Deandre').HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        elseif game:GetService('ReplicatedStorage'):FindFirstChild('Urban') then
                            toTarget(game:GetService('ReplicatedStorage'):FindFirstChild('Urban').HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        end
                    end
                end)
            end
        end
    end)
end
if Third_Sea then
    v3.Main:AddSection('Sea Beast')
    v3.Main:AddToggle('ToggleSeaBeAst', {
        Title = 'Auto Sea Beast',
        Default = false,
    }):OnChanged(function(p442)
        _G.AutoSeaBeast = p442
    end)
    _Options.ToggleSeaBeAst:SetValue(false)

    Skillz = true
    Skillx = true
    Skillc = true
    Skillv = true

    spawn(function()
        while wait() do
            pcall(function()
                if AutoSkill then
                    if Skillz then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
                    end
                    if Skillx then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
                    end
                    if Skillc then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                    end
                    if Skillv then
                        game:service('VirtualInputManager'):SendKeyEvent(true, 'V', false, game)
                        wait(0.1)
                        game:service('VirtualInputManager'):SendKeyEvent(false, 'V', false, game)
                    end
                end
            end)
        end
    end)
    task.spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoSeaBeast then
                    if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') then
                        if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') then
                            local v443, v444, v445 = pairs(game:GetService('Workspace').SeaBeasts:GetChildren())

                            while true do
                                local v446

                                v445, v446 = v443(v444, v445)

                                if v445 == nil then
                                    break
                                end
                                if v446:FindFirstChild('HumanoidRootPart') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TweenBoat(v446.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                        EquipAllWeapon()

                                        AutoSkill = true
                                        AimBotSkillPosition = v446.HumanoidRootPart
                                        Skillaimbot = true
                                    until not v446:FindFirstChild('HumanoidRootPart') or _G.AutoSeaBeast == false

                                    AutoSkill = false
                                    Skillaimbot = false
                                end
                            end
                        end
                    elseif game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                        if game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                            local v447, v448, v449 = pairs(game:GetService('Workspace').Boats:GetChildren())

                            while true do
                                local v450

                                v449, v450 = v447(v448, v449)

                                if v449 == nil then
                                    break
                                end
                                if v450.Name == 'PirateGrandBrigade' and v450:FindFirstChild('VehicleSeat') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TweenBoat(v450.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    until not game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') or _G.AutoSeaBeast == false
                                end
                            end
                        end
                    else
                        if not game:GetService('Workspace').Boats:FindFirstChild('PirateBasic') then
                            if not game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                                buyb = TweenBoat(CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625))

                                if (CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    if buyb then
                                        buyb:Stop()
                                    end

                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                                        'BuyBoat',
                                        'PirateGrandBrigade',
                                    }))
                                end
                            end
                            if not game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                            end
                            if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit == false then
                                TweenBoat(game:GetService('Workspace').Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                            end
                            if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit ~= true then
                            end

                            wait()

                            if (game:GetService('Workspace').Boats.PirateGrandBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                TweenShip(CFrame.new(35.04552459716797, 17.750778198242188, 4819.267578125))
                            end
                            if game:GetService('Workspace').SeaBeasts:FindFirstChild('SeaBeast1') or _G.AutoSeaBeast == false then
                            end
                        end
                        if game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') then
                            local v451, v452, v453 = pairs(game:GetService('Workspace').Boats:GetChildren())

                            while true do
                                local v454

                                v453, v454 = v451(v452, v453)

                                if v453 == nil then
                                    break
                                end
                                if v454.Name == 'PirateGrandBrigade' and v454:FindFirstChild('VehicleSeat') then
                                    repeat
                                        wait()

                                        game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Sit = false

                                        TweenBoat(v454.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    until not game:GetService('Workspace').Boats:FindFirstChild('PirateGrandBrigade') or _G.AutoSeaBeast == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    v3.Main:AddToggle('ToggleAutoW', {
        Title = 'Auto Press W',
        Default = false,
    }):OnChanged(function(p455)
        _G.AutoW = p455
    end)
    _Options.ToggleAutoW:SetValue(false)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoW then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'W', false, game)
                end
            end)
        end
    end)
    v3.Main:AddSection('Mirage Island')
    v3.Main:AddToggle('ToggleTweenMirageIsland', {
        Title = 'Tween To Mirage Island',
        Default = false,
    }):OnChanged(function(p456)
        _G.AutoMysticIsland = p456
    end)
    _Options.ToggleTweenMirageIsland:SetValue(false)
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoMysticIsland and game:GetService('Workspace').Map:FindFirstChild('MysticIsland') then
                    Tween(CFrame.new(game:GetService('Workspace').Map.MysticIsland.Center.Position.X, 500, game:GetService('Workspace').Map.MysticIsland.Center.Position.Z))
                end
            end
        end)
    end)
    v3.Main:AddToggle('ToggleTweenGear', {
        Title = 'Tween To Gear',
        Default = false,
    }):OnChanged(function(p457)
        _G.TweenToGear = p457
    end)
    _Options.ToggleTweenGear:SetValue(false)
    spawn(function()
        pcall(function()
            while wait() do
                if _G.TweenToGear and game:GetService('Workspace').Map:FindFirstChild('MysticIsland') then
                    local v458, v459, v460 = pairs(game:GetService('Workspace').Map.MysticIsland:GetChildren())

                    while true do
                        local v461

                        v460, v461 = v458(v459, v460)

                        if v460 == nil then
                            break
                        end
                        if v461:IsA('MeshPart') and v461.Material == Enum.Material.Neon then
                            Tween(v461.CFrame)
                        end
                    end
                end
            end
        end)
    end)
    v3.Main:AddToggle('Togglelockmoon', {
        Title = 'Lock Moon and Use Race Skill',
        Default = false,
    }):OnChanged(function(p462)
        _G.AutoLockMoon = p462
    end)
    _Options.Togglelockmoon:SetValue(false)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoLockMoon then
                    local v463 = game.Lighting:GetMoonDirection()
                    local v464 = game.Workspace.CurrentCamera.CFrame.p + v463 * 100

                    game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, v464)
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoLockMoon then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'T', false, game)
                    wait(0.1)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 'T', false, game)
                end
            end)
        end
    end)
    v3.Main:AddToggle('ToggleMirage', {
        Title = 'Auto Mirage Island',
        Default = false,
    }):OnChanged(function(p465)
        _G.AutoSeaBeast = p465
    end)
    _Options.ToggleMirage:SetValue(false)
    v3.Main:AddToggle('AutoW', {
        Title = 'Auto Press W',
        Default = false,
    }):OnChanged(function(p466)
        _G.AutoW = p466
    end)
    _Options.AutoW:SetValue(false)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoW then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'W', false, game)
                end
            end)
        end
    end)
end

v3.Main:AddSection('Items Farm')

if Third_Sea then
    v3.Main:AddToggle('ToggleHallow', {
        Title = 'Auto Hallow Scythe [Fully]',
        Default = false,
    }):OnChanged(function(p467)
        AutoHallowSycthe = p467
    end)
    _Options.ToggleHallow:SetValue(false)
    spawn(function()
        while wait() do
            if AutoHallowSycthe then
                pcall(function()
                    if game:GetService('Workspace').Enemies:FindFirstChild('Soul Reaper') then
                        local v468, v469, v470 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v471

                            v470, v471 = v468(v469, v470)

                            if v470 == nil then
                                break
                            end
                            if string.find(v471.Name, 'Soul Reaper') then
                                repeat
                                    wait(0)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)

                                    v471.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                    Tween(v471.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    v471.HumanoidRootPart.Transparency = 1

                                    sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                                until v471.Humanoid.Health <= 0 or AutoHallowSycthe == false
                            end
                        end
                    elseif game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Hallow Essence') or game:GetService('Players').LocalPlayer.Character:FindFirstChild('Hallow Essence') then
                        repeat
                            Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                            wait()
                        until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8

                        EquipTool('Hallow Essence')
                    elseif game:GetService('ReplicatedStorage'):FindFirstChild('Soul Reaper') then
                        Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Soul Reaper').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait(0.001) do
            if AutoHallowSycthe then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'Bones',
                    'Buy',
                    1,
                    1,
                }))
            end
        end
    end)
    v3.Main:AddToggle('ToggleYama', {
        Title = 'Auto Get Yama',
        Default = false,
    }):OnChanged(function(p472)
        _G.AutoYama = p472
    end)
    _Options.ToggleYama:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoYama and game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EliteHunter', 'Progress') >= 30 then
                repeat
                    wait(0.1)
                    fireclickdetector(game:GetService('Workspace').Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Yama') or not _G.AutoYama
            end
        end
    end)
    v3.Main:AddToggle('ToggleTushita', {
        Title = 'Auto Tushita',
        Default = false,
    }):OnChanged(function(p473)
        AutoTushita = p473
    end)
    _Options.ToggleTushita:SetValue(false)
    spawn(function()
        while true do
            repeat
                if not wait() then
                    return
                end
            until AutoTushita

            if game:GetService('Workspace').Enemies:FindFirstChild('Longma') then
                break
            end

            Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
        end

        local v474, v475, v476 = pairs(game:GetService('Workspace').Enemies:GetChildren())
        local v477

        v476, v477 = v474(v475, v476)

        if v476 ~= nil then
        end
        if v477.Name == ('Longma' or v477.Name == 'Longma') and (v477.Humanoid.Health > 0 and (v477:IsA('Model') and (v477:FindFirstChild('Humanoid') and v477:FindFirstChild('HumanoidRootPart')))) then
        else
        end

        wait(0)
        AutoHaki()

        if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
            wait()
            EquipTool(SelectWeapon)
        end

        FarmPos = v477.HumanoidRootPart.CFrame
        v477.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v477.Humanoid.JumpPower = 0
        v477.Humanoid.WalkSpeed = 0
        v477.HumanoidRootPart.CanCollide = false

        v477.Humanoid:ChangeState(11)
        Tween(v477.HumanoidRootPart.CFrame * Pos)

        if AutoTushita and (v477.Parent and v477.Humanoid.Health > 0) then
        else
        end
    end)
    v3.Main:AddToggle('ToggleHoly', {
        Title = 'Auto Holy Torch',
        Default = false,
    }):OnChanged(function(p478)
        _G.Auto_Holy_Torch = p478
    end)
    _Options.ToggleHoly:SetValue(false)
    spawn(function()
        while wait() do
            if _G.Auto_Holy_Torch then
                pcall(function()
                    wait(1)

                    repeat
                        Tween(CFrame.new(-10752, 417, -9366))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10752, 417, -9366)).Magnitude <= 10

                    wait(1)

                    repeat
                        Tween(CFrame.new(-11672, 334, -9474))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-11672, 334, -9474)).Magnitude <= 10

                    wait(1)

                    repeat
                        Tween(CFrame.new(-12132, 521, -10655))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12132, 521, -10655)).Magnitude <= 10

                    wait(1)

                    repeat
                        Tween(CFrame.new(-13336, 486, -6985))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13336, 486, -6985)).Magnitude <= 10

                    wait(1)

                    repeat
                        Tween(CFrame.new(-13489, 332, -7925))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13489, 332, -7925)).Magnitude <= 10
                end)
            end
        end
    end)
end
if Second_Sea then
    v3.Main:AddToggle('ToggleFactory', {
        Title = 'Auto Farm Factory',
        Default = false,
    }):OnChanged(function(p479)
        _G.Factory = p479
    end)
    _Options.ToggleFactory:SetValue(false)
    spawn(function()
        while true do
            repeat
                if not wait() then
                    return
                end
            until _G.Factory

            if game.Workspace.Enemies:FindFirstChild('Core') then
                break
            end
            if game.ReplicatedStorage:FindFirstChild('Core') then
                Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                wait()

                if _G.Factory and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude > 10 then
                    break
                end
            end
        end

        local v480, v481, v482 = pairs(game.Workspace.Enemies:GetChildren())

        if v483.Name == 'Core' and v483.Humanoid.Health > 0 then
        end

        local v483

        v482, v483 = v480(v481, v482)

        if v482 ~= nil then
        end

        wait(0)

        repeat
            Tween(CFrame.new(448.46756, 199.356781, -441.389252))
            wait()
        until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10

        EquipTool(SelectWeapon)
        AutoHaki()
        Tween(v483.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

        v483.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v483.HumanoidRootPart.Transparency = 1
        v483.Humanoid.JumpPower = 0
        v483.Humanoid.WalkSpeed = 0
        v483.HumanoidRootPart.CanCollide = false
        FarmPos = v483.HumanoidRootPart.CFrame
        MonFarm = v483.Name

        if v483.Parent and (v483.Humanoid.Health > 0 and _G.Factory ~= false) then
        end
    end)
end
if Third_Sea then
    v3.Main:AddToggle('ToggleCakeV2', {
        Title = 'Kill Dought King [Need Spawn]',
        Default = false,
    }):OnChanged(function(p484)
        _G.AutoCakeV2 = p484
    end)
    _Options.ToggleCakeV2:SetValue(false)
end

spawn(function()
    while wait() do
        if _G.AutoCakeV2 then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild('Dough King') then
                    local v485, v486, v487 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v488

                        v487, v488 = v485(v486, v487)

                        if v487 == nil then
                            break
                        end
                        if v488.Name == 'Dough King' and (v488:FindFirstChild('Humanoid') and (v488:FindFirstChild('HumanoidRootPart') and v488.Humanoid.Health > 0)) then
                            repeat
                                wait(0)
                                AutoHaki()
                                EquipTool(SelectWeapon)

                                v488.HumanoidRootPart.CanCollide = false
                                v488.Humanoid.WalkSpeed = 0
                                v488.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                                Tween(v488.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                            until not _G.AutoCakeV2 or (not v488.Parent or v488.Humanoid.Health <= 0)
                        end
                    end
                elseif game:GetService('ReplicatedStorage'):FindFirstChild('Dough King') then
                    Tween(game:GetService('ReplicatedStorage'):FindFirstChild('Dough King').HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

if Second_Sea or Third_Sea then
    v3.Main:AddToggle('ToggleHakiColor', {
        Title = 'Buy Haki Color',
        Default = false,
    }):OnChanged(function(p489)
        _G.Auto_Buy_Enchancement = p489
    end)
    _Options.ToggleHakiColor:SetValue(false)
    spawn(function()
        while wait() do
            if _G.Auto_Buy_Enchancement then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'ColorsDealer',
                    '2',
                }))
            end
        end
    end)
end
if Second_Sea then
    v3.Main:AddToggle('ToggleSwordLengend', {
        Title = 'Buy Sword Lengendary',
        Default = false,
    }):OnChanged(function(p490)
        _G.BuyLengendSword = p490
    end)
    _Options.ToggleSwordLengend:SetValue(false)
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.BuyLengendSword or Triple_A then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                        'LegendarySwordDealer',
                        '2',
                    }))
                else
                    wait(2)
                end
            end)
        end
    end)
end

v3.Setting:AddSection('Setting')
v3.Setting:AddToggle('ToggleFastAttack', {
    Title = 'Fast Attack',
    Default = true,
}):OnChanged(function(p491)
    _G.FastAttack = p491
end)
_Options.ToggleFastAttack:SetValue(true)
v3.Setting:AddToggle('ToggleBringMob', {
    Title = 'Bring Mob',
    Default = true,
}):OnChanged(function(p492)
    _G.BringMob = p492
end)
_Options.ToggleBringMob:SetValue(true)
spawn(function()
    while wait() do
        pcall(function()
            local v493, v494, v495 = pairs(game:GetService('Workspace').Enemies:GetChildren())

            while true do
                local v496

                v495, v496 = v493(v494, v495)

                if v495 == nil then
                    break
                end
                if _G.BringMob and (bringmob and (v496.Name == MonFarm and (v496:FindFirstChild('Humanoid') and v496.Humanoid.Health > 0))) then
                    if v496.Name ~= 'Factory Staff' then
                        if v496.Name == MonFarm and (v496.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 500 then
                            v496.Head.CanCollide = false
                            v496.HumanoidRootPart.CanCollide = false
                            v496.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                            v496.HumanoidRootPart.CFrame = FarmPos

                            sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                        end
                    elseif (v496.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 500 then
                        v496.Head.CanCollide = false
                        v496.HumanoidRootPart.CanCollide = false
                        v496.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                        v496.HumanoidRootPart.CFrame = FarmPos

                        sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                    end
                end
            end
        end)
    end
end)
v3.Setting:AddToggle('ToggleRemove', {
    Title = 'Remove Damage Text',
    Default = true,
}):OnChanged(function(p497)
    _G.rmt = p497
end)
_Options.ToggleRemove:SetValue(true)
spawn(function()
    while wait() do
        if _G.rmt then
            game:GetService('ReplicatedStorage').Assets.GUI.DamageCounter.Enabled = false
        else
            game:GetService('ReplicatedStorage').Assets.GUI.DamageCounter.Enabled = true
        end
    end
end)
v3.Setting:AddToggle('ToggleRemoveNotify', {
    Title = 'Remove Notification',
    Default = false,
}):OnChanged(function(p498)
    RemoveNotify = p498
end)
_Options.ToggleRemoveNotify:SetValue(false)
spawn(function()
    while wait() do
        if RemoveNotify then
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
        else
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
        end
    end
end)
v3.Setting:AddToggle('ToggleWhite', {
    Title = 'WhiteScreen',
    Default = false,
}):OnChanged(function(p499)
    _G.WhiteScreen = p499

    if _G.WhiteScreen ~= true then
        if _G.WhiteScreen == false then
            game:GetService('RunService'):Set3dRenderingEnabled(true)
        end
    else
        game:GetService('RunService'):Set3dRenderingEnabled(false)
    end
end)
_Options.ToggleWhite:SetValue(false)
v3.Setting:AddButton({
    Title = 'FPS Boost',
    Description = 'Reduce Lag',
    Callback = function()
        FPSBooster()
    end,
})

function FPSBooster()
    local v500 = game
    local _Workspace = v500.Workspace
    local _Lighting = v500.Lighting
    local _Terrain = _Workspace.Terrain

    sethiddenproperty(_Lighting, 'Technology', 2)
    sethiddenproperty(_Terrain, 'Decoration', false)

    _Terrain.WaterWaveSize = 0
    _Terrain.WaterWaveSpeed = 0
    _Terrain.WaterReflectance = 0
    _Terrain.WaterTransparency = 0
    _Lighting.GlobalShadows = false
    _Lighting.FogEnd = 9000000000
    _Lighting.Brightness = 0
    settings().Rendering.QualityLevel = 'Level01'

    local v504, v505, v506 = pairs(v500:GetDescendants())
    local v507 = true

    while true do
        local v508

        v506, v508 = v504(v505, v506)

        if v506 == nil then
            break
        end
        if v508:IsA('Part') or (v508:IsA('Union') or (v508:IsA('CornerWedgePart') or v508:IsA('TrussPart'))) then
            v508.Material = 'Plastic'
            v508.Reflectance = 0
        elseif v508:IsA('Decal') or v508:IsA('Texture') and v507 then
            v508.Transparency = 1
        elseif v508:IsA('ParticleEmitter') or v508:IsA('Trail') then
            v508.Lifetime = NumberRange.new(0)
        elseif v508:IsA('Explosion') then
            v508.BlastPressure = 1
            v508.BlastRadius = 1
        elseif v508:IsA('Fire') or (v508:IsA('SpotLight') or (v508:IsA('Smoke') or v508:IsA('Sparkles'))) then
            v508.Enabled = false
        elseif v508:IsA('MeshPart') then
            v508.Material = 'Plastic'
            v508.Reflectance = 0
            v508.TextureID = 1.0385902758728955e16
        end
    end

    local v509, v510, v511 = pairs(_Lighting:GetChildren())

    while true do
        local v512

        v511, v512 = v509(v510, v511)

        if v511 == nil then
            break
        end
        if v512:IsA('BlurEffect') or (v512:IsA('SunRaysEffect') or (v512:IsA('ColorCorrectionEffect') or (v512:IsA('BloomEffect') or v512:IsA('DepthOfFieldEffect')))) then
            v512.Enabled = false
        end
    end
end

v3.Setting:AddSection('Mastery Settings')
v3.Setting:AddToggle('ToggleZ', {
    Title = 'Skill Z',
    Default = true,
}):OnChanged(function(p513)
    SkillZ = p513
end)
_Options.ToggleZ:SetValue(true)
v3.Setting:AddToggle('ToggleX', {
    Title = 'Skill X',
    Default = true,
}):OnChanged(function(p514)
    SkillX = p514
end)
_Options.ToggleX:SetValue(true)
v3.Setting:AddToggle('ToggleC', {
    Title = 'Skill C',
    Default = true,
}):OnChanged(function(p515)
    SkillC = p515
end)
_Options.ToggleC:SetValue(true)
v3.Setting:AddToggle('ToggleV', {
    Title = 'Skill V',
    Default = true,
}):OnChanged(function(p516)
    SkillV = p516
end)
_Options.ToggleV:SetValue(true)
v3.Setting:AddToggle('ToggleF', {
    Title = 'Skill F',
    Default = false,
}):OnChanged(function(p517)
    SkillF = p517
end)
_Options.ToggleF:SetValue(false)

local _DistanceFarm = v3.Setting:AddSection('Distance Farm')
local _SliderPosX = v3.Setting:AddSlider('SliderPosX', {
    Title = 'Pos X',
    Description = '',
    Default = 10,
    Min = -60,
    Max = 60,
    Rounding = 1,
    Callback = function(p519)
        posX = p519
    end,
})

_SliderPosX:OnChanged(function(p521)
    posX = p521
end)
_SliderPosX:SetValue(10)

local _SliderPosY = v3.Setting:AddSlider('SliderPosY', {
    Title = 'Pos Y',
    Description = '',
    Default = 30,
    Min = -60,
    Max = 60,
    Rounding = 1,
    Callback = function(p522)
        posY = p522
    end,
})

_SliderPosY:OnChanged(function(p524)
    posY = p524
end)
_SliderPosY:SetValue(30)

local _SliderPosZ = v3.Setting:AddSlider('SliderPosZ', {
    Title = 'Pos Z',
    Description = '',
    Default = 10,
    Min = -60,
    Max = 60,
    Rounding = 1,
    Callback = function(p525)
        posZ = p525
    end,
})

_SliderPosZ:OnChanged(function(p527)
    posZ = p527
end)
_SliderPosZ:SetValue(10)
v3.Setting:AddToggle('ToggleMelee', {
    Title = 'Add Melee',
    Default = false,
}):OnChanged(function(p528)
    _G.Auto_Stats_Melee = p528
end)
_Options.ToggleMelee:SetValue(false)
v3.Setting:AddToggle('ToggleDe', {
    Title = 'Add Defense',
    Default = false,
}):OnChanged(function(p529)
    _G.Auto_Stats_Defense = p529
end)
_Options.ToggleDe:SetValue(false)
v3.Setting:AddToggle('ToggleSword', {
    Title = 'Add Sword',
    Default = false,
}):OnChanged(function(p530)
    _G.Auto_Stats_Sword = p530
end)
_Options.ToggleSword:SetValue(false)
v3.Setting:AddToggle('ToggleGun', {
    Title = 'Add Gun',
    Default = false,
}):OnChanged(function(p531)
    _G.Auto_Stats_Gun = p531
end)
_Options.ToggleGun:SetValue(false)
v3.Setting:AddToggle('ToggleFruit', {
    Title = 'Add Demon Fruit',
    Default = false,
}):OnChanged(function(p532)
    _G.Auto_Stats_Devil_Fruit = p532
end)
_Options.ToggleFruit:SetValue(false)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Demon Fruit',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Gun',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Sword',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Defense',
                3,
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'AddPoint',
                'Melee',
                3,
            }))
        end
    end
end)

local v533, v534, v535 = pairs(game:GetService('Players'):GetChildren())
local v536 = {}

while true do
    local v537

    v535, v537 = v533(v534, v535)

    if v535 == nil then
        break
    end

    table.insert(v536, v537.Name)
end

v3.Player:AddDropdown('SelectedPly', {
    Title = 'Select Player',
    Values = v536,
    Multi = false,
    Default = 1,
}):OnChanged(function(p538)
    _G.SelectPly = p538
end)
v3.Player:AddToggle('ToggleTeleport', {
    Title = 'Teleport To Player',
    Default = false,
}):OnChanged(function(p539)
    _G.TeleportPly = p539

    pcall(function()
        if _G.TeleportPly then
            repeat
                toTarget(game:GetService('Players')[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                wait()
            until _G.TeleportPly == false
        end
    end)
end)
_Options.ToggleTeleport:SetValue(false)
v3.Player:AddToggle('ToggleQuanSat', {
    Title = 'Spectate Player',
    Default = false,
}):OnChanged(function(p540)
    SpectatePlys = p540

    local _ = game:GetService('Players').LocalPlayer.Character.Humanoid

    game:GetService('Players'):FindFirstChild(_G.SelectPly)

    repeat
        wait(0.1)

        game:GetService('Workspace').Camera.CameraSubject = game:GetService('Players'):FindFirstChild(_G.SelectPly).Character.Humanoid
    until SpectatePlys == false

    game:GetService('Workspace').Camera.CameraSubject = game:GetService('Players').LocalPlayer.Character.Humanoid
end)
_Options.ToggleQuanSat:SetValue(false)
v3.Player:AddSection('PVP')
v3.Player:AddToggle('ToggleAimBotSkill', {
    Title = 'Aimbot Skill',
    Default = false,
}):OnChanged(function(p541)
    Skillaimbot = p541
end)
_Options.ToggleAimBotSkill:SetValue(false)
v3.Player:AddToggle('ToggleAimbotGun', {
    Title = 'Aimbot Gun',
    Default = false,
}):OnChanged(function(p542)
    Aimbot = p542
end)
_Options.ToggleAimbotGun:SetValue(false)

local v543 = getrawmetatable(game)
local ___namecall2 = v543.__namecall

setreadonly(v543, false)

v543.__namecall = newcclosure(function(...)
    local v545 = getnamecallmethod()
    local v546 = {...}

    if tostring(v545) ~= 'FireServer' or (tostring(v546[1]) ~= 'RemoteEvent' or (tostring(v546[2]) == 'true' or (tostring(v546[2]) == 'false' or not Skillaimbot))) then
        return ___namecall2(...)
    end

    v546[2] = AimBotSkillPosition

    return ___namecall2(unpack(v546))
end)

spawn(function()
    while wait() do
        local v547, v548, v549 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

        while true do
            local v550

            v549, v550 = v547(v548, v549)

            if v549 == nil then
                break
            end
            if v550:IsA('Tool') and v550:FindFirstChild('RemoteFunctionShoot') then
                SelectToolWeaponGun = v550.Name
            end
        end

        local v551, v552, v553 = pairs(game.Players.LocalPlayer.Character:GetChildren())

        while true do
            local v554

            v553, v554 = v551(v552, v553)

            if v553 == nil then
                break
            end
            if v554:IsA('Tool') and v554:FindFirstChild('RemoteFunctionShoot') then
                SelectToolWeaponGun = v554.Name
            end
        end
    end
end)
task.spawn(function()
    while wait() do
        if Skillaimbot and (game.Players:FindFirstChild(SelectPlayer) and (game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild('HumanoidRootPart') and (game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild('Humanoid') and game.Players:FindFirstChild(SelectPlayer).Character.Humanoid.Health > 0))) then
            AimBotSkillPosition = game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild('HumanoidRootPart').Position
        end
    end
end)
game:GetService('Players').LocalPlayer:GetMouse().Button1Down:Connect(function()
    if Aimbot and (game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) and game:GetService('Players'):FindFirstChild(SelectPlayer)) then
        tool = game:GetService('Players').LocalPlayer.Character[SelectToolWeaponGun]
        v17 = workspace:FindPartOnRayWithIgnoreList(Ray.new(tool.Handle.CFrame.p, (game:GetService('Players'):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position - tool.Handle.CFrame.p).unit * 100), {
            game.Players.LocalPlayer.Character,
            workspace._WorldOrigin,
        })

        game:GetService('Players').LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(game:GetService('Players'):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position, (require(game.ReplicatedStorage.Util).Other.hrpFromPart(v17)))
    end
end)
v3.Player:AddSection('Misc')
v3.Player:AddToggle('ToggleWalkOnWater', {
    Title = 'Wakl On Water',
    Default = true,
}):OnChanged(function(p555)
    _G.WalkWater = p555
end)
_Options.ToggleWalkOnWater:SetValue(true)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.WalkWater then
                game:GetService('Workspace').Map['WaterBase-Plane'].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService('Workspace').Map['WaterBase-Plane'].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)

local _TeleportFunc = v3.Teleport:AddSection('Teleport Func')

v3.Teleport:AddButton({
    Title = 'TP To World 1',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TravelMain')
    end,
})
v3.Teleport:AddButton({
    Title = 'TP To World 2',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TravelDressrosa')
    end,
})
v3.Teleport:AddButton({
    Title = 'TP To World 3',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TravelZou')
    end,
})
v3.Teleport:AddSection('Teleport Island')

if First_Sea then
    IslandList = {
        'WindMill',
        'Marine',
        'Middle Town',
        'Jungle',
        'Pirate Village',
        'Desert',
        'Snow Island',
        'MarineFord',
        'Colosseum',
        'Sky Island 1',
        'Sky Island 2',
        'Sky Island 3',
        'Prison',
        'Magma Village',
        'Under Water Island',
        'Fountain City',
        'Shank Room',
        'Mob Island',
    }
elseif Second_Sea then
    IslandList = {
        'The Cafe',
        'Frist Spot',
        'Dark Area',
        'Flamingo Mansion',
        'Flamingo Room',
        'Green Zone',
        'Factory',
        'Colossuim',
        'Zombie Island',
        'Two Snow Mountain',
        'Punk Hazard',
        'Cursed Ship',
        'Ice Castle',
        'Forgotten Island',
        'Ussop Island',
        'Mini Sky Island',
    }
elseif Third_Sea then
    IslandList = {
        'Mansion',
        'Port Town',
        'Great Tree',
        'Castle On The Sea',
        'MiniSky',
        'Hydra Island',
        'Floating Turtle',
        'Haunted Castle',
        'Ice Cream Island',
        'Peanut Island',
        'Cake Island',
        'Cocoa Island',
        'Candy Island',
        'Isle Outpost',
    }
end

local _DropdownIsland = v3.Teleport:AddDropdown('DropdownIsland', {
    Title = 'Dropdown',
    Values = IslandList,
    Multi = false,
    Default = 1,
})

_DropdownIsland:SetValue('...')
_DropdownIsland:OnChanged(function(p558)
    _G.SelectIsland = p558
end)
v3.Teleport:AddToggle('ToggleIsland', {
    Title = 'Teleport',
    Default = false,
}):OnChanged(function(p559)
    _G.TeleportIsland = p559

    if _G.TeleportIsland ~= true then
        return
    else
        while true do
            if true then
                wait()

                if _G.SelectIsland ~= 'WindMill' then
                    if _G.SelectIsland ~= 'Marine' then
                        if _G.SelectIsland ~= 'Middle Town' then
                            if _G.SelectIsland ~= 'Jungle' then
                                if _G.SelectIsland ~= 'Pirate Village' then
                                    if _G.SelectIsland ~= 'Desert' then
                                        if _G.SelectIsland ~= 'Snow Island' then
                                            if _G.SelectIsland ~= 'MarineFord' then
                                                if _G.SelectIsland ~= 'Colosseum' then
                                                    if _G.SelectIsland ~= 'Sky Island 1' then
                                                        if _G.SelectIsland ~= 'Sky Island 2' then
                                                            if _G.SelectIsland ~= 'Sky Island 3' then
                                                                if _G.SelectIsland ~= 'Prison' then
                                                                    if _G.SelectIsland ~= 'Magma Village' then
                                                                        if _G.SelectIsland ~= 'Under Water Island' then
                                                                            if _G.SelectIsland ~= 'Fountain City' then
                                                                                if _G.SelectIsland ~= 'Shank Room' then
                                                                                    if _G.SelectIsland ~= 'Mob Island' then
                                                                                        if _G.SelectIsland ~= 'The Cafe' then
                                                                                            if _G.SelectIsland ~= 'Frist Spot' then
                                                                                                if _G.SelectIsland ~= 'Dark Area' then
                                                                                                    if _G.SelectIsland ~= 'Flamingo Mansion' then
                                                                                                        if _G.SelectIsland ~= 'Flamingo Room' then
                                                                                                            if _G.SelectIsland ~= 'Green Zone' then
                                                                                                                if _G.SelectIsland ~= 'Factory' then
                                                                                                                    if _G.SelectIsland ~= 'Colossuim' then
                                                                                                                        if _G.SelectIsland ~= 'Zombie Island' then
                                                                                                                            if _G.SelectIsland ~= 'Two Snow Mountain' then
                                                                                                                                if _G.SelectIsland ~= 'Punk Hazard' then
                                                                                                                                    if _G.SelectIsland ~= 'Cursed Ship' then
                                                                                                                                        if _G.SelectIsland ~= 'Ice Castle' then
                                                                                                                                            if _G.SelectIsland ~= 'Forgotten Island' then
                                                                                                                                                if _G.SelectIsland ~= 'Ussop Island' then
                                                                                                                                                    if _G.SelectIsland ~= 'Mini Sky Island' then
                                                                                                                                                        if _G.SelectIsland ~= 'Great Tree' then
                                                                                                                                                            if _G.SelectIsland ~= 'Castle On The Sea' then
                                                                                                                                                                if _G.SelectIsland ~= 'MiniSky' then
                                                                                                                                                                    if _G.SelectIsland ~= 'Port Town' then
                                                                                                                                                                        if _G.SelectIsland ~= 'Hydra Island' then
                                                                                                                                                                            if _G.SelectIsland ~= 'Floating Turtle' then
                                                                                                                                                                                if _G.SelectIsland ~= 'Mansion' then
                                                                                                                                                                                    if _G.SelectIsland ~= 'Haunted Castle' then
                                                                                                                                                                                        if _G.SelectIsland ~= 'Ice Cream Island' then
                                                                                                                                                                                            if _G.SelectIsland ~= 'Peanut Island' then
                                                                                                                                                                                                if _G.SelectIsland ~= 'Cake Island' then
                                                                                                                                                                                                    if _G.SelectIsland ~= 'Cocoa Island' then
                                                                                                                                                                                                        if _G.SelectIsland ~= 'Candy Island' then
                                                                                                                                                                                                            if _G.SelectIsland == 'Isle Outpost' then
                                                                                                                                                                                                                toTarget(CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625))
                                                                                                                                                                                                            end
                                                                                                                                                                                                        else
                                                                                                                                                                                                            toTarget(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        toTarget(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    toTarget(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                toTarget(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            toTarget(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        toTarget(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    BTPZ(CFrame.new(-12468.5380859375, 375.0094299316406, -7554.62548828125))
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                toTarget(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            BTPZ(CFrame.new(5753.5478515625, 610.7880859375, -282.33172607421875))
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        toTarget(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    toTarget(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                BTPZ(CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            toTarget(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        toTarget(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    toTarget(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                toTarget(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            toTarget(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        toTarget(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    toTarget(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                                                                                                                                end
                                                                                                                            else
                                                                                                                                toTarget(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                                                                                                                            end
                                                                                                                        else
                                                                                                                            toTarget(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                                                                                                                        end
                                                                                                                    else
                                                                                                                        toTarget(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                                                                                                                    end
                                                                                                                else
                                                                                                                    toTarget(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                                                                                                                end
                                                                                                            else
                                                                                                                toTarget(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                                                                                                            end
                                                                                                        else
                                                                                                            toTarget(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                                                                                                        end
                                                                                                    else
                                                                                                        BTPZ(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                                                                                                    end
                                                                                                else
                                                                                                    toTarget(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                                                                                                end
                                                                                            else
                                                                                                toTarget(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                                                                                            end
                                                                                        else
                                                                                            toTarget(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                                                                                        end
                                                                                    else
                                                                                        toTarget(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                                                                                    end
                                                                                else
                                                                                    toTarget(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                                                                                end
                                                                            else
                                                                                toTarget(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                                                                            end
                                                                        else
                                                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                                        end
                                                                    else
                                                                        toTarget(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                                                                    end
                                                                else
                                                                    toTarget(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                                                                end
                                                            else
                                                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                                                            end
                                                        else
                                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-4607.82275, 872.54248, -1667.55688))
                                                        end
                                                    else
                                                        toTarget(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                                                    end
                                                else
                                                    toTarget(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                                                end
                                            else
                                                toTarget(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                                            end
                                        else
                                            toTarget(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                                        end
                                    else
                                        toTarget(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                                    end
                                else
                                    toTarget(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                                end
                            else
                                toTarget(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                            end
                        else
                            toTarget(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                        end
                    else
                        toTarget(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                    end
                else
                    toTarget(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                end
            end
            if not _G.TeleportIsland then
            end
        end
    end
end)
_Options.ToggleIsland:SetValue(false)

local _GetFruits = game.ReplicatedStorage:FindFirstChild('Remotes').CommF_:InvokeServer('GetFruits')

Table_DevilFruitSniper = {}
ShopDevilSell = {}

local v561 = next
local v562 = nil

while true do
    local v563

    v562, v563 = v561(_GetFruits, v562)

    if v562 == nil then
        break
    end

    table.insert(Table_DevilFruitSniper, v563.Name)

    if v563.OnSale then
        table.insert(ShopDevilSell, v563.Name)
    end
end

_G.SelectFruit = 'Leopard'

local _DropdownFruit = v3.Fruit:AddDropdown('DropdownFruit', {
    Title = 'Dropdown',
    Values = Table_DevilFruitSniper,
    Multi = false,
    Default = 1,
})

_DropdownFruit:SetValue('...')
_DropdownFruit:OnChanged(function(p565)
    _G.SelectFruit = p565
end)
v3.Fruit:AddToggle('ToggleFruit', {
    Title = 'Auto Buy Fruit Sniper',
    Default = false,
}):OnChanged(function(p566)
    _G.AutoBuyFruitSniper = p566
end)
_Options.ToggleFruit:SetValue(false)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.AutoBuyFruitSniper then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetFruits')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('PurchaseRawFruit', '_G.SelectFruit', false)
            end
        end
    end)
end)
v3.Fruit:AddToggle('ToggleStore', {
    Title = 'Auto Store Fruit',
    Default = false,
}):OnChanged(function(p567)
    _G.AutoStoreFruit = p567
end)
_Options.ToggleStore:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Bomb Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bomb Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Bomb-Bomb', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bomb Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spike Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spike Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spike-Spike', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spike Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Chop Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Chop Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Chop-Chop', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Chop Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spring Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spring Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spring-Spring', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spring Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Rocket Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Kilo Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Rocket-Rocket', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Kilo Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Smoke Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Smoke Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Smoke-Smoke', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Smoke Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spin Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spin Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spin-Spin', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spin Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Flame Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Flame Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Flame-Flame', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Flame Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Bird: Falcon Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Falcon Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Bird-Bird: Falcon', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Falcon Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Ice Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Ice Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Ice-Ice', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Ice Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Sand Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Sand Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Sand-Sand', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Sand Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Dark Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dark Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Dark-Dark', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dark Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Ghost Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Revive Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Ghost-Ghost', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Revive Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Diamond Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Diamond Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Diamond-Diamond', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Diamond Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Light Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Light Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Light-Light', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Light Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Love Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Love Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Love-Love', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Love Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Rubber Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rubber Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Rubber-Rubber', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rubber Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Barrier Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Barrier Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Barrier-Barrier', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Barrier Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Magma Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Magma Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Magma-Magma', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Magma Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Portal Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Door Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Door-Door', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Portal Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Quake Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Quake Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Quake-Quake', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Quake Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Human-Human: Buddha Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Human-Human: Buddha Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Human-Human: Buddha', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Human-Human: Buddha Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spider Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spider Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Spider-Spider', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spider Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Bird: Phoenix Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Phoenix Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Bird-Bird: Phoenix', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Bird: Phoenix Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Rumble Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rumble Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Rumble-Rumble', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Rumble Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Pain Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Paw Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Pain-Pain', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Paw Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Gravity Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Gravity Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Gravity-Gravity', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Gravity Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Dough Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dough Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Dough-Dough', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dough Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Shadow Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Shadow Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Shadow-Shadow', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Shadow Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Venom Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Venom Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Venom-Venom', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Venom Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Control Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Control Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Control-Control', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Control Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Spirit Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Soul Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Soul-Soul', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Spirit Fruit'))
                    end
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Dragon Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dragon Fruit') then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Dragon-Dragon', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Dragon Fruit'))

                        if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Leopard Fruit') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Leopard Fruit') then
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', 'Leopard-Leopard', game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Leopard Fruit'))
                        end
                    end
                end
            end)
        end

        wait(0.3)
    end
end)
v3.Fruit:AddToggle('ToggleRandomFruit', {
    Title = 'Auto Random Fruit',
    Default = false,
}):OnChanged(function(p568)
    _G.Random_Auto = p568
end)
_Options.ToggleRandomFruit:SetValue(false)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Random_Auto then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Cousin', 'Buy')
            end
        end
    end)
end)
v3.Fruit:AddToggle('ToggleCollect', {
    Title = 'Collect Devil Fruit',
    Default = false,
}):OnChanged(function(p569)
    _G.Tweenfruit = p569
end)
_Options.ToggleCollect:SetValue(false)
spawn(function()
    while wait(0.1) do
        if _G.Tweenfruit then
            local v570, v571, v572 = pairs(game.Workspace:GetChildren())

            while true do
                local v573

                v572, v573 = v570(v571, v572)

                if v572 == nil then
                    break
                end
                if string.find(v573.Name, 'Fruit') then
                    Tween(v573.Handle.CFrame)
                end
            end
        end
    end
end)
v3.Fruit:AddSection('Esp')
v3.Fruit:AddToggle('ToggleEspPlayer', {
    Title = 'Esp Player',
    Default = false,
}):OnChanged(function(p574)
    ESPPlayer = p574

    UpdatePlayerChams()
end)
_Options.ToggleEspPlayer:SetValue(false)
v3.Fruit:AddToggle('ToggleEspFruit', {
    Title = 'Esp Devil Fruit',
    Default = false,
}):OnChanged(function(p575)
    DevilFruitESP = p575

    while DevilFruitESP do
        wait()
        UpdateDevilChams()
    end
end)
_Options.ToggleEspFruit:SetValue(false)
v3.Fruit:AddToggle('ToggleEspIsland', {
    Title = 'Esp Island',
    Default = false,
}):OnChanged(function(p576)
    IslandESP = p576

    while IslandESP do
        wait()
        UpdateIslandESP()
    end
end)
_Options.ToggleEspIsland:SetValue(false)
v3.Fruit:AddToggle('ToggleEspFlower', {
    Title = 'Esp Flower',
    Default = false,
}):OnChanged(function(p577)
    FlowerESP = p577

    UpdateFlowerChams()
end)
_Options.ToggleEspFlower:SetValue(false)
spawn(function()
    while wait(2) do
        if FlowerESP then
            UpdateFlowerChams()
        end
        if DevilFruitESP then
            UpdateDevilChams()
        end
        if ChestESP then
            UpdateChestChams()
        end
        if ESPPlayer then
            UpdatePlayerChams()
        end
        if RealFruitESP then
            UpdateRealFruitChams()
        end
    end
end)

local _DropdownRaid = v3.Raid:AddDropdown('DropdownRaid', {
    Title = 'Dropdown',
    Values = {
        'Flame',
        'Ice',
        'Quake',
        'Light',
        'Dark',
        'Spider',
        'Rumble',
        'Magma',
        'Buddha',
        'Sand',
        'Phoenix',
        'Dough',
    },
    Multi = false,
    Default = 1,
})

_DropdownRaid:SetValue('...')
_DropdownRaid:OnChanged(function(p579)
    SelectChip = p579
end)
v3.Raid:AddToggle('ToggleBuy', {
    Title = 'Buy Chip',
    Default = false,
}):OnChanged(function(p580)
    _G.Auto_Buy_Chips_Dungeon = p580
end)
_Options.ToggleBuy:SetValue(false)
spawn(function()
    while wait() do
        if _G.Auto_Buy_Chips_Dungeon then
            pcall(function()
                local v581 = {
                    'RaidsNpc',
                    'Select',
                    SelectChip,
                }

                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(v581))
            end)
        end
    end
end)
v3.Raid:AddToggle('ToggleStart', {
    Title = 'Auto Start Raid',
    Default = false,
}):OnChanged(function(p582)
    _G.Auto_StartRaid = p582
end)
_Options.ToggleStart:SetValue(false)
spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Auto_StartRaid and game:GetService('Players').LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1') and game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Special Microchip') or game:GetService('Players').LocalPlayer.Character:FindFirstChild('Special Microchip')) then
                if Second_Sea then
                    fireclickdetector(game:GetService('Workspace').Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif Third_Sea then
                    fireclickdetector(game:GetService('Workspace').Map['Boat Castle'].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end)
    end
end)
v3.Raid:AddToggle('ToggleKillAura', {
    Title = 'Kill Aura',
    Default = false,
}):OnChanged(function(p583)
    KillAura = p583
end)
_Options.ToggleKillAura:SetValue(false)
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                local v584, v585, v586 = pairs(game.Workspace.Enemies:GetDescendants())

                while true do
                    local v587

                    v586, v587 = v584(v585, v586)

                    if v586 == nil then
                        break
                    end
                    if v587:FindFirstChild('Humanoid') and (v587:FindFirstChild('HumanoidRootPart') and v587.Humanoid.Health > 0) then
                        repeat
                            task.wait()
                            sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)

                            v587.Humanoid.Health = 0
                            v587.HumanoidRootPart.CanCollide = false
                        until not KillAura or (not v587.Parent or v587.Humanoid.Health <= 0)
                    end
                end
            end)
        end
    end
end)
v3.Raid:AddToggle('ToggleNextIsland', {
    Title = 'Auto Next Island',
    Default = false,
}):OnChanged(function(p588)
    AutoNextIsland = p588
end)
_Options.ToggleNextIsland:SetValue(false)
spawn(function()
    while task.wait() do
        if AutoNextIsland then
            pcall(function()
                if game:GetService('Players').LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    if game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 5') then
                        Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 5').CFrame * CFrame.new(0, 70, 100))
                    elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 4') then
                        Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 4').CFrame * CFrame.new(0, 70, 100))
                    elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 3') then
                        Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 3').CFrame * CFrame.new(0, 70, 100))
                    elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 2') then
                        Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 2').CFrame * CFrame.new(0, 70, 100))
                    elseif game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1') then
                        Tween(game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island 1').CFrame * CFrame.new(0, 70, 100))
                    end
                end
            end)
        end
    end
end)
v3.Raid:AddToggle('ToggleAwake', {
    Title = 'Auto Awake',
    Default = false,
}):OnChanged(function(p589)
    AutoAwakenAbilities = p589
end)
_Options.ToggleAwake:SetValue(false)
spawn(function()
    while task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Awakener', 'Awaken')
            end)
        end
    end
end)
v3.Raid:AddToggle('ToggleGetFruit', {
    Title = 'Get Fruit Low Bely',
    Default = false,
}):OnChanged(function(p590)
    _G.Autofruit = p590
end)
spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Autofruit then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Rocket-Rocket',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Spin-Spin',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Chop-Chop',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Spring-Spring',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Bomb-Bomb',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Smoke-Smoke',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Spike-Spike',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Flame-Flame',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Falcon-Falcon',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Ice-Ice',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Sand-Sand',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Dark-Dark',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Ghost-Ghost',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Diamond-Diamond',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Light-Light',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Rubber-Rubber',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'LoadFruit',
                    'Barrier-Barrier',
                }))
            end
        end)
    end
end)

if Second_Sea then
    v3.Raid:AddButton({
        Title = 'Raid Lab',
        Description = '',
        Callback = function()
            Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
        end,
    })
elseif Third_Sea then
    v3.Raid:AddButton({
        Title = 'Raid Lab',
        Description = '',
        Callback = function()
            Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-8, -0.378151238, 4.55503146e-9, 1, 1.07377559e-7, 0.378151238, 9.7681621e-8, -0.925743818))
        end,
    })
end

v3.Raid:AddSection('Law Raid')
v3.Raid:AddToggle('ToggleLaw', {
    Title = 'Auto Law',
    Default = false,
}):OnChanged(function(p591)
    Auto_Law = p591
end)
_Options.ToggleLaw:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law and not (game:GetService('Players').LocalPlayer.Character:FindFirstChild('Microchip') or (game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Microchip') or (game:GetService('Workspace').Enemies:FindFirstChild('Order') or game:GetService('ReplicatedStorage'):FindFirstChild('Order')))) then
                wait(0.3)
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Microchip', '1')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Microchip', '2')
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait(0.4) do
            if Auto_Law then
                if not game:GetService('Workspace').Enemies:FindFirstChild('Order') and (not game:GetService('ReplicatedStorage'):FindFirstChild('Order') and (game:GetService('Players').LocalPlayer.Character:FindFirstChild('Microchip') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Microchip'))) then
                    fireclickdetector(game:GetService('Workspace').Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                end
                if game:GetService('ReplicatedStorage'):FindFirstChild('Order') or game:GetService('Workspace').Enemies:FindFirstChild('Order') then
                    if game:GetService('Workspace').Enemies:FindFirstChild('Order') then
                        local v592, v593, v594 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                        while true do
                            local v595

                            v594, v595 = v592(v593, v594)

                            if v594 == nil then
                                break
                            end
                            if v595.Name == 'Order' then
                                repeat
                                    wait(0)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v595.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                    v595.HumanoidRootPart.CanCollide = false
                                    v595.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                                until not v595.Parent or (v595.Humanoid.Health <= 0 or Auto_Law == false)
                            end
                        end
                    elseif game:GetService('ReplicatedStorage'):FindFirstChild('Order') then
                        Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end
        end
    end)
end)
v3.Race:AddButton({
    Title = 'Timple Of Time',
    Description = '',
    Callback = function()
        game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end,
})
v3.Race:AddButton({
    Title = 'Lever Pull',
    Description = '',
    Callback = function()
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end,
})
v3.Race:AddButton({
    Title = 'Acient One',
    Description = '',
    Callback = function()
        Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end,
})
v3.Race:AddSection('Auto Race')
v3.Race:AddButton({
    Title = 'Race Door',
    Description = '',
    Callback = function()
        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.1)

        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.1)

        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.1)

        Game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        wait(0.5)

        if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Human' then
            if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Skypiea' then
                if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Fishman' then
                    if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Cyborg' then
                        if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Ghoul' then
                            if game:GetService('Players').LocalPlayer.Data.Race.Value == 'Mink' then
                                Tween2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
                            end
                        else
                            Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                        end
                    else
                        Tween2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
                    end
                else
                    Tween2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
                end
            else
                Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            end
        else
            Tween2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
        end
    end,
})
v3.Race:AddToggle('ToggleHumanandghoul', {
    Title = 'Auto [ Human / Ghoul ] Trial',
    Default = false,
}):OnChanged(function(p596)
    KillAura = p596
end)
_Options.ToggleHumanandghoul:SetValue(false)
v3.Race:AddToggle('ToggleAutotrial', {
    Title = 'Auto Trial',
    Default = false,
}):OnChanged(function(p597)
    _G.AutoQuestRace = p597
end)
_Options.ToggleAutotrial:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Human' then
                    if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Skypiea' then
                        if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Fishman' then
                            if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Cyborg' then
                                if game:GetService('Players').LocalPlayer.Data.Race.Value ~= 'Ghoul' then
                                    if game:GetService('Players').LocalPlayer.Data.Race.Value == 'Mink' then
                                        local v598, v599, v600 = pairs(game:GetService('Workspace'):GetDescendants())

                                        while true do
                                            local v601

                                            v600, v601 = v598(v599, v600)

                                            if v600 == nil then
                                                break
                                            end
                                            if v601.Name == 'StartPoint' then
                                                Tween(v601.CFrame * CFrame.new(0, 10, 0))
                                            end
                                        end
                                    end
                                else
                                    local v602, v603, v604 = pairs(game.Workspace.Enemies:GetDescendants())

                                    while true do
                                        local u605

                                        v604, u605 = v602(v603, v604)

                                        if v604 == nil then
                                            break
                                        end
                                        if u605:FindFirstChild('Humanoid') and (u605:FindFirstChild('HumanoidRootPart') and u605.Humanoid.Health > 0) then
                                            pcall(function()
                                                repeat
                                                    wait(0.1)

                                                    u605.Humanoid.Health = 0
                                                    u605.HumanoidRootPart.CanCollide = false

                                                    sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                                                until not _G.AutoQuestRace or (not u605.Parent or u605.Humanoid.Health <= 0)
                                            end)
                                        end
                                    end
                                end
                            else
                                Tween(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                            end
                        else
                            local v606, v607, v608 = pairs(game:GetService('Workspace').SeaBeasts.SeaBeast1:GetDescendants())

                            while true do
                                local v609

                                v608, v609 = v606(v607, v608)

                                if v608 == nil then
                                    break
                                end
                                if v609.Name == 'HumanoidRootPart' then
                                    Tween(v609.CFrame * _DistanceFarm)

                                    local v610, v611, v612 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                    while true do
                                        local v613

                                        v612, v613 = v610(v611, v612)

                                        if v612 == nil then
                                            break
                                        end
                                        if v613:IsA('Tool') and v613.ToolTip == 'Melee' then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v613)
                                        end
                                    end

                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)

                                    local v614, v615, v616 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                    while true do
                                        local v617

                                        v616, v617 = v614(v615, v616)

                                        if v616 == nil then
                                            break
                                        end
                                        if v617:IsA('Tool') and v617.ToolTip == 'Blox Fruit' then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v617)
                                        end
                                    end

                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.5)

                                    local v618, v619, v620 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                    while true do
                                        local v621

                                        v620, v621 = v618(v619, v620)

                                        if v620 == nil then
                                            break
                                        end
                                        if v621:IsA('Tool') and v621.ToolTip == 'Sword' then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v621)
                                        end
                                    end

                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.5)

                                    local v622, v623, v624 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                                    while true do
                                        local v625

                                        v624, v625 = v622(v623, v624)

                                        if v624 == nil then
                                            break
                                        end
                                        if v625:IsA('Tool') and v625.ToolTip == 'Gun' then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v625)
                                        end
                                    end

                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                end
                            end
                        end
                    else
                        local v626, v627, v628 = pairs(game:GetService('Workspace').Map.SkyTrial.Model:GetDescendants())

                        while true do
                            local v629

                            v628, v629 = v626(v627, v628)

                            if v628 == nil then
                                break
                            end
                            if v629.Name == 'snowisland_Cylinder.081' then
                                BTPZ(v629.CFrame * CFrame.new(0, 0, 0))
                            end
                        end
                    end
                else
                    local v630, v631, v632 = pairs(game.Workspace.Enemies:GetDescendants())

                    while true do
                        local u633

                        v632, u633 = v630(v631, v632)

                        if v632 == nil then
                            break
                        end
                        if u633:FindFirstChild('Humanoid') and (u633:FindFirstChild('HumanoidRootPart') and u633.Humanoid.Health > 0) then
                            pcall(function()
                                repeat
                                    wait(0.1)

                                    u633.Humanoid.Health = 0
                                    u633.HumanoidRootPart.CanCollide = false

                                    sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
                                until not _G.AutoQuestRace or (not u633.Parent or u633.Humanoid.Health <= 0)
                            end)
                        end
                    end
                end
            end
        end
    end)
end)

if Third_Sea then
    v3.Race:AddToggle('ToggleMirageIsland', {
        Title = 'Hop Mirage Island',
        Default = false,
    }):OnChanged(function(p634)
        _G.FindMirageIsland = p634
    end)
    _Options.ToggleMirageIsland:SetValue(false)
    spawn(function()
        while wait() do
            if _G.FindMirageIsland then
                if game:GetService('Workspace').Map:FindFirstChild('MysticIsland') or game:GetService('Workspace').Map:FindFirstChild('MysticIsland') then
                    if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
                        Tween(getHighestPoint().CFrame * CFrame.new(0, 211.88, 0))
                    end
                elseif not (game:GetService('Workspace').Map:FindFirstChild('MysticIsland') and game:GetService('Workspace').Map:FindFirstChild('MysticIsland')) then
                    Hop()
                end
            end
        end
    end)
end

v3.Race:AddSection('Auto Train')
v3.Race:AddToggle('ToggleAutoAcientQuest', {
    Title = 'Auto Train',
    Default = false,
}):OnChanged(function(p635)
    AutoFarmAcient = p635
end)
_Options.ToggleAutoAcientQuest:SetValue(false)

local u636 = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)

spawn(function()
    pcall(function()
        while wait() do
            if AutoFarmAcient and game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                AutoFarmAcient = false

                toTarget(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
            end
        end
    end)
end)
spawn(function()
    while wait() do
        if AutoFarmAcient then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild('Cocoa Warrior') or (game:GetService('Workspace').Enemies:FindFirstChild('Chocolate Bar Battler') or (game:GetService('Workspace').Enemies:FindFirstChild('Sweet Thief') or game:GetService('Workspace').Enemies:FindFirstChild('Candy Rebel'))) then
                    local v637, v638, v639 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v640

                        v639, v640 = v637(v638, v639)

                        if v639 == nil then
                            break
                        end
                        if (v640.Name == 'Cocoa Warrior' or (v640.Name == 'Chocolate Bar Battler' or (v640.Name == 'Sweet Thief' or v640.Name == 'Candy Rebel'))) and (v640:FindFirstChild('Humanoid') and (v640:FindFirstChild('HumanoidRootPart') and v640.Humanoid.Health > 0)) then
                            bringmob = true

                            repeat
                                wait(0)
                                AutoHaki()
                                EquipTool(SelectWeapon)

                                v640.HumanoidRootPart.CanCollide = false
                                v640.Humanoid.WalkSpeed = 0
                                v640.Head.CanCollide = false
                                FarmPos = v640.HumanoidRootPart.CFrame
                                MonFarm = v640.Name

                                Tween(v640.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                            until not AutoFarmAcient or (not v640.Parent or v640.Humanoid.Health <= 0)

                            bringmob = false
                        end
                    end
                else
                    toTarget(u636)
                end
            end)
        end
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            if AutoFarmAcient and game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                AutoFarmAcient = true
            end
        end
    end)
end)
spawn(function()
    while wait() do
        pcall(function()
            if AutoFarmAcient then
                game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Y', false, game)
                wait(0.1)
                game:GetService('VirtualInputManager'):SendKeyEvent(false, 'Y', false, game)
            end
        end)
    end
end)
v3.Shop:AddToggle('ToggleRandomBone', {
    Title = 'Random Bone',
    Default = false,
}):OnChanged(function(p641)
    _G.AutoRandomBone = p641
end)
_Options.ToggleRandomBone:SetValue(false)
spawn(function()
    while wait(1e-52) do
        if _G.AutoRandomBone then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'Bones',
                'Buy',
                1,
                1,
            }))
        end
    end
end)
v3.Shop:AddButton({
    Title = 'Geppo',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Geppo')
    end,
})
v3.Shop:AddButton({
    Title = 'Buso Haki',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Buso')
    end,
})
v3.Shop:AddButton({
    Title = 'Soru',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Soru')
    end,
})
v3.Shop:AddButton({
    Title = 'Ken Haki',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('KenTalk', 'Buy')
    end,
})
v3.Shop:AddSection('Fighting Styles')
v3.Shop:AddButton({
    Title = 'Black Leg',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyBlackLeg')
    end,
})
v3.Shop:AddButton({
    Title = 'Electro',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyElectro')
    end,
})
v3.Shop:AddButton({
    Title = 'Fishman Karate',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyFishmanKarate')
    end,
})
v3.Shop:AddButton({
    Title = 'Dragon Claw',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '1')
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '2')
    end,
})
v3.Shop:AddButton({
    Title = 'Superhuman',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySuperhuman')
    end,
})
v3.Shop:AddButton({
    Title = 'Death Step',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyDeathStep')
    end,
})
v3.Shop:AddButton({
    Title = 'Sharkman Karate',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySharkmanKarate', true)
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySharkmanKarate')
    end,
})
v3.Shop:AddButton({
    Title = 'Electric Claw',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyElectricClaw')
    end,
})
v3.Shop:AddButton({
    Title = 'Dragon Talon',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyDragonTalon')
    end,
})
v3.Shop:AddButton({
    Title = 'Godhuman',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyGodhuman')
    end,
})
v3.Shop:AddSection('Misc Items')
v3.Shop:AddButton({
    Title = 'Refund Stats',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Refund', '1')
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Refund', '2')
    end,
})
v3.Shop:AddButton({
    Title = 'Reroll Race',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Reroll', '1')
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'Reroll', '2')
    end,
})
v3.Misc:AddButton({
    Title = 'Rejoin Server',
    Description = '',
    Callback = function()
        game:GetService('TeleportService'):Teleport(game.PlaceId, game:GetService('Players').LocalPlayer)
    end,
})
v3.Misc:AddButton({
    Title = 'Hop Server',
    Description = '',
    Callback = function()
        Hop()
    end,
})

function Hop()
    local _PlaceId3 = game.PlaceId
    local u643 = {}
    local u644 = ''
    local _hour = os.date('!*t').hour

    function TPReturner()
        local v646

        if u644 ~= '' then
            v646 = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. _PlaceId3 .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. u644))
        else
            v646 = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. _PlaceId3 .. '/servers/Public?sortOrder=Asc&limit=100'))
        end
        if v646.nextPageCursor and (v646.nextPageCursor ~= 'null' and v646.nextPageCursor ~= nil) then
            u644 = v646.nextPageCursor
        end

        local v647, v648, v649 = pairs(v646.data)
        local v650 = 0

        while true do
            local v651

            v649, v651 = v647(v648, v649)

            if v649 == nil then
                break
            end

            local v652 = true
            local u653 = tostring(v651.id)

            if tonumber(v651.maxPlayers) > tonumber(v651.playing) then
                local v654, v655, v656 = pairs(u643)

                while true do
                    local v657

                    v656, v657 = v654(v655, v656)

                    if v656 == nil then
                        break
                    end
                    if v650 == 0 then
                        if tonumber(_hour) ~= tonumber(v657) then
                            pcall(function()
                                u643 = {}

                                table.insert(u643, _hour)
                            end)
                        end
                    elseif u653 == tostring(v657) then
                        v652 = false
                    end

                    v650 = v650 + 1
                end

                if v652 == true then
                    table.insert(u643, u653)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService('TeleportService'):TeleportToPlaceInstance(_PlaceId3, u653, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    _TeleportFunc = function()
        while wait() do
            pcall(function()
                TPReturner()

                if u644 ~= '' then
                    TPReturner()
                end
            end)
        end
    end

    _TeleportFunc()
end

v3.Misc:AddSection('Team')
v3.Misc:AddButton({
    Title = 'Join Pirates Team',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('SetTeam', 'Pirates')
    end,
})
v3.Misc:AddButton({
    Title = 'Join Marines Team',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('SetTeam', 'Marines')
    end,
})
v3.Misc:AddSection('Open Ui')
v3.Misc:AddButton({
    Title = 'Devil Shop Menu',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetFruits')

        game:GetService('Players').LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end,
})
v3.Misc:AddButton({
    Title = 'Color Haki Menu',
    Description = '',
    Callback = function()
        game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
    end,
})
v3.Misc:AddButton({
    Title = 'Title Name Menu',
    Description = '',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
            'getTitles',
        }))

        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
    end,
})
v3.Misc:AddButton({
    Title = 'Awakening Menu',
    Description = '',
    Callback = function()
        game:GetService('Players').LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
    end,
})
v3.Misc:AddSection('Troll')
v3.Misc:AddButton({
    Title = 'Rain Fruit',
    Description = 'Rain fruit (Fake)',
    Callback = function()
        local v658, v659, v660 = pairs(game:GetObjects('rbxassetid://14759368201')[1]:GetChildren())

        while true do
            local u661

            v660, u661 = v658(v659, v660)

            if v660 == nil then
                break
            end

            u661.Parent = game.Workspace.Map

            u661:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))

            if u661.Fruit:FindFirstChild('AnimationController') then
                u661.Fruit:FindFirstChild('AnimationController'):LoadAnimation(u661.Fruit:FindFirstChild('Idle')):Play()
            end

            u661.Handle.Touched:Connect(function(p662)
                if p662.Parent == game.Players.LocalPlayer.Character then
                    u661.Parent = game.Players.LocalPlayer.Backpack

                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(u661)
                end
            end)
        end
    end,
})
v3.Misc:AddSection('Misc')
v3.Misc:AddToggle('ToggleRejoin', {
    Title = 'Auto Rejoin',
    Default = true,
}):OnChanged(function(p663)
    _G.AutoRejoin = p663
end)
_Options.ToggleRejoin:SetValue(true)
spawn(function()
    while wait() do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService('CoreGui').RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(p664)
                if p664.Name == 'ErrorPrompt' and p664:FindFirstChild('MessageArea') and p664.MessageArea:FindFirstChild('ErrorFrame') then
                    game:GetService('TeleportService'):Teleport(game.PlaceId)
                end
            end)
        end
    end
end)
v3.Misc:AddSection('Kaitun Cap')
v3.Misc:AddButton({
    Title = 'Show Items',
    Description = '',
    Callback = function()
        local _UILibrary = game:GetService('CoreGui').RobloxGui.Modules.Profile:FindFirstChild('UILibrary')

        if _UILibrary then
            _UILibrary:Destroy()
        end

        game:GetService('UserInputService')

        local _TweenService5 = game:GetService('TweenService')

        game:GetService('RunService')
        game:GetService('Players').LocalPlayer:GetMouse()

        local _Blur = game:GetService('Lighting'):FindFirstChild('Blur')

        if _Blur then
            _Blur:Destroy()
        end

        local _BlurEffect = Instance.new('BlurEffect')

        _TweenService5:Create(_BlurEffect, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = 50}):Play()

        _BlurEffect.Parent = game.Lighting

        Instance.new('UIStroke')
        Instance.new('UICorner')

        local _ScreenGui2 = Instance.new('ScreenGui')

        Instance.new('ImageButton')

        local _ = Enum.ButtonStyle.RobloxButton

        _ScreenGui2.Parent = game.CoreGui
        _ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local v670 = require(game:GetService('Players').LocalPlayer.PlayerGui.Main.UIController.Inventory)
        local _getInventory = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory')
        local v672 = {}
        local v673 = {
            'Mythical',
            'Legendary',
            'Rare',
            'Uncommon',
            'Common',
        }
        local u674 = {
            Common = Color3.fromRGB(179, 179, 179),
            Uncommon = Color3.fromRGB(92, 140, 211),
            Rare = Color3.fromRGB(140, 82, 255),
            Legendary = Color3.fromRGB(213, 43, 228),
            Mythical = Color3.fromRGB(238, 47, 50),
        }

        function GetRaity(p675)
            local v676, v677, v678 = pairs(u674)

            while true do
                local v679

                v678, v679 = v676(v677, v678)

                if v678 == nil then
                    break
                end
                if v679 == p675 then
                    return v678
                end
            end
        end

        local v680, v681, v682 = pairs(_getInventory)

        while true do
            local v683

            v682, v683 = v680(v681, v682)

            if v682 == nil then
                break
            end

            v672[v683.Name] = v683
        end

        local v684 = #getupvalue(v670.UpdateRender, 4)
        local v685 = 0
        local v686 = {}
        local v687 = {}

        while v685 < v684 do
            local v688 = 0

            while v688 < 25000 and v685 < v684 do
                game:GetService('Players').LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0, v688)

                local v689, v690, v691 = pairs(game:GetService('Players').LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetChildren())

                while true do
                    local v692

                    v691, v692 = v689(v690, v691)

                    if v691 == nil then
                        break
                    end
                    if v692:IsA('Frame') and (not v687[v692.ItemName.Text] and v692.ItemName.Visible == true) then
                        local v693 = GetRaity(v692.Background.BackgroundColor3)

                        if v693 then
                            if not v686[v693] then
                                v686[v693] = {}
                            end

                            table.insert(v686[v693], v692:Clone())
                        end

                        v685 = v685 + 1
                        v687[v692.ItemName.Text] = true
                    end
                end

                v688 = v688 + 20
            end

            wait()
        end

        function GetXY(p694)
            return p694 * 100
        end

        local _UIListLayout = Instance.new('UIListLayout')

        _UIListLayout.FillDirection = Enum.FillDirection.Vertical
        _UIListLayout.SortOrder = 2
        _UIListLayout.Padding = UDim.new(0, 10)

        local _Frame = Instance.new('Frame', game.Players.LocalPlayer.PlayerGui.BubbleChat)

        _Frame.BackgroundTransparency = 1
        _Frame.Size = UDim2.new(0.5, 0, 1, 0)
        _UIListLayout.Parent = _Frame

        local _Frame2 = Instance.new('Frame', game.Players.LocalPlayer.PlayerGui.BubbleChat)

        _Frame2.BackgroundTransparency = 1
        _Frame2.Size = UDim2.new(0.5, 0, 1, 0)
        _Frame2.Position = UDim2.new(0.6, 0, 0, 0)
        _UIListLayout:Clone().Parent = _Frame2

        local v698, v699, v700 = pairs(v686)

        while true do
            local v701

            v700, v701 = v698(v699, v700)

            if v700 == nil then
                break
            end

            local _Frame3 = Instance.new('Frame', _Frame)

            _Frame3.BackgroundTransparency = 1
            _Frame3.Size = UDim2.new(1, 0, 0, 0)
            _Frame3.LayoutOrder = table.find(v673, v700)

            local _Frame4 = Instance.new('Frame', _Frame2)

            _Frame4.BackgroundTransparency = 1
            _Frame4.Size = UDim2.new(1, 0, 0, 0)
            _Frame4.LayoutOrder = table.find(v673, v700)

            local _UIGridLayout = Instance.new('UIGridLayout', _Frame3)

            _UIGridLayout.CellPadding = UDim2.new(0.005, 0, 0.005, 0)
            _UIGridLayout.CellSize = UDim2.new(0, 70, 0, 70)
            _UIGridLayout.FillDirectionMaxCells = 100
            _UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
            _UIGridLayout:Clone().Parent = _Frame4

            local v705, v706, v707 = pairs(v701)

            while true do
                local v708

                v707, v708 = v705(v706, v707)

                if v707 == nil then
                    break
                end
                if v672[v708.ItemName.Text] and v672[v708.ItemName.Text].Mastery then
                    if v708.ItemLine2.Text ~= 'Accessory' then
                        local v709 = v708.ItemName:Clone()

                        v709.BackgroundTransparency = 1
                        v709.TextSize = 10
                        v709.TextXAlignment = 2
                        v709.TextYAlignment = 2
                        v709.ZIndex = 5
                        v709.Text = v672[v708.ItemName.Text].Mastery
                        v709.Size = UDim2.new(0.5, 0, 0.5, 0)
                        v709.Position = UDim2.new(0.5, 0, 0.5, 0)
                        v709.Parent = v708
                    end

                    v708.Parent = _Frame3
                elseif v708.ItemLine2.Text == 'Blox Fruit' then
                    v708.Parent = _Frame4
                end
            end

            _Frame3.AutomaticSize = 2
            _Frame4.AutomaticSize = 2
        end

        local v710 = {
            Superhuman = Vector2.new(3, 2),
            DeathStep = Vector2.new(4, 3),
            ElectricClaw = Vector2.new(2, 0),
            SharkmanKarate = Vector2.new(0, 0),
            DragonTalon = Vector2.new(1, 5),
        }
        local _Frame5 = Instance.new('Frame', _Frame)

        _Frame5.BackgroundTransparency = 1
        _Frame5.Size = UDim2.new(1, 0, 0, 0)
        _Frame5.LayoutOrder = table.find(v673, k)
        _Frame5.AutomaticSize = 2
        _Frame5.LayoutOrder = 100

        local _UIGridLayout2 = Instance.new('UIGridLayout', _Frame5)

        _UIGridLayout2.CellPadding = UDim2.new(0.005, 0, 0.005, 0)
        _UIGridLayout2.CellSize = UDim2.new(0, 70, 0, 70)
        _UIGridLayout2.FillDirectionMaxCells = 100
        _UIGridLayout2.FillDirection = Enum.FillDirection.Horizontal

        local v713, v714, v715 = pairs({
            'Superhuman',
            'ElectricClaw',
            'DragonTalon',
            'SharkmanKarate',
            'DeathStep',
            'GodHuman',
        })

        while true do
            local v716

            v715, v716 = v713(v714, v715)

            if v715 == nil then
                break
            end
            if v710[v716] and game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buy' .. v716, true) == 1 then
                local _ImageLabel = Instance.new('ImageLabel', _Frame5)

                _ImageLabel.Image = 'rbxassetid://9945562382'
                _ImageLabel.ImageRectSize = Vector2.new(100, 100)
                _ImageLabel.ImageRectOffset = v710[v716] * 100
            end
        end

        function formatNumber(p718)
            return tostring(p718):reverse():gsub('%d%d%d', '%1,'):reverse():gsub('^,', '')
        end

        game:GetService('Players').LocalPlayer.PlayerGui.Main.Beli.AnchorPoint = Vector2.new(0.5, 0.5)
        game:GetService('Players').LocalPlayer.PlayerGui.Main.Beli.Position = UDim2.new(0, 1120, 0, 700)
        game:GetService('Players').LocalPlayer.PlayerGui.Main.Level.AnchorPoint = Vector2.new(0.5, 0.5)
        game:GetService('Players').LocalPlayer.PlayerGui.Main.Level.Position = UDim2.new(0, 1150, 0, 750)

        local v719 = game:GetService('Players').LocalPlayer.PlayerGui.Main.Fragments:Clone()

        v719.Name = 'Name'
        v719.Parent = game:GetService('Players').LocalPlayer.PlayerGui.Main.Beli
        v719.Position = UDim2.new(0, 0, -1.5, 0)
        v719.Size = UDim2.new(1, 0, 1, 0)
        v719.TextColor3 = Color3.fromRGB(255, 255, 255)
        v719.Text = game.Players.LocalPlayer.Name

        local v720 = game:GetService('Players').LocalPlayer.PlayerGui.Main.Fragments:Clone()

        v720.Name = 'FragmentsCheck'
        v720.Parent = game:GetService('Players').LocalPlayer.PlayerGui.Main.Beli
        v720.Position = UDim2.new(0, 0, -0.75, 0)
        v720.Size = UDim2.new(1, 0, 1, 0)
        v720.Text = '\u{192}' .. formatNumber(game:GetService('Players').LocalPlayer.Data.Fragments.Value)

        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
            'getAwakenedAbilities',
        }))

        game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
        game:GetService('Players').LocalPlayer.PlayerGui.Main.AwakeningToggler.Position = UDim2.new(0.48, 10, 0.908, 2)
        game:GetService('Players').LocalPlayer.PlayerGui.Main.AwakeningToggler.Size = UDim2.new(1, 0, 0.22, 0)

        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.MenuButton.Visible = false
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.RaceEnergy.Visible = false
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.SafeZone.Visible = false
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.HP.Visible = false
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Backpack.Enabled.Visible = false
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.Energy.Visible = false
        end)

        local v721, v722, v723 = pairs(game:GetService('Players').LocalPlayer.PlayerGui.Main:GetChildren())

        while true do
            local v724

            v723, v724 = v721(v722, v723)

            if v723 == nil then
                break
            end
            if v724:IsA('ImageButton') then
                v724:Destroy()
            end
        end

        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.Compass.Visible = false
        end)
    end,
})
v3.Misc:AddSection('Day')
v3.Misc:AddButton({
    Title = 'Remove Fog',
    Description = '',
    Callback = function()
        game:GetService('Lighting').LightingLayers:Destroy()
        game:GetService('Lighting').Sky:Destroy()
    end,
})
v3.Misc:AddButton({
    Title = 'Always Day',
    Description = '',
    Callback = function()
        game:GetService('RunService').Heartbeat:wait()

        game:GetService('Lighting').ClockTime = 12
    end,
})

local _LocalPlayer = game.Players.LocalPlayer

function FindEnemiesInRange(p726, p727)
    local _Position = (_LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()):GetPivot().Position
    local v729, v730, v731 = ipairs(p727)
    local v732 = nil

    while true do
        local v733

        v731, v733 = v729(v730, v731)

        if v731 == nil then
            break
        end
        if not v733:GetAttribute('IsBoat') and (v733:FindFirstChildOfClass('Humanoid') and v733.Humanoid.Health > 0) then
            local _Head = v733:FindFirstChild('Head')

            if _Head and ((_Position - _Head.Position).Magnitude <= 60 and v733 ~= _LocalPlayer.Character) then
                table.insert(p726, {v733, _Head})

                v732 = _Head
            end
        end
    end

    return v732
end
function GetEquippedTool()
    local _Character = _LocalPlayer.Character

    if not _Character then
        return nil
    end

    local v736, v737, v738 = ipairs(_Character:GetChildren())

    while true do
        local v739

        v738, v739 = v736(v737, v738)

        if v738 == nil then
            break
        end
        if v739:IsA('Tool') then
            return v739
        end
    end

    return nil
end
function AttackNoCoolDown()
    local u740 = {}
    local v741 = game:GetService('Workspace').Enemies:GetChildren()
    local u742 = FindEnemiesInRange(u740, v741)

    if u742 then
        if GetEquippedTool() then
            pcall(function()
                local _ReplicatedStorage = game:GetService('ReplicatedStorage')
                local _RERegisterAttack = _ReplicatedStorage:WaitForChild('Modules'):WaitForChild('Net'):WaitForChild('RE/RegisterAttack')
                local _RERegisterHit = _ReplicatedStorage:WaitForChild('Modules'):WaitForChild('Net'):WaitForChild('RE/RegisterHit')

                if #u740 <= 0 then
                    task.wait(1e-9)
                else
                    _RERegisterAttack:FireServer(1e-9)
                    _RERegisterHit:FireServer(u742, u740)
                end
            end)
        end
    else
        return
    end
end

FastAttack = true

spawn(function()
    if FastAttack then
        repeat
            task.wait()
            AttackNoCoolDown()
        until not FastAttack
    end
end)
