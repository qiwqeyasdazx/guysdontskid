-- ts file was generated at discord.gg/25ms


if not LPH_OBFUSCATED then
    function LPH_JIT_MAX(...)
        return ...
    end
    function LPH_NO_VIRTUALIZE(...)
        return ...
    end
    function LPH_NO_UPVALUES(...)
        return ...
    end
end
local v1 = game:GetService("Players")
local vu2 = game:GetService("Workspace")
local _ = v1.LocalPlayer
game:GetService("RunService")
local vu3 = game:GetService("Workspace")
local vu4 = game:GetService("Players").LocalPlayer
vu3:FindFirstChild("Enemies")
local vu5 = game.PlaceId == 2753915549
local vu6 = game.PlaceId == 4442272183
local vu7
if game.PlaceId == 7449423635 then
    vu7 = true
else
    vu7 = false
end
repeat
    wait()
until game:IsLoaded()
if game.PlaceId ~= 2753915549 then
    if game.PlaceId ~= 4442272183 then
        if game.PlaceId ~= 7449423635 then
            print("Find Fruits", Skibidi)
            game.Players.LocalPlayer:Kick("Skibidi")
        else
            vu7 = true
        end
    else
        vu6 = true
    end
else
    vu5 = true
end
function CheckQuest()
	-- upvalues: (ref) vu5, (ref) vu6, (ref) vu7
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if vu5 then
        if MyLevel == 1 or MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, - 0, - 0.341998369, - 0, 1, - 0, 0.341998369, - 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel == 10 or MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(- 1598.08911, 35.5501175, 153.377838, - 0, - 0, 1, - 0, 1, - 0, - 1, - 0, - 0)
            CFrameMon = CFrame.new(- 1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel == 15 or MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(- 1598.08911, 35.5501175, 153.377838, - 0, - 0, 1, - 0, 1, - 0, - 1, - 0, - 0)
            CFrameMon = CFrame.new(- 1129.8836669921875, 40.46354675292969, - 525.4237060546875)
        elseif MyLevel == 30 or MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(- 1141.07483, 4.10001802, 3831.5498, 0.965929627, - 0, - 0.258804798, - 0, 1, - 0, 0.258804798, - 0, 0.965929627)
            CFrameMon = CFrame.new(- 1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel == 40 or MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(- 1141.07483, 4.10001802, 3831.5498, 0.965929627, - 0, - 0.258804798, - 0, 1, - 0, 0.258804798, - 0, 0.965929627)
            CFrameMon = CFrame.new(- 1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel == 60 or MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, - 0, - 0.573571265, - 0, 1, - 0, 0.573571265, - 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel == 75 or MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, - 0, - 0.573571265, - 0, 1, - 0, 0.573571265, - 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel == 90 or MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, - 1298.90796, - 0.342042685, - 0, 0.939684391, - 0, 1, - 0, - 0.939684391, - 0, - 0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, - 1393.946533203125)
        elseif MyLevel == 100 or MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, - 1298.90796, - 0.342042685, - 0, 0.939684391, - 0, 1, - 0, - 0.939684391, - 0, - 0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, - 1550.0670166015625)
        elseif MyLevel == 120 or MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(- 5039.58643, 27.3500385, 4324.68018, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel == 150 or MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(- 4839.53027, 716.368591, - 2619.44165, 0.866007268, - 0, 0.500031412, - 0, 1, - 0, - 0.500031412, - 0, 0.866007268)
            CFrameMon = CFrame.new(- 4953.20703125, 295.74420166015625, - 2899.22900390625)
        elseif MyLevel == 175 or MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(- 4839.53027, 716.368591, - 2619.44165, 0.866007268, - 0, 0.500031412, - 0, 1, - 0, - 0.500031412, - 0, 0.866007268)
            CFrameMon = CFrame.new(- 5259.8447265625, 391.3976745605469, - 2229.035400390625)
        elseif MyLevel == 190 or MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, - 0.0894274712, - 5.00292918e-9, - 0.995993316, 1.60817859e-9, 1, - 5.16744869e-9, 0.995993316, - 2.06384709e-9, - 0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, - 0.3204058110713959, 474.2373352050781)
        elseif MyLevel == 210 or MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, - 0.0894274712, - 5.00292918e-9, - 0.995993316, 1.60817859e-9, 1, - 5.16744869e-9, 0.995993316, - 2.06384709e-9, - 0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel == 250 or MyLevel <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(- 1580.04663, 6.35000277, - 2986.47534, - 0.515037298, - 0, - 0.857167721, - 0, 1, - 0, 0.857167721, - 0, - 0.515037298)
            CFrameMon = CFrame.new(- 1820.21484375, 51.68385696411133, - 2740.6650390625)
        elseif MyLevel == 275 or MyLevel <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(- 1580.04663, 6.35000277, - 2986.47534, - 0.515037298, - 0, - 0.857167721, - 0, 1, - 0, 0.857167721, - 0, - 0.515037298)
            CFrameMon = CFrame.new(- 1292.838134765625, 56.380882263183594, - 3339.031494140625)
        elseif MyLevel == 300 or MyLevel <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(- 5313.37012, 10.9500084, 8515.29395, - 0.499959469, - 0, 0.866048813, - 0, 1, - 0, - 0.866048813, - 0, - 0.499959469)
            CFrameMon = CFrame.new(- 5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel == 325 or MyLevel <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(- 5313.37012, 10.9500084, 8515.29395, - 0.499959469, - 0, 0.866048813, - 0, 1, - 0, - 0.866048813, - 0, - 0.499959469)
            CFrameMon = CFrame.new(- 5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel == 375 or MyLevel <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 400 or MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 450 or MyLevel <= 474 then
            Mon = "God\'s Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God\'s Guard"
            CFrameQuest = CFrame.new(- 4721.88867, 843.874695, - 1949.96643, 0.996191859, - 0, - 0.0871884301, - 0, 1, - 0, 0.0871884301, - 0, 0.996191859)
            CFrameMon = CFrame.new(- 4710.04296875, 845.2769775390625, - 1927.3079833984375)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
            end
        elseif MyLevel == 475 or MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(- 7859.09814, 5544.19043, - 381.476196, - 0.422592998, - 0, 0.906319618, - 0, 1, - 0, - 0.906319618, - 0, - 0.422592998)
            CFrameMon = CFrame.new(- 7678.48974609375, 5566.40380859375, - 497.2156066894531)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
            end
        elseif MyLevel == 525 or MyLevel <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(- 7906.81592, 5634.6626, - 1411.99194, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 7624.25244140625, 5658.13330078125, - 1467.354248046875)
        elseif MyLevel == 550 or MyLevel <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(- 7906.81592, 5634.6626, - 1411.99194, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 7836.75341796875, 5645.6640625, - 1790.6236572265625)
        elseif MyLevel == 625 or MyLevel <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, - 0, 0.996196866, - 0, 1, - 0, - 0.996196866, - 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, - 0, 0.996196866, - 0, 1, - 0, - 0.996196866, - 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif vu6 then
        if MyLevel == 700 or MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(- 429.543518, 71.7699966, 1836.18188, - 0.22495985, - 0, - 0.974368095, - 0, 1, - 0, 0.974368095, - 0, - 0.22495985)
            CFrameMon = CFrame.new(- 728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif MyLevel == 725 or MyLevel <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(- 429.543518, 71.7699966, 1836.18188, - 0.22495985, - 0, - 0.974368095, - 0, 1, - 0, 0.974368095, - 0, - 0.22495985)
            CFrameMon = CFrame.new(- 1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel == 775 or MyLevel <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, - 0, 0.99026376, - 0, 1, - 0, - 0.99026376, - 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif MyLevel == 800 or MyLevel <= 874 then
            Mon = "Factory Staff"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, - 0.0319722369, 8.96074881e-10, - 0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, - 1.07732087e-10, - 0.0319722369)
            CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, - 27.470672607421875)
        elseif MyLevel == 875 or MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(- 2440.79639, 71.7140732, - 3216.06812, 0.866007268, - 0, 0.500031412, - 0, 1, - 0, - 0.500031412, - 0, 0.866007268)
            CFrameMon = CFrame.new(- 2821.372314453125, 75.89727783203125, - 3070.089111328125)
        elseif MyLevel == 900 or MyLevel <= 949 then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(- 2440.79639, 71.7140732, - 3216.06812, 0.866007268, - 0, 0.500031412, - 0, 1, - 0, - 0.500031412, - 0, 0.866007268)
            CFrameMon = CFrame.new(- 1861.2310791015625, 80.17658233642578, - 3254.697509765625)
        elseif MyLevel == 950 or MyLevel <= 974 then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(- 5497.06152, 47.5923004, - 795.237061, - 0.29242146, - 0, - 0.95628953, - 0, 1, - 0, 0.95628953, - 0, - 0.29242146)
            CFrameMon = CFrame.new(- 5657.77685546875, 78.96973419189453, - 928.68701171875)
        elseif MyLevel == 975 or MyLevel <= 999 then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(- 5497.06152, 47.5923004, - 795.237061, - 0.29242146, - 0, - 0.95628953, - 0, 1, - 0, 0.95628953, - 0, - 0.29242146)
            CFrameMon = CFrame.new(- 6037.66796875, 32.18463897705078, - 1340.6597900390625)
        elseif MyLevel == 1000 or MyLevel <= 1049 then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, - 5372.25928, - 0.374604106, - 0, 0.92718488, - 0, 1, - 0, - 0.92718488, - 0, - 0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, - 5563.69873046875)
        elseif MyLevel == 1050 or MyLevel <= 1099 then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, - 5372.25928, - 0.374604106, - 0, 0.92718488, - 0, 1, - 0, - 0.92718488, - 0, - 0.374604106)
            CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, - 5199.41650390625)
        elseif MyLevel == 1100 or MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(- 6064.06885, 15.2422857, - 4902.97852, 0.453972578, - 0, - 0.891015649, - 0, 1, - 0, 0.891015649, - 0, 0.453972578)
            CFrameMon = CFrame.new(- 5707.4716796875, 15.951709747314453, - 4513.39208984375)
        elseif MyLevel == 1125 or MyLevel <= 1174 then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(- 6064.06885, 15.2422857, - 4902.97852, 0.453972578, - 0, - 0.891015649, - 0, 1, - 0, 0.891015649, - 0, 0.453972578)
            CFrameMon = CFrame.new(- 6341.36669921875, 15.951770782470703, - 5723.162109375)
        elseif MyLevel == 1175 or MyLevel <= 1199 then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(- 5428.03174, 15.0622921, - 5299.43457, - 0.882952213, - 0, 0.469463557, - 0, 1, - 0, - 0.469463557, - 0, - 0.882952213)
            CFrameMon = CFrame.new(- 5449.6728515625, 76.65874481201172, - 5808.20068359375)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(- 5428.03174, 15.0622921, - 5299.43457, - 0.882952213, - 0, 0.469463557, - 0, 1, - 0, - 0.469463557, - 0, - 0.882952213)
            CFrameMon = CFrame.new(- 5213.33154296875, 49.73788070678711, - 4701.451171875)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
            CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, - 6486.08984, - 0.933587909, - 0, - 0.358349502, - 0, 1, - 0, 0.358349502, - 0, - 0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, - 6179.3828125)
            if getgenv().AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 5000.034996032715, - 132.83953857422))
            end
        elseif MyLevel == 1375 or MyLevel <= 1424 then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, - 6486.08984, - 0.933587909, - 0, - 0.358349502, - 0, 1, - 0, 0.358349502, - 0, - 0.933587909)
            CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, - 6880.88037109375)
        elseif MyLevel == 1425 or MyLevel <= 1449 then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(- 3054.44458, 235.544281, - 10142.8193, 0.990270376, - 0, - 0.13915664, - 0, 1, - 0, 0.13915664, - 0, 0.990270376)
            CFrameMon = CFrame.new(- 3028.2236328125, 64.67451477050781, - 9775.4267578125)
        elseif MyLevel >= 1450 then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(- 3054.44458, 235.544281, - 10142.8193, 0.990270376, - 0, - 0.13915664, - 0, 1, - 0, 0.13915664, - 0, 0.990270376)
            CFrameMon = CFrame.new(- 3352.9013671875, 285.01556396484375, - 10534.841796875)
        end
    elseif vu7 then
        if MyLevel == 1500 or MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(- 290.074677, 42.9034653, 5581.58984, 0.965929627, - 0, - 0.258804798, - 0, 1, - 0, 0.258804798, - 0, 0.965929627)
            CFrameMon = CFrame.new(- 245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif MyLevel == 1525 or MyLevel <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(- 290.074677, 42.9034653, 5581.58984, 0.965929627, - 0, - 0.258804798, - 0, 1, - 0, 0.258804798, - 0, 0.965929627)
            CFrameMon = CFrame.new(- 187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif MyLevel == 1575 or MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, - 1101.51563, 0.898790359, - 0, - 0.438378751, - 0, 1, - 0, 0.438378751, - 0, 0.898790359)
            CFrameMon = CFrame.new(6141.140625, 51.35136413574219, - 1340.738525390625)
        elseif MyLevel == 1600 or MyLevel <= 1624 then
            Mon = "Dragon Crew Archer [Lv. 1600]"
            NameQuest = "DragonCrewQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, - 1103.0693359375)
            CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
        elseif MyLevel == 1625 or MyLevel <= 1649 then
            Mon = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 1
            NameMon = "Hydra Enforcer"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
        elseif MyLevel == 1650 or MyLevel <= 1699 then
            Mon = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 2
            NameMon = "Venomous Assailant"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, - 36.97627639770508)
        elseif MyLevel == 1700 or MyLevel <= 1724 then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, - 6741.5498, - 0.965929747, - 0, 0.258804798, - 0, 1, - 0, - 0.258804798, - 0, - 0.965929747)
            CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, - 7159.80908203125)
        elseif MyLevel == 1725 or MyLevel <= 1774 then
            Mon = "Marine Rear Admiral [Lv. 1725]"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
            CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, - 7001.5986328125)
        elseif MyLevel == 1775 or MyLevel <= 1799 then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(- 10581.6563, 330.872955, - 8761.18652, - 0.882952213, - 0, 0.469463557, - 0, 1, - 0, - 0.469463557, - 0, - 0.882952213)
            CFrameMon = CFrame.new(- 10407.5263671875, 331.76263427734375, - 8368.5166015625)
        elseif MyLevel == 1800 or MyLevel <= 1824 then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(- 10581.6563, 330.872955, - 8761.18652, - 0.882952213, - 0, 0.469463557, - 0, 1, - 0, - 0.469463557, - 0, - 0.882952213)
            CFrameMon = CFrame.new(- 10994.701171875, 352.38140869140625, - 9002.1103515625)
        elseif MyLevel == 1825 or MyLevel <= 1849 then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(- 13234.04, 331.488495, - 7625.40137, 0.707134247, - 0, - 0.707079291, - 0, 1, - 0, 0.707079291, - 0, 0.707134247)
            CFrameMon = CFrame.new(- 13274.478515625, 332.3781433105469, - 7769.58056640625)
        elseif MyLevel == 1850 or MyLevel <= 1899 then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(- 13234.04, 331.488495, - 7625.40137, 0.707134247, - 0, - 0.707079291, - 0, 1, - 0, 0.707079291, - 0, 0.707134247)
            CFrameMon = CFrame.new(- 13680.607421875, 501.08154296875, - 6991.189453125)
        elseif MyLevel == 1900 or MyLevel <= 1924 then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(- 12680.3818, 389.971039, - 9902.01953, - 0.0871315002, - 0, 0.996196866, - 0, 1, - 0, - 0.996196866, - 0, - 0.0871315002)
            CFrameMon = CFrame.new(- 12256.16015625, 331.73828125, - 10485.8369140625)
        elseif MyLevel == 1925 or MyLevel <= 1974 then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(- 12680.3818, 389.971039, - 9902.01953, - 0.0871315002, - 0, 0.996196866, - 0, 1, - 0, - 0.996196866, - 0, - 0.0871315002)
            CFrameMon = CFrame.new(- 13457.904296875, 391.545654296875, - 9859.177734375)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(- 9479.2168, 141.215088, 5566.09277, - 0, - 0, 1, - 0, 1, - 0, - 1, - 0, - 0)
            CFrameMon = CFrame.new(- 8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(- 9479.2168, 141.215088, 5566.09277, - 0, - 0, 1, - 0, 1, - 0, - 1, - 0, - 0)
            CFrameMon = CFrame.new(- 10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif MyLevel == 2025 or MyLevel <= 2049 then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(- 9516.99316, 172.017181, 6078.46533, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif MyLevel == 2050 or MyLevel <= 2074 then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(- 9516.99316, 172.017181, 6078.46533, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif MyLevel == 2075 or MyLevel <= 2099 then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(- 2104.3908691406, 38.104167938232, - 10194.21875, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 2143.241943359375, 47.72198486328125, - 10029.9951171875)
        elseif MyLevel == 2100 or MyLevel <= 2124 then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(- 2104.3908691406, 38.104167938232, - 10194.21875, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 1859.35400390625, 38.10316848754883, - 10422.4296875)
        elseif MyLevel == 2125 or MyLevel <= 2149 then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(- 820.64825439453, 65.819526672363, - 10965.795898438, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 872.24658203125, 65.81957244873047, - 10919.95703125)
        elseif MyLevel == 2150 or MyLevel <= 2199 then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(- 820.64825439453, 65.819526672363, - 10965.795898438, - 0, - 0, - 1, - 0, 1, - 0, 1, - 0, - 0)
            CFrameMon = CFrame.new(- 558.06103515625, 112.04895782470703, - 11290.7744140625)
        elseif MyLevel == 2200 or MyLevel <= 2224 then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(- 2021.32007, 37.7982254, - 12028.7295, 0.957576931, - 8.80302053e-8, 0.288177818, 6.9301187e-8, 1, 7.51931211e-8, - 0.288177818, - 5.2032135e-8, 0.957576931)
            CFrameMon = CFrame.new(- 2374.13671875, 37.79826354980469, - 12125.30859375)
        elseif MyLevel == 2225 or MyLevel <= 2249 then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(- 2021.32007, 37.7982254, - 12028.7295, 0.957576931, - 8.80302053e-8, 0.288177818, 6.9301187e-8, 1, 7.51931211e-8, - 0.288177818, - 5.2032135e-8, 0.957576931)
            CFrameMon = CFrame.new(- 1598.3070068359375, 43.773197174072266, - 12244.5810546875)
        elseif MyLevel == 2250 or MyLevel <= 2274 then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(- 1927.91602, 37.7981339, - 12842.5391, - 0.96804446, 4.22142143e-8, 0.250778586, 4.74911062e-8, 1, 1.49904711e-8, - 0.250778586, 2.64211941e-8, - 0.96804446)
            CFrameMon = CFrame.new(- 1887.8099365234375, 77.6185073852539, - 12998.3505859375)
        elseif MyLevel == 2275 or MyLevel <= 2299 then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(- 1927.91602, 37.7981339, - 12842.5391, - 0.96804446, 4.22142143e-8, 0.250778586, 4.74911062e-8, 1, 1.49904711e-8, - 0.250778586, 2.64211941e-8, - 0.96804446)
            CFrameMon = CFrame.new(- 2216.188232421875, 82.884521484375, - 12869.2939453125)
        elseif MyLevel == 2300 or MyLevel <= 2324 then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, - 12201.2333984375)
            CFrameMon = CFrame.new(- 21.55328369140625, 80.57499694824219, - 12352.3876953125)
        elseif MyLevel == 2325 or MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, - 12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, - 12463.162109375)
        elseif MyLevel == 2350 or MyLevel <= 2374 then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, - 12774.5029296875)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, - 12600.8369140625)
        elseif MyLevel == 2375 or MyLevel <= 2399 then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, - 12774.5029296875)
            CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, - 12876.5478515625)
        elseif MyLevel == 2400 or MyLevel <= 2424 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(- 1150.0400390625, 20.378934860229492, - 14446.3349609375)
            CFrameMon = CFrame.new(- 1310.5003662109375, 26.016523361206055, - 14562.404296875)
        elseif MyLevel == 2425 or MyLevel <= 2449 then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(- 1150.0400390625, 20.378934860229492, - 14446.3349609375)
            CFrameMon = CFrame.new(- 880.2006225585938, 71.24776458740234, - 14538.609375)
        elseif MyLevel == 2450 or MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(- 16547.748046875, 61.13533401489258, - 173.41360473632812)
            CFrameMon = CFrame.new(- 16442.814453125, 116.13899993896484, - 264.4637756347656)
        elseif MyLevel == 2475 or MyLevel <= 2499 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(- 16547.748046875, 61.13533401489258, - 173.41360473632812)
            CFrameMon = CFrame.new(- 16901.26171875, 84.06756591796875, - 192.88906860351562)
        elseif MyLevel == 2500 or MyLevel <= 2524 then
            Mon = "Sun-kissed Warrior"
            LevelQuest = 1
            NameQuest = "TikiQuest2"
            NameMon = "kissed"
            CFrameQuest = CFrame.new(- 16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(- 16349.8779296875, 92.0808334350586, 1123.4169921875)
        elseif MyLevel == 2525 or MyLevel <= 2550 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(- 16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(- 16347.4150390625, 92.09503936767578, 1122.335205078125)
        elseif MyLevel == 2550 or MyLevel <= 2575 then
            Mon = "Serpent Hunter"
            LevelQuest = 1
            NameQuest = "TikiQuest3"
            NameMon = "Serpent Hunter"
            CFrameQuest = CFrame.new(- 16668.0312, 105.315765, 1568.60132, - 0.999815822, 2.53269654e-8, 0.0191932656, 2.47972114e-8, 1, - 2.78390253e-8, - 0.0191932656, - 2.73579577e-8, - 0.999815822)
            CFrameMon = CFrame.new(- 16645.6426, 163.092682, 1352.87317, 0.999801993, - 7.3039903e-9, 0.0198997185, 5.12876497e-9, 1, 1.09360379e-7, - 0.0198997185, - 1.09236666e-7, 0.999801993)
        elseif MyLevel == 2575 or MyLevel <= 2600 then
            Mon = "Skull Slayer"
            LevelQuest = 2
            NameQuest = "TikiQuest3"
            NameMon = "Skull Slayer"
            CFrameQuest = CFrame.new(- 16668.0312, 105.315765, 1568.60132, - 0.999815822, 2.53269654e-8, 0.0191932656, 2.47972114e-8, 1, - 2.78390253e-8, - 0.0191932656, - 2.73579577e-8, - 0.999815822)
            CFrameMon = CFrame.new(- 16709.490234375, 419.6803894042969, 1751.091796875)
        end
    end
end
function Hop()
    local vu8 = game.PlaceId
    local vu9 = {}
    local vu10 = ""
    local vu11 = os.date("!*t").hour
    function TPReturner()
		-- upvalues: (ref) vu10, (ref) vu8, (ref) vu9, (ref) vu11
        local v12
        if vu10 ~= "" then
            v12 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu8 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu10))
        else
            v12 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu8 .. "/servers/Public?sortOrder=Asc&limit=100"))
        end
        if v12.nextPageCursor and (v12.nextPageCursor ~= "null" and v12.nextPageCursor ~= nil) then
            vu10 = v12.nextPageCursor
        end
        local v13, v14, v15 = pairs(v12.data)
        local v16 = 0
        while true do
            local v17
            v15, v17 = v13(v14, v15)
            if v15 == nil then
                break
            end
            local v18 = true
            local vu19 = tostring(v17.id)
            if tonumber(v17.maxPlayers) > tonumber(v17.playing) then
                local v20, v21, v22 = pairs(vu9)
                while true do
                    local v23
                    v22, v23 = v20(v21, v22)
                    if v22 == nil then
                        break
                    end
                    if v16 == 0 then
                        if tonumber(vu11) ~= tonumber(v23) then
                            pcall(function()
								-- upvalues: (ref) vu9, (ref) vu11
                                vu9 = {}
                                table.insert(vu9, vu11)
                            end)
                        end
                    elseif vu19 == tostring(v23) then
                        v18 = false
                    end
                    v16 = v16 + 1
                end
                if v18 == true then
                    table.insert(vu9, vu19)
                    wait()
                    pcall(function()
						-- upvalues: (ref) vu8, (ref) vu19
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(vu8, vu19, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport()
		-- upvalues: (ref) vu10
        while wait() do
            pcall(function()
				-- upvalues: (ref) vu10
                TPReturner()
                if vu10 ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
local v24 = getrawmetatable(game)
local vu25 = v24.__namecall
setreadonly(v24, false)
v24.__namecall = newcclosure(function(...)
	-- upvalues: (ref) vu25
    local v26 = getnamecallmethod()
    local v27 = {
        ...
    }
    if tostring(v26) ~= "FireServer" or (tostring(v27[1]) ~= "RemoteEvent" or (tostring(v27[2]) == "true" or (tostring(v27[2]) == "false" or not AimBottSkill))) then
        return vu25(...)
    end
    v27[2] = AimBotSkillPosition
    return vu25(unpack(v27))
end)
function getAcc(p28)
    local v29, v30, v31 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v32
        v31, v32 = v29(v30, v31)
        if v31 == nil then
            break
        end
        if type(v32) == "table" and (v32.Type == "Wear" and v32.Name == p28) then
            return true
        end
    end
    return false
end
function UnEquipWeapon(p33)
    if game.Players.LocalPlayer.Character:FindFirstChild(p33) then
        _G.NotAutoEquip = true
        wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(p33).Parent = game.Players.LocalPlayer.Backpack
        wait(0.1)
        _G.NotAutoEquip = false
    end
end
function EquipWeapon(p34)
    if not _G.NotAutoEquip and game.Players.LocalPlayer.Backpack:FindFirstChild(p34) then
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(p34)
        wait(0.1)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end
function TP(p35)
    local v36 = (p35.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if v36 <= _G.distance then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p35
    end
    local v37 = TweenInfo.new(v36 / 350, Enum.EasingStyle.Linear)
    local v38 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v37, {
        ["CFrame"] = p35
    })
    CFrame.new(0, 30, 0)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, p35.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
    if _G.BypassTp and 3000 <= v36 then
        L_28_.Character.Humanoid:ChangeState(15)
        L_28_.Character.HumanoidRootPart.CFrame = p35
        task.wait()
        L_28_.Character.HumanoidRootPart.CFrame = p35
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    end
    v38:Play()
end
function IsIslandRaid(p39)
    if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island " .. p39) then
        local v40, v41, v42 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
        local v43 = 4500
        while true do
            local v44
            v42, v44 = v40(v41, v42)
            if v42 == nil then
                break
            end
            if v44.Name == "Island " .. p39 then
                local v45 = (v44.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if v45 < v43 then
                    v43 = v45
                end
            end
        end
        local v46, v47, v48 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
        while true do
            local v49
            v48, v49 = v46(v47, v48)
            if v48 == nil then
                break
            end
            if v49.Name == "Island " .. p39 and (v49.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= v43 then
                return v49
            end
        end
    end
end
function getNextIsland()
    local v50, v51, v52 = pairs({
        5,
        4,
        3,
        2,
        1
    })
    while true do
        local v53
        v52, v53 = v50(v51, v52)
        if v52 == nil then
            break
        end
        local v54 = IsIslandRaid(v53)
        if v54 and (v54.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return v54
        end
    end
end
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if UseSkill then
                local v55, v56, v57 = pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())
                while true do
                    local v58
                    v57, v58 = v55(v56, v57)
                    if v57 == nil then
                        break
                    end
                    local v59, v60, v61 = pairs(v58:GetChildren())
                    while true do
                        local v62
                        v61, v62 = v59(v60, v61)
                        if v61 == nil then
                            break
                        end
                        if string.find(v62.Text, "Skill locked!") then
                            v58:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    while wait() do
        pcall(function()
            if UseSkill then
                local v63, v64, v65 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v66
                    v65, v66 = v63(v64, v65)
                    if v65 == nil then
                        break
                    end
                    if v66.Name == MonFarm and (v66:FindFirstChild("Humanoid") and (v66:FindFirstChild("HumanoidRootPart") and v66.Humanoid.Health <= v66.Humanoid.MaxHealth * getgenv().Kill_At / 100)) then
                        if getgenv().SkillZ then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            wait(getgenv().HoldSKillZ)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if getgenv().SkillX then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            wait(getgenv().HoldSKillX)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if getgenv().SkillC then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            wait(getgenv().HoldSKillC)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                        if getgenv().SkillV then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            wait(getgenv().HoldSKillV)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        if getgenv().SkillF then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                            wait(getgenv().HoldSKillF)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                        end
                    end
                end
            end
        end)
    end
end)
function StopTween(p67)
    if not p67 then
        wait()
        TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait(0.1)
        TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
    end
end
spawn(function()
    pcall(function()
        while task.wait() do
            if _G.AutoWhiteBelt or (getgenv().AutoFarmFruitMastery or (getgenv().KillAurra or (getgenv().dragonEggs or (getgenv().CollBone or (getgenv().KillGolem or (getgenv().aobao or (getgenv().AutoFindPrehistoric or (getgenv().VolcanoPacth or (treelo or (getgenv().AutoKillMobHydra or (getgenv().AutoPurle or (getgenv().AutoUpdateDragon or (_G.AutoCollectFireFlowers or (_G.AutoBlazeEmber or (getgenv().AutoChest or (_G.AutoYellowBelt or (_G.TeleportIsland or (_G.MirageIsland or (_G.AutoFinishRaceTrial or (_G.TweenToFruit or (_G.ChristmasIsland or (_G.GrabChest or (_G.AutoNextIsland or (_G.Boat20 or (_G.FrozenDimension or (_G.KitsuneIsland or (_G.AutoKillLeviathan or (_G.AutoTerrorShark or (_G.AutoShark or (_G.AutoPiranha or (_G.AutoKillGhostShip or (_G.AutoKillSeaBeast or (_G.Auto_Open_Dough_Dungeon or (_G.PirateRaid or (_G.AutoCDK or (getgenv().NearFarming or (_G.AutoFarmMaterial or (_G.AutoSoulGuitar or (getgenv().DepChaii or (_G.AutoTushita or (_G.AutoFarmBossHallow or (_G.AutoSwan or (_G.AutoLongSword or (_G.AutoPole or (_G.BlackBeard or (_G.BlackBeardHop or (_G.AutoElectricClaw or (_G.AutoHolyTorch or (_G.AutoLawRaid or (_G.AutoFarmBoss or (_G.AutoTwinHooks or (_G.AutoSaber or (_G.NOCLIP or (_G.AutoFarmFruitMastery or (_G.AutoFarmGunMastery or (_G.TeleportIsland or (_G.Auto_EvoRace or (_G.AutoObservationHakiV2 or (_G.AutoMusketeerHat or (_G.AutoEctoplasm or (_G.AutoRengoku or (_G.Auto_Rainbow_Haki or (_G.AutoObservation or (_G.AutoDarkDagger or (_G.Safe_Mode or (_G.MasteryFruit or (_G.AutoBudySword or (_G.AutoBounty or (_G.AutoAllBoss or (_G.Auto_Bounty or (_G.AutoSharkman or (_G.Auto_Dungeon or (_G.Auto_Pole or (_G.Auto_Factory or (_G.AutoSecondSea or (_G.AutoBartilo or (_G.Auto_DarkBoss or (_G.AutoKillPlayerInTrial or (_G.AutoTrainV4 or (_G.Holy_Torch or (_G.AutoSeaEvent or (_G.SummonMirage or (getgenv().AutoFarmLevel or (_G.CLIP or (_G.AutoElitehunter or (_G.AutoThirdSea or getgenv().FarmBon == true)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                _G.AutoBuso = true
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v68 = Instance.new("BodyVelocity")
                    v68.Name = "BodyClip"
                    v68.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    v68.MaxForce = Vector3.new(10000, 10000, 10000)
                    v68.Velocity = Vector3.new(0, 0, 0)
                end
                local v69, v70, v71 = pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())
                while true do
                    local v72
                    v71, v72 = v69(v70, v71)
                    if v71 == nil then
                        break
                    end
                    if v72:IsA("BasePart") then
                        v72.CanCollide = false
                    end
                end
            else
                _G.AutoBuso = false
            end
        end
    end)
end)
game:GetService("Players").LocalPlayer.Idled:connect(function()
	-- upvalues: (ref) vu3
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), vu3.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), vu3.CurrentCamera.CFrame)
end)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
local v73 = loadstring(game:HttpGet("https://raw.githubusercontent.com/wpisstestfprg/Libya/refs/heads/main/Fluent%20(1).luau"))()
local v74 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local v75 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()
local vu76 = v73:CreateWindow({
    ["Title"] = "Volcano Hub (Version Main)",
    ["SubTitle"] = "Update Fix Bug;",
    ["TabWidth"] = 160,
    ["Size"] = UDim2.fromOffset(480, 495),
    ["Resize"] = false,
    ["MinSize"] = Vector2.new(470, 460),
    ["Acrylic"] = false,
    ["Theme"] = "Viow Flat",
    ["MinimizeKey"] = Enum.KeyCode.End
})
local v77 = {}
local v78 = vu76
v77.Up = vu76.CreateTab(v78, {
    ["Title"] = "Update Log",
    ["Icon"] = "badge-alert"
})
local v79 = vu76
v77.Status = vu76.CreateTab(v79, {
    ["Title"] = "Status Sever",
    ["Icon"] = "file-json"
})
local v80 = vu76
v77.Main = vu76.CreateTab(v80, {
    ["Title"] = "Main",
    ["Icon"] = "circle-user-round"
})
local v81 = vu76
v77.Dojo = vu76.CreateTab(v81, {
    ["Title"] = "Dojo Quest",
    ["Icon"] = "component"
})
local v82 = vu76
v77.Settings = vu76.CreateTab(v82, {
    ["Title"] = "Settings",
    ["Icon"] = "settings"
})
local v83 = vu76
v77.Sub = vu76.CreateTab(v83, {
    ["Title"] = "Sub",
    ["Icon"] = "atom"
})
local v84 = vu76
v77.Shop = vu76.CreateTab(v84, {
    ["Title"] = "Shop",
    ["Icon"] = "badge-dollar-sign"
})
local v85 = vu76
v77.Travel = vu76.CreateTab(v85, {
    ["Title"] = "Traveling",
    ["Icon"] = "map"
})
local v86 = vu76
v77.Sea = vu76.CreateTab(v86, {
    ["Title"] = "Sea Event",
    ["Icon"] = "anchor"
})
local v87 = vu76
v77.Raid = vu76.CreateTab(v87, {
    ["Title"] = "Dungeon",
    ["Icon"] = "database"
})
local v88 = v73.Options
v73:Notify({
    ["Title"] = "Volcano Hub",
    ["Content"] = "Script Loading....",
    ["SubContent"] = "",
    ["Duration"] = 5
})
v77.Main:CreateButton({
    ["Title"] = "Copy Discord Severs",
    ["Callback"] = function()
        setclipboard("https://discord.gg/4aXsRZkVks")
    end
})
v77.Main:CreateButton({
    ["Title"] = "Hop Sever Low Players",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu76
        vu76:Dialog({
            ["Title"] = "Hop Sever Low Player",
            ["Content"] = "",
            ["Buttons"] = {
                {
                    ["Title"] = "Are You Sure, Teleport?",
                    ["Callback"] = function()
                        print("Confirmed the dialog.")
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings"))():Teleport(game.PlaceId)
                    end
                },
                {
                    ["Title"] = "Cancel Teleport",
                    ["Callback"] = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})
local v89 = v77.Main:CreateDropdown("Weapon", {
    ["Title"] = "Weapon",
    ["Values"] = {
        "Melee",
        "Sword",
        "Gun",
        "Fruit"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v89:SetValue("Melee")
v89:OnChanged(function(p90)
    WeaponPickBall = p90
end)
task.spawn(function()
    while wait(0.2) do
        pcall(function()
            if WeaponPickBall ~= "Melee" then
                if WeaponPickBall ~= "Sword" then
                    if WeaponPickBall ~= "Gun" then
                        if WeaponPickBall == "Fruit" then
                            local v91, v92, v93 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                            while true do
                                local v94
                                v93, v94 = v91(v92, v93)
                                if v93 == nil then
                                    break
                                end
                                if v94.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v94.Name)) then
                                    WeaponPickBall = v94.Name
                                end
                            end
                        end
                    else
                        local v95, v96, v97 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v98
                            v97, v98 = v95(v96, v97)
                            if v97 == nil then
                                break
                            end
                            if v98.ToolTip == "Gun" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v98.Name)) then
                                WeaponPickBall = v98.Name
                            end
                        end
                    end
                else
                    local v99, v100, v101 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v102
                        v101, v102 = v99(v100, v101)
                        if v101 == nil then
                            break
                        end
                        if v102.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v102.Name)) then
                            WeaponPickBall = v102.Name
                        end
                    end
                end
            else
                local v103, v104, v105 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                while true do
                    local v106
                    v105, v106 = v103(v104, v105)
                    if v105 == nil then
                        break
                    end
                    if v106.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v106.Name)) then
                        WeaponPickBall = v106.Name
                    end
                end
            end
        end)
    end
end)
local vu107 = v77.Status:CreateParagraph("Paragraph", {
    ["Title"] = "Prehistoric Islands Status",
    ["Content"] = "Loading..."
})
spawn(function()
	-- upvalues: (ref) vu2, (ref) vu107
    pcall(function()
		-- upvalues: (ref) vu2, (ref) vu107
        while wait(0.1) do
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricRelic") or vu2._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
                vu107:SetContent("Prehistoric Island: Spawn!!!!")
            else
                vu107:SetContent("Prehistoric Island: Not Spawm")
            end
        end
    end)
end)
local vu108 = v77.Status:CreateParagraph("KataChek", {
    ["Title"] = "Status",
    ["Content"] = "Cake Prince Status: Initializing..."
})
spawn(function()
	-- upvalues: (ref) vu108
    while task.wait(1) do
        pcall(function()
			-- upvalues: (ref) vu108
            local v109 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            local v110 = string.len(v109)
            if v110 == 88 then
                vu108:SetContent("Cake Prince Status: " .. string.sub(v109, 39, 41) .. " Remaining")
            elseif v110 == 87 then
                vu108:SetContent("Cake Prince Status: " .. string.sub(v109, 39, 40) .. " Remaining")
            elseif v110 == 86 then
                vu108:SetContent("Cake Prince Status: " .. string.sub(v109, 39, 39) .. " Remaining")
            else
                vu108:SetContent("Cake Prince Status: Spawned!")
            end
        end)
    end
end)
local vu111 = v77.Status:CreateParagraph("Paragraph", {
    ["Title"] = "Fruit Distance Info",
    ["Content"] = "Loading fruit data..."
})
local vu112 = v77.Status:CreateParagraph("EliteHunterInfo", {
    ["Title"] = "Elite Hunter Information",
    ["Content"] = "Checking information..."
})
local vu113 = v77.Status:CreateParagraph("DojoBeltInfo", {
    ["Title"] = "Dojo Quest Belt Info",
    ["Content"] = "Status: "
})
spawn(function()
	-- upvalues: (ref) vu113
    pcall(function()
		-- upvalues: (ref) vu113
        while wait() do
            if getAcc("Dojo Belt (White)") ~= false or (getAcc("Dojo Belt (Yellow)") ~= false or (getAcc("Dojo Belt (Orange)") ~= false or (getAcc("Dojo Belt (Green)") ~= false or (getAcc("Dojo Belt (Blue)") ~= false or (getAcc("Dojo Belt (Purple)") ~= false or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                if getAcc("Dojo Belt (White)") ~= true or (getAcc("Dojo Belt (Yellow)") ~= false or (getAcc("Dojo Belt (Orange)") ~= false or (getAcc("Dojo Belt (Green)") ~= false or (getAcc("Dojo Belt (Blue)") ~= false or (getAcc("Dojo Belt (Purple)") ~= false or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                    if getAcc("Dojo Belt (White)") ~= true or (getAcc("Dojo Belt (Yellow)") ~= true or (getAcc("Dojo Belt (Orange)") ~= false or (getAcc("Dojo Belt (Green)") ~= false or (getAcc("Dojo Belt (Blue)") ~= false or (getAcc("Dojo Belt (Purple)") ~= false or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                        if getAcc("Dojo Belt (White)") ~= true or (getAcc("Dojo Belt (Yellow)") ~= true or (getAcc("Dojo Belt (Orange)") ~= true or (getAcc("Dojo Belt (Green)") ~= false or (getAcc("Dojo Belt (Blue)") ~= false or (getAcc("Dojo Belt (Purple)") ~= false or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                            if getAcc("Dojo Belt (White)") ~= true or (getAcc("Dojo Belt (Yellow)") ~= true or (getAcc("Dojo Belt (Orange)") ~= true or (getAcc("Dojo Belt (Green)") ~= true or (getAcc("Dojo Belt (Blue)") ~= false or (getAcc("Dojo Belt (Purple)") ~= false or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                                if getAcc("Dojo Belt (White)") ~= true or (getAcc("Dojo Belt (Yellow)") ~= true or (getAcc("Dojo Belt (Orange)") ~= true or (getAcc("Dojo Belt (Green)") ~= true or (getAcc("Dojo Belt (Blue)") ~= true or (getAcc("Dojo Belt (Purple)") ~= false or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                                    if getAcc("Dojo Belt (White)") ~= true or (getAcc("Dojo Belt (Yellow)") ~= true or (getAcc("Dojo Belt (Orange)") ~= true or (getAcc("Dojo Belt (Green)") ~= true or (getAcc("Dojo Belt (Blue)") ~= true or (getAcc("Dojo Belt (Purple)") ~= true or (getAcc("Dojo Belt (Red)") ~= false or getAcc("Dojo Belt (Black)") ~= false)))))) then
                                        if getAcc("Dojo Belt (White)") == true and (getAcc("Dojo Belt (Yellow)") == true and (getAcc("Dojo Belt (Orange)") == true and (getAcc("Dojo Belt (Green)") == true and (getAcc("Dojo Belt (Blue)") == true and (getAcc("Dojo Belt (Purple)") == true and (getAcc("Dojo Belt (Red)") == true and getAcc("Dojo Belt (Black)") == false)))))) then
                                            vu113:SetContent("Progress: Get Dojo Belt (Black)\nGuide: Complete Prehistoric Island event and collect 3 Dinosaur Bones.")
                                        end
                                    else
                                        vu113:SetContent("Progress: Get Dojo Belt (Red)\nGuide: Defeat a Terrorshark or Rumbling Waters.")
                                    end
                                else
                                    vu113:SetContent("Progress: Get Dojo Belt (Purple)\nGuide: Kill 3 Elite Hunters.")
                                end
                            else
                                vu113:SetContent("Progress: Get Dojo Belt (Blue)\nGuide: Collect Fruit dropped.")
                            end
                        else
                            vu113:SetContent("Progress: Get Dojo Belt (Green)\nGuide: Go to Sea Level 4-6 and wait there 5 minutes.")
                        end
                    else
                        vu113:SetContent("Progress: Get Dojo Belt (Orange)\nGuide: Complete 1 Trade Fruit.")
                    end
                else
                    vu113:SetContent("Progress: Get Dojo Belt (Yellow)\nGuide: Kill 5 Sea Mobs using Sea Event.")
                end
            else
                vu113:SetContent("Progress: Get Dojo Belt (White)\nGuide: Kill 20 NPCs on Quest using Auto Farm Level.")
            end
        end
    end)
end)
spawn(function()
	-- upvalues: (ref) vu112
    while wait() do
        pcall(function()
			-- upvalues: (ref) vu112
            local v114 = game:GetService("ReplicatedStorage")
            local v115 = game:GetService("Workspace").Enemies
            local v116 = "Not Have Elite"
            local v117 = "Unknown"
            local v118 = v114.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            if v114:FindFirstChild("Diablo") or v115:FindFirstChild("Diablo") then
                v116 = "Spawned!!!"
                v117 = "Diablo"
            elseif v114:FindFirstChild("Deandre") or v115:FindFirstChild("Deandre") then
                v116 = "Spawned!!!"
                v117 = "Deandre"
            elseif v114:FindFirstChild("Urban") or v115:FindFirstChild("Urban") then
                v116 = "Spawned!!!"
                v117 = "Urban"
            end
            vu112:SetContent("Elite Status: " .. v116 .. " | Killed: " .. tostring(v118) .. "\nElite Hunter Name: " .. v117)
        end)
    end
end)
local v119 = game.Players.LocalPlayer
local vu120 = v119.Character or v119.CharacterAdded:Wait()
spawn(function()
	-- upvalues: (ref) vu120, (ref) vu111
    while wait(0.1) do
        local v121, v122, v123 = pairs(game.Workspace:GetChildren())
        local v124 = 0
        local v125 = ""
        while true do
            local v126
            v123, v126 = v121(v122, v123)
            if v123 == nil then
                break
            end
            if string.find(v126.Name, "Fruit") and (v126:IsA("Model") and v126:FindFirstChild("PrimaryPart")) then
                local v127 = (v126.PrimaryPart.Position - vu120.PrimaryPart.Position).Magnitude
                v124 = v124 + 1
                v125 = v125 .. "Fruit name: " .. v126.Name .. " | Distance: " .. math.round(v127, 2) .. " studs\n"
            end
        end
        vu111:SetContent("Number of fruits in server: " .. v124 .. "" .. v125)
    end
end)
v77.Settings:CreateButton({
    ["Title"] = "Stop Tween",
    ["Callback"] = function()
        StopTween()
    end
})
v77.Settings:CreateSlider("Slider", {
    ["Title"] = "Distance",
    ["Description"] = "Distance Islands Teleport",
    ["Default"] = 340,
    ["Min"] = 0,
    ["Max"] = 345,
    ["Rounding"] = 5,
    ["Callback"] = function(p128)
        _G.distance = p128
    end
}):OnChanged(function(p129)
    _G.distance = p129
end)
v77.Settings:CreateToggle("HakiBusso", {
    ["Title"] = "Turn On Haki Busso",
    ["Default"] = true
}):OnChanged(function(p130)
    _G.AutoBuso = p130
end)
spawn(function()
    while wait(0.2) do
        if _G.AutoBuso and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "Buso"
            }))
        end
    end
end)
v77.Settings:CreateToggle("Bring", {
    ["Title"] = "Bring Mob",
    ["Default"] = true
}):OnChanged(function(p131)
    _G.BringMonster = p131
end)
v88.Bring:SetValue(true)
task.spawn(function()
    while task.wait(0.2) do
        if _G.BringMonster then
            pcall(function()
                local v132, v133, v134 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v135
                    v134, v135 = v132(v133, v134)
                    if v134 == nil then
                        break
                    end
                    local v136 = FarmPos.Position
                    if not string.find(v135.Name, "Boss") and (v135.Name == MonFarm and (v135.PrimaryPart.Position - v136).Magnitude <= 200) then
                        v135:SetPrimaryPartCFrame(CFrame.new(v136))
                        v135.HumanoidRootPart.CanCollide = false
                        v135.HumanoidRootPart.Size = Vector3.new(20, 5, 20)
                        local v137 = v135.Humanoid:FindFirstChild("Animator")
                        if v137 then
                            v137:Destroy()
                        end
                    end
                end
            end)
        end
    end
end)
task.spawn(function()
	-- upvalues: (ref) vu4
    while task.wait(0.5) do
        if setscriptable then
            setscriptable(vu4, "SimulationRadius", true)
        end
        if sethiddenproperty then
            sethiddenproperty(vu4, "SimulationRadius", math.huge)
        end
    end
end)
v77.Settings:CreateSection("Settings Mastery")
v77.Settings:CreateSlider("HoldSkillZ", {
    ["Title"] = "Hold Skill Z",
    ["Description"] = "",
    ["Default"] = 1,
    ["Min"] = 0,
    ["Max"] = 5,
    ["Rounding"] = 1,
    ["Callback"] = function(p138)
        getgenv().HoldSKillZ = p138
    end
}):OnChanged(function(p139)
    getgenv().HoldSKillZ = p139
end)
v77.Settings:CreateSlider("HoldSkillX", {
    ["Title"] = "Hold Skill X",
    ["Description"] = "",
    ["Default"] = 1,
    ["Min"] = 0,
    ["Max"] = 5,
    ["Rounding"] = 1,
    ["Callback"] = function(p140)
        getgenv().HoldSKillX = p140
    end
}):OnChanged(function(p141)
    getgenv().HoldSKillX = p141
end)
v77.Settings:CreateSlider("HoldSkillC", {
    ["Title"] = "Hold Skill C",
    ["Description"] = "",
    ["Default"] = 1,
    ["Min"] = 0,
    ["Max"] = 5,
    ["Rounding"] = 1,
    ["Callback"] = function(p142)
        getgenv().HoldSKillC = p142
    end
}):OnChanged(function(p143)
    getgenv().HoldSKillC = p143
end)
v77.Settings:CreateSlider("HoldSkillV", {
    ["Title"] = "Hold Skill V",
    ["Description"] = "",
    ["Default"] = 1,
    ["Min"] = 0,
    ["Max"] = 5,
    ["Rounding"] = 1,
    ["Callback"] = function(p144)
        getgenv().HoldSKillV = p144
    end
}):OnChanged(function(p145)
    getgenv().HoldSKillV = p145
end)
v77.Settings:CreateSlider("HoldSkillF", {
    ["Title"] = "Hold Skill F",
    ["Description"] = "",
    ["Default"] = 1,
    ["Min"] = 0,
    ["Max"] = 5,
    ["Rounding"] = 1,
    ["Callback"] = function(p146)
        getgenv().HoldSKillF = p146
    end
}):OnChanged(function(p147)
    getgenv().HoldSKillF = p147
end)
local v148 = v77.Settings:CreateToggle("TurnOnSkillZ", {
    ["Title"] = "Turn On Skill Z",
    ["Default"] = true
})
local v149 = v77.Settings:CreateToggle("TurnOnSkillX", {
    ["Title"] = "Turn On Skill X",
    ["Default"] = true
})
local v150 = v77.Settings:CreateToggle("TurnOnSkillC", {
    ["Title"] = "Turn On Skill C",
    ["Default"] = true
})
local v151 = v77.Settings:CreateToggle("TurnOnSkillV", {
    ["Title"] = "Turn On Skill V",
    ["Default"] = false
})
local v152 = v77.Settings:CreateToggle("TurnOnSkillF", {
    ["Title"] = "Turn On Skill F",
    ["Default"] = false
})
v148:OnChanged(function(p153)
    getgenv().SkillZ = p153
end)
v149:OnChanged(function(p154)
    getgenv().SkillX = p154
end)
v150:OnChanged(function(p155)
    getgenv().SkillC = p155
end)
v151:OnChanged(function(p156)
    getgenv().SkillV = p156
end)
v152:OnChanged(function(p157)
    getgenv().SkillF = p157
end)
v77.Main:CreateToggle("LevlFarmm", {
    ["Title"] = "Auto Farm Level",
    ["Default"] = false
}):OnChanged(function(p158)
    getgenv().AutoFarmLevel = p158
    StopTween(getgenv().AutoFarmLevel)
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoFarmLevel then
                CheckQuest()
                local v159 = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(v159, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(NameMon) then
                            local v160, v161, v162 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v163
                                v162, v163 = v160(v161, v162)
                                if v162 == nil then
                                    break
                                end
                                if v163:FindFirstChild("HumanoidRootPart") and (v163:FindFirstChild("Humanoid") and (v163.Humanoid.Health > 0 and v163.Name == NameMon)) then
                                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat
                                            wait()
                                            EquipWeapon(WeaponPickBall)
                                            v163.Humanoid.JumpPower = 0
                                            v163.PrimaryPart.CanCollide = false
                                            v163.Humanoid.WalkSpeed = 0
                                            FarmPos = v163.HumanoidRootPart.CFrame
                                            MonFarm = v163.Name
                                            StartMagnet = true
                                            TP(v163.HumanoidRootPart.CFrame * MethodFarm)
                                        until not getgenv().AutoFarmLevel or (v163.Humanoid.Health <= 0 or (not v163.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false))
                                        StartMagnet = false
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        StartMagnet = false
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild(NameMon) then
                            TP(game:GetService("ReplicatedStorage"):FindFirstChild(NameMon).HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                        else
                            TP(CFrameMon)
                        end
                    end
                else
                    CheckQuest()
                    repeat
                        wait()
                        TP(CFrameQuest)
                    until (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not getgenv().AutoFarmLevel
                    if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                end
            end
        end)
    end
end)
v77.Main:CreateToggle("Auto Neareast Farm", {
    ["Title"] = "Auto Attack Nearest Enemy",
    ["Default"] = false
}):OnChanged(function(p164)
    getgenv().NearFarming = p164
    StopTween(getgenv().NearFarming)
end)
spawn(function()
    while wait() do
        if getgenv().NearFarming then
            pcall(function()
                local v165, v166, v167 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v168
                    v167, v168 = v165(v166, v167)
                    if v167 == nil then
                        break
                    end
                    if v168.Name and (v168:FindFirstChild("Humanoid") and (v168.Humanoid.Health > 0 and (v168.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 2500)) then
                        repeat
                            wait(1)
                            EquipWeapon(WeaponPickBall)
                            FarmPos = v168.HumanoidRootPart.CFrame
                            MonFarm = v168.Name
                            StartMagnet = true
                            TP(v168.HumanoidRootPart.CFrame * MethodFarm)
                        until not getgenv().NearFarming or (not v168.Parent or v168.Humanoid.Health == 0) or not game.Workspace.Enemies:FindFirstChild(v168.Name)
                        StartMagnet = false
                    end
                end
            end)
        end
    end
end)
v77.Main:CreateToggle("autoFarmbone", {
    ["Title"] = "Auto Farm Bone",
    ["Default"] = false
}):OnChanged(function(p169)
    getgenv().FarmBone = p169
    StopTween(getgenv().FarmBon)
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().FarmBon then
                local v170 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                local v171 = game:GetService("Players").LocalPlayer.Data.Level.Value
                if v170.Visible or 2000 > v171 then
                    if v170.Visible then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy"))) then
                            local v172, v173, v174 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v175
                                v174, v175 = v172(v173, v174)
                                if v174 == nil then
                                    break
                                end
                                if (v175.Name == "Reborn Skeleton" or (v175.Name == "Living Zombie" or (v175.Name == "Demonic Soul" or v175.Name == "Posessed Mummy"))) and (v175:FindFirstChild("Humanoid") and (v175:FindFirstChild("HumanoidRootPart") and v175.Humanoid.Health > 0)) then
                                    repeat
                                        wait()
                                        EquipWeapon(WeaponPickBall)
                                        v175.Humanoid.JumpPower = 0
                                        v175.PrimaryPart.CanCollide = false
                                        v175.Humanoid.WalkSpeed = 0
                                        FarmPos = v175.PrimaryPart.CFrame
                                        MonFarm = v175.Name
                                        StartMagnet = true
                                        TP(v175.HumanoidRootPart.CFrame * MethodFarm)
                                    until not getgenv().FarmBon or (not v175.Parent or v175.Humanoid.Health <= 0)
                                    StartMagnet = false
                                end
                            end
                        else
                            StartMagnet = false
                            TP(CFrame.new(- 9482.654296875, 142.13986206054688, 5495.40576171875))
                        end
                    end
                else
                    local v176 = CFrame.new(- 9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, - 1, 0, 0)
                    if (v176.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20 then
                        TP(v176)
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 2)
                    end
                end
            end
        end)
    end
end)
v77.Main:CreateToggle("Kata", {
    ["Title"] = "Auto Farm Katakuri",
    ["Description"] = "Auto Farm Mob On Cake Island, if there is a boss, it will automatically Teleport to kill it.",
    ["Default"] = false
}):OnChanged(function(p177)
    getgenv().DepChaii = p177
    StopTween(getgenv().DepChaii)
end)
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().DepChaii then
                local v178 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                local v179 = game:GetService("Players").LocalPlayer.Data.Level.Value
                if v178.Visible ~= false or 2200 > v179 then
                    if v178.Visible == true or v178.Visible == false then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                            local v180, v181, v182 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v183
                                v182, v183 = v180(v181, v182)
                                if v182 == nil then
                                    break
                                end
                                if (v183.Name == "Cake Prince" or v183.Name == "Dough King") and (v183:FindFirstChild("Humanoid") and (v183:FindFirstChild("HumanoidRootPart") and v183.Humanoid.Health > 0)) then
                                    repeat
                                        wait()
                                        EquipWeapon(WeaponPickBall)
                                        TP(v183.HumanoidRootPart.CFrame * MethodFarm)
                                        v183.HumanoidRootPart.CanCollide = false
                                        v183.Humanoid.WalkSpeed = 0
                                        v183.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not getgenv().DepChaii or (not v183.Parent or v183.Humanoid.Health <= 0)
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                            TP(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                            TP(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                        elseif game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency ~= 1 then
                            StartMagnet = false
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                TP(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                                TP(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                            end
                        elseif game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker"))) then
                            local v184, v185, v186 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v187
                                v186, v187 = v184(v185, v186)
                                if v186 == nil then
                                    break
                                end
                                if (v187.Name == "Cookie Crafter" or (v187.Name == "Cake Guard" or (v187.Name == "Baking Staff" or v187.Name == "Head Baker"))) and (v187:FindFirstChild("Humanoid") and (v187:FindFirstChild("HumanoidRootPart") and v187.Humanoid.Health > 0)) then
                                    repeat
                                        wait()
                                        EquipWeapon(WeaponPickBall)
                                        TP(v187.HumanoidRootPart.CFrame * MethodFarm)
                                        v187.PrimaryPart.CanCollide = false
                                        v187.Humanoid.WalkSpeed = 0
                                        FarmPos = v187.HumanoidRootPart.CFrame
                                        MonFarm = v187.Name
                                        StartMagnet = true
                                    until not getgenv().DepChaii or (not v187.Parent or v187.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or (game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or (game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or KillMob == 0)))
                                    StartMagnet = false
                                end
                            end
                        else
                            StartMagnet = false
                            TP(CFrame.new(- 2041.91162109375, 251.54185485839844, - 12345.380859375))
                        end
                    end
                else
                    local v188 = CFrame.new(- 2021.32007, 37.7982254, - 12028.7295, 0.957576931, - 8.80302053e-8, 0.288177818, 6.9301187e-8, 1, 7.51931211e-8, - 0.288177818, - 5.2032135e-8, 0.957576931)
                    if (v188.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20 then
                        TP(v188)
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                    end
                end
            end
        end)
    end
end)
v77.Main:CreateSection("Mastery Farm")
v77.Main:CreateSlider("MainHp", {
    ["Title"] = "Kill AT Hp%",
    ["Description"] = "Custom HP Enemies Settings",
    ["Default"] = 25,
    ["Min"] = 0,
    ["Max"] = 100,
    ["Rounding"] = 2,
    ["Callback"] = function(p189)
        getgenv().Kill_At = p189
    end
}):OnChanged(function(p190)
    getgenv().Kill_At = p190
end)
local v191 = v77.Main:CreateDropdown("SelectQuest", {
    ["Title"] = "Type Mastery",
    ["Values"] = {
        "Quest",
        "Nearest"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v191:SetValue("Nearest")
v191:OnChanged(function(p192)
    getgenv().MasteryType = p192
end)
v77.Main:CreateToggle("Mastery", {
    ["Title"] = "Auto Farm Mastery Fruit",
    ["Description"] = "Beta",
    ["Default"] = false
}):OnChanged(function(p193)
    getgenv().AutoFarmFruitMastery = p193
    StopTween(getgenv().AutoFarmFruitMastery)
end)
spawn(function()
    while wait() do
        if getgenv().AutoFarmFruitMastery and getgenv().MasteryType == "Quest" then
            pcall(function()
                CheckQuest()
                local v194 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(v194, NameMon) then
                    UseSkill = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    UseSkill = false
                    CheckQuest()
                    repeat
                        wait()
                        TP(CFrameQuest)
                    until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not getgenv().AutoFarmFruitMastery
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                        task.wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        wait(0.5)
                    end
					-- goto l14
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
					-- ::l14::
                    return
                end
                CheckQuest()
                if not game:GetService("Workspace").Enemies:FindFirstChild(NameMon) then
                    UseSkill = false
                    StartMagnet = false
                    TP(CFrameMon)
                    local v195 = game:GetService("ReplicatedStorage"):FindFirstChild(NameMon)
                    if v195 then
                        TP(v195.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10))
                    elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                        task.wait()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                    end
					-- goto l14
                end
                local v196, v197, v198 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v199
                    v198, v199 = v196(v197, v198)
                    if v198 == nil then
						-- goto l14
                    end
                    if v199:FindFirstChild("HumanoidRootPart") and (v199:FindFirstChild("Humanoid") and (v199.Humanoid.Health > 0 and v199.Name == NameMon)) then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                            HealthMs = v199.Humanoid.MaxHealth * getgenv().Kill_At / 100
                            repeat
                                if true then
                                    wait()
                                    if v199.Humanoid.Health > HealthMs then
                                        UseSkill = false
                                        AimBottSkill = false
                                        EquipWeapon(WeaponPickBall)
                                        TP(v199.HumanoidRootPart.CFrame * MethodFarm)
                                        FarmPos = v199.HumanoidRootPart.CFrame
                                        MonFarm = v199.Name
                                        StartMagnet = true
                                        AimBotSkillPosition = v199.HumanoidRootPart.Position
                                        getgenv().AClick = false
                                    else
                                        EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                        TP(v199.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad(- 90), 0, 0))
                                        UseSkill = true
                                        AimBottSkill = true
                                        FarmPos = v199.HumanoidRootPart.CFrame
                                        MonFarm = v199.Name
                                        AimBotSkillPosition = v199.HumanoidRootPart.Position
                                        getgenv().AClick = true
                                    end
                                end
                            until not getgenv().AutoFarmFruitMastery or (not getgenv().MasteryType == "Quest" or (v199.Humanoid.Health <= 0 or not v199.Parent)) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                            UseSkill = false
                        else
                            UseSkill = false
                            StartMagnet = false
                            getgenv().AClick = false
                            TP(CFrameMon)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                    end
                end
            end)
        elseif getgenv().AutoFarmFruitMastery and getgenv().MasteryType == "Nearest" then
            pcall(function()
                local v200, v201, v202 = pairs(game.Workspace.Enemies:GetChildren())
                while true do
                    local v203
                    v202, v203 = v200(v201, v202)
                    if v202 == nil then
                        return
                    end
                    if v203.Name and (v203:FindFirstChild("Humanoid") and (v203:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v203:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 2500)) then
                        repeat
                            if true then
                                wait()
                                if v203.Humanoid.Health > v203.Humanoid.MaxHealth * getgenv().Kill_At / 100 then
                                    UseSkill = false
                                    AimBottSkill = false
                                    EquipWeapon(WeaponPickBall)
                                    TP(v203.HumanoidRootPart.CFrame * MethodFarm)
                                    FarmPos = v203.HumanoidRootPart.CFrame
                                    MonFarm = v203.Name
                                    StartMagnet = true
                                    getgenv().AClick = false
                                else
                                    EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                    TP(v203.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad(- 90), 0, 0))
                                    UseSkill = true
                                    AimBottSkill = true
                                    FarmPos = v203.HumanoidRootPart.CFrame
                                    MonFarm = v203.Name
                                    AimBotSkillPosition = v203.HumanoidRootPart.Position
                                    getgenv().AClick = true
                                end
                            end
                        until not getgenv().AutoFarmFruitMastery or (not getgenv().MasteryType == "Nearest" or (not v203.Parent or v203.Humanoid.Health == 0))
                        UseSkill = false
                        StartMagnet = false
                        getgenv().AClick = false
                    end
                end
            end)
        end
    end
end)
v77.Main:CreateSection("Farm Chest")
v77.Main:CreateToggle("StopIn", {
    ["Title"] = "Stop If Have Legendary Item",
    ["Default"] = true
}):OnChanged(function(p204)
    getgenv().StopIsHaveItem = p204
end)
v77.Main:CreateToggle("ChestRandom", {
    ["Title"] = "Auto Farm Chest",
    ["Default"] = false
}):OnChanged(function(p205)
    getgenv().FarmChest = p205
    if getgenv().FarmChest == false then
        StopTween(getgenv().FarmChest)
        print("Auto Chest Check Value", true)
        print("Auto Chest Working", v)
    end
end)
rse = true
task.spawn(function()
	-- upvalues: (ref) vu3
    while true do
        repeat
            task.wait()
        until getgenv().FarmChest
        local v206 = game.Players.LocalPlayer
        if v206 and v206.Character then
            local vu207 = v206.Character
            local v208 = vu207:FindFirstChild("CrewBBG", true)
            if v208 then
                v208:Destroy()
            end
            vu207:FindFirstChild("Humanoid")
            local v209 = not game.Workspace:FindFirstChild("ChestModels") or game.Workspace.ChestModels:FindFirstChild("DiamondChest") or (game.Workspace.ChestModels:FindFirstChild("GoldChest") or game.Workspace.ChestModels:FindFirstChild("SilverChest"))
            if getgenv().StopIsHaveItem then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fist of Darkness") or (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sweet Chalice") or (game.Players.LocalPlayer.Backpack:FindFirstChild("God\'s Chalice") or (game.Players.LocalPlayer.Character:FindFirstChild("God\'s Chalice") or (game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or (vu3.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or vu3.Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]")))))))) then
                    print("return off")
                    if rse then
                        rse = false
                    end
                elseif v209 then
                    local vu210 = v209:FindFirstChild("RootPart")
                    if vu210 then
                        rse = true
                        vu207:PivotTo(vu210.CFrame)
                        pcall(function()
							-- upvalues: (ref) vu210, (ref) vu207
                            firesignal(vu210.Touched, vu207.HumanoidRootPart)
                        end)
                    end
                else
                    if rse then
                        rse = false
                    end
                    local vu211 = {}
                    local vu212 = ""
                    local vu213 = os.date("!*t").hour
                    if not pcall(function()
						-- upvalues: (ref) vu211
                        vu211 = game:GetService("HttpService"):JSONDecode(readfile("ChestCollect.SkullHub"))
                    end) then
                        table.insert(vu211, vu213)
                        writefile("ChestCollect.SkullHub", game:GetService("HttpService"):JSONEncode(vu211))
                    end
                    function TPReturner()
						-- upvalues: (ref) vu212, (ref) vu211, (ref) vu213
                        local v214
                        if vu212 ~= "" then
                            v214 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu212))
                        else
                            v214 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"))
                        end
                        if v214.nextPageCursor and (v214.nextPageCursor ~= "null" and v214.nextPageCursor ~= nil) then
                            vu212 = v214.nextPageCursor
                        end
                        local v215, v216, v217 = pairs(v214.data)
                        local v218 = 0
                        while true do
                            local v219
                            v217, v219 = v215(v216, v217)
                            if v217 == nil then
                                break
                            end
                            local v220 = true
                            local vu221 = tostring(v219.id)
                            if tonumber(v219.maxPlayers) > tonumber(v219.playing) then
                                local v222, v223, v224 = pairs(vu211)
                                while true do
                                    local v225
                                    v224, v225 = v222(v223, v224)
                                    if v224 == nil then
                                        break
                                    end
                                    if v218 == 0 then
                                        if tonumber(vu213) ~= tonumber(v225) then
                                            pcall(function()
												-- upvalues: (ref) vu211, (ref) vu213
                                                delfile("ChestCollect.SkullHub")
                                                vu211 = {}
                                                table.insert(vu211, vu213)
                                            end)
                                        end
                                    elseif vu221 == tostring(v225) then
                                        v220 = false
                                    end
                                    v218 = v218 + 1
                                end
                                if v220 == true then
                                    table.insert(vu211, vu221)
                                    wait()
                                    pcall(function()
										-- upvalues: (ref) vu211, (ref) vu221
                                        writefile("ChestCollect.SkullHub", game:GetService("HttpService"):JSONEncode(vu211))
                                        wait()
                                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, vu221, game.Players.LocalPlayer)
                                    end)
                                    wait(4)
                                end
                            end
                        end
                    end
                    function Teleport()
						-- upvalues: (ref) vu212
                        while wait() do
                            pcall(function()
								-- upvalues: (ref) vu212
                                TPReturner()
                                if vu212 ~= "" then
                                    TPReturner()
                                end
                            end)
                        end
                    end
                    Teleport()
                end
            elseif v209 then
                local vu226 = v209:FindFirstChild("RootPart")
                if vu226 then
                    rse = true
                    vu207:PivotTo(vu226.CFrame)
                    pcall(function()
						-- upvalues: (ref) vu226, (ref) vu207
                        firesignal(vu226.Touched, vu207.HumanoidRootPart)
                    end)
                end
            else
                if rse then
                    rse = false
                end
                local vu227 = {}
                local vu228 = ""
                local vu229 = os.date("!*t").hour
                if not pcall(function()
					-- upvalues: (ref) vu227
                    vu227 = game:GetService("HttpService"):JSONDecode(readfile("ChestCollect.SkullHub"))
                end) then
                    table.insert(vu227, vu229)
                    writefile("collect.json", game:GetService("HttpService"):JSONEncode(vu227))
                end
                function TPReturner()
					-- upvalues: (ref) vu228, (ref) vu227, (ref) vu229
                    local v230
                    if vu228 ~= "" then
                        v230 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu228))
                    else
                        v230 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"))
                    end
                    if v230.nextPageCursor and (v230.nextPageCursor ~= "null" and v230.nextPageCursor ~= nil) then
                        vu228 = v230.nextPageCursor
                    end
                    local v231, v232, v233 = pairs(v230.data)
                    local v234 = 0
                    while true do
                        local v235
                        v233, v235 = v231(v232, v233)
                        if v233 == nil then
                            break
                        end
                        local v236 = true
                        local vu237 = tostring(v235.id)
                        if tonumber(v235.maxPlayers) > tonumber(v235.playing) then
                            local v238, v239, v240 = pairs(vu227)
                            while true do
                                local v241
                                v240, v241 = v238(v239, v240)
                                if v240 == nil then
                                    break
                                end
                                if v234 == 0 then
                                    if tonumber(vu229) ~= tonumber(v241) then
                                        pcall(function()
											-- upvalues: (ref) vu227, (ref) vu229
                                            delfile("collect.json")
                                            vu227 = {}
                                            table.insert(vu227, vu229)
                                        end)
                                    end
                                elseif vu237 == tostring(v241) then
                                    v236 = false
                                end
                                v234 = v234 + 1
                            end
                            if v236 == true then
                                table.insert(vu227, vu237)
                                wait()
                                pcall(function()
									-- upvalues: (ref) vu227, (ref) vu237
                                    writefile("collect.json", game:GetService("HttpService"):JSONEncode(vu227))
                                    wait()
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, vu237, game.Players.LocalPlayer)
                                end)
                                wait(4)
                            end
                        end
                    end
                end
                function Teleport()
					-- upvalues: (ref) vu228
                    while wait() do
                        pcall(function()
							-- upvalues: (ref) vu228
                            TPReturner()
                            if vu228 ~= "" then
                                TPReturner()
                            end
                        end)
                    end
                end
                Teleport()
            end
        end
    end
end)
v77.Settings:CreateSection("Setttings Farm")
v77.Settings:CreateToggle("SpinWhen", {
    ["Title"] = "Spin Pos When Farm",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p242)
    getgenv().SpinWhenFarm = p242
end)
v77.Settings:CreateToggle("Clicking", {
    ["Title"] = "Auto Clicker",
    ["Default"] = false
}):OnChanged(function(p243)
    getgenv().AClick = p243
end)
spawn(function()
    while wait() do
        if getgenv().AClick then
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))
        end
    end
end)
v77.Settings:CreateToggle("Auto Awakening", {
    ["Title"] = "Auto Turn On Awakening",
    ["Default"] = false
}):OnChanged(function(p244)
    _G.AutoAwakening = p244
end)
spawn(function()
    while wait() do
        if _G.AutoAwakening and (game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and (game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and not game.Players.LocalPlayer.Character.RaceTransformed.Value)) then
            task.wait(1)
            SendKey("Y")
        end
    end
end)
v77.Settings:CreateToggle("Auto Agility", {
    ["Title"] = "Auto Turn On V3",
    ["Default"] = false
}):OnChanged(function(p245)
    _G.AutoAgility = p245
end)
spawn(function()
    while wait() do
        if _G.AutoAgility then
            task.wait(5)
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
        end
    end
end)
v77.Settings:CreateToggle("Walk", {
    ["Title"] = "Walk On Water",
    ["Default"] = true
}):OnChanged(function(p246)
    _G.WalkWater = p246
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.WalkWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)
v77.Settings:CreateToggle("AntiBand", {
    ["Title"] = "Anti Band",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p247)
    getgenv().AntiBand = p247
end)
spawn(function()
    while wait() do
        if getgenv().SpinWhenFarm then
            MethodFarm = CFrame.new(0, 30, - 35)
            task.wait(1)
            MethodFarm = CFrame.new(- 30, 30, 0)
            task.wait(1)
            MethodFarm = CFrame.new(0, 30, 30)
            wait(1)
            MethodFarm = CFrame.new(20, 30, 0)
        else
            MethodFarm = CFrame.new(0, 30, 0)
        end
    end
end)
local _ = count
local v248 = game:GetService("ReplicatedStorage")
local vu249 = v248.Modules.Net:FindFirstChild("RE/RegisterAttack")
local vu250 = v248.Modules.Net:FindFirstChild("RE/RegisterHit")
local function vu261(p251)
	-- upvalues: (ref) vu3
    local v252, v253, v254 = pairs(vu3.Characters:GetChildren())
    local v255 = {}
    while true do
        local v256
        v254, v256 = v252(v253, v254)
        if v254 == nil then
            break
        end
        if v256 ~= p251.Character and (v256:FindFirstChild("HumanoidRootPart") and p251:DistanceFromCharacter(v256.HumanoidRootPart.Position) < 200) then
            table.insert(v255, {
                v256,
                v256.HumanoidRootPart
            })
        end
    end
    local v257, v258, v259 = pairs(vu3.Enemies:GetChildren())
    while true do
        local v260
        v259, v260 = v257(v258, v259)
        if v259 == nil then
            break
        end
        if v260:FindFirstChild("HumanoidRootPart") and p251:DistanceFromCharacter(v260.HumanoidRootPart.Position) < 200 then
            table.insert(v255, {
                v260,
                v260.HumanoidRootPart
            })
        end
    end
    return v255
end
local vu262 = false
spawn(function()
	-- upvalues: (ref) vu262, (ref) vu261, (ref) vu249, (ref) vu250
    while true do
        if vu262 then
            task.wait(0.3)
        else
            task.wait(0.3)
        end
        if vu262 then
            local v263 = vu261(game.Players.LocalPlayer)
            if # v263 > 0 then
                vu249:FireServer(0.4)
                vu250:FireServer(enemy, targets)
                local v264, v265, v266 = pairs(v263)
                while true do
                    local v267
                    v266, v267 = v264(v265, v266)
                    if v266 == nil then
                        break
                    end
                    vu250:FireServer(v267[2], v263)
                end
            end
        end
    end
end)
vu262 = true
v77.Shop:CreateToggle("RandomBone", {
    ["Title"] = "Auto Random Bone",
    ["Default"] = false
}):OnChanged(function(p268)
    getgenv().RandomBoneMath = p268
    spawn(function()
        pcall(function()
            while wait(0) do
                if getgenv().RandomBoneMath then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                end
            end
        end)
    end)
end)
v77.Shop:CreateButton({
    ["Title"] = "Buy Black Leg [ $150,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Electro [ $550,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Water Kung Fu [ $750,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Dragon Claw [ \195\134\226\128\1531,500 ]",
    ["Callback"] = function()
        local v269 = game:GetService("ReplicatedStorage").Remotes.CommF_
        v269:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        v269:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Superhuman [ $3,000,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Death Step [ \195\134\226\128\1535,000 $5,000,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Sharkman Karate [ \195\134\226\128\1535,000 $2,500,000 ]",
    ["Callback"] = function()
        local v270 = game:GetService("ReplicatedStorage").Remotes.CommF_
        v270:InvokeServer("BuySharkmanKarate", true)
        v270:InvokeServer("BuySharkmanKarate")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Electric Claw [ \195\134\226\128\1535,000 $3,000,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Dragon Talon [ \195\134\226\128\1535,000 $3,000,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy God Human [ \195\134\226\128\1535,000 $5,000,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Buy Sanguine Art [ \195\134\226\128\1535,000 $5,000,000 ]",
    ["Callback"] = function()
        local v271 = game:GetService("ReplicatedStorage").Remotes.CommF_
        v271:InvokeServer("BuySanguineArt", true)
        v271:InvokeServer("BuySanguineArt")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Random Fruit [ $ ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end
})
v77.Shop:CreateSection("Sword Buy")
v77.Shop:CreateButton({
    ["Title"] = "Katana [ $1,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Iron Mace [ $25,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Dual Katana [ $12,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Triple Katana [ $60,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Pipe [ $100,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Dual-Headed Blade [ $400,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Bisento [ $1,200,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Soul Cane [ $750,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Pole v.2 [ \195\134\226\128\1535,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Slingshot [ $5,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Musket [ $8,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Flintlock [ $10,500 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Refined Slingshot [ $30,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Refined Flintlock [ $65,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Cannon [ $100,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Kabucha [ \195\134\226\128\1531,500 ]",
    ["Callback"] = function()
        local v272 = game:GetService("ReplicatedStorage").Remotes.CommF_
        v272:InvokeServer("BlackbeardReward", "Slingshot", "1")
        v272:InvokeServer("BlackbeardReward", "Slingshot", "2")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Bizarre Rifle [ 250 Ectoplasm ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Reset Stats [ Use \195\134\226\128\1532,500 ]",
    ["Callback"] = function()
        local v273 = game:GetService("ReplicatedStorage").Remotes.CommF_
        v273:InvokeServer("BlackbeardReward", "Refund", "1")
        v273:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Random Race [ Use \195\134\226\128\1533,000 ]",
    ["Callback"] = function()
        local v274 = game:GetService("ReplicatedStorage").Remotes.CommF_
        v274:InvokeServer("BlackbeardReward", "Reroll", "1")
        v274:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Black Cape [ $50,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Swordsman Hat [ $150,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
    end
})
v77.Shop:CreateButton({
    ["Title"] = "Tomoe Ring [ $500,000 ]",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
    end
})
v77.Travel:CreateButton({
    ["Title"] = "Travel to Sea 1",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
v77.Travel:CreateButton({
    ["Title"] = "Travel to Sea 2",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
v77.Travel:CreateButton({
    ["Title"] = "Travel to Sea 3",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
local v275 = vu5 and {
    "WindMill",
    "Marine",
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Snow Island",
    "MarineFord",
    "Colosseum",
    "Sky Island 1",
    "Sky Island 2",
    "Sky Island 3",
    "Prison",
    "Magma Village",
    "Under Water Island",
    "Fountain City",
    "Shank Room",
    "Mob Island"
} or (vu6 and {
    "The Cafe",
    "Frist Spot",
    "Dark Area",
    "Flamingo Mansion",
    "Flamingo Room",
    "Green Zone",
    "Factory",
    "Colossuim",
    "Zombie Island",
    "Two Snow Mountain",
    "Hot & Cold",
    "Punk Hazard",
    "Cursed Ship",
    "Ice Castle",
    "Forgotten Island",
    "Ussop Island",
    "Mini Sky Island"
} or (vu7 and {
    "Mansion",
    "Port Town",
    "Great Tree",
    "Castle On The Sea",
    "MiniSky",
    "Hydra Island",
    "Floating Turtle",
    "Haunted Castle",
    "Ice Cream Island",
    "Peanut Island",
    "Cake Island",
    "Room Enma/Yama & Secret Temple",
    "Room Tushita",
    "Tiki Outpost",
    "Dragon Gojo"
} or nil))
local v276 = v77.Travel:CreateDropdown("TracelSea", {
    ["Title"] = "Select Islands",
    ["Values"] = v275,
    ["Multi"] = false,
    ["Default"] = 1
})
v276:SetValue("")
v276:OnChanged(function(p277)
    _G.SelectIsland = p277
end)
v77.Travel:CreateToggle("chost", {
    ["Title"] = "Teleport to selected islands",
    ["Default"] = false
}):OnChanged(function(p278)
    _G.TeleportIsland = p278
    StopTween(_G.TeleportIsland)
end)
spawn(function()
	-- ::l0::
    repeat
        if not wait() then
            return
        end
    until _G.TeleportIsland
	-- ::l5::
    if true then
        wait()
        if _G.SelectIsland ~= "WindMill" then
            if _G.SelectIsland ~= "Marine" then
                if _G.SelectIsland ~= "Middle Town" then
                    if _G.SelectIsland ~= "Jungle" then
                        if _G.SelectIsland ~= "Pirate Village" then
                            if _G.SelectIsland ~= "Desert" then
                                if _G.SelectIsland ~= "Snow Island" then
                                    if _G.SelectIsland ~= "MarineFord" then
                                        if _G.SelectIsland ~= "Colosseum" then
                                            if _G.SelectIsland ~= "Sky Island 1" then
                                                if _G.SelectIsland ~= "Sky Island 2" then
                                                    if _G.SelectIsland ~= "Sky Island 3" then
                                                        if _G.SelectIsland ~= "Prison" then
                                                            if _G.SelectIsland ~= "Magma Village" then
                                                                if _G.SelectIsland ~= "Under Water Island" then
                                                                    if _G.SelectIsland ~= "Fountain City" then
                                                                        if _G.SelectIsland ~= "Shank Room" then
                                                                            if _G.SelectIsland ~= "Mob Island" then
                                                                                if _G.SelectIsland ~= "The Cafe" then
                                                                                    if _G.SelectIsland ~= "Frist Spot" then
                                                                                        if _G.SelectIsland ~= "Dark Area" then
                                                                                            if _G.SelectIsland ~= "Flamingo Mansion" then
                                                                                                if _G.SelectIsland ~= "Flamingo Room" then
                                                                                                    if _G.SelectIsland ~= "Green Zone" then
                                                                                                        if _G.SelectIsland ~= "Factory" then
                                                                                                            if _G.SelectIsland ~= "Colossuim" then
                                                                                                                if _G.SelectIsland ~= "Zombie Island" then
                                                                                                                    if _G.SelectIsland ~= "Two Snow Mountain" then
                                                                                                                        if _G.SelectIsland ~= "Hot & Cold" then
                                                                                                                            if _G.SelectIsland ~= "Punk Hazard" then
                                                                                                                                if _G.SelectIsland ~= "Cursed Ship" then
                                                                                                                                    if _G.SelectIsland ~= "Ice Castle" then
                                                                                                                                        if _G.SelectIsland ~= "Forgotten Island" then
                                                                                                                                            if _G.SelectIsland ~= "Ussop Island" then
                                                                                                                                                if _G.SelectIsland ~= "Mini Sky Island" then
                                                                                                                                                    if _G.SelectIsland ~= "Great Tree" then
                                                                                                                                                        if _G.SelectIsland ~= "Castle On The Sea" then
                                                                                                                                                            if _G.SelectIsland ~= "MiniSky" then
                                                                                                                                                                if _G.SelectIsland ~= "Port Town" then
                                                                                                                                                                    if _G.SelectIsland ~= "Hydra Island" then
                                                                                                                                                                        if _G.SelectIsland ~= "Floating Turtle" then
                                                                                                                                                                            if _G.SelectIsland ~= "Mansion" then
                                                                                                                                                                                if _G.SelectIsland ~= "Haunted Castle" then
                                                                                                                                                                                    if _G.SelectIsland ~= "Ice Cream Island" then
                                                                                                                                                                                        if _G.SelectIsland ~= "Peanut Island" then
                                                                                                                                                                                            if _G.SelectIsland ~= "Cake Island" then
                                                                                                                                                                                                if _G.SelectIsland ~= "Room Enma/Yama & Secret Temple" then
                                                                                                                                                                                                    if _G.SelectIsland ~= "Room Tushita" then
                                                                                                                                                                                                        if _G.SelectIsland ~= "Tiki Outpost" then
                                                                                                                                                                                                            if _G.SelectIsland == "Dragon Gojo" then
                                                                                                                                                                                                                TP(CFrame.new(5785.18115234375, 1359.7843017578125, 908.6729736328125))
                                                                                                                                                                                                            end
                                                                                                                                                                                                        else
                                                                                                                                                                                                            TP(CFrame.new(- 16899.6133, 9.31711292, 492.155396, 0.00204202533, - 0.00301179662, 0.999993384, - 0.0185630079, 0.999823034, 0.00304919085, - 0.999825597, - 0.01856911, 0.00198575854))
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        TP(CFrame.new(5174.83447265625, 141.81944274902344, 911.4637451171875))
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    TP(CFrame.new(5227.9052734375, 8.119736671447754, 1100.832275390625))
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                TP(CFrame.new(- 1884.7747802734375, 19.327526092529297, - 11666.8974609375))
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            TP(CFrame.new(- 2062.7475585938, 50.473892211914, - 10232.568359375))
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        TP(CFrame.new(- 902.56817626953, 79.93204498291, - 10988.84765625))
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    TP(CFrame.new(- 9515.3720703125, 164.00624084473, 5786.0610351562))
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 12471.169921875, 374.94024658203, - 7551.677734375))
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            TP(CFrame.new(- 13274.528320313, 531.82073974609, - 7579.22265625))
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5627.6005859375, 1082.473876953125, - 300.69598388671875))
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    TP(CFrame.new(- 290.7376708984375, 6.729952812194824, 5343.5537109375))
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                TP(CFrame.new(- 260.65557861328, 49325.8046875, - 35253.5703125))
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5080.81787109375, 314.5812072753906, - 3003.600830078125))
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        TP(CFrame.new(2953.328369140625, 2282.010009765625, - 7214.51611328125))
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    TP(CFrame.new(- 288.74060058594, 49326.31640625, - 35248.59375))
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                TP(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            TP(CFrame.new(- 3032.7641601563, 317.89672851563, - 10075.373046875))
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        TP(CFrame.new(6148.4116210938, 294.38687133789, - 6741.1166992188))
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    TP(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                                                                                                                                end
                                                                                                                            else
                                                                                                                                TP(CFrame.new(- 6127.654296875, 15.951762199402, - 5040.2861328125))
                                                                                                                            end
                                                                                                                        else
                                                                                                                            TP(CFrame.new(- 6014.5205078125, 15.984769821166992, - 5102.9755859375))
                                                                                                                        end
                                                                                                                    else
                                                                                                                        TP(CFrame.new(753.14288330078, 408.23559570313, - 5274.6147460938))
                                                                                                                    end
                                                                                                                else
                                                                                                                    TP(CFrame.new(- 5622.033203125, 492.19604492188, - 781.78552246094))
                                                                                                                end
                                                                                                            else
                                                                                                                TP(CFrame.new(- 1503.6224365234, 219.7956237793, 1369.3101806641))
                                                                                                            end
                                                                                                        else
                                                                                                            TP(CFrame.new(424.12698364258, 211.16171264648, - 427.54049682617))
                                                                                                        end
                                                                                                    else
                                                                                                        TP(CFrame.new(- 2448.5300292969, 73.016105651855, - 3210.6306152344))
                                                                                                    end
                                                                                                else
                                                                                                    TP(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                                                                                                end
                                                                                            else
                                                                                                TP(CFrame.new(- 483.73370361328, 332.0383605957, 595.32708740234))
                                                                                            end
                                                                                        else
                                                                                            TP(CFrame.new(3780.0302734375, 22.652164459229, - 3498.5859375))
                                                                                        end
                                                                                    else
                                                                                        TP(CFrame.new(- 11.311455726624, 29.276733398438, 2771.5224609375))
                                                                                    end
                                                                                else
                                                                                    TP(CFrame.new(- 380.47927856445, 77.220390319824, 255.82550048828))
                                                                                end
                                                                            else
                                                                                TP(CFrame.new(- 2850.20068, 7.39224768, 5354.99268))
                                                                            end
                                                                        else
                                                                            TP(CFrame.new(- 1442.16553, 29.8788261, - 28.3547478))
                                                                        end
                                                                    else
                                                                        TP(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                                                                    end
                                                                else
                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                                end
                                                            else
                                                                TP(CFrame.new(- 5247.7163085938, 12.883934020996, 8504.96875))
                                                            end
                                                        else
                                                            TP(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                                                        end
                                                    else
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                                                    end
                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
                                                end
                                            else
                                                TP(CFrame.new(- 4869.1025390625, 733.46051025391, - 2667.0180664063))
                                            end
                                        else
                                            TP(CFrame.new(- 1427.6203613281, 7.2881078720093, - 2792.7722167969))
                                        end
                                    else
                                        TP(CFrame.new(- 4914.8212890625, 50.963626861572, 4281.0278320313))
                                    end
                                else
                                    TP(CFrame.new(1347.8067626953, 104.66806030273, - 1319.7370605469))
                                end
                            else
                                TP(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                            end
                        else
                            TP(CFrame.new(- 1181.3093261719, 4.7514905929565, 3803.5456542969))
                        end
                    else
                        TP(CFrame.new(- 1612.7957763672, 36.852081298828, 149.12843322754))
                    end
                else
                    TP(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094))
                end
            else
                TP(CFrame.new(- 2566.4296875, 6.8556680679321, 2045.2561035156))
            end
        else
            TP(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
        end
    end
    if _G.TeleportIsland then
		-- goto l5
    end
	-- goto l0
end)
v77.Dojo:CreateToggle("Draco", {
    ["Title"] = "Change Race Draco Work when in Sea3",
    ["Default"] = false
}):OnChanged(function(p279)
    _G.ChangeDraco = p279
    if _G.ChangeDraco then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        TP(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        local v280 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
        local v281 = game.Players.LocalPlayer
        local v282 = v281.Character
        if not v282 then
            v282 = v281.CharacterAdded:Wait()
        end
        repeat
            wait()
        until (v282.HumanoidRootPart.Position - v280).Magnitude < 1
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
            {
                ["NPC"] = "Dragon Wizard",
                ["Command"] = "DragonRace"
            }
        }))
    end
end)
local v283 = v77.Dojo:CreateDropdown("DelaySkill", {
    ["Title"] = "Delay Use Skill",
    ["Values"] = {
        "0.1",
        "0.2",
        "0.3",
        "0.4",
        "0.5",
        "0.6",
        "0.7",
        "0.8",
        "0.9",
        "1",
        "1.5",
        "2",
        "3"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v283:SetValue("2")
v283:OnChanged(function(p284)
    DelaySkillDesyoy = p284
end)
v77.Dojo:CreateToggle("tree", {
    ["Title"] = "Auto Destroyed Tree",
    ["Description"] = "Only Applies To Hydra Islands ",
    ["Default"] = false
}):OnChanged(function(p285)
    treelo = p285
    StopTween(treelo)
end)
spawn(function()
    while task.wait() do
        if treelo then
            TP(CFrame.new(5697.17431640625, 1229.2698974609375, 948.7987060546875))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            Wait(5.5)
            TP(CFrame.new(5763.771484375, 1227.1949462890625, 903.5650634765625))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            Wait(5.5)
            TP(CFrame.new(5813.390625, 1234.8701171875, 967.6467895507812))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            Wait(5.5)
            TP(CFrame.new(5680.9375, 1239.6468505859375, 855.3919677734375))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            wait(5.5)
            TP(CFrame.new(5414.3701171875, 1056.2933349609375, 24.288162231445312))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            wait(5.5)
            TP(CFrame.new(5179.68603515625, 1004.0494995117188, 281.8595275878906))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            wait(5.5)
            TP(CFrame.new(5102.47607421875, 1017.2420654296875, 443.5939636230469))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            Wait(5.5)
            TP(CFrame.new(4931.6494140625, 1011.0020751953125, 357.48333740234375))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            Wait(5.5)
            TP(CFrame.new(4946.28125, 1019.9456787109375, 414.7027587890625))
            if _G.SpamMelee then
                EquipWeapon(WeaponPickBall)
                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(DelaySkillDesyoy)
                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            Wait(5.5)
        end
    end
end)
v77.Dojo:CreateSection("Quest Dragon Hunter + Dragon Talon")
v77.Dojo:CreateToggle("HydraMib", {
    ["Title"] = "Auto Farm Mob Hydra Islands",
    ["Description"] = "Attack Mob to Collect Fire Blaze Ember",
    ["Default"] = false
}):OnChanged(function(p286)
    getgenv().AutoKillMobHydra = p286
    StopTween(getgenv().AutoKillMobHydra)
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoKillMobHydra then
                local v287 = game:GetService("Workspace").Enemies
                if v287:FindFirstChild("Hydra Enforcer") or v287:FindFirstChild("Venomous Assailant") then
                    local v288, v289, v290 = pairs(v287:GetChildren())
                    while true do
                        local v291
                        v290, v291 = v288(v289, v290)
                        if v290 == nil then
                            break
                        end
                        if (v291.Name == "Hydra Enforcer" or v291.Name == "Venomous Assailant") and (v291:FindFirstChild("Humanoid") and (v291:FindFirstChild("HumanoidRootPart") and v291.Humanoid.Health > 0)) then
                            repeat
                                wait()
                                EquipWeapon(WeaponPickBall)
                                FarmPos = v291.PrimaryPart.CFrame
                                MonFarm = v291.Name
                                StartMagnet = true
                                TP(v291.HumanoidRootPart.CFrame * MethodFarm)
                            until not getgenv().AutoKillMobHydra or (not v291.Parent or v291.Humanoid.Health <= 0)
                        end
                    end
                end
            end
        end)
    end
end)
v77.Dojo:CreateButton({
    ["Title"] = "Teleport To NPC Dragon Hunter",
    ["Callback"] = function()
        TP(CFrame.new(5865.80811, 1209.50269, 811.746582, - 0.675207436, - 6.76664627e-8, 0.737627923, 8.33632186e-9, 1, 9.93661047e-8, - 0.737627923, 7.32418357e-8, - 0.675207436))
    end
})
v77.Dojo:CreateToggle("AutoUpdate", {
    ["Title"] = "Auto updated Dragon Talon",
    ["Default"] = false
}):OnChanged(function(p292)
    getgenv().AutoUpdateDragon = p292
    StopTween(getgenv().AutoUpdateDragon)
end)
spawn(function()
    while task.wait() do
        if getgenv().AutoUpdateDragon then
            local v293 = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, - 1.36805838e-8, - 0.584473014, 4.75227395e-8, 1, 4.25682458e-8, 0.584473014, - 6.23161966e-8, 0.811413169)
            TP(v293)
            if (v293.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer({
                    ["NPC"] = "Uzoth",
                    ["Command"] = "Upgrade"
                })
            end
        end
    end
end)
v77.Dojo:CreateToggle("Auto Blaze Ember", {
    ["Title"] = "Auto Collect Fire Blaze Ember",
    ["Default"] = false
}):OnChanged(function(p294)
    _G.AutoBlazeEmber = p294
    StopTween(_G.AutoBlazeEmber)
end)
spawn(function()
    while wait() do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
            end)
        end
    end
end)
v77.Dojo:CreateToggle("Auto Collect Fire Flowers", {
    ["Title"] = "Auto Collect Fire Flowers",
    ["Default"] = false
}):OnChanged(function(p295)
    _G.AutoCollectFireFlowers = p295
    StopTween(_G.AutoCollectFireFlowers)
end)
spawn(function()
	-- upvalues: (ref) vu3
    while wait() do
        local v296 = _G.AutoCollectFireFlowers and vu3:FindFirstChild("FireFlowers")
        if v296 then
            local v297, v298, v299 = pairs(v296:GetChildren())
            while true do
                local v300
                v299, v300 = v297(v298, v299)
                if v299 == nil then
                    break
                end
                if v300:IsA("Model") then
                    TP(CFrame.new(v300.PrimaryPart.Position))
                end
            end
        end
    end
end)
v77.Dojo:CreateSection("Belt")
v77.Dojo:CreateToggle("BeltWhite", {
    ["Title"] = "Auto Complete Belt White",
    ["Default"] = false
}):OnChanged(function(p301)
    _G.AutoWhiteBelt = p301
    StopTween(_G.AutoWhiteBelt)
end)
spawn(function()
	-- upvalues: (ref) vu2
    while wait() do
        pcall(function()
			-- upvalues: (ref) vu2
            if _G.AutoWhiteBelt then
                local v302 = game:GetService("Workspace").Enemies
                if v302:FindFirstChild("Serpent Hunter") or v302:FindFirstChild("Skull Slayer") then
                    local v303, v304, v305 = pairs(v302:GetChildren())
                    while true do
                        local v306
                        v305, v306 = v303(v304, v305)
                        if v305 == nil then
                            break
                        end
                        if (v306.Name == "Reborn Skeleton" or (v306.Name == "Serpent Hunter" or v306.Name == "Skull Slayer")) and (v306:FindFirstChild("Humanoid") and (v306:FindFirstChild("HumanoidRootPart") and v306.Humanoid.Health > 0)) then
                            repeat
                                wait()
                                EquipWeapon(WeaponPickBall)
                                FarmPos = v306.PrimaryPart.CFrame
                                MonFarm = v306.Name
                                StartMagnet = true
                                TP(v306.HumanoidRootPart.CFrame * MethodFarm)
                                game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer({
                                    ["NPC"] = "Dojo Trainer",
                                    ["Command"] = "RequestQuest"
                                })
                                vu2.Map.Waterfall.HydraIslandClient.RemoteFunction:InvokeServer("progress")
                            until not _G.AutoWhiteBelt or (not v306.Parent or v306.Humanoid.Health <= 0)
                            StartMagnet = false
                        end
                    end
                else
                    StartMagnet = false
                    TP(CFrame.new(- 16665.462890625, 105.3105697631836, 1577.8289794921875))
                end
            end
        end)
    end
end)
v77.Dojo:CreateToggle("Purle", {
    ["Title"] = "Auto Complete Purle Belt",
    ["Default"] = false
}):OnChanged(function(p307)
    getgenv().AutoPurle = p307
    StopTween(getgenv().AutoPurle)
end)
spawn(function()
    while task.wait() do
        if getgenv().AutoPurle then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                    local v308, v309, v310 = pairs(enemies:GetChildren())
                    while true do
                        local v311
                        v310, v311 = v308(v309, v310)
                        if v310 == nil then
                            break
                        end
                        if v311:FindFirstChild("Humanoid") and (v311:FindFirstChild("HumanoidRootPart") and (v311.Humanoid.Health > 0 and (v311.Name == "Diablo" or (v311.Name == "Deandre" or v311.Name == "Urban")))) then
                            repeat
                                wait()
                                EquipWeapon(WeaponPickBall)
                                TP(v311.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                FarmPos = v311.HumanoidRootPart.CFrame
                                MonFarm = v311.Name
                                v311.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                            until getgenv().AutoPurle == false or (v311.Humanoid.Health <= 0 or not v311.Parent)
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame)
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame)
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)
v77.Dojo:CreateSection("Settings Dojo")
v77.Dojo:CreateToggle("SpamMelee", {
    ["Title"] = "Use Skill Sword",
    ["Default"] = true
}):OnChanged(function(p312)
    _G.SpamSword = p312
end)
v77.Dojo:CreateToggle("SpamSword", {
    ["Title"] = "Use Skill Melee",
    ["Default"] = true
}):OnChanged(function(p313)
    _G.SpamMelee = p313
end)
v77.Sub:CreateToggle("Auto Cavander", {
    ["Title"] = "Auto Get Cavander Sword",
    ["Default"] = false
}):OnChanged(function(p314)
    _G.AutoCavander = p314
    StopTween(_G.AutoCavander)
end)
spawn(function()
    while wait() do
        if _G.AutoCavander then
            pcall(function()
                local v315 = game:GetService("Workspace").Enemies
                if v315:FindFirstChild("Beautiful Pirate") then
                    local v316, v317, v318 = pairs(v315:GetChildren())
                    while true do
                        local v319
                        v318, v319 = v316(v317, v318)
                        if v318 == nil then
                            break
                        end
                        if v319.Name == "Beautiful Pirate" and (v319:FindFirstChild("Humanoid") and (v319:FindFirstChild("HumanoidRootPart") and v319.Humanoid.Health > 0)) then
                            repeat
                                wait()
                                EquipWeapon(WeaponPickBall)
                                v319.HumanoidRootPart.CanCollide = false
                                v319.Humanoid.WalkSpeed = 0
                                v319.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                TP(v319.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoCavander or (not v319.Parent or v319.Humanoid.Health <= 0)
                        end
                    end
                else
                    TP(CFrame.new(5378.661, 444.582, 123.935))
                    local v320 = game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate")
                    if v320 then
                        TP(v320.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                    elseif _G.AutoCavanderHop then
                        Hop()
                    end
                end
            end)
        end
    end
end)
v77.Sub:CreateToggle("ElitHunter", {
    ["Title"] = "Auto Farm Elite Hunter",
    ["Default"] = false
}):OnChanged(function(p321)
    _G.AutoElitehunter = p321
    StopTween(_G.AutoElitehunter)
end)
spawn(function()
    while task.wait() do
        if _G.AutoElitehunter then
            pcall(function()
                local v322 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                if v322.Visible ~= true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                else
                    local v323 = v322.Container.QuestTitle.Title.Text
                    if string.find(v323, "Diablo") or (string.find(v323, "Deandre") or string.find(v323, "Urban")) then
                        local v324 = game:GetService("Workspace").Enemies
                        if v324:FindFirstChild("Diablo") or (v324:FindFirstChild("Deandre") or v324:FindFirstChild("Urban")) then
                            local v325, v326, v327 = pairs(v324:GetChildren())
                            while true do
                                local v328
                                v327, v328 = v325(v326, v327)
                                if v327 == nil then
                                    break
                                end
                                if v328:FindFirstChild("Humanoid") and (v328:FindFirstChild("HumanoidRootPart") and (v328.Humanoid.Health > 0 and (v328.Name == "Diablo" or (v328.Name == "Deandre" or v328.Name == "Urban")))) then
                                    repeat
                                        wait()
                                        EquipWeapon(WeaponPickBall)
                                        TP(v328.HumanoidRootPart.CFrame * MethodFarm)
                                        FarmPos = v328.HumanoidRootPart.CFrame
                                        MonFarm = v328.Name
                                        v328.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    until _G.AutoElitehunter == false or (v328.Humanoid.Health <= 0 or not v328.Parent)
                                end
                            end
                        else
                            local v329 = game:GetService("ReplicatedStorage")
                            if v329:FindFirstChild("Diablo") then
                                TP(v329:FindFirstChild("Diablo").HumanoidRootPart.CFrame * MethodFarm)
                            elseif v329:FindFirstChild("Deandre") then
                                TP(v329:FindFirstChild("Deandre").HumanoidRootPart.CFrame * MethodFarm)
                            elseif v329:FindFirstChild("Urban") then
                                TP(v329:FindFirstChild("Urban").HumanoidRootPart.CFrame * MethodFarm)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
v77.Sub:CreateToggle("Auto Tushita", {
    ["Title"] = "Auto Get Tushita",
    ["Default"] = false
}):OnChanged(function(p330)
    _G.AutoTushita = p330
    StopTween(_G.AutoTushita)
end)
spawn(function()
	-- ::l0::
    while true do
        repeat
            if not wait() then
                return
            end
        until _G.AutoTushita
        if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
            break
        end
        TP(CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125))
    end
    local v331, v332, v333 = pairs(game:GetService("Workspace").Enemies:GetChildren())
	-- goto l9
	-- ::l7::
	-- goto l9
	-- ::l8::
	-- goto l20
	-- ::l20::
    wait()
    StartMagnet = true
    if not game.Players.LocalPlayer.Character:FindFirstChild(WeaponPickBall) then
        wait()
        EquipWeapon(WeaponPickBall)
    end
    PosMon = v334.HumanoidRootPart.CFrame
    v334.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
    v334.Humanoid.JumpPower = 0
    v334.Humanoid.WalkSpeed = 0
    v334.HumanoidRootPart.CanCollide = false
    v334.Humanoid:ChangeState(11)
    TP(v334.HumanoidRootPart.CFrame * MethodFarm)
    if _G.AutoTushita and (v334.Parent and v334.Humanoid.Health > 0) then
		-- goto l20
    end
    StartMagnet = false
	-- ::l9::
    local v334
    v333, v334 = v331(v332, v333)
    if v333 == nil then
		-- goto l0
    end
    if v334.Name ~= "Longma" or (v334.Humanoid.Health <= 0 or not (v334:IsA("Model") and (v334:FindFirstChild("Humanoid") and v334:FindFirstChild("HumanoidRootPart")))) then
		-- goto l7
    else
		-- goto l8
    end
end)
v77.Sub:CreateToggle("Auto Yama", {
    ["Title"] = "Auto Get Yama",
    ["Description"] = "first you have to kill 30 elites hunter",
    ["Default"] = false
}):OnChanged(function(p335)
    _G.AutoYama = p335
end)
spawn(function()
    while wait() do
        if _G.AutoYama and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
            repeat
                wait()
                fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
        end
    end
end)
v77.Sub:CreateToggle("Auto Holy Torch", {
    ["Title"] = "Auto Holy Torch",
    ["Description"] = "Need Spawm Rip_Indra",
    ["Default"] = false
}):OnChanged(function(p336)
    _G.AutoHolyTorch = p336
    StopTween(_G.AutoHolyTorch)
end)
spawn(function()
    while wait() do
        if _G.AutoHolyTorch then
            pcall(function()
                wait(1)
                if _G.AutoHolyTorch then
                    repeat
                        TP(CFrame.new(- 10752, 417, - 9366))
                        wait()
                    until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10752, 417, - 9366)).Magnitude <= 10
                end
                wait(1)
                if _G.AutoHolyTorch then
                    repeat
                        TP(CFrame.new(- 11672, 334, - 9474))
                        wait()
                    until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 11672, 334, - 9474)).Magnitude <= 10
                end
                wait(1)
                if _G.AutoHolyTorch then
                    repeat
                        TP(CFrame.new(- 12132, 521, - 10655))
                        wait()
                    until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12132, 521, - 10655)).Magnitude <= 10
                end
                wait(1)
                if _G.AutoHolyTorch then
                    repeat
                        TP(CFrame.new(- 13336, 486, - 6985))
                        wait()
                    until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13336, 486, - 6985)).Magnitude <= 10
                end
                wait(1)
                if _G.AutoHolyTorch then
                    repeat
                        TP(CFrame.new(- 13489, 332, - 7925))
                        wait()
                    until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13489, 332, - 7925)).Magnitude <= 10
                end
                wait(1)
            end)
        end
    end
end)
v77.Sub:CreateToggle("Auto Twin Hooks", {
    ["Title"] = "Auto Get Twin Hooks",
    ["Default"] = false
}):OnChanged(function(p337)
    _G.AutoTwinHooks = p337
    StopTween(_G.AutoTwinHooks)
end)
spawn(function()
    while wait() do
        if _G.AutoTwinHooks then
            pcall(function()
                local v338 = game:GetService("Workspace").Enemies
                if v338:FindFirstChild("Captain Elephant") then
                    local v339, v340, v341 = pairs(v338:GetChildren())
                    while true do
                        local v342
                        v341, v342 = v339(v340, v341)
                        if v341 == nil then
                            break
                        end
                        if v342.Name == "Captain Elephant" and (v342:FindFirstChild("Humanoid") and (v342:FindFirstChild("HumanoidRootPart") and v342.Humanoid.Health > 0)) then
                            repeat
                                wait()
                                EquipWeapon(WeaponPickBall)
                                v342.HumanoidRootPart.CanCollide = false
                                v342.Humanoid.WalkSpeed = 0
                                v342.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                TP(v342.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoTwinHooks or (not v342.Parent or v342.Humanoid.Health <= 0)
                        end
                    end
                else
                    TP(CFrame.new(- 13317.371, 319.213, - 8621.723))
                    local v343 = game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant")
                    if v343 then
                        TP(v343.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                    elseif _G.AutoTwinHookHop then
                        Hop()
                    end
                end
            end)
        end
    end
end)
local v344 = v77.Raid:CreateDropdown("ListRadi", {
    ["Title"] = "Select Raid",
    ["Values"] = {
        "Flame",
        "Ice",
        "Quake",
        "Light",
        "Dark",
        "Spider",
        "Rumble",
        "Magma",
        "Buddha",
        "Sand",
        "Phoenix",
        "Dough"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v344:SetValue("")
v344:OnChanged(function(p345)
    _G.SelectChip = p345
end)
v77.Raid:CreateButton({
    ["Title"] = "Auto Buy Chip Selected Normal",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
})
v77.Raid:CreateToggle("Auto Start Raid", {
    ["Title"] = "Start Raid",
    ["Default"] = false
}):OnChanged(function(p346)
    _G.AutoStartRaid = p346
    StopTween(_G.AutoStartRaid)
end)
spawn(function()
	-- upvalues: (ref) vu6, (ref) vu7
    while wait() do
        pcall(function()
			-- upvalues: (ref) vu6, (ref) vu7
            if _G.AutoStartRaid and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")))) then
                if vu6 then
                    TP(CFrame.new(- 6438.73535, 250.645355, - 4501.50684))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "SetSpawnPoint"
                    }))
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif vu7 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                    TP(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.48217499e-8, - 0.378151238, 4.55503146e-9, 1, 1.07377559e-7, 0.378151238, 9.7681621e-8, - 0.925743818))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "SetSpawnPoint"
                    }))
                    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end)
    end
end)
v77.Raid:CreateToggle("Auto Buy Chip", {
    ["Title"] = "Auto Buy (Special) Microchip",
    ["Default"] = false
}):OnChanged(function(p347)
    _G.AutoBuyChip = p347
end)
spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if _G.AutoBuyChip and not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) and not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
            end
        end
    end)
end)
v77.Raid:CreateToggle("Raid", {
    ["Title"] = "Auto Next Islands",
    ["Default"] = false
}):OnChanged(function(p348)
    _G.AutoNextIsland = p348
    StopTween(_G.AutoNextIsland)
end)
spawn(function()
    pcall(function()
        while true do
            if not wait() then
                return
            end
            if _G.AutoNextIsland then
                local v349 = game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()
                local v350, v351, v352 = pairs(v349)
                while true do
                    local v353
                    v352, v353 = v350(v351, v352)
                    if v352 == nil then
                        break
                    end
                    if string.find(v353.Name, "Island") and (v353.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
                        TP(getNextIsland().CFrame * CFrame.new(0, 110, 0))
                        break
                    end
                end
            end
        end
    end)
end)
v77.Raid:CreateToggle("Killaura", {
    ["Title"] = "Kill Aura",
    ["Default"] = false
}):OnChanged(function(p354)
    getgenv().KillAurra = p354
end)
spawn(function()
    while wait() do
        if getgenv().KillAurra then
            pcall(function()
                local v355, v356, v357 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v358
                    v357, v358 = v355(v356, v357)
                    if v357 == nil then
                        break
                    end
                    if v358.Name and (v358:FindFirstChild("Humanoid") and (v358.Humanoid.Health > 0 and (v358.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 2500)) then
                        repeat
                            wait(1)
                            EquipWeapon(WeaponPickBall)
                            FarmPos = v358.HumanoidRootPart.CFrame
                            MonFarm = v358.Name
                            StartMagnet = true
                            TP(v358.HumanoidRootPart.CFrame * MethodFarm)
                        until not getgenv().KillAurra or (not v358.Parent or v358.Humanoid.Health == 0) or not game.Workspace.Enemies:FindFirstChild(v358.Name)
                        StartMagnet = false
                    end
                end
            end)
        end
    end
end)
v77.Raid:CreateToggle("Auto Awakener", {
    ["Title"] = "Auto Awakener",
    ["Default"] = false
}):OnChanged(function(p359)
    _G.AutoAwakener = p359
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoAwakener then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end
        end)
    end
end)
v77.Sea:CreateParagraph("Soon", {
    ["Title"] = "Note: Beta so there are still some errors, please understand",
    ["Content"] = "We will try to fix the existing errors."
})
game:GetService("Players")
game:GetService("RunService")
game:GetService("VirtualInputManager")
game:GetService("Workspace")
v77.Sea:CreateSection("Remove")
v77.Sea:CreateButton({
    ["Title"] = "Remove Fog",
    ["Callback"] = function()
        game:GetService("Lighting").LightingLayers:Destroy()
        game:GetService("Lighting").Sky:Destroy()
    end
})
v77.Sea:CreateButton({
    ["Title"] = "Remove Lava",
    ["Callback"] = function()
        local v360, v361, v362 = pairs(game.Workspace:GetDescendants())
        while true do
            local v363
            v362, v363 = v360(v361, v362)
            if v362 == nil then
                break
            end
            if v363.Name == "Lava" then
                v363:Destroy()
            end
        end
        local v364, v365, v366 = pairs(game.ReplicatedStorage:GetDescendants())
        while true do
            local v367
            v366, v367 = v364(v365, v366)
            if v366 == nil then
                break
            end
            if v367.Name == "Lava" then
                v367:Destroy()
            end
        end
    end
})
v77.Sea:CreateToggle("TikiBoat", {
    ["Title"] = "Teleport To Tiki",
    ["Default"] = false
}):OnChanged(function(p368)
    getgenv().TikiBpat = p368
    StopTween(getgenv().TikiBpat)
    task.spawn(function()
        while getgenv().TikiBpat do
            task.wait()
            TP(CFrame.new(- 16913.134765625, 9.053943634033203, 511.28265380859375))
        end
    end)
end)
v77.Sea:CreateSection("Prehistoric Islands")
v77.Sea:CreateButton({
    ["Title"] = "Craft Volcanic Magnet",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "CraftItem",
            "Craft",
            "Volcanic Magnet"
        }))
    end
})
v77.Sea:CreateToggle("TpDenDao", {
    ["Title"] = "Teleport To Prehistoric Island",
    ["Default"] = false
}):OnChanged(function(p369)
    getgenv().aobao = p369
    StopTween(getgenv().aobao)
end)
spawn(function()
    local v370 = nil
    while not v370 do
        v370 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        local v371 = getgenv().aobao and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        if v371 then
            local v372 = v371:FindFirstChild("Core")
            if v372 then
                v372 = v371.Core:FindFirstChild("PrehistoricRelic")
            end
            if v372 then
                v372 = v372:FindFirstChild("Skull")
            end
            if v372 then
                TP(CFrame.new(v372.Position))
                getgenv().aobao = false
            end
        end
    end
end)
v77.Sea:CreateToggle("FindMagma", {
    ["Title"] = "Auto Find Prehistoric Island",
    ["Description"] = "How To Use First Buy Boat And Sit On Boat Then Turn On This Toggle",
    ["Default"] = false
}):OnChanged(function(p373)
    getgenv().AutoFindPrehistoric = p373
    StopTween(getgenv().AutoFindPrehistoric)
end)
local vu374 = game:GetService("Players")
local v375 = game:GetService("RunService")
local vu376 = game:GetService("VirtualInputManager")
local vu377 = game:GetService("Workspace")
local vu378 = 362
local _ = game.Players.LocalPlayer
local vu379 = {}
game:GetService("RunService").RenderStepped:Connect(function()
	-- upvalues: (ref) vu379
    local v380, v381, v382 = pairs(vu379)
    while true do
        local v383
        v382, v383 = v380(v381, v382)
        if v382 == nil then
            break
        end
        if v383 and (v383.Parent and (v383.Name == "VehicleSeat" and not v383.Occupant)) then
            vu379[v382] = v383
        end
    end
end)
local vu384 = false
local vu385 = false
v375.RenderStepped:Connect(function()
	-- upvalues: (ref) vu385, (ref) vu374, (ref) vu384, (ref) vu379, (ref) vu377, (ref) vu378, (ref) vu376
    if getgenv().AutoFindPrehistoric then
        local v386 = vu374.LocalPlayer.Character
        if v386 and v386:FindFirstChild("Humanoid") then
            local function v391()
				-- upvalues: (ref) vu384, (ref) vu379
                if vu384 then
                    return
                end
                vu384 = true
                local v387, v388, v389 = pairs(vu379)
                while true do
                    local v390
                    v389, v390 = v387(v388, v389)
                    if v389 == nil then
                        break
                    end
                    if v390 and (v390.Parent and (v390.Name == "VehicleSeat" and not v390.Occupant)) then
                        TP(v390.CFrame)
                        break
                    end
                end
                vu384 = false
            end
            local v392 = v386.Humanoid
            local v393, v394, v395 = pairs(vu377.Boats:GetChildren())
            local v396 = false
            local v397 = nil
            while true do
                local v398
                v395, v398 = v393(v394, v395)
                if v395 == nil then
                    break
                end
                local v399 = v398:FindFirstChild("VehicleSeat")
                if v399 and v399.Occupant == v392 then
                    vu379[v398.Name] = v399
                    v397 = v399
                    v396 = true
                elseif v399 and v399.Occupant == nil then
                    v391()
                end
            end
            if v396 then
                v397.MaxSpeed = vu378
                v397.CFrame = CFrame.new(Vector3.new(v397.Position.X, v397.Position.Y, v397.Position.Z)) * v397.CFrame.Rotation
                vu376:SendKeyEvent(true, "W", false, game)
                local v400, v401, v402 = pairs(vu377.Boats:GetDescendants())
                while true do
                    local v403
                    v402, v403 = v400(v401, v402)
                    if v402 == nil then
                        break
                    end
                    if v403:IsA("BasePart") then
                        v403.CanCollide = false
                    end
                end
                local v404, v405, v406 = pairs(v386:GetDescendants())
                while true do
                    local v407
                    v406, v407 = v404(v405, v406)
                    if v406 == nil then
                        break
                    end
                    if v407:IsA("BasePart") then
                        v407.CanCollide = false
                    end
                end
                local v408, v409, v410 = ipairs({
                    "ShipwreckIsland",
                    "SandIsland",
                    "TreeIsland",
                    "TinyIsland",
                    "MysticIsland",
                    "KitsuneIsland",
                    "FrozenDimension"
                })
                while true do
                    local v411
                    v410, v411 = v408(v409, v410)
                    if v410 == nil then
                        break
                    end
                    local v412 = vu377.Map:FindFirstChild(v411)
                    if v412 and v412:IsA("Model") then
                        v412:Destroy()
                    end
                end
                if vu377.Map:FindFirstChild("PrehistoricIsland") then
                    vu376:SendKeyEvent(false, "W", false, game)
                    getgenv().AutoFindPrehistoric = false
                    if not vu385 then
                        vu385 = true
                    end
                end
            else
                return
            end
        else
            return
        end
    else
        vu385 = false
        return
    end
end)
v77.Sea:CreateToggle("Volcano", {
    ["Title"] = "Auto Patch Volcano Core",
    ["Default"] = false
}):OnChanged(function(p413)
    getgenv().VolcanoPacth = p413
    StopTween(getgenv().VolcanoPacth)
end)
local function vu415(p414)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, p414, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, p414, false, game)
end
local function vu431()
    local v416 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if v416 and v416:IsA("Model") then
        v416:Destroy()
    end
    local v417 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v417 then
        local v418, v419, v420 = pairs(v417:GetDescendants())
        while true do
            local v421
            v420, v421 = v418(v419, v420)
            if v420 == nil then
                break
            end
            if v421:IsA("Part") and v421.Name:lower():find("lava") then
                v421:Destroy()
            end
        end
    end
    local v422 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v422 then
        local v423, v424, v425 = pairs(v422:GetDescendants())
        while true do
            local v426
            v425, v426 = v423(v424, v425)
            if v425 == nil then
                break
            end
            if v426:IsA("Model") then
                local v427, v428, v429 = pairs(v426:GetDescendants())
                while true do
                    local v430
                    v429, v430 = v427(v428, v429)
                    if v429 == nil then
                        break
                    end
                    if v430:IsA("MeshPart") and v430.Name:lower():find("lava") then
                        v430:Destroy()
                    end
                end
            end
        end
    end
end
local function vu439()
    local v432 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    local v433, v434, v435 = pairs(v432:GetChildren())
    while true do
        local v436
        v435, v436 = v433(v434, v435)
        if v435 == nil then
            break
        end
        if v436:IsA("Model") then
            local v437 = v436:FindFirstChild("volcanorock")
            if v437 and v437:IsA("MeshPart") then
                local v438 = v437.Color
                if v438 == Color3.fromRGB(185, 53, 56) or v438 == Color3.fromRGB(185, 53, 57) then
                    return v437
                end
            end
        end
    end
    return nil
end
local function vu451(p440)
	-- upvalues: (ref) vu415
    local v441 = game.Players.LocalPlayer
    local v442 = v441.Backpack
    local v443, v444, v445 = pairs(v442:GetChildren())
    while true do
        local v446
        v445, v446 = v443(v444, v445)
        if v445 == nil then
            break
        end
        if v446:IsA("Tool") and v446.ToolTip == p440 then
            v446.Parent = v441.Character
            local v447, v448, v449 = ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            })
            while true do
                local vu450
                v449, vu450 = v447(v448, v449)
                if v449 == nil then
                    break
                end
                wait()
                pcall(function()
					-- upvalues: (ref) vu415, (ref) vu450
                    vu415(vu450)
                end)
            end
            v446.Parent = v442
            break
        end
    end
end
spawn(function()
	-- upvalues: (ref) vu431, (ref) vu439, (ref) vu451
    while wait() do
        if getgenv().VolcanoPacth then
            pcall(vu431)
            local v452 = vu439()
            if v452 then
                local v453 = CFrame.new(v452.Position)
                TP(v453)
                local v454 = v452.Color
                if v454 == Color3.fromRGB(185, 53, 56) or v454 == Color3.fromRGB(185, 53, 57) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v452.Position).Magnitude <= 1 then
                        if _G.UseMelee then
                            vu451("Melee")
                        end
                        if _G.UseSword then
                            vu451("Sword")
                        end
                        if _G.UseGun then
                            vu451("Gun")
                        end
                    end
                    getgenv().aobao = false
                else
                    vu439()
                end
            else
                getgenv().aobao = true
            end
        end
    end
end)
v77.Sea:CreateToggle("LavaGolem", {
    ["Title"] = "Auto Kill Lava Golem",
    ["Default"] = false
}):OnChanged(function(p455)
    getgenv().KillGolem = p455
    StopTween(getgenv().KillGolem)
end)
spawn(function()
	-- upvalues: (ref) vu7
    while wait() do
        if getgenv().KillGolem and vu7 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Lava Golem") then
                    local v456, v457, v458 = pairs(enemies:GetChildren())
                    while true do
                        local v459
                        v458, v459 = v456(v457, v458)
                        if v458 == nil then
                            break
                        end
                        if v459.Name == "Lava Golem" and (v459:FindFirstChild("Humanoid") and (v459:FindFirstChild("HumanoidRootPart") and v459.Humanoid.Health > 0)) then
                            repeat
                                task.wait()
                                EquipWeapon(WeaponPickBall)
                                FarmPos = v459.HumanoidRootPart.CFrame
                                MonFarm = v459.Name
                                v459.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                TP(v459.HumanoidRootPart.CFrame * MethodFarm)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not getgenv().KillGolem or (not v459.Parent or v459.Humanoid.Health <= 0)
                        end
                    end
                else
                    UnEquipWeapon(WeaponPickBall)
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem") then
                        TP(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)
v77.Sea:CreateToggle("KillAurra", {
    ["Title"] = "Kill Aura",
    ["Description"] = "khuy\225\186\191n c\195\161o kh\195\180ng n\195\170n d\195\185ng trong raid ho\225\186\183c \196\145\225\186\163o n\195\186i l\225\187\173a:)",
    ["Default"] = false
}):OnChanged(function(p460)
    getgenv().Killaura = p460
end)
spawn(function()
    while wait() do
        if getgenv().Killaura then
            local v461, v462, v463 = pairs(game.Workspace.Enemies:GetDescendants())
            while true do
                local vu464
                v463, vu464 = v461(v462, v463)
                if v463 == nil then
                    break
                end
                if vu464:FindFirstChild("Humanoid") and (vu464:FindFirstChild("HumanoidRootPart") and vu464.Humanoid.Health > 0) then
                    pcall(function()
						-- upvalues: (ref) vu464
                        repeat
                            wait()
                            vu464.Humanoid.Health = 0
                            vu464.HumanoidRootPart.CanCollide = false
                            vu464.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            vu464.HumanoidRootPart.Transparency = 1
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not getgenv().Killaura or (not vu464.Parent or vu464.Humanoid.Health <= 0)
                    end)
                end
            end
        end
    end
end)
v77.Sea:CreateSection("Collect Items")
v77.Sea:CreateToggle("Collect", {
    ["Title"] = "Collect Dino Bone",
    ["Default"] = false
}):OnChanged(function(p465)
    getgenv().CollBone = p465
    StopTween(getgenv().CollBone)
end)
spawn(function()
	-- upvalues: (ref) vu3
    while wait() do
        if getgenv().CollBone then
            local v466 = vu3
            local v467, v468, v469 = pairs(v466:GetDescendants())
            while true do
                local v470
                v469, v470 = v467(v468, v469)
                if v469 == nil then
                    break
                end
                if v470:IsA("BasePart") and v470.Name == "DinoBone" then
                    TP(CFrame.new(v470.Position))
                end
            end
        end
    end
end)
v77.Sea:CreateToggle("DragonEgg", {
    ["Title"] = "Collect Dragon Egg",
    ["Default"] = false
}):OnChanged(function(p471)
    getgenv().dragonEggs = p471
    StopTween(getgenv().dragonEggs)
end)
spawn(function()
	-- upvalues: (ref) vu3
    while wait() do
        if getgenv().dragonEggs then
            local v472 = vu3.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
            if # v472 > 0 then
                local v473 = v472[math.random(1, # v472)]
                if v473:IsA("Model") and v473.PrimaryPart then
                    TP(v473.PrimaryPart.CFrame)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v473.PrimaryPart.Position).Magnitude <= 1 then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                end
            end
        end
    end
end)
v77.Sea:CreateSection("Settings")
v77.Sea:CreateToggle("UseSkillMelee", {
    ["Title"] = "Use Melee",
    ["Default"] = true
}):OnChanged(function(p474)
    _G.UseMelee = p474
end)
local v475 = v77.Sea:CreateToggle("UseSword", {
    ["Title"] = "Use Sword",
    ["Default"] = true
})
local v476 = v77.Sea:CreateToggle("UseGun", {
    ["Title"] = "Use Gun",
    ["Default"] = false
})
v475:OnChanged(function(p477)
    _G.UseSword = p477
end)
v476:OnChanged(function(p478)
    _G.UseGun = p478
end)
v74:SetLibrary(v73)
v75:SetLibrary(v73)
v74:IgnoreThemeSettings()
v74:SetIgnoreIndexes({})
v75:SetFolder("Volcano/Hub")
v74:SetFolder("Volcano/Hub")
v75:BuildInterfaceSection(v77.Up)
v74:BuildConfigSection(v77.Up)
local v479 = vu76
vu76.SelectTab(v479, 1)