--[[
    ABACAXI HUB - ULTIMATE EDITION (BANANUI VERSION)
    All-in-One: Farm, Stats, Chests, Sea Events, Raid, Race & More.
    + ADDED: Auto Bones Ground Fix (Anti-Sky)
    UI convertida para: YuiSess/Bananui
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YuiSess/Bananui/refs/heads/main/Sla"))()

-- =========================================
-- WINDOW
-- =========================================
local Window = Library:CreateWindow({
    Title = "Abacaxi Hub",
    Desc = "FELIZ ANO NOVO 2026! - By: Orchidx",
    Image = "rbxassetid://105059922903197"
})

-- =========================================
-- DETECTOR DE MUNDO (SEA)
-- =========================================
local World1, World2, World3 = false, false, false
local PlaceId = game.PlaceId
if PlaceId == 2753915549 then World1 = true
elseif PlaceId == 4442272183 then World2 = true
elseif PlaceId == 7449423635 then World3 = true
end

-- =========================================
-- SERVIÇOS & VARIÁVEIS
-- =========================================
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local CurrentTween = nil
local IsPositioning = false
local CurrentTarget = nil

local Settings = {
    AutoFarm = false,
    FarmMode = "Nearest",
    SelectedMob = "",
    WeaponType = "Melee",
    AutoClick = true,
    UseFastAttackModule = true,
    FastAttack = true,
    BringMobs = true,
    BringDistance = 350,
    FarmDistance = 2500,
    FarmHeight = 15,
    AutoStats = false,
    StatsType = "Melee",
    AutoMastery = false,
    FruitMastery = false,
    SwordMastery = false,
    GunMastery = false,
    FightingStyleMastery = false,
    AutoChest = false,
    AutoHiddenChest = false,
    AutoIslandChest = false,
    AutoSeaChest = false,
    ChestHop = false,
    EspPlayers = false,
    EspChests = false,
    EspFruits = false,
    EspBosses = false,
    AutoRaceV2 = false,
    AutoRaceV3 = false,
    AutoRaceV4 = false,
    AutoTrainRaceV4 = false,
    AutoTrial = false,
    AutoKillPlayer = false,
    KillPlayerDistance = 2000,
    AutoRaid = false,
    AutoRaidWaves = false,
    AutoAwakening = false,
    AutoDungeon = false,
    AutoSeaBeast = false,
    AutoShipRaid = false,
    AutoTerrorshark = false,
    AutoLeviathan = false,
    AutoSeaEvents = false,
    AutoBuyBoat = false,
    AutoFindFrozenDimension = false,
    NoSeaDamage = false,
    AutoFarmCandy = false,
    AutoDracoV2 = false,
    AutoCakePrince = false,
    AutoAcceptQuest = false,
    AutoSummonCakePrince = false,
    AutoDoughKing = false,
    AutoFarmDoughKing = false,
    AutoDoughKingHop = false,
    AutoUnlockDoughDungeon = false,
    AutoUnlockPhoenixDungeon = false,
    AutoSoulReaper = false,
    AutoRandomBones = false,
    AutoTryLuckGravestone = false,
    AutoPrayGravestone = false,
    AutoTyrantSkies = false,
    AutoSummonTyrant = false,
    AutoHop30Min = false,
    AutoSetSpawnPoint = false,
    AutoBuso = false,
    AutoHakiObservation = false,
    AutoSpeed = false,
    AutoSelectChip = "Dough",
    AutoBuyChipBeli = false,
    AutoBuyChipFruit = false,
    AutoStartRaid = false,
    AutoRaidNextIsland = false,
    AutoFindMirage = false,
    AutoFindKitsune = false,
    AutoFindPreHistoric = false,
    AutoFindFrozen = false,
    AutoBones = false,
    AutoBonesGround = false,
    AutoEctoplasm = false,
    AutoCursedDrops = false,
    AutoHauntedNPCs = false,
    AutoShipEnemies = false,
    AutoDevilFruit = false,
    AutoCollectFruit = false,
    AutoNotifierFruit = false,
    AutoStoreFruit = false,
    AutoDropBadFruit = false,
    AutoEatFruit = false,
    AutoRollFruit = false,
    AutoSniperFruit = false,
    AutoFruitDrop = false,
    AutoFruitSpawn = false,
    AutoFruitSniper = false,
    AutoFragments = false,
    AutoRaidFragments = false,
    AutoEventFragments = false,
    AutoBossFragments = false,
    AutoBoss = false,
    SelectedBoss = "Thunder God",
    AutoHopBoss = false,
    AutoSpawnBoss = false,
    AutoSummonBoss = false,
    AutoBossNoHit = false,
    AutoSecretBoss = false,
    AutoEliteBoss = false,
    AutoSeaBoss = false,
    AutoEventBoss = false,
    AutoRaidBoss = false,
    AutoMaterials = false,
    SelectedMaterial = "Leather",
    AutoCraftItems = false,
    AutoRareDrops = false,
    AutoLegendaryDrops = false,
    AutoUpgradeItems = false,
    AutoQuest = false,
    AutoDailyQuest = false,
    AutoEliteQuest = false,
    AutoEventQuest = false,
    AutoLevel = false,
    AutoBeli = false,
    AutoExperience = false,
    Noclip = true,
    FPSBoost = false,
    TweenSpeed = 300
}

-- =========================================
-- FUNÇÕES ÚTEIS (CORE)
-- =========================================

local function ActivateNoclip()
    pcall(function()
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide and v.Name ~= "FarmFloat" then
                v.CanCollide = false
            end
        end
    end)
end

local NoSeaDamageConnection = nil
local function NoSeaDamageLoop()
    if Settings.NoSeaDamage then
        if not NoSeaDamageConnection then
            NoSeaDamageConnection = RunService.Stepped:Connect(function()
                pcall(function()
                    local character = LocalPlayer.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp.Position.Y < 1 then
                            if not hrp:FindFirstChild("SeaFloat") then
                                local bv = Instance.new("BodyVelocity", hrp)
                                bv.Name = "SeaFloat"
                                bv.MaxForce = Vector3.new(0, math.huge, 0)
                                bv.Velocity = Vector3.new(0, 50, 0)
                            end
                        else
                            local seaFloat = hrp and hrp:FindFirstChild("SeaFloat")
                            if seaFloat then seaFloat:Destroy() end
                        end
                    end
                end)
            end)
        end
    else
        if NoSeaDamageConnection then
            NoSeaDamageConnection:Disconnect()
            NoSeaDamageConnection = nil
        end
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and hrp:FindFirstChild("SeaFloat") then hrp.SeaFloat:Destroy() end
    end
end

local function EquipWeapon()
    pcall(function()
        local backpack = LocalPlayer.Backpack
        local character = LocalPlayer.Character
        if not character then return end
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then return end

        local function findToolByType(source)
            for _, tool in pairs(source:GetChildren()) do
                if tool:IsA("Tool") then
                    if Settings.WeaponType == "Melee" and tool.ToolTip == "Melee" then return tool end
                    if Settings.WeaponType == "Sword" and tool.ToolTip == "Sword" then return tool end
                    if Settings.WeaponType == "Fruit" and tool.ToolTip == "Blox Fruit" then return tool end
                    if Settings.WeaponType == "Gun" and tool.ToolTip == "Gun" then return tool end
                end
            end
            return nil
        end

        local currentTool = character:FindFirstChildOfClass("Tool")
        if Settings.AutoMastery and currentTool then return end

        if currentTool then
            if (Settings.WeaponType == "Melee" and currentTool.ToolTip == "Melee") or
               (Settings.WeaponType == "Sword" and currentTool.ToolTip == "Sword") or
               (Settings.WeaponType == "Fruit" and currentTool.ToolTip == "Blox Fruit") or
               (Settings.WeaponType == "Gun" and currentTool.ToolTip == "Gun") then
                return
            end
            humanoid:UnequipTools()
        end

        local foundTool = findToolByType(backpack)
        if foundTool then humanoid:EquipTool(foundTool) end
    end)
end

local function SkillSpam()
    if Settings.WeaponType == "Fruit" then return end
    if (Settings.WeaponType == "Gun") and Settings.AutoFarm then
        if UserInputService:GetFocusedTextBox() == nil then
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
                task.wait(0.2)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
                task.wait(0.2)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
            end)
        end
    end
end

local FastAttackModule = {}
local RegisterAttack = nil
local RegisterHit = nil

pcall(function()
    local Modules = ReplicatedStorage:WaitForChild("Modules", 10)
    local Net = Modules:WaitForChild("Net", 10)
    RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
    RegisterHit = Net:FindFirstChild("RE/RegisterHit")
end)

local FastAttackSettings = {
    AutoClick = true,
    ClickDelay = 0,
    Distance = 100
}

local function IsAlive(character)
    return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
end

local function ProcessEnemies(OthersEnemies, Folder)
    local BasePart = nil
    for _, Enemy in ipairs(Folder:GetChildren()) do
        local Head = Enemy:FindFirstChild("Head")
        if Head and IsAlive(Enemy) and LocalPlayer:DistanceFromCharacter(Head.Position) < FastAttackSettings.Distance then
            if Enemy ~= LocalPlayer.Character then
                table.insert(OthersEnemies, { Enemy, Head })
                BasePart = Head
            end
        end
    end
    return BasePart
end

function FastAttackModule:Attack(BasePart, OthersEnemies)
    if not BasePart or #OthersEnemies == 0 then return end
    pcall(function()
        if RegisterAttack then RegisterAttack:FireServer(FastAttackSettings.ClickDelay or 0) end
        if RegisterHit then RegisterHit:FireServer(BasePart, OthersEnemies) end
    end)
end

function FastAttackModule:AttackNearest()
    local OthersEnemies = {}
    local EnemiesFolder = Workspace:FindFirstChild("Enemies")
    local CharactersFolder = Workspace:FindFirstChild("Characters")
    local Part1 = nil
    local Part2 = nil
    if EnemiesFolder then Part1 = ProcessEnemies(OthersEnemies, EnemiesFolder) end
    if CharactersFolder then Part2 = ProcessEnemies(OthersEnemies, CharactersFolder) end
    local character = LocalPlayer.Character
    if not character then return end
    local equippedWeapon = character:FindFirstChildOfClass("Tool")
    if equippedWeapon and equippedWeapon:FindFirstChild("LeftClickRemote") then
        for _, enemyData in ipairs(OthersEnemies) do
            local enemy = enemyData[1]
            if enemy and enemy:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
                local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
                pcall(function() equippedWeapon.LeftClickRemote:FireServer(direction, 1) end)
            end
        end
    elseif #OthersEnemies > 0 then
        self:Attack(Part1 or Part2, OthersEnemies)
    else
        task.wait(0)
    end
end

function FastAttackModule:BladeHits()
    local Equipped = IsAlive(LocalPlayer.Character) and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if Equipped and Equipped.ToolTip ~= "Gun" then
        self:AttackNearest()
    else
        task.wait(0)
    end
end

task.spawn(function()
    while task.wait(FastAttackSettings.ClickDelay) do
        if Settings.UseFastAttackModule and Settings.AutoClick then
            FastAttackModule:BladeHits()
        end
    end
end)

local function FastAttack()
    if not Settings.UseFastAttackModule then
        pcall(function()
            local character = LocalPlayer.Character
            if not character then return end
            local tool = character:FindFirstChildOfClass("Tool")
            if not tool then return end
            local Module = ReplicatedStorage:WaitForChild("Modules", 10):WaitForChild("Net", 10)
            if Module then
                local RA = Module:FindFirstChild("RE/RegisterAttack")
                if RA then RA:FireServer(0) end
            end
        end)
    end
end

local function TweenTo(targetCFrame)
    pcall(function()
        local character = LocalPlayer.Character
        if not character then return end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local distance = (hrp.Position - targetCFrame.Position).Magnitude
        local speed = Settings.TweenSpeed or 300
        local time = distance / speed
        if CurrentTween then CurrentTween:Cancel() end
        local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        CurrentTween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
        CurrentTween:Play()
        if not hrp:FindFirstChild("FarmFloat") then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "FarmFloat"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.zero
            bv.Parent = hrp
        end
        local noclipRun = RunService.Stepped:Connect(ActivateNoclip)
        CurrentTween.Completed:Connect(function()
            noclipRun:Disconnect()
            if not Settings.AutoFarm and not Settings.AutoChest and not Settings.AutoMaterials and not Settings.AutoBonesGround then
                local bv = hrp:FindFirstChild("FarmFloat")
                if bv then bv:Destroy() end
            end
        end)
    end)
end

local function BringAllMobs(targetName, targetCFrame)
    pcall(function()
        local Enemies = Workspace:FindFirstChild("Enemies")
        if not Enemies then return end
        sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
        for _, mob in pairs(Enemies:GetChildren()) do
            if mob.Name == targetName and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                if mobHRP and (mobHRP.Position - targetCFrame.Position).Magnitude <= Settings.BringDistance then
                    local groundY = targetCFrame.Position.Y - 15
                    mobHRP.CFrame = CFrame.new(targetCFrame.Position.X, groundY, targetCFrame.Position.Z)
                    mobHRP.CanCollide = false
                    mobHRP.Size = Vector3.new(70, 70, 70)
                    mobHRP.Transparency = 1
                    if mobHRP:FindFirstChild("BodyVelocity") then mobHRP.BodyVelocity:Destroy() end
                    if mobHRP:FindFirstChild("BodyAngularVelocity") then mobHRP.BodyAngularVelocity:Destroy() end
                    mobHRP.Velocity = Vector3.zero
                    mobHRP.RotVelocity = Vector3.zero
                    mobHRP.AssemblyLinearVelocity = Vector3.zero
                    mobHRP.AssemblyAngularVelocity = Vector3.zero
                    mob.Humanoid.WalkSpeed = 0
                    mob.Humanoid.JumpPower = 0
                    mob.Humanoid.JumpHeight = 0
                    mob.Humanoid.HipHeight = 0
                    mob.Humanoid:ChangeState(11)
                    mob.Humanoid:ChangeState(14)
                    mob.Humanoid.AutoRotate = false
                    mob.Humanoid.PlatformStand = true
                    task.spawn(function()
                        while Settings.BringMobs and Settings.AutoFarm and mob and mob.Parent and mob.Humanoid.Health > 0 do
                            pcall(function()
                                mobHRP.CFrame = CFrame.new(targetCFrame.Position.X, groundY, targetCFrame.Position.Z)
                                mobHRP.Velocity = Vector3.zero
                                mobHRP.AssemblyLinearVelocity = Vector3.zero
                            end)
                            task.wait(0.1)
                        end
                    end)
                    if not mobHRP:FindFirstChild("LOCK") then
                        local bp = Instance.new("BodyPosition", mobHRP)
                        bp.Name = "LOCK"
                        bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        bp.Position = Vector3.new(targetCFrame.Position.X, groundY, targetCFrame.Position.Z)
                        bp.P = 999999999
                        bp.D = 999999
                    else
                        mobHRP.LOCK.Position = Vector3.new(targetCFrame.Position.X, groundY, targetCFrame.Position.Z)
                    end
                    if not mobHRP:FindFirstChild("LOCKROT") then
                        local bg = Instance.new("BodyGyro", mobHRP)
                        bg.Name = "LOCKROT"
                        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                        bg.P = 999999
                        bg.CFrame = CFrame.new(targetCFrame.Position.X, groundY, targetCFrame.Position.Z)
                    end
                end
            end
        end
    end)
end

local function AutoStatsLoop()
    if not Settings.AutoStats then return end
    pcall(function()
        local Data = LocalPlayer:FindFirstChild("Data")
        if Data and Data:FindFirstChild("Points") and Data.Points.Value > 0 then
            local args = {[1] = "AddPoint", [2] = Settings.StatsType, [3] = 1}
            game:GetService("ReplicatedStorage").Net:WaitForChild("RE/AddPoint"):FireServer(unpack(args))
        end
    end)
end

local function AutoChestLoop()
    if not Settings.AutoChest then return end
    if Settings.AutoFarm or Settings.AutoMaterials then return end
    pcall(function()
        local LP = game:GetService("Players").LocalPlayer
        local Position = (LP.Character or LP.CharacterAdded:Wait()):GetPivot().Position
        local Tagged = game:GetService("CollectionService"):GetTagged("_ChestTagged")
        local minDist = math.huge
        local nearestChest = nil
        for i = 1, #Tagged do
            local chest = Tagged[i]
            local chestDist = (chest:GetPivot().Position - Position).Magnitude
            if not chest:GetAttribute("IsDisabled") and chestDist < minDist then
                minDist = chestDist
                nearestChest = chest
            end
        end
        if nearestChest then
            TweenTo(CFrame.new(nearestChest:GetPivot().Position))
        end
    end)
end

local HauntedCastlePos = CFrame.new(-9515, 142, 5535)

local function AutoTrainRaceV4Loop()
    if not Settings.AutoTrainRaceV4 then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        TweenTo(HauntedCastlePos)
        task.wait(2)
        if not hrp:FindFirstChild("FarmFloat") then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "FarmFloat"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.zero
        end
        if not hrp:FindFirstChild("AntiSpin") then
            local bg = Instance.new("BodyGyro", hrp)
            bg.Name = "AntiSpin"
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.P = 3000
            bg.CFrame = hrp.CFrame
        end
        local Enemies = Workspace:FindFirstChild("Enemies")
        if Enemies then
            local nearestMob = nil
            local shortestDist = math.huge
            for _, mob in pairs(Enemies:GetChildren()) do
                if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                    local d = (mob.HumanoidRootPart.Position - HauntedCastlePos.Position).Magnitude
                    if d < shortestDist and d <= 1000 then
                        shortestDist = d
                        nearestMob = mob
                    end
                end
            end
            if nearestMob then
                repeat
                    task.wait()
                    if not Settings.AutoTrainRaceV4 then break end
                    local targetPos = nearestMob.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
                    hrp.CFrame = targetPos
                    local antiSpin = hrp:FindFirstChild("AntiSpin")
                    if antiSpin then antiSpin.CFrame = CFrame.new(hrp.Position, nearestMob.HumanoidRootPart.Position) end
                    FastAttack()
                    BringAllMobs(nearestMob.Name, hrp.CFrame)
                    SkillSpam()
                until not nearestMob or not nearestMob:FindFirstChild("Humanoid") or nearestMob.Humanoid.Health <= 0 or not Settings.AutoTrainRaceV4
            end
        end
        if not UserInputService:GetFocusedTextBox() then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Y, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Y, false, game)
        end
    end)
end

local BoatSpawned = false
local CurrentBoat = nil

local function SpawnAndFlyBoat()
    if BoatSpawned and CurrentBoat then return end
    pcall(function()
        local args = {[1] = "BuyBoat", [2] = "PirateBrigade"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        task.wait(2)
        local Boats = Workspace:FindFirstChild("Boats")
        if Boats then
            for _, boat in pairs(Boats:GetChildren()) do
                if boat:FindFirstChild("Owner") and boat.Owner.Value == LocalPlayer then
                    CurrentBoat = boat
                    BoatSpawned = true
                    if boat:FindFirstChild("Engine") then
                        boat.Engine.CFrame = boat.Engine.CFrame * CFrame.new(0, 50, 0)
                    end
                    break
                end
            end
        end
    end)
end

local function AutoSeaEventsLoop()
    if not Settings.AutoSeaEvents then
        BoatSpawned = false
        CurrentBoat = nil
        return
    end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if not BoatSpawned then SpawnAndFlyBoat(); return end
        local SeaBeasts = Workspace:WaitForChild("SeaBeasts", 5)
        if SeaBeasts then
            for _, beast in pairs(SeaBeasts:GetChildren()) do
                if beast:FindFirstChild("Humanoid") and beast.Humanoid.Health > 0 and beast:FindFirstChild("HumanoidRootPart") then
                    TweenTo(beast.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                    task.wait(1)
                    repeat
                        task.wait(0.5)
                        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                            if tool:IsA("Tool") then
                                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                                if humanoid then
                                    humanoid:EquipTool(tool)
                                    task.wait(0.3)
                                    local skills = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V, Enum.KeyCode.F}
                                    for _, key in pairs(skills) do
                                        if not UserInputService:GetFocusedTextBox() then
                                            VirtualInputManager:SendKeyEvent(true, key, false, game)
                                            task.wait(0.1)
                                            VirtualInputManager:SendKeyEvent(false, key, false, game)
                                            task.wait(0.1)
                                        end
                                    end
                                end
                            end
                        end
                    until not beast or not beast:FindFirstChild("Humanoid") or beast.Humanoid.Health <= 0 or not Settings.AutoSeaEvents
                end
            end
        end
        if CurrentBoat and CurrentBoat:FindFirstChild("Engine") then
            local randomPos = CFrame.new(math.random(-5000, 5000), 50, math.random(-5000, 5000))
            CurrentBoat.Engine.CFrame = randomPos
        end
    end)
end

local function AutoBonesLoop()
    if not Settings.AutoBones then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if World2 or World3 then
            local CursedShipPos = CFrame.new(-5085, 316, -3156)
            if (hrp.Position - CursedShipPos.Position).Magnitude > 500 then
                TweenTo(CursedShipPos)
                task.wait(3)
            end
        end
        local BonesMobs = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
        local Enemies = Workspace:FindFirstChild("Enemies")
        if Enemies then
            for _, mobName in pairs(BonesMobs) do
                for _, mob in pairs(Enemies:GetChildren()) do
                    if mob.Name == mobName and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            if not Settings.AutoBones then break end
                            EquipWeapon()
                            hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            FastAttack()
                            BringAllMobs(mob.Name, hrp.CFrame)
                            SkillSpam()
                        until not Settings.AutoBones or not mob:FindFirstChild("Humanoid") or mob.Humanoid.Health <= 0
                    end
                end
            end
        end
    end)
end

local function AutoBonesGroundLoop()
    if not Settings.AutoBonesGround then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local FarmCenter = nil
        local GroundLevelY = 0
        if World3 then
            FarmCenter = CFrame.new(-9515, 172, 5535)
            GroundLevelY = 142
        elseif World2 then
            FarmCenter = CFrame.new(-5085, 345, -3156)
            GroundLevelY = 316
        else
            return
        end
        if (hrp.Position - FarmCenter.Position).Magnitude > 50 then
            TweenTo(FarmCenter)
        else
            if CurrentTween then CurrentTween:Cancel(); CurrentTween = nil end
            hrp.CFrame = FarmCenter
            if not hrp:FindFirstChild("FarmFloat") then
                local bv = Instance.new("BodyVelocity", hrp)
                bv.Name = "FarmFloat"
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Velocity = Vector3.zero
            end
            EquipWeapon()
            FastAttack()
            SkillSpam()
            local Targets = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
            local Enemies = Workspace:FindFirstChild("Enemies")
            if Enemies then
                sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                for _, mob in pairs(Enemies:GetChildren()) do
                    if table.find(Targets, mob.Name) and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        local mHrp = mob:FindFirstChild("HumanoidRootPart")
                        if mHrp and (mHrp.Position - FarmCenter.Position).Magnitude < 400 then
                            local fixPos = CFrame.new(FarmCenter.Position.X, GroundLevelY + 3, FarmCenter.Position.Z)
                            mHrp.CFrame = fixPos
                            mHrp.CanCollide = false
                            mHrp.AssemblyLinearVelocity = Vector3.zero
                            mHrp.Velocity = Vector3.zero
                            mob.Humanoid.WalkSpeed = 0
                            mob.Humanoid.PlatformStand = true
                        end
                    end
                end
            end
        end
    end)
end

local function AutoFarmCandyLoop()
    if not Settings.AutoFarmCandy then return end
    if not World3 then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local playerPos = hrp.Position
        if playerPos.Y > -1500 then
            TweenTo(CFrame.new(-16269.77, 25.26, 1373.36))
            task.wait(3)
            local args = {"TravelToSubmergedIsland"}
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(args))
            task.wait(5)
        end
        local FarmPos = CFrame.new(-16234.55, -1505.87, 1582.94)
        if (hrp.Position - FarmPos.Position).Magnitude > 100 then
            TweenTo(FarmPos)
            task.wait(2)
        end
        local Enemies = Workspace:FindFirstChild("Enemies")
        if not Enemies or not Enemies:FindFirstChild("Grand Devotee [Elf]") then
            TweenTo(FarmPos)
            for _, Mob in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                if Mob.Name == "Grand Devotee [Elf]" then
                    TweenTo(Mob.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end
        else
            for _, Enemy in pairs(Enemies:GetChildren()) do
                if Enemy.Name == "Grand Devotee [Elf]" and Enemy:FindFirstChild("Humanoid") and Enemy:FindFirstChild("HumanoidRootPart") and Enemy.Humanoid.Health > 0 then
                    repeat
                        task.wait()
                        EquipWeapon()
                        Enemy.HumanoidRootPart.CanCollide = false
                        Enemy.Humanoid.WalkSpeed = 0
                        Enemy.Head.CanCollide = false
                        hrp.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                        FastAttack()
                        BringAllMobs(Enemy.Name, hrp.CFrame)
                        SkillSpam()
                        sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                    until not Settings.AutoFarmCandy or not Enemy.Parent or Enemy.Humanoid.Health <= 0
                end
            end
        end
    end)
end

local function AutoDracoV2Loop()
    if not Settings.AutoDracoV2 then return end
    if not World3 then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local FireFlower = Workspace:FindFirstChild("FireFlowers")
        local Enemies = Workspace:FindFirstChild("Enemies")
        local targetMob = nil
        if Enemies then
            for _, mob in pairs(Enemies:GetChildren()) do
                if mob.Name == "Forest Pirate" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    targetMob = mob
                    break
                end
            end
        end
        if targetMob and not FireFlower then
            repeat
                task.wait()
                EquipWeapon()
                hrp.CFrame = targetMob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                FastAttack()
                BringAllMobs(targetMob.Name, hrp.CFrame)
                SkillSpam()
            until not Settings.AutoDracoV2 or not targetMob.Parent or targetMob.Humanoid.Health <= 0 or FireFlower
        elseif not targetMob and not FireFlower then
            TweenTo(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
        end
        if FireFlower then
            for _, flower in pairs(FireFlower:GetChildren()) do
                if flower:IsA("Model") and flower.PrimaryPart then
                    local FlowerPos = flower.PrimaryPart.Position
                    local distance = (FlowerPos - hrp.Position).Magnitude
                    if distance <= 100 then
                        VirtualInputManager:SendKeyEvent(true, "E", false, game)
                        task.wait(1.5)
                        VirtualInputManager:SendKeyEvent(false, "E", false, game)
                    else
                        TweenTo(CFrame.new(FlowerPos))
                    end
                end
            end
        end
    end)
end

local function AutoHopBossLoop()
    if not Settings.AutoHopBoss then return end
    pcall(function()
        local selectedBoss = Settings.SelectedBoss
        local foundBoss = false
        for _, b in pairs(Workspace:GetChildren()) do
            if b.Name == selectedBoss and b:FindFirstChild("Humanoid") then foundBoss = true; break end
        end
        if not foundBoss then
            if game:GetService("ReplicatedStorage"):FindFirstChild(selectedBoss) then foundBoss = true end
        end
        if not foundBoss then
            Library:Notify({Title = "Boss Hop", Desc = selectedBoss .. " nao encontrado. Mudando servidor...", Duration = 3})
            task.wait(2)
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
    end)
end

local function AutoSpawnBossLoop()
    if not Settings.AutoSpawnBoss then return end
    pcall(function()
        local BossSpawners = {
            ["Thunder God"] = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end,
            ["Greybeard"] = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4894.6201171875, 733.46051025391, 853.14392089844))
            end,
            ["Cursed Captain"] = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(916.928589, 181.092773, 33422))
            end,
            ["Dough King"] = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
            end,
            ["Soul Reaper"] = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
            end
        }
        local spawner = BossSpawners[Settings.SelectedBoss]
        if spawner then spawner() end
    end)
end

local function AutoBossNoHitLoop()
    if not Settings.AutoBossNoHit then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local boss = nil
        for _, b in pairs(Workspace:GetChildren()) do
            if b.Name == Settings.SelectedBoss and b:FindFirstChild("Humanoid") and b.Humanoid.Health > 0 then
                boss = b; break
            end
        end
        if boss and boss:FindFirstChild("HumanoidRootPart") then
            repeat
                task.wait()
                EquipWeapon()
                local bossPos = boss.HumanoidRootPart.Position
                hrp.CFrame = CFrame.new(bossPos.X, bossPos.Y + 50, bossPos.Z)
                FastAttack()
                SkillSpam()
            until not Settings.AutoBossNoHit or not boss:FindFirstChild("Humanoid") or boss.Humanoid.Health <= 0
        end
    end)
end

local function AutoSecretBossLoop()
    if not Settings.AutoSecretBoss then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local SecretBosses = {"Cake Prince", "Dough King", "Soul Reaper", "rip_indra True Form", "Longma"}
        for _, bossName in pairs(SecretBosses) do
            local boss = Workspace:FindFirstChild(bossName) or game:GetService("ReplicatedStorage"):FindFirstChild(bossName)
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and boss:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    EquipWeapon()
                    hrp.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                    FastAttack()
                    SkillSpam()
                until not Settings.AutoSecretBoss or not boss:FindFirstChild("Humanoid") or boss.Humanoid.Health <= 0
            end
        end
    end)
end

local function AutoCollectFruitLoop()
    if not Settings.AutoCollectFruit then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        for _, fruit in pairs(Workspace:GetChildren()) do
            if string.find(fruit.Name, "Fruit") and fruit:FindFirstChild("Handle") then
                if (hrp.Position - fruit.Handle.Position).Magnitude < 200 then
                    hrp.CFrame = fruit.Handle.CFrame
                    task.wait(0.5)
                end
            end
        end
    end)
end

local function AutoNotifierFruitLoop()
    if not Settings.AutoNotifierFruit then return end
    task.spawn(function()
        for _, fruit in pairs(Workspace:GetChildren()) do
            if string.find(fruit.Name, "Fruit") and fruit:FindFirstChild("Handle") then
                Library:Notify({Title = "Fruit Spawn", Desc = fruit.Name .. " spawnou!", Duration = 5})
            end
        end
    end)
end

local function AutoStoreFruitLoop()
    if not Settings.AutoStoreFruit then return end
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name)
    end)
end

local BadFruits = {"Kilo", "Spin", "Chop", "Spring", "Bomb", "Smoke", "Spike"}

local function AutoDropBadFruitLoop()
    if not Settings.AutoDropBadFruit then return end
    pcall(function()
        for _, fruit in pairs(LocalPlayer.Backpack:GetChildren()) do
            if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                for _, badFruit in pairs(BadFruits) do
                    if string.find(fruit.Name, badFruit) then
                        LocalPlayer.Character.Humanoid:EquipTool(fruit)
                        task.wait(0.3)
                        LocalPlayer.Character.Humanoid:UnequipTools()
                        task.wait(0.3)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", fruit.Name)
                    end
                end
            end
        end
    end)
end

local function AutoEatFruitLoop()
    if not Settings.AutoEatFruit then return end
    pcall(function()
        for _, fruit in pairs(LocalPlayer.Backpack:GetChildren()) do
            if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                LocalPlayer.Character.Humanoid:EquipTool(fruit)
                task.wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Eatfruit", fruit.Name)
                break
            end
        end
    end)
end

local function AutoRollFruitLoop()
    if not Settings.AutoRollFruit then return end
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({[1] = "Cousin", [2] = "Buy"}))
    end)
end

local function AutoSniperFruitLoop()
    if not Settings.AutoSniperFruit then return end
    pcall(function()
        local foundFruit = false
        for _, fruit in pairs(Workspace:GetChildren()) do
            if string.find(fruit.Name, "Fruit") and fruit:FindFirstChild("Handle") then
                foundFruit = true; break
            end
        end
        if not foundFruit then
            Library:Notify({Title = "Fruit Sniper", Desc = "Nenhuma fruta encontrada. Mudando servidor...", Duration = 3})
            task.wait(2)
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
    end)
end

local function AutoEctoplasmLoop()
    if not Settings.AutoEctoplasm then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if World2 or World3 then
            local CursedShipPos = CFrame.new(-5085, 316, -3156)
            if (hrp.Position - CursedShipPos.Position).Magnitude > 500 then
                TweenTo(CursedShipPos)
                task.wait(3)
            end
        end
        local EctoplasmMobs = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
        local Enemies = Workspace:FindFirstChild("Enemies")
        if Enemies then
            for _, mobName in pairs(EctoplasmMobs) do
                for _, mob in pairs(Enemies:GetChildren()) do
                    if mob.Name == mobName and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            if not Settings.AutoEctoplasm then break end
                            EquipWeapon()
                            hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            FastAttack()
                            BringAllMobs(mob.Name, hrp.CFrame)
                            SkillSpam()
                        until not Settings.AutoEctoplasm or not mob:FindFirstChild("Humanoid") or mob.Humanoid.Health <= 0
                    end
                end
            end
        end
    end)
end

local function AutoBossLoop()
    if not Settings.AutoBoss then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local BossList = {
            ["Thunder God"] = {Position = CFrame.new(-7748, 5606, -2305)},
            ["Greybeard"] = {Position = CFrame.new(-4950, 125, 4244)},
            ["Saber Expert"] = {Position = CFrame.new(-1459, 30, -50)},
            ["The Saw"] = {Position = CFrame.new(-683, 16, 1459)},
            ["Warden"] = {Position = CFrame.new(4880, 5, 734)},
            ["Chief Warden"] = {Position = CFrame.new(4880, 5, 734)},
            ["Swan"] = {Position = CFrame.new(4914, 608, 853)},
            ["Diamond"] = {Position = CFrame.new(-1736, 198, -236)},
            ["Jeremy"] = {Position = CFrame.new(2316, 449, 787)},
            ["Fajita"] = {Position = CFrame.new(-2165, 73, -3902)},
            ["Don Swan"] = {Position = CFrame.new(2288, 15, 808)},
            ["Smoke Admiral"] = {Position = CFrame.new(-5077, 23, -5098)},
            ["Cursed Captain"] = {Position = CFrame.new(916, 181, 33422)},
            ["Darkbeard"] = {Position = CFrame.new(3876, 24, -3820)},
            ["Order"] = {Position = CFrame.new(-6208, 16, -5016)},
            ["Stone"] = {Position = CFrame.new(-1049, 40, 6791)},
            ["Island Empress"] = {Position = CFrame.new(5730, 602, 199)},
            ["Kilo Admiral"] = {Position = CFrame.new(2889, 423, -7230)},
            ["Captain Elephant"] = {Position = CFrame.new(-13485, 319, -8426)},
            ["Beautiful Pirate"] = {Position = CFrame.new(5241, 23, -11628)},
            ["Cake Queen"] = {Position = CFrame.new(-821, 66, -10965)},
            ["rip_indra True Form"] = {Position = CFrame.new(-5359, 424, -2735)},
        }
        local bossData = BossList[Settings.SelectedBoss]
        if bossData then
            local boss = Workspace:FindFirstChild(Settings.SelectedBoss) or game:GetService("ReplicatedStorage"):FindFirstChild(Settings.SelectedBoss)
            if not boss then
                TweenTo(bossData.Position)
                task.wait(2)
                boss = Workspace:FindFirstChild(Settings.SelectedBoss)
            end
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and boss:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    if not Settings.AutoBoss then break end
                    EquipWeapon()
                    hrp.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                    FastAttack()
                    SkillSpam()
                until not Settings.AutoBoss or not boss:FindFirstChild("Humanoid") or boss.Humanoid.Health <= 0
            end
        end
    end)
end

local function AutoKillPlayerLoop()
    if not Settings.AutoKillPlayer then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local nearestPlayers = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist <= Settings.KillPlayerDistance then
                    table.insert(nearestPlayers, {player = plr, distance = dist})
                end
            end
        end
        table.sort(nearestPlayers, function(a, b) return a.distance < b.distance end)
        for i = 1, math.min(2, #nearestPlayers) do
            local targetPlayer = nearestPlayers[i].player
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    if not Settings.AutoKillPlayer then break end
                    hrp.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                    EquipWeapon()
                    FastAttack()
                    SkillSpam()
                until not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Humanoid") or targetPlayer.Character.Humanoid.Health <= 0 or not Settings.AutoKillPlayer
            end
        end
    end)
end

local function AutoFindMirageLoop()
    if not Settings.AutoFindMirage then return end
    pcall(function()
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
            TweenTo(game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island').CFrame)
            Library:Notify({Title = "Mirage Island", Desc = "Mirage Island encontrada! Teleportando...", Duration = 5})
            task.wait(10)
        end
    end)
end

local function AutoFindKitsuneLoop()
    if not Settings.AutoFindKitsune then return end
    pcall(function()
        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
            TweenTo(game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland").CFrame)
            Library:Notify({Title = "Kitsune Island", Desc = "Kitsune Island encontrada! Teleportando...", Duration = 5})
            task.wait(10)
        end
    end)
end

local function AutoFindPreHistoricLoop()
    if not Settings.AutoFindPreHistoric then return end
    pcall(function()
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island') then
            TweenTo(game.Workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island').CFrame)
            Library:Notify({Title = "Prehistoric Island", Desc = "Prehistoric Island encontrada! Teleportando...", Duration = 5})
            task.wait(10)
        end
    end)
end

local function AutoLeviathanLoop()
    if not Settings.AutoLeviathan then return end
    if not World3 then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local hasBoat = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CheckOwnBoat", "PirateBrigade")
        if not hasBoat then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({[1] = "BuyBoat", [2] = "PirateBrigade"}))
            task.wait(2)
        end
        local spyResult = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CheckPirateSpyStatus")
        if spyResult and type(spyResult) == "string" and string.find(spyResult, "cooldown") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RemovePirateSpyCooldown")
            task.wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyPirateSpy")
        task.wait(2)
        local Boats = Workspace:FindFirstChild("Boats")
        local myBoat = nil
        if Boats then
            for _, boat in pairs(Boats:GetChildren()) do
                if boat:FindFirstChild("Owner") and boat.Owner.Value == LocalPlayer then myBoat = boat; break end
            end
        end
        if myBoat and myBoat:FindFirstChild("Engine") then
            local frozenFound = false
            for i = 1, 100 do
                task.wait(1)
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                    frozenFound = true
                    local frozenPos = game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension').CFrame
                    myBoat.Engine.CFrame = CFrame.new(frozenPos.Position.X, 50, frozenPos.Position.Z)
                    task.wait(2)
                    hrp.CFrame = frozenPos
                    task.wait(3)
                    break
                end
                myBoat.Engine.CFrame = CFrame.new(math.random(-10000, 10000), 50, math.random(-10000, 10000))
            end
            if frozenFound then
                local Leviathan = Workspace:FindFirstChild("Leviathan")
                if not Leviathan then
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy.Name == "Leviathan" then Leviathan = enemy; break end
                    end
                end
                if Leviathan and Leviathan:FindFirstChild("Humanoid") and Leviathan:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        if not Settings.AutoLeviathan then break end
                        EquipWeapon()
                        hrp.CFrame = Leviathan.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                        FastAttack()
                        SkillSpam()
                    until not Settings.AutoLeviathan or not Leviathan:FindFirstChild("Humanoid") or Leviathan.Humanoid.Health <= 0
                end
            end
        end
    end)
end

local function AutoFindFrozenLoop()
    if not Settings.AutoFindFrozen then return end
    pcall(function()
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
            TweenTo(game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension').CFrame)
            Library:Notify({Title = "Frozen Dimension", Desc = "Frozen Dimension encontrada! Teleportando...", Duration = 5})
            task.wait(10)
        end
    end)
end

local function AutoFragmentsLoop()
    if not Settings.AutoFragments then return end
    Settings.AutoRaid = true
end

local function GetMaterialInfo()
    local MMon, MPos, SP = "", CFrame.new(0,0,0), ""
    if Settings.SelectedMaterial == "Radiactive Material" then
        MMon = "Factory Staff"; MPos = CFrame.new(-105.889565, 72.8076935, -670.247986); SP = "Bar"
    elseif Settings.SelectedMaterial == "Leather" or Settings.SelectedMaterial == "Scrap Metal" then
        MMon = "Galley Pirate"; MPos = CFrame.new(-1462, 5, -40); SP = "Pirate Village"
    end
    return MMon, MPos, SP
end

local function AutoMaterialsLoop()
    if not Settings.AutoMaterials then return end
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local MMon, MPos, SP = GetMaterialInfo()
        if MMon == "" then return end
        if (hrp.Position - MPos.Position).Magnitude > 200 then
            TweenTo(MPos)
            task.wait(2)
        end
        local Enemies = Workspace:FindFirstChild("Enemies")
        if Enemies then
            for _, mob in pairs(Enemies:GetChildren()) do
                if mob.Name == MMon and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    repeat
                        task.wait()
                        if not Settings.AutoMaterials then break end
                        EquipWeapon()
                        hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                        FastAttack()
                        BringAllMobs(mob.Name, hrp.CFrame)
                        SkillSpam()
                    until not Settings.AutoMaterials or not mob:FindFirstChild("Humanoid") or mob.Humanoid.Health <= 0
                end
            end
        end
    end)
end

local EspContainer = Instance.new("Folder", Workspace)
EspContainer.Name = "AbacaxiESP"

local function UpdateESP()
    pcall(function()
        EspContainer:ClearAllChildren()
        if Settings.EspPlayers then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                    local h = Instance.new("Highlight", EspContainer)
                    h.Adornee = plr.Character
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                    h.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            end
        end
        if Settings.EspFruits then
            for _, v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    local bg = Instance.new("BillboardGui", EspContainer)
                    bg.Adornee = v:FindFirstChild("Handle")
                    bg.Size = UDim2.new(0, 200, 0, 50)
                    bg.AlwaysOnTop = true
                    local txt = Instance.new("TextLabel", bg)
                    txt.Size = UDim2.new(1,0,1,0)
                    txt.Text = v.Name
                    txt.TextColor3 = Color3.fromRGB(0, 255, 0)
                    txt.BackgroundTransparency = 1
                end
            end
        end
        if Settings.EspBosses then
            for _, boss in pairs(Workspace:GetChildren()) do
                if boss:FindFirstChild("Humanoid") and boss.Humanoid.MaxHealth >= 10000 then
                    local h = Instance.new("Highlight", EspContainer)
                    h.Adornee = boss
                    h.FillColor = Color3.fromRGB(255, 255, 0)
                    h.OutlineColor = Color3.fromRGB(255, 0, 0)
                end
            end
        end
    end)
end

local AimbotConnection = nil
local M1HoldConnection = nil

local function CleanupFarmEffects()
    pcall(function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if hrp:FindFirstChild("FarmFloat") then hrp.FarmFloat:Destroy() end
            if hrp:FindFirstChild("AntiSpin") then hrp.AntiSpin:Destroy() end
        end
        if AimbotConnection then AimbotConnection:Disconnect(); AimbotConnection = nil end
        if M1HoldConnection then M1HoldConnection:Disconnect(); M1HoldConnection = nil end
        if CurrentTween then CurrentTween:Cancel(); CurrentTween = nil end
    end)
end

local function SetupGunAimbot(target)
    if Settings.WeaponType ~= "Gun" then return end
    if AimbotConnection then return end
    pcall(function()
        local Camera = Workspace.CurrentCamera
        AimbotConnection = RunService.RenderStepped:Connect(function()
            if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.HumanoidRootPart.Position)
            else
                if AimbotConnection then AimbotConnection:Disconnect(); AimbotConnection = nil end
            end
        end)
    end)
end

local function StartM1Hold()
    if M1HoldConnection then return end
    pcall(function()
        M1HoldConnection = RunService.Heartbeat:Connect(function()
            if Settings.AutoFarm and Settings.WeaponType == "Gun" then
                mouse1press()
                task.wait(0.3)
                mouse1release()
                task.wait(0.1)
            end
        end)
    end)
end

local function FarmLoop()
    if not Settings.AutoFarm then
        IsPositioning = false
        CleanupFarmEffects()
        return
    end
    pcall(function()
        local character = LocalPlayer.Character
        if not character then return end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        EquipWeapon()
        local nearestMob = nil
        local shortestDist = math.huge
        local Enemies = Workspace:FindFirstChild("Enemies")
        if Enemies then
            for _, mob in pairs(Enemies:GetChildren()) do
                if Settings.FarmMode == "Selected" and Settings.SelectedMob ~= "" and mob.Name ~= Settings.SelectedMob then continue end
                if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                    local d = (mob.HumanoidRootPart.Position - hrp.Position).Magnitude
                    if d < shortestDist and d <= Settings.FarmDistance then
                        shortestDist = d
                        nearestMob = mob
                    end
                end
            end
        end
        if nearestMob then
            CurrentTarget = nearestMob
            IsPositioning = true
            local targetPos = nearestMob.HumanoidRootPart.CFrame * CFrame.new(0, Settings.FarmHeight, 0)
            if not hrp:FindFirstChild("FarmFloat") then
                local bv = Instance.new("BodyVelocity", hrp)
                bv.Name = "FarmFloat"
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Velocity = Vector3.zero
            end
            if not hrp:FindFirstChild("AntiSpin") then
                local bg = Instance.new("BodyGyro", hrp)
                bg.Name = "AntiSpin"
                bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                bg.P = 3000
                bg.CFrame = hrp.CFrame
            end
            local dist = (hrp.Position - targetPos.Position).Magnitude
            if dist > 40 then
                TweenTo(targetPos)
            else
                if CurrentTween then CurrentTween:Cancel(); CurrentTween = nil end
                if Settings.WeaponType ~= "Fruit" then
                    hrp.CFrame = targetPos
                    local antiSpin = hrp:FindFirstChild("AntiSpin")
                    if antiSpin then antiSpin.CFrame = CFrame.new(hrp.Position, nearestMob.HumanoidRootPart.Position) end
                else
                    if not hrp:FindFirstChild("FruitFloat") then
                        local bv = Instance.new("BodyVelocity", hrp)
                        bv.Name = "FruitFloat"
                        bv.MaxForce = Vector3.new(math.huge, 0, math.huge)
                        bv.Velocity = Vector3.zero
                    end
                    local direction = (nearestMob.HumanoidRootPart.Position - hrp.Position).Unit
                    local distance = (nearestMob.HumanoidRootPart.Position - hrp.Position).Magnitude
                    if distance > 25 then
                        hrp.CFrame = hrp.CFrame + direction * 0.5
                    else
                        local fruitFloat = hrp:FindFirstChild("FruitFloat")
                        if fruitFloat then fruitFloat.Velocity = Vector3.zero end
                    end
                end
                if Settings.BringMobs then BringAllMobs(nearestMob.Name, hrp.CFrame) end
                SkillSpam()
                if Settings.WeaponType == "Gun" then SetupGunAimbot(nearestMob); StartM1Hold() end
                if Settings.AutoClick then FastAttack() end
            end
        else
            IsPositioning = false
            CleanupFarmEffects()
            if hrp:FindFirstChild("FruitFloat") then hrp.FruitFloat:Destroy() end
        end
    end)
end

-- =========================================
-- ILHAS
-- =========================================
local AllIslands = {}
if World1 then
    AllIslands = {
        ["Starter Island"] = CFrame.new(1071, 17, 1426),
        ["Jungle"] = CFrame.new(-1428, 0, 452),
        ["Pirate Village"] = CFrame.new(-1149, 5, 3847),
        ["Desert"] = CFrame.new(944, 7, 4373),
        ["Frozen Village"] = CFrame.new(1099, 105, -1348),
        ["Marine"] = CFrame.new(-2654, 23, -3158),
        ["Middle Town"] = CFrame.new(-650, 7, 1550),
        ["Colosseum"] = CFrame.new(-1847, 7, -2848),
    }
elseif World2 then
    AllIslands = {
        ["Kingdom of Rose"] = CFrame.new(-187, 7, -1825),
        ["Magma Village"] = CFrame.new(-3286, 7, 1550),
        ["Underwater City"] = CFrame.new(-550, 7, -6035),
        ["Green Zone"] = CFrame.new(-2630, 7, -3750),
        ["Snow Mountain"] = CFrame.new(1087, 395, -5428),
        ["Hot and Cold"] = CFrame.new(-9553, 7, -1819),
    }
elseif World3 then
    AllIslands = {
        ["Port Town"] = CFrame.new(-335, 39, 6059),
        ["Great Tree"] = CFrame.new(2685, 390, -7466),
        ["Hydra Island"] = CFrame.new(5756, 610, -263),
        ["Floating Turtle"] = CFrame.new(-13274, 332, -7632),
        ["Haunted Castle"] = CFrame.new(-9515, 142, 5535),
        ["Sea Castle"] = CFrame.new(-5075, 314, -3152),
        ["Ice Cream Land"] = CFrame.new(-906, 79, -10992),
        ["Peanut Island"] = CFrame.new(-2160, 40, -10194),
        ["Cake Land"] = CFrame.new(-1959, 38, -11815),
        ["Candy Land"] = CFrame.new(-1013, 73, -14555),
        ["Tiki Outpost"] = CFrame.new(-16234, 9, 437),
    }
end

-- =========================================
-- ===  CRIAÇÃO DA UI (BANANUI)  ============
-- =========================================

-- TAB: Farming
local Tab_Farm = Window:AddTab("Farming", "rbxassetid://7733960981")
local Sec_Farm = Tab_Farm:AddLeftGroupbox("Auto Farm")

Sec_Farm:AddToggle("AutoFarm", {
    Title = "Auto Farm Level / Nearest (BETA)",
    Default = false,
    Callback = function(v) Settings.AutoFarm = v end
})

Sec_Farm:AddDropdown("WeaponType", {
    Title = "Weapon Type",
    Values = {"Melee", "Sword", "Fruit", "Gun"},
    Default = "Melee",
    Callback = function(v) Settings.WeaponType = v end
})

Sec_Farm:AddToggle("AutoMastery", {
    Title = "Auto Mastery Mode",
    Default = false,
    Callback = function(v) Settings.AutoMastery = v end
})

Sec_Farm:AddDropdown("FarmMode", {
    Title = "Target Mode",
    Values = {"Nearest", "Selected"},
    Default = "Nearest",
    Callback = function(v) Settings.FarmMode = v end
})

local mobsList = {}
local EnemiesF = Workspace:FindFirstChild("Enemies")
if EnemiesF then
    for _,v in pairs(EnemiesF:GetChildren()) do
        if not table.find(mobsList, v.Name) then table.insert(mobsList, v.Name) end
    end
end
table.insert(mobsList, 1, "All Mobs")

Sec_Farm:AddDropdown("SelectedMob", {
    Title = "Select Mob",
    Values = mobsList,
    Default = "All Mobs",
    Callback = function(v) Settings.SelectedMob = (v == "All Mobs") and "" or v end
})

Sec_Farm:AddSlider("FarmDistance", {
    Title = "Farm Distance",
    Min = 500,
    Max = 5000,
    Default = 2500,
    Callback = function(v) Settings.FarmDistance = v end
})

Sec_Farm:AddToggle("BringMobs", {
    Title = "Bring Mobs (Ground Fix)",
    Default = true,
    Callback = function(v) Settings.BringMobs = v end
})

local Sec_Combat = Tab_Farm:AddRightGroupbox("Combat Settings")

Sec_Combat:AddToggle("UseFastAttackModule", {
    Title = "Use Fast Attack Module",
    Default = true,
    Callback = function(v) Settings.UseFastAttackModule = v end
})

Sec_Combat:AddToggle("AutoHop30Min", {
    Title = "Auto Hop (30 Min)",
    Default = false,
    Callback = function(v) Settings.AutoHop30Min = v end
})

Sec_Combat:AddToggle("AutoBuso", {
    Title = "Auto Turn on Buso",
    Default = false,
    Callback = function(v) Settings.AutoBuso = v end
})

Sec_Combat:AddToggle("AutoHakiObservation", {
    Title = "Auto Haki Observation",
    Default = false,
    Callback = function(v) Settings.AutoHakiObservation = v end
})

Sec_Combat:AddToggle("AutoRaceV3", {
    Title = "Auto Race V3",
    Default = false,
    Callback = function(v) Settings.AutoRaceV3 = v end
})

Sec_Combat:AddToggle("AutoRaceV4", {
    Title = "Auto Race V4",
    Default = false,
    Callback = function(v) Settings.AutoRaceV4 = v end
})

-- TAB: Stats
local Tab_Stats = Window:AddTab("Stats", "rbxassetid://7733954611")
local Sec_Stats = Tab_Stats:AddLeftGroupbox("Auto Stats")

Sec_Stats:AddToggle("AutoStats", {
    Title = "Enable Auto Stats",
    Default = false,
    Callback = function(v) Settings.AutoStats = v end
})

Sec_Stats:AddDropdown("StatsType", {
    Title = "Select Stat to Upgrade",
    Values = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"},
    Default = "Melee",
    Callback = function(v) Settings.StatsType = v end
})

local Sec_ServerStatus = Tab_Stats:AddRightGroupbox("Server Status")

Sec_ServerStatus:AddLabel("Time Zone: Loading...")
local TimeZoneLabel = Sec_ServerStatus:AddLabel("Game Time: Loading...")
local MirageLabel = Sec_ServerStatus:AddLabel("Mirage Island: Checking...")
local KitsuneLabel = Sec_ServerStatus:AddLabel("Kitsune Island: Checking...")
local PreHistoricLabel = Sec_ServerStatus:AddLabel("Prehistoric Island: Checking...")
local FrozenLabel = Sec_ServerStatus:AddLabel("Frozen Dimension: Checking...")
local CakePrinceLabel = Sec_ServerStatus:AddLabel("Cake Prince: Checking...")
local FullMoonLabel = Sec_ServerStatus:AddLabel("Moon: Checking...")
local EliteHunterLabel = Sec_ServerStatus:AddLabel("Elite Hunter: Checking...")
local DoughKingLabel = Sec_ServerStatus:AddLabel("Dough King: Checking...")

-- TAB: Mastery
local Tab_Mastery = Window:AddTab("Mastery", "rbxassetid://7733960981")
local Sec_Mastery = Tab_Mastery:AddLeftGroupbox("Mastery Farming")

Sec_Mastery:AddToggle("FruitMastery", {
    Title = "Fruit Mastery (BETA)",
    Default = false,
    Callback = function(v) Settings.FruitMastery = v; Settings.WeaponType = "Fruit" end
})

Sec_Mastery:AddToggle("SwordMastery", {
    Title = "Sword Mastery (BETA)",
    Default = false,
    Callback = function(v) Settings.SwordMastery = v; Settings.WeaponType = "Sword" end
})

Sec_Mastery:AddToggle("GunMastery", {
    Title = "Gun Mastery (BETA)",
    Default = false,
    Callback = function(v) Settings.GunMastery = v; Settings.WeaponType = "Gun" end
})

Sec_Mastery:AddToggle("FightingStyleMastery", {
    Title = "Fighting Style Mastery (BETA)",
    Default = false,
    Callback = function(v) Settings.FightingStyleMastery = v; Settings.WeaponType = "Melee" end
})

-- TAB: Chest/Map
local Tab_Chest = Window:AddTab("Chest/Map", "rbxassetid://7733954611")
local Sec_Chest = Tab_Chest:AddLeftGroupbox("Chest Farming")

Sec_Chest:AddToggle("AutoChest", {
    Title = "Auto Chest (BETA)",
    Default = false,
    Callback = function(v) Settings.AutoChest = v end
})

Sec_Chest:AddToggle("AutoHiddenChest", {
    Title = "Auto Hidden Chest (BETA)",
    Default = false,
    Callback = function(v) Settings.AutoHiddenChest = v end
})

-- TAB: Fruits
local Tab_Fruits = Window:AddTab("Fruits", "rbxassetid://7733920644")
local Sec_Fruits = Tab_Fruits:AddLeftGroupbox("Devil Fruit Farming")

Sec_Fruits:AddToggle("AutoDevilFruit", {Title = "Auto Devil Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoDevilFruit = v end})
Sec_Fruits:AddToggle("AutoCollectFruit", {Title = "Auto Collect Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoCollectFruit = v end})
Sec_Fruits:AddToggle("AutoNotifierFruit", {Title = "Auto Notifier Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoNotifierFruit = v end})
Sec_Fruits:AddToggle("AutoStoreFruit", {Title = "Auto Store Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoStoreFruit = v end})
Sec_Fruits:AddToggle("AutoDropBadFruit", {Title = "Auto Drop Bad Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoDropBadFruit = v end})
Sec_Fruits:AddToggle("AutoEatFruit", {Title = "Auto Eat Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoEatFruit = v end})

local Sec_FruitGacha = Tab_Fruits:AddRightGroupbox("Fruit Gacha & Sniper")
Sec_FruitGacha:AddToggle("AutoRollFruit", {Title = "Auto Roll Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoRollFruit = v end})
Sec_FruitGacha:AddToggle("AutoSniperFruit", {Title = "Auto Sniper Fruit (BETA)", Default = false, Callback = function(v) Settings.AutoSniperFruit = v end})

-- TAB: Fragments
local Tab_Frags = Window:AddTab("Fragments", "rbxassetid://7733954611")
local Sec_Frags = Tab_Frags:AddLeftGroupbox("Fragment Farming")
Sec_Frags:AddToggle("AutoFragments", {Title = "Auto Fragments (BETA)", Default = false, Callback = function(v) Settings.AutoFragments = v end})

-- TAB: Bosses
local Tab_Bosses = Window:AddTab("Bosses", "rbxassetid://7733960981")
local Sec_Bosses = Tab_Bosses:AddLeftGroupbox("Boss Farming")

local BossNamesList = {
    "Thunder God", "Greybeard", "Saber Expert", "The Saw", "Warden", "Chief Warden", "Swan",
    "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Cursed Captain", "Darkbeard", "Order",
    "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate",
    "Cake Queen", "rip_indra True Form", "Longma", "Soul Reaper", "Dough King"
}

Sec_Bosses:AddDropdown("SelectedBoss", {
    Title = "Select Boss",
    Values = BossNamesList,
    Default = "Thunder God",
    Callback = function(v) Settings.SelectedBoss = v end
})

Sec_Bosses:AddToggle("AutoBoss", {Title = "Auto Boss (BETA)", Default = false, Callback = function(v) Settings.AutoBoss = v end})
Sec_Bosses:AddToggle("AutoHopBoss", {Title = "Auto Hop Boss (BETA)", Default = false, Callback = function(v) Settings.AutoHopBoss = v end})
Sec_Bosses:AddToggle("AutoSpawnBoss", {Title = "Auto Spawn Boss (BETA)", Default = false, Callback = function(v) Settings.AutoSpawnBoss = v end})
Sec_Bosses:AddToggle("AutoBossNoHit", {Title = "Auto Boss No Hit (BETA)", Default = false, Callback = function(v) Settings.AutoBossNoHit = v end})
Sec_Bosses:AddToggle("AutoSecretBoss", {Title = "Auto Secret Boss (BETA)", Default = false, Callback = function(v) Settings.AutoSecretBoss = v end})

-- TAB: Materials
local Tab_Materials = Window:AddTab("Materials", "rbxassetid://7733954611")
local Sec_Materials = Tab_Materials:AddLeftGroupbox("Material Farming")

local MaterialsList = {"Radiactive Material", "Leather", "Scrap Metal", "Magma Ore", "Fish Tail", "Angel Wings", "Mystic Droplet", "Vampire Fang", "Gunpowder", "Mini Tusk", "Conjured Cocoa"}

Sec_Materials:AddDropdown("SelectedMaterial", {
    Title = "Select Material",
    Values = MaterialsList,
    Default = "Leather",
    Callback = function(v) Settings.SelectedMaterial = v end
})

Sec_Materials:AddToggle("AutoMaterials", {Title = "Auto Materials (BETA)", Default = false, Callback = function(v) Settings.AutoMaterials = v end})

-- TAB: Race/Evolution
local Tab_Race = Window:AddTab("Race", "rbxassetid://7733960981")
local Sec_Race = Tab_Race:AddLeftGroupbox("Race Evolution")

Sec_Race:AddToggle("AutoTrainRaceV4", {Title = "Auto Train Race V4 (BETA)", Default = false, Callback = function(v) Settings.AutoTrainRaceV4 = v end})
Sec_Race:AddToggle("AutoRaceV4b", {Title = "Auto Race V4 (Spam Y)", Default = false, Callback = function(v) Settings.AutoRaceV4 = v end})
Sec_Race:AddToggle("AutoRaceV3b", {Title = "Auto Race V3 (Spam T)", Default = false, Callback = function(v) Settings.AutoRaceV3 = v end})

local Sec_Trial = Tab_Race:AddRightGroupbox("Trial Settings")
Sec_Trial:AddToggle("AutoKillPlayer", {Title = "Auto Kill Players (BETA)", Default = false, Callback = function(v) Settings.AutoKillPlayer = v end})
Sec_Trial:AddSlider("KillPlayerDistance", {Title = "Kill Distance", Min = 500, Max = 5000, Default = 2000, Callback = function(v) Settings.KillPlayerDistance = v end})

-- TAB: Raid/Dungeon
local Tab_Raid = Window:AddTab("Raid", "rbxassetid://7733954611")
local Sec_Raid = Tab_Raid:AddLeftGroupbox("Dungeon & Raiding")

local ChipsList = {"Dough", "Flame", "Ice", "Quake", "Light", "Dark", "Spider", "Rumble", "Magma", "Buddha"}

Sec_Raid:AddDropdown("AutoSelectChip", {
    Title = "Select Chip",
    Values = ChipsList,
    Default = "Dough",
    Callback = function(v) Settings.AutoSelectChip = v end
})

Sec_Raid:AddToggle("AutoBuyChipBeli", {Title = "Auto Buy Chip [Beli]", Default = false, Callback = function(v) Settings.AutoBuyChipBeli = v end})
Sec_Raid:AddToggle("AutoBuyChipFruit", {Title = "Auto Buy Chip [Fruit]", Default = false, Callback = function(v) Settings.AutoBuyChipFruit = v end})
Sec_Raid:AddToggle("AutoStartRaid", {Title = "Auto Start Raid", Default = false, Callback = function(v) Settings.AutoStartRaid = v end})
Sec_Raid:AddToggle("AutoRaidNextIsland", {Title = "Auto Raid + Next Island", Default = false, Callback = function(v) Settings.AutoRaidNextIsland = v end})
Sec_Raid:AddToggle("AutoAwakening", {Title = "Auto Awakening (BETA)", Default = false, Callback = function(v) Settings.AutoAwakening = v end})

-- TAB: Sea Events
local Tab_Sea = Window:AddTab("Sea Events", "rbxassetid://7733920644")
local Sec_Sea = Tab_Sea:AddLeftGroupbox("Sea Events")

Sec_Sea:AddToggle("AutoSeaEvents", {Title = "Auto Sea Events (BETA)", Default = false, Callback = function(v) Settings.AutoSeaEvents = v end})
Sec_Sea:AddToggle("AutoBonesFromSea", {Title = "Auto Bones (Cursed Ship)", Default = false, Callback = function(v) Settings.AutoBones = v end})

local Sec_FindIslands = Tab_Sea:AddRightGroupbox("Auto Find Islands")
Sec_FindIslands:AddToggle("AutoFindMirage", {Title = "Auto Find Mirage Island", Default = false, Callback = function(v) Settings.AutoFindMirage = v end})
Sec_FindIslands:AddToggle("AutoFindKitsune", {Title = "Auto Find Kitsune Island", Default = false, Callback = function(v) Settings.AutoFindKitsune = v end})
Sec_FindIslands:AddToggle("AutoFindPreHistoric", {Title = "Auto Find Prehistoric Island", Default = false, Callback = function(v) Settings.AutoFindPreHistoric = v end})
Sec_FindIslands:AddToggle("AutoFindFrozen", {Title = "Auto Find Frozen Dimension", Default = false, Callback = function(v) Settings.AutoFindFrozen = v end})
Sec_FindIslands:AddToggle("AutoLeviathan", {Title = "Auto Leviathan [Full]", Default = false, Callback = function(v) Settings.AutoLeviathan = v end})
Sec_FindIslands:AddToggle("AutoDracoV2", {Title = "Auto Draco V2 (BETA)", Default = false, Callback = function(v) Settings.AutoDracoV2 = v end})

-- TAB: Cursed Ship
local Tab_Cursed = Window:AddTab("Cursed Ship", "rbxassetid://7733954611")
local Sec_Cursed = Tab_Cursed:AddLeftGroupbox("Cursed Ship Events")

Sec_Cursed:AddToggle("AutoBonesCS", {Title = "Auto Bones (BETA)", Default = false, Callback = function(v) Settings.AutoBones = v end})
Sec_Cursed:AddToggle("AutoEctoplasm", {Title = "Auto Ectoplasm (BETA)", Default = false, Callback = function(v) Settings.AutoEctoplasm = v end})
Sec_Cursed:AddToggle("AutoFarmCandyCS", {Title = "Auto Farm Candy (BETA)", Default = false, Callback = function(v) Settings.AutoFarmCandy = v end})

-- TAB: Farming Cake
local Tab_Cake = Window:AddTab("Cake", "rbxassetid://7733920644")
local Sec_CakePrince = Tab_Cake:AddLeftGroupbox("Cake Prince")

Sec_CakePrince:AddToggle("AutoCakePrince", {Title = "Auto Farm Cake Prince (BETA)", Default = false, Callback = function(v) Settings.AutoCakePrince = v end})
Sec_CakePrince:AddToggle("AutoAcceptQuestCake", {Title = "Accept Quests (BETA)", Default = false, Callback = function(v) Settings.AutoAcceptQuest = v end})
Sec_CakePrince:AddToggle("AutoSummonCakePrince", {Title = "Auto Summon Cake Prince (BETA)", Default = false, Callback = function(v) Settings.AutoSummonCakePrince = v end})
Sec_CakePrince:AddToggle("AutoDoughKing", {Title = "Auto Dough King [Fully] (BETA)", Default = false, Callback = function(v) Settings.AutoDoughKing = v end})
Sec_CakePrince:AddToggle("AutoFarmDoughKing", {Title = "Auto Farm Dough King (BETA)", Default = false, Callback = function(v) Settings.AutoFarmDoughKing = v end})
Sec_CakePrince:AddToggle("AutoDoughKingHop", {Title = "Auto Farm Dough King + Hop (BETA)", Default = false, Callback = function(v) Settings.AutoDoughKingHop = v end})

local Sec_Dungeon = Tab_Cake:AddRightGroupbox("Unlocked Dungeon")
Sec_Dungeon:AddToggle("AutoUnlockDoughDungeon", {Title = "Auto Unlock Dough Dungeon (BETA)", Default = false, Callback = function(v) Settings.AutoUnlockDoughDungeon = v end})
Sec_Dungeon:AddToggle("AutoUnlockPhoenixDungeon", {Title = "Auto Unlock Phoenix Dungeon (BETA)", Default = false, Callback = function(v) Settings.AutoUnlockPhoenixDungeon = v end})

-- TAB: Farming Bone
local Tab_Bone = Window:AddTab("Bones", "rbxassetid://7733920644")
local Sec_Bone = Tab_Bone:AddLeftGroupbox("Bone Farming")

Sec_Bone:AddToggle("AutoBonesGround", {Title = "Auto Bones [Ground Fix]", Default = false, Callback = function(v) Settings.AutoBonesGround = v end})
Sec_Bone:AddToggle("AutoBonesTrad", {Title = "Auto Farm Bones (BETA)", Default = false, Callback = function(v) Settings.AutoBones = v end})
Sec_Bone:AddToggle("AutoAcceptQuestBone", {Title = "Accept Quests (BETA)", Default = false, Callback = function(v) Settings.AutoAcceptQuest = v end})
Sec_Bone:AddToggle("AutoSoulReaper", {Title = "Auto Soul Reaper (BETA)", Default = false, Callback = function(v) Settings.AutoSoulReaper = v end})
Sec_Bone:AddToggle("AutoRandomBones", {Title = "Auto Random Bones (BETA)", Default = false, Callback = function(v) Settings.AutoRandomBones = v end})
Sec_Bone:AddToggle("AutoTryLuckGravestone", {Title = "Auto Try Luck Gravestone", Default = false, Callback = function(v) Settings.AutoTryLuckGravestone = v end})
Sec_Bone:AddToggle("AutoPrayGravestone", {Title = "Auto Pray Gravestone", Default = false, Callback = function(v) Settings.AutoPrayGravestone = v end})

-- TAB: Tyrant
local Tab_Tyrant = Window:AddTab("Tyrant", "rbxassetid://7733954611")
local Sec_Tyrant = Tab_Tyrant:AddLeftGroupbox("Tyrant Boss")

Sec_Tyrant:AddToggle("AutoTyrantSkies", {Title = "Auto Farm Boss (BETA)", Default = false, Callback = function(v) Settings.AutoTyrantSkies = v end})
Sec_Tyrant:AddToggle("AutoSummonTyrant", {Title = "Auto Summon Boss (BETA)", Default = false, Callback = function(v) Settings.AutoSummonTyrant = v end})

-- TAB: Quests
local Tab_Quests = Window:AddTab("Quests", "rbxassetid://7733920644")
local Sec_Quests = Tab_Quests:AddLeftGroupbox("Quest System")
Sec_Quests:AddToggle("AutoQuest", {Title = "Auto Quest (BETA)", Default = false, Callback = function(v) Settings.AutoQuest = v end})

-- TAB: Progress
local Tab_Progress = Window:AddTab("Progress", "rbxassetid://7733954611")
local Sec_Progress = Tab_Progress:AddLeftGroupbox("General Progress")
Sec_Progress:AddToggle("AutoLevel", {Title = "Auto Level (BETA)", Default = false, Callback = function(v) Settings.AutoLevel = v; Settings.AutoFarm = v end})

-- TAB: Visuals (ESP)
local Tab_Visuals = Window:AddTab("ESP", "rbxassetid://7733960981")
local Sec_ESP = Tab_Visuals:AddLeftGroupbox("ESP System")

Sec_ESP:AddToggle("EspPlayers", {Title = "ESP Players", Default = false, Callback = function(v) Settings.EspPlayers = v; UpdateESP() end})
Sec_ESP:AddToggle("EspFruits", {Title = "ESP Fruits", Default = false, Callback = function(v) Settings.EspFruits = v; UpdateESP() end})
Sec_ESP:AddToggle("EspBosses", {Title = "ESP Bosses", Default = false, Callback = function(v) Settings.EspBosses = v; UpdateESP() end})

-- TAB: Teleport
local Tab_Teleport = Window:AddTab("Teleport", "rbxassetid://7733954611")
local Sec_Teleport = Tab_Teleport:AddLeftGroupbox("Island Travel")

local islandNames = {}
for name, _ in pairs(AllIslands) do table.insert(islandNames, name) end

local SelectedIsland = islandNames[1]

Sec_Teleport:AddDropdown("SelectedIsland", {
    Title = "Select Island",
    Values = islandNames,
    Default = islandNames[1],
    Callback = function(v) SelectedIsland = v end
})

Sec_Teleport:AddToggle("FlyToIsland", {
    Title = "Fly to Island (No TP)",
    Default = false,
    Callback = function(v)
        if v and SelectedIsland and AllIslands[SelectedIsland] then
            task.spawn(function()
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local targetPos = AllIslands[SelectedIsland]
                if not hrp:FindFirstChild("FlyVelocity") then
                    local bv = Instance.new("BodyVelocity", hrp)
                    bv.Name = "FlyVelocity"
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                end
                if not hrp:FindFirstChild("FlyGyro") then
                    local bg = Instance.new("BodyGyro", hrp)
                    bg.Name = "FlyGyro"
                    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    bg.P = 9000
                end
                Library:Notify({Title = "Flying", Desc = "Voando para " .. SelectedIsland, Duration = 3})
                while v and (hrp.Position - targetPos.Position).Magnitude > 50 do
                    task.wait()
                    local direction = (targetPos.Position - hrp.Position).Unit
                    local bv = hrp:FindFirstChild("FlyVelocity")
                    local bg = hrp:FindFirstChild("FlyGyro")
                    if bv and bg then
                        bv.Velocity = direction * Settings.TweenSpeed
                        bg.CFrame = CFrame.new(hrp.Position, targetPos.Position)
                    end
                    ActivateNoclip()
                end
                if hrp:FindFirstChild("FlyVelocity") then hrp.FlyVelocity:Destroy() end
                if hrp:FindFirstChild("FlyGyro") then hrp.FlyGyro:Destroy() end
                Library:Notify({Title = "Arrived", Desc = "Chegou em " .. SelectedIsland, Duration = 3})
            end)
        end
    end
})

Sec_Teleport:AddButton({
    Title = "Teleport to Island (Instant)",
    Callback = function()
        if SelectedIsland and AllIslands[SelectedIsland] then
            TweenTo(AllIslands[SelectedIsland])
            Library:Notify({Title = "Teleport", Desc = "Teleportando para " .. SelectedIsland, Duration = 3})
        end
    end
})

-- TAB: Settings
local Tab_Settings = Window:AddTab("Settings", "rbxassetid://7733920644")
local Sec_Settings = Tab_Settings:AddLeftGroupbox("Utilities")

Sec_Settings:AddToggle("FPSBoost", {
    Title = "FPS Boost (White Screen)",
    Default = false,
    Callback = function(v)
        Settings.FPSBoost = v
        RunService:Set3dRenderingEnabled(not v)
    end
})

Sec_Settings:AddSlider("TweenSpeed", {
    Title = "Tween Speed",
    Min = 100,
    Max = 600,
    Default = 300,
    Callback = function(v) Settings.TweenSpeed = v end
})

Sec_Settings:AddToggle("Noclip", {
    Title = "Noclip",
    Default = true,
    Callback = function(v) Settings.Noclip = v end
})

Sec_Settings:AddToggle("NoSeaDamage", {
    Title = "No Sea Damage",
    Default = false,
    Callback = function(v) Settings.NoSeaDamage = v; NoSeaDamageLoop() end
})

Sec_Settings:AddButton({
    Title = "Unload UI",
    Callback = function()
        Library:Unload()
    end
})

-- =========================================
-- STATUS LOOPS (atualiza labels)
-- =========================================

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local date = os.date("*t")
            local hour = (date.hour) % 24
            local ampm = hour < 12 and "AM" or "PM"
            local timezone = string.format("%02i:%02i:%02i %s",((hour - 1) % 12) + 1,date.min,date.sec,ampm)
            local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
            TimeZoneLabel:SetText("Time Zone: " .. datetime .. " " .. timezone)
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
            local Hour = math.floor(GameTime / (60 ^ 2)) % 24
            local Minute = math.floor(GameTime / 60) % 60
            local Second = GameTime % 60
            -- TimeZoneLabel is for date, this would be a separate label in ideal case
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                MirageLabel:SetText("Mirage Island: Active ✅")
            else
                MirageLabel:SetText("Mirage Island: Not Found ❌")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                KitsuneLabel:SetText("Kitsune Island: Active ✅")
            else
                KitsuneLabel:SetText("Kitsune Island: Not Found ❌")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island') then
                PreHistoricLabel:SetText("Prehistoric Island: Active ✅")
            else
                PreHistoricLabel:SetText("Prehistoric Island: Not Found ❌")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenLabel:SetText("Frozen Dimension: Active ✅")
            else
                FrozenLabel:SetText("Frozen Dimension: Not Found ❌")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(5) do
        pcall(function()
            local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            if response then
                local len = string.len(response)
                if len == 88 then CakePrinceLabel:SetText("Cake Prince Kill: " .. string.sub(response, 39, 41))
                elseif len == 87 then CakePrinceLabel:SetText("Cake Prince Kill: " .. string.sub(response, 39, 40))
                elseif len == 86 then CakePrinceLabel:SetText("Cake Prince Kill: " .. string.sub(response, 39, 39))
                else CakePrinceLabel:SetText("Cake Prince: Active ✅") end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local moonId = game:GetService("Lighting").Sky.MoonTextureId
            if moonId == "http://www.roblox.com/asset/?id=9709149431" then FullMoonLabel:SetText("Moon: 5/5 🌕")
            elseif moonId == "http://www.roblox.com/asset/?id=9709149052" then FullMoonLabel:SetText("Moon: 4/5 🌖")
            elseif moonId == "http://www.roblox.com/asset/?id=9709143733" then FullMoonLabel:SetText("Moon: 3/5 🌗")
            elseif moonId == "http://www.roblox.com/asset/?id=9709150401" then FullMoonLabel:SetText("Moon: 2/5 🌘")
            elseif moonId == "http://www.roblox.com/asset/?id=9709149680" then FullMoonLabel:SetText("Moon: 1/5 🌑")
            else FullMoonLabel:SetText("Moon: 0/5 🌚") end
        end)
    end
end)

task.spawn(function()
    while task.wait(5) do
        pcall(function()
            local rs = game:GetService("ReplicatedStorage")
            local ws = game:GetService("Workspace").Enemies
            local progress = rs.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            if rs:FindFirstChild("Diablo") or rs:FindFirstChild("Deandre") or rs:FindFirstChild("Urban")
            or ws:FindFirstChild("Diablo") or ws:FindFirstChild("Deandre") or ws:FindFirstChild("Urban") then
                EliteHunterLabel:SetText("Elite Hunter: Active ✅ | Killed: " .. (progress or 0))
            else
                EliteHunterLabel:SetText("Elite Hunter: Not Found ❌ | Killed: " .. (progress or 0))
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")
            or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                DoughKingLabel:SetText("Dough King: Active ✅")
            else
                DoughKingLabel:SetText("Dough King: Not Found ❌")
            end
        end)
    end
end)

-- =========================================
-- MAIN GAME LOOPS
-- =========================================

task.spawn(function()
    while task.wait() do
        pcall(function()
            FarmLoop()
            AutoChestLoop()
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if Settings.AutoTrainRaceV4 then AutoTrainRaceV4Loop() end
            if Settings.AutoBones then AutoBonesLoop() end
            if Settings.AutoBonesGround then AutoBonesGroundLoop() end
            if Settings.AutoEctoplasm then AutoEctoplasmLoop() end
            if Settings.AutoSeaEvents then AutoSeaEventsLoop() end
            if Settings.AutoLeviathan then AutoLeviathanLoop() end
            if Settings.AutoBoss then AutoBossLoop() end
            if Settings.AutoHopBoss then AutoHopBossLoop() end
            if Settings.AutoSpawnBoss then AutoSpawnBossLoop() end
            if Settings.AutoBossNoHit then AutoBossNoHitLoop() end
            if Settings.AutoSecretBoss then AutoSecretBossLoop() end
            if Settings.AutoDevilFruit then end -- placeholder
            if Settings.AutoCollectFruit then AutoCollectFruitLoop() end
            if Settings.AutoNotifierFruit then AutoNotifierFruitLoop() end
            if Settings.AutoStoreFruit then AutoStoreFruitLoop() end
            if Settings.AutoDropBadFruit then AutoDropBadFruitLoop() end
            if Settings.AutoEatFruit then AutoEatFruitLoop() end
            if Settings.AutoRollFruit then AutoRollFruitLoop() end
            if Settings.AutoSniperFruit then AutoSniperFruitLoop() end
            if Settings.AutoFragments then AutoFragmentsLoop() end
            if Settings.AutoMaterials then AutoMaterialsLoop() end
            if Settings.AutoKillPlayer then AutoKillPlayerLoop() end
            if Settings.AutoFindMirage then AutoFindMirageLoop() end
            if Settings.AutoFindKitsune then AutoFindKitsuneLoop() end
            if Settings.AutoFindPreHistoric then AutoFindPreHistoricLoop() end
            if Settings.AutoFindFrozen then AutoFindFrozenLoop() end
            if Settings.AutoFarmCandy then AutoFarmCandyLoop() end
            if Settings.AutoDracoV2 then AutoDracoV2Loop() end
        end)
    end
end)

task.spawn(function()
    while task.wait(1800) do
        if Settings.AutoHop30Min then
            pcall(function()
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.NoSeaDamage then NoSeaDamageLoop() end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        AutoStatsLoop()
        if Settings.EspPlayers or Settings.EspFruits or Settings.EspBosses then UpdateESP() end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if Settings.AutoRaceV4 and not UserInputService:GetFocusedTextBox() then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Y, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Y, false, game)
        end
        if Settings.AutoRaceV3 and not UserInputService:GetFocusedTextBox() then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.T, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.T, false, game)
        end
    end
end)

-- =========================================
-- BOTÃO TOGGLE DA UI
-- =========================================
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "AbacaxiHubToggle"
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("ImageButton", ScreenGui)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
ToggleBtn.Size = UDim2.new(0, 60, 0, 60)
ToggleBtn.Image = "rbxassetid://11102883377"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Draggable = true
ToggleBtn.Active = true

local Corner = Instance.new("UICorner", ToggleBtn)
Corner.CornerRadius = UDim.new(1, 0)

local UIStroke = Instance.new("UIStroke", ToggleBtn)
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 3

ToggleBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local mainGui = CoreGui:FindFirstChild("ScreenGui")
        if mainGui then
            mainGui.Enabled = not mainGui.Enabled
            Library:Notify({
                Title = "Abacaxi Hub",
                Desc = mainGui.Enabled and "UI Aberta!" or "UI Fechada!",
                Duration = 2
            })
        end
    end)
end)

-- Notificação inicial
Library:Notify({
    Title = "Abacaxi Hub",
    Desc = "FELIZ ANO NOVO 2026! - By: Orchidx",
    Duration = 5
})
