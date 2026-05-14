local r0_1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))
r0_1 = r0_1()
local r1_1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))
r1_1 = r1_1()
local r2_1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))
r2_1 = r2_1()
local r6_1 = r0_1:CreateWindow(330.0)
local r3_1 = r0_1:CreateWindow(r0_1, {
  Title = "Annie Hub",
  SubTitle = "By Mars",
  TabWidth = 160.0,
  Size = r6_1,
  Acrylic = true,
  Theme = "Light",
  MinimizeKey = Enum.KeyCode.RightControl,
})
local r5_1 = r3_1:AddTab({Title = "Main", Icon = "home"})
r5_1 = r3_1:AddTab({Title = "Setting", Icon = "settings-2"})
r5_1 = r3_1:AddTab({Title = "Stats", Icon = "plus-circle"})
r5_1 = r3_1:AddTab({Title = "Player", Icon = "baby"})
r5_1 = r3_1:AddTab({Title = "Teleport", Icon = "palmtree"})
r5_1 = r3_1:AddTab({Title = "Devil Fruit", Icon = "cherry"})
r5_1 = r3_1:AddTab({Title = "Dungeon", Icon = "swords"})
r5_1 = r3_1:AddTab({Title = "Race V4", Icon = "chevrons-right"})
r5_1 = r3_1:AddTab({Title = "Shop", Icon = "shopping-cart"})
r5_1 = r3_1:AddTab({Title = "Misc", Icon = "arrow-down-circle"})
r3_1:SelectTab(1.0)
end
wait()
if not game.Players then
end
wait()
if not game.Players.LocalPlayer then
end
wait()
if not game.ReplicatedStorage then
end
wait()
local r7_1 = game.ReplicatedStorage:FindFirstChild("Remotes")
if not r7_1 then
end
wait()
r7_1 = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
if not r7_1 then
end
wait()
r7_1 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")
if not r7_1 then
end
wait()
r7_1 = game:GetService("Players")
if not r7_1 then
end
wait()
r7_1 = game:GetService("Players")
r7_1 = r7_1.LocalPlayer.Character:FindFirstChild("Energy")
if not r7_1 then
  wait(0.1)
  r7_1 = game:IsLoaded()
  if r7_1 then
  end
  game.Loaded:Wait()
  r7_1 = game:IsLoaded()
  if not r7_1 then
  end
  r7_1 = game:GetService("Players")
  r7_1 = r7_1.LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")
  if not r7_1 then
  end
end
wait()
r7_1 = game:GetService("Players")
r7_1 = r7_1.LocalPlayer.PlayerGui:WaitForChild("Main")
if r7_1.ChooseTeam.Visible == true then
  if _G.Team == "Pirate" then
    local r9_1 = game:GetService("Players")
    local r7_1, r8_1, r9_1 = pairs(getconnections(r9_1.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated))
    "Players".Function()
    for r10_1, r11_1 in r7_1 do
    end
    if _G.Team == "Marine" then
      r9_1 = game:GetService("Players")
      local r7_1, r8_1, r9_1 = pairs(getconnections(r9_1.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated))
      "Players".Function()
      for r10_1, r11_1 in r7_1 do
      end
      r9_1 = game:GetService("Players")
      local r7_1, r8_1, r9_1 = pairs(getconnections(r9_1.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated))
      "Players".Function()
      for r10_1, r11_1 in r7_1 do
      end
      if game.Players.LocalPlayer.Team ~= nil then
        r7_1 = game:IsLoaded()
        if not r7_1 then
        end
        First_Sea = false
        Second_Sea = false
        Third_Sea = false
        if game.PlaceId == 2753915549.0 then
          First_Sea = true
        end
        if game.PlaceId == 4442272183.0 then
          Second_Sea = true
        end
        if game.PlaceId == 7449423635.0 then
          Third_Sea = true
        end
        function CheckLevel()
          -- line: [0.0, 0.0] id: 151
          local r0_151 = game:GetService("Players")
          if not First_Sea then
            if r0_151.LocalPlayer.Data.Level.Value ~= 1.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 9.0 then
                if SelectMonster ~= "Bandit" then
                  if SelectArea == "Jungle" then
                  end
                end
              end
              Ms = "Bandit"
              NameQuest = "BanditQuest1"
              QuestLv = 1.0
              NameMon = "Bandit"
              local r1_151 = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
              CFrameQ = r1_151
              r1_151 = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 10.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 14.0 then
                if SelectMonster ~= "Monkey" then
                  if SelectArea == "Jungle" then
                  end
                end
              end
              Ms = "Monkey"
              NameQuest = "JungleQuest"
              QuestLv = 1.0
              NameMon = "Monkey"
              r1_151 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 15.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 29.0 then
                if SelectMonster ~= "Gorilla" then
                  if SelectArea == "Jungle" then
                  end
                end
              end
              Ms = "Gorilla"
              NameQuest = "JungleQuest"
              QuestLv = 2.0
              NameMon = "Gorilla"
              r1_151 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 30.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 39.0 then
                if SelectMonster ~= "Pirate" then
                  if SelectArea == "Buggy" then
                  end
                end
              end
              Ms = "Pirate"
              NameQuest = "BuggyQuest1"
              QuestLv = 1.0
              NameMon = "Pirate"
              r1_151 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 40.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 59.0 then
                if SelectMonster ~= "Brute" then
                  if SelectArea == "Buggy" then
                  end
                end
              end
              Ms = "Brute"
              NameQuest = "BuggyQuest1"
              QuestLv = 2.0
              NameMon = "Brute"
              r1_151 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 60.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 74.0 then
                if SelectMonster ~= "Desert Bandit" then
                  if SelectArea == "Desert" then
                  end
                end
              end
              Ms = "Desert Bandit"
              NameQuest = "DesertQuest"
              QuestLv = 1.0
              NameMon = "Desert Bandit"
              r1_151 = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
              CFrameQ = r1_151
              r1_151 = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 75.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 89.0 then
                if SelectMonster ~= "Desert Officer" then
                  if SelectArea == "Desert" then
                  end
                end
              end
              Ms = "Desert Officer"
              NameQuest = "DesertQuest"
              QuestLv = 2.0
              NameMon = "Desert Officer"
              r1_151 = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
              CFrameQ = r1_151
              r1_151 = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 90.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 99.0 then
                if SelectMonster ~= "Snow Bandit" then
                  if SelectArea == "Snow" then
                  end
                end
              end
              Ms = "Snow Bandit"
              NameQuest = "SnowQuest"
              QuestLv = 1.0
              NameMon = "Snow Bandit"
              r1_151 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
              CFrameQ = r1_151
              r1_151 = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 100.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 119.0 then
                if SelectMonster ~= "Snowman" then
                  if SelectArea == "Snow" then
                  end
                end
              end
              Ms = "Snowman"
              NameQuest = "SnowQuest"
              QuestLv = 2.0
              NameMon = "Snowman"
              r1_151 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
              CFrameQ = r1_151
              r1_151 = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 120.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 149.0 then
                if SelectMonster ~= "Chief Petty Officer" then
                  if SelectArea == "Marine" then
                  end
                end
              end
              Ms = "Chief Petty Officer"
              NameQuest = "MarineQuest2"
              QuestLv = 1.0
              NameMon = "Chief Petty Officer"
              r1_151 = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 150.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 174.0 then
                if SelectMonster ~= "Sky Bandit" then
                  if SelectArea == "Sky" then
                  end
                end
              end
              Ms = "Sky Bandit"
              NameQuest = "SkyQuest"
              QuestLv = 1.0
              NameMon = "Sky Bandit"
              r1_151 = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 175.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 189.0 then
                if SelectMonster ~= "Dark Master" then
                  if SelectArea == "Sky" then
                  end
                end
              end
              Ms = "Dark Master"
              NameQuest = "SkyQuest"
              QuestLv = 2.0
              NameMon = "Dark Master"
              r1_151 = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 190.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 209.0 then
                if SelectMonster ~= "Prisoner" then
                  if SelectArea == "Prison" then
                  end
                end
              end
              Ms = "Prisoner"
              NameQuest = "PrisonerQuest"
              QuestLv = 1.0
              NameMon = "Prisoner"
              r1_151 = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1.0, 0, -0.999846935, 0, 0.0175017118)
              CFrameQ = r1_151
              r1_151 = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1.0, 0, 0.719348073, 0, 0.694649816)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 210.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 249.0 then
                if SelectMonster ~= "Dangerous Prisoner" then
                  if SelectArea == "Prison" then
                  end
                end
              end
              Ms = "Dangerous Prisoner"
              NameQuest = "PrisonerQuest"
              QuestLv = 2.0
              NameMon = "Dangerous Prisoner"
              r1_151 = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1.0, 0, -0.999846935, 0, 0.0175017118)
              CFrameQ = r1_151
              r1_151 = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1.0, 0, 0.438139856, 0, 0.898906827)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 250.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 274.0 then
                if SelectMonster ~= "Toga Warrior" then
                  if SelectArea == "Colosseum" then
                  end
                end
              end
              Ms = "Toga Warrior"
              NameQuest = "ColosseumQuest"
              QuestLv = 1.0
              NameMon = "Toga Warrior"
              r1_151 = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 275.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 299.0 then
                if SelectMonster ~= "Gladiator" then
                  if SelectArea == "Colosseum" then
                  end
                end
              end
              Ms = "Gladiator"
              NameQuest = "ColosseumQuest"
              QuestLv = 2.0
              NameMon = "Gladiator"
              r1_151 = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 300.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 324.0 then
                if SelectMonster ~= "Military Soldier" then
                  if SelectArea == "Magma" then
                  end
                end
              end
              Ms = "Military Soldier"
              NameQuest = "MagmaQuest"
              QuestLv = 1.0
              NameMon = "Military Soldier"
              r1_151 = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 325.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 374.0 then
                if SelectMonster ~= "Military Spy" then
                  if SelectArea == "Magma" then
                  end
                end
              end
              Ms = "Military Spy"
              NameQuest = "MagmaQuest"
              QuestLv = 2.0
              NameMon = "Military Spy"
              r1_151 = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1.0, 0, 0.544762194, 0, 0.838590562)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 375.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 399.0 then
                if SelectMonster ~= "Fishman Warrior" then
                  if SelectArea == "Fishman" then
                  end
                end
              end
              Ms = "Fishman Warrior"
              NameQuest = "FishmanQuest"
              QuestLv = 1.0
              NameMon = "Fishman Warrior"
              r1_151 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
              CFrameQ = r1_151
              r1_151 = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
              CFrameMon = r1_151
              if not Auto_Farm then
                if 3000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                  r1_151 = game:GetService("ReplicatedStorage")
                  r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                end
                if r0_151.LocalPlayer.Data.Level.Value ~= 400.0 then
                  if r0_151.LocalPlayer.Data.Level.Value > 449.0 then
                    if SelectMonster ~= "Fishman Commando" then
                      if SelectArea == "Fishman" then
                      end
                    end
                  end
                  Ms = "Fishman Commando"
                  NameQuest = "FishmanQuest"
                  QuestLv = 2.0
                  NameMon = "Fishman Commando"
                  r1_151 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                  CFrameQ = r1_151
                  r1_151 = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
                  CFrameMon = r1_151
                  if not Auto_Farm then
                    if 3000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                      r1_151 = game:GetService("ReplicatedStorage")
                      r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                    end
                    if r0_151.LocalPlayer.Data.Level.Value ~= 450.0 then
                      if r0_151.LocalPlayer.Data.Level.Value > 474.0 then
                        if SelectMonster ~= "God's Guard" then
                          if SelectArea == "Sky Island" then
                          end
                        end
                      end
                      Ms = "God's Guard"
                      NameQuest = "SkyExp1Quest"
                      QuestLv = 1.0
                      NameMon = "God's Guard"
                      r1_151 = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
                      CFrameQ = r1_151
                      r1_151 = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
                      CFrameMon = r1_151
                      if not Auto_Farm then
                        if 3000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                          r1_151 = game:GetService("ReplicatedStorage")
                          r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                        end
                        if r0_151.LocalPlayer.Data.Level.Value ~= 475.0 then
                          if r0_151.LocalPlayer.Data.Level.Value > 524.0 then
                            if SelectMonster ~= "Shanda" then
                              if SelectArea == "Sky Island" then
                              end
                            end
                          end
                          Ms = "Shanda"
                          NameQuest = "SkyExp1Quest"
                          QuestLv = 2.0
                          NameMon = "Shanda"
                          r1_151 = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
                          CFrameQ = r1_151
                          r1_151 = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
                          CFrameMon = r1_151
                          if not Auto_Farm then
                            if 3000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                              r1_151 = game:GetService("ReplicatedStorage")
                              r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                            end
                            if r0_151.LocalPlayer.Data.Level.Value ~= 525.0 then
                              if r0_151.LocalPlayer.Data.Level.Value > 549.0 then
                                if SelectMonster ~= "Royal Squad" then
                                  if SelectArea == "Sky Island" then
                                  end
                                end
                              end
                              Ms = "Royal Squad"
                              NameQuest = "SkyExp2Quest"
                              QuestLv = 1.0
                              NameMon = "Royal Squad"
                              r1_151 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                              CFrameQ = r1_151
                              r1_151 = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
                              CFrameMon = r1_151
                            end
                            if r0_151.LocalPlayer.Data.Level.Value ~= 550.0 then
                              if r0_151.LocalPlayer.Data.Level.Value > 624.0 then
                                if SelectMonster ~= "Royal Soldier" then
                                  if SelectArea == "Sky Island" then
                                  end
                                end
                              end
                              Ms = "Royal Soldier"
                              NameQuest = "SkyExp2Quest"
                              QuestLv = 2.0
                              NameMon = "Royal Soldier"
                              r1_151 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                              CFrameQ = r1_151
                              r1_151 = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
                              CFrameMon = r1_151
                            end
                            if r0_151.LocalPlayer.Data.Level.Value ~= 625.0 then
                              if r0_151.LocalPlayer.Data.Level.Value > 649.0 then
                                if SelectMonster ~= "Galley Pirate" then
                                  if SelectArea == "Fountain" then
                                  end
                                end
                              end
                              Ms = "Galley Pirate"
                              NameQuest = "FountainQuest"
                              QuestLv = 1.0
                              NameMon = "Galley Pirate"
                              r1_151 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                              CFrameQ = r1_151
                              r1_151 = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
                              CFrameMon = r1_151
                            end
                            if 650.0 > r0_151.LocalPlayer.Data.Level.Value then
                              if SelectMonster ~= "Galley Captain" then
                                if SelectArea == "Fountain" then
                                end
                              end
                              Ms = "Galley Captain"
                              NameQuest = "FountainQuest"
                              QuestLv = 2.0
                              NameMon = "Galley Captain"
                              r1_151 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                              CFrameQ = r1_151
                              r1_151 = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
                              CFrameMon = r1_151
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          if not Second_Sea then
            if r0_151.LocalPlayer.Data.Level.Value ~= 700.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 724.0 then
                if SelectMonster ~= "Raider" then
                  if SelectArea == "Area 1" then
                  end
                end
              end
              Ms = "Raider"
              NameQuest = "Area1Quest"
              QuestLv = 1.0
              NameMon = "Raider"
              r1_151 = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
              CFrameQ = r1_151
              r1_151 = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 725.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 774.0 then
                if SelectMonster ~= "Mercenary" then
                  if SelectArea == "Area 1" then
                  end
                end
              end
              Ms = "Mercenary"
              NameQuest = "Area1Quest"
              QuestLv = 2.0
              NameMon = "Mercenary"
              r1_151 = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 775.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 799.0 then
                if SelectMonster ~= "Swan Pirate" then
                  if SelectArea == "Area 2" then
                  end
                end
              end
              Ms = "Swan Pirate"
              NameQuest = "Area2Quest"
              QuestLv = 1.0
              NameMon = "Swan Pirate"
              r1_151 = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
              CFrameQ = r1_151
              r1_151 = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 800.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 874.0 then
                if SelectMonster ~= "Factory Staff" then
                  if SelectArea == "Area 2" then
                  end
                end
              end
              Ms = "Factory Staff"
              NameQuest = "Area2Quest"
              QuestLv = 2.0
              NameMon = "Factory Staff"
              r1_151 = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
              CFrameQ = r1_151
              r1_151 = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 875.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 899.0 then
                if SelectMonster ~= "Marine Lieutenan" then
                  if SelectArea == "Marine" then
                  end
                end
              end
              Ms = "Marine Lieutenant"
              NameQuest = "MarineQuest3"
              QuestLv = 1.0
              NameMon = "Marine Lieutenant"
              r1_151 = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 900.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 949.0 then
                if SelectMonster ~= "Marine Captain" then
                  if SelectArea == "Marine" then
                  end
                end
              end
              Ms = "Marine Captain"
              NameQuest = "MarineQuest3"
              QuestLv = 2.0
              NameMon = "Marine Captain"
              r1_151 = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 950.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 974.0 then
                if SelectMonster ~= "Zombie" then
                  if SelectArea == "Zombie" then
                  end
                end
              end
              Ms = "Zombie"
              NameQuest = "ZombieQuest"
              QuestLv = 1.0
              NameMon = "Zombie"
              r1_151 = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 975.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 999.0 then
                if SelectMonster ~= "Vampire" then
                  if SelectArea == "Zombie" then
                  end
                end
              end
              Ms = "Vampire"
              NameQuest = "ZombieQuest"
              QuestLv = 2.0
              NameMon = "Vampire"
              r1_151 = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1000.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1049.0 then
                if SelectMonster ~= "Snow Trooper" then
                  if SelectArea == "Snow Mountain" then
                  end
                end
              end
              Ms = "Snow Trooper"
              NameQuest = "SnowMountainQuest"
              QuestLv = 1.0
              NameMon = "Snow Trooper"
              r1_151 = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
              CFrameQ = r1_151
              r1_151 = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1050.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1099.0 then
                if SelectMonster ~= "Winter Warrior" then
                  if SelectArea == "Snow Mountain" then
                  end
                end
              end
              Ms = "Winter Warrior"
              NameQuest = "SnowMountainQuest"
              QuestLv = 2.0
              NameMon = "Winter Warrior"
              r1_151 = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
              CFrameQ = r1_151
              r1_151 = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1100.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1124.0 then
                if SelectMonster ~= "Lab Subordinate" then
                  if SelectArea == "Ice Fire" then
                  end
                end
              end
              Ms = "Lab Subordinate"
              NameQuest = "IceSideQuest"
              QuestLv = 1.0
              NameMon = "Lab Subordinate"
              r1_151 = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1125.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1174.0 then
                if SelectMonster ~= "Horned Warrior" then
                  if SelectArea == "Ice Fire" then
                  end
                end
              end
              Ms = "Horned Warrior"
              NameQuest = "IceSideQuest"
              QuestLv = 2.0
              NameMon = "Horned Warrior"
              r1_151 = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1175.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1199.0 then
                if SelectMonster ~= "Magma Ninja" then
                  if SelectArea == "Ice Fire" then
                  end
                end
              end
              Ms = "Magma Ninja"
              NameQuest = "FireSideQuest"
              QuestLv = 1.0
              NameMon = "Magma Ninja"
              r1_151 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1200.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1249.0 then
                if SelectMonster ~= "Lava Pirate" then
                  if SelectArea == "Ice Fire" then
                  end
                end
              end
              Ms = "Lava Pirate"
              NameQuest = "FireSideQuest"
              QuestLv = 2.0
              NameMon = "Lava Pirate"
              r1_151 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1250.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1274.0 then
                if SelectMonster ~= "Ship Deckhand" then
                  if SelectArea == "Ship" then
                  end
                end
              end
              Ms = "Ship Deckhand"
              NameQuest = "ShipQuest1"
              QuestLv = 1.0
              NameMon = "Ship Deckhand"
              r1_151 = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
              CFrameQ = r1_151
              r1_151 = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
              CFrameMon = r1_151
              if not Auto_Farm then
                if 20000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                  r1_151 = game:GetService("ReplicatedStorage")
                  r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                end
                if r0_151.LocalPlayer.Data.Level.Value ~= 1275.0 then
                  if r0_151.LocalPlayer.Data.Level.Value > 1299.0 then
                    if SelectMonster ~= "Ship Engineer" then
                      if SelectArea == "Ship" then
                      end
                    end
                  end
                  Ms = "Ship Engineer"
                  NameQuest = "ShipQuest1"
                  QuestLv = 2.0
                  NameMon = "Ship Engineer"
                  r1_151 = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
                  CFrameQ = r1_151
                  r1_151 = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
                  CFrameMon = r1_151
                  if not Auto_Farm then
                    if 20000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                      r1_151 = game:GetService("ReplicatedStorage")
                      r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                    end
                    if r0_151.LocalPlayer.Data.Level.Value ~= 1300.0 then
                      if r0_151.LocalPlayer.Data.Level.Value > 1324.0 then
                        if SelectMonster ~= "Ship Steward" then
                          if SelectArea == "Ship" then
                          end
                        end
                      end
                      Ms = "Ship Steward"
                      NameQuest = "ShipQuest2"
                      QuestLv = 1.0
                      NameMon = "Ship Steward"
                      r1_151 = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
                      CFrameQ = r1_151
                      r1_151 = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
                      CFrameMon = r1_151
                      if not Auto_Farm then
                        if 20000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                          r1_151 = game:GetService("ReplicatedStorage")
                          r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                        end
                        if r0_151.LocalPlayer.Data.Level.Value ~= 1325.0 then
                          if r0_151.LocalPlayer.Data.Level.Value > 1349.0 then
                            if SelectMonster ~= "Ship Officer" then
                              if SelectArea == "Ship" then
                              end
                            end
                          end
                          Ms = "Ship Officer"
                          NameQuest = "ShipQuest2"
                          QuestLv = 2.0
                          NameMon = "Ship Officer"
                          r1_151 = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
                          CFrameQ = r1_151
                          r1_151 = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
                          CFrameMon = r1_151
                          if not Auto_Farm then
                            if 20000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                              r1_151 = game:GetService("ReplicatedStorage")
                              r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                            end
                            if r0_151.LocalPlayer.Data.Level.Value ~= 1350.0 then
                              if r0_151.LocalPlayer.Data.Level.Value > 1374.0 then
                                if SelectMonster ~= "Arctic Warrior" then
                                  if SelectArea == "Frost" then
                                  end
                                end
                              end
                              Ms = "Arctic Warrior"
                              NameQuest = "FrostQuest"
                              QuestLv = 1.0
                              NameMon = "Arctic Warrior"
                              r1_151 = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
                              CFrameQ = r1_151
                              r1_151 = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
                              CFrameMon = r1_151
                              if not Auto_Farm then
                                if 20000.0 < CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
                                  r1_151 = game:GetService("ReplicatedStorage")
                                  r1_151.Remotes.CommF_:InvokeServer(r1_151.Remotes.CommF_)
                                end
                                if r0_151.LocalPlayer.Data.Level.Value ~= 1375.0 then
                                  if r0_151.LocalPlayer.Data.Level.Value > 1424.0 then
                                    if SelectMonster ~= "Snow Lurker" then
                                      if SelectArea == "Frost" then
                                      end
                                    end
                                  end
                                  Ms = "Snow Lurker"
                                  NameQuest = "FrostQuest"
                                  QuestLv = 2.0
                                  NameMon = "Snow Lurker"
                                  r1_151 = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
                                  CFrameQ = r1_151
                                  r1_151 = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
                                  CFrameMon = r1_151
                                end
                                if r0_151.LocalPlayer.Data.Level.Value ~= 1425.0 then
                                  if r0_151.LocalPlayer.Data.Level.Value > 1449.0 then
                                    if SelectMonster ~= "Sea Soldier" then
                                      if SelectArea == "Forgotten" then
                                      end
                                    end
                                  end
                                  Ms = "Sea Soldier"
                                  NameQuest = "ForgottenQuest"
                                  QuestLv = 1.0
                                  NameMon = "Sea Soldier"
                                  r1_151 = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
                                  CFrameQ = r1_151
                                  r1_151 = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
                                  CFrameMon = r1_151
                                end
                                if 1450.0 > r0_151.LocalPlayer.Data.Level.Value then
                                  if SelectMonster ~= "Water Fighter" then
                                    if SelectArea == "Forgotten" then
                                    end
                                  end
                                  Ms = "Water Fighter"
                                  NameQuest = "ForgottenQuest"
                                  QuestLv = 2.0
                                  NameMon = "Water Fighter"
                                  r1_151 = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
                                  CFrameQ = r1_151
                                  r1_151 = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
                                  CFrameMon = r1_151
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          if not Third_Sea then
            if r0_151.LocalPlayer.Data.Level.Value ~= 1500.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1524.0 then
                if SelectMonster ~= "Pirate Millionaire" then
                  if SelectArea == "Pirate Port" then
                  end
                end
              end
              Ms = "Pirate Millionaire"
              NameQuest = "PiratePortQuest"
              QuestLv = 1.0
              NameMon = "Pirate Millionaire"
              r1_151 = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1525.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1574.0 then
                if SelectMonster ~= "Pistol Billionaire" then
                  if SelectArea == "Pirate Port" then
                  end
                end
              end
              Ms = "Pistol Billionaire"
              NameQuest = "PiratePortQuest"
              QuestLv = 2.0
              NameMon = "Pistol Billionaire"
              r1_151 = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1575.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1599.0 then
                if SelectMonster ~= "Dragon Crew Warrior" then
                  if SelectArea == "Amazon" then
                  end
                end
              end
              Ms = "Dragon Crew Warrior"
              NameQuest = "AmazonQuest"
              QuestLv = 1.0
              NameMon = "Dragon Crew Warrior"
              r1_151 = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
              CFrameQ = r1_151
              r1_151 = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1600.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1624.0 then
                if SelectMonster ~= "Dragon Crew Archer" then
                  if SelectArea == "Amazon" then
                  end
                end
              end
              Ms = "Dragon Crew Archer"
              NameQuest = "AmazonQuest"
              QuestLv = 2.0
              NameMon = "Dragon Crew Archer"
              r1_151 = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
              CFrameQ = r1_151
              r1_151 = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1625.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1649.0 then
                if SelectMonster ~= "Female Islander" then
                  if SelectArea == "Amazon" then
                  end
                end
              end
              Ms = "Female Islander"
              NameQuest = "AmazonQuest2"
              QuestLv = 1.0
              NameMon = "Female Islander"
              r1_151 = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
              CFrameQ = r1_151
              r1_151 = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1650.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1699.0 then
                if SelectMonster ~= "Giant Islander" then
                  if SelectArea == "Amazon" then
                  end
                end
              end
              Ms = "Giant Islander"
              NameQuest = "AmazonQuest2"
              QuestLv = 2.0
              NameMon = "Giant Islander"
              r1_151 = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
              CFrameQ = r1_151
              r1_151 = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1700.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1724.0 then
                if SelectMonster ~= "Marine Commodore" then
                  if SelectArea == "Marine Tree" then
                  end
                end
              end
              Ms = "Marine Commodore"
              NameQuest = "MarineTreeIsland"
              QuestLv = 1.0
              NameMon = "Marine Commodore"
              r1_151 = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
              CFrameQ = r1_151
              r1_151 = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1725.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1774.0 then
                if SelectMonster ~= "Marine Rear Admiral" then
                  if SelectArea == "Marine Tree" then
                  end
                end
              end
              Ms = "Marine Rear Admiral"
              NameQuest = "MarineTreeIsland"
              QuestLv = 2.0
              NameMon = "Marine Rear Admiral"
              r1_151 = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
              CFrameQ = r1_151
              r1_151 = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1775.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1799.0 then
                if SelectMonster ~= "Fishman Raider" then
                  if SelectArea == "Deep Forest" then
                  end
                end
              end
              Ms = "Fishman Raider"
              NameQuest = "DeepForestIsland3"
              QuestLv = 1.0
              NameMon = "Fishman Raider"
              r1_151 = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1800.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1824.0 then
                if SelectMonster ~= "Fishman Captain" then
                  if SelectArea == "Deep Forest" then
                  end
                end
              end
              Ms = "Fishman Captain"
              NameQuest = "DeepForestIsland3"
              QuestLv = 2.0
              NameMon = "Fishman Captain"
              r1_151 = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1825.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1849.0 then
                if SelectMonster ~= "Forest Pirate" then
                  if SelectArea == "Deep Forest" then
                  end
                end
              end
              Ms = "Forest Pirate"
              NameQuest = "DeepForestIsland"
              QuestLv = 1.0
              NameMon = "Forest Pirate"
              r1_151 = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1850.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1899.0 then
                if SelectMonster ~= "Mythological Pirate" then
                  if SelectArea == "Deep Forest" then
                  end
                end
              end
              Ms = "Mythological Pirate"
              NameQuest = "DeepForestIsland"
              QuestLv = 2.0
              NameMon = "Mythological Pirate"
              r1_151 = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1900.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1924.0 then
                if SelectMonster ~= "Jungle Pirate" then
                  if SelectArea == "Deep Forest" then
                  end
                end
              end
              Ms = "Jungle Pirate"
              NameQuest = "DeepForestIsland2"
              QuestLv = 1.0
              NameMon = "Jungle Pirate"
              r1_151 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1925.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1974.0 then
                if SelectMonster ~= "Musketeer Pirate" then
                  if SelectArea == "Deep Forest" then
                  end
                end
              end
              Ms = "Musketeer Pirate"
              NameQuest = "DeepForestIsland2"
              QuestLv = 2.0
              NameMon = "Musketeer Pirate"
              r1_151 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 1975.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 1999.0 then
                if SelectMonster ~= "Reborn Skeleton" then
                  if SelectArea == "Haunted Castle" then
                  end
                end
              end
              Ms = "Reborn Skeleton"
              NameQuest = "HauntedQuest1"
              QuestLv = 1.0
              NameMon = "Reborn Skeleton"
              r1_151 = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1.0, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1.0, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2000.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2024.0 then
                if SelectMonster ~= "Living Zombie" then
                  if SelectArea == "Haunted Castle" then
                  end
                end
              end
              Ms = "Living Zombie"
              NameQuest = "HauntedQuest1"
              QuestLv = 2.0
              NameMon = "Living Zombie"
              r1_151 = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1.0, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1.0, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2025.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2049.0 then
                if SelectMonster ~= "Demonic Soul" then
                  if SelectArea == "Haunted Castle" then
                  end
                end
              end
              Ms = "Demonic Soul"
              NameQuest = "HauntedQuest2"
              QuestLv = 1.0
              NameMon = "Demonic Soul"
              r1_151 = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2050.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2074.0 then
                if SelectMonster ~= "Posessed Mummy" then
                  if SelectArea == "Haunted Castle" then
                  end
                end
              end
              Ms = "Posessed Mummy"
              NameQuest = "HauntedQuest2"
              QuestLv = 2.0
              NameMon = "Posessed Mummy"
              r1_151 = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2075.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2099.0 then
                if SelectMonster ~= "Peanut Scout" then
                  if SelectArea == "Nut Island" then
                  end
                end
              end
              Ms = "Peanut Scout"
              NameQuest = "NutsIslandQuest"
              QuestLv = 1.0
              NameMon = "Peanut Scout"
              r1_151 = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1.0, 0, 0.642767608, 0, -0.766061664)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2100.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2124.0 then
                if SelectMonster ~= "Peanut President" then
                  if SelectArea == "Nut Island" then
                  end
                end
              end
              Ms = "Peanut President"
              NameQuest = "NutsIslandQuest"
              QuestLv = 2.0
              NameMon = "Peanut President"
              r1_151 = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1.0, 0, 0.642767608, 0, -0.766061664)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2125.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2149.0 then
                if SelectMonster ~= "Ice Cream Chef" then
                  if SelectArea == "Ice Cream Island" then
                  end
                end
              end
              Ms = "Ice Cream Chef"
              NameQuest = "IceCreamIslandQuest"
              QuestLv = 1.0
              NameMon = "Ice Cream Chef"
              r1_151 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1.0, 0, -0.642767608, 0, -0.766061664)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2150.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2199.0 then
                if SelectMonster ~= "Ice Cream Commander" then
                  if SelectArea == "Ice Cream Island" then
                  end
                end
              end
              Ms = "Ice Cream Commander"
              NameQuest = "IceCreamIslandQuest"
              QuestLv = 2.0
              NameMon = "Ice Cream Commander"
              r1_151 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1.0, 0, -0.642767608, 0, -0.766061664)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2200.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2224.0 then
                if SelectMonster ~= "Cookie Crafter" then
                  if SelectArea == "Cake Island" then
                  end
                end
              end
              Ms = "Cookie Crafter"
              NameQuest = "CakeQuest1"
              QuestLv = 1.0
              NameMon = "Cookie Crafter"
              r1_151 = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1.0, 0, 0.275594592, 0, -0.961273909)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1.0, 0, -0.625686109, 0, -0.780074954)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2225.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2249.0 then
                if SelectMonster ~= "Cake Guard" then
                  if SelectArea == "Cake Island" then
                  end
                end
              end
              Ms = "Cake Guard"
              NameQuest = "CakeQuest1"
              QuestLv = 2.0
              NameMon = "Cake Guard"
              r1_151 = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1.0, 0, 0.275594592, 0, -0.961273909)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1.0, 0, -0.997700036, 0, 0.0677844882)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2250.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2274.0 then
                if SelectMonster ~= "Baking Staff" then
                  if SelectArea == "Cake Island" then
                  end
                end
              end
              Ms = "Baking Staff"
              NameQuest = "CakeQuest2"
              QuestLv = 1.0
              NameMon = "Baking Staff"
              r1_151 = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1.0, 0, 0.308980465, 0, 0.951068401)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1.0, 0, 0.967087567, 0, -0.254443765)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2275.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2299.0 then
                if SelectMonster ~= "Head Baker" then
                  if SelectArea == "Cake Island" then
                  end
                end
              end
              Ms = "Head Baker"
              NameQuest = "CakeQuest2"
              QuestLv = 2.0
              NameMon = "Head Baker"
              r1_151 = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1.0, 0, 0.308980465, 0, 0.951068401)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1.0, 0, 0.126466095, 0, -0.991971016)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2300.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2324.0 then
                if SelectMonster ~= "Cocoa Warrior" then
                  if SelectArea == "Choco Island" then
                  end
                end
              end
              Ms = "Cocoa Warrior"
              NameQuest = "ChocQuest1"
              QuestLv = 1.0
              NameMon = "Cocoa Warrior"
              r1_151 = CFrame.new(231.75, 23.9003029, -12200.292, -1.0, 0, 0, 0, 1.0, 0, 0, 0, -1.0)
              CFrameQ = r1_151
              r1_151 = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1.0, 0, -0.341998369, 0, -0.939700961)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2325.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2349.0 then
                if SelectMonster ~= "Chocolate Bar Battler" then
                  if SelectArea == "Choco Island" then
                  end
                end
              end
              Ms = "Chocolate Bar Battler"
              NameQuest = "ChocQuest1"
              QuestLv = 2.0
              NameMon = "Chocolate Bar Battler"
              r1_151 = CFrame.new(231.75, 23.9003029, -12200.292, -1.0, 0, 0, 0, 1.0, 0, 0, 0, -1.0)
              CFrameQ = r1_151
              r1_151 = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1.0, 0, 0.939684391, 0, -0.342042685)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2350.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2374.0 then
                if SelectMonster ~= "Sweet Thief" then
                  if SelectArea == "Choco Island" then
                  end
                end
              end
              Ms = "Sweet Thief"
              NameQuest = "ChocQuest2"
              QuestLv = 1.0
              NameMon = "Sweet Thief"
              r1_151 = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1.0, 0, -0.906319618, 0, 0.422592998)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1.0, 0, 0.984811902, 0, 0.173624337)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2375.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2400.0 then
                if SelectMonster ~= "Candy Rebel" then
                  if SelectArea == "Choco Island" then
                  end
                end
              end
              Ms = "Candy Rebel"
              NameQuest = "ChocQuest2"
              QuestLv = 2.0
              NameMon = "Candy Rebel"
              r1_151 = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1.0, 0, -0.906319618, 0, 0.422592998)
              CFrameQ = r1_151
              r1_151 = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1.0, 0, 0.573571265, 0, -0.819156051)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2400.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2424.0 then
                if SelectMonster ~= "Candy Pirate" then
                  if SelectArea == "Candy Island" then
                  end
                end
              end
              Ms = "Candy Pirate"
              NameQuest = "CandyQuest1"
              QuestLv = 1.0
              NameMon = "Candy Pirate"
              r1_151 = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1.0, 0, 0.987686574, 0, -0.156446099)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1.0, 0, 0.984811902, 0, 0.173624337)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2425.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2449.0 then
                if SelectMonster ~= "Snow Demon" then
                  if SelectArea == "Candy Island" then
                  end
                end
              end
              Ms = "Snow Demon"
              NameQuest = "CandyQuest1"
              QuestLv = 2.0
              NameMon = "Snow Demon"
              r1_151 = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1.0, 0, 0.987686574, 0, -0.156446099)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1.0, 0, -0.500031412, 0, 0.866007268)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2450.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2474.0 then
                if SelectMonster ~= "Isle Outlaw" then
                  if SelectArea == "Tiki Outpost" then
                  end
                end
              end
              Ms = "Isle Outlaw"
              NameQuest = "TikiQuest1"
              QuestLv = 1.0
              NameMon = "Isle Outlaw"
              r1_151 = CFrame.new(-16549.890625, 55.68635559082, -179.91360473633)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-16162.819335938, 11.686337471008, -96.454818725586)
              CFrameMon = r1_151
            end
            if r0_151.LocalPlayer.Data.Level.Value ~= 2475.0 then
              if r0_151.LocalPlayer.Data.Level.Value > 2524.0 then
                if SelectMonster ~= "Island Boy" then
                  if SelectArea == "Tiki Outpost" then
                  end
                end
              end
              Ms = "Island Boy"
              NameQuest = "TikiQuest1"
              QuestLv = 2.0
              NameMon = "Island Boy"
              r1_151 = CFrame.new(-16549.890625, 55.68635559082, -179.91360473633)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-16912.130859375, 11.787443161011, -133.08508300781)
              CFrameMon = r1_151
            end
            if 2525.0 > r0_151.LocalPlayer.Data.Level.Value then
              if SelectMonster ~= "Isle Champion" then
                if SelectArea == "Tiki Outpost" then
                end
              end
              Ms = "Isle Champion"
              NameQuest = "TikiQuest2"
              QuestLv = 2.0
              NameMon = "Isle Champion"
              r1_151 = CFrame.new(-16542.447265625, 55.686328887939, 1044.4165039062)
              CFrameQ = r1_151
              r1_151 = CFrame.new(-16848.94140625, 21.686334609985, 1041.4490966797)
              CFrameMon = r1_151
            end
          end
          return
        end
        if not First_Sea then
          tableMon = r8_1
        end
        if not Second_Sea then
          tableMon = r8_1
        end
        if not Third_Sea then
          tableMon = r8_1
        end
        if not First_Sea then
          AreaList = r8_1
        end
        if not Second_Sea then
          AreaList = r8_1
        end
        if not Third_Sea then
          AreaList = r8_1
        end
        function CheckBossQuest()
          -- line: [0.0, 0.0] id: 62
          if not First_Sea then
            if SelectBoss == "The Gorilla King" then
              BossMon = "The Gorilla King"
              NameBoss = "The Gorrila King"
              NameQuestBoss = "JungleQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$2,000\
7,000 Exp."
              local r0_62 = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1.0, 0, -0.707079291, 0, -0.707134247)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Bobby" then
              BossMon = "Bobby"
              NameBoss = "Bobby"
              NameQuestBoss = "BuggyQuest1"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$8,000\
35,000 Exp."
              r0_62 = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
              CFrameBoss = r0_62
            end
            if SelectBoss == "The Saw" then
              BossMon = "The Saw"
              NameBoss = "The Saw"
              r0_62 = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Yeti" then
              BossMon = "Yeti"
              NameBoss = "Yeti"
              NameQuestBoss = "SnowQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$10,000\
180,000 Exp."
              r0_62 = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Mob Leader" then
              BossMon = "Mob Leader"
              NameBoss = "Mob Leader"
              r0_62 = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Vice Admiral" then
              BossMon = "Vice Admiral"
              NameBoss = "Vice Admiral"
              NameQuestBoss = "MarineQuest2"
              QuestLvBoss = 2.0
              RewardBoss = "Reward:\
$10,000\
180,000 Exp."
              r0_62 = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Saber Expert" then
              NameBoss = "Saber Expert"
              BossMon = "Saber Expert"
              r0_62 = CFrame.new(-1458.89502, 29.8870335, -50.633564)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Warden" then
              BossMon = "Warden"
              NameBoss = "Warden"
              NameQuestBoss = "ImpelQuest"
              QuestLvBoss = 1.0
              RewardBoss = "Reward:\
$6,000\
850,000 Exp."
              r0_62 = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1.0, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
              CFrameBoss = r0_62
              r0_62 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1.0, 0, -0.681965172, 0, -0.731384635)
              CFrameQBoss = r0_62
            end
            if SelectBoss == "Chief Warden" then
              BossMon = "Chief Warden"
              NameBoss = "Chief Warden"
              NameQuestBoss = "ImpelQuest"
              QuestLvBoss = 2.0
              RewardBoss = "Reward:\
$10,000\
1,000,000 Exp."
              r0_62 = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
              CFrameBoss = r0_62
              r0_62 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1.0, 0, -0.681965172, 0, -0.731384635)
              CFrameQBoss = r0_62
            end
            if SelectBoss == "Swan" then
              BossMon = "Swan"
              NameBoss = "Swan"
              NameQuestBoss = "ImpelQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$15,000\
1,600,000 Exp."
              r0_62 = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1.0, 0, -0.951042235, 0, -0.309060812)
              CFrameBoss = r0_62
              r0_62 = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1.0, 0, -0.681965172, 0, -0.731384635)
              CFrameQBoss = r0_62
            end
            if SelectBoss == "Magma Admiral" then
              BossMon = "Magma Admiral"
              NameBoss = "Magma Admiral"
              NameQuestBoss = "MagmaQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$15,000\
2,800,000 Exp."
              r0_62 = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Fishman Lord" then
              BossMon = "Fishman Lord"
              NameBoss = "Fishman Lord"
              NameQuestBoss = "FishmanQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$15,000\
4,000,000 Exp."
              r0_62 = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Wysper" then
              BossMon = "Wysper"
              NameBoss = "Wysper"
              NameQuestBoss = "SkyExp1Quest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$15,000\
4,800,000 Exp."
              r0_62 = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Thunder God" then
              BossMon = "Thunder God"
              NameBoss = "Thunder God"
              NameQuestBoss = "SkyExp2Quest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$20,000\
5,800,000 Exp."
              r0_62 = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Cyborg" then
              BossMon = "Cyborg"
              NameBoss = "Cyborg"
              NameQuestBoss = "FountainQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$20,000\
7,500,000 Exp."
              r0_62 = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Ice Admiral" then
              BossMon = "Ice Admiral"
              NameBoss = "Ice Admiral"
              r0_62 = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1.0, 0, 0.81913656, 0, -0.573599219)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Greybeard" then
              BossMon = "Greybeard"
              NameBoss = "Greybeard"
              r0_62 = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
              CFrameBoss = r0_62
            end
          end
          if not Second_Sea then
            if SelectBoss == "Diamond" then
              BossMon = "Diamond"
              NameBoss = "Diamond"
              NameQuestBoss = "Area1Quest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$25,000\
9,000,000 Exp."
              r0_62 = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Jeremy" then
              BossMon = "Jeremy"
              NameBoss = "Jeremy"
              NameQuestBoss = "Area2Quest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$25,000\
11,500,000 Exp."
              r0_62 = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Fajita" then
              BossMon = "Fajita"
              NameBoss = "Fajita"
              NameQuestBoss = "MarineQuest3"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$25,000\
15,000,000 Exp."
              r0_62 = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Don Swan" then
              BossMon = "Don Swan"
              NameBoss = "Don Swan"
              r0_62 = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Smoke Admiral" then
              BossMon = "Smoke Admiral"
              NameBoss = "Smoke Admiral"
              NameQuestBoss = "IceSideQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$20,000\
25,000,000 Exp."
              r0_62 = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Awakened Ice Admiral" then
              BossMon = "Awakened Ice Admiral"
              NameBoss = "Awakened Ice Admiral"
              NameQuestBoss = "FrostQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$20,000\
36,000,000 Exp."
              r0_62 = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Tide Keeper" then
              BossMon = "Tide Keeper"
              NameBoss = "Tide Keeper"
              NameQuestBoss = "ForgottenQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$12,500\
38,000,000 Exp."
              r0_62 = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Darkbeard" then
              BossMon = "Darkbeard"
              NameBoss = "Darkbeard"
              r0_62 = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
              CFrameMon = r0_62
            end
            if SelectBoss == "Cursed Captain" then
              BossMon = "Cursed Captain"
              NameBoss = "Cursed Captain"
              r0_62 = CFrame.new(916.928589, 181.092773, 33422.0)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Order" then
              BossMon = "Order"
              NameBoss = "Order"
              r0_62 = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
              CFrameBoss = r0_62
            end
          end
          if not Third_Sea then
            if SelectBoss == "Stone" then
              BossMon = "Stone"
              NameBoss = "Stone"
              NameQuestBoss = "PiratePortQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$25,000\
40,000,000 Exp."
              r0_62 = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Island Empress" then
              BossMon = "Island Empress"
              NameBoss = "Island Empress"
              NameQuestBoss = "AmazonQuest2"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$30,000\
52,000,000 Exp."
              r0_62 = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Kilo Admiral" then
              BossMon = "Kilo Admiral"
              NameBoss = "Kilo Admiral"
              NameQuestBoss = "MarineTreeIsland"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$35,000\
56,000,000 Exp."
              r0_62 = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Captain Elephant" then
              BossMon = "Captain Elephant"
              NameBoss = "Captain Elephant"
              NameQuestBoss = "DeepForestIsland"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$40,000\
67,000,000 Exp."
              r0_62 = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Beautiful Pirate" then
              BossMon = "Beautiful Pirate"
              NameBoss = "Beautiful Pirate"
              NameQuestBoss = "DeepForestIsland2"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$50,000\
70,000,000 Exp."
              r0_62 = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Cake Queen" then
              BossMon = "Cake Queen"
              NameBoss = "Cake Queen"
              NameQuestBoss = "IceCreamIslandQuest"
              QuestLvBoss = 3.0
              RewardBoss = "Reward:\
$30,000\
112,500,000 Exp."
              r0_62 = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1.0, 0, -0.642767608, 0, -0.766061664)
              CFrameQBoss = r0_62
              r0_62 = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Longma" then
              BossMon = "Longma"
              NameBoss = "Longma"
              r0_62 = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
              CFrameBoss = r0_62
            end
            if SelectBoss == "Soul Reaper" then
              BossMon = "Soul Reaper"
              NameBoss = "Soul Reaper"
              r0_62 = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
              CFrameBoss = r0_62
            end
            if SelectBoss == "rip_indra True Form" then
              BossMon = "rip_indra True Form"
              NameBoss = "rip_indra True Form"
              r0_62 = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
              CFrameBoss = r0_62
            end
          end
          return
        end
        function MaterialMon()
          -- line: [0.0, 0.0] id: 196
          if SelectMaterial == "Radioactive Material" then
            MMon = "Factory Staff"
            local r0_196 = CFrame.new(295.0, 73.0, -56.0)
            MPos = r0_196
            SP = "Default"
          end
          if SelectMaterial == "Mystic Droplet" then
            MMon = "Water Fighter"
            r0_196 = CFrame.new(-3385.0, 239.0, -10542.0)
            MPos = r0_196
            SP = "Default"
          end
          if SelectMaterial == "Magma Ore" then
            if not First_Sea then
              MMon = "Military Spy"
              r0_196 = CFrame.new(-5815.0, 84.0, 8820.0)
              MPos = r0_196
              SP = "Default"
            end
            if not Second_Sea then
              MMon = "Magma Ninja"
              r0_196 = CFrame.new(-5428.0, 78.0, -5959.0)
              MPos = r0_196
              SP = "Default"
            end
            if SelectMaterial == "Angel Wings" then
              MMon = "God's Guard"
              r0_196 = CFrame.new(-4698.0, 845.0, -1912.0)
              MPos = r0_196
              SP = "Default"
              local r1_196 = Vector3.new(-7859.09814, 5544.19043, -381.476196)
              if 5000.0 <= game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r1_196.Magnitude then
                r0_196 = game:GetService("ReplicatedStorage")
                r0_196.Remotes.CommF_:InvokeServer(r0_196.Remotes.CommF_)
              end
              if SelectMaterial == "Leather" then
                if not First_Sea then
                  MMon = "Brute"
                  r0_196 = CFrame.new(-1145.0, 15.0, 4350.0)
                  MPos = r0_196
                  SP = "Default"
                end
                if not Second_Sea then
                  MMon = "Marine Captain"
                  r0_196 = CFrame.new(-2010.5059814453, 73.001159667969, -3326.6208496094)
                  MPos = r0_196
                  SP = "Default"
                end
                if not Third_Sea then
                  MMon = "Jungle Pirate"
                  r0_196 = CFrame.new(-11975.78515625, 331.77340698242, -10620.030273438)
                  MPos = r0_196
                  SP = "Default"
                end
                if SelectMaterial == "Scrap Metal" then
                  if not First_Sea then
                    MMon = "Brute"
                    r0_196 = CFrame.new(-1145.0, 15.0, 4350.0)
                    MPos = r0_196
                    SP = "Default"
                  end
                  if not Second_Sea then
                    MMon = "Swan Pirate"
                    r0_196 = CFrame.new(878.0, 122.0, 1235.0)
                    MPos = r0_196
                    SP = "Default"
                  end
                  if not Third_Sea then
                    MMon = "Jungle Pirate"
                    r0_196 = CFrame.new(-12107.0, 332.0, -10549.0)
                    MPos = r0_196
                    SP = "Default"
                  end
                  if SelectMaterial == "Fish Tail" then
                    if not Third_Sea then
                      MMon = "Fishman Raider"
                      r0_196 = CFrame.new(-10993.0, 332.0, -8940.0)
                      MPos = r0_196
                      SP = "Default"
                    end
                    if not First_Sea then
                      MMon = "Fishman Warrior"
                      r0_196 = CFrame.new(61123.0, 19.0, 1569.0)
                      MPos = r0_196
                      SP = "Default"
                      r1_196 = Vector3.new(61163.8515625, 5.342342376709, 1819.7841796875)
                      if 17000.0 <= game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r1_196.Magnitude then
                        r0_196 = game:GetService("ReplicatedStorage")
                        r0_196.Remotes.CommF_:InvokeServer(r0_196.Remotes.CommF_)
                      end
                      if SelectMaterial == "Demonic Wisp" then
                        MMon = "Demonic Soul"
                        r0_196 = CFrame.new(-9507.0, 172.0, 6158.0)
                        MPos = r0_196
                        SP = "Default"
                      end
                      if SelectMaterial == "Vampire Fang" then
                        MMon = "Vampire"
                        r0_196 = CFrame.new(-6033.0, 7.0, -1317.0)
                        MPos = r0_196
                        SP = "Default"
                      end
                      if SelectMaterial == "Conjured Cocoa" then
                        MMon = "Chocolate Bar Battler"
                        r0_196 = CFrame.new(620.63446044922, 78.936447143555, -12581.369140625)
                        MPos = r0_196
                        SP = "Default"
                      end
                      if SelectMaterial == "Dragon Scale" then
                        MMon = "Dragon Crew Archer"
                        r0_196 = CFrame.new(6594.0, 383.0, 139.0)
                        MPos = r0_196
                        SP = "Default"
                      end
                      if SelectMaterial == "Gunpowder" then
                        MMon = "Pistol Billionaire"
                        r0_196 = CFrame.new(-469.0, 74.0, 5904.0)
                        MPos = r0_196
                        SP = "Default"
                      end
                      if SelectMaterial == "Mini Tusk" then
                        MMon = "Mythological Pirate"
                        r0_196 = CFrame.new(-13545.0, 470.0, -6917.0)
                        MPos = r0_196
                        SP = "Default"
                      end
                    end
                  end
                end
              end
            end
          end
          return
        end
        function UpdateIslandESP()
          -- line: [0.0, 0.0] id: 228
          local r1_228 = game:GetService("Workspace")
          local r0_228, r1_228, r2_228 = pairs(r1_228._WorldOrigin.Locations:GetChildren())
          local r6_228 = function()
            -- line: [0.0, 0.0] id: 229
            if not IslandESP then
              if upval_0.Name ~= "Sea" then
                local r0_229 = upval_0:FindFirstChild("NameEsp")
                if r0_229 then
                  r0_229 = Instance.new("BillboardGui", upval_0)
                  r0_229.Name = "NameEsp"
                  local r1_229 = Vector3.new(0, 1.0, 0)
                  r0_229.ExtentsOffset = r1_229
                  r1_229 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_229.Size = r1_229
                  r0_229.Adornee = upval_0
                  r0_229.AlwaysOnTop = true
                  r1_229 = Instance.new("TextLabel", r0_229)
                  r1_229.Font = "GothamBold"
                  r1_229.FontSize = "Size14"
                  r1_229.TextWrapped = true
                  local r2_229 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_229.Size = r2_229
                  r1_229.TextYAlignment = "Top"
                  r1_229.BackgroundTransparency = 1.0
                  r1_229.TextStrokeTransparency = 0.5
                  r2_229 = Color3.fromRGB(7.0, 236.0, 240.0)
                  r1_229.TextColor3 = r2_229
                end
                local r4_229 = game:GetService("Players")
                local r3_229 = round(r4_229.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_229 .. " Distance"
              end
              r0_229 = upval_0:FindFirstChild("NameEsp")
              if not r0_229 then
                r0_229 = upval_0:FindFirstChild("NameEsp")
                r0_229:Destroy()
              end
            end
            return
          end
          pcall(r6_228)
          for r3_228, r4_228 in r0_228 do
            return
        end
        function isnil(r0_127)
          -- line: [0.0, 0.0] id: 127
          if r0_127 ~= nil then
            return false
        end
        local r8_1 = function(r0_47)
          -- line: [0.0, 0.0] id: 47
          local r2_47 = tonumber(r0_47)
          return math.floor(r2_47 + 0.5)
          return 
        end
        r9_1 = math.random(1.0, 1000000.0)
        Number = r9_1
        local r9_1 = function()
          -- line: [0.0, 0.0] id: 44
          local r1_44 = game:GetService("Players")
          local r0_44, r1_44, r2_44 = pairs(r1_44:GetChildren())
          local r6_44 = function()
            -- line: [0.0, 0.0] id: 45
            local r0_45 = isnil(upval_0.Character)
            if r0_45 then
              if not ESPPlayer then
                r0_45 = isnil(upval_0.Character.Head)
                if r0_45 then
                  r0_45 = upval_0.Character.Head:FindFirstChild("NameEsp" .. Number)
                  if r0_45 then
                    r0_45 = Instance.new("BillboardGui", upval_0.Character.Head)
                    r0_45.Name = "NameEsp" .. Number
                    local r1_45 = Vector3.new(0, 1.0, 0)
                    r0_45.ExtentsOffset = r1_45
                    r1_45 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                    r0_45.Size = r1_45
                    r0_45.Adornee = upval_0.Character.Head
                    r0_45.AlwaysOnTop = true
                    r1_45 = Instance.new("TextLabel", r0_45)
                    r1_45.Font = Enum.Font.GothamSemibold
                    r1_45.FontSize = "Size14"
                    r1_45.TextWrapped = true
                    local r5_45 = game:GetService("Players")
                    local r4_45 = upval_1(r5_45.LocalPlayer.Character.Head.Position - upval_0.Character.Head.Position.Magnitude / 3.0)
                    r1_45.Text = upval_0.Name .. " \
" .. r4_45 .. " Distance"
                    local r2_45 = UDim2.new(1.0, 0, 1.0, 0)
                    r1_45.Size = r2_45
                    r1_45.TextYAlignment = "Top"
                    r1_45.BackgroundTransparency = 1.0
                    r1_45.TextStrokeTransparency = 0.5
                    if upval_0.Team == game.Players.LocalPlayer.Team then
                      r2_45 = Color3.new(0, 255.0, 0)
                      r1_45.TextColor3 = r2_45
                    end
                    r2_45 = Color3.new(255.0, 0, 0)
                    r1_45.TextColor3 = r2_45
                  end
                end
                r4_45 = game:GetService("Players")
                local r3_45 = upval_1(r4_45.LocalPlayer.Character.Head.Position - upval_0.Character.Head.Position.Magnitude / 3.0)
                r5_45 = upval_1(upval_0.Character.Humanoid.Health * 100.0 / upval_0.Character.Humanoid.MaxHealth)
                upval_0.Character.Head["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. " | " .. r3_45 .. " Distance\
Health : " .. r5_45 .. "%"
              end
              r0_45 = upval_0.Character.Head:FindFirstChild("NameEsp" .. Number)
              if not r0_45 then
                r0_45 = upval_0.Character.Head:FindFirstChild("NameEsp" .. Number)
                r0_45:Destroy()
              end
            end
            return
          end
          pcall(r6_44)
          for r3_44, r4_44 in r0_44 do
            return
        end
        UpdatePlayerChams = r9_1
        local r9_1 = function()
          -- line: [0.0, 0.0] id: 89
          local r0_89, r1_89, r2_89 = pairs(game.Workspace:GetChildren())
          local r6_89 = function()
            -- line: [0.0, 0.0] id: 90
            local r0_90 = string.find(upval_0.Name, "Chest")
            if not r0_90 then
              if not ChestESP then
                r0_90 = string.find(upval_0.Name, "Chest")
                if not r0_90 then
                  r0_90 = upval_0:FindFirstChild("NameEsp" .. Number)
                  if r0_90 then
                    r0_90 = Instance.new("BillboardGui", upval_0)
                    r0_90.Name = "NameEsp" .. Number
                    local r1_90 = Vector3.new(0, 1.0, 0)
                    r0_90.ExtentsOffset = r1_90
                    r1_90 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                    r0_90.Size = r1_90
                    r0_90.Adornee = upval_0
                    r0_90.AlwaysOnTop = true
                    r1_90 = Instance.new("TextLabel", r0_90)
                    r1_90.Font = Enum.Font.GothamSemibold
                    r1_90.FontSize = "Size14"
                    r1_90.TextWrapped = true
                    local r2_90 = UDim2.new(1.0, 0, 1.0, 0)
                    r1_90.Size = r2_90
                    r1_90.TextYAlignment = "Top"
                    r1_90.BackgroundTransparency = 1.0
                    r1_90.TextStrokeTransparency = 0.5
                    if upval_0.Name == "Chest1" then
                      r2_90 = Color3.fromRGB(109.0, 109.0, 109.0)
                      r1_90.TextColor3 = r2_90
                      local r5_90 = game:GetService("Players")
                      local r4_90 = upval_1(r5_90.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                      r1_90.Text = "Chest 1" .. " \
" .. r4_90 .. " Distance"
                    end
                    if upval_0.Name == "Chest2" then
                      r2_90 = Color3.fromRGB(173.0, 158.0, 21.0)
                      r1_90.TextColor3 = r2_90
                      r5_90 = game:GetService("Players")
                      r4_90 = upval_1(r5_90.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                      r1_90.Text = "Chest 2" .. " \
" .. r4_90 .. " Distance"
                    end
                    if upval_0.Name == "Chest3" then
                      r2_90 = Color3.fromRGB(85.0, 255.0, 255.0)
                      r1_90.TextColor3 = r2_90
                      r5_90 = game:GetService("Players")
                      r4_90 = upval_1(r5_90.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                      r1_90.Text = "Chest 3" .. " \
" .. r4_90 .. " Distance"
                    end
                    r4_90 = game:GetService("Players")
                    local r3_90 = upval_1(r4_90.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                    upval_0["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. "   \
" .. r3_90 .. " Distance"
                  end
                  r0_90 = upval_0:FindFirstChild("NameEsp" .. Number)
                  if not r0_90 then
                    r0_90 = upval_0:FindFirstChild("NameEsp" .. Number)
                    r0_90:Destroy()
                  end
                end
              end
            end
            return
          end
          pcall(r6_89)
          for r3_89, r4_89 in r0_89 do
            return
        end
        UpdateChestChams = r9_1
        local r9_1 = function()
          -- line: [0.0, 0.0] id: 5
          local r0_5, r1_5, r2_5 = pairs(game.Workspace:GetChildren())
          local r6_5 = function()
            -- line: [0.0, 0.0] id: 6
            if not DevilFruitESP then
              local r0_6 = string.find(upval_0.Name, "Fruit")
              if not r0_6 then
                r0_6 = upval_0.Handle:FindFirstChild("NameEsp" .. Number)
                if r0_6 then
                  r0_6 = Instance.new("BillboardGui", upval_0.Handle)
                  r0_6.Name = "NameEsp" .. Number
                  local r1_6 = Vector3.new(0, 1.0, 0)
                  r0_6.ExtentsOffset = r1_6
                  r1_6 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_6.Size = r1_6
                  r0_6.Adornee = upval_0.Handle
                  r0_6.AlwaysOnTop = true
                  r1_6 = Instance.new("TextLabel", r0_6)
                  r1_6.Font = Enum.Font.GothamSemibold
                  r1_6.FontSize = "Size14"
                  r1_6.TextWrapped = true
                  local r2_6 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_6.Size = r2_6
                  r1_6.TextYAlignment = "Top"
                  r1_6.BackgroundTransparency = 1.0
                  r1_6.TextStrokeTransparency = 0.5
                  r2_6 = Color3.fromRGB(255.0, 255.0, 255.0)
                  r1_6.TextColor3 = r2_6
                  local r5_6 = game:GetService("Players")
                  local r4_6 = upval_1(r5_6.LocalPlayer.Character.Head.Position - upval_0.Handle.Position.Magnitude / 3.0)
                  r1_6.Text = upval_0.Name .. " \
" .. r4_6 .. " Distance"
                end
                r4_6 = game:GetService("Players")
                local r3_6 = upval_1(r4_6.LocalPlayer.Character.Head.Position - upval_0.Handle.Position.Magnitude / 3.0)
                upval_0.Handle["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. "   \
" .. r3_6 .. " Distance"
              end
              r0_6 = upval_0.Handle:FindFirstChild("NameEsp" .. Number)
              if not r0_6 then
                r0_6 = upval_0.Handle:FindFirstChild("NameEsp" .. Number)
                r0_6:Destroy()
              end
            end
            return
          end
          pcall(r6_5)
          for r3_5, r4_5 in r0_5 do
            return
        end
        UpdateDevilChams = r9_1
        local r9_1 = function()
          -- line: [0.0, 0.0] id: 292
          local r0_292, r1_292, r2_292 = pairs(game.Workspace:GetChildren())
          local r6_292 = function()
            -- line: [0.0, 0.0] id: 293
            if upval_0.Name ~= "Flower2" then
              if upval_0.Name == "Flower1" then
              end
              if not FlowerESP then
                local r0_293 = upval_0:FindFirstChild("NameEsp" .. Number)
                if r0_293 then
                  r0_293 = Instance.new("BillboardGui", upval_0)
                  r0_293.Name = "NameEsp" .. Number
                  local r1_293 = Vector3.new(0, 1.0, 0)
                  r0_293.ExtentsOffset = r1_293
                  r1_293 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_293.Size = r1_293
                  r0_293.Adornee = upval_0
                  r0_293.AlwaysOnTop = true
                  r1_293 = Instance.new("TextLabel", r0_293)
                  r1_293.Font = Enum.Font.GothamSemibold
                  r1_293.FontSize = "Size14"
                  r1_293.TextWrapped = true
                  local r2_293 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_293.Size = r2_293
                  r1_293.TextYAlignment = "Top"
                  r1_293.BackgroundTransparency = 1.0
                  r1_293.TextStrokeTransparency = 0.5
                  r2_293 = Color3.fromRGB(255.0, 0, 0)
                  r1_293.TextColor3 = r2_293
                  if upval_0.Name == "Flower1" then
                    local r5_293 = game:GetService("Players")
                    local r4_293 = upval_1(r5_293.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                    r1_293.Text = "Blue Flower" .. " \
" .. r4_293 .. " Distance"
                    r2_293 = Color3.fromRGB(0, 0, 255.0)
                    r1_293.TextColor3 = r2_293
                  end
                  if upval_0.Name == "Flower2" then
                    r5_293 = game:GetService("Players")
                    r4_293 = upval_1(r5_293.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                    r1_293.Text = "Red Flower" .. " \
" .. r4_293 .. " Distance"
                    r2_293 = Color3.fromRGB(255.0, 0, 0)
                    r1_293.TextColor3 = r2_293
                  end
                  r4_293 = game:GetService("Players")
                  local r3_293 = upval_1(r4_293.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                  upval_0["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. "   \
" .. r3_293 .. " Distance"
                end
                r0_293 = upval_0:FindFirstChild("NameEsp" .. Number)
                if not r0_293 then
                  r0_293 = upval_0:FindFirstChild("NameEsp" .. Number)
                  r0_293:Destroy()
                end
              end
            end
            return
          end
          pcall(r6_292)
          for r3_292, r4_292 in r0_292 do
            return
        end
        UpdateFlowerChams = r9_1
        local r9_1 = function()
          -- line: [0.0, 0.0] id: 191
          local r0_191, r1_191, r2_191 = pairs(game.Workspace.AppleSpawner:GetChildren())
          local r5_191 = r4_191:IsA("Tool")
          if not r5_191 then
            if not RealFruitESP then
              r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
              if r5_191 then
                r5_191 = Instance.new("BillboardGui", r4_191.Handle)
                r5_191.Name = "NameEsp" .. Number
                local r6_191 = Vector3.new(0, 1.0, 0)
                r5_191.ExtentsOffset = r6_191
                r6_191 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                r5_191.Size = r6_191
                r5_191.Adornee = r4_191.Handle
                r5_191.AlwaysOnTop = true
                r6_191 = Instance.new("TextLabel", r5_191)
                r6_191.Font = Enum.Font.GothamSemibold
                r6_191.FontSize = "Size14"
                r6_191.TextWrapped = true
                local r7_191 = UDim2.new(1.0, 0, 1.0, 0)
                r6_191.Size = r7_191
                r6_191.TextYAlignment = "Top"
                r6_191.BackgroundTransparency = 1.0
                r6_191.TextStrokeTransparency = 0.5
                r7_191 = Color3.fromRGB(255.0, 0, 0)
                r6_191.TextColor3 = r7_191
                local r10_191 = game:GetService("Players")
                local r9_191 = upval_0(r10_191.LocalPlayer.Character.Head.Position - r4_191.Handle.Position.Magnitude / 3.0)
                r6_191.Text = r4_191.Name .. " \
" .. r9_191 .. " Distance"
              end
              r9_191 = game:GetService("Players")
              local r8_191 = upval_0(r9_191.LocalPlayer.Character.Head.Position - r4_191.Handle.Position.Magnitude / 3.0)
              r4_191.Handle["NameEsp" .. Number].TextLabel.Text = r4_191.Name .. " " .. r8_191 .. " Distance"
            end
            r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
            if not r5_191 then
              r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
              r5_191:Destroy()
            end
          end
          for r3_191, r4_191 in r0_191 do
            local r0_191, r1_191, r2_191 = pairs(game.Workspace.PineappleSpawner:GetChildren())
            r5_191 = r4_191:IsA("Tool")
            if not r5_191 then
              if not RealFruitESP then
                r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
                if r5_191 then
                  r5_191 = Instance.new("BillboardGui", r4_191.Handle)
                  r5_191.Name = "NameEsp" .. Number
                  r6_191 = Vector3.new(0, 1.0, 0)
                  r5_191.ExtentsOffset = r6_191
                  r6_191 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r5_191.Size = r6_191
                  r5_191.Adornee = r4_191.Handle
                  r5_191.AlwaysOnTop = true
                  r6_191 = Instance.new("TextLabel", r5_191)
                  r6_191.Font = Enum.Font.GothamSemibold
                  r6_191.FontSize = "Size14"
                  r6_191.TextWrapped = true
                  r7_191 = UDim2.new(1.0, 0, 1.0, 0)
                  r6_191.Size = r7_191
                  r6_191.TextYAlignment = "Top"
                  r6_191.BackgroundTransparency = 1.0
                  r6_191.TextStrokeTransparency = 0.5
                  r7_191 = Color3.fromRGB(255.0, 174.0, 0)
                  r6_191.TextColor3 = r7_191
                  r10_191 = game:GetService("Players")
                  r9_191 = upval_0(r10_191.LocalPlayer.Character.Head.Position - r4_191.Handle.Position.Magnitude / 3.0)
                  r6_191.Text = r4_191.Name .. " \
" .. r9_191 .. " Distance"
                end
                r9_191 = game:GetService("Players")
                r8_191 = upval_0(r9_191.LocalPlayer.Character.Head.Position - r4_191.Handle.Position.Magnitude / 3.0)
                r4_191.Handle["NameEsp" .. Number].TextLabel.Text = r4_191.Name .. " " .. r8_191 .. " Distance"
              end
              r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
              if not r5_191 then
                r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
                r5_191:Destroy()
              end
            end
            for r3_191, r4_191 in r0_191 do
              local r0_191, r1_191, r2_191 = pairs(game.Workspace.BananaSpawner:GetChildren())
              r5_191 = r4_191:IsA("Tool")
              if not r5_191 then
                if not RealFruitESP then
                  r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
                  if r5_191 then
                    r5_191 = Instance.new("BillboardGui", r4_191.Handle)
                    r5_191.Name = "NameEsp" .. Number
                    r6_191 = Vector3.new(0, 1.0, 0)
                    r5_191.ExtentsOffset = r6_191
                    r6_191 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                    r5_191.Size = r6_191
                    r5_191.Adornee = r4_191.Handle
                    r5_191.AlwaysOnTop = true
                    r6_191 = Instance.new("TextLabel", r5_191)
                    r6_191.Font = Enum.Font.GothamSemibold
                    r6_191.FontSize = "Size14"
                    r6_191.TextWrapped = true
                    r7_191 = UDim2.new(1.0, 0, 1.0, 0)
                    r6_191.Size = r7_191
                    r6_191.TextYAlignment = "Top"
                    r6_191.BackgroundTransparency = 1.0
                    r6_191.TextStrokeTransparency = 0.5
                    r7_191 = Color3.fromRGB(251.0, 255.0, 0)
                    r6_191.TextColor3 = r7_191
                    r10_191 = game:GetService("Players")
                    r9_191 = upval_0(r10_191.LocalPlayer.Character.Head.Position - r4_191.Handle.Position.Magnitude / 3.0)
                    r6_191.Text = r4_191.Name .. " \
" .. r9_191 .. " Distance"
                  end
                  r9_191 = game:GetService("Players")
                  r8_191 = upval_0(r9_191.LocalPlayer.Character.Head.Position - r4_191.Handle.Position.Magnitude / 3.0)
                  r4_191.Handle["NameEsp" .. Number].TextLabel.Text = r4_191.Name .. " " .. r8_191 .. " Distance"
                end
                r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
                if not r5_191 then
                  r5_191 = r4_191.Handle:FindFirstChild("NameEsp" .. Number)
                  r5_191:Destroy()
                end
              end
              for r3_191, r4_191 in r0_191 do
                return
        end
        UpdateRealFruitChams = r9_1
        local r9_1 = function()
          -- line: [0.0, 0.0] id: 241
          local r1_241 = game:GetService("Workspace")
          local r0_241, r1_241, r2_241 = pairs(r1_241._WorldOrigin.Locations:GetChildren())
          local r6_241 = function()
            -- line: [0.0, 0.0] id: 242
            if not IslandESP then
              if upval_0.Name ~= "Sea" then
                local r0_242 = upval_0:FindFirstChild("NameEsp")
                if r0_242 then
                  r0_242 = Instance.new("BillboardGui", upval_0)
                  r0_242.Name = "NameEsp"
                  local r1_242 = Vector3.new(0, 1.0, 0)
                  r0_242.ExtentsOffset = r1_242
                  r1_242 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_242.Size = r1_242
                  r0_242.Adornee = upval_0
                  r0_242.AlwaysOnTop = true
                  r1_242 = Instance.new("TextLabel", r0_242)
                  r1_242.Font = "GothamBold"
                  r1_242.FontSize = "Size14"
                  r1_242.TextWrapped = true
                  local r2_242 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_242.Size = r2_242
                  r1_242.TextYAlignment = "Top"
                  r1_242.BackgroundTransparency = 1.0
                  r1_242.TextStrokeTransparency = 0.5
                  r2_242 = Color3.fromRGB(7.0, 236.0, 240.0)
                  r1_242.TextColor3 = r2_242
                end
                local r4_242 = game:GetService("Players")
                local r3_242 = upval_1(r4_242.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_242 .. " Distance"
              end
              r0_242 = upval_0:FindFirstChild("NameEsp")
              if not r0_242 then
                r0_242 = upval_0:FindFirstChild("NameEsp")
                r0_242:Destroy()
              end
            end
            return
          end
          pcall(r6_241)
          for r3_241, r4_241 in r0_241 do
            return
        end
        UpdateIslandESP = r9_1
        function isnil(r0_216)
          -- line: [0.0, 0.0] id: 216
          if r0_216 ~= nil then
            return false
        end
        local r9_1 = function(r0_33)
          -- line: [0.0, 0.0] id: 33
          local r2_33 = tonumber(r0_33)
          return math.floor(r2_33 + 0.5)
          return 
        end
        r10_1 = math.random(1.0, 1000000.0)
        Number = r10_1
        local r10_1 = function()
          -- line: [0.0, 0.0] id: 311
          local r1_311 = game:GetService("Players")
          local r0_311, r1_311, r2_311 = pairs(r1_311:GetChildren())
          local r6_311 = function()
            -- line: [0.0, 0.0] id: 312
            local r0_312 = isnil(upval_0.Character)
            if r0_312 then
              if not ESPPlayer then
                r0_312 = isnil(upval_0.Character.Head)
                if r0_312 then
                  r0_312 = upval_0.Character.Head:FindFirstChild("NameEsp" .. Number)
                  if r0_312 then
                    r0_312 = Instance.new("BillboardGui", upval_0.Character.Head)
                    r0_312.Name = "NameEsp" .. Number
                    local r1_312 = Vector3.new(0, 1.0, 0)
                    r0_312.ExtentsOffset = r1_312
                    r1_312 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                    r0_312.Size = r1_312
                    r0_312.Adornee = upval_0.Character.Head
                    r0_312.AlwaysOnTop = true
                    r1_312 = Instance.new("TextLabel", r0_312)
                    r1_312.Font = Enum.Font.GothamSemibold
                    r1_312.FontSize = "Size14"
                    r1_312.TextWrapped = true
                    local r5_312 = game:GetService("Players")
                    local r4_312 = upval_1(r5_312.LocalPlayer.Character.Head.Position - upval_0.Character.Head.Position.Magnitude / 3.0)
                    r1_312.Text = upval_0.Name .. " \
" .. r4_312 .. " Distance"
                    local r2_312 = UDim2.new(1.0, 0, 1.0, 0)
                    r1_312.Size = r2_312
                    r1_312.TextYAlignment = "Top"
                    r1_312.BackgroundTransparency = 1.0
                    r1_312.TextStrokeTransparency = 0.5
                    if upval_0.Team == game.Players.LocalPlayer.Team then
                      r2_312 = Color3.new(0, 255.0, 0)
                      r1_312.TextColor3 = r2_312
                    end
                    r2_312 = Color3.new(255.0, 0, 0)
                    r1_312.TextColor3 = r2_312
                  end
                end
                r4_312 = game:GetService("Players")
                local r3_312 = upval_1(r4_312.LocalPlayer.Character.Head.Position - upval_0.Character.Head.Position.Magnitude / 3.0)
                r5_312 = upval_1(upval_0.Character.Humanoid.Health * 100.0 / upval_0.Character.Humanoid.MaxHealth)
                upval_0.Character.Head["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. " | " .. r3_312 .. " Distance\
Health : " .. r5_312 .. "%"
              end
              r0_312 = upval_0.Character.Head:FindFirstChild("NameEsp" .. Number)
              if not r0_312 then
                r0_312 = upval_0.Character.Head:FindFirstChild("NameEsp" .. Number)
                r0_312:Destroy()
              end
            end
            return
          end
          pcall(r6_311)
          for r3_311, r4_311 in r0_311 do
            return
        end
        UpdatePlayerChams = r10_1
        local r10_1 = function()
          -- line: [0.0, 0.0] id: 48
          local r0_48, r1_48, r2_48 = pairs(game.Workspace:GetChildren())
          local r6_48 = function()
            -- line: [0.0, 0.0] id: 49
            local r0_49 = string.find(upval_0.Name, "Chest")
            if not r0_49 then
              if not ChestESP then
                r0_49 = string.find(upval_0.Name, "Chest")
                if not r0_49 then
                  r0_49 = upval_0:FindFirstChild("NameEsp" .. Number)
                  if r0_49 then
                    r0_49 = Instance.new("BillboardGui", upval_0)
                    r0_49.Name = "NameEsp" .. Number
                    local r1_49 = Vector3.new(0, 1.0, 0)
                    r0_49.ExtentsOffset = r1_49
                    r1_49 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                    r0_49.Size = r1_49
                    r0_49.Adornee = upval_0
                    r0_49.AlwaysOnTop = true
                    r1_49 = Instance.new("TextLabel", r0_49)
                    r1_49.Font = Enum.Font.GothamSemibold
                    r1_49.FontSize = "Size14"
                    r1_49.TextWrapped = true
                    local r2_49 = UDim2.new(1.0, 0, 1.0, 0)
                    r1_49.Size = r2_49
                    r1_49.TextYAlignment = "Top"
                    r1_49.BackgroundTransparency = 1.0
                    r1_49.TextStrokeTransparency = 0.5
                    if upval_0.Name == "Chest1" then
                      r2_49 = Color3.fromRGB(109.0, 109.0, 109.0)
                      r1_49.TextColor3 = r2_49
                      local r5_49 = game:GetService("Players")
                      local r4_49 = upval_1(r5_49.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                      r1_49.Text = "Chest 1" .. " \
" .. r4_49 .. " Distance"
                    end
                    if upval_0.Name == "Chest2" then
                      r2_49 = Color3.fromRGB(173.0, 158.0, 21.0)
                      r1_49.TextColor3 = r2_49
                      r5_49 = game:GetService("Players")
                      r4_49 = upval_1(r5_49.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                      r1_49.Text = "Chest 2" .. " \
" .. r4_49 .. " Distance"
                    end
                    if upval_0.Name == "Chest3" then
                      r2_49 = Color3.fromRGB(85.0, 255.0, 255.0)
                      r1_49.TextColor3 = r2_49
                      r5_49 = game:GetService("Players")
                      r4_49 = upval_1(r5_49.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                      r1_49.Text = "Chest 3" .. " \
" .. r4_49 .. " Distance"
                    end
                    r4_49 = game:GetService("Players")
                    local r3_49 = upval_1(r4_49.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                    upval_0["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. "   \
" .. r3_49 .. " Distance"
                  end
                  r0_49 = upval_0:FindFirstChild("NameEsp" .. Number)
                  if not r0_49 then
                    r0_49 = upval_0:FindFirstChild("NameEsp" .. Number)
                    r0_49:Destroy()
                  end
                end
              end
            end
            return
          end
          pcall(r6_48)
          for r3_48, r4_48 in r0_48 do
            return
        end
        UpdateChestChams = r10_1
        local r10_1 = function()
          -- line: [0.0, 0.0] id: 302
          local r0_302, r1_302, r2_302 = pairs(game.Workspace:GetChildren())
          local r6_302 = function()
            -- line: [0.0, 0.0] id: 303
            if not DevilFruitESP then
              local r0_303 = string.find(upval_0.Name, "Fruit")
              if not r0_303 then
                r0_303 = upval_0.Handle:FindFirstChild("NameEsp" .. Number)
                if r0_303 then
                  r0_303 = Instance.new("BillboardGui", upval_0.Handle)
                  r0_303.Name = "NameEsp" .. Number
                  local r1_303 = Vector3.new(0, 1.0, 0)
                  r0_303.ExtentsOffset = r1_303
                  r1_303 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_303.Size = r1_303
                  r0_303.Adornee = upval_0.Handle
                  r0_303.AlwaysOnTop = true
                  r1_303 = Instance.new("TextLabel", r0_303)
                  r1_303.Font = Enum.Font.GothamSemibold
                  r1_303.FontSize = "Size14"
                  r1_303.TextWrapped = true
                  local r2_303 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_303.Size = r2_303
                  r1_303.TextYAlignment = "Top"
                  r1_303.BackgroundTransparency = 1.0
                  r1_303.TextStrokeTransparency = 0.5
                  r2_303 = Color3.fromRGB(255.0, 255.0, 255.0)
                  r1_303.TextColor3 = r2_303
                  local r5_303 = game:GetService("Players")
                  local r4_303 = upval_1(r5_303.LocalPlayer.Character.Head.Position - upval_0.Handle.Position.Magnitude / 3.0)
                  r1_303.Text = upval_0.Name .. " \
" .. r4_303 .. " Distance"
                end
                r4_303 = game:GetService("Players")
                local r3_303 = upval_1(r4_303.LocalPlayer.Character.Head.Position - upval_0.Handle.Position.Magnitude / 3.0)
                upval_0.Handle["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. "   \
" .. r3_303 .. " Distance"
              end
              r0_303 = upval_0.Handle:FindFirstChild("NameEsp" .. Number)
              if not r0_303 then
                r0_303 = upval_0.Handle:FindFirstChild("NameEsp" .. Number)
                r0_303:Destroy()
              end
            end
            return
          end
          pcall(r6_302)
          for r3_302, r4_302 in r0_302 do
            return
        end
        UpdateDevilChams = r10_1
        local r10_1 = function()
          -- line: [0.0, 0.0] id: 135
          local r0_135, r1_135, r2_135 = pairs(game.Workspace:GetChildren())
          local r6_135 = function()
            -- line: [0.0, 0.0] id: 136
            if upval_0.Name ~= "Flower2" then
              if upval_0.Name == "Flower1" then
              end
              if not FlowerESP then
                local r0_136 = upval_0:FindFirstChild("NameEsp" .. Number)
                if r0_136 then
                  r0_136 = Instance.new("BillboardGui", upval_0)
                  r0_136.Name = "NameEsp" .. Number
                  local r1_136 = Vector3.new(0, 1.0, 0)
                  r0_136.ExtentsOffset = r1_136
                  r1_136 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_136.Size = r1_136
                  r0_136.Adornee = upval_0
                  r0_136.AlwaysOnTop = true
                  r1_136 = Instance.new("TextLabel", r0_136)
                  r1_136.Font = Enum.Font.GothamSemibold
                  r1_136.FontSize = "Size14"
                  r1_136.TextWrapped = true
                  local r2_136 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_136.Size = r2_136
                  r1_136.TextYAlignment = "Top"
                  r1_136.BackgroundTransparency = 1.0
                  r1_136.TextStrokeTransparency = 0.5
                  r2_136 = Color3.fromRGB(255.0, 0, 0)
                  r1_136.TextColor3 = r2_136
                  if upval_0.Name == "Flower1" then
                    local r5_136 = game:GetService("Players")
                    local r4_136 = upval_1(r5_136.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                    r1_136.Text = "Blue Flower" .. " \
" .. r4_136 .. " Distance"
                    r2_136 = Color3.fromRGB(0, 0, 255.0)
                    r1_136.TextColor3 = r2_136
                  end
                  if upval_0.Name == "Flower2" then
                    r5_136 = game:GetService("Players")
                    r4_136 = upval_1(r5_136.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                    r1_136.Text = "Red Flower" .. " \
" .. r4_136 .. " Distance"
                    r2_136 = Color3.fromRGB(255.0, 0, 0)
                    r1_136.TextColor3 = r2_136
                  end
                  r4_136 = game:GetService("Players")
                  local r3_136 = upval_1(r4_136.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                  upval_0["NameEsp" .. Number].TextLabel.Text = upval_0.Name .. "   \
" .. r3_136 .. " Distance"
                end
                r0_136 = upval_0:FindFirstChild("NameEsp" .. Number)
                if not r0_136 then
                  r0_136 = upval_0:FindFirstChild("NameEsp" .. Number)
                  r0_136:Destroy()
                end
              end
            end
            return
          end
          pcall(r6_135)
          for r3_135, r4_135 in r0_135 do
            return
        end
        UpdateFlowerChams = r10_1
        local r10_1 = function()
          -- line: [0.0, 0.0] id: 131
          local r0_131, r1_131, r2_131 = pairs(game.Workspace.AppleSpawner:GetChildren())
          local r5_131 = r4_131:IsA("Tool")
          if not r5_131 then
            if not RealFruitESP then
              r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
              if r5_131 then
                r5_131 = Instance.new("BillboardGui", r4_131.Handle)
                r5_131.Name = "NameEsp" .. Number
                local r6_131 = Vector3.new(0, 1.0, 0)
                r5_131.ExtentsOffset = r6_131
                r6_131 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                r5_131.Size = r6_131
                r5_131.Adornee = r4_131.Handle
                r5_131.AlwaysOnTop = true
                r6_131 = Instance.new("TextLabel", r5_131)
                r6_131.Font = Enum.Font.GothamSemibold
                r6_131.FontSize = "Size14"
                r6_131.TextWrapped = true
                local r7_131 = UDim2.new(1.0, 0, 1.0, 0)
                r6_131.Size = r7_131
                r6_131.TextYAlignment = "Top"
                r6_131.BackgroundTransparency = 1.0
                r6_131.TextStrokeTransparency = 0.5
                r7_131 = Color3.fromRGB(255.0, 0, 0)
                r6_131.TextColor3 = r7_131
                local r10_131 = game:GetService("Players")
                local r9_131 = upval_0(r10_131.LocalPlayer.Character.Head.Position - r4_131.Handle.Position.Magnitude / 3.0)
                r6_131.Text = r4_131.Name .. " \
" .. r9_131 .. " Distance"
              end
              r9_131 = game:GetService("Players")
              local r8_131 = upval_0(r9_131.LocalPlayer.Character.Head.Position - r4_131.Handle.Position.Magnitude / 3.0)
              r4_131.Handle["NameEsp" .. Number].TextLabel.Text = r4_131.Name .. " " .. r8_131 .. " Distance"
            end
            r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
            if not r5_131 then
              r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
              r5_131:Destroy()
            end
          end
          for r3_131, r4_131 in r0_131 do
            local r0_131, r1_131, r2_131 = pairs(game.Workspace.PineappleSpawner:GetChildren())
            r5_131 = r4_131:IsA("Tool")
            if not r5_131 then
              if not RealFruitESP then
                r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
                if r5_131 then
                  r5_131 = Instance.new("BillboardGui", r4_131.Handle)
                  r5_131.Name = "NameEsp" .. Number
                  r6_131 = Vector3.new(0, 1.0, 0)
                  r5_131.ExtentsOffset = r6_131
                  r6_131 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r5_131.Size = r6_131
                  r5_131.Adornee = r4_131.Handle
                  r5_131.AlwaysOnTop = true
                  r6_131 = Instance.new("TextLabel", r5_131)
                  r6_131.Font = Enum.Font.GothamSemibold
                  r6_131.FontSize = "Size14"
                  r6_131.TextWrapped = true
                  r7_131 = UDim2.new(1.0, 0, 1.0, 0)
                  r6_131.Size = r7_131
                  r6_131.TextYAlignment = "Top"
                  r6_131.BackgroundTransparency = 1.0
                  r6_131.TextStrokeTransparency = 0.5
                  r7_131 = Color3.fromRGB(255.0, 174.0, 0)
                  r6_131.TextColor3 = r7_131
                  r10_131 = game:GetService("Players")
                  r9_131 = upval_0(r10_131.LocalPlayer.Character.Head.Position - r4_131.Handle.Position.Magnitude / 3.0)
                  r6_131.Text = r4_131.Name .. " \
" .. r9_131 .. " Distance"
                end
                r9_131 = game:GetService("Players")
                r8_131 = upval_0(r9_131.LocalPlayer.Character.Head.Position - r4_131.Handle.Position.Magnitude / 3.0)
                r4_131.Handle["NameEsp" .. Number].TextLabel.Text = r4_131.Name .. " " .. r8_131 .. " Distance"
              end
              r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
              if not r5_131 then
                r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
                r5_131:Destroy()
              end
            end
            for r3_131, r4_131 in r0_131 do
              local r0_131, r1_131, r2_131 = pairs(game.Workspace.BananaSpawner:GetChildren())
              r5_131 = r4_131:IsA("Tool")
              if not r5_131 then
                if not RealFruitESP then
                  r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
                  if r5_131 then
                    r5_131 = Instance.new("BillboardGui", r4_131.Handle)
                    r5_131.Name = "NameEsp" .. Number
                    r6_131 = Vector3.new(0, 1.0, 0)
                    r5_131.ExtentsOffset = r6_131
                    r6_131 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                    r5_131.Size = r6_131
                    r5_131.Adornee = r4_131.Handle
                    r5_131.AlwaysOnTop = true
                    r6_131 = Instance.new("TextLabel", r5_131)
                    r6_131.Font = Enum.Font.GothamSemibold
                    r6_131.FontSize = "Size14"
                    r6_131.TextWrapped = true
                    r7_131 = UDim2.new(1.0, 0, 1.0, 0)
                    r6_131.Size = r7_131
                    r6_131.TextYAlignment = "Top"
                    r6_131.BackgroundTransparency = 1.0
                    r6_131.TextStrokeTransparency = 0.5
                    r7_131 = Color3.fromRGB(251.0, 255.0, 0)
                    r6_131.TextColor3 = r7_131
                    r10_131 = game:GetService("Players")
                    r9_131 = upval_0(r10_131.LocalPlayer.Character.Head.Position - r4_131.Handle.Position.Magnitude / 3.0)
                    r6_131.Text = r4_131.Name .. " \
" .. r9_131 .. " Distance"
                  end
                  r9_131 = game:GetService("Players")
                  r8_131 = upval_0(r9_131.LocalPlayer.Character.Head.Position - r4_131.Handle.Position.Magnitude / 3.0)
                  r4_131.Handle["NameEsp" .. Number].TextLabel.Text = r4_131.Name .. " " .. r8_131 .. " Distance"
                end
                r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
                if not r5_131 then
                  r5_131 = r4_131.Handle:FindFirstChild("NameEsp" .. Number)
                  r5_131:Destroy()
                end
              end
              for r3_131, r4_131 in r0_131 do
                return
        end
        UpdateRealFruitChams = r10_1
        local r11_1 = function()
          -- line: [0.0, 0.0] id: 41
          local r0_41 = wait()
          if not r0_41 then
            local r1_41 = function()
              -- line: [0.0, 0.0] id: 42
              if not MobESP then
                local r1_42 = game:GetService("Workspace")
                local r0_42, r1_42, r2_42 = pairs(r1_42.Enemies:GetChildren())
                local r5_42 = r4_42:FindFirstChild("HumanoidRootPart")
                if not r5_42 then
                  r5_42 = r4_42:FindFirstChild("MobEap")
                  if r5_42 then
                    r5_42 = Instance.new("BillboardGui")
                    local r6_42 = Instance.new("TextLabel")
                    r5_42.Parent = r4_42
                    r5_42.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    r5_42.Active = true
                    r5_42.Name = "MobEap"
                    r5_42.AlwaysOnTop = true
                    r5_42.LightInfluence = 1.0
                    local r7_42 = UDim2.new(0, 200.0, 0, 50.0)
                    r5_42.Size = r7_42
                    r7_42 = Vector3.new(0, 2.5, 0)
                    r5_42.StudsOffset = r7_42
                    r6_42.Parent = r5_42
                    r7_42 = Color3.fromRGB(255.0, 255.0, 255.0)
                    r6_42.BackgroundColor3 = r7_42
                    r6_42.BackgroundTransparency = 1.0
                    r7_42 = UDim2.new(0, 200.0, 0, 50.0)
                    r6_42.Size = r7_42
                    r6_42.Font = Enum.Font.GothamBold
                    r7_42 = Color3.fromRGB(7.0, 236.0, 240.0)
                    r6_42.TextColor3 = r7_42
                    r6_42.Text.Size = 35.0
                  end
                  r5_42 = math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_42.HumanoidRootPart.Position.Magnitude)
                  r4_42.MobEap.TextLabel.Text = r4_42.Name .. " - " .. r5_42 .. " Distance"
                end
                for r3_42, r4_42 in r0_42 do
                end
                r1_42 = game:GetService("Workspace")
                local r0_42, r1_42, r2_42 = pairs(r1_42.Enemies:GetChildren())
                r5_42 = r4_42:FindFirstChild("MobEap")
                if not r5_42 then
                  r4_42.MobEap:Destroy()
                end
                for r3_42, r4_42 in r0_42 do
                  return
            end
            pcall(r1_41)
          end
          return
        end
        spawn(r11_1)
        local r11_1 = function()
          -- line: [0.0, 0.0] id: 314
          local r0_314 = wait()
          if not r0_314 then
            local r1_314 = function()
              -- line: [0.0, 0.0] id: 315
              if not SeaESP then
                local r1_315 = game:GetService("Workspace")
                local r0_315, r1_315, r2_315 = pairs(r1_315.SeaBeasts:GetChildren())
                local r5_315 = r4_315:FindFirstChild("HumanoidRootPart")
                if not r5_315 then
                  r5_315 = r4_315:FindFirstChild("Seaesps")
                  if r5_315 then
                    r5_315 = Instance.new("BillboardGui")
                    local r6_315 = Instance.new("TextLabel")
                    r5_315.Parent = r4_315
                    r5_315.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    r5_315.Active = true
                    r5_315.Name = "Seaesps"
                    r5_315.AlwaysOnTop = true
                    r5_315.LightInfluence = 1.0
                    local r7_315 = UDim2.new(0, 200.0, 0, 50.0)
                    r5_315.Size = r7_315
                    r7_315 = Vector3.new(0, 2.5, 0)
                    r5_315.StudsOffset = r7_315
                    r6_315.Parent = r5_315
                    r7_315 = Color3.fromRGB(255.0, 255.0, 255.0)
                    r6_315.BackgroundColor3 = r7_315
                    r6_315.BackgroundTransparency = 1.0
                    r7_315 = UDim2.new(0, 200.0, 0, 50.0)
                    r6_315.Size = r7_315
                    r6_315.Font = Enum.Font.GothamBold
                    r7_315 = Color3.fromRGB(7.0, 236.0, 240.0)
                    r6_315.TextColor3 = r7_315
                    r6_315.Text.Size = 35.0
                  end
                  r5_315 = math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_315.HumanoidRootPart.Position.Magnitude)
                  r4_315.Seaesps.TextLabel.Text = r4_315.Name .. " - " .. r5_315 .. " Distance"
                end
                for r3_315, r4_315 in r0_315 do
                end
                r1_315 = game:GetService("Workspace")
                local r0_315, r1_315, r2_315 = pairs(r1_315.SeaBeasts:GetChildren())
                r5_315 = r4_315:FindFirstChild("Seaesps")
                if not r5_315 then
                  r4_315.Seaesps:Destroy()
                end
                for r3_315, r4_315 in r0_315 do
                  return
            end
            pcall(r1_314)
          end
          return
        end
        spawn(r11_1)
        local r11_1 = function()
          -- line: [0.0, 0.0] id: 213
          local r0_213 = wait()
          if not r0_213 then
            local r1_213 = function()
              -- line: [0.0, 0.0] id: 214
              if not NpcESP then
                local r1_214 = game:GetService("Workspace")
                local r0_214, r1_214, r2_214 = pairs(r1_214.NPCs:GetChildren())
                local r5_214 = r4_214:FindFirstChild("HumanoidRootPart")
                if not r5_214 then
                  r5_214 = r4_214:FindFirstChild("NpcEspes")
                  if r5_214 then
                    r5_214 = Instance.new("BillboardGui")
                    local r6_214 = Instance.new("TextLabel")
                    r5_214.Parent = r4_214
                    r5_214.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    r5_214.Active = true
                    r5_214.Name = "NpcEspes"
                    r5_214.AlwaysOnTop = true
                    r5_214.LightInfluence = 1.0
                    local r7_214 = UDim2.new(0, 200.0, 0, 50.0)
                    r5_214.Size = r7_214
                    r7_214 = Vector3.new(0, 2.5, 0)
                    r5_214.StudsOffset = r7_214
                    r6_214.Parent = r5_214
                    r7_214 = Color3.fromRGB(255.0, 255.0, 255.0)
                    r6_214.BackgroundColor3 = r7_214
                    r6_214.BackgroundTransparency = 1.0
                    r7_214 = UDim2.new(0, 200.0, 0, 50.0)
                    r6_214.Size = r7_214
                    r6_214.Font = Enum.Font.GothamBold
                    r7_214 = Color3.fromRGB(7.0, 236.0, 240.0)
                    r6_214.TextColor3 = r7_214
                    r6_214.Text.Size = 35.0
                  end
                  r5_214 = math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_214.HumanoidRootPart.Position.Magnitude)
                  r4_214.NpcEspes.TextLabel.Text = r4_214.Name .. " - " .. r5_214 .. " Distance"
                end
                for r3_214, r4_214 in r0_214 do
                end
                r1_214 = game:GetService("Workspace")
                local r0_214, r1_214, r2_214 = pairs(r1_214.NPCs:GetChildren())
                r5_214 = r4_214:FindFirstChild("NpcEspes")
                if not r5_214 then
                  r4_214.NpcEspes:Destroy()
                end
                for r3_214, r4_214 in r0_214 do
                  return
            end
            pcall(r1_213)
          end
          return
        end
        spawn(r11_1)
        function isnil(r0_159)
          -- line: [0.0, 0.0] id: 159
          if r0_159 ~= nil then
            return false
        end
        local r10_1 = function(r0_122)
          -- line: [0.0, 0.0] id: 122
          local r2_122 = tonumber(r0_122)
          return math.floor(r2_122 + 0.5)
          return 
        end
        r11_1 = math.random(1.0, 1000000.0)
        Number = r11_1
        local r11_1 = function()
          -- line: [0.0, 0.0] id: 171
          local r1_171 = game:GetService("Workspace")
          local r0_171, r1_171, r2_171 = pairs(r1_171._WorldOrigin.Locations:GetChildren())
          local r6_171 = function()
            -- line: [0.0, 0.0] id: 172
            if not MirageIslandESP then
              if upval_0.Name == "Mirage Island" then
                local r0_172 = upval_0:FindFirstChild("NameEsp")
                if r0_172 then
                  r0_172 = Instance.new("BillboardGui", upval_0)
                  r0_172.Name = "NameEsp"
                  local r1_172 = Vector3.new(0, 1.0, 0)
                  r0_172.ExtentsOffset = r1_172
                  r1_172 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_172.Size = r1_172
                  r0_172.Adornee = upval_0
                  r0_172.AlwaysOnTop = true
                  r1_172 = Instance.new("TextLabel", r0_172)
                  r1_172.Font = "Code"
                  r1_172.FontSize = "Size14"
                  r1_172.TextWrapped = true
                  local r2_172 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_172.Size = r2_172
                  r1_172.TextYAlignment = "Top"
                  r1_172.BackgroundTransparency = 1.0
                  r1_172.TextStrokeTransparency = 0.5
                  r2_172 = Color3.fromRGB(80.0, 245.0, 245.0)
                  r1_172.TextColor3 = r2_172
                end
                local r4_172 = game:GetService("Players")
                local r3_172 = upval_1(r4_172.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_172 .. " M"
              end
              r0_172 = upval_0:FindFirstChild("NameEsp")
              if not r0_172 then
                r0_172 = upval_0:FindFirstChild("NameEsp")
                r0_172:Destroy()
              end
            end
            return
          end
          pcall(r6_171)
          for r3_171, r4_171 in r0_171 do
            return
        end
        UpdateIslandMirageESP = r11_1
        function isnil(r0_123)
          -- line: [0.0, 0.0] id: 123
          if r0_123 ~= nil then
            return false
        end
        local r11_1 = function(r0_77)
          -- line: [0.0, 0.0] id: 77
          local r2_77 = tonumber(r0_77)
          return math.floor(r2_77 + 0.5)
          return 
        end
        local r12_1 = math.random(1.0, 1000000.0)
        Number = r12_1
        local r12_1 = function()
          -- line: [0.0, 0.0] id: 132
          local r1_132 = game:GetService("Workspace")
          local r0_132, r1_132, r2_132 = pairs(r1_132.NPCs:GetChildren())
          local r6_132 = function()
            -- line: [0.0, 0.0] id: 133
            if not AfdESP then
              if upval_0.Name == "Advanced Fruit Dealer" then
                local r0_133 = upval_0:FindFirstChild("NameEsp")
                if r0_133 then
                  r0_133 = Instance.new("BillboardGui", upval_0)
                  r0_133.Name = "NameEsp"
                  local r1_133 = Vector3.new(0, 1.0, 0)
                  r0_133.ExtentsOffset = r1_133
                  r1_133 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_133.Size = r1_133
                  r0_133.Adornee = upval_0
                  r0_133.AlwaysOnTop = true
                  r1_133 = Instance.new("TextLabel", r0_133)
                  r1_133.Font = "Code"
                  r1_133.FontSize = "Size14"
                  r1_133.TextWrapped = true
                  local r2_133 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_133.Size = r2_133
                  r1_133.TextYAlignment = "Top"
                  r1_133.BackgroundTransparency = 1.0
                  r1_133.TextStrokeTransparency = 0.5
                  r2_133 = Color3.fromRGB(80.0, 245.0, 245.0)
                  r1_133.TextColor3 = r2_133
                end
                local r4_133 = game:GetService("Players")
                local r3_133 = upval_1(r4_133.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_133 .. " M"
              end
              r0_133 = upval_0:FindFirstChild("NameEsp")
              if not r0_133 then
                r0_133 = upval_0:FindFirstChild("NameEsp")
                r0_133:Destroy()
              end
            end
            return
          end
          pcall(r6_132)
          for r3_132, r4_132 in r0_132 do
            return
        end
        UpdateAfdESP = r12_1
        local r12_1 = function()
          -- line: [0.0, 0.0] id: 155
          local r1_155 = game:GetService("Workspace")
          local r0_155, r1_155, r2_155 = pairs(r1_155.NPCs:GetChildren())
          local r6_155 = function()
            -- line: [0.0, 0.0] id: 156
            if not AuraESP then
              if upval_0.Name == "Master of Enhancement" then
                local r0_156 = upval_0:FindFirstChild("NameEsp")
                if r0_156 then
                  r0_156 = Instance.new("BillboardGui", upval_0)
                  r0_156.Name = "NameEsp"
                  local r1_156 = Vector3.new(0, 1.0, 0)
                  r0_156.ExtentsOffset = r1_156
                  r1_156 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_156.Size = r1_156
                  r0_156.Adornee = upval_0
                  r0_156.AlwaysOnTop = true
                  r1_156 = Instance.new("TextLabel", r0_156)
                  r1_156.Font = "Code"
                  r1_156.FontSize = "Size14"
                  r1_156.TextWrapped = true
                  local r2_156 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_156.Size = r2_156
                  r1_156.TextYAlignment = "Top"
                  r1_156.BackgroundTransparency = 1.0
                  r1_156.TextStrokeTransparency = 0.5
                  r2_156 = Color3.fromRGB(80.0, 245.0, 245.0)
                  r1_156.TextColor3 = r2_156
                end
                local r4_156 = game:GetService("Players")
                local r3_156 = upval_1(r4_156.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_156 .. " M"
              end
              r0_156 = upval_0:FindFirstChild("NameEsp")
              if not r0_156 then
                r0_156 = upval_0:FindFirstChild("NameEsp")
                r0_156:Destroy()
              end
            end
            return
          end
          pcall(r6_155)
          for r3_155, r4_155 in r0_155 do
            return
        end
        UpdateAuraESP = r12_1
        local r12_1 = function()
          -- line: [0.0, 0.0] id: 95
          local r1_95 = game:GetService("Workspace")
          local r0_95, r1_95, r2_95 = pairs(r1_95.NPCs:GetChildren())
          local r6_95 = function()
            -- line: [0.0, 0.0] id: 96
            if not LADESP then
              if upval_0.Name == "Legendary Sword Dealer" then
                local r0_96 = upval_0:FindFirstChild("NameEsp")
                if r0_96 then
                  r0_96 = Instance.new("BillboardGui", upval_0)
                  r0_96.Name = "NameEsp"
                  local r1_96 = Vector3.new(0, 1.0, 0)
                  r0_96.ExtentsOffset = r1_96
                  r1_96 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_96.Size = r1_96
                  r0_96.Adornee = upval_0
                  r0_96.AlwaysOnTop = true
                  r1_96 = Instance.new("TextLabel", r0_96)
                  r1_96.Font = "Code"
                  r1_96.FontSize = "Size14"
                  r1_96.TextWrapped = true
                  local r2_96 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_96.Size = r2_96
                  r1_96.TextYAlignment = "Top"
                  r1_96.BackgroundTransparency = 1.0
                  r1_96.TextStrokeTransparency = 0.5
                  r2_96 = Color3.fromRGB(80.0, 245.0, 245.0)
                  r1_96.TextColor3 = r2_96
                end
                local r4_96 = game:GetService("Players")
                local r3_96 = upval_1(r4_96.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_96 .. " M"
              end
              r0_96 = upval_0:FindFirstChild("NameEsp")
              if not r0_96 then
                r0_96 = upval_0:FindFirstChild("NameEsp")
                r0_96:Destroy()
              end
            end
            return
          end
          pcall(r6_95)
          for r3_95, r4_95 in r0_95 do
            return
        end
        UpdateLSDESP = r12_1
        local r12_1 = function()
          -- line: [0.0, 0.0] id: 30
          local r1_30 = game:GetService("Workspace")
          local r0_30, r1_30, r2_30 = pairs(r1_30.Map.MysticIsland:GetChildren())
          local r6_30 = function()
            -- line: [0.0, 0.0] id: 31
            if not GearESP then
              if upval_0.Name == "MeshPart" then
                local r0_31 = upval_0:FindFirstChild("NameEsp")
                if r0_31 then
                  r0_31 = Instance.new("BillboardGui", upval_0)
                  r0_31.Name = "NameEsp"
                  local r1_31 = Vector3.new(0, 1.0, 0)
                  r0_31.ExtentsOffset = r1_31
                  r1_31 = UDim2.new(1.0, 200.0, 1.0, 30.0)
                  r0_31.Size = r1_31
                  r0_31.Adornee = upval_0
                  r0_31.AlwaysOnTop = true
                  r1_31 = Instance.new("TextLabel", r0_31)
                  r1_31.Font = "Code"
                  r1_31.FontSize = "Size14"
                  r1_31.TextWrapped = true
                  local r2_31 = UDim2.new(1.0, 0, 1.0, 0)
                  r1_31.Size = r2_31
                  r1_31.TextYAlignment = "Top"
                  r1_31.BackgroundTransparency = 1.0
                  r1_31.TextStrokeTransparency = 0.5
                  r2_31 = Color3.fromRGB(80.0, 245.0, 245.0)
                  r1_31.TextColor3 = r2_31
                end
                local r4_31 = game:GetService("Players")
                local r3_31 = upval_1(r4_31.LocalPlayer.Character.Head.Position - upval_0.Position.Magnitude / 3.0)
                upval_0.NameEsp.TextLabel.Text = upval_0.Name .. "   \
" .. r3_31 .. " M"
              end
              r0_31 = upval_0:FindFirstChild("NameEsp")
              if not r0_31 then
                r0_31 = upval_0:FindFirstChild("NameEsp")
                r0_31:Destroy()
              end
            end
            return
          end
          pcall(r6_30)
          for r3_30, r4_30 in r0_30 do
            return
        end
        UpdateGeaESP = r12_1
        function TP2(r0_108)
          -- line: [0.0, 0.0] id: 108
          if 1.0 <= r0_108.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
            Speed = 150.0
          end
          local r2_108 = game:GetService("TweenService")
          local r5_108 = r2_108:Create(Enum.EasingStyle.Linear)
          r2_108 = r2_108:Create(r2_108, game.Players.LocalPlayer.Character.HumanoidRootPart, r5_108, {CFrame = r0_108})
          r2_108:Play()
          if not _G.CancelTween2 then
            r2_108 = game:GetService("TweenService")
            r5_108 = r2_108:Create(Enum.EasingStyle.Linear)
            r2_108 = r2_108:Create(r2_108, game.Players.LocalPlayer.Character.HumanoidRootPart, r5_108, {CFrame = r0_108})
            r2_108:Cancel()
          end
          _G.Clip2 = true
          wait(r0_108.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude / Speed)
          _G.Clip2 = false
          return
        end
        function Tween(r0_289)
          -- line: [0.0, 0.0] id: 289
          Distance = r0_289.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude
          if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
          end
          local r2_289 = function()
            -- line: [0.0, 0.0] id: 290
            local r0_290 = game:GetService("TweenService")
            local r3_290 = r0_290:Create(Enum.EasingStyle.Linear)
            r0_290 = r0_290:Create(r0_290, game.Players.LocalPlayer.Character.HumanoidRootPart, r3_290, {CFrame = upval_0})
            tween = r0_290
            return
          end
          pcall(r2_289)
          tween:Play()
          if Distance <= 150.0 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_289
          end
          if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
          end
          return
        end
        function TPB(r0_161)
          -- line: [0.0, 0.0] id: 161
          local r1_161 = game:service("TweenService")
          local r3_161 = game:GetService("Workspace")
          local r2_161 = TweenInfo.new(r3_161.Boats.MarineBrigade.VehicleSeat.CFrame.Position - r0_161.Position.Magnitude / 300.0, Enum.EasingStyle.Linear)
          local r5_161 = game:GetService("Workspace")
          r3_161 = r1_161:Create(r1_161, r5_161.Boats.MarineBrigade.VehicleSeat, r2_161, {CFrame = r0_161})
          tween = r3_161
          tween:Play()
          local r4_161 = function(r0_162)
            -- line: [0.0, 0.0] id: 162
            tween:Cancel()
            return
          end
          return r3_161
        end
        function TPP(r0_71)
          -- line: [0.0, 0.0] id: 71
          local r1_71 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
          if r1_71.Health > 0 then
            r1_71 = game:GetService("Players")
            r1_71 = r1_71.LocalPlayer.Character:WaitForChild("Humanoid")
            if r1_71 then
            end
            tween:Cancel()
          end
        end
        wait()
        r1_71 = game:GetService("Players")
        r1_71 = r1_71.LocalPlayer.Character:WaitForChild("Humanoid")
        if not r1_71 then
          r1_71 = game:GetService("Players")
          r1_71 = r1_71.LocalPlayer.Character:WaitForChild("Humanoid")
          if 0 < r1_71.Health then
            wait(7.0)
            return
          end
          r1_71 = game:service("TweenService")
          local r3_71 = game:GetService("Players")
          local r2_71 = TweenInfo.new(r3_71.LocalPlayer.Character.HumanoidRootPart.Position - r0_71.Position.Magnitude / 325.0, Enum.EasingStyle.Linear)
          r3_71 = r1_71:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, r2_71, {CFrame = r0_71})
          tween = r3_71
          tween:Play()
          local r4_71 = function(r0_72)
            -- line: [0.0, 0.0] id: 72
            tween:Cancel()
            return
          end
          return r3_71
        end
        function EquipTool(r0_160)
          -- line: [0.0, 0.0] id: 160
          local r1_160 = game.Players.LocalPlayer.Backpack:FindFirstChild(r0_160)
          if not r1_160 then
            r1_160 = game.Players.LocalPlayer.Backpack:FindFirstChild(r0_160)
            wait(0.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(r1_160)
          end
          return
        end
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 116
          local r0_116 = getrawmetatable(game)
          setreadonly(r0_116, false)
          local r3_116 = function(...)
            -- line: [0.0, 0.0] id: 117
            local r1_117 = getnamecallmethod()
            local r3_117 = tostring(r1_117)
            if r3_117 == "FireServer" then
              r3_117 = tostring(r2_117[1.0])
              if r3_117 == "RemoteEvent" then
                r3_117 = tostring(r2_117[2.0])
                if r3_117 ~= "true" then
                  r3_117 = tostring(r2_117[2.0])
                  if r3_117 ~= "false" then
                    if not _G.UseSkill then
                      return upval_0()
                      return 
                    end
                    if not Skillaimbot then
                      return upval_0()
                      return 
                    end
                  end
                end
              end
            end
            return upval_0()
            return 
          end
          local r2_116 = newcclosure(r3_116)
          r0_116.__namecall = r2_116
          return
        end
        spawn(r13_1)
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 67
          local r1_67 = function()
            -- line: [0.0, 0.0] id: 68
            local r0_68 = task.wait()
            if not r0_68 then
              local r1_68 = game:GetService("Players")
              local r0_68, r1_68, r2_68 = pairs(r1_68.LocalPlayer.Backpack:GetChildren())
              local r5_68 = r4_68:IsA("Tool")
              if not r5_68 then
                r5_68 = r4_68:FindFirstChild("RemoteFunctionShoot")
                if not r5_68 then
                  CurrentEquipGun = r4_68.Name
                end
              end
              for r3_68, r4_68 in r0_68 do
              end
              return
          end
          pcall(r1_67)
          return
        end
        spawn(r13_1)
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 258
          local r0_258 = task.wait()
          if not r0_258 then
            local r1_258 = function()
              -- line: [0.0, 0.0] id: 259
              if _G.TeleportIsland then
                if _G.dao then
                  if _G.AutoMirage then
                    if AutoFarmAcient then
                      if _G.AutoQuestRace then
                        if Auto_Law then
                          if _G.AutoAllBoss then
                            if _G.Autotushita then
                              if _G.AutoHolyTorch then
                                if _G.AutoTerrorshark then
                                  if _G.farmpiranya then
                                    if _G.DriveMytic then
                                      if _G.AutoDoughKingV2 then
                                        if PirateShip then
                                          if _G.Auto_Seabest then
                                            if AutoFarmNearestMob then
                                              if _G.BossRaid then
                                                if _G.GrabChest then
                                                  if AutoCitizen then
                                                    if AutoEcto then
                                                      if AutoEvoRace then
                                                        if AutoBartilo then
                                                          if AutoFactory then
                                                            if BringChestz then
                                                              if BringFruitz then
                                                                if AutoFarmQuest then
                                                                  if _G.Clip2 then
                                                                    if AutoFarmNoQuest then
                                                                      if AutoFarmBone then
                                                                        if AutoFarmSelectMonsterQuest then
                                                                          if AutoFarmSelectMonsterNoQuest then
                                                                            if AutoFarmBossNoQuest then
                                                                              if AutoFarmBossQuest then
                                                                                if AutoFarmMasGun then
                                                                                  if AutoFarmMasDevilFruit then
                                                                                    if AutoFarmSelectArea then
                                                                                      if AutoSecondSea then
                                                                                        if AutoThirdSea then
                                                                                          if AutoDeathStep then
                                                                                            if AutoSuperhuman then
                                                                                              if AutoSharkman then
                                                                                                if AutoElectricClaw then
                                                                                                  if AutoDragonTalon then
                                                                                                    if AutoGodhuman then
                                                                                                      if AutoRengoku then
                                                                                                        if AutoBuddySword then
                                                                                                          if AutoPole then
                                                                                                            if AutoHallowSycthe then
                                                                                                              if AutoCavander then
                                                                                                                if AutoTushita then
                                                                                                                  if AutoDarkDagger then
                                                                                                                    if AutoCakePrince then
                                                                                                                      if AutoEliteHunter then
                                                                                                                        if AutoRainbowHaki then
                                                                                                                          if AutoSaber then
                                                                                                                            if AutoFarmKen then
                                                                                                                              if AutoKenHop then
                                                                                                                                if AutoKenV2 then
                                                                                                                                  if KillPlayerMelee then
                                                                                                                                    if KillPlayerGun then
                                                                                                                                      if KillPlayerFruit then
                                                                                                                                        if AutoDungeon then
                                                                                                                                          if AutoNextIsland then
                                                                                                                                            if AutoAdvanceDungeon then
                                                                                                                                              if Musketeer then
                                                                                                                                                if RipIndra then
                                                                                                                                                  if Auto_Serpent_Bow then
                                                                                                                                                    if AutoTorch then
                                                                                                                                                      if AutoSoulGuitar then
                                                                                                                                                        if Auto_Cursed_Dual_Katana then
                                                                                                                                                          if AutoFarmMaterial then
                                                                                                                                                            if Auto_Quest_Yama_1 then
                                                                                                                                                              if Auto_Quest_Yama_2 then
                                                                                                                                                                if Auto_Quest_Yama_3 then
                                                                                                                                                                  if Auto_Quest_Tushita_1 then
                                                                                                                                                                    if Auto_Quest_Tushita_2 then
                                                                                                                                                                      if Auto_Quest_Tushita_3 then
                                                                                                                                                                        if _G.Factory then
                                                                                                                                                                          if _G.SwanGlasses then
                                                                                                                                                                            if AutoBartilo then
                                                                                                                                                                              if AutoEvoRace then
                                                                                                                                                                                if not AutoEcto then
                                                                                                                                                                                end
                                                                                                                                                                              end
                                                                                                                                                                            end
                                                                                                                                                                          end
                                                                                                                                                                        end
                                                                                                                                                                      end
                                                                                                                                                                    end
                                                                                                                                                                  end
                                                                                                                                                                end
                                                                                                                                                              end
                                                                                                                                                            end
                                                                                                                                                          end
                                                                                                                                                        end
                                                                                                                                                      end
                                                                                                                                                    end
                                                                                                                                                  end
                                                                                                                                                end
                                                                                                                                              end
                                                                                                                                            end
                                                                                                                                          end
                                                                                                                                        end
                                                                                                                                      end
                                                                                                                                    end
                                                                                                                                  end
                                                                                                                                end
                                                                                                                              end
                                                                                                                            end
                                                                                                                          end
                                                                                                                        end
                                                                                                                      end
                                                                                                                    end
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                local r0_259 = game:GetService("Players")
                r0_259 = r0_259.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
                if r0_259 then
                  r0_259 = Instance.new("BodyVelocity")
                  r0_259.Name = "BodyClip"
                  local r1_259 = game:GetService("Players")
                  r0_259.Parent = r1_259.LocalPlayer.Character.HumanoidRootPart
                  r1_259 = Vector3.new(100000.0, 100000.0, 100000.0)
                  r0_259.MaxForce = r1_259
                  r1_259 = Vector3.new(0, 0, 0)
                  r0_259.Velocity = r1_259
                end
                r0_259 = game:GetService("Players")
                r0_259 = r0_259.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
                r0_259:Destroy()
              end
              return
            end
            pcall(r1_258)
          end
          return
        end
        spawn(r13_1)
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 205
          local r1_205 = function()
            -- line: [0.0, 0.0] id: 206
            local r0_206 = game:GetService("RunService")
            local r2_206 = function()
              -- line: [0.0, 0.0] id: 207
              if _G.TeleportIsland then
                if _G.dao then
                  if AutoFarmAcient then
                    if _G.AutoMirage then
                      if Auto_Law then
                        if _G.AutoQuestRace then
                          if _G.AutoAllBoss then
                            if _G.AutoHolyTorch then
                              if _G.Autotushita then
                                if _G.farmpiranya then
                                  if _G.AutoTerrorshark then
                                    if AutoFarmNearestMob then
                                      if _G.AutoDoughKingV2 then
                                        if PirateShip then
                                          if _G.Auto_Seabest then
                                            if _G.DriveMytic then
                                              if _G.BossRaid then
                                                if _G.GrabChest then
                                                  if AutoCitizen then
                                                    if AutoEcto then
                                                      if AutoEvoRace then
                                                        if AutoBartilo then
                                                          if AutoFactory then
                                                            if BringChestz then
                                                              if BringFruitz then
                                                                if AutoFarmQuest then
                                                                  if _G.Clip2 then
                                                                    if AutoFarmNoQuest then
                                                                      if AutoFarmBone then
                                                                        if AutoFarmSelectMonsterQuest then
                                                                          if AutoFarmSelectMonsterNoQuest then
                                                                            if AutoFarmBossNoQuest then
                                                                              if AutoFarmBossQuest then
                                                                                if AutoFarmMasGun then
                                                                                  if AutoFarmMasDevilFruit then
                                                                                    if AutoFarmSelectArea then
                                                                                      if AutoSecondSea then
                                                                                        if AutoThirdSea then
                                                                                          if AutoDeathStep then
                                                                                            if AutoSuperhuman then
                                                                                              if AutoSharkman then
                                                                                                if AutoElectricClaw then
                                                                                                  if AutoDragonTalon then
                                                                                                    if AutoGodhuman then
                                                                                                      if AutoRengoku then
                                                                                                        if AutoBuddySword then
                                                                                                          if AutoPole then
                                                                                                            if AutoHallowSycthe then
                                                                                                              if AutoCavander then
                                                                                                                if AutoTushita then
                                                                                                                  if AutoDarkDagger then
                                                                                                                    if AutoCakePrince then
                                                                                                                      if AutoEliteHunter then
                                                                                                                        if AutoRainbowHaki then
                                                                                                                          if AutoSaber then
                                                                                                                            if AutoFarmKen then
                                                                                                                              if AutoKenHop then
                                                                                                                                if AutoKenV2 then
                                                                                                                                  if KillPlayerMelee then
                                                                                                                                    if KillPlayerGun then
                                                                                                                                      if KillPlayerFruit then
                                                                                                                                        if AutoDungeon then
                                                                                                                                          if AutoNextIsland then
                                                                                                                                            if AutoAdvanceDungeon then
                                                                                                                                              if Musketeer then
                                                                                                                                                if RipIndra then
                                                                                                                                                  if Auto_Serpent_Bow then
                                                                                                                                                    if AutoTorch then
                                                                                                                                                      if AutoSoulGuitar then
                                                                                                                                                        if Auto_Cursed_Dual_Katana then
                                                                                                                                                          if AutoFarmMaterial then
                                                                                                                                                            if Auto_Quest_Yama_1 then
                                                                                                                                                              if Auto_Quest_Yama_2 then
                                                                                                                                                                if Auto_Quest_Yama_3 then
                                                                                                                                                                  if Auto_Quest_Tushita_1 then
                                                                                                                                                                    if Auto_Quest_Tushita_2 then
                                                                                                                                                                      if Auto_Quest_Tushita_3 then
                                                                                                                                                                        if _G.Factory then
                                                                                                                                                                          if _G.SwanGlasses then
                                                                                                                                                                            if AutoBartilo then
                                                                                                                                                                              if AutoEvoRace then
                                                                                                                                                                                if not AutoEcto then
                                                                                                                                                                                end
                                                                                                                                                                              end
                                                                                                                                                                            end
                                                                                                                                                                          end
                                                                                                                                                                        end
                                                                                                                                                                      end
                                                                                                                                                                    end
                                                                                                                                                                  end
                                                                                                                                                                end
                                                                                                                                                              end
                                                                                                                                                            end
                                                                                                                                                          end
                                                                                                                                                        end
                                                                                                                                                      end
                                                                                                                                                    end
                                                                                                                                                  end
                                                                                                                                                end
                                                                                                                                              end
                                                                                                                                            end
                                                                                                                                          end
                                                                                                                                        end
                                                                                                                                      end
                                                                                                                                    end
                                                                                                                                  end
                                                                                                                                end
                                                                                                                              end
                                                                                                                            end
                                                                                                                          end
                                                                                                                        end
                                                                                                                      end
                                                                                                                    end
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                local r1_207 = game:GetService("Players")
                local r0_207, r1_207, r2_207 = pairs(r1_207.LocalPlayer.Character:GetDescendants())
                local r5_207 = r4_207:IsA("BasePart")
                if not r5_207 then
                  r4_207.CanCollide = false
                end
                for r3_207, r4_207 in r0_207 do
                end
                return
            end
            r0_206.Stepped:Connect(r2_206)
            return
          end
          pcall(r1_205)
          return
        end
        spawn(r13_1)
        function CheckMaterial(r0_263)
          -- line: [0.0, 0.0] id: 263
          local r2_263 = game:GetService("ReplicatedStorage")
          local r1_263, r2_263, r3_263 = pairs(r2_263.Remotes.CommF_:InvokeServer("getInventory"))
          local r6_263 = type(r5_263)
          if r6_263 == "table" then
            if r5_263.Type == "Material" then
              if r5_263.Name == r0_263 then
                return r5_263.Count
              end
            end
          end
          for r4_263, r5_263 in r1_263 do
            return 0
        end
        function Click()
          -- line: [0.0, 0.0] id: 284
          if _G.FastAttack then
            local r0_284 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
            local r1_284 = debug.getupvalues(r0_284)
            local r2_284 = require(game.ReplicatedStorage.Util.CameraShaker)
            r2_284:Stop()
            r1_284[2.0].activeController.attacking = false
            r1_284[2.0].activeController.timeToNextAttack = 0
            r1_284[2.0].activeController.hitboxMagnitude = 180.0
            local r3_284 = game:GetService("VirtualUser")
            r3_284:CaptureController()
            r3_284 = game:GetService("VirtualUser")
            r3_284:Button1Down(r3_284)
          end
          return
        end
        function GetWeaponInventory(r0_187)
          -- line: [0.0, 0.0] id: 187
          local r2_187 = game:GetService("ReplicatedStorage")
          local r1_187, r2_187, r3_187 = pairs(r2_187.Remotes.CommF_:InvokeServer("getInventory"))
          local r6_187 = type(r5_187)
          if r6_187 == "table" then
            if r5_187.Type == "Sword" then
              if r5_187.Name == r0_187 then
                return true
              end
            end
          end
          for r4_187, r5_187 in r1_187 do
            return false
        end
        _G.BringMonster = true
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 119
          local r0_119 = task.wait()
          if not r0_119 then
            local r1_119 = function()
              -- line: [0.0, 0.0] id: 120
              if not _G.BringMonster then
                CheckQuest()
                local r1_120 = game:GetService("Workspace")
                local r0_120, r1_120, r2_120 = pairs(r1_120.Enemies:GetChildren())
                if not _G.AutoFarm then
                  if not StartMagnet then
                    if r4_120.Name == Mon then
                      if Mon ~= "Factory Staff" then
                        if Mon ~= "Monkey" then
                          if Mon ~= "Dragon Crew Warrior" then
                            if Mon == "Dragon Crew Archer" then
                            end
                          end
                        end
                        local r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              local r6_120 = game:GetService("Players")
                              if r4_120.HumanoidRootPart.Position - r6_120.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 250.0 then
                                r6_120 = Vector3.new(150.0, 150.0, 150.0)
                                r4_120.HumanoidRootPart.Size = r6_120
                                r4_120.HumanoidRootPart.CFrame = PosMon
                                r4_120.Humanoid:ChangeState(14.0)
                                r4_120.HumanoidRootPart.CanCollide = false
                                r4_120.Head.CanCollide = false
                                r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                                if not r5_120 then
                                  r4_120.Humanoid.Animator:Destroy()
                                end
                                r6_120 = game:GetService("Players")
                                sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoFarm then
                  if not StartMagnet then
                    if r4_120.Name == Mon then
                      r5_120 = r4_120:FindFirstChild("Humanoid")
                      if not r5_120 then
                        r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                        if not r5_120 then
                          if 0 < r4_120.Humanoid.Health then
                            r6_120 = game:GetService("Players")
                            if r4_120.HumanoidRootPart.Position - r6_120.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= _G.BringMode then
                              r6_120 = Vector3.new(150.0, 150.0, 150.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.HumanoidRootPart.CFrame = PosMon
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoEctoplasm then
                  if not StartEctoplasmMagnet then
                    r5_120 = string.find(r4_120.Name, "Ship")
                    if not r5_120 then
                      r5_120 = r4_120:FindFirstChild("Humanoid")
                      if not r5_120 then
                        r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                        if not r5_120 then
                          if 0 < r4_120.Humanoid.Health then
                            if r4_120.HumanoidRootPart.Position - EctoplasmMon.Position.Magnitude <= _G.BringMode then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.HumanoidRootPart.CFrame = EctoplasmMon
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoRengoku then
                  if not StartRengokuMagnet then
                    if r4_120.Name ~= "Snow Lurker" then
                      if r4_120.Name == "Arctic Warrior" then
                      end
                      if r4_120.HumanoidRootPart.Position - RengokuMon.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(1500.0, 1500.0, 1500.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = RengokuMon
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoMusketeerHat then
                  if not StartMagnetMusketeerhat then
                    if r4_120.Name == "Forest Pirate" then
                      if r4_120.HumanoidRootPart.Position - MusketeerHatMon.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = MusketeerHatMon
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoObservationHakiV2 then
                  if not Mangnetcitzenmon then
                    if r4_120.Name == "Forest Pirate" then
                      if r4_120.HumanoidRootPart.Position - MusketeerHatMon.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosHee
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.Auto_EvoRace then
                  if not StartEvoMagnet then
                    if r4_120.Name == "Zombie" then
                      if r4_120.HumanoidRootPart.Position - PosMonEvo.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosMonEvo
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoBartilo then
                  if not AutoBartiloBring then
                    if r4_120.Name == "Swan Pirate" then
                      if r4_120.HumanoidRootPart.Position - PosMonBarto.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosMonBarto
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoFarmFruitMastery then
                  if not StartMasteryFruitMagnet then
                    if r4_120.Name == "Monkey" then
                      if r4_120.HumanoidRootPart.Position - PosMonMasteryFruit.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosMonMasteryFruit
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                            if r4_120.Name == "Factory Staff" then
                              if r4_120.HumanoidRootPart.Position - PosMonMasteryFruit.Position.Magnitude <= _G.BringMode then
                                r5_120 = r4_120:FindFirstChild("Humanoid")
                                if not r5_120 then
                                  r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                                  if not r5_120 then
                                    if 0 < r4_120.Humanoid.Health then
                                      r6_120 = Vector3.new(50.0, 50.0, 50.0)
                                      r4_120.HumanoidRootPart.Size = r6_120
                                      r4_120.Humanoid:ChangeState(14.0)
                                      r4_120.HumanoidRootPart.CanCollide = false
                                      r4_120.Head.CanCollide = false
                                      r4_120.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                      r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                                      if not r5_120 then
                                        r4_120.Humanoid.Animator:Destroy()
                                      end
                                      r6_120 = game:GetService("Players")
                                      sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                    if r4_120.Name == Mon then
                                      if r4_120.HumanoidRootPart.Position - PosMonMasteryFruit.Position.Magnitude <= _G.BringMode then
                                        r5_120 = r4_120:FindFirstChild("Humanoid")
                                        if not r5_120 then
                                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                                          if not r5_120 then
                                            if 0 < r4_120.Humanoid.Health then
                                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                                              r4_120.HumanoidRootPart.Size = r6_120
                                              r4_120.Humanoid:ChangeState(14.0)
                                              r4_120.HumanoidRootPart.CanCollide = false
                                              r4_120.Head.CanCollide = false
                                              r4_120.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                                              if not r5_120 then
                                                r4_120.Humanoid.Animator:Destroy()
                                              end
                                              r6_120 = game:GetService("Players")
                                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoFarmGunMastery then
                  if not StartMasteryGunMagnet then
                    if r4_120.Name == "Monkey" then
                      if r4_120.HumanoidRootPart.Position - PosMonMasteryGun.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosMonMasteryGun
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                            if r4_120.Name == "Factory Staff" then
                              if r4_120.HumanoidRootPart.Position - PosMonMasteryGun.Position.Magnitude <= _G.BringMode then
                                r5_120 = r4_120:FindFirstChild("Humanoid")
                                if not r5_120 then
                                  r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                                  if not r5_120 then
                                    if 0 < r4_120.Humanoid.Health then
                                      r6_120 = Vector3.new(50.0, 50.0, 50.0)
                                      r4_120.HumanoidRootPart.Size = r6_120
                                      r4_120.Humanoid:ChangeState(14.0)
                                      r4_120.HumanoidRootPart.CanCollide = false
                                      r4_120.Head.CanCollide = false
                                      r4_120.HumanoidRootPart.CFrame = PosMonMasteryGun
                                      r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                                      if not r5_120 then
                                        r4_120.Humanoid.Animator:Destroy()
                                      end
                                      r6_120 = game:GetService("Players")
                                      sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                    if r4_120.Name == Mon then
                                      if r4_120.HumanoidRootPart.Position - PosMonMasteryGun.Position.Magnitude <= _G.BringMode then
                                        r5_120 = r4_120:FindFirstChild("Humanoid")
                                        if not r5_120 then
                                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                                          if not r5_120 then
                                            if 0 < r4_120.Humanoid.Health then
                                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                                              r4_120.HumanoidRootPart.Size = r6_120
                                              r4_120.Humanoid:ChangeState(14.0)
                                              r4_120.HumanoidRootPart.CanCollide = false
                                              r4_120.Head.CanCollide = false
                                              r4_120.HumanoidRootPart.CFrame = PosMonMasteryGun
                                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                                              if not r5_120 then
                                                r4_120.Humanoid.Animator:Destroy()
                                              end
                                              r6_120 = game:GetService("Players")
                                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.Auto_Bone then
                  if not StartMagnetBoneMon then
                    if r4_120.Name ~= "Reborn Skeleton" then
                      if r4_120.Name ~= "Living Zombie" then
                        if r4_120.Name ~= "Demonic Soul" then
                          if r4_120.Name == "Posessed Mummy" then
                          end
                        end
                      end
                      if r4_120.HumanoidRootPart.Position - PosMonBone.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosMonBone
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoFarmCandy then
                  if not StartCandyMagnet then
                    if r4_120.Name ~= "Ice Cream Chef" then
                      if r4_120.Name == "Ice Cream Commander" then
                      end
                      if r4_120.HumanoidRootPart.Position - CandyMon.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = CandyMon
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not BringAcient then
                  if not AutoFarmAcient then
                    if r4_120.Name ~= "Cocoa Warrior" then
                      if r4_120.Name ~= "Chocolate Bar Battler" then
                        if r4_120.Name ~= "Sweet Thief" then
                          if r4_120.Name == "Candy Rebel" then
                          end
                        end
                      end
                      if r4_120.HumanoidRootPart.Position - PosGG.Position.Magnitude <= 250.0 then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = FarmPos
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.Farmfast then
                  if not StardMag then
                    if r4_120.Name ~= "Shanda" then
                      if r4_120.Name == "Shanda" then
                      end
                      if r4_120.HumanoidRootPart.Position - FastMon.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = FastMon
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if not _G.AutoDoughtBoss then
                  if not MagnetDought then
                    if r4_120.Name ~= "Cookie Crafter" then
                      if r4_120.Name ~= "Cake Guard" then
                        if r4_120.Name ~= "Baking Staff" then
                          if r4_120.Name == "Head Baker" then
                          end
                        end
                      end
                      if r4_120.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position.Magnitude <= _G.BringMode then
                        r5_120 = r4_120:FindFirstChild("Humanoid")
                        if not r5_120 then
                          r5_120 = r4_120:FindFirstChild("HumanoidRootPart")
                          if not r5_120 then
                            if 0 < r4_120.Humanoid.Health then
                              r6_120 = Vector3.new(50.0, 50.0, 50.0)
                              r4_120.HumanoidRootPart.Size = r6_120
                              r4_120.Humanoid:ChangeState(14.0)
                              r4_120.HumanoidRootPart.CanCollide = false
                              r4_120.Head.CanCollide = false
                              r4_120.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                              r5_120 = r4_120.Humanoid:FindFirstChild("Animator")
                              if not r5_120 then
                                r4_120.Humanoid.Animator:Destroy()
                              end
                              r6_120 = game:GetService("Players")
                              sethiddenproperty(r6_120.LocalPlayer, "SimulationRadius", math.huge)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                for r3_120, r4_120 in r0_120 do
                end
                return
            end
            pcall(r1_119)
          end
          return
        end
        spawn(r13_1)
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 243
        end
        wait()
        if not setscriptable then
          setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
        end
        if not sethiddenproperty then
          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
          return
        end
        task.spawn(r13_1)
        PosY = 5.0
        Type = 1.0
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 99
        end
        local r0_99 = wait(0.1)
        if not r0_99 then
          if Type == 1.0 then
            r0_99 = CFrame.new(-30.0, PosY, 0)
            Pos = r0_99
          end
          if Type == 2.0 then
            r0_99 = CFrame.new(0, PosY, -30.0)
            Pos = r0_99
          end
          if Type == 3.0 then
            r0_99 = CFrame.new(30.0, PosY, 0)
            Pos = r0_99
          end
          if Type == 4.0 then
            r0_99 = CFrame.new(0, PosY, 30.0)
            Pos = r0_99
          end
          if Type == 5.0 then
            r0_99 = CFrame.new(-30.0, PosY, 0)
            Pos = r0_99
          end
          if Type == 6.0 then
            r0_99 = CFrame.new(0, PosY, -30.0)
            Pos = r0_99
          end
          return
        end
        spawn(r13_1)
        local r13_1 = function()
          -- line: [0.0, 0.0] id: 126
          local r0_126 = wait(0.1)
          if not r0_126 then
            Type = 1.0
            wait(0.1)
            Type = 2.0
            wait(0.1)
            Type = 3.0
            wait(0.1)
            Type = 4.0
            wait(0.1)
            Type = 5.0
            wait(0.1)
          end
          return
        end
        spawn(r13_1)
        function AutoHaki()
          -- line: [0.0, 0.0] id: 192
          local r0_192 = game:GetService("Players")
          r0_192 = r0_192.LocalPlayer.Character:FindFirstChild("HasBuso")
          if r0_192 then
            r0_192 = game:GetService("ReplicatedStorage")
            r0_192.Remotes.CommF_:InvokeServer("Buso")
          end
          return
        end
        function BTP(r0_310)
          -- line: [0.0, 0.0] id: 310
        end
        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15.0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_310
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_310
        if r0_310.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 2000.0 then
          return
        end
        function BTP(r0_147)
          -- line: [0.0, 0.0] id: 147
          local r2_147 = function()
            -- line: [0.0, 0.0] id: 148
            if 2000.0 <= upval_0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
              if Auto_Raid then
                if 0 < game.Players.LocalPlayer.Character.Humanoid.Health then
                  if NQuest == "FishmanQuest" then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    local r0_148 = game:GetService("ReplicatedStorage")
                    r0_148.Remotes.CommF_:InvokeServer(r0_148.Remotes.CommF_)
                  end
                  if Mon == "God's Guard" then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    r0_148 = game:GetService("ReplicatedStorage")
                    r0_148.Remotes.CommF_:InvokeServer(r0_148.Remotes.CommF_)
                  end
                  if NQuest == "SkyExp1Quest" then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    r0_148 = game:GetService("ReplicatedStorage")
                    r0_148.Remotes.CommF_:InvokeServer(r0_148.Remotes.CommF_)
                  end
                  if NQuest == "ShipQuest1" then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    r0_148 = game:GetService("ReplicatedStorage")
                    r0_148.Remotes.CommF_:InvokeServer(r0_148.Remotes.CommF_)
                  end
                  if NQuest == "ShipQuest2" then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    r0_148 = game:GetService("ReplicatedStorage")
                    r0_148.Remotes.CommF_:InvokeServer(r0_148.Remotes.CommF_)
                  end
                  if NQuest == "FrostQuest" then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    r0_148 = game:GetService("ReplicatedStorage")
                    r0_148.Remotes.CommF_:InvokeServer(r0_148.Remotes.CommF_)
                  end
                  Mix_Farm = true
                end
              end
              wait(0.5)
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = upval_0
              wait(0.05)
              game.Players.LocalPlayer.Character.Head:Destroy()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = upval_0
              if upval_0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 1500.0 then
                if 0 < game.Players.LocalPlayer.Character.Humanoid.Health then
                  wait()
                  Mix_Farm = nil
                end
              end
            end
            return
          end
          pcall(r2_147)
          return
        end
        r4_1.Main:AddParagraph({Title = "Farming", Content = "Auto Farm"})
        local r15_1 = r4_1.Main:AddDropdown("DropdownSelectWeapon", {
          Title = "Select Weapon",
          Values = r19_1,
          ["Multi"] = false,
          ["Default"] = 1.0,
        })
        r15_1["SetValue"]("Melee")
        local r18_1 = function(r0_152)
          -- line: [0.0, 0.0] id: 152
          ChooseWeapon = r0_152
          return
        end
        r15_1["OnChanged"](r18_1)
        local r17_1 = function()
          -- line: [0.0, 0.0] id: 53
          local r0_53 = wait()
          if not r0_53 then
            local r1_53 = function()
              -- line: [0.0, 0.0] id: 54
              if ChooseWeapon == "Melee" then
                local r0_54, r1_54, r2_54 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                if r4_54.ToolTip == "Melee" then
                  local r5_54 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)
                  if not r5_54 then
                    SelectWeapon = r4_54.Name
                  end
                end
                for r3_54, r4_54 in r0_54 do
                end
                if ChooseWeapon == "Sword" then
                  local r0_54, r1_54, r2_54 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                  if r4_54.ToolTip == "Sword" then
                    r5_54 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)
                    if not r5_54 then
                      SelectWeapon = r4_54.Name
                    end
                  end
                  for r3_54, r4_54 in r0_54 do
                  end
                  if ChooseWeapon == " Blox Fruit" then
                    local r0_54, r1_54, r2_54 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    if r4_54.ToolTip == "Blox Fruit" then
                      r5_54 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)
                      if not r5_54 then
                        SelectWeapon = r4_54.Name
                      end
                    end
                    for r3_54, r4_54 in r0_54 do
                    end
                    local r0_54, r1_54, r2_54 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    if r4_54.ToolTip == "Melee" then
                      r5_54 = game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Backpack)
                      if not r5_54 then
                        SelectWeapon = r4_54.Name
                      end
                    end
                    for r3_54, r4_54 in r0_54 do
                      return
            end
            pcall(r1_53)
          end
          return
        end
        task.spawn(r17_1)
        local r16_1 = r4_1.Main["AddToggle"]("ToggleAutoFarmLevel", {Title = "Auto Farm Level", ["Default"] = false})
        local r19_1 = function(r0_76)
          -- line: [0.0, 0.0] id: 76
          AutoFarmQuest = r0_76
          return
        end
        r16_1["OnChanged"](r19_1)
        r0_1.Options["ToggleAutoFarmLevel"]["SetValue"](false)
        local r18_1 = function()
          -- line: [0.0, 0.0] id: 13
        end
        local r0_13 = task.wait()
        if not r0_13 then
          if not AutoFarmQuest then
            local r1_13 = function()
              -- line: [0.0, 0.0] id: 14
              CheckLevel()
              local r1_14 = game:GetService("Players")
              local r0_14 = string.find(r1_14.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
              if not r0_14 then
                r0_14 = game:GetService("Players")
                if r0_14.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                end
                r0_14 = game:GetService("ReplicatedStorage")
                r0_14.Remotes.CommF_:InvokeServer("AbandonQuest")
                if not BypassTP then
                  if 2500.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position.Magnitude then
                    BTP(CFrameQ)
                  end
                  if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position.Magnitude < 2500.0 then
                    Tween(CFrameQ)
                  end
                  Tween(CFrameQ)
                end
                r1_14 = game:GetService("Players")
                if CFrameQ.Position - r1_14.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 5.0 then
                  r0_14 = game:GetService("ReplicatedStorage")
                  r0_14.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                end
                r1_14 = game:GetService("Players")
                r0_14 = string.find(r1_14.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
                if r0_14 then
                  r0_14 = game:GetService("Players")
                  if r0_14.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                  end
                  r1_14 = game:GetService("Workspace")
                  local r0_14, r1_14, r2_14 = pairs(r1_14.Enemies:GetChildren())
                  local r5_14 = QuestLv:FindFirstChild("Humanoid")
                  if not r5_14 then
                    r5_14 = QuestLv:FindFirstChild("HumanoidRootPart")
                    if not r5_14 then
                      if 0 < QuestLv.Humanoid.Health then
                        if QuestLv.Name == Ms then
                        end
                        r5_14 = game:GetService("RunService")
                        r5_14.Heartbeat:wait()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        local r7_14 = CFrame.new(upval_0, upval_1, upval_2)
                        Tween(QuestLv.HumanoidRootPart.CFrame * r7_14)
                        local r6_14 = Vector3.new(60.0, 60.0, 60.0)
                        QuestLv.HumanoidRootPart.Size = r6_14
                        QuestLv.HumanoidRootPart.Transparency = 1.0
                        QuestLv.Humanoid.JumpPower = 0
                        QuestLv.Humanoid.WalkSpeed = 0
                        QuestLv.HumanoidRootPart.CanCollide = false
                        FarmPos = QuestLv.HumanoidRootPart.CFrame
                        MonFarm = QuestLv.Name
                        Click()
                        if not AutoFarmQuest then
                          if not QuestLv.Parent then
                            if QuestLv.Humanoid.Health > 0 then
                              r5_14 = game:GetService("Workspace")
                              r5_14 = r5_14.Enemies:FindFirstChild(QuestLv.Name)
                              if not r5_14 then
                                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  for r3_14, r4_14 in r0_14 do
                    r1_14 = game:GetService("Workspace")
                    local r0_14, r1_14, r2_14 = pairs(r1_14._WorldOrigin.EnemySpawns:GetChildren())
                    r5_14 = string.find(QuestLv.Name, NameMon)
                    if not r5_14 then
                      if 10.0 <= game.Players.LocalPlayer.Character.HumanoidRootPart.Position - QuestLv.Position.Magnitude then
                        r7_14 = CFrame.new(upval_0, upval_1, upval_2)
                        Tween(QuestLv.CFrame * r7_14)
                      end
                    end
                    for r3_14, r4_14 in r0_14 do
                    end
                  end
                  Tween(CFrameQ)
                  return
            end
            pcall(r1_13)
          end
          return
        end
        spawn(r18_1)
        r17_1 = game:GetService("ReplicatedStorage")
        r17_1 = r17_1["Effect"].Container:FindFirstChild("Death")
        if not r17_1 then
          r17_1 = game:GetService("ReplicatedStorage")
          r17_1["Effect"].Container["Death"]["Destroy"]()
        end
        r17_1 = game:GetService("ReplicatedStorage")
        r17_1 = r17_1["Effect"].Container:FindFirstChild("Respawn")
        if not r17_1 then
          r17_1 = game:GetService("ReplicatedStorage")
          r17_1["Effect"].Container["Respawn"]["Destroy"]()
        end
        r17_1 = r4_1.Main["AddToggle"]("ToggleMobAura", {Title = "Auto Near Mob", ["Default"] = false})
        local r20_1 = function(r0_215)
          -- line: [0.0, 0.0] id: 215
          AutoFarmNearestMob = r0_215
          return
        end
        r17_1["OnChanged"](r20_1)
        r0_1.Options["ToggleMobAura"]["SetValue"](false)
        local r19_1 = function()
          -- line: [0.0, 0.0] id: 110
        end
        local r0_110 = wait(0.1)
        if not r0_110 then
          if not AutoFarmNearestMob then
            local r1_110 = function()
              -- line: [0.0, 0.0] id: 111
              local r0_111, r1_111, r2_111 = pairs(game.Workspace.Enemies:GetChildren())
              local r5_111 = r4_111:FindFirstChild("Humanoid")
              if not r5_111 then
                r5_111 = r4_111:FindFirstChild("HumanoidRootPart")
                if not r5_111 then
                  if 0 < r4_111.Humanoid.Health then
                    if not r4_111.Name then
                      local r6_111 = r4_111:FindFirstChild("HumanoidRootPart")
                      if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r6_111.Position.Magnitude <= 5000.0 then
                      end
                      task.wait(0.1)
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      Tween(r4_111.HumanoidRootPart.CFrame * Pos)
                      r6_111 = Vector3.new(1.0, 1.0, 1.0)
                      r4_111.HumanoidRootPart.Size = r6_111
                      r4_111.HumanoidRootPart.Transparency = 1.0
                      r4_111.Humanoid.JumpPower = 0
                      r4_111.Humanoid.WalkSpeed = 0
                      r4_111.HumanoidRootPart.CanCollide = false
                      FarmPos = r4_111.HumanoidRootPart.CFrame
                      MonFarm = r4_111.Name
                      Click()
                      if not AutoFarmNearestMob then
                        if not r4_111.Parent then
                          if r4_111.Humanoid.Health > 0 then
                            r5_111 = game.Workspace.Enemies:FindFirstChild(r4_111.Name)
                            if r5_111 then
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              for r3_111, r4_111 in r0_111 do
                return
            end
            pcall(r1_110)
          end
          return
        end
        spawn(r19_1)
        local r22_1 = function()
          -- line: [0.0, 0.0] id: 37
          UseCode("Sub2Fer999")
          UseCode("Enyu_is_Pro")
          UseCode("Magicbus")
          UseCode("JCWK")
          UseCode("Starcodeheo")
          UseCode("Bluxxy")
          UseCode("THEGREATACE")
          UseCode("SUB2GAMERROBOT_EXP1")
          UseCode("StrawHatMaine")
          UseCode("Sub2OfficialNoobie")
          UseCode("SUB2NOOBMASTER123")
          UseCode("Sub2Daigrock")
          UseCode("Axiore")
          UseCode("TantaiGaming")
          UseCode("STRAWHATMAINE")
          return
        end
        r4_1.Main["AddButton"]({Title = "Redeem All Code", ["Description"] = "Redeem all code x2 exp", ["Callback"] = r22_1})
        function UseCode(r0_107)
          -- line: [0.0, 0.0] id: 107
          local r1_107 = game:GetService("ReplicatedStorage")
          r1_107.Remotes.Redeem:InvokeServer(r0_107)
          return
        end
        local r22_1 = function()
          -- line: [0.0, 0.0] id: 87
          FPSBooster()
          return
        end
        r4_1.Main["AddButton"]({Title = "Fps Booster", ["Description"] = "Boost your fps", ["Callback"] = r22_1})
        function FPSBooster()
          -- line: [0.0, 0.0] id: 128
          sethiddenproperty(game.Lighting, "Technology", 2.0)
          sethiddenproperty(game.Workspace.Terrain, "Decoration", false)
          game.Workspace.Terrain.WaterWaveSize = 0
          game.Workspace.Terrain.WaterWaveSpeed = 0
          game.Workspace.Terrain.WaterReflectance = 0
          game.Workspace.Terrain.WaterTransparency = 0
          game.Lighting.GlobalShadows = false
          game.Lighting.FogEnd = 9000000000.0
          game.Lighting.Brightness = 0
          local r5_128 = settings()
          r5_128.Rendering.QualityLevel = "Level01"
          local r5_128, r6_128, r7_128 = pairs(game:GetDescendants())
          local r10_128 = r9_128:IsA("Part")
          if r10_128 then
            r10_128 = r9_128:IsA("Union")
            if r10_128 then
              r10_128 = r9_128:IsA("CornerWedgePart")
              if r10_128 then
                r10_128 = r9_128:IsA("TrussPart")
                if not r10_128 then
                end
              end
            end
            r9_128.Material = "Plastic"
            r9_128.Reflectance = 0
          end
          r10_128 = r9_128:IsA("Decal")
          if r10_128 then
            r10_128 = r9_128:IsA("Texture")
            if not r10_128 then
              if not true then
              end
              r9_128.Transparency = 1.0
            end
          end
          r10_128 = r9_128:IsA("ParticleEmitter")
          if r10_128 then
            r10_128 = r9_128:IsA("Trail")
            if not r10_128 then
            end
            r10_128 = NumberRange.new(0)
            r9_128.Lifetime = r10_128
          end
          r10_128 = r9_128:IsA("Explosion")
          if not r10_128 then
            r9_128.BlastPressure = 1.0
            r9_128.BlastRadius = 1.0
          end
          r10_128 = r9_128:IsA("Fire")
          if r10_128 then
            r10_128 = r9_128:IsA("SpotLight")
            if r10_128 then
              r10_128 = r9_128:IsA("Smoke")
              if r10_128 then
                r10_128 = r9_128:IsA("Sparkles")
                if not r10_128 then
                end
              end
            end
            r9_128.Enabled = false
          end
          r10_128 = r9_128:IsA("MeshPart")
          if not r10_128 then
            r9_128.Material = "Plastic"
            r9_128.Reflectance = 0
            r9_128.TextureID = 1.0385902758729e+16
          end
          for r8_128, r9_128 in r5_128 do
            local r5_128, r6_128, r7_128 = pairs(game.Lighting:GetChildren())
            r10_128 = r9_128:IsA("BlurEffect")
            if r10_128 then
              r10_128 = r9_128:IsA("SunRaysEffect")
              if r10_128 then
                r10_128 = r9_128:IsA("ColorCorrectionEffect")
                if r10_128 then
                  r10_128 = r9_128:IsA("BloomEffect")
                  if r10_128 then
                    r10_128 = r9_128:IsA("DepthOfFieldEffect")
                    if not r10_128 then
                    end
                  end
                end
              end
              r9_128.Enabled = false
            end
            for r8_128, r9_128 in r5_128 do
              return
        end
        r4_1.Main:AddParagraph({Title = "Mastery Farm", Content = "Auto farm your mastery"})
        r18_1 = r4_1.Main:AddDropdown("DropdownMastery", {
          Title = "Farm Mode",
          Values = r22_1,
          ["Multi"] = false,
          ["Default"] = 1.0,
        })
        r18_1["SetValue"]("Level")
        local r21_1 = function(r0_217)
          -- line: [0.0, 0.0] id: 217
          TypeMastery = r0_217
          return
        end
        r18_1["OnChanged"](r21_1)
        r19_1 = r4_1.Main["AddToggle"]("ToggleMasteryFruit", {Title = "Auto BF Mastery", ["Default"] = false})
        local r22_1 = function(r0_186)
          -- line: [0.0, 0.0] id: 186
          AutoFarmMasDevilFruit = r0_186
          return
        end
        r19_1["OnChanged"](r22_1)
        r0_1.Options["ToggleMasteryFruit"]["SetValue"](false)
        r20_1 = r4_1.Main["AddToggle"]("ToggleMasteryGun", {Title = "Auto Gun Mastery", ["Default"] = false})
        local r23_1 = function(r0_78)
          -- line: [0.0, 0.0] id: 78
          AutoFarmMasGun = r0_78
          return
        end
        r20_1["OnChanged"](r23_1)
        r0_1.Options["ToggleMasteryGun"]["SetValue"](false)
        KillPercent = 40.0
        local r26_1 = function(r0_211)
          -- line: [0.0, 0.0] id: 211
          KillPercent = r0_211
          return
        end
        r21_1 = r4_1.Main["AddSlider"]("SliderHealt", {
          Title = "Health %",
          ["Description"] = "Health for mastery",
          ["Default"] = 40.0,
          ["Min"] = 0,
          ["Max"] = 100.0,
          ["Rounding"] = 1.0,
          ["Callback"] = r26_1,
        })
        local r24_1 = function(r0_301)
          -- line: [0.0, 0.0] id: 301
          KillPercent = r0_301
          return
        end
        r21_1["OnChanged"](r24_1)
        r21_1["SetValue"](40.0)
        local r23_1 = function()
          -- line: [0.0, 0.0] id: 251
        end
      end
    end
  end
  local r0_251 = task.wait(0.1)
  if not r0_251 then
    if not AutoFarmMasGun then
      if TypeMastery == "Level" then
        local r1_251 = function()
          -- line: [0.0, 0.0] id: 255
          CheckLevel(SelectMonster)
          local r1_255 = game:GetService("Players")
          local r0_255 = string.find(r1_255.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
          if not r0_255 then
            r0_255 = game:GetService("Players")
            if r0_255.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            end
            r0_255 = game:GetService("ReplicatedStorage")
            r0_255.Remotes.CommF_:InvokeServer("AbandonQuest")
            Tween(CFrameQ)
            r1_255 = game:GetService("Players")
            if CFrameQ.Position - r1_255.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 5.0 then
              r0_255 = game:GetService("ReplicatedStorage")
              r0_255.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
            end
            r1_255 = game:GetService("Players")
            r0_255 = string.find(r1_255.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
            if r0_255 then
              r0_255 = game:GetService("Players")
              if r0_255.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
              end
              r1_255 = game:GetService("Workspace")
              local r0_255, r1_255, r2_255 = pairs(r1_255.Enemies:GetChildren())
              local r5_255 = QuestLv:FindFirstChild("Humanoid")
              if not r5_255 then
                r5_255 = QuestLv:FindFirstChild("HumanoidRootPart")
                if not r5_255 then
                  if QuestLv.Name == Ms then
                  end
                  r5_255 = game:GetService("RunService")
                  r5_255.Heartbeat:wait()
                  if QuestLv.Humanoid.Health <= QuestLv.Humanoid.MaxHealth * KillPercent / 100.0 then
                    EquipTool(CurrentEquipGun)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = QuestLv.HumanoidRootPart.CFrame * Pos
                    r5_255 = game:GetService("Players")
                    r5_255.LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                    UseSkillGun = true
                  end
                  UseSkillGun = false
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  Click()
                  local r7_255 = CFrame.new(upval_0, upval_1, upval_2)
                  Tween(QuestLv.HumanoidRootPart.CFrame * r7_255)
                  local r6_255 = Vector3.new(1.0, 1.0, 1.0)
                  QuestLv.HumanoidRootPart.Size = r6_255
                  QuestLv.HumanoidRootPart.Transparency = 1.0
                  QuestLv.Humanoid.JumpPower = 0
                  QuestLv.Humanoid.WalkSpeed = 0
                  QuestLv.HumanoidRootPart.CanCollide = false
                  Click()
                  FarmPos = QuestLv.HumanoidRootPart.CFrame
                  MonFarm = QuestLv.Name
                  if not AutoFarmMasGun then
                    if not QuestLv.Parent then
                      if QuestLv.Humanoid.Health > 0 then
                        r5_255 = game:GetService("Players")
                        if r5_255.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                          r5_255 = game:GetService("Workspace")
                          r5_255 = r5_255.Enemies:FindFirstChild(QuestLv.Name)
                          if not r5_255 then
                            if not TypeMastery == "Queat" then
                            end
                          end
                        end
                      end
                    end
                    UseSkillGun = false
                  end
                end
              end
              for r3_255, r4_255 in r0_255 do
                UseSkillGun = false
                Tween(CFrameQ)
              end
            end
            return
        end
        pcall(r1_251)
      end
    end
    if not AutoFarmMasGun then
      if TypeMastery == "No Quest" then
        local r1_251 = function()
          -- line: [0.0, 0.0] id: 254
          if not BypassTP then
            if 2000.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position.Magnitude then
              BTP(CFrameMon)
            end
            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position.Magnitude < 2000.0 then
              Tween(CFrameMon)
            end
            Tween(CFrameMon)
          end
          CheckLevel()
          local r0_254 = game.Workspace.Enemies:FindFirstChild(Ms)
          if not r0_254 then
            local r0_254, r1_254, r2_254 = pairs(game.Workspace.Enemies:GetChildren())
            if r4_254.Name == Ms then
              local r5_254 = r4_254:FindFirstChild("Humanoid")
              if not r5_254 then
                r5_254 = r4_254:FindFirstChild("HumanoidRootPart")
                if not r5_254 then
                end
                r5_254 = game:GetService("RunService")
                r5_254.Heartbeat:wait()
                if r4_254.Humanoid.Health <= r4_254.Humanoid.MaxHealth * KillPercent / 100.0 then
                  EquipTool(CurrentEquipGun)
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r4_254.HumanoidRootPart.CFrame * Pos
                  r5_254 = game:GetService("Players")
                  r5_254.LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                  UseSkillGun = true
                end
                UseSkillGun = false
                AutoHaki()
                EquipTool(SelectWeapon)
                local r7_254 = CFrame.new(upval_0, upval_1, upval_2)
                Tween(r4_254.HumanoidRootPart.CFrame * r7_254)
                local r6_254 = Vector3.new(1.0, 1.0, 1.0)
                r4_254.HumanoidRootPart.Size = r6_254
                r4_254.HumanoidRootPart.Transparency = 1.0
                r4_254.Humanoid.JumpPower = 0
                r4_254.Humanoid.WalkSpeed = 0
                r4_254.HumanoidRootPart.CanCollide = false
                FarmPos = r4_254.HumanoidRootPart.CFrame
                MonFarm = r4_254.Name
                if not AutoFarmMasGun then
                  if not r4_254.Parent then
                    if r4_254.Humanoid.Health > 0 then
                      r5_254 = game:GetService("Workspace")
                      r5_254 = r5_254.Enemies:FindFirstChild(r4_254.Name)
                      if not r5_254 then
                        if not TypeMastery == "No Quest" then
                        end
                      end
                    end
                  end
                end
              end
            end
            for r3_254, r4_254 in r0_254 do
            end
            UseSkillGun = false
            Tween(CFrameMon)
            return
        end
        pcall(r1_251)
      end
    end
    if not AutoFarmMasGun then
      if TypeMastery == "Near Mobs" then
        local r1_251 = function()
          -- line: [0.0, 0.0] id: 252
          local r0_252, r1_252, r2_252 = pairs(game.Workspace.Enemies:GetChildren())
          if not r4_252.Name then
            local r5_252 = r4_252:FindFirstChild("Humanoid")
            if not r5_252 then
              r5_252 = r4_252:FindFirstChild("HumanoidRootPart")
              if not r5_252 then
                local r6_252 = r4_252:FindFirstChild("HumanoidRootPart")
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r6_252.Position.Magnitude <= 2000.0 then
                end
                r5_252 = game:GetService("RunService")
                r5_252.Heartbeat:wait()
                if r4_252.Humanoid.Health <= r4_252.Humanoid.MaxHealth * KillPercent / 100.0 then
                  EquipTool(CurrentEquipGun)
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r4_252.HumanoidRootPart.CFrame * Pos
                  r5_252 = game:GetService("Players")
                  r5_252.LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                  UseSkillGun = true
                end
                UseSkillGun = false
                AutoHaki()
                EquipTool(SelectWeapon)
                local r7_252 = CFrame.new(upval_0, upval_1, upval_2)
                Tween(r4_252.HumanoidRootPart.CFrame * r7_252)
                r6_252 = Vector3.new(1.0, 1.0, 1.0)
                r4_252.HumanoidRootPart.Size = r6_252
                r4_252.HumanoidRootPart.Transparency = 1.0
                r4_252.Humanoid.JumpPower = 0
                r4_252.Humanoid.WalkSpeed = 0
                r4_252.HumanoidRootPart.CanCollide = false
                Click()
                FarmPos = r4_252.HumanoidRootPart.CFrame
                MonFarm = r4_252.Name
                Click()
                if not AutoFarmMasGun then
                  if not MasteryType ~= "Near Mobs" then
                    if not r4_252.Parent then
                      if r4_252.Humanoid.Health > 0 then
                        if not TypeMastery == "Near Mobs" then
                        end
                      end
                    end
                  end
                  UseSkillGun = false
                end
              end
            end
          end
          for r3_252, r4_252 in r0_252 do
            return
        end
        pcall(r1_251)
      end
    end
    if not AutoFarmMasGun then
      if TypeMastery == "Boss" then
        r0_251 = game:GetService("Players")
        if r0_251.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
          CheckBossQuest()
          if not BypassTP then
            if 2000.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position.Magnitude then
              BTP(CFrameQBoss)
              wait(3.0)
            end
            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position.Magnitude < 2000.0 then
              Tween(CFrameQBoss)
            end
            Tween(CFrameQBoss)
          end
          r1_251 = game:GetService("Players")
          if CFrameQBoss.Position - r1_251.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 5.0 then
            r0_251 = game:GetService("ReplicatedStorage")
            r0_251.Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
          end
          r0_251 = game:GetService("Players")
          if r0_251.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            local r1_251 = function()
              -- line: [0.0, 0.0] id: 253
              CheckBossQuest()
              local r0_253 = game:GetService("Workspace")
              r0_253 = r0_253.Enemies:FindFirstChild(SelectBoss)
              if not r0_253 then
                local r1_253 = game:GetService("Workspace")
                local r0_253, r1_253, r2_253 = pairs(r1_253.Enemies:GetChildren())
                if r4_253.Name == selectBoss then
                  local r5_253 = r4_253:FindFirstChild("Humanoid")
                  if not r5_253 then
                    r5_253 = r4_253:FindFirstChild("HumanoidRootPart")
                    if not r5_253 then
                    end
                    r5_253 = game:GetService("RunService")
                    r5_253.Heartbeat:wait()
                    if r4_253.Humanoid.Health <= r4_253.Humanoid.MaxHealth * KillPercent / 100.0 then
                      EquipTool(CurrentEquipGun)
                      local r7_253 = CFrame.new(upval_0, upval_1, upval_2)
                      Tween(r4_253.HumanoidRootPart.CFrame * r7_253)
                      r5_253 = game:GetService("Players")
                      r5_253.LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
                      UseSkillGun = true
                    end
                    UseSkillGun = false
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    r7_253 = CFrame.new(upval_0, upval_1, upval_2)
                    Tween(r4_253.HumanoidRootPart.CFrame * r7_253)
                    local r6_253 = Vector3.new(1.0, 1.0, 1.0)
                    r4_253.HumanoidRootPart.Size = r6_253
                    r4_253.HumanoidRootPart.Transparency = 1.0
                    r4_253.Humanoid.JumpPower = 0
                    r4_253.Humanoid.WalkSpeed = 0
                    r4_253.HumanoidRootPart.CanCollide = false
                    FarmPos = r4_253.HumanoidRootPart.CFrame
                    MonFarm = r4_253.Name
                    if not AutoFarmMasGun then
                      if not TypeMastery ~= "Boss" then
                        if not r4_253.Parent then
                          if r4_253.Humanoid.Health > 0 then
                            if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                              r5_253 = game:GetService("Workspace")
                              r5_253 = r5_253.Enemies:FindFirstChild(r4_253.Name)
                              if r5_253 then
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                for r3_253, r4_253 in r0_253 do
                end
                UseSkillGun = false
                r1_253 = game:GetService("ReplicatedStorage")
                r1_253 = r1_253:FindFirstChild(SelectBoss)
                r2_253 = CFrame.new(upval_0, upval_1, upval_2)
                Tween(r1_253.HumanoidRootPart.CFrame * r2_253)
                return
            end
            pcall(r1_251)
          end
          return
        end
        spawn(r23_1)
        local r23_1 = function()
          -- line: [0.0, 0.0] id: 286
          local r0_286 = game:GetService("RunService")
          local r2_286 = function()
            -- line: [0.0, 0.0] id: 287
            if not UseSkillGun then
              local r1_287 = function()
                -- line: [0.0, 0.0] id: 288
                local r1_288 = game:GetService("Workspace")
                local r0_288, r1_288, r2_288 = pairs(r1_288.Enemies:GetChildren())
                if r4_288.Name == MonFarm then
                  local r5_288 = game:GetService("Players")
                  r5_288.LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(r4_288.HumanoidRootPart.Position, r4_288.HumanoidRootPart)
                  ClickCamera()
                end
                for r3_288, r4_288 in r0_288 do
                  return
              end
              pcall(r1_287)
            end
            return
          end
          r0_286.RenderStepped:Connect(r2_286)
          return
        end
        spawn(r23_1)
        local r23_1 = function()
          -- line: [0.0, 0.0] id: 39
        end
        local r0_39 = wait(1.0)
        if not r0_39 then
          if not UseSkillGun then
            local r1_39 = function()
              -- line: [0.0, 0.0] id: 40
              CheckLevel()
              local r1_40 = game:GetService("Workspace")
              local r0_40, r1_40, r2_40 = pairs(r1_40.Enemies:GetChildren())
              if not SkillZ then
                local r6_40 = game:GetService("Players")
                local r7_40 = game:GetService("Players")
                r7_40 = r7_40.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                r6_40.LocalPlayer.Character[r7_40.Name].RemoteEvent:FireServer(r6_40.LocalPlayer.Character[r7_40.Name].RemoteEvent)
                r6_40 = game:GetService("VirtualInputManager")
                r6_40:SendKeyEvent(true, "Z", false, game)
                r6_40 = game:GetService("VirtualInputManager")
                r6_40:SendKeyEvent(false, "Z", false, game)
              end
              if not SkillX then
                r6_40 = game:GetService("Players")
                r7_40 = game:GetService("Players")
                r7_40 = r7_40.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                r6_40.LocalPlayer.Character[r7_40.Name].RemoteEvent:FireServer(r6_40.LocalPlayer.Character[r7_40.Name].RemoteEvent)
                r6_40 = game:GetService("VirtualInputManager")
                r6_40:SendKeyEvent(true, "X", false, game)
                r6_40 = game:GetService("VirtualInputManager")
                r6_40:SendKeyEvent(false, "X", false, game)
              end
              for r3_40, r4_40 in r0_40 do
                return
            end
            pcall(r1_39)
          end
          return
        end
        spawn(r23_1)
        local r23_1 = function()
          -- line: [0.0, 0.0] id: 230
          local r1_230 = function()
            -- line: [0.0, 0.0] id: 231
            local r0_231 = game:GetService("RunService")
            local r2_231 = function()
              -- line: [0.0, 0.0] id: 232
              if not UseSkillGun then
                local r1_232 = game:GetService("Players")
                local r2_232 = game:GetService("Players")
                r1_232.LocalPlayer.Character[r2_232.LocalPlayer.Data.Gun.Value].RemoteEvent:FireServer(r1_232.LocalPlayer.Character[r2_232.LocalPlayer.Data.Gun.Value].RemoteEvent)
              end
              return
            end
            r0_231.RenderStepped:Connect(r2_231)
            return
          end
          pcall(r1_230)
          return
        end
        spawn(r23_1)
        local r23_1 = function()
          -- line: [0.0, 0.0] id: 137
        end
        local r0_137 = task.wait(1.0)
        if not r0_137 then
          if not _G.UseSkill then
            local r1_137 = function()
              -- line: [0.0, 0.0] id: 138
              if not _G.UseSkill then
                local r1_138 = game:GetService("Workspace")
                local r0_138, r1_138, r2_138 = pairs(r1_138.Enemies:GetChildren())
                if r4_138.Name == MonFarm then
                  local r5_138 = r4_138:FindFirstChild("Humanoid")
                  if not r5_138 then
                    r5_138 = r4_138:FindFirstChild("HumanoidRootPart")
                    if not r5_138 then
                      if r4_138.Humanoid.Health <= r4_138.Humanoid.MaxHealth * KillPercent / 100.0 then
                      end
                      r5_138 = game:GetService("RunService")
                      r5_138.Heartbeat:wait()
                      EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                      local r7_138 = CFrame.new(upval_0, upval_1, upval_2)
                      Tween(r4_138.HumanoidRootPart.CFrame * r7_138)
                      PositionSkillMasteryDevilFruit = r4_138.HumanoidRootPart.Position
                      r5_138 = game:GetService("Players")
                      r5_138 = r5_138.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value)
                      if not r5_138 then
                        r5_138 = game:GetService("Players")
                        r5_138 = r5_138.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value)
                        r5_138.MousePos.Value = PositionSkillMasteryDevilFruit
                        r5_138 = game:GetService("Players")
                        r5_138 = r5_138.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value)
                        if not SkillZ then
                          if 1.0 <= r5_138.Level.Value then
                            local r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(true, "Z", false, game)
                            wait(0.1)
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(false, "Z", false, game)
                          end
                        end
                        if not SkillX then
                          if 2.0 <= r5_138.Level.Value then
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(true, "X", false, game)
                            wait(0.2)
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(false, "X", false, game)
                          end
                        end
                        if not SkillC then
                          if 3.0 <= r5_138.Level.Value then
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(true, "C", false, game)
                            wait(0.3)
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(false, "C", false, game)
                          end
                        end
                        if not SkillV then
                          if 4.0 <= r5_138.Level.Value then
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(true, "V", false, game)
                            wait(0.4)
                            r6_138 = game:service("VirtualInputManager")
                            r6_138:SendKeyEvent(false, "V", false, game)
                          end
                        end
                        if not SkillF then
                          if 5.0 <= r5_138.Level.Value then
                            r6_138 = game:GetService("VirtualInputManager")
                            r6_138:SendKeyEvent(true, "F", false, game)
                            wait(0.5)
                            r6_138 = game:GetService("VirtualInputManager")
                            r6_138:SendKeyEvent(false, "F", false, game)
                          end
                        end
                      end
                      if not AutoFarmMasDevilFruit then
                        if not _G.UseSkill then
                          if r4_138.Humanoid.Health == 0 then
                          end
                        end
                      end
                    end
                  end
                end
                for r3_138, r4_138 in r0_138 do
                end
                return
            end
            pcall(r1_137)
          end
          return
        end
        spawn(r23_1)
        local r23_1 = function()
          -- line: [0.0, 0.0] id: 304
        end
      end
    end
  end
  local r0_304 = task.wait(0.1)
  if not r0_304 then
    if not AutoFarmMasDevilFruit then
      if TypeMastery == "Level" then
        local r1_304 = function()
          -- line: [0.0, 0.0] id: 308
          CheckLevel(SelectMonster)
          local r1_308 = game:GetService("Players")
          local r0_308 = string.find(r1_308.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
          if not r0_308 then
            r0_308 = game:GetService("Players")
            if r0_308.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            end
            r0_308 = game:GetService("ReplicatedStorage")
            r0_308.Remotes.CommF_:InvokeServer("AbandonQuest")
            if not BypassTP then
              if 2500.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position.Magnitude then
                BTP(CFrameQ)
                wait(0.2)
              end
              if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position.Magnitude < 2500.0 then
                Tween(CFrameQ)
              end
              Tween(CFrameQ)
            end
            r1_308 = game:GetService("Players")
            if CFrameQ.Position - r1_308.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 5.0 then
              r0_308 = game:GetService("ReplicatedStorage")
              r0_308.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
            end
            r1_308 = game:GetService("Players")
            r0_308 = string.find(r1_308.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon)
            if r0_308 then
              r0_308 = game:GetService("Players")
              if r0_308.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
              end
              r1_308 = game:GetService("Workspace")
              local r0_308, r1_308, r2_308 = pairs(r1_308.Enemies:GetChildren())
              local r5_308 = QuestLv:FindFirstChild("Humanoid")
              if not r5_308 then
                r5_308 = QuestLv:FindFirstChild("HumanoidRootPart")
                if not r5_308 then
                  if QuestLv.Name == Ms then
                  end
                  r5_308 = game:GetService("RunService")
                  r5_308.Heartbeat:wait()
                  if QuestLv.Humanoid.Health <= QuestLv.Humanoid.MaxHealth * KillPercent / 100.0 then
                    _G.UseSkill = true
                  end
                  _G.UseSkill = false
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  Click()
                  local r7_308 = CFrame.new(upval_0, upval_1, upval_2)
                  Tween(QuestLv.HumanoidRootPart.CFrame * r7_308)
                  local r6_308 = Vector3.new(1.0, 1.0, 1.0)
                  QuestLv.HumanoidRootPart.Size = r6_308
                  QuestLv.HumanoidRootPart.Transparency = 1.0
                  QuestLv.Humanoid.JumpPower = 0
                  QuestLv.Humanoid.WalkSpeed = 0
                  QuestLv.HumanoidRootPart.CanCollide = false
                  Click()
                  FarmPos = QuestLv.HumanoidRootPart.CFrame
                  MonFarm = QuestLv.Name
                  if not AutoFarmMasDevilFruit then
                    if not QuestLv.Parent then
                      if QuestLv.Humanoid.Health ~= 0 then
                        r5_308 = game:GetService("Players")
                        if r5_308.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                          r5_308 = game:GetService("Workspace")
                          r5_308 = r5_308.Enemies:FindFirstChild(QuestLv.Name)
                          if not r5_308 then
                            if not TypeMastery == "Level" then
                            end
                          end
                        end
                      end
                    end
                    _G.UseSkill = false
                  end
                end
              end
              for r3_308, r4_308 in r0_308 do
                _G.UseSkill = false
                Tween(Q)
              end
            end
            return
        end
        pcall(r1_304)
      end
    end
    if not AutoFarmMasDevilFruit then
      if TypeMastery == "No Quest" then
        local r1_304 = function()
          -- line: [0.0, 0.0] id: 307
          CheckLevel()
          if not BypassTP then
            if 2000.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position.Magnitude then
              BTP(CFrameMon)
            end
            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position.Magnitude < 2000.0 then
              Tween(CFrameMon)
            end
            Tween(CFrameMon)
          end
          local r0_307 = game.Workspace.Enemies:FindFirstChild(Ms)
          if not r0_307 then
            local r0_307, r1_307, r2_307 = pairs(game.Workspace.Enemies:GetChildren())
            if r4_307.Name == Ms then
              local r5_307 = r4_307:FindFirstChild("Humanoid")
              if not r5_307 then
                r5_307 = r4_307:FindFirstChild("HumanoidRootPart")
                if not r5_307 then
                end
                r5_307 = game:GetService("RunService")
                r5_307.Heartbeat:wait()
                if r4_307.Humanoid.Health <= r4_307.Humanoid.MaxHealth * KillPercent / 100.0 then
                  _G.UseSkill = true
                end
                _G.UseSkill = false
                AutoHaki()
                EquipTool(SelectWeapon)
                local r7_307 = CFrame.new(upval_0, upval_1, upval_2)
                Tween(r4_307.HumanoidRootPart.CFrame * r7_307)
                local r6_307 = Vector3.new(1.0, 1.0, 1.0)
                r4_307.HumanoidRootPart.Size = r6_307
                r4_307.HumanoidRootPart.Transparency = 1.0
                r4_307.Humanoid.JumpPower = 0
                r4_307.Humanoid.WalkSpeed = 0
                r4_307.HumanoidRootPart.CanCollide = false
                FarmPos = r4_307.HumanoidRootPart.CFrame
                MonFarm = r4_307.Name
                if not AutoFarmMasDevilFruit then
                  if not r4_307.Parent then
                    if r4_307.Humanoid.Health ~= 0 then
                      r5_307 = game:GetService("Workspace")
                      r5_307 = r5_307.Enemies:FindFirstChild(r4_307.Name)
                      if not r5_307 then
                        if not TypeMastery == "No Quest" then
                        end
                      end
                    end
                  end
                  _G.UseSkill = false
                end
              end
            end
            for r3_307, r4_307 in r0_307 do
            end
            _G.UseSkill = false
            Tween(CFrameMon)
            return
        end
        pcall(r1_304)
      end
    end
    if not AutoFarmMasDevilFruit then
      if TypeMastery == "Near Mobs" then
        local r1_304 = function()
          -- line: [0.0, 0.0] id: 306
          local r0_306, r1_306, r2_306 = pairs(game.Workspace.Enemies:GetChildren())
          if not r4_306.Name then
            local r5_306 = r4_306:FindFirstChild("Humanoid")
            if not r5_306 then
              r5_306 = r4_306:FindFirstChild("HumanoidRootPart")
              if not r5_306 then
                local r6_306 = r4_306:FindFirstChild("HumanoidRootPart")
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r6_306.Position.Magnitude <= 2000.0 then
                end
                r5_306 = game:GetService("RunService")
                r5_306.Heartbeat:wait()
                if r4_306.Humanoid.Health <= r4_306.Humanoid.MaxHealth * KillPercent / 100.0 then
                  _G.UseSkill = true
                end
                _G.UseSkill = false
                AutoHaki()
                EquipTool(SelectWeapon)
                local r7_306 = CFrame.new(upval_0, upval_1, upval_2)
                Tween(r4_306.HumanoidRootPart.CFrame * r7_306)
                r6_306 = Vector3.new(1.0, 1.0, 1.0)
                r4_306.HumanoidRootPart.Size = r6_306
                r4_306.HumanoidRootPart.Transparency = 1.0
                r4_306.Humanoid.JumpPower = 0
                r4_306.Humanoid.WalkSpeed = 0
                r4_306.HumanoidRootPart.CanCollide = false
                FarmPos = r4_306.HumanoidRootPart.CFrame
                MonFarm = r4_306.Name
                Click()
                if not AutoFarmMasDevilFruit then
                  if not MasteryType ~= "Nearest" then
                    if not r4_306.Parent then
                      if r4_306.Humanoid.Health ~= 0 then
                        if not TypeMastery == "Nearest" then
                        end
                      end
                    end
                  end
                  _G.UseSkill = false
                end
              end
            end
          end
          for r3_306, r4_306 in r0_306 do
            return
        end
        pcall(r1_304)
      end
    end
    if not AutoFarmMasDevilFruit then
      if TypeMastery == "Boss" then
        r0_304 = game:GetService("Players")
        if r0_304.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
          CheckBossQuest()
          if not BypassTP then
            if 2000.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position.Magnitude then
              BTP(CFrameQBoss)
              wait(3.0)
            end
            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQBoss.Position.Magnitude < 2000.0 then
              Tween(CFrameQBoss)
            end
            Tween(CFrameQBoss)
          end
          r1_304 = game:GetService("Players")
          if CFrameQBoss.Position - r1_304.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 5.0 then
            r0_304 = game:GetService("ReplicatedStorage")
            r0_304.Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
          end
          r0_304 = game:GetService("Players")
          if r0_304.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            local r1_304 = function()
              -- line: [0.0, 0.0] id: 305
              CheckBossQuest()
              local r0_305 = game:GetService("Workspace")
              r0_305 = r0_305.Enemies:FindFirstChild(SelectBoss)
              if not r0_305 then
                local r1_305 = game:GetService("Workspace")
                local r0_305, r1_305, r2_305 = pairs(r1_305.Enemies:GetChildren())
                if r4_305.Name == selectBoss then
                  local r5_305 = r4_305:FindFirstChild("Humanoid")
                  if not r5_305 then
                    r5_305 = r4_305:FindFirstChild("HumanoidRootPart")
                    if not r5_305 then
                    end
                    r5_305 = game:GetService("RunService")
                    r5_305.Heartbeat:wait()
                    if r4_305.Humanoid.Health <= r4_305.Humanoid.MaxHealth * KillPercent / 100.0 then
                      _G.UseSkill = true
                    end
                    _G.UseSkill = false
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    local r7_305 = CFrame.new(upval_0, upval_1, upval_2)
                    Tween(r4_305.HumanoidRootPart.CFrame * r7_305)
                    local r6_305 = Vector3.new(1.0, 1.0, 1.0)
                    r4_305.HumanoidRootPart.Size = r6_305
                    r4_305.HumanoidRootPart.Transparency = 1.0
                    r4_305.Humanoid.JumpPower = 0
                    r4_305.Humanoid.WalkSpeed = 0
                    r4_305.HumanoidRootPart.CanCollide = false
                    FarmPos = r4_305.HumanoidRootPart.CFrame
                    MonFarm = r4_305.Name
                    if not AutoFarmMasDevilFruit then
                      if not TypeMastery ~= "Boss" then
                        if not r4_305.Parent then
                          if r4_305.Humanoid.Health ~= 0 then
                            if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                              r5_305 = game:GetService("Workspace")
                              r5_305 = r5_305.Enemies:FindFirstChild(r4_305.Name)
                              if r5_305 then
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                for r3_305, r4_305 in r0_305 do
                end
                _G.UseSkill = false
                r1_305 = game:GetService("ReplicatedStorage")
                r1_305 = r1_305:FindFirstChild(SelectBoss)
                Tween(r1_305.HumanoidRootPart.CFrame * PosY)
                return
            end
            pcall(r1_304)
          end
          return
        end
        spawn(r23_1)
        if not Second_Sea then
          r4_1.Main:AddParagraph({Title = "Factory", Content = ""})
          r22_1 = r4_1.Main["AddToggle"]("ToggleFac", {Title = "Auto Factory", ["Default"] = false})
          local r25_1 = function(r0_10)
            -- line: [0.0, 0.0] id: 10
            Factory = r0_10
            return
          end
          r22_1["OnChanged"](r25_1)
          Core = false
          local r24_1 = function()
            -- line: [0.0, 0.0] id: 35
          end
        end
      end
      local r0_35 = wait()
      if not r0_35 then
        if not Factory then
          r0_35 = game.Workspace.Enemies:FindFirstChild("Core")
          if not r0_35 then
            Core = true
            Auto_Farm = false
            local r0_35, r1_35, r2_35 = pairs(game.Workspace.Enemies:GetChildren())
            if not Core then
              if r4_35.Name == "Core" then
                if 0 < r4_35.Humanoid.Health then
                end
                local r5_35 = game:GetService("RunService")
                r5_35.Heartbeat:wait()
                TP(CFrame.new(402.404296875, 182.53373718262, -414.73394775391))
                EquipWeapon(SelectToolWeapon)
                local r6_35 = game:GetService("Players")
                r5_35 = require(r6_35.LocalPlayer.PlayerScripts.CombatFramework)
                r5_35.activeController.hitboxMagnitude = 1000.0
                r5_35 = game:GetService("VirtualUser")
                r5_35:CaptureController()
                r5_35 = game:GetService("VirtualUser")
                r5_35:Button1Down(r5_35)
                if not Core then
                  if r4_35.Humanoid.Health > 0 then
                    if Factory == false then
                    end
                  end
                end
              end
            end
            for r3_35, r4_35 in r0_35 do
            end
            r0_35 = game.ReplicatedStorage:FindFirstChild("Core")
            if not r0_35 then
              Core = true
              Auto_Farm = false
              TP(CFrame.new(402.404296875, 182.53373718262, -414.73394775391))
            end
            if not _G.AutoFarm then
              if SelectToolWeapon ~= "" then
                Auto_Farm = true
                Core = false
              end
              return
          end
          spawn(r24_1)
        end
        r4_1.Main:AddParagraph({Title = "Misc Farm", Content = "Bone & Cake Prince"})
        r22_1 = r4_1.Main["AddToggle"]("ToggleBone", {Title = "Auto Farm Bone", ["Default"] = false})
        local r25_1 = function(r0_313)
          -- line: [0.0, 0.0] id: 313
          AutoFarmBone = r0_313
          return
        end
        r22_1["OnChanged"](r25_1)
        r0_1.Options["ToggleBone"]["SetValue"](false)
        r23_1 = CFrame["new"](-9515.75, 174.85217285156, 6079.40625)
        local r25_1 = function()
          -- line: [0.0, 0.0] id: 237
        end
        local r0_237 = wait()
        if not r0_237 then
          if not AutoFarmBone then
            local r1_237 = function()
              -- line: [0.0, 0.0] id: 238
              local r0_238 = game:GetService("Players")
              local r1_238 = string.find(r0_238.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul")
              if r1_238 then
                r1_238 = game:GetService("ReplicatedStorage")
                r1_238.Remotes.CommF_:InvokeServer("AbandonQuest")
              end
              r1_238 = game:GetService("Players")
              if r1_238.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                if not BypassTP then
                  wait()
                  if 2500.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - upval_0.Position.Magnitude then
                    BTP(upval_0)
                  end
                  if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - upval_0.Position.Magnitude < 2500.0 then
                    Tween(upval_0)
                  end
                  Tween(upval_0)
                end
                local r2_238 = game:GetService("Players")
                if upval_0.Position - r2_238.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 3.0 then
                  r1_238 = game:GetService("ReplicatedStorage")
                  r1_238.Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1.0)
                end
                r1_238 = game:GetService("Players")
                if r1_238.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                  r1_238 = game:GetService("Workspace")
                  r1_238 = r1_238.Enemies:FindFirstChild("Reborn Skeleton")
                  if r1_238 then
                    r1_238 = game:GetService("Workspace")
                    r1_238 = r1_238.Enemies:FindFirstChild("Living Zombie")
                    if r1_238 then
                      r1_238 = game:GetService("Workspace")
                      r1_238 = r1_238.Enemies:FindFirstChild("Demonic Soul")
                      if r1_238 then
                        r1_238 = game:GetService("Workspace")
                        r1_238 = r1_238.Enemies:FindFirstChild("Posessed Mummy")
                        if not r1_238 then
                        end
                      end
                    end
                    r2_238 = game:GetService("Workspace")
                    local r1_238, r2_238, r3_238 = pairs(r2_238.Enemies:GetChildren())
                    local r6_238 = 1.0:FindFirstChild("HumanoidRootPart")
                    if not r6_238 then
                      r6_238 = 1.0:FindFirstChild("Humanoid")
                      if not r6_238 then
                        if 0 < 1.0.Humanoid.Health then
                          if 1.0.Name ~= "Reborn Skeleton" then
                            if 1.0.Name ~= "Living Zombie" then
                              if 1.0.Name ~= "Demonic Soul" then
                                if 1.0.Name == "Posessed Mummy" then
                                end
                              end
                            end
                            local r7_238 = game:GetService("Players")
                            r6_238 = string.find(r7_238.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul")
                            if not r6_238 then
                            end
                            task.wait()
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(1.0.HumanoidRootPart.CFrame * Pos)
                            r7_238 = Vector3.new(1.0, 1.0, 1.0)
                            1.0.HumanoidRootPart.Size = r7_238
                            1.0.HumanoidRootPart.Transparency = 1.0
                            1.0.Humanoid.JumpPower = 0
                            1.0.Humanoid.WalkSpeed = 0
                            1.0.HumanoidRootPart.CanCollide = false
                            FarmPos = 1.0.HumanoidRootPart.CFrame
                            MonFarm = 1.0.Name
                            Click()
                            if not AutoFarmBone then
                              if 1.0.Humanoid.Health > 0 then
                                if not 1.0.Parent then
                                  r6_238 = game:GetService("Players")
                                  if r6_238.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                  end
                                  r6_238 = game:GetService("ReplicatedStorage")
                                  r6_238.Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    for r4_238, r5_238 in r1_238 do
                    end
                    r1_238 = game:GetService("ReplicatedStorage")
                    r1_238 = r1_238:FindFirstChild("Demonic Soul")
                    if not r1_238 then
                      r2_238 = game:GetService("ReplicatedStorage")
                      r2_238 = r2_238:FindFirstChild("Demonic Soul")
                      r3_238 = CFrame.new(15.0, 10.0, 2.0)
                      Tween(r2_238.HumanoidRootPart.CFrame * r3_238)
                    end
                  end
                end
                return
            end
            pcall(r1_237)
          end
          return
        end
        spawn(r25_1)
        r24_1 = r4_1.Main["AddToggle"]("ToggleCake", {Title = "Auto Farm Cake Prince", ["Default"] = false})
        local r27_1 = function(r0_83)
          -- line: [0.0, 0.0] id: 83
          AutoCakePrince = r0_83
          return
        end
        r24_1["OnChanged"](r27_1)
        r0_1.Options["ToggleCake"]["SetValue"](false)
        local r26_1 = function()
          -- line: [0.0, 0.0] id: 25
        end
      end
    end
  end
  local r0_25 = task.wait()
  if not r0_25 then
    if not AutoCakePrince then
      r0_25 = game.ReplicatedStorage:FindFirstChild("Cake Prince")
      if r0_25 then
        r0_25 = game:GetService("Workspace")
        r0_25 = r0_25.Enemies:FindFirstChild("Cake Prince")
        if not r0_25 then
        end
        r0_25 = game:GetService("Workspace")
        r0_25 = r0_25.Enemies:FindFirstChild("Cake Prince")
        if not r0_25 then
          local r0_25, r1_25, r2_25 = pairs(game.Workspace.Enemies:GetChildren())
          if not AutoCakePrince then
            if r4_25.Name == "Cake Prince" then
              local r5_25 = r4_25:FindFirstChild("HumanoidRootPart")
              if not r5_25 then
                r5_25 = r4_25:FindFirstChild("Humanoid")
                if not r5_25 then
                  if 0 < r4_25.Humanoid.Health then
                  end
                  task.wait()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  Tween(r4_25.HumanoidRootPart.CFrame * Pos)
                  local r6_25 = Vector3.new(60.0, 60.0, 60.0)
                  r4_25.HumanoidRootPart.Size = r6_25
                  r4_25.HumanoidRootPart.Transparency = 1.0
                  r4_25.Humanoid.JumpPower = 0
                  r4_25.Humanoid.WalkSpeed = 0
                  r4_25.HumanoidRootPart.CanCollide = false
                  FarmPos = r4_25.HumanoidRootPart.CFrame
                  MonFarm = r4_25.Name
                  r5_25 = game:GetService("VirtualUser")
                  r5_25:CaptureController()
                  r5_25 = game:GetService("VirtualUser")
                  local r7_25 = r5_25:Button1Down(672.0)
                  r5_25:Button1Down(r5_25, r7_25, workspace.CurrentCamera.CFrame)
                  if not AutoCakePrince then
                    if not r4_25.Parent then
                      if r4_25.Humanoid.Health <= 0 then
                      end
                    end
                  end
                end
              end
            end
          end
          for r3_25, r4_25 in r0_25 do
          end
          r0_25 = game:GetService("Workspace")
          if r0_25.Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
            r0_25 = CFrame.new(-1990.6726074219, 4532.9995117188, -14973.674804688)
            if 2000.0 <= r0_25.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude then
              Tween(CFrame.new(-2151.82153, 149.315704, -12404.9053))
            end
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            r0_25 = game:GetService("Workspace")
            r0_25 = r0_25.Enemies:FindFirstChild("Cookie Crafter")
            if r0_25 then
              r0_25 = game:GetService("Workspace")
              r0_25 = r0_25.Enemies:FindFirstChild("Cake Guard")
              if r0_25 then
                r0_25 = game:GetService("Workspace")
                r0_25 = r0_25.Enemies:FindFirstChild("Baking Staff")
                if r0_25 then
                  r0_25 = game:GetService("Workspace")
                  r0_25 = r0_25.Enemies:FindFirstChild("Head Baker")
                  if not r0_25 then
                  end
                end
              end
              local r0_25, r1_25, r2_25 = pairs(game.Workspace.Enemies:GetChildren())
              r5_25 = -12404.9053:FindFirstChild("Humanoid")
              if not r5_25 then
                r5_25 = -12404.9053:FindFirstChild("HumanoidRootPart")
                if not r5_25 then
                  if 0 < -12404.9053.Humanoid.Health then
                    if -12404.9053.Name ~= "Cookie Crafter" then
                      if -12404.9053.Name ~= "Cake Guard" then
                        if -12404.9053.Name ~= "Baking Staff" then
                          if -12404.9053.Name == "Head Baker" then
                          end
                        end
                      end
                      r5_25 = -12404.9053:FindFirstChild("HumanoidRootPart")
                      if not r5_25 then
                        r5_25 = -12404.9053:FindFirstChild("Humanoid")
                        if not r5_25 then
                          if 0 < -12404.9053.Humanoid.Health then
                          end
                          task.wait()
                          AutoHaki()
                          EquipTool(SelectWeapon)
                          Tween(-12404.9053.HumanoidRootPart.CFrame * Pos)
                          r6_25 = Vector3.new(60.0, 60.0, 60.0)
                          -12404.9053.HumanoidRootPart.Size = r6_25
                          -12404.9053.HumanoidRootPart.Transparency = 1.0
                          -12404.9053.Humanoid.JumpPower = 0
                          -12404.9053.Humanoid.WalkSpeed = 0
                          -12404.9053.HumanoidRootPart.CanCollide = false
                          FarmPos = -12404.9053.HumanoidRootPart.CFrame
                          MonFarm = -12404.9053.Name
                          r5_25 = game:GetService("VirtualUser")
                          r5_25:CaptureController()
                          r5_25 = game:GetService("VirtualUser")
                          r7_25 = r5_25:Button1Down(672.0)
                          r5_25:Button1Down(r5_25, r7_25, workspace.CurrentCamera.CFrame)
                          if not AutoCakePrince then
                            if not -12404.9053.Parent then
                              if -12404.9053.Humanoid.Health <= 0 then
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              for r3_25, r4_25 in r0_25 do
              end
              r0_25 = CFrame.new(-2077.0, 252.0, -12373.0)
              if not BypassTP then
                if 2000.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r0_25.Position.Magnitude then
                  BTP(r0_25)
                  wait(3.0)
                end
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r0_25.Position.Magnitude < 2000.0 then
                  Tween(r0_25)
                end
                Tween(r0_25)
              end
              return
        end
        spawn(r26_1)
        r25_1 = r4_1.Main["AddToggle"]("ToggleCake1", {Title = "Auto Spawns Cake Prince", ["Default"] = false})
        local r28_1 = function(r0_150)
          -- line: [0.0, 0.0] id: 150
          AutoCakePrince1 = r0_150
          return
        end
        r25_1["OnChanged"](r28_1)
        local r27_1 = function()
          -- line: [0.0, 0.0] id: 173
        end
        local r0_173 = wait()
        if not r0_173 then
          if not AutoCakePrince1 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
          end
          return
        end
        spawn(r27_1)
        r4_1.Main:AddParagraph({Title = "Material", Content = "Auto farm material"})
        if not First_Sea then
          MaterialList = r26_1
        end
        if not Second_Sea then
          MaterialList = r26_1
        end
        if not Third_Sea then
          MaterialList = r26_1
        end
        r26_1 = r4_1.Main:AddDropdown("DropdownMaterial", {
          Title = "Select Material List",
          Values = MaterialList,
          ["Multi"] = false,
          ["Default"] = 1.0,
        })
        r26_1["SetValue"]("Conjured Cocoa")
        local r29_1 = function(r0_92)
          -- line: [0.0, 0.0] id: 92
          SelectMaterial = r0_92
          return
        end
        r26_1["OnChanged"](r29_1)
        r27_1 = r4_1.Main["AddToggle"]("ToggleMaterial", {Title = "Auto Farm Material", ["Default"] = false})
        local r30_1 = function(r0_235)
          -- line: [0.0, 0.0] id: 235
          AutoFarmMaterial = r0_235
          return
        end
        r27_1["OnChanged"](r30_1)
        r0_1.Options["ToggleMaterial"]["SetValue"](false)
        local r29_1 = function()
          -- line: [0.0, 0.0] id: 179
        end
        local r0_179 = task.wait()
        if not r0_179 then
          if not AutoFarmMaterial then
            local r1_179 = function()
              -- line: [0.0, 0.0] id: 180
              MaterialMon(SelectMaterial)
              if not BypassTP then
                if 3500.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position.Magnitude then
                  BTP(MPos)
                end
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position.Magnitude < 3500.0 then
                  Tween(MPos)
                end
                Tween(MPos)
              end
              local r0_180 = game:GetService("Workspace")
              r0_180 = r0_180.Enemies:FindFirstChild(MMon)
              if not r0_180 then
                local r0_180, r1_180, r2_180 = pairs(game.Workspace.Enemies:GetChildren())
                local r5_180 = r4_180:FindFirstChild("Humanoid")
                if not r5_180 then
                  r5_180 = r4_180:FindFirstChild("HumanoidRootPart")
                  if not r5_180 then
                    if 0 < r4_180.Humanoid.Health then
                      if r4_180.Name == MMon then
                      end
                      task.wait()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      local r7_180 = CFrame.new(upval_0, upval_1, upval_2)
                      Tween(r4_180.HumanoidRootPart.CFrame * r7_180)
                      local r6_180 = Vector3.new(60.0, 60.0, 60.0)
                      r4_180.HumanoidRootPart.Size = r6_180
                      r4_180.HumanoidRootPart.Transparency = 1.0
                      r4_180.Humanoid.JumpPower = 0
                      r4_180.Humanoid.WalkSpeed = 0
                      r4_180.HumanoidRootPart.CanCollide = false
                      FarmPos = r4_180.HumanoidRootPart.CFrame
                      MonFarm = r4_180.Name
                      Click()
                      if not AutoFarmMaterial then
                        if not r4_180.Parent then
                          if r4_180.Humanoid.Health <= 0 then
                          end
                        end
                      end
                    end
                  end
                end
                for r3_180, r4_180 in r0_180 do
                end
                r1_180 = game:GetService("Workspace")
                local r0_180, r1_180, r2_180 = pairs(r1_180._WorldOrigin.EnemySpawns:GetChildren())
                r5_180 = string.find(r4_180.Name, Mon)
                if not r5_180 then
                  if 10.0 <= game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_180.Position.Magnitude then
                    r7_180 = CFrame.new(upval_0, upval_1, upval_2)
                    Tween(r4_180.CFrame * r7_180)
                  end
                end
                for r3_180, r4_180 in r0_180 do
                  return
            end
            pcall(r1_179)
          end
          return
        end
        spawn(r29_1)
        if not Third_Sea then
          r4_1.Main:AddParagraph({Title = "Rough Sea", Content = "Auto rough sea"})
          r28_1 = r4_1.Main["AddToggle"]("ToggleBoat", {Title = "Auto Buy Boat", ["Default"] = false})
          local r31_1 = function(r0_223)
            -- line: [0.0, 0.0] id: 223
            _G.DriveMytic = r0_223
            return
          end
          r28_1["OnChanged"](r31_1)
          r0_1.Options["ToggleBoat"]["SetValue"](false)
          local r30_1 = function()
            -- line: [0.0, 0.0] id: 100
            local r0_100 = wait()
            if not r0_100 then
              local r1_100 = function()
                -- line: [0.0, 0.0] id: 101
                if not _G.DriveMytic then
                  local r0_101 = game:GetService("Workspace")
                  r0_101 = r0_101._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                  if r0_101 then
                    r0_101 = game:GetService("Workspace")
                    r0_101 = r0_101.Boats:FindFirstChild("PirateGrandBrigade")
                    if r0_101 then
                      r0_101 = TPP(CFrame.new())
                      buyb = r0_101
                      r0_101 = CFrame.new()
                      if r0_101.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.magnitude <= 10.0 then
                        if not buyb then
                          buyb:Stop()
                        end
                        local r1_101 = game:GetService("ReplicatedStorage")
                        r1_101.Remotes.CommF_:InvokeServer(r1_101.Remotes.CommF_)
                      end
                      r0_101 = game:GetService("Workspace")
                      r0_101 = r0_101.Boats:FindFirstChild("PirateGrandBrigade")
                      if not r0_101 then
                        r0_101 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                        if r0_101.Sit == false then
                          r1_101 = game:GetService("Workspace")
                          local r2_101 = CFrame.new(0, 1.0, 0)
                          TPP(r1_101.Boats.PirateGrandBrigade.VehicleSeat.CFrame * r2_101)
                        end
                        r1_101 = game:GetService("Workspace")
                        local r0_101, r1_101, r2_101 = pairs(r1_101.Boats:GetChildren())
                        if 1.0.Name == "PirateGrandBrigade" then
                        end
                        wait()
                        local r5_101 = CFrame.new(-324.30484, 15.5859451, 5218.35742, 0.965929627, 0, -0.258804798, 0, 1.0, 0, 0.258804798, 0, 0.965929627)
                        if r5_101.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.magnitude <= 10.0 then
                          TPB(CFrame.new(260.36581420898, 17.747055053711, 3543.2646484375))
                        end
                        r5_101 = CFrame.new(260.36581420898, 17.747055053711, 3543.2646484375)
                        if r5_101.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.magnitude <= 10.0 then
                          TPB(CFrame.new(29236.712890625, 17.74854850769, 19706.36328125))
                        end
                        r5_101 = CFrame.new(29236.712890625, 17.74854850769, 19706.36328125)
                        if r5_101.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.magnitude <= 10.0 then
                          TPB(CFrame.new(260.36581420898, 17.747055053711, 3543.2646484375))
                        end
                        r5_101 = game:GetService("Workspace")
                        r5_101 = r5_101._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                        if r5_101 then
                          if _G.DriveMytic == false then
                          end
                        end
                        for r3_101, r4_101 in r0_101 do
                        end
                        r0_101 = game:GetService("Workspace")
                        r0_101 = r0_101._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                        if not r0_101 then
                          r1_101 = game:GetService("Workspace")
                          TPB(r1_101.Boats.PirateGrandBrigade.VehicleSeat.CFrame)
                          r0_101 = game:GetService("Workspace")
                          r0_101.Boats.PirateGrandBrigade:Destroy()
                          r1_101 = game:GetService("Workspace")
                          r2_101 = CFrame.new(0, 300.0, 0)
                          TPP(r1_101.Map.MysticIsland.Center.CFrame * r2_101)
                          wait(1.0)
                          game.StarterGui:SetCore("SendNotification", {
                            Title = "Notify",
                            Text = "Mirage not Found ������",
                            Icon = "",
                            Duration = 3.0,
                          })
                          r0_101 = game:GetService("Workspace")
                          r0_101 = r0_101._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                          if not r0_101 then
                            if _G.DriveMytic ~= false then
                            end
                            r1_101 = game:GetService("Workspace")
                            TPB(r1_101.Boats.PirateGrandBrigade.VehicleSeat.CFrame)
                          end
                        end
                      end
                    end
                  end
                  return
              end
              pcall(r1_100)
            end
            return
          end
          spawn(r30_1)
          r29_1 = r4_1.Main["AddToggle"]("ToggleTW", {Title = "Auto Press W", ["Default"] = false})
          local r32_1 = function(r0_195)
            -- line: [0.0, 0.0] id: 195
            _G.AutoW = r0_195
            return
          end
          r29_1["OnChanged"](r32_1)
          r0_1.Options["ToggleTW"]["SetValue"](false)
          local r31_1 = function()
            -- line: [0.0, 0.0] id: 246
            local r0_246 = wait()
            if not r0_246 then
              local r1_246 = function()
                -- line: [0.0, 0.0] id: 247
                if not _G.AutoW then
                  local r0_247 = game:GetService("VirtualInputManager")
                  r0_247:SendKeyEvent(true, "W", false, game)
                end
                return
              end
              pcall(r1_246)
            end
            return
          end
          spawn(r31_1)
          r30_1 = r4_1.Main["AddToggle"]("ToggleTerrorshark", {Title = "Auto Kill Terrorshark", ["Default"] = false})
          local r33_1 = function(r0_283)
            -- line: [0.0, 0.0] id: 283
            _G.AutoTerrorshark = r0_283
            return
          end
          r30_1["OnChanged"](r33_1)
          r0_1.Options["ToggleTerrorshark"]["SetValue"](false)
          local r32_1 = function()
            -- line: [0.0, 0.0] id: 183
          end
          local r0_183 = wait()
          if not r0_183 then
            if not _G.AutoTerrorshark then
              local r1_183 = function()
                -- line: [0.0, 0.0] id: 184
                local r0_184 = game:GetService("Workspace")
                r0_184 = r0_184.Enemies:FindFirstChild("Terrorshark")
                if not r0_184 then
                  local r1_184 = game:GetService("Workspace")
                  local r0_184, r1_184, r2_184 = pairs(r1_184.Enemies:GetChildren())
                  if r4_184.Name == "Terrorshark" then
                    local r5_184 = r4_184:FindFirstChild("Humanoid")
                    if not r5_184 then
                      r5_184 = r4_184:FindFirstChild("HumanoidRootPart")
                      if not r5_184 then
                        if 0 < r4_184.Humanoid.Health then
                        end
                        task.wait()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_184.HumanoidRootPart.CanCollide = false
                        r4_184.Humanoid.WalkSpeed = 0
                        local r6_184 = Vector3.new(50.0, 50.0, 50.0)
                        r4_184.HumanoidRootPart.Size = r6_184
                        Click()
                        local r7_184 = CFrame.new(upval_0, upval_1, upval_2)
                        Tween(r4_184.HumanoidRootPart.CFrame * r7_184)
                        if not _G.AutoTerrorshark then
                          if not r4_184.Parent then
                            if r4_184.Humanoid.Health <= 0 then
                            end
                          end
                        end
                      end
                    end
                  end
                  for r3_184, r4_184 in r0_184 do
                  end
                  r0_184 = game:GetService("ReplicatedStorage")
                  r0_184 = r0_184:FindFirstChild("Terrorshark")
                  if not r0_184 then
                    r1_184 = game:GetService("ReplicatedStorage")
                    r1_184 = r1_184:FindFirstChild("Terrorshark")
                    r2_184 = CFrame.new(2.0, 20.0, 2.0)
                    Tween(r1_184.HumanoidRootPart.CFrame * r2_184)
                  end
                  return
              end
              pcall(r1_183)
            end
            return
          end
          spawn(r32_1)
          r31_1 = r4_1.Main["AddToggle"]("TogglePiranha", {Title = "Auto Kill Piranha", ["Default"] = false})
          local r34_1 = function(r0_93)
            -- line: [0.0, 0.0] id: 93
            _G.farmpiranya = r0_93
            return
          end
          r31_1["OnChanged"](r34_1)
          r0_1.Options["TogglePiranha"]["SetValue"](false)
          local r33_1 = function()
            -- line: [0.0, 0.0] id: 256
          end
          local r0_256 = wait()
          if not r0_256 then
            if not _G.farmpiranya then
              local r1_256 = function()
                -- line: [0.0, 0.0] id: 257
                local r0_257 = game:GetService("Workspace")
                r0_257 = r0_257.Enemies:FindFirstChild("Piranha")
                if not r0_257 then
                  local r1_257 = game:GetService("Workspace")
                  local r0_257, r1_257, r2_257 = pairs(r1_257.Enemies:GetChildren())
                  if r4_257.Name == "Piranha" then
                    local r5_257 = r4_257:FindFirstChild("Humanoid")
                    if not r5_257 then
                      r5_257 = r4_257:FindFirstChild("HumanoidRootPart")
                      if not r5_257 then
                        if 0 < r4_257.Humanoid.Health then
                        end
                        task.wait()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_257.HumanoidRootPart.CanCollide = false
                        r4_257.Humanoid.WalkSpeed = 0
                        local r6_257 = Vector3.new(50.0, 50.0, 50.0)
                        r4_257.HumanoidRootPart.Size = r6_257
                        Click()
                        local r7_257 = CFrame.new(upval_0, upval_1, upval_2)
                        Tween(r4_257.HumanoidRootPart.CFrame * r7_257)
                        if not _G.farmpiranya then
                          if not r4_257.Parent then
                            if r4_257.Humanoid.Health <= 0 then
                            end
                          end
                        end
                      end
                    end
                  end
                  for r3_257, r4_257 in r0_257 do
                  end
                  r0_257 = game:GetService("ReplicatedStorage")
                  r0_257 = r0_257:FindFirstChild("Piranha")
                  if not r0_257 then
                    r1_257 = game:GetService("ReplicatedStorage")
                    r1_257 = r1_257:FindFirstChild("Piranha")
                    r2_257 = CFrame.new(2.0, 20.0, 2.0)
                    Tween(r1_257.HumanoidRootPart.CFrame * r2_257)
                  end
                  return
              end
              pcall(r1_256)
            end
            return
          end
          spawn(r33_1)
          r4_1.Main:AddParagraph({Title = "Elite Hunter", Content = "Auto find and kill boss elite"})
          r32_1 = r4_1.Main["AddToggle"]("ToggleElite", {Title = "Auto Elite Hunter", ["Default"] = false})
          local r35_1 = function(r0_20)
            -- line: [0.0, 0.0] id: 20
            AutoEliteHunter = r0_20
            return
          end
          r32_1["OnChanged"](r35_1)
          r0_1.Options["ToggleElite"]["SetValue"](false)
          local r34_1 = function()
            -- line: [0.0, 0.0] id: 102
          end
          local r0_102 = task.wait()
          if not r0_102 then
            if not AutoEliteHunter then
              local r1_102 = function()
                -- line: [0.0, 0.0] id: 103
                local r0_103 = game:GetService("Players")
                if r0_103.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                  local r1_103 = game:GetService("Players")
                  r0_103 = string.find(r1_103.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")
                  if r0_103 then
                    r1_103 = game:GetService("Players")
                    r0_103 = string.find(r1_103.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")
                    if r0_103 then
                      r1_103 = game:GetService("Players")
                      r0_103 = string.find(r1_103.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")
                      if not r0_103 then
                      end
                    end
                    r0_103 = game:GetService("Workspace")
                    r0_103 = r0_103.Enemies:FindFirstChild("Diablo")
                    if r0_103 then
                      r0_103 = game:GetService("Workspace")
                      r0_103 = r0_103.Enemies:FindFirstChild("Deandre")
                      if r0_103 then
                        r0_103 = game:GetService("Workspace")
                        r0_103 = r0_103.Enemies:FindFirstChild("Urban")
                        if not r0_103 then
                        end
                      end
                      r1_103 = game:GetService("Workspace")
                      local r0_103, r1_103, r2_103 = pairs(r1_103.Enemies:GetChildren())
                      local r5_103 = r4_103:FindFirstChild("Humanoid")
                      if not r5_103 then
                        r5_103 = r4_103:FindFirstChild("HumanoidRootPart")
                        if not r5_103 then
                          if 0 < r4_103.Humanoid.Health then
                            if r4_103.Name ~= "Diablo" then
                              if r4_103.Name ~= "Deandre" then
                                if r4_103.Name == "Urban" then
                                end
                              end
                            end
                            task.wait()
                            EquipTool(SelectWeapon)
                            AutoHaki()
                            Tween(r4_103.HumanoidRootPart.CFrame * Pos)
                            MonsterPosition = r4_103.HumanoidRootPart.CFrame
                            r4_103.HumanoidRootPart.CFrame = r4_103.HumanoidRootPart.CFrame
                            r4_103.Humanoid.JumpPower = 0
                            r4_103.Humanoid.WalkSpeed = 0
                            r4_103.HumanoidRootPart.CanCollide = false
                            Click()
                            FarmPos = r4_103.HumanoidRootPart.CFrame
                            MonFarm = r4_103.Name
                            local r6_103 = Vector3.new(1.0, 1.0, 1.0)
                            r4_103.HumanoidRootPart.Size = r6_103
                            BringMobs = false
                            if AutoEliteHunter ~= false then
                              if r4_103.Humanoid.Health > 0 then
                                if r4_103.Parent then
                                end
                              end
                            end
                            BringMobs = true
                          end
                        end
                      end
                      for r3_103, r4_103 in r0_103 do
                      end
                      if not BypassTP then
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103 = r0_103:FindFirstChild("Diablo")
                        if not r0_103 then
                          r1_103 = game:GetService("ReplicatedStorage")
                          r1_103 = r1_103:FindFirstChild("Diablo")
                          r2_103 = CFrame.new(upval_0, upval_1, upval_2)
                          BTP(r1_103.HumanoidRootPart.CFrame * r2_103)
                        end
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103 = r0_103:FindFirstChild("Deandre")
                        if not r0_103 then
                          r1_103 = game:GetService("ReplicatedStorage")
                          r1_103 = r1_103:FindFirstChild("Deandre")
                          r2_103 = CFrame.new(upval_0, upval_1, upval_2)
                          BTP(r1_103.HumanoidRootPart.CFrame * r2_103)
                        end
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103 = r0_103:FindFirstChild("Urban")
                        if not r0_103 then
                          r1_103 = game:GetService("ReplicatedStorage")
                          r1_103 = r1_103:FindFirstChild("Urban")
                          r2_103 = CFrame.new(upval_0, upval_1, upval_2)
                          BTP(r1_103.HumanoidRootPart.CFrame * r2_103)
                        end
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103 = r0_103:FindFirstChild("Diablo")
                        if not r0_103 then
                          r1_103 = game:GetService("ReplicatedStorage")
                          r1_103 = r1_103:FindFirstChild("Diablo")
                          r2_103 = CFrame.new(upval_0, upval_1, upval_2)
                          Tween(r1_103.HumanoidRootPart.CFrame * r2_103)
                        end
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103 = r0_103:FindFirstChild("Deandre")
                        if not r0_103 then
                          r1_103 = game:GetService("ReplicatedStorage")
                          r1_103 = r1_103:FindFirstChild("Deandre")
                          r2_103 = CFrame.new(upval_0, upval_1, upval_2)
                          Tween(r1_103.HumanoidRootPart.CFrame * r2_103)
                        end
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103 = r0_103:FindFirstChild("Urban")
                        if not r0_103 then
                          r1_103 = game:GetService("ReplicatedStorage")
                          r1_103 = r1_103:FindFirstChild("Urban")
                          r2_103 = CFrame.new(upval_0, upval_1, upval_2)
                          Tween(r1_103.HumanoidRootPart.CFrame * r2_103)
                        end
                        r0_103 = game:GetService("ReplicatedStorage")
                        r0_103.Remotes.CommF_:InvokeServer("EliteHunter")
                      end
                    end
                  end
                  return
              end
              pcall(r1_102)
            end
            return
          end
          spawn(r34_1)
        end
        if not Third_Sea then
          r4_1.Main:AddParagraph({Title = "Sea Beast", Content = "Auto Kill Sea Beast"})
          r28_1 = r4_1.Main["AddToggle"]("ToggleSeaBeAst", {Title = "Auto Sea Beast", ["Default"] = false})
          local r31_1 = function(r0_21)
            -- line: [0.0, 0.0] id: 21
            _G.Auto_Seabest = r0_21
            return
          end
          r28_1["OnChanged"](r31_1)
          r0_1.Options["ToggleSeaBeAst"]["SetValue"](false)
          r29_1 = getrawmetatable(game)
          setreadonly(r29_1, false)
          local r33_1 = function(...)
            -- line: [0.0, 0.0] id: 125
            local r1_125 = getnamecallmethod()
            local r3_125 = tostring(r1_125)
            if r3_125 == "FireServer" then
              r3_125 = tostring(r2_125[1.0])
              if r3_125 == "RemoteEvent" then
                r3_125 = tostring(r2_125[2.0])
                if r3_125 ~= "true" then
                  r3_125 = tostring(r2_125[2.0])
                  if r3_125 ~= "false" then
                    if not Skillaimbot then
                      return upval_0()
                      return 
                    end
                  end
                end
              end
            end
            return upval_0()
            return 
          end
          r32_1 = newcclosure(r33_1)
          r29_1["__namecall"] = r32_1
          Skillz = true
          Skillx = true
          Skillc = true
          Skillv = true
          local r32_1 = function()
            -- line: [0.0, 0.0] id: 174
            local r0_174 = wait()
            if not r0_174 then
              local r1_174 = function()
                -- line: [0.0, 0.0] id: 175
                if not AutoSkill then
                  if not Skillz then
                    local r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(true, "Z", false, game)
                    wait(0.1)
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(false, "Z", false, game)
                  end
                  if not Skillx then
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(true, "X", false, game)
                    wait(0.1)
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(false, "X", false, game)
                  end
                  if not Skillc then
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(true, "C", false, game)
                    wait(0.1)
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(false, "C", false, game)
                  end
                  if not Skillv then
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(true, "V", false, game)
                    wait(0.1)
                    r0_175 = game:service("VirtualInputManager")
                    r0_175:SendKeyEvent(false, "V", false, game)
                  end
                end
                return
              end
              pcall(r1_174)
            end
            return
          end
          spawn(r32_1)
          local r32_1 = function()
            -- line: [0.0, 0.0] id: 55
            local r0_55 = wait()
            if not r0_55 then
              local r1_55 = function()
                -- line: [0.0, 0.0] id: 56
                if not _G.Auto_Seabest then
                  local r0_56 = game:GetService("Workspace")
                  r0_56 = r0_56.SeaBeasts:FindFirstChild("SeaBeast1")
                  if r0_56 then
                    r0_56 = game:GetService("Workspace")
                    r0_56 = r0_56.Boats:FindFirstChild("PirateBrigade")
                    if r0_56 then
                      r0_56 = game:GetService("Workspace")
                      r0_56 = r0_56.Boats:FindFirstChild("PirateBrigade")
                      if r0_56 then
                        r0_56 = game:GetService("Workspace")
                        r0_56 = r0_56.Boats:FindFirstChild("PirateBrigade")
                        if r0_56 then
                          r0_56 = TPP(CFrame.new(-4569.759765625, 16.420740127563, -2786.9418945312))
                          buyb = r0_56
                          r0_56 = CFrame.new(-4485.486328125, 10.883736610413, -2747.4326171875)
                          if r0_56.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.magnitude <= 10.0 then
                            if not buyb then
                              buyb:Stop()
                            end
                            local r1_56 = game:GetService("ReplicatedStorage")
                            r1_56.Remotes.CommF_:InvokeServer(r1_56.Remotes.CommF_)
                          end
                          r0_56 = game:GetService("Workspace")
                          r0_56 = r0_56.Boats:FindFirstChild("PirateBrigade")
                          if not r0_56 then
                            r0_56 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                            if r0_56.Sit == false then
                              r1_56 = game:GetService("Workspace")
                              local r2_56 = CFrame.new(0, 1.0, 0)
                              TPP(r1_56.Boats.PirateBrigade.VehicleSeat.CFrame * r2_56)
                            end
                            r0_56 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                            if r0_56.Sit == true then
                              wait()
                              r0_56 = game:GetService("Workspace")
                              if r0_56.Boats.PirateBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.magnitude <= 10.0 then
                                TPB(CFrame.new(35.045524597168, 17.750778198242, 4819.267578125))
                              end
                              r0_56 = game:GetService("Workspace")
                              r0_56 = r0_56.SeaBeasts:FindFirstChild("SeaBeast1")
                              if r0_56 then
                                if _G.Auto_Seabest ~= false then
                                end
                                r0_56 = game:GetService("Workspace")
                                r0_56 = r0_56.Boats:FindFirstChild("PirateBrigade")
                                if not r0_56 then
                                  r1_56 = game:GetService("Workspace")
                                  local r0_56, r1_56, r2_56 = pairs(r1_56.Boats:GetChildren())
                                  if 4819.267578125.Name == "PirateBrigade" then
                                    local r5_56 = 4819.267578125:FindFirstChild("VehicleSeat")
                                    if not r5_56 then
                                    end
                                    wait()
                                    r5_56 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                                    r5_56.Sit = false
                                    local r7_56 = CFrame.new(0, 1.0, 0)
                                    TPP(4819.267578125.VehicleSeat.CFrame * r7_56)
                                    r5_56 = game:GetService("Workspace")
                                    r5_56 = r5_56.Boats:FindFirstChild("PirateBrigade")
                                    if not r5_56 then
                                      if _G.Auto_Seabest == false then
                                      end
                                    end
                                  end
                                  for r3_56, r4_56 in r0_56 do
                                  end
                                  r0_56 = game:GetService("Workspace")
                                  r0_56 = r0_56.Boats:FindFirstChild("PirateBrigade")
                                  if not r0_56 then
                                    r1_56 = game:GetService("Workspace")
                                    local r0_56, r1_56, r2_56 = pairs(r1_56.Boats:GetChildren())
                                    if 4819.267578125.Name == "PirateBrigade" then
                                      r5_56 = 4819.267578125:FindFirstChild("VehicleSeat")
                                      if not r5_56 then
                                      end
                                      wait()
                                      r5_56 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                                      r5_56.Sit = false
                                      r7_56 = CFrame.new(0, 1.0, 0)
                                      TPP(4819.267578125.VehicleSeat.CFrame * r7_56)
                                      r5_56 = game:GetService("Workspace")
                                      r5_56 = r5_56.Boats:FindFirstChild("PirateBrigade")
                                      if not r5_56 then
                                        if _G.Auto_Seabest == false then
                                        end
                                      end
                                    end
                                    for r3_56, r4_56 in r0_56 do
                                    end
                                    r0_56 = game:GetService("Workspace")
                                    r0_56 = r0_56.SeaBeasts:FindFirstChild("SeaBeast1")
                                    if not r0_56 then
                                      r1_56 = game:GetService("Workspace")
                                      local r0_56, r1_56, r2_56 = pairs(r1_56.SeaBeasts:GetChildren())
                                      r5_56 = 4819.267578125:FindFirstChild("HumanoidRootPart")
                                      if not r5_56 then
                                      end
                                      wait()
                                      r5_56 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                                      r5_56.Sit = false
                                      r7_56 = CFrame.new(0, 500.0, 0)
                                      TPP(4819.267578125.HumanoidRootPart.CFrame * r7_56)
                                      EquipAllWeapon()
                                      AutoSkill = true
                                      AimBotSkillPosition = 4819.267578125.HumanoidRootPart
                                      Skillaimbot = true
                                      r5_56 = 4819.267578125:FindFirstChild("HumanoidRootPart")
                                      if not r5_56 then
                                        if _G.Auto_Seabest == false then
                                        end
                                        AutoSkill = false
                                        Skillaimbot = false
                                      end
                                      for r3_56, r4_56 in r0_56 do
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                      return
              end
              pcall(r1_55)
            end
            return
          end
          task.spawn(r32_1)
          r31_1 = r4_1.Main["AddToggle"]("ToggleAutoW", {Title = "Auto Press W", ["Default"] = false})
          local r34_1 = function(r0_236)
            -- line: [0.0, 0.0] id: 236
            _G.AutoW = r0_236
            return
          end
          r31_1["OnChanged"](r34_1)
          r0_1.Options["ToggleAutoW"]["SetValue"](false)
          local r33_1 = function()
            -- line: [0.0, 0.0] id: 177
            local r0_177 = wait()
            if not r0_177 then
              local r1_177 = function()
                -- line: [0.0, 0.0] id: 178
                if not _G.AutoW then
                  local r0_178 = game:GetService("VirtualInputManager")
                  r0_178:SendKeyEvent(true, "W", false, game)
                end
                return
              end
              pcall(r1_177)
            end
            return
          end
          spawn(r33_1)
          r4_1.Main:AddParagraph({Title = "Mirage Island", Content = "Auto Summon Mystic Island"})
          r32_1 = r4_1.Main["AddToggle"]("ToggleMirage", {Title = "Auto Mirage Island", ["Default"] = false})
          local r35_1 = function(r0_269)
            -- line: [0.0, 0.0] id: 269
            if not state then
              _G.dao = true
            end
            _G.dao = false
            if not _G.dao then
              local r2_269 = Vector3.new(-12463.602539062, 378.32705688477, -7566.0830078125)
              r2_269 = game:GetService("ReplicatedStorage")
              r2_269.Remotes.CommF_:InvokeServer(r2_269.Remotes.CommF_)
              wait(1.0)
              BTPZ(CFrame.new(-5411.22021, 778.609863, -2682.27759, 0.927179396, 0, 0.374617696, 0, 1.0, 0, -0.374617696, 0, 0.927179396))
              local r3_269 = game:GetService("ReplicatedStorage")
              r3_269.Remotes.CommF_:InvokeServer(r3_269.Remotes.CommF_)
              function two(r0_270)
                -- line: [0.0, 0.0] id: 270
                local r2_270 = function()
                  -- line: [0.0, 0.0] id: 272
                  game.Players.LocalPlayer.Character.Humanoid.Sit = false
                  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                  return
                end
                pcall(r2_270)
                local r1_270 = game:GetService("Players")
                if r1_270.LocalPlayer.Character.HumanoidRootPart.Position - r0_270.Position.Magnitude <= 200.0 then
                  local r2_270 = function()
                    -- line: [0.0, 0.0] id: 271
                    tweenz:Cancel()
                    return
                  end
                  pcall(r2_270)
                  r1_270 = game:GetService("Players")
                  r1_270.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_270
                end
                r1_270 = game:service("TweenService")
                local r3_270 = game:GetService("Players")
                r2_270 = TweenInfo.new(r3_270.LocalPlayer.Character.HumanoidRootPart.Position - r0_270.Position.Magnitude / 325.0, Enum.EasingStyle.Linear)
                local r4_270 = function()
                  -- line: [0.0, 0.0] id: 274
                  local r0_274 = upval_0:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, upval_1, {CFrame = upval_2})
                  tweenz = r0_274
                  tweenz:Play()
                  return
                end
                local r3_270, r4_270 = pcall(r4_270)
                err = r4_270
                tween = r3_270
                if tween then
                  return err
                end
                function _TweenCanCle()
                  -- line: [0.0, 0.0] id: 273
                  tweenz:Cancel()
                  return
                end
                return
              end
              two(CFrame.new(-5100.7085, 29.968586, -6792.45459, -0.33648631, -0.0396691673, 0.940852463, -6.40461678e-07, 0.999112308, 0.0421253517, -0.941688359, 0.0141740013, -0.336187631))
              wait(13.0)
              local r4_269, r5_269 = workspace.Boats.PirateBrigade:GetDescendants()
              local r8_269 = -6792.45459.Name:find("VehicleSeat")
              if not r8_269 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = -6792.45459.CFrame
                r8_269 = game:GetService("Workspace")
                r8_269 = r8_269.Map:FindFirstChild("MysticIsland")
                if not r8_269 then
                  local r9_269 = game:GetService("Workspace")
                  r9_269 = r9_269.Map:FindFirstChild("MysticIsland")
                  local r10_269 = CFrame.new(0, 500.0, -100.0)
                  Tween(r9_269.HumanoidRootPart.CFrame * r10_269)
                end
              end
              for r6_269, r7_269 in next do
              end
              return
          end
          r32_1["OnChanged"](r35_1)
          r0_1.Options["ToggleMirage"]["SetValue"](false)
          r33_1 = r4_1.Main["AddToggle"]("AutoW", {Title = "Auto Press W", ["Default"] = false})
          local r36_1 = function(r0_82)
            -- line: [0.0, 0.0] id: 82
            _G.AutoW = r0_82
            return
          end
          r33_1["OnChanged"](r36_1)
          r0_1.Options["AutoW"]["SetValue"](false)
          local r35_1 = function()
            -- line: [0.0, 0.0] id: 219
            local r0_219 = wait()
            if not r0_219 then
              local r1_219 = function()
                -- line: [0.0, 0.0] id: 220
                if not _G.AutoW then
                  local r0_220 = game:GetService("VirtualInputManager")
                  r0_220:SendKeyEvent(true, "W", false, game)
                end
                return
              end
              pcall(r1_219)
            end
            return
          end
          spawn(r35_1)
        end
        r4_1.Main:AddParagraph({Title = "Items", Content = "Auto get items"})
        r28_1 = r4_1.Main["AddToggle"]("ToggleHallow", {Title = "Auto Hallow Scythe [Fully]", ["Default"] = false})
        local r31_1 = function(r0_189)
          -- line: [0.0, 0.0] id: 189
          AutoHallowSycthe = r0_189
          return
        end
        r28_1["OnChanged"](r31_1)
        r0_1.Options["ToggleHallow"]["SetValue"](false)
        local r30_1 = function()
          -- line: [0.0, 0.0] id: 199
        end
        local r0_199 = wait()
        if not r0_199 then
          if not AutoHallowSycthe then
            local r1_199 = function()
              -- line: [0.0, 0.0] id: 200
              local r0_200 = game:GetService("Workspace")
              r0_200 = r0_200.Enemies:FindFirstChild("Soul Reaper")
              if not r0_200 then
                local r1_200 = game:GetService("Workspace")
                local r0_200, r1_200, r2_200 = pairs(r1_200.Enemies:GetChildren())
                local r5_200 = string.find(r4_200.Name, "Soul Reaper")
                if not r5_200 then
                end
                task.wait()
                AutoHaki()
                EquipTool(SelectWeapon)
                local r6_200 = Vector3.new(50.0, 50.0, 50.0)
                r4_200.HumanoidRootPart.Size = r6_200
                Tween(r4_200.HumanoidRootPart.CFrame * Pos)
                r4_200.HumanoidRootPart.Transparency = 1.0
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                Click()
                if r4_200.Humanoid.Health > 0 then
                  if AutoHallowSycthe == false then
                  end
                end
                for r3_200, r4_200 in r0_200 do
                end
                r0_200 = game:GetService("Players")
                r0_200 = r0_200.LocalPlayer.Backpack:FindFirstChild("Hallow Essence")
                if r0_200 then
                  r0_200 = game:GetService("Players")
                  r0_200 = r0_200.LocalPlayer.Character:FindFirstChild("Hallow Essence")
                  if not r0_200 then
                  end
                end
                Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                wait()
                r0_200 = CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)
                if r0_200.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 8.0 then
                  EquipTool("Hallow Essence")
                end
                r0_200 = game:GetService("ReplicatedStorage")
                r0_200 = r0_200:FindFirstChild("Soul Reaper")
                if not r0_200 then
                  r1_200 = game:GetService("ReplicatedStorage")
                  r1_200 = r1_200:FindFirstChild("Soul Reaper")
                  r2_200 = CFrame.new(2.0, 20.0, 2.0)
                  Tween(r1_200.HumanoidRootPart.CFrame * r2_200)
                end
                return
            end
            pcall(r1_199)
          end
          return
        end
        spawn(r30_1)
        local r30_1 = function()
          -- line: [0.0, 0.0] id: 73
        end
        local r0_73 = wait(0.001)
        if not r0_73 then
          if not AutoHallowSycthe then
            local r1_73 = game:GetService("ReplicatedStorage")
            r1_73.Remotes.CommF_:InvokeServer(r1_73.Remotes.CommF_)
          end
          return
        end
        spawn(r30_1)
        r29_1 = r4_1.Main["AddToggle"]("ToggleYama", {Title = "Auto Get Yama", ["Default"] = false})
        local r32_1 = function(r0_38)
          -- line: [0.0, 0.0] id: 38
          _G.AutoYama = r0_38
          return
        end
        r29_1["OnChanged"](r32_1)
        r0_1.Options["ToggleYama"]["SetValue"](false)
        local r31_1 = function()
          -- line: [0.0, 0.0] id: 91
        end
      end
    end
  end
  local r0_91 = wait()
  if not r0_91 then
    if not _G.AutoYama then
      r0_91 = game:GetService("ReplicatedStorage")
      r0_91 = r0_91.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
      if 30.0 <= r0_91 then
        wait(0.1)
        local r1_91 = game:GetService("Workspace")
        fireclickdetector(r1_91.Map.Waterfall.SealedKatana.Handle.ClickDetector)
        r0_91 = game:GetService("Players")
        r0_91 = r0_91.LocalPlayer.Backpack:FindFirstChild("Yama")
        if r0_91 then
          if not _G.AutoYama then
          end
          return
        end
        spawn(r31_1)
        r30_1 = r4_1.Main["AddToggle"]("ToggleTushita", {Title = "Auto Tushita", ["Default"] = false})
        local r33_1 = function(r0_146)
          -- line: [0.0, 0.0] id: 146
          _G.Autotushita = r0_146
          return
        end
        r30_1["OnChanged"](r33_1)
        r0_1.Options["ToggleTushita"]["SetValue"](false)
        r31_1 = CFrame["new"](-10238.875976563, 389.7912902832, -9549.7939453125)
        local r33_1 = function()
          -- line: [0.0, 0.0] id: 28
        end
        local r0_28 = wait()
        if not r0_28 then
          if not _G.Autotushita then
            local r1_28 = function()
              -- line: [0.0, 0.0] id: 29
              local r0_29 = game:GetService("Workspace")
              r0_29 = r0_29.Enemies:FindFirstChild("Longma")
              if not r0_29 then
                local r1_29 = game:GetService("Workspace")
                local r0_29, r1_29, r2_29 = pairs(r1_29.Enemies:GetChildren())
                if r4_29.Name == "Longma" then
                  local r5_29 = r4_29:FindFirstChild("Humanoid")
                  if not r5_29 then
                    r5_29 = r4_29:FindFirstChild("HumanoidRootPart")
                    if not r5_29 then
                      if 0 < r4_29.Humanoid.Health then
                      end
                      task.wait()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      r4_29.HumanoidRootPart.CanCollide = false
                      r4_29.Humanoid.WalkSpeed = 0
                      local r6_29 = Vector3.new(50.0, 50.0, 50.0)
                      r4_29.HumanoidRootPart.Size = r6_29
                      Tween(r4_29.HumanoidRootPart.CFrame * Pos)
                      Click()
                      sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                      if not _G.Autotushita then
                        if not r4_29.Parent then
                          if r4_29.Humanoid.Health <= 0 then
                          end
                        end
                      end
                    end
                  end
                end
                for r3_29, r4_29 in r0_29 do
                end
                if not BypassTP then
                  if 1500.0 < game.Players.LocalPlayer.Character.HumanoidRootPart.Position - upval_0.Position.Magnitude then
                    BTP(upval_0)
                  end
                  if game.Players.LocalPlayer.Character.HumanoidRootPart.Position - upval_0.Position.Magnitude < 1500.0 then
                    Tween(upval_0)
                  end
                  Tween(upval_0)
                end
                Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                r0_29 = game:GetService("ReplicatedStorage")
                r0_29 = r0_29:FindFirstChild("Longma")
                if not r0_29 then
                  r1_29 = game:GetService("ReplicatedStorage")
                  r1_29 = r1_29:FindFirstChild("Longma")
                  r2_29 = CFrame.new(2.0, 20.0, 2.0)
                  Tween(r1_29.HumanoidRootPart.CFrame * r2_29)
                end
                return
            end
            pcall(r1_28)
          end
          return
        end
        spawn(r33_1)
        r32_1 = r4_1.Main["AddToggle"]("ToggleHoly", {Title = "Auto Holy Torch", ["Default"] = false})
        local r35_1 = function(r0_84)
          -- line: [0.0, 0.0] id: 84
          _G.AutoHolyTorch = r0_84
          return
        end
        r32_1["OnChanged"](r35_1)
        r0_1.Options["ToggleHoly"]["SetValue"](false)
        local r34_1 = function()
          -- line: [0.0, 0.0] id: 114
          local r0_114 = wait(0.5)
          if not r0_114 then
            local r1_114 = function()
              -- line: [0.0, 0.0] id: 115
              if not _G.AutoHolyTorch then
                local r0_115 = game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch")
                if r0_115 then
                  r0_115 = game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch")
                  if not r0_115 then
                  end
                end
                wait(0.2)
                EquipTool("Holy Torch")
                Tween(CFrame.new(-10752.4434, 415.261749, -9367.43848, 1.0, 0, 0, 0, 1.0, 0, 0, 0, 1.0))
                r0_115 = CFrame.new(-10752.4434, 415.261749, -9367.43848)
                if r0_115 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 5.0 then
                  wait(2.0)
                end
                wait(0.2)
                EquipTool("Holy Torch")
                Tween(CFrame.new(-11671.6289, 333.78125, -9474.31934, 0.300932229, 0, -0.953645527, 0, 1.0, 0, 0.953645527, 0, 0.300932229))
                r0_115 = CFrame.new(-11671.6289, 333.78125, -9474.31934)
                if r0_115 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 5.0 then
                  wait(2.0)
                end
                wait(0.2)
                EquipTool("Holy Torch")
                Tween(CFrame.new(-12133.1406, 521.507446, -10654.292, 0.80428642, 0, -0.594241858, 0, 1.0, 0, 0.594241858, 0, 0.80428642))
                r0_115 = CFrame.new(-12133.1406, 521.507446, -10654.292)
                if r0_115 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 5.0 then
                  wait(2.0)
                end
                wait(0.2)
                EquipTool("Holy Torch")
                Tween(CFrame.new(-13336.127, 484.521179, -6985.31689, 0.853732228, 0, -0.520712316, 0, 1.0, 0, 0.520712316, 0, 0.853732228))
                r0_115 = CFrame.new(-13336.127, 484.521179, -6985.31689)
                if r0_115 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 5.0 then
                  wait(2.0)
                  EquipTool("Holy Torch")
                end
                wait(0.2)
                Tween(CFrame.new(-13487.623, 336.436188, -7924.53857, -0.982848108, 0, 0.184417039, 0, 1.0, 0, -0.184417039, 0, -0.982848108))
                r0_115 = CFrame.new(-13487.623, 336.436188, -7924.53857)
                if r0_115 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 5.0 then
                  wait(2.0)
                  Com()
                  wait(20.0)
                end
              end
              return
            end
            pcall(r1_114)
          end
          return
        end
        spawn(r34_1)
        r4_1.Setting:AddParagraph({Title = "Setting", Content = "Setting Farm"})
        r33_1 = r4_1.Setting["AddToggle"]("ToggleTurnOnV4", {Title = "Turn On V4", ["Default"] = true})
        local r36_1 = function(r0_22)
          -- line: [0.0, 0.0] id: 22
          TurnOnV4 = r0_22
          return
        end
        r33_1["OnChanged"](r36_1)
        local r35_1 = function()
          -- line: [0.0, 0.0] id: 23
        end
      end
    end
  end
  local r0_23 = task.wait()
  if not r0_23 then
    task.wait()
    if not TurnOnV4 then
      r0_23 = game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy")
      if not r0_23 then
        if 1.0 <= game.Players.LocalPlayer.Character.RaceEnergy.Value then
          if game.Players.LocalPlayer.Character.RaceTransformed.Value then
            r0_23 = game:service("VirtualInputManager")
            r0_23:SendKeyEvent(true, "Y", false, game)
            task.wait()
            r0_23:SendKeyEvent(false, "Y", false, game)
          end
          return
        end
        task.spawn(r35_1)
        r34_1 = r4_1.Setting["AddToggle"]("ToggleBringMob", {Title = "Fast Attack", ["Default"] = true})
        local r37_1 = function(r0_182)
          -- line: [0.0, 0.0] id: 182
          FastAttack = r0_182
          return
        end
        r34_1["OnChanged"](r37_1)
        r35_1 = r4_1.Setting["AddToggle"]("ToggleBringMob", {Title = "Bring Mob", ["Default"] = true})
        local r38_1 = function(r0_17)
          -- line: [0.0, 0.0] id: 17
          BringMobs = r0_17
          return
        end
        r35_1["OnChanged"](r38_1)
        r0_1.Options["ToggleBringMob"]["SetValue"](true)
        local r37_1 = function()
          -- line: [0.0, 0.0] id: 193
        end
        local r0_193 = task.wait()
        if not r0_193 then
          if not BringMobs then
            local r1_193 = function()
              -- line: [0.0, 0.0] id: 194
              local r0_194, r1_194, r2_194 = pairs(game.Workspace.Enemies:GetChildren())
              local r5_194 = string.find(r4_194.Name, "Boss")
              if r5_194 then
                if r4_194.Name == MonFarm then
                  if r4_194.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 350.0 then
                    r5_194 = InMyNetWork(r4_194.HumanoidRootPart)
                    if not r5_194 then
                      r5_194 = InMyNetWork(r4_194.HumanoidRootPart)
                      if not r5_194 then
                        r4_194.HumanoidRootPart.CFrame = FarmPos
                        r4_194.HumanoidRootPart.CanCollide = false
                        local r6_194 = Vector3.new(1.0, 1.0, 1.0)
                        r4_194.HumanoidRootPart.Size = r6_194
                      end
                    end
                  end
                end
              end
              for r3_194, r4_194 in r0_194 do
                return
            end
            pcall(r1_193)
          end
          return
        end
        task.spawn(r37_1)
        local r37_1 = function()
          -- line: [0.0, 0.0] id: 105
        end
        wait()
        if not setscriptable then
          setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
        end
        if not sethiddenproperty then
          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
          return
        end
        task.spawn(r37_1)
        function InMyNetWork(r0_249)
          -- line: [0.0, 0.0] id: 249
          if not isnetworkowner then
            return isnetworkowner(r0_249)
            return 
          end
          if r0_249.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 350.0 then
            return true
          end
          return false
        end
        r36_1 = r4_1.Setting["AddToggle"]("ToggleBypassTP", {Title = "Bypass Tp", ["Default"] = false})
        local r39_1 = function(r0_80)
          -- line: [0.0, 0.0] id: 80
          BypassTP = r0_80
          return
        end
        r36_1["OnChanged"](r39_1)
        r0_1.Options["ToggleBypassTP"]["SetValue"](false)
        r6_1 = r4_1.Setting["AddToggle"]({
          "Pirate Port",
          "Amazon",
          "Marine Tree",
          "Deep Forest",
          "Haunted Castle",
          "Nut Island",
          "Ice Cream Island",
          "Cake Island",
          "Choco Island",
          "Candy Island",
          "Tiki Outpost",
        }, {Title = "Remove Dame Text", ["Default"] = true})
        local r9_1 = function(r0_248)
          -- line: [0.0, 0.0] id: 248
          WScriptRemovetext = r0_248
          return
        end
        r6_1["OnChanged"](r9_1)
        r0_1.Options["ToggleRemove"]["SetValue"](true)
        local r8_1 = function()
          -- line: [0.0, 0.0] id: 129
          local r0_129 = wait()
          if not r0_129 then
            if not WScriptRemovetext then
              r0_129 = game:GetService("ReplicatedStorage")
              r0_129.Assets.GUI.DamageCounter.Enabled = false
            end
            r0_129 = game:GetService("ReplicatedStorage")
            r0_129.Assets.GUI.DamageCounter.Enabled = true
          end
          return
        end
        spawn(r8_1)
        r4_1.Setting:AddParagraph({Title = "Setting Skill", Content = "Skill use for farm mastery"})
        r7_1 = r4_1.Setting["AddToggle"]("ToggleZ", {Title = "Skill Z", ["Default"] = true})
        local r10_1 = function(r0_51)
          -- line: [0.0, 0.0] id: 51
          SkillZ = r0_51
          return
        end
        r7_1["OnChanged"](r10_1)
        r0_1.Options["ToggleZ"]["SetValue"](true)
        r8_1 = r4_1.Setting["AddToggle"]("ToggleX", {Title = "Skill X", ["Default"] = true})
        local r11_1 = function(r0_209)
          -- line: [0.0, 0.0] id: 209
          SkillX = r0_209
          return
        end
        r8_1["OnChanged"](r11_1)
        r0_1.Options["ToggleX"]["SetValue"](true)
        r9_1 = r4_1.Setting["AddToggle"]("ToggleC", {Title = "Skill C", ["Default"] = true})
        local r12_1 = function(r0_124)
          -- line: [0.0, 0.0] id: 124
          SkillC = r0_124
          return
        end
        r9_1["OnChanged"](r12_1)
        r0_1.Options["ToggleC"]["SetValue"](true)
        r10_1 = r4_1.Setting["AddToggle"]("ToggleV", {Title = "Skill V", ["Default"] = true})
        local r13_1 = function(r0_61)
          -- line: [0.0, 0.0] id: 61
          SkillV = r0_61
          return
        end
        r10_1["OnChanged"](r13_1)
        r0_1.Options["ToggleV"]["SetValue"](true)
        r11_1 = r4_1.Setting["AddToggle"]("ToggleF", {Title = "Skill F", ["Default"] = true})
        local r14_1 = function(r0_106)
          -- line: [0.0, 0.0] id: 106
          SkillF = r0_106
          return
        end
        r11_1["OnChanged"](r14_1)
        r0_1.Options["ToggleF"]["SetValue"](true)
        r12_1 = r4_1.Stats["AddToggle"]("ToggleMelee", {Title = "Auto Melee", ["Default"] = false})
        local r15_1 = function(r0_316)
          -- line: [0.0, 0.0] id: 316
          _G.Auto_Stats_Melee = r0_316
          return
        end
        r12_1["OnChanged"](r15_1)
        r0_1.Options["ToggleMelee"]["SetValue"](false)
        r13_1 = r4_1.Stats["AddToggle"]("ToggleDe", {Title = "Auto Defense", ["Default"] = false})
        local r16_1 = function(r0_65)
          -- line: [0.0, 0.0] id: 65
          _G.Auto_Stats_Defense = r0_65
          return
        end
        r13_1["OnChanged"](r16_1)
        r0_1.Options["ToggleDe"]["SetValue"](false)
        r14_1 = r4_1.Stats["AddToggle"]("ToggleSword", {Title = "Auto Sword", ["Default"] = false})
        local r17_1 = function(r0_222)
          -- line: [0.0, 0.0] id: 222
          _G.Auto_Stats_Sword = r0_222
          return
        end
        r14_1["OnChanged"](r17_1)
        r0_1.Options["ToggleSword"]["SetValue"](false)
        r15_1 = r4_1.Stats["AddToggle"]("ToggleGun", {Title = "Auto Gun", ["Default"] = false})
        local r18_1 = function(r0_170)
          -- line: [0.0, 0.0] id: 170
          _G.Auto_Stats_Gun = r0_170
          return
        end
        r15_1["OnChanged"](r18_1)
        r0_1.Options["ToggleGun"]["SetValue"](false)
        r16_1 = r4_1.Stats["AddToggle"]("ToggleFruit", {Title = "Auto Demon Fruit", ["Default"] = false})
        local r19_1 = function(r0_298)
          -- line: [0.0, 0.0] id: 298
          _G.Auto_Stats_Devil_Fruit = r0_298
          return
        end
        r16_1["OnChanged"](r19_1)
        r0_1.Options["ToggleFruit"]["SetValue"](false)
        local r18_1 = function()
          -- line: [0.0, 0.0] id: 188
        end
        local r0_188 = wait()
        if not r0_188 then
          if not _G.Auto_Stats_Devil_Fruit then
            local r1_188 = game:GetService("ReplicatedStorage")
            r1_188.Remotes.CommF_:InvokeServer(r1_188.Remotes.CommF_)
          end
          return
        end
        spawn(r18_1)
        local r18_1 = function()
          -- line: [0.0, 0.0] id: 32
        end
        local r0_32 = wait()
        if not r0_32 then
          if not _G.Auto_Stats_Gun then
            local r1_32 = game:GetService("ReplicatedStorage")
            r1_32.Remotes.CommF_:InvokeServer(r1_32.Remotes.CommF_)
          end
          return
        end
        spawn(r18_1)
        local r18_1 = function()
          -- line: [0.0, 0.0] id: 300
        end
        local r0_300 = wait()
        if not r0_300 then
          if not _G.Auto_Stats_Sword then
            local r1_300 = game:GetService("ReplicatedStorage")
            r1_300.Remotes.CommF_:InvokeServer(r1_300.Remotes.CommF_)
          end
          return
        end
        spawn(r18_1)
        local r18_1 = function()
          -- line: [0.0, 0.0] id: 15
        end
        local r0_15 = wait()
        if not r0_15 then
          if not _G.Auto_Stats_Defense then
            local r1_15 = game:GetService("ReplicatedStorage")
            r1_15.Remotes.CommF_:InvokeServer(r1_15.Remotes.CommF_)
          end
          return
        end
        spawn(r18_1)
        local r18_1 = function()
          -- line: [0.0, 0.0] id: 154
        end
        local r0_154 = wait()
        if not r0_154 then
          if not _G.Auto_Stats_Melee then
            local r1_154 = game:GetService("ReplicatedStorage")
            r1_154.Remotes.CommF_:InvokeServer(r1_154.Remotes.CommF_)
          end
          return
        end
        spawn(r18_1)
        r19_1 = game:GetService("Players")
        local r18_1, r19_1, r20_1 = pairs(r19_1["GetChildren"]())
        table["insert"](r17_1, r22_1["Name"])
        for r21_1, r22_1 in r18_1 do
          r18_1 = r4_1.Player:AddDropdown("SelectedPly", {
            Title = "Select Players List",
            Values = r17_1,
            ["Multi"] = false,
            ["Default"] = 1.0,
          })
          r18_1["SetValue"]("nil")
          local r21_1 = function(r0_149)
            -- line: [0.0, 0.0] id: 149
            _G.SelectPly = r0_149
            return
          end
          r18_1["OnChanged"](r21_1)
          local r23_1 = function()
            -- line: [0.0, 0.0] id: 139
            upval_0 = r0_139
            upval_1:Clear()
            local r1_139 = game:GetService("Players")
            local r0_139, r1_139, r2_139 = pairs(r1_139:GetChildren())
            upval_1:Add(r4_139.Name)
            for r3_139, r4_139 in r0_139 do
              return
          end
          r4_1.Player["AddButton"]({Title = "Refresh Dropdown", ["Description"] = "Refresh player list", ["Callback"] = r23_1})
          r19_1 = r4_1.Player["AddToggle"]("ToggleTeleport", {Title = "Teleport To Player", ["Default"] = false})
          local r22_1 = function(r0_260)
            -- line: [0.0, 0.0] id: 260
            _G.TeleportPly = r0_260
            local r2_260 = function()
              -- line: [0.0, 0.0] id: 261
              if not _G.TeleportPly then
              end
              local r1_261 = game:GetService("Players")
              Tween(r1_261[_G.SelectPly].Character.HumanoidRootPart.CFrame)
              wait()
              if _G.TeleportPly == false then
              end
              return
            end
            pcall(r2_260)
            return
          end
          r19_1["OnChanged"](r22_1)
          r0_1.Options["ToggleTeleport"]["SetValue"](false)
          r20_1 = r4_1.Player["AddToggle"]("ToggleQuanSat", {Title = "Spectate Player", ["Default"] = false})
          local r23_1 = function(r0_262)
            -- line: [0.0, 0.0] id: 262
            SpectatePlys = r0_262
            local r1_262 = game:GetService("Players")
            local r2_262 = game:GetService("Players")
            r2_262 = r2_262:FindFirstChild(_G.SelectPly)
          end
          wait(0.1)
          local r3_262 = game:GetService("Workspace")
          local r4_262 = game:GetService("Players")
          r4_262 = r4_262:FindFirstChild(_G.SelectPly)
          r3_262.Camera.CameraSubject = r4_262.Character.Humanoid
          if SpectatePlys == false then
            r3_262 = game:GetService("Workspace")
            r4_262 = game:GetService("Players")
            r3_262.Camera.CameraSubject = r4_262.LocalPlayer.Character.Humanoid
            return
          end
          r20_1["OnChanged"](r23_1)
          r0_1.Options["ToggleQuanSat"]["SetValue"](false)
          r4_1.Teleport:AddParagraph({Title = "World", Content = "Sea1 & Sea2 & Sea3"})
          local r25_1 = function()
            -- line: [0.0, 0.0] id: 265
            local r0_265 = game:GetService("ReplicatedStorage")
            r0_265.Remotes.CommF_:InvokeServer("TravelMain")
            return
          end
          r4_1.Teleport["AddButton"]({Title = "First Sea", ["Description"] = "", ["Callback"] = r25_1})
          local r25_1 = function()
            -- line: [0.0, 0.0] id: 94
            local r0_94 = game:GetService("ReplicatedStorage")
            r0_94.Remotes.CommF_:InvokeServer("TravelDressrosa")
            return
          end
          r4_1.Teleport["AddButton"]({Title = "Second Sea", ["Description"] = "", ["Callback"] = r25_1})
          local r25_1 = function()
            -- line: [0.0, 0.0] id: 277
            local r0_277 = game:GetService("ReplicatedStorage")
            r0_277.Remotes.CommF_:InvokeServer("TravelZou")
            return
          end
          r4_1.Teleport["AddButton"]({Title = "Third Sea", ["Description"] = "", ["Callback"] = r25_1})
          r4_1.Teleport:AddParagraph({Title = "Island", Content = "Teleport to Island"})
          if not First_Sea then
            IslandList = r21_1
          end
          if not Second_Sea then
            IslandList = r21_1
          end
          if not Third_Sea then
            IslandList = r21_1
          end
          r21_1 = r4_1.Teleport:AddDropdown("DropdownIsland", {
            Title = "Select Island",
            Values = IslandList,
            ["Multi"] = false,
            ["Default"] = 1.0,
          })
          r21_1["SetValue"]("...")
          local r24_1 = function(r0_153)
            -- line: [0.0, 0.0] id: 153
            _G.SelectIsland = r0_153
            return
          end
          r21_1["OnChanged"](r24_1)
          r22_1 = r4_1.Teleport["AddToggle"]("ToggleIsland", {Title = "Teleport", ["Default"] = false})
          local r25_1 = function(r0_118)
            -- line: [0.0, 0.0] id: 118
            _G.TeleportIsland = r0_118
            if _G.TeleportIsland == true then
            end
            wait()
            if _G.SelectIsland == "WindMill" then
              Tween(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
            end
            if _G.SelectIsland == "Marine" then
              Tween(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
            end
            if _G.SelectIsland == "Middle Town" then
              Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
            end
            if _G.SelectIsland == "Jungle" then
              Tween(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
            end
            if _G.SelectIsland == "Pirate Village" then
              Tween(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
            end
            if _G.SelectIsland == "Desert" then
              Tween(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
            end
            if _G.SelectIsland == "Snow Island" then
              Tween(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
            end
            if _G.SelectIsland == "MarineFord" then
              Tween(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
            end
            if _G.SelectIsland == "Colosseum" then
              Tween(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
            end
            if _G.SelectIsland == "Sky Island 1" then
              Tween(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
            end
            if _G.SelectIsland == "Sky Island 2" then
              local r1_118 = game:GetService("ReplicatedStorage")
              r1_118.Remotes.CommF_:InvokeServer(r1_118.Remotes.CommF_)
            end
            if _G.SelectIsland == "Sky Island 3" then
              r1_118 = game:GetService("ReplicatedStorage")
              r1_118.Remotes.CommF_:InvokeServer(r1_118.Remotes.CommF_)
            end
            if _G.SelectIsland == "Prison" then
              Tween(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
            end
            if _G.SelectIsland == "Magma Village" then
              Tween(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
            end
            if _G.SelectIsland == "Under Water Island" then
              r1_118 = game:GetService("ReplicatedStorage")
              r1_118.Remotes.CommF_:InvokeServer(r1_118.Remotes.CommF_)
            end
            if _G.SelectIsland == "Fountain City" then
              Tween(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
            end
            if _G.SelectIsland == "Shank Room" then
              Tween(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
            end
            if _G.SelectIsland == "Mob Island" then
              Tween(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
            end
            if _G.SelectIsland == "The Cafe" then
              Tween(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
            end
            if _G.SelectIsland == "Frist Spot" then
              Tween(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
            end
            if _G.SelectIsland == "Dark Area" then
              Tween(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
            end
            if _G.SelectIsland == "Flamingo Mansion" then
              Tween(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
            end
            if _G.SelectIsland == "Flamingo Room" then
              Tween(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
            end
            if _G.SelectIsland == "Green Zone" then
              Tween(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
            end
            if _G.SelectIsland == "Factory" then
              Tween(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
            end
            if _G.SelectIsland == "Colossuim" then
              Tween(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
            end
            if _G.SelectIsland == "Zombie Island" then
              Tween(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
            end
            if _G.SelectIsland == "Two Snow Mountain" then
              Tween(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
            end
            if _G.SelectIsland == "Punk Hazard" then
              Tween(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
            end
            if _G.SelectIsland == "Cursed Ship" then
              Tween(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
            end
            if _G.SelectIsland == "Ice Castle" then
              Tween(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
            end
            if _G.SelectIsland == "Forgotten Island" then
              Tween(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
            end
            if _G.SelectIsland == "Ussop Island" then
              Tween(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
            end
            if _G.SelectIsland == "Mini Sky Island" then
              Tween(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
            end
            if _G.SelectIsland == "Great Tree" then
              Tween(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
            end
            if _G.SelectIsland == "Castle On The Sea" then
              BTPZ(CFrame.new(-5075.5092773438, 314.51550292969, -3150.0224609375))
            end
            if _G.SelectIsland == "MiniSky" then
              Tween(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
            end
            if _G.SelectIsland == "Port Town" then
              Tween(CFrame.new(-290.73767089844, 6.7299528121948, 5343.5537109375))
            end
            if _G.SelectIsland == "Hydra Island" then
              Tween(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
            end
            if _G.SelectIsland == "Floating Turtle" then
              Tween(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
            end
            if _G.SelectIsland == "Mansion" then
              r1_118 = game:GetService("ReplicatedStorage")
              r1_118.Remotes.CommF_:InvokeServer(r1_118.Remotes.CommF_)
            end
            if _G.SelectIsland == "Haunted Castle" then
              Tween(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
            end
            if _G.SelectIsland == "Ice Cream Island" then
              Tween(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
            end
            if _G.SelectIsland == "Peanut Island" then
              Tween(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
            end
            if _G.SelectIsland == "Cake Island" then
              Tween(CFrame.new(-1884.7747802734, 19.327526092529, -11666.897460938))
            end
            if _G.SelectIsland == "Cocoa Island" then
              Tween(CFrame.new(87.942764282227, 73.554512023926, -12319.46484375))
            end
            if _G.SelectIsland == "Candy Island" then
              Tween(CFrame.new(-1014.4241943359, 149.11068725586, -14555.962890625))
            end
            if _G.TeleportIsland then
            end
            return
          end
          r22_1["OnChanged"](r25_1)
          r0_1.Options["ToggleIsland"]["SetValue"](false)
          function BTPZ(r0_280)
            -- line: [0.0, 0.0] id: 280
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_280
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_280
            return
          end
          r23_1 = game.ReplicatedStorage:FindFirstChild("Remotes")
          r23_1 = r23_1["CommF_"]["InvokeServer"]("GetFruits")
          Table_DevilFruitSniper = r24_1
          ShopDevilSell = r24_1
          table["insert"](Table_DevilFruitSniper, "Floating Turtle"["Name"])
          if not "Floating Turtle"["OnSale"] then
            table["insert"](ShopDevilSell, "Floating Turtle"["Name"])
          end
          for r27_1, r28_1 in next do
            r24_1 = r4_1.Fruit:AddDropdown({
              "Scrap Metal",
              "Leather",
              "Demonic Wisp",
              "Conjured Cocoa",
              "Dragon Scale",
              "Gunpowder",
              "Fish Tail",
              "Mini Tusk",
            }, {
              Title = "Select Fruit Snipers",
              Values = Table_DevilFruitSniper,
              ["Multi"] = false,
              ["Default"] = 1.0,
            })
            r24_1["SetValue"]("...")
            local r27_1 = function(r0_43)
              -- line: [0.0, 0.0] id: 43
              _G.SelectFruit = r0_43
              return
            end
            r24_1["OnChanged"](r27_1)
            local r29_1 = function()
              -- line: [0.0, 0.0] id: 197
              ShopDevilSell = r0_197
              if not r4_197.OnSale then
                table.insert(ShopDevilSell, r4_197.Name)
              end
              for r3_197, r4_197 in next do
                local r0_197 = table.concat(ShopDevilSell, ",")
                local r6_197 = function()
                  -- line: [0.0, 0.0] id: 198
                  return
                end
                upval_1:Dialog({Title = "Devil Fruit Sell", Content = "Fruit : " .. r0_197 .. " ", Buttons = r4_197})
                return
            end
            r4_1.Fruit["AddButton"]({Title = "Check Devil Fruit Seller", ["Description"] = "", ["Callback"] = r29_1})
            r25_1 = r4_1.Fruit["AddToggle"]("ToggleFruit", {Title = "Buy Fruit Sniper", ["Default"] = false})
            local r28_1 = function(r0_12)
              -- line: [0.0, 0.0] id: 12
              _G.AutoBuyFruitSniper = r0_12
              return
            end
            r25_1["OnChanged"](r28_1)
            r0_1.Options["ToggleFruit"]["SetValue"](false)
            local r27_1 = function()
              -- line: [0.0, 0.0] id: 140
              local r1_140 = function()
                -- line: [0.0, 0.0] id: 141
              end
              local r0_141 = wait(0.1)
              if not r0_141 then
                if not _G.AutoBuyFruitSniper then
                  r0_141 = game:GetService("ReplicatedStorage")
                  r0_141.Remotes.CommF_:InvokeServer("GetFruits")
                  r0_141 = game:GetService("ReplicatedStorage")
                  r0_141.Remotes.CommF_:InvokeServer("PurchaseRawFruit", "_G.SelectFruit", false)
                end
                return
              end
              pcall(r1_140)
              return
            end
            spawn(r27_1)
            r26_1 = r4_1.Fruit["AddToggle"]("ToggleStore", {Title = "Store Fruit", ["Default"] = false})
            local r29_1 = function(r0_299)
              -- line: [0.0, 0.0] id: 299
              _G.AutoStoreFruit = r0_299
              return
            end
            r26_1["OnChanged"](r29_1)
            r0_1.Options["ToggleStore"]["SetValue"](false)
            local r28_1 = function()
              -- line: [0.0, 0.0] id: 8
              local r0_8 = task.wait()
              if not r0_8 then
                if not _G.AutoStoreFruit then
                  local r1_8 = function()
                    -- line: [0.0, 0.0] id: 9
                    if not _G.AutoStoreFruit then
                      local r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Bomb Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Bomb Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        local r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Spike Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Spike Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Chop Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Chop Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Spring Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Spring Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Rocket Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Kilo Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Smoke Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Spin Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Spin Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Flame Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Flame Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Ice Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Ice Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Sand Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Sand Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Dark Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Dark Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Ghost Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Revive Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Diamond Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Light Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Light Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Love Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Love Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Rubber Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Barrier Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Magma Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Magma Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Portal Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Door Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Quake Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Quake Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Spider Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Spider Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Rumble Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Pain Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Paw Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Gravity Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Dough Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Dough Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Shadow Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Venom Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Venom Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Control Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Control Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Spirit Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Soul Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                      end
                      r0_9 = game:GetService("Players")
                      r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Dragon Fruit")
                      if r0_9 then
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")
                        if not r0_9 then
                        end
                        r0_9 = game:GetService("ReplicatedStorage")
                        r4_9 = game:GetService("Players")
                        r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                        r0_9 = game:GetService("Players")
                        r0_9 = r0_9.LocalPlayer.Character:FindFirstChild("Leopard Fruit")
                        if r0_9 then
                          r0_9 = game:GetService("Players")
                          r0_9 = r0_9.LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")
                          if not r0_9 then
                          end
                          r0_9 = game:GetService("ReplicatedStorage")
                          r4_9 = game:GetService("Players")
                          r0_9.Remotes.CommF_:InvokeServer(r0_9.Remotes.CommF_)
                        end
                      end
                    end
                    return
                  end
                  pcall(r1_8)
                end
                wait(0.3)
              end
              return
            end
            spawn(r28_1)
            r27_1 = r4_1.Fruit["AddToggle"]("ToggleRandomFruit", {Title = "Random Fruit", ["Default"] = false})
            local r30_1 = function(r0_285)
              -- line: [0.0, 0.0] id: 285
              _G.Random_Auto = r0_285
              return
            end
            r27_1["OnChanged"](r30_1)
            r0_1.Options["ToggleRandomFruit"]["SetValue"](false)
            local r29_1 = function()
              -- line: [0.0, 0.0] id: 233
              local r1_233 = function()
                -- line: [0.0, 0.0] id: 234
              end
              local r0_234 = wait(0.1)
              if not r0_234 then
                if not _G.Random_Auto then
                  r0_234 = game:GetService("ReplicatedStorage")
                  r0_234.Remotes.CommF_:InvokeServer("Cousin", "Buy")
                end
                return
              end
              pcall(r1_233)
              return
            end
            spawn(r29_1)
            r28_1 = r4_1.Fruit["AddToggle"]("ToggleCollect", {Title = "Collect Devil Fruit", ["Default"] = false})
            local r31_1 = function(r0_279)
              -- line: [0.0, 0.0] id: 279
              _G.Tweenfruit = r0_279
              return
            end
            r28_1["OnChanged"](r31_1)
            r0_1.Options["ToggleCollect"]["SetValue"](false)
            local r30_1 = function()
              -- line: [0.0, 0.0] id: 210
            end
            local r0_210 = wait(0.1)
            if not r0_210 then
              if not _G.Tweenfruit then
                local r0_210, r1_210, r2_210 = pairs(game.Workspace:GetChildren())
                local r5_210 = string.find(r4_210.Name, "Fruit")
                if not r5_210 then
                  TP2(r4_210.Handle.CFrame)
                end
                for r3_210, r4_210 in r0_210 do
                end
                return
            end
            spawn(r30_1)
            r4_1.Fruit:AddParagraph({Title = "Esp", Content = ""})
            r29_1 = r4_1.Fruit["AddToggle"]("ToggleEspPlayer", {Title = "Esp Player", ["Default"] = false})
            local r32_1 = function(r0_2)
              -- line: [0.0, 0.0] id: 2
              ESPPlayer = r0_2
              UpdatePlayerChams()
              return
            end
            r29_1["OnChanged"](r32_1)
            r0_1.Options["ToggleEspPlayer"]["SetValue"](false)
            r30_1 = r4_1.Fruit["AddToggle"]("ToggleEspFruit", {Title = "Esp Devil Fruit", ["Default"] = false})
            local r33_1 = function(r0_19)
              -- line: [0.0, 0.0] id: 19
              DevilFruitESP = r0_19
              if not DevilFruitESP then
                wait()
                UpdateDevilChams()
              end
              return
            end
            r30_1["OnChanged"](r33_1)
            r0_1.Options["ToggleEspFruit"]["SetValue"](false)
            r31_1 = r4_1.Fruit["AddToggle"]("ToggleEspIsland", {Title = "Esp Island", ["Default"] = false})
            local r34_1 = function(r0_36)
              -- line: [0.0, 0.0] id: 36
              IslandESP = r0_36
              if not IslandESP then
                wait()
                UpdateIslandESP()
              end
              return
            end
            r31_1["OnChanged"](r34_1)
            r0_1.Options["ToggleEspIsland"]["SetValue"](false)
            r32_1 = r4_1.Fruit["AddToggle"]("ToggleEspFlower", {Title = "Esp Flower", ["Default"] = false})
            local r35_1 = function(r0_97)
              -- line: [0.0, 0.0] id: 97
              FlowerESP = r0_97
              UpdateFlowerChams()
              return
            end
            r32_1["OnChanged"](r35_1)
            r0_1.Options["ToggleEspFlower"]["SetValue"](false)
            local r34_1 = function()
              -- line: [0.0, 0.0] id: 264
            end
            local r0_264 = wait(2.0)
            if not r0_264 then
              if not FlowerESP then
                UpdateFlowerChams()
              end
              if not DevilFruitESP then
                UpdateDevilChams()
              end
              if not ChestESP then
                UpdateChestChams()
              end
              if not ESPPlayer then
                UpdatePlayerChams()
              end
              if not RealFruitESP then
                UpdateRealFruitChams()
              end
              return
            end
            spawn(r34_1)
            r34_1 = r4_1.Raid:AddDropdown("DropdownRaid", {
              Title = "Select Raid List",
              Values = r33_1,
              ["Multi"] = false,
              ["Default"] = 1.0,
            })
            r34_1["SetValue"]("...")
            local r37_1 = function(r0_18)
              -- line: [0.0, 0.0] id: 18
              SelectChip = r0_18
              return
            end
            r34_1["OnChanged"](r37_1)
            r35_1 = r4_1.Raid["AddToggle"]("ToggleBuy", {Title = "Buy Chip", ["Default"] = false})
            local r38_1 = function(r0_282)
              -- line: [0.0, 0.0] id: 282
              _G.Auto_Buy_Chips_Dungeon = r0_282
              return
            end
            r35_1["OnChanged"](r38_1)
            r0_1.Options["ToggleBuy"]["SetValue"](false)
            local r37_1 = function()
              -- line: [0.0, 0.0] id: 63
            end
            local r0_63 = wait()
            if not r0_63 then
              if not _G.Auto_Buy_Chips_Dungeon then
                local r1_63 = function()
                  -- line: [0.0, 0.0] id: 64
                  local r1_64 = game:GetService("ReplicatedStorage")
                  r1_64.Remotes.CommF_:InvokeServer(r1_64.Remotes.CommF_)
                  return
                end
                pcall(r1_63)
              end
              return
            end
            spawn(r37_1)
            r36_1 = r4_1.Raid["AddToggle"]("ToggleStart", {Title = "Start Raid", ["Default"] = false})
            local r39_1 = function(r0_134)
              -- line: [0.0, 0.0] id: 134
              _G.Auto_StartRaid = r0_134
              return
            end
            r36_1["OnChanged"](r39_1)
            r0_1.Options["ToggleStart"]["SetValue"](false)
            local r38_1 = function()
              -- line: [0.0, 0.0] id: 203
              local r0_203 = wait(0.1)
              if not r0_203 then
                local r1_203 = function()
                  -- line: [0.0, 0.0] id: 204
                  if not _G.Auto_StartRaid then
                    local r0_204 = game:GetService("Players")
                    if r0_204.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                      r0_204 = game:GetService("Workspace")
                      r0_204 = r0_204._WorldOrigin.Locations:FindFirstChild("Island 1")
                      if r0_204 then
                        r0_204 = game:GetService("Players")
                        r0_204 = r0_204.LocalPlayer.Backpack:FindFirstChild("Special Microchip")
                        if r0_204 then
                        end
                        r0_204 = game:GetService("Players")
                        r0_204 = r0_204.LocalPlayer.Character:FindFirstChild("Special Microchip")
                        if not r0_204 then
                        end
                        if not Second_Sea then
                          local r1_204 = game:GetService("Workspace")
                          fireclickdetector(r1_204.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        end
                        if not Third_Sea then
                          r1_204 = game:GetService("Workspace")
                          fireclickdetector(r1_204.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                      end
                    end
                  end
                  return
                end
                pcall(r1_203)
              end
              return
            end
            spawn(r38_1)
            r37_1 = r4_1.Raid["AddToggle"]("ToggleKillAura", {Title = "Kill Aura [Beta]", ["Default"] = false})
            local r40_1 = function(r0_24)
              -- line: [0.0, 0.0] id: 24
              KillAura = r0_24
              return
            end
            r37_1["OnChanged"](r40_1)
            r0_1.Options["ToggleKillAura"]["SetValue"](false)
            r38_1 = game["Workspace"]["Enemies"]["GetChildren"]()
            local r40_1 = function()
              -- line: [0.0, 0.0] id: 239
            end
            local r0_239 = wait()
            if not r0_239 then
              if not KillAura then
                local r0_239, r1_239, r2_239 = pairs(game.Workspace.Enemies:GetChildren())
                local r6_239 = function()
                  -- line: [0.0, 0.0] id: 240
                end
                wait(0.1)
                if not upval_0.Humanoid then
                  upval_0.Humanoid.Health = 0
                  upval_0.HumanoidRootPart.CanCollide = false
                  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
                if not KillAura then
                  if upval_0.Parent then
                  end
                  return
                end
                pcall(r6_239)
                for r3_239, r4_239 in r0_239 do
                end
                return
            end
            spawn(r40_1)
            local r40_1 = function()
              -- line: [0.0, 0.0] id: 212
            end
            local r0_212 = wait()
            if not r0_212 then
              if not KillAura then
                local r0_212, r1_212, r2_212 = pairs(game.Workspace.Enemies:GetDescendants())
                local r5_212 = r4_212:FindFirstChild("Humanoid")
                if not r5_212 then
                  r5_212 = r4_212:FindFirstChild("HumanoidRootPart")
                  if not r5_212 then
                    if r4_212.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < 1500.0 then
                      if 0 < r4_212.Humanoid.Health then
                        r4_212.Humanoid.Health = 0
                      end
                    end
                  end
                end
                for r3_212, r4_212 in r0_212 do
                end
                return
            end
            spawn(r40_1)
            r39_1 = r4_1.Raid["AddToggle"]("ToggleNextIsland", {Title = "Next Island", ["Default"] = false})
            local r42_1 = function(r0_278)
              -- line: [0.0, 0.0] id: 278
              AutoNextIsland = r0_278
              return
            end
            r39_1["OnChanged"](r42_1)
            r0_1.Options["ToggleNextIsland"]["SetValue"](false)
            function IsIslandRaid(r0_98)
              -- line: [0.0, 0.0] id: 98
              local r1_98 = game:GetService("Workspace")
              r1_98 = r1_98._WorldOrigin.Locations:FindFirstChild("Island " .. r0_98)
              if not r1_98 then
                min = 4500.0
                local r2_98 = game:GetService("Workspace")
                local r1_98, r2_98, r3_98 = pairs(r2_98._WorldOrigin.Locations:GetChildren())
                if r5_98.Name == "Island " .. r0_98 then
                  if r5_98.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude < min then
                    min = r5_98.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude
                  end
                end
                for r4_98, r5_98 in r1_98 do
                  r2_98 = game:GetService("Workspace")
                  local r1_98, r2_98, r3_98 = pairs(r2_98._WorldOrigin.Locations:GetChildren())
                  if r5_98.Name == "Island " .. r0_98 then
                    if r5_98.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= min then
                      return r5_98
                    end
                  end
                  for r4_98, r5_98 in r1_98 do
                  end
                  return
            end
            function getNextIsland()
              -- line: [0.0, 0.0] id: 221
              TableIslandsRaid = r0_221
              local r0_221, r1_221, r2_221 = pairs(TableIslandsRaid)
              local r5_221 = IsIslandRaid(2.0)
              if not r5_221 then
                r5_221 = IsIslandRaid(2.0)
                if r5_221.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 4500.0 then
                  return IsIslandRaid(2.0)
                  return 
                end
              end
              for r3_221, r4_221 in r0_221 do
                return
            end
            local r41_1 = function()
              -- line: [0.0, 0.0] id: 190
            end
          end
          local r0_190 = wait()
          if not r0_190 then
            if not AutoNextIsland then
              r0_190 = getNextIsland()
              if not r0_190 then
                local r2_190 = getNextIsland()
                local r3_190 = CFrame.new(0, 60.0, 0)
                local r1_190 = Tween(r2_190.CFrame * r3_190)
                spawn(r1_190, 1.0)
              end
              return
            end
            spawn(r41_1)
            r40_1 = r4_1.Raid["AddToggle"]("ToggleAwake", {Title = "Auto Awake", ["Default"] = false})
            local r43_1 = function(r0_121)
              -- line: [0.0, 0.0] id: 121
              AutoAwakenAbilities = r0_121
              return
            end
            r40_1["OnChanged"](r43_1)
            r0_1.Options["ToggleAwake"]["SetValue"](false)
            local r42_1 = function()
              -- line: [0.0, 0.0] id: 3
            end
            local r0_3 = task.wait()
            if not r0_3 then
              if not AutoAwakenAbilities then
                local r1_3 = function()
                  -- line: [0.0, 0.0] id: 4
                  local r0_4 = game:GetService("ReplicatedStorage")
                  r0_4.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
                  return
                end
                pcall(r1_3)
              end
              return
            end
            spawn(r42_1)
            r41_1 = r4_1.Raid["AddToggle"]("ToggleGetFruit", {Title = "Get Fruit Low Bely", ["Default"] = false})
            local r44_1 = function(r0_309)
              -- line: [0.0, 0.0] id: 309
              _G.Autofruit = r0_309
              return
            end
            r41_1["OnChanged"](r44_1)
            local r43_1 = function()
              -- line: [0.0, 0.0] id: 163
              local r0_163 = wait(0.1)
              if not r0_163 then
                local r1_163 = function()
                  -- line: [0.0, 0.0] id: 164
                  if not _G.Autofruit then
                    local r1_164 = game:GetService("ReplicatedStorage")
                    r1_164.Remotes.CommF_:InvokeServer(r1_164.Remotes.CommF_)
                    local r2_164 = game:GetService("ReplicatedStorage")
                    r2_164.Remotes.CommF_:InvokeServer(r2_164.Remotes.CommF_)
                    local r3_164 = game:GetService("ReplicatedStorage")
                    r3_164.Remotes.CommF_:InvokeServer(r3_164.Remotes.CommF_)
                    local r4_164 = game:GetService("ReplicatedStorage")
                    r4_164.Remotes.CommF_:InvokeServer(r4_164.Remotes.CommF_)
                    local r5_164 = game:GetService("ReplicatedStorage")
                    r5_164.Remotes.CommF_:InvokeServer(r5_164.Remotes.CommF_)
                    local r6_164 = game:GetService("ReplicatedStorage")
                    r6_164.Remotes.CommF_:InvokeServer(r6_164.Remotes.CommF_)
                    local r7_164 = game:GetService("ReplicatedStorage")
                    r7_164.Remotes.CommF_:InvokeServer(r7_164.Remotes.CommF_)
                    local r8_164 = game:GetService("ReplicatedStorage")
                    r8_164.Remotes.CommF_:InvokeServer(r8_164.Remotes.CommF_)
                    local r9_164 = game:GetService("ReplicatedStorage")
                    r9_164.Remotes.CommF_:InvokeServer(r9_164.Remotes.CommF_)
                    local r10_164 = game:GetService("ReplicatedStorage")
                    r10_164.Remotes.CommF_:InvokeServer(r10_164.Remotes.CommF_)
                    local r11_164 = game:GetService("ReplicatedStorage")
                    r11_164.Remotes.CommF_:InvokeServer(r11_164.Remotes.CommF_)
                    local r12_164 = game:GetService("ReplicatedStorage")
                    r12_164.Remotes.CommF_:InvokeServer(r12_164.Remotes.CommF_)
                    local r13_164 = game:GetService("ReplicatedStorage")
                    r13_164.Remotes.CommF_:InvokeServer(r13_164.Remotes.CommF_)
                    local r14_164 = game:GetService("ReplicatedStorage")
                    r14_164.Remotes.CommF_:InvokeServer(r14_164.Remotes.CommF_)
                    local r15_164 = game:GetService("ReplicatedStorage")
                    r15_164.Remotes.CommF_:InvokeServer(r15_164.Remotes.CommF_)
                    local r16_164 = game:GetService("ReplicatedStorage")
                    r16_164.Remotes.CommF_:InvokeServer(r16_164.Remotes.CommF_)
                    local r17_164 = game:GetService("ReplicatedStorage")
                    r17_164.Remotes.CommF_:InvokeServer(r17_164.Remotes.CommF_)
                  end
                  return
                end
                pcall(r1_163)
              end
              return
            end
            spawn(r43_1)
            if not Second_Sea then
              local r46_1 = function()
                -- line: [0.0, 0.0] id: 291
                TP2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                return
              end
              r4_1.Raid["AddButton"]({Title = "Raid Lab", ["Description"] = "", ["Callback"] = r46_1})
            end
            if not Third_Sea then
              local r46_1 = function()
                -- line: [0.0, 0.0] id: 113
                TP2(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1.0, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
                return
              end
              r4_1.Raid["AddButton"]({Title = "Raid Lab", ["Description"] = "", ["Callback"] = r46_1})
            end
            r4_1.Raid:AddParagraph({Title = "Raid Law", Content = ""})
            r42_1 = r4_1.Raid["AddToggle"]("ToggleLaw", {Title = "Auto Law", ["Default"] = false})
            local r45_1 = function(r0_50)
              -- line: [0.0, 0.0] id: 50
              Auto_Law = r0_50
              return
            end
            r42_1["OnChanged"](r45_1)
            r0_1.Options["ToggleLaw"]["SetValue"](false)
            local r44_1 = function()
              -- line: [0.0, 0.0] id: 244
              local r1_244 = function()
                -- line: [0.0, 0.0] id: 245
              end
            end
          end
        end
      end
      local r0_245 = wait()
      if not r0_245 then
        if not Auto_Law then
          r0_245 = game:GetService("Players")
          r0_245 = r0_245.LocalPlayer.Character:FindFirstChild("Microchip")
          if r0_245 then
            r0_245 = game:GetService("Players")
            r0_245 = r0_245.LocalPlayer.Backpack:FindFirstChild("Microchip")
            if r0_245 then
              r0_245 = game:GetService("Workspace")
              r0_245 = r0_245.Enemies:FindFirstChild("Order")
              if r0_245 then
                r0_245 = game:GetService("ReplicatedStorage")
                r0_245 = r0_245:FindFirstChild("Order")
                if r0_245 then
                  wait(1.0)
                  r0_245 = game:GetService("ReplicatedStorage")
                  r0_245.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                  r0_245 = game:GetService("ReplicatedStorage")
                  r0_245.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                end
                return
              end
              pcall(r1_244)
              return
            end
            spawn(r44_1)
            local r44_1 = function()
              -- line: [0.0, 0.0] id: 165
              local r1_165 = function()
                -- line: [0.0, 0.0] id: 166
              end
            end
          end
          local r0_166 = wait(0.1)
          if not r0_166 then
            if not Auto_Law then
              r0_166 = game:GetService("Workspace")
              r0_166 = r0_166.Enemies:FindFirstChild("Order")
              if r0_166 then
                r0_166 = game:GetService("ReplicatedStorage")
                r0_166 = r0_166:FindFirstChild("Order")
                if r0_166 then
                  r0_166 = game:GetService("Players")
                  r0_166 = r0_166.LocalPlayer.Character:FindFirstChild("Microchip")
                  if r0_166 then
                    r0_166 = game:GetService("Players")
                    r0_166 = r0_166.LocalPlayer.Backpack:FindFirstChild("Microchip")
                    if not r0_166 then
                    end
                    local r1_166 = game:GetService("Workspace")
                    fireclickdetector(r1_166.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                  end
                end
              end
              r0_166 = game:GetService("ReplicatedStorage")
              r0_166 = r0_166:FindFirstChild("Order")
              if r0_166 then
                r0_166 = game:GetService("Workspace")
                r0_166 = r0_166.Enemies:FindFirstChild("Order")
                if not r0_166 then
                end
                r0_166 = game:GetService("Workspace")
                r0_166 = r0_166.Enemies:FindFirstChild("Order")
                if not r0_166 then
                  r1_166 = game:GetService("Workspace")
                  local r0_166, r1_166, r2_166 = pairs(r1_166.Enemies:GetChildren())
                  if r4_166.Name == "Order" then
                  end
                  local r5_166 = game:GetService("RunService")
                  r5_166.Heartbeat:wait()
                  AutoHaki()
                  EquipTool(SelectWeapon)
                  Tween(r4_166.HumanoidRootPart.CFrame * Pos)
                  r4_166.HumanoidRootPart.CanCollide = false
                  local r6_166 = Vector3.new(120.0, 120.0, 120.0)
                  r4_166.HumanoidRootPart.Size = r6_166
                  Click()
                  if not r4_166.Parent then
                    if r4_166.Humanoid.Health > 0 then
                      if Auto_Law == false then
                      end
                    end
                  end
                  for r3_166, r4_166 in r0_166 do
                  end
                  r0_166 = game:GetService("ReplicatedStorage")
                  r0_166 = r0_166:FindFirstChild("Order")
                  if not r0_166 then
                    Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                  end
                  return
              end
              pcall(r1_165)
              return
            end
            spawn(r44_1)
            local r47_1 = function()
              -- line: [0.0, 0.0] id: 208
              local r0_208 = game:GetService("Players")
              local r1_208 = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
              r0_208.LocalPlayer.Character.HumanoidRootPart.CFrame = r1_208
              return
            end
            r4_1.Race["AddButton"]({Title = "Timple Of Time", ["Description"] = "", ["Callback"] = r47_1})
            local r47_1 = function()
              -- line: [0.0, 0.0] id: 69
              TP2(CFrame.new(28575.181640625, 14936.627929688, 72.316368103027))
              return
            end
            r4_1.Race["AddButton"]({Title = "Lever Pull", ["Description"] = "", ["Callback"] = r47_1})
            local r47_1 = function()
              -- line: [0.0, 0.0] id: 275
              TP2(CFrame.new(28981.552734375, 14888.426757812, -120.24584960938))
              return
            end
            r4_1.Race["AddButton"]({Title = "Acient One", ["Description"] = "", ["Callback"] = r47_1})
            r4_1.Race:AddParagraph({Title = "Auto Race", Content = ""})
            local r47_1 = function()
              -- line: [0.0, 0.0] id: 167
              local r0_167 = Game:GetService("Players")
              local r1_167 = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
              r0_167.LocalPlayer.Character.HumanoidRootPart.CFrame = r1_167
              wait(0.1)
              r0_167 = Game:GetService("Players")
              r1_167 = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
              r0_167.LocalPlayer.Character.HumanoidRootPart.CFrame = r1_167
              wait(0.1)
              r0_167 = Game:GetService("Players")
              r1_167 = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
              r0_167.LocalPlayer.Character.HumanoidRootPart.CFrame = r1_167
              wait(0.1)
              r0_167 = Game:GetService("Players")
              r1_167 = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
              r0_167.LocalPlayer.Character.HumanoidRootPart.CFrame = r1_167
              wait(0.5)
              r0_167 = game:GetService("Players")
              if r0_167.LocalPlayer.Data.Race.Value == "Human" then
                TP2(CFrame.new(29221.822265625, 14890.975585938, -205.99114990234))
              end
              r0_167 = game:GetService("Players")
              if r0_167.LocalPlayer.Data.Race.Value == "Skypiea" then
                TP2(CFrame.new(28960.158203125, 14919.624023438, 235.03948974609))
              end
              r0_167 = game:GetService("Players")
              if r0_167.LocalPlayer.Data.Race.Value == "Fishman" then
                TP2(CFrame.new(28231.17578125, 14890.975585938, -211.6417388916))
              end
              r0_167 = game:GetService("Players")
              if r0_167.LocalPlayer.Data.Race.Value == "Cyborg" then
                TP2(CFrame.new(28502.681640625, 14895.975585938, -423.72793579102))
              end
              r0_167 = game:GetService("Players")
              if r0_167.LocalPlayer.Data.Race.Value == "Ghoul" then
                TP2(CFrame.new(28674.244140625, 14890.676757812, 445.43106079102))
              end
              r0_167 = game:GetService("Players")
              if r0_167.LocalPlayer.Data.Race.Value == "Mink" then
                TP2(CFrame.new(29012.341796875, 14890.975585938, -380.14926147461))
              end
              return
            end
            r4_1.Race["AddButton"]({Title = "Race Door", ["Description"] = "", ["Callback"] = r47_1})
            r43_1 = r4_1.Race["AddToggle"]("ToggleHumanandghoul", {Title = "Auto [ Human / Ghoul ] Trial", ["Default"] = false})
            local r46_1 = function(r0_52)
              -- line: [0.0, 0.0] id: 52
              KillAura = r0_52
              return
            end
            r43_1["OnChanged"](r46_1)
            r0_1.Options["ToggleHumanandghoul"]["SetValue"](false)
            r44_1 = r4_1.Race["AddToggle"]("ToggleAutotrial1", {Title = "Auto Kill Players Trial", ["Default"] = false})
            local r47_1 = function(r0_168)
              -- line: [0.0, 0.0] id: 168
              KillPlayer = r0_168
              return
            end
            r44_1["OnChanged"](r47_1)
            local r46_1 = function()
              -- line: [0.0, 0.0] id: 142
              local r0_142 = wait()
              if not r0_142 then
                local r1_142 = function()
                  -- line: [0.0, 0.0] id: 143
                  if not KillPlayer then
                    local r1_143 = game:GetService("Workspace")
                    local r0_143, r1_143, r2_143 = pairs(r1_143.Characters:GetChildren())
                    if r4_143.Name ~= game.Players.LocalPlayer.Name then
                      if r4_143.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 500.0 then
                        if 0 < r4_143.Humanoid.Health then
                        end
                        wait()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        Tween(r4_143.HumanoidRootPart.CFrame * Pos)
                        r4_143.HumanoidRootPart.CanCollide = false
                        local r6_143 = Vector3.new(120.0, 120.0, 120.0)
                        r4_143.HumanoidRootPart.Size = r6_143
                        Click()
                        if not KillPlayer then
                          if not r4_143.Parent then
                            if r4_143.Humanoid.Health <= 0 then
                            end
                          end
                        end
                      end
                    end
                    for r3_143, r4_143 in r0_143 do
                    end
                    return
                end
                pcall(r1_142)
              end
              return
            end
            spawn(r46_1)
            r45_1 = r4_1.Race["AddToggle"]("ToggleAutotrial", {Title = "Auto Trial", ["Default"] = false})
            local r48_1 = function(r0_7)
              -- line: [0.0, 0.0] id: 7
              _G.AutoQuestRace = r0_7
              return
            end
            r45_1["OnChanged"](r48_1)
            r0_1.Options["ToggleAutotrial"]["SetValue"](false)
            local r47_1 = function()
              -- line: [0.0, 0.0] id: 224
              local r1_224 = function()
                -- line: [0.0, 0.0] id: 225
              end
            end
          end
          local r0_225 = wait()
          if not r0_225 then
            if not _G.AutoQuestRace then
              r0_225 = game:GetService("Players")
              if r0_225.LocalPlayer.Data.Race.Value == "Human" then
                local r0_225, r1_225, r2_225 = pairs(game.Workspace.Enemies:GetDescendants())
                local r5_225 = r4_225:FindFirstChild("Humanoid")
                if not r5_225 then
                  r5_225 = r4_225:FindFirstChild("HumanoidRootPart")
                  if not r5_225 then
                    if 0 < r4_225.Humanoid.Health then
                      local r6_225 = function()
                        -- line: [0.0, 0.0] id: 227
                      end
                      wait(0.1)
                      upval_0.Humanoid.Health = 0
                      upval_0.HumanoidRootPart.CanCollide = false
                      sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                      if not _G.AutoQuestRace then
                        if not upval_0.Parent then
                          if upval_0.Humanoid.Health <= 0 then
                          end
                        end
                        return
                      end
                      pcall(r6_225)
                    end
                  end
                end
                for r3_225, r4_225 in r0_225 do
                end
                r0_225 = game:GetService("Players")
                if r0_225.LocalPlayer.Data.Race.Value == "Skypiea" then
                  r0_225 = game:GetService("Workspace")
                  if r0_225.Map.SkyTrial.Model.FinishPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <= 2000.0 then
                    wait(2.0)
                    Tween(r0_225.Map.SkyTrial.Model.FinishPart.CFrame)
                    wait(3.0)
                    print("Success Trial")
                  end
                  r0_225 = game:GetService("Players")
                  if r0_225.LocalPlayer.Data.Race.Value == "Fishman" then
                    r1_225 = game:GetService("Workspace")
                    local r0_225, r1_225, r2_225 = pairs(r1_225.SeaBeasts.SeaBeast1:GetDescendants())
                    if r4_225.Name == "HumanoidRootPart" then
                      Tween(r4_225.CFrame * Pos)
                      local r5_225, r6_225, r7_225 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                      local r10_225 = r9_225:IsA("Tool")
                      if not r10_225 then
                        if r9_225.ToolTip == "Melee" then
                          game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_225)
                        end
                      end
                      for r8_225, r9_225 in r5_225 do
                        r5_225 = game:GetService("VirtualInputManager")
                        r5_225:SendKeyEvent(true, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        r5_225 = game:GetService("VirtualInputManager")
                        r5_225:SendKeyEvent(false, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        r5_225 = game:GetService("VirtualInputManager")
                        r5_225:SendKeyEvent(true, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        r5_225 = game:GetService("VirtualInputManager")
                        r5_225:SendKeyEvent(false, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        r5_225 = game:GetService("VirtualInputManager")
                        r5_225:SendKeyEvent(true, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        r5_225 = game:GetService("VirtualInputManager")
                        r5_225:SendKeyEvent(false, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        local r5_225, r6_225, r7_225 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        r10_225 = false:IsA("Tool")
                        if not r10_225 then
                          if false.ToolTip == "Blox Fruit" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(false)
                          end
                        end
                        for r8_225, r9_225 in r5_225 do
                          r5_225 = game:GetService("VirtualInputManager")
                          r5_225:SendKeyEvent(true, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                          r5_225 = game:GetService("VirtualInputManager")
                          r5_225:SendKeyEvent(false, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                          wait(0.2)
                          r5_225 = game:GetService("VirtualInputManager")
                          r5_225:SendKeyEvent(true, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                          r5_225 = game:GetService("VirtualInputManager")
                          r5_225:SendKeyEvent(false, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                          wait(0.2)
                          r5_225 = game:GetService("VirtualInputManager")
                          r5_225:SendKeyEvent(true, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                          r5_225 = game:GetService("VirtualInputManager")
                          r5_225:SendKeyEvent(false, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                          wait(0.5)
                          local r5_225, r6_225, r7_225 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                          r10_225 = false:IsA("Tool")
                          if not r10_225 then
                            if false.ToolTip == "Sword" then
                              game.Players.LocalPlayer.Character.Humanoid:EquipTool(false)
                            end
                          end
                          for r8_225, r9_225 in r5_225 do
                            r5_225 = game:GetService("VirtualInputManager")
                            r5_225:SendKeyEvent(true, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            r5_225 = game:GetService("VirtualInputManager")
                            r5_225:SendKeyEvent(false, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(0.2)
                            r5_225 = game:GetService("VirtualInputManager")
                            r5_225:SendKeyEvent(true, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            r5_225 = game:GetService("VirtualInputManager")
                            r5_225:SendKeyEvent(false, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(0.2)
                            r5_225 = game:GetService("VirtualInputManager")
                            r5_225:SendKeyEvent(true, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            r5_225 = game:GetService("VirtualInputManager")
                            r5_225:SendKeyEvent(false, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(0.5)
                            local r5_225, r6_225, r7_225 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                            r10_225 = false:IsA("Tool")
                            if not r10_225 then
                              if false.ToolTip == "Gun" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(false)
                              end
                            end
                            for r8_225, r9_225 in r5_225 do
                              r5_225 = game:GetService("VirtualInputManager")
                              r5_225:SendKeyEvent(true, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                              r5_225 = game:GetService("VirtualInputManager")
                              r5_225:SendKeyEvent(false, 122.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                              wait(0.2)
                              r5_225 = game:GetService("VirtualInputManager")
                              r5_225:SendKeyEvent(true, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                              r5_225 = game:GetService("VirtualInputManager")
                              r5_225:SendKeyEvent(false, 120.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                              wait(0.2)
                              r5_225 = game:GetService("VirtualInputManager")
                              r5_225:SendKeyEvent(true, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                              r5_225 = game:GetService("VirtualInputManager")
                              r5_225:SendKeyEvent(false, 99.0, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            end
                            for r3_225, r4_225 in r0_225 do
                            end
                            r0_225 = game:GetService("Players")
                            if r0_225.LocalPlayer.Data.Race.Value == "Cyborg" then
                              Tween(CFrame.new(28654.0, 14898.7832, -30.0, 1.0, 0, 0, 0, 1.0, 0, 0, 0, 1.0))
                            end
                            r0_225 = game:GetService("Players")
                            if r0_225.LocalPlayer.Data.Race.Value == "Ghoul" then
                              local r0_225, r1_225, r2_225 = pairs(game.Workspace.Enemies:GetDescendants())
                              r5_225 = -30.0:FindFirstChild("Humanoid")
                              if not r5_225 then
                                r5_225 = -30.0:FindFirstChild("HumanoidRootPart")
                                if not r5_225 then
                                  if 0 < -30.0.Humanoid.Health then
                                    local r6_225 = function()
                                      -- line: [0.0, 0.0] id: 226
                                    end
                                    wait(0.1)
                                    upval_0.Humanoid.Health = 0
                                    upval_0.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if not _G.AutoQuestRace then
                                      if not upval_0.Parent then
                                        if upval_0.Humanoid.Health <= 0 then
                                        end
                                      end
                                      return
                                    end
                                    pcall(r6_225)
                                  end
                                end
                              end
                              for r3_225, r4_225 in r0_225 do
                              end
                              r0_225 = game:GetService("Players")
                              if r0_225.LocalPlayer.Data.Race.Value == "Mink" then
                                r1_225 = game:GetService("Workspace")
                                local r0_225, r1_225, r2_225 = pairs(r1_225:GetDescendants())
                                if -30.0.Name == "StartPoint" then
                                  r7_225 = CFrame.new(0, 10.0, 0)
                                  Tween(-30.0.CFrame * r7_225)
                                end
                                for r3_225, r4_225 in r0_225 do
                                end
                                return
              end
              pcall(r1_224)
              return
            end
            spawn(r47_1)
            r4_1.Race:AddParagraph({Title = "Misc Race", Content = "Auto Farm Acient Quest"})
            r46_1 = r4_1.Race["AddToggle"]("ToggleAutoAcientQuest", {Title = "Auto Acient Quest", ["Default"] = false})
            local r49_1 = function(r0_81)
              -- line: [0.0, 0.0] id: 81
              AutoFarmAcient = r0_81
              return
            end
            r46_1["OnChanged"](r49_1)
            r0_1.Options["ToggleAutoAcientQuest"]["SetValue"](false)
            r47_1 = CFrame["new"](216.21118164062, 126.93520355225, -12599.073242188)
            local r49_1 = function()
              -- line: [0.0, 0.0] id: 74
            end
            local r0_74 = wait()
            if not r0_74 then
              if not AutoFarmAcient then
                local r1_74 = function()
                  -- line: [0.0, 0.0] id: 75
                  local r0_75 = game:GetService("Workspace")
                  r0_75 = r0_75.Enemies:FindFirstChild("Cocoa Warrior")
                  if r0_75 then
                    r0_75 = game:GetService("Workspace")
                    r0_75 = r0_75.Enemies:FindFirstChild("Chocolate Bar Battler")
                    if r0_75 then
                      r0_75 = game:GetService("Workspace")
                      r0_75 = r0_75.Enemies:FindFirstChild("Sweet Thief")
                      if r0_75 then
                        r0_75 = game:GetService("Workspace")
                        r0_75 = r0_75.Enemies:FindFirstChild("Candy Rebel")
                        if not r0_75 then
                        end
                      end
                    end
                    local r1_75 = game:GetService("Workspace")
                    local r0_75, r1_75, r2_75 = pairs(r1_75.Enemies:GetChildren())
                    if r4_75.Name ~= "Cocoa Warrior" then
                      if r4_75.Name ~= "Chocolate Bar Battler" then
                        if r4_75.Name ~= "Sweet Thief" then
                          if r4_75.Name == "Candy Rebel" then
                          end
                        end
                      end
                      local r5_75 = r4_75:FindFirstChild("Humanoid")
                      if not r5_75 then
                        r5_75 = r4_75:FindFirstChild("HumanoidRootPart")
                        if not r5_75 then
                          if 0 < r4_75.Humanoid.Health then
                          end
                          task.wait()
                          AutoHaki()
                          EquipTool(SelectWeapon)
                          BringAcient = true
                          r4_75.HumanoidRootPart.CanCollide = false
                          r4_75.Humanoid.WalkSpeed = 0
                          r4_75.Head.CanCollide = false
                          FarmPos = r4_75.HumanoidRootPart.CFrame
                          Tween(r4_75.HumanoidRootPart.CFrame * Pos)
                          Click()
                          if not AutoFarmAcient then
                            if not r4_75.Parent then
                              if r4_75.Humanoid.Health <= 0 then
                              end
                            end
                            BringAcient = false
                          end
                        end
                      end
                    end
                    for r3_75, r4_75 in r0_75 do
                    end
                    if not BypassTP then
                      BTP(upval_0)
                    end
                    Tween(upval_0)
                    r1_75 = game:GetService("ReplicatedStorage")
                    local r0_75, r1_75, r2_75 = pairs(r1_75:GetChildren())
                    if r4_75.Name == "Cocoa Warrior" then
                      local r7_75 = CFrame.new(2.0, 20.0, 2.0)
                      Tween(r4_75.HumanoidRootPart.CFrame * r7_75)
                    end
                    if r4_75.Name == "Chocolate Bar Battler" then
                      r7_75 = CFrame.new(2.0, 20.0, 2.0)
                      Tween(r4_75.HumanoidRootPart.CFrame * r7_75)
                    end
                    if r4_75.Name == "Sweet Thief" then
                      r7_75 = CFrame.new(2.0, 20.0, 2.0)
                      Tween(r4_75.HumanoidRootPart.CFrame * r7_75)
                    end
                    if r4_75.Name == "Candy Rebel" then
                      r7_75 = CFrame.new(2.0, 20.0, 2.0)
                      Tween(r4_75.HumanoidRootPart.CFrame * r7_75)
                    end
                    for r3_75, r4_75 in r0_75 do
                      return
                end
                pcall(r1_74)
              end
              return
            end
            spawn(r49_1)
            local r49_1 = function()
              -- line: [0.0, 0.0] id: 85
              local r1_85 = function()
                -- line: [0.0, 0.0] id: 86
              end
            end
            local r0_86 = wait()
            if not r0_86 then
              if not AutoFarmAcient then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                  AutoFarmAcient = true
                end
                return
              end
              pcall(r1_85)
              return
            end
            spawn(r49_1)
            local r49_1 = function()
              -- line: [0.0, 0.0] id: 201
              local r0_201 = wait()
              if not r0_201 then
                local r1_201 = function()
                  -- line: [0.0, 0.0] id: 202
                  if not AutoFarmAcient then
                    local r0_202 = game:GetService("VirtualInputManager")
                    r0_202:SendKeyEvent(true, "Y", false, game)
                    wait(0.1)
                    r0_202 = game:GetService("VirtualInputManager")
                    r0_202:SendKeyEvent(false, "Y", false, game)
                  end
                  return
                end
                pcall(r1_201)
              end
              return
            end
            spawn(r49_1)
            local r52_1 = function()
              -- line: [0.0, 0.0] id: 276
              local r0_276 = game:GetService("ReplicatedStorage")
              r0_276 = r0_276:WaitForChild("Remotes")
              r0_276 = r0_276:WaitForChild("CommF_")
              r0_276:InvokeServer("soulGuitarBuy", true)
              r0_276 = game:GetService("ReplicatedStorage")
              r0_276 = r0_276:WaitForChild("Remotes")
              r0_276 = r0_276:WaitForChild("CommF_")
              r0_276:InvokeServer("soulGuitarBuy")
              r0_276 = game:GetService("ReplicatedStorage")
              r0_276 = r0_276:WaitForChild("Remotes")
              r0_276 = r0_276:WaitForChild("CommF_")
              r0_276:InvokeServer("getInventory")
              return
            end
            r4_1.Shop["AddButton"]({Title = "Buy Soul Guitar", ["Description"] = "", ["Callback"] = r52_1})
            r4_1.Shop:AddParagraph({Title = "Acient Shop", Content = ""})
            local r52_1 = function()
              -- line: [0.0, 0.0] id: 109
              local r0_109 = game:GetService("ReplicatedStorage")
              r0_109.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
              return
            end
            r4_1.Shop["AddButton"]({Title = "Buy Acient Quest", ["Description"] = "", ["Callback"] = r52_1})
            r4_1.Shop:AddParagraph({Title = "Bone Shop", Content = ""})
            local r52_1 = function()
              -- line: [0.0, 0.0] id: 104
              local r0_104 = game:GetService("ReplicatedStorage")
              r0_104.Remotes.CommF_:InvokeServer("Bones", "Buy", 1.0, 1.0)
              return
            end
            r4_1.Shop["AddButton"]({Title = "Random Bone", ["Description"] = "", ["Callback"] = r52_1})
            r48_1 = r4_1.Shop["AddToggle"]("AutoRandomBones", {Title = "Auto Random Bone", ["Default"] = false})
            local r51_1 = function()
              -- line: [0.0, 0.0] id: 169
              AutoRandomBones = upval_0.AutoRandomBones.Value
              return
            end
            r48_1["OnChanged"](r51_1)
            local r50_1 = function()
              -- line: [0.0, 0.0] id: 26
            end
            local r0_26 = wait()
            if not r0_26 then
              if not AutoRandomBones then
                r0_26 = game:GetService("ReplicatedStorage")
                r0_26.Remotes.CommF_:InvokeServer("Bones", "Buy", 1.0, 1.0)
              end
              return
            end
            spawn(r50_1)
            r4_1.Shop:AddParagraph({Title = "Race Shop", Content = ""})
            local r53_1 = function()
              -- line: [0.0, 0.0] id: 11
              local r0_11 = game:GetService("ReplicatedStorage")
              r0_11.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4.0)
              r0_11 = game:GetService("ReplicatedStorage")
              r0_11.Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4.0)
              return
            end
            r4_1.Shop["AddButton"]({Title = "Buy Race Ghoul", ["Description"] = "", ["Callback"] = r53_1})
            local r53_1 = function()
              -- line: [0.0, 0.0] id: 145
              local r0_145 = game:GetService("ReplicatedStorage")
              r0_145.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
              return
            end
            r4_1.Shop["AddButton"]({Title = "Buy Race Cyborg", ["Description"] = "", ["Callback"] = r53_1})
            local r53_1 = function()
              -- line: [0.0, 0.0] id: 66
              local r1_66 = game:GetService("ReplicatedStorage")
              r1_66 = r1_66:WaitForChild("Remotes")
              r1_66 = r1_66:WaitForChild("CommF_")
              r1_66:InvokeServer(r1_66)
              return
            end
            r4_1.Shop["AddButton"]({Title = "Random Race", ["Description"] = "", ["Callback"] = r53_1})
            local r53_1 = function()
              -- line: [0.0, 0.0] id: 27
              local r0_27 = game:GetService("ReplicatedStorage")
              r0_27.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", 2.0)
              return
            end
            r4_1.Shop["AddButton"]({Title = "Reset Stats", ["Description"] = "", ["Callback"] = r53_1})
            local r53_1 = function()
              -- line: [0.0, 0.0] id: 266
              local r5_266 = function()
                -- line: [0.0, 0.0] id: 268
                local r0_268 = game:GetService("ReplicatedStorage")
                r0_268.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
                r0_268 = game:GetService("ReplicatedStorage")
                r0_268.Remotes.CommF_:InvokeServer("BartiloQuestProgress")
                return
              end
              local r6_266 = function()
                -- line: [0.0, 0.0] id: 267
                local r0_267 = game:GetService("ReplicatedStorage")
                r0_267.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
                r0_267 = game:GetService("ReplicatedStorage")
                r0_267.Remotes.CommF_:InvokeServer("BartiloQuestProgress")
                return
              end
              upval_0:Dialog({Title = "Join Team", Content = "", Buttons = r3_266})
              return
            end
            r4_1.Misc["AddButton"]({Title = "Join Team", ["Description"] = "", ["Callback"] = r53_1})
            local r49_1 = function()
              -- line: [0.0, 0.0] id: 317
              for r3_317 = 1.0, 100.0, 1.0 do
                if ChooseRegion ~= nil then
                  if ChooseRegion == "" then
                  end
                  ChooseRegion = "Singapore"
                end
                local r4_317 = game:GetService("Players")
                r4_317.LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = ChooseRegion
                r4_317 = game:GetService("ReplicatedStorage")
                r4_317 = r4_317.__ServerBrowser:InvokeServer(r3_317)
                local r5_317, r6_317, r7_317 = pairs(r4_317)
                if r8_317 ~= game.JobId then
                  if r9_317.Count < bO then
                    if not bM[r8_317] then
                      local r10_317 = tick()
                      if 600.0 < r10_317 - bM[r8_317].Time then
                      end
                      local r12_317 = tick()
                      bM[r8_317] = r11_317
                      r10_317 = game:GetService("Players")
                      if not r10_317.LocalPlayer.PlayerGui.Main.InCombat.Visible then
                        Notify({Time = r12_317}, "Founded Server But InCombat", 15.0, "[W-Script]")
                      end
                      wait()
                      AntiLowHealth(math.random(8500.0, 10000.0))
                      r10_317 = game:GetService("Players")
                      if not r10_317.LocalPlayer then
                        r10_317 = game:GetService("Players")
                        if r10_317.LocalPlayer.PlayerGui.Main.InCombat.Visible then
                        end
                        Notify("Script Status", "Joining Server ID: " .. r8_317 .. "\
Region: " .. r9_317.Region, 15.0, "[W-Script]")
                      end
                      Notify("Script Status", "Joining Server ID: " .. r8_317 .. "\
Region: " .. r9_317.Region, 15.0, "[W-Script]")
                      r10_317 = game:GetService("ReplicatedStorage")
                      r10_317.__ServerBrowser:InvokeServer("teleport", r8_317)
                      return true
                    end
                    r10_317 = tick()
                    if 3600.0 < r10_317 - bM[r8_317].Time then
                      bM[r8_317] = nil
                    end
                  end
                end
                for r8_317, r9_317 in r5_317 do
                end
                return false
            end
            function Rejoin()
              -- line: [0.0, 0.0] id: 297
              local r0_297 = game:GetService("TeleportService")
              r0_297:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
              return
            end
            local r54_1 = function()
              -- line: [0.0, 0.0] id: 294
              local r5_294 = function()
                -- line: [0.0, 0.0] id: 296
                Rejoin()
                return
              end
              local r6_294 = function()
                -- line: [0.0, 0.0] id: 295
                upval_0()
                return
              end
              upval_0:Dialog({Title = "Server", Content = "", Buttons = r3_294})
              return
            end
            r4_1.Misc["AddButton"]({Title = "Server", ["Description"] = "", ["Callback"] = r54_1})
            r50_1 = r4_1.Misc:AddDropdown("SelectUI", {
              Title = "Select UI",
              Values = r54_1,
              ["Multi"] = false,
              ["Default"] = 1.0,
            })
            local r53_1 = function(r0_130)
              -- line: [0.0, 0.0] id: 130
              _G.SelectUISSS = r0_130
              return
            end
            r50_1["OnChanged"](r53_1)
            local r55_1 = function()
              -- line: [0.0, 0.0] id: 88
              if _G.SelectUISSS == "Devil Fruit Shop" then
                local r0_88 = game:GetService("ReplicatedStorage")
                r0_88.Remotes.CommF_:InvokeServer("GetFruits")
                game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
              end
              if _G.SelectUISSS == "Titles" then
                r0_88 = game:GetService("ReplicatedStorage")
                r0_88.Remotes.CommF_:InvokeServer("getTitles")
                game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
              end
              if _G.SelectUISSS == "Haki Color" then
                game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
              end
              if _G.SelectUISSS == "Awakening Toggler" then
                game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
              end
              return
            end
            r4_1.Misc["AddButton"]({Title = "Open UI", ["Description"] = "", ["Callback"] = r55_1})
            r51_1 = r4_1.Misc["AddToggle"]("WhiteScreens", {Title = "White Screen", ["Default"] = false})
            local r54_1 = function()
              -- line: [0.0, 0.0] id: 16
              upval_0 = upval_1.WhiteScreens.Value
              return
            end
            r51_1["OnChanged"](r54_1)
            local r53_1 = function()
              -- line: [0.0, 0.0] id: 185
              local r0_185 = wait()
              if not r0_185 then
                if not upval_0 then
                  r0_185 = game:GetService("RunService")
                  r0_185:Set3dRenderingEnabled(false)
                end
                r0_185 = game:GetService("RunService")
                r0_185:Set3dRenderingEnabled(true)
              end
              return
            end
            spawn(r53_1)
            r52_1 = r4_1.Misc["AddToggle"]("Remove_Fog", {Title = "Remove Fog", ["Default"] = false})
            local r55_1 = function()
              -- line: [0.0, 0.0] id: 176
              _G.Remove_Fog = upval_0.Remove_Fog.Value
              if _G.Remove_Fog then
                return
              end
            end
            if not _G.Remove_Fog then
              wait()
              game.Lighting.FogEnd = 9000000000.0
              if _G.Remove_Fog then
                game.Lighting.FogEnd = 2500.0
              end
              return
            end
            r52_1["OnChanged"](r55_1)
            function FpsBoost()
              -- line: [0.0, 0.0] id: 34
              game.Workspace.Terrain.WaterWaveSize = 0
              game.Workspace.Terrain.WaterWaveSpeed = 0
              game.Workspace.Terrain.WaterReflectance = 0
              game.Workspace.Terrain.WaterTransparency = 0
              game.Lighting.GlobalShadows = false
              game.Lighting.FogEnd = 9000000000.0
              game.Lighting.Brightness = 0
              local r5_34 = settings()
              r5_34.Rendering.QualityLevel = "Level01"
              local r5_34, r6_34, r7_34 = pairs(game:GetDescendants())
              local r10_34 = r9_34:IsA("Part")
              if r10_34 then
                r10_34 = r9_34:IsA("Union")
                if r10_34 then
                  r10_34 = r9_34:IsA("CornerWedgePart")
                  if r10_34 then
                    r10_34 = r9_34:IsA("TrussPart")
                    if not r10_34 then
                    end
                  end
                end
                r9_34.Material = "Plastic"
                r9_34.Reflectance = 0
              end
              r10_34 = r9_34:IsA("Decal")
              if r10_34 then
                r10_34 = r9_34:IsA("Texture")
                if not r10_34 then
                  if not true then
                  end
                  r9_34.Transparency = 1.0
                end
              end
              r10_34 = r9_34:IsA("ParticleEmitter")
              if r10_34 then
                r10_34 = r9_34:IsA("Trail")
                if not r10_34 then
                end
                r10_34 = NumberRange.new(0)
                r9_34.Lifetime = r10_34
              end
              r10_34 = r9_34:IsA("Explosion")
              if not r10_34 then
                r9_34.BlastPressure = 1.0
                r9_34.BlastRadius = 1.0
              end
              r10_34 = r9_34:IsA("Fire")
              if r10_34 then
                r10_34 = r9_34:IsA("SpotLight")
                if r10_34 then
                  r10_34 = r9_34:IsA("Smoke")
                  if r10_34 then
                    r10_34 = r9_34:IsA("Sparkles")
                    if not r10_34 then
                    end
                  end
                end
                r9_34.Enabled = false
              end
              r10_34 = r9_34:IsA("MeshPart")
              if not r10_34 then
                r9_34.Material = "Plastic"
                r9_34.Reflectance = 0
                r9_34.TextureID = 1.0385902758729e+16
              end
              for r8_34, r9_34 in r5_34 do
                local r5_34, r6_34, r7_34 = pairs(game.Lighting:GetChildren())
                r10_34 = r9_34:IsA("BlurEffect")
                if r10_34 then
                  r10_34 = r9_34:IsA("SunRaysEffect")
                  if r10_34 then
                    r10_34 = r9_34:IsA("ColorCorrectionEffect")
                    if r10_34 then
                      r10_34 = r9_34:IsA("BloomEffect")
                      if r10_34 then
                        r10_34 = r9_34:IsA("DepthOfFieldEffect")
                        if not r10_34 then
                        end
                      end
                    end
                  end
                  r9_34.Enabled = false
                end
                for r8_34, r9_34 in r5_34 do
                  return
            end
            function WaterRemvoe()
              -- line: [0.0, 0.0] id: 250
              local r0_250, r1_250, r2_250 = pairs(workspace:GetDescendants())
              local r5_250 = string.find(r4_250.Name, "Water")
              if not r5_250 then
                r4_250:Destroy()
              end
              for r3_250, r4_250 in r0_250 do
                return
            end
            function ObjectRemvoe()
              -- line: [0.0, 0.0] id: 144
              local r0_144, r1_144, r2_144 = pairs(workspace:GetDescendants())
              local r5_144 = string.find(r4_144.Name, "Tree")
              if r5_144 then
                r5_144 = string.find(r4_144.Name, "House")
                if r5_144 then
                  r5_144 = string.find(r4_144.Name, "BoatFlower_FlowerBoat")
                  if r5_144 then
                    r5_144 = string.find(r4_144.Name, "LavaParts")
                    if r5_144 then
                      r5_144 = string.find(r4_144.Name, "bloxfruits_bossarea_Cylinder")
                      if r5_144 then
                        r5_144 = string.find(r4_144.Name, "bloxfruits_skull2_Cone")
                        if not r5_144 then
                        end
                      end
                    end
                  end
                end
                r4_144:Destroy()
              end
              for r3_144, r4_144 in r0_144 do
                return
            end
            function InvisibleObject()
              -- line: [0.0, 0.0] id: 112
              local r1_112 = game:GetService("Workspace")
              local r0_112, r1_112, r2_112 = pairs(r1_112:GetDescendants())
              local r5_112 = r4_112:IsA("Part")
              if r5_112 then
                r5_112 = r4_112:IsA("MeshPart")
                if r5_112 then
                  r5_112 = r4_112:IsA("BasePart")
                  if not r5_112 then
                  end
                end
                if not r4_112.Transparency then
                  r4_112.Transparency = 1.0
                end
              end
              for r3_112, r4_112 in r0_112 do
                return
            end
            local r57_1 = function()
              -- line: [0.0, 0.0] id: 70
              FpsBoost()
              return
            end
            r4_1.Misc["AddButton"]({Title = "Fps Boost", ["Description"] = "", ["Callback"] = r57_1})
            local r57_1 = function()
              -- line: [0.0, 0.0] id: 181
              WaterRemvoe()
              ObjectRemvoe()
              InvisibleObject()
              return
            end
            r4_1.Misc["AddButton"]({Title = "Fps Boost 1", ["Description"] = "", ["Callback"] = r57_1})
            local r58_1 = function(r0_218)
              -- line: [0.0, 0.0] id: 218
              _G.JobId = r0_218
              return
            end
            r53_1 = r4_1.Misc["AddInput"]("JobIDInput", {
              Title = "Put Job Id",
              ["Default"] = "None",
              ["Placeholder"] = "Placeholder",
              ["Numeric"] = false,
              ["Finished"] = false,
              ["Callback"] = r58_1,
            })
            local r58_1 = function()
              -- line: [0.0, 0.0] id: 281
              local r0_281 = game:GetService("ReplicatedStorage")
              r0_281.__ServerBrowser:InvokeServer(r0_281.__ServerBrowser)
              return
            end
            r4_1.Misc["AddButton"]({Title = "Join Job ID", ["Description"] = "", ["Callback"] = r58_1})
            r55_1 = require(game.Players.LocalPlayer["PlayerScripts"]["CombatFramework"]["Particle"])
            r57_1 = game:GetService("ReplicatedStorage")
            local r56_1 = require(r57_1["CombatFramework"]["RigLib"])
            local r58_1 = function()
              -- line: [0.0, 0.0] id: 57
              local r0_57 = task.wait()
              if not r0_57 then
                local r1_57 = function()
                  -- line: [0.0, 0.0] id: 58
                  if shared.orl then
                    shared.orl = upval_0.wrapAttackAnimationAsync
                  end
                  if shared.cpc then
                    shared.cpc = upval_1.play
                  end
                  local r1_58 = function(r0_59, r1_59, r2_59, r3_59, r4_59)
                    -- line: [0.0, 0.0] id: 59
                    local r5_59 = upval_0.getBladeHits(r1_59, r2_59, r3_59)
                    if not r5_59 then
                      if not FastAttack then
                        local r7_59 = function()
                          -- line: [0.0, 0.0] id: 60
                          return
                        end
                        upval_1.play = r7_59
                        r0_59:Play(0.01, 0.01, 0.01)
                        r4_59(r5_59)
                        upval_1.play = shared.cpc
                        wait(r0_59.length * 0.5)
                        r0_59:Stop()
                      end
                      r0_59:Play()
                    end
                    return
                  end
                  upval_0.wrapAttackAnimationAsync = r1_58
                  return
                end
                pcall(r1_57)
              end
              return
            end
            spawn(r58_1)
            function CheckKick(r0_157)
              -- line: [0.0, 0.0] id: 157
              if r0_157.Name == "ErrorPrompt" then
                if not r0_157.Visible then
                  if r0_157.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                    local r1_157 = game:GetService("TeleportService")
                    r1_157:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                  end
                end
                r1_157 = r0_157:GetPropertyChangedSignal("Visible")
                local r3_157 = function()
                  -- line: [0.0, 0.0] id: 158
                  if not upval_0.Visible then
                    if upval_0.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                      local r0_158 = game:GetService("TeleportService")
                      r0_158:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                  end
                  return
                end
                r1_157:Connect(r3_157)
              end
              return
            end
            r57_1 = game:GetService("CoreGui")
            r57_1["RobloxPromptGui"]["promptOverlay"]["ChildAdded"]["Connect"](CheckKick)
            r57_1 = game:GetService("VirtualUser")
            r58_1 = game:GetService("Players")
            local r60_1 = function()
              -- line: [0.0, 0.0] id: 46
              local r2_46 = upval_0:Button2Down(0)
              upval_0:Button2Down(upval_0, r2_46, workspace.CurrentCamera.CFrame)
              wait(1.0)
              r2_46 = upval_0:Button2Up(0)
              upval_0:Button2Up(upval_0, r2_46, workspace.CurrentCamera.CFrame)
              return
            end
            r58_1.LocalPlayer["Idled"]["connect"](r60_1)
            r58_1 = Instance["new"]("ScreenGui")
            local r59_1 = Instance["new"]("ImageButton")
            r60_1 = Instance["new"]("UICorner")
            r58_1["Name"] = ""
            if game["CoreGui"] then
            end
            r58_1["Parent"] = game.Players.LocalPlayer.PlayerGui
            r58_1["ZIndexBehavior"] = Enum["ZIndexBehavior"]["Sibling"]
            r59_1["Parent"] = r58_1
            local r62_1 = Color3["fromRGB"](0, 0, 0)
            r59_1["BackgroundColor3"] = r62_1
            r59_1["BackgroundTransparency"] = 1.0
            r59_1["BorderSizePixel"] = 0
            r62_1 = UDim2["new"](0.120833337, 0, 0.0952890813, 0)
            r59_1["Position"] = r62_1
            local r61_1 = UDim2["new"](0, 50.0, 0, 50.0)
            r59_1.Size = r61_1
            r59_1["Draggable"] = true
            r59_1["Image"] = "https://www.roblox.com/asset/?id=15468926036"
            r60_1["Parent"] = r59_1
            local r63_1 = function()
              -- line: [0.0, 0.0] id: 79
              local r0_79 = game:GetService("VirtualInputManager")
              r0_79:SendKeyEvent(true, 305.0, false, game)
              r0_79 = game:GetService("VirtualInputManager")
              r0_79:SendKeyEvent(false, 305.0, false, game)
              return
            end
            r59_1["MouseButton1Down"]["connect"](r63_1)
            r61_1 = loadstring(game:HttpGet("https://unfoldedunrulylanguage.phamducan.repl.co/"))
            r61_1()
            return
