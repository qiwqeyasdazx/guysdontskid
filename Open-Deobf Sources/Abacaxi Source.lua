
if getgenv().AbacaxiHub then
	if game.CoreGui:FindFirstChild("Abacaxi Hub GUI") then
		for i, v in ipairs(game.CoreGui:GetChildren()) do
			if string.find(v.Name, "Abacaxi Hub - Blox Fruit") then
				v:Destroy()
			end
		end
	end
end
getgenv().AbacaxiHub = true

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YuiSess/Bananui/main/Sla"))()

local TweenService = game:GetService('TweenService')
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

getgenv().UIToggled = true
getgenv().AllControls = {}

getgenv().FixLagEnabled = false
task.spawn(function()
	while true do
		task.wait(10)
		if not getgenv().FixLagEnabled then continue end
		pcall(function()
			local lighting = game:GetService("Lighting")
			lighting.GlobalShadows = false
			lighting.FogEnd = 9e9
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
					v.Enabled = false
				end
			end
		end)
	end
end)
task.spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if not getgenv().FixLagEnabled then return end
		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		end)
	end)
end)

local LibraryCompat = {}

function LibraryCompat:Notify(setting)
	pcall(function()
		Library:Notify({
			Title   = setting.Title or "",
			Content = setting.Content or setting.Desc or setting.Description or "",
			Duration = setting.Duration or 5,
		})
	end)
end

function LibraryCompat:ToggleUI()
	getgenv().UIToggled = not getgenv().UIToggled
	pcall(function()
		Library:Toggle()
	end)
end

function LibraryCompat:DestroyUI()
	pcall(function()
		Library:Destroy()
	end)
end

function LibraryCompat:CreateWindow(setting)
	local title = (type(setting) == "table" and setting.Title) or tostring(setting) or "Hub"

	local BananWindow = Library:CreateWindow(title)

	local Main_Function = {}

	function Main_Function:AddTab(tabName)
		tabName = tostring(tabName)
		local BananTab = BananWindow:AddTab(tabName)
		local BananGroupbox = BananTab:AddLeftGroupbox(tabName)

		local _curSec = BananGroupbox

		local function ensureSec()
			return _curSec
		end

		local pagefunc = {}

		function pagefunc:AddSection(name)
			name = tostring(name or "")

			pcall(function()
				if name and name ~= "" then
					BananGroupbox:AddLabel(name)
				end
			end)
			return pagefunc
		end

		function pagefunc:AddToggle(setting)
			pcall(function()
				local key = tostring(setting.Name or setting.Title or "toggle")
				BananGroupbox:AddToggle(key, {
					Text    = key,
					Default = setting.Default or setting.Value or false,
					Callback = setting.Callback or function() end,
				})
			end)
		end

		function pagefunc:AddButton(setting, cb)
			pcall(function()
				local key = tostring(setting.Name or setting.Title or "button")
				BananGroupbox:AddButton({
					Title    = key,
					Callback = setting.Callback or cb or function() end,
				})
			end)
		end

		function pagefunc:AddSlider(setting)
			pcall(function()
				local key  = tostring(setting.Name or setting.Title or "slider")
				local vt   = setting.Value
				local minv = (type(vt) == "table" and vt.Min)     or setting.Min     or 0
				local maxv = (type(vt) == "table" and vt.Max)     or setting.Max     or 100
				local defv = (type(vt) == "table" and vt.Default) or setting.Default or minv
				BananGroupbox:AddSlider(key, {
					Text    = key,
					Default = defv,
					Min     = minv,
					Max     = maxv,
					Suffix  = "",
					Callback = setting.Callback or function() end,
				})
			end)
		end

		function pagefunc:AddDropdown(setting)
			local dd
			pcall(function()
				local key = tostring(setting.Name or setting.Title or "dropdown")
				dd = BananGroupbox:AddDropdown(key, {
					Text    = key,
					Values  = setting.Options or setting.Values or setting.List or {},
					Default = setting.Default or (setting.Options or setting.Values or setting.List or {})[1],
					Callback = setting.Callback or function() end,
				})
			end)
			if dd then
				function dd:Refresh(newList)
					pcall(function()
						if newList and #newList > 0 then
							self:SetValue(newList[1])
						end
					end)
				end
			end
			return dd
		end

		function pagefunc:AddInput(setting, cb)
			pcall(function()
				BananGroupbox:AddInput(tostring(setting.Name or setting.Title or "input"), {
					Name     = setting.Name or setting.Title or "",
					Callback = setting.Callback or cb or function() end,
				})
			end)
		end

		function pagefunc:AddTextBox(setting, cb)
			pagefunc:AddInput(setting, cb)
		end

		function pagefunc:AddParagraph(setting)
			local obj = {}
			pcall(function()
				local lbl
				if setting.Title and setting.Title ~= "" then
					BananGroupbox:AddLabel(tostring(setting.Title))
				end
				if setting.Desc and setting.Desc ~= "" then
					lbl = BananGroupbox:AddLabel(tostring(setting.Desc))
				end
				function obj:SetDesc(text)
					pcall(function()
						if lbl and lbl.SetText then lbl:SetText(tostring(text)) end
					end)
				end
			end)
			return obj
		end

		function pagefunc:AddLabel(text)
			pcall(function()
				BananGroupbox:AddLabel(tostring(text or ""))
			end)
		end

		function pagefunc:AddKeybind(setting)
			pcall(function()
				BananGroupbox:AddKeybind(tostring(setting.Name or setting.Title or "keybind"), {
					Text     = setting.Name or setting.Title or "",
					Default  = setting.Default or "None",
					Callback = setting.Callback or function() end,
				})
			end)
		end

		function pagefunc:AddColorPicker(setting)
			pcall(function()
				BananGroupbox:AddColorPicker(tostring(setting.Name or setting.Title or "color"), {
					Text     = setting.Name or setting.Title or "",
					Default  = setting.Default or Color3.fromRGB(255,255,255),
					Callback = setting.Callback or function() end,
				})
			end)
		end

		function pagefunc:AddDiscordInvite(setting)
			pagefunc:AddButton({
				Title    = "Join Discord: " .. (setting.Name or "Discord"),
				Callback = function()
					pcall(function() setclipboard(setting.Invite or "") end)
				end,
			})
		end

		return pagefunc
	end

	return Main_Function
end

local Library = LibraryCompat

pcall(function()
    local Lighting = game:GetService("Lighting")
    local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
    if atmo then atmo.Density = 0; atmo.Glare = 0; atmo.Haze = 0 end
    for _, eff in pairs(Lighting:GetChildren()) do
        if eff:IsA("BloomEffect") or eff:IsA("SunRaysEffect") or eff:IsA("DepthOfFieldEffect") then
            eff.Enabled = false
        end
    end
    pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Enabled = false
        end
    end
end)

task.spawn(function()
	local Players = game:GetService("Players");
	local LP = Players.LocalPlayer;
	repeat task.wait() until game:IsLoaded();
	repeat task.wait() until LP and LP.Character;
	pcall(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage");

		local function SafeWFC(parent, name)
			local ok, res = pcall(function() return parent:WaitForChild(name) end);
			if not ok or not res then warn("FastAttack SafeWFC falhou: " .. tostring(name)) end;
			return res;
		end;

		local Modules = SafeWFC(ReplicatedStorage, "Modules");
		local Net     = SafeWFC(Modules, "Net");

		local FASettings = { AutoClick = true, ClickDelay = 0 };

		local FastAttack = {
			Distance     = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Fast Attack Range"]) or 100,
			attackMobs   = true,
			attackPlayers = true,
			Equipped     = nil
		};

		local RegisterAttack = SafeWFC(Net, "RE/RegisterAttack");
		local RegisterHit    = SafeWFC(Net, "RE/RegisterHit");

		local function FA_IsAlive(character)
			return character
				and character:FindFirstChild("Humanoid")
				and character.Humanoid.Health > 0;
		end;

		local function FA_ProcessEnemies(OthersEnemies, Folder)
			local BasePart = nil;
			for _, Enemy in ipairs(Folder:GetChildren()) do
				local Head = Enemy:FindFirstChild("Head");
				if Head and FA_IsAlive(Enemy)
					and LP:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
					if Enemy ~= LP.Character then
						table.insert(OthersEnemies, { Enemy, Head });
						BasePart = Head;
					end;
				end;
			end;
			return BasePart;
		end;

		function FastAttack:Attack(BasePart, OthersEnemies)
			if not BasePart or #OthersEnemies == 0 then return end;
			pcall(function()
				RegisterAttack:FireServer(FASettings.ClickDelay or 0);
				RegisterHit:FireServer(BasePart, OthersEnemies);
			end);
		end;

		function FastAttack:AttackNearest()
			local OthersEnemies = {};
			local EnemiesFolder    = workspace:FindFirstChild("Enemies");
			local CharactersFolder = workspace:FindFirstChild("Characters");
			local Part1, Part2 = nil, nil;
			if EnemiesFolder    then Part1 = FA_ProcessEnemies(OthersEnemies, EnemiesFolder)    end;
			if CharactersFolder then Part2 = FA_ProcessEnemies(OthersEnemies, CharactersFolder) end;

			if #OthersEnemies > 0 then
				self:Attack(Part1 or Part2, OthersEnemies);
			end;
		end;

		function FastAttack:BladeHits()

			local wp = _G.ChooseWP or (_G.Settings and _G.Settings.Main and _G.Settings.Main["Select Weapon"]) or "Melee";
			if wp == "Fruit" or wp == "Sword" or wp == "Gun" then
				task.wait(0);
				return;
			end;
			local Equipped = FA_IsAlive(LP.Character) and LP.Character:FindFirstChildOfClass("Tool");
			if Equipped and Equipped.ToolTip ~= "Gun" then
				self:AttackNearest();
			else
				task.wait(0);
			end;
		end;

		task.spawn(function()
			while task.wait(FASettings.ClickDelay) do
				if FASettings.AutoClick
					and (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Fast Attack V1"]) then
					FastAttack:BladeHits();
				end;
			end;
		end);

		getgenv().rz_FastAttack         = FastAttack;
		getgenv().SuperFastAttackEnabled = true;
	end);
end);

pcall(function()
	local UIS = game:GetService("UserInputService");
	local _movementKeys = {
		Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D,
		Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right,
		Enum.KeyCode.Space
	};

	UIS.InputBegan:Connect(function(input, gpe)
		if gpe then return; end;
		for _, key in ipairs(_movementKeys) do
			if input.KeyCode == key then
				if not _G.EclipseStartFarm and not _G.SailBoats and not _G.EclipseAutoTyrant then
					shouldTween = false;
					if _activeTween then pcall(function() _activeTween:Cancel(); end); _activeTween = nil; end;
					_G.StopTween = false;
				end;
				break;
			end;
		end;
	end);

	UIS.InputBegan:Connect(function(input, gpe)
		if gpe then return; end;
		if input.UserInputType == Enum.UserInputType.Touch then
			if not _G.EclipseStartFarm and not _G.SailBoats and not _G.EclipseAutoTyrant then
				shouldTween = false;
				if _activeTween then pcall(function() _activeTween:Cancel(); end); _activeTween = nil; end;
				_G.StopTween = false;
			end;
		end;
	end);
	UIS.InputChanged:Connect(function(input, gpe)
		if gpe then return; end;
		if input.KeyCode == Enum.KeyCode.Thumbstick1 then
			local mag = Vector2.new(input.Position.X, input.Position.Y).Magnitude;
			if mag > 0.15 then
				if not _G.EclipseStartFarm and not _G.SailBoats and not _G.EclipseAutoTyrant then
					shouldTween = false;
					if _activeTween then pcall(function() _activeTween:Cancel(); end); _activeTween = nil; end;
					_G.StopTween = false;
				end;
			end;
		end;
	end);
end);

local Window = Library:CreateWindow({
    Title = "Abacaxi Hub - Blox Fruit",
    SubTitle = "",
    SaveFolder = "AbacaxiHub.json",
    Image = "rbxassetid://117339791592909",
    TitleColor = Color3.fromRGB(255, 210, 0)
})

task.spawn(function()
	task.wait(1)
	pcall(function()
		for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
			if gui:IsA("ScreenGui") then
				for _, v in ipairs(gui:GetDescendants()) do
					if v:IsA("TextLabel") and (
						v.Name == "Title" or v.Name == "TitleLabel" or
						string.find(tostring(v.Text), "Abacaxi") or
						string.find(tostring(v.Text), "Banan")
					) then
						v.RichText = true
						v.Text = '<font color="rgb(255,210,0)">Abacaxi Hub</font> - Blox Fruit'
						v.TextColor3 = Color3.fromRGB(255, 255, 255)
					end
				end
			end
		end
	end)
end)

task.spawn(function()
	pcall(function()
		Library:Notify({
			Title = "Abacaxi Hub - Blox Fruit",
			Content = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
			Icon = "bell",
			Duration = 6
		})
	end)
end)

local InfoTab = Window:AddTab("Tab | Discord")
local ServerTab = Window:AddTab("Tab | Status and Server")
local SettingsTab = Window:AddTab("Tab | Settings")
local HoldAndSkillTab = Window:AddTab("Tab | Hold And Skill")
local SeaSettingsTab = Window:AddTab("Tab | Sea Settings")
local ShopTab = Window:AddTab("Tab | Shop")
local MainTab = Window:AddTab("Tab | Main Farm")
local MultiFarmTab = Window:AddTab("Tab | Multi Farm")
local OthersTab = Window:AddTab("Tab | Others")
local FarmingHopTab = Window:AddTab("Tab | Farming and Hop")
local FruitTab = Window:AddTab("Tab | Fruit")
local RaidTab = Window:AddTab("Tab | Raid")
local DungeonTab = Window:AddTab("Tab | Dungeon")
local CombatTab = Window:AddTab("Tab | PvP")
local RaceTab = Window:AddTab("Tab | Race")
local DragonDojoTab = Window:AddTab("Tab | Dragon Dojo")
local SeaEventTab = Window:AddTab("Tab | Sea Event")
local SeaStackTab = Window:AddTab("Tab | Islands")
local EspTab = Window:AddTab("Tab | Esp")
local TeleportTab = Window:AddTab("Tab | Teleport")
local LocalPlayerTab = Window:AddTab("Tab | Local Player")
local StatsTab = Window:AddTab("Tab | Stats")
local MiscTab = Window:AddTab("Tab | Misc")

task.defer(function()
	pcall(function()
		local MainPage = Library_Function.Gui:FindFirstChild("Main", true)
		if MainPage then
			local concac = MainPage:FindFirstChild("Concacmain", true)
			if concac then
				local ctrl = concac:FindFirstChild("Background1")
				if ctrl then
					local list = ctrl:FindFirstChild("ControlList") or ctrl:FindFirstChildOfClass("ScrollingFrame")
					if list then
						for _, v in pairs(list:GetChildren()) do
							if not v:IsA("UIListLayout") then
								local btn = v:FindFirstChild("PageButton")
								if btn then
									btn:FindFirstAncestorWhichIsA("ScreenGui")
									btn.MouseButton1Click:Fire()
									return
								end
							end
						end
					end
				end
			end
		end
	end)
end)


InfoTab:AddSection(" Abacaxi Hub - Blox Fruit ");
InfoTab:AddParagraph({
	Title = "Abacaxi Hub - Blox Fruit",
	Desc = "Version: R6.1 | Game: Blox Fruits\nMade for the Abacaxi Community\nAll features are free to use."
});
InfoTab:AddParagraph({
	Title = " Discord Server",
	Desc = "Join our community for updates, support and more!\nLink: discord.gg/uVGDsyWVm2"
});
InfoTab:AddButton({
	Title = "Join Abacaxi Hub Discord",
	Desc = "Click to open the Discord invite link",
	Callback = function()
		setclipboard("https://discord.gg/uVGDsyWVm2");
		Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Discord link copied to clipboard!\ndiscord.gg/uVGDsyWVm2", Icon = "bell", Duration = 5});
	end
});
InfoTab:AddLabel("── Credits ──");
InfoTab:AddLabel("Dev: Humanodev");
InfoTab:AddLabel("Owner: Orchidx");
InfoTab:AddLabel(" ");
InfoTab:AddLabel("Obrigado a todos que ajudaram");
InfoTab:AddLabel("o Abacaxi Hub:");
InfoTab:AddLabel("Orchidx | Humano | Zero");
InfoTab:AddLabel("Bianca | Agita | Two");
InfoTab:AddLabel(" ");
InfoTab:AddLabel("Abacaxi Hub - Blox Fruit");

local function FHNotify(title, text, duration)
	pcall(function()
		Library:Notify({
			Title = title,
			Content = text,
			Icon = "bell",
			Duration = duration or 4
		});
	end);
end;

local Hop = function()
	FHNotify("Farm Hop", " Hoping Server...", 5);
	pcall(function()
		local TeleportService = game:GetService("TeleportService");
		local replicated = game:GetService("ReplicatedStorage");
		for i = math.random(1, math.random(40, 75)), 100, 1 do
			local e = replicated.__ServerBrowser:InvokeServer(i);
			for id, sv in next, e do
				if tonumber(sv.Count) < 12 then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, id);
				end;
			end;
		end;
	end);
end;

local function SaveFH()
	pcall(function() (getgenv()).SaveSetting(); end);
end;

FarmingHopTab:AddSection(" Sea 1 Farms");

local _FHAutoSaw = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Saw Sword"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Saw Sword [Sea 1]",
	Desc = "Auto kill The Saw boss para Saw Sword",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Saw Sword"] or false,
	Callback = function(state)
		_FHAutoSaw = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Saw Sword"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.3) do
		pcall(function()
			if _FHAutoSaw then
				local mob = GetConnectionEnemies("The Saw");
				if mob then
					FHNotify("Saw Sword", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHAutoSaw);
					until not _FHAutoSaw or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHAutoSaw then return end;
					FHNotify("Saw Sword", " Boss killed!", 3);
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906);
				end;
			end;
		end);
	end;
end);

local _FHAutoSaber = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Saber Sword"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Saber Sword [Sea 1]",
	Desc = "Auto complete Saber Expert quest chain - Sea 1",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Saber Sword"] or false,
	Callback = function(state)
		_FHAutoSaber = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Saber Sword"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.3) do
		pcall(function()
			local replicated = game:GetService("ReplicatedStorage");
			if _FHAutoSaber and World1 then
				local mob = GetConnectionEnemies("Saber Expert");
				if mob and G.Alive and G.Alive(mob) then
					FHNotify("Saber Sword", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHAutoSaber);
					until mob.Humanoid.Health <= 0 or not _FHAutoSaber;
					if mob.Humanoid.Health <= 0 then
						replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic");
						FHNotify("Saber Sword", " Quest step done!", 3);
					end;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1401.85046, 29.9773273, 8.81916237);
				end;
			end;
		end);
	end;
end);

local _FHAutoUsoap = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Usoap Hat"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Usoap's Hat [Sea 1]",
	Desc = "Auto kill players perto para Usoap Hat",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Usoap Hat"] or false,
	Callback = function(state)
		_FHAutoUsoap = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Usoap Hat"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.3) do
		pcall(function()
			local plr = game.Players.LocalPlayer;
			if _FHAutoUsoap then
				local Root = plr.Character.HumanoidRootPart;
				for _, e in pairs(workspace.Characters:GetChildren()) do
					if e.Name ~= plr.Name and e:FindFirstChild("Humanoid") and e:FindFirstChild("HumanoidRootPart") then
						if e.Humanoid.Health > 0 and (Root.Position - e.HumanoidRootPart.Position).Magnitude <= 230 then
							repeat wait();
								EquipWeapon(_G.Settings.Main["Selected Weapon"]);
								plr.Character.HumanoidRootPart.CFrame = e.HumanoidRootPart.CFrame * CFrame.new(1,1,2);
							until not _FHAutoUsoap or e.Humanoid.Health <= 0 or not e.Parent;
						end;
					end;
				end;
			end;
		end);
	end;
end);

local _FHobsFarm = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Observation"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Farm Observation [All Seas]",
	Desc = "Auto farm Observation Haki (Ken) - Sea 1, 2 e 3",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Observation"] or false,
	Callback = function(state)
		_FHobsFarm = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Observation"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _FHobsFarm then
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true);
				if game.Players.LocalPlayer:GetAttribute("KenDodgesLeft") == 0 then
					KenTest = false;
				elseif game.Players.LocalPlayer:GetAttribute("KenDodgesLeft") > 0 then
					KenTest = true;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			local plr = game.Players.LocalPlayer;
			if _FHobsFarm then
				local mobName = World1 and "Galley Captain" or World2 and "Lava Pirate" or "Venomous Assailant";
				local defaultPos = World1 and CFrame.new(5533.29785,88.1079102,4852.3916) or World2 and CFrame.new(-5478.39209,15.9775667,-5246.9126) or CFrame.new(4530.3540039063,656.75695800781,-131.60952758789);
				local mob = workspace.Enemies:FindFirstChild(mobName);
				if mob then
					repeat wait();
						plr.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * (KenTest and CFrame.new(3,0,0) or CFrame.new(0,50,0));
					until not _FHobsFarm or not mob.Parent;
				else
					plr.Character.HumanoidRootPart.CFrame = defaultPos;
				end;
			end;
		end);
	end;
end);

local _FHBones = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Bones"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Random Bone [All Seas]",
	Desc = "Auto buy Bones aleatoriamente para invocar bosses",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Bones"] or false,
	Callback = function(state)
		_FHBones = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Bones"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _FHBones then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1);
			end;
		end);
	end;
end);

local _FHBisento = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Bisento"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Bisento V2 [Sea 1]",
	Desc = "Auto kill Greybeard para Bisento - Sea 1",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Bisento"] or false,
	Callback = function(state)
		_FHBisento = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Bisento"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.3) do
		if _FHBisento then
			pcall(function()
				local replicated = game:GetService("ReplicatedStorage");
				replicated.Remotes.CommF_:InvokeServer("LoadItem","Bisento");
				local mob = GetConnectionEnemies("Greybeard");
				if mob then
					FHNotify("Bisento V2", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHBisento);
					until not _FHBisento or not mob.Parent or mob.Humanoid.Health <= 0;
					if mob and mob.Humanoid.Health <= 0 then
						FHNotify("Bisento V2", " Greybeard killed!", 3);
					end;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5023.3833007812, 28.652032852173, 4332.3818359375);
				end;
			end);
		end;
	end;
end);

FarmingHopTab:AddSection(" Sea 2 Farms");

local _FHDarkbeard = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Darkbeard"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Darkbeard [Sea 2 + Hop]",
	Desc = "Auto kill Darkbeard - hops server se nao encontrado",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Darkbeard"] or false,
	Callback = function(state)
		_FHDarkbeard = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Darkbeard"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _FHDarkbeard and World2 then
				local mob = GetConnectionEnemies("Darkbeard");
				if mob then
					FHNotify("Darkbeard", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHDarkbeard);
					until not _FHDarkbeard or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHDarkbeard then return end;
					FHNotify("Darkbeard", " Boss killed!", 3);
				else
					FHNotify("Darkbeard", " Hoping Server...", 4);
					TweenPlayer(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625));
					wait(1);
					if not GetConnectionEnemies("Darkbeard") then Hop(); end;
				end;
			end;
		end);
	end;
end);

local _FHWarden = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Warden"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Warden Sword [Sea 2]",
	Desc = "Auto kill Chief Warden para Warden Sword",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Warden"] or false,
	Callback = function(state)
		_FHWarden = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Warden"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.3) do
		pcall(function()
			if _FHWarden then
				local mob = GetConnectionEnemies("Chief Warden");
				if mob then
					FHNotify("Warden Sword", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHWarden);
					until not _FHWarden or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHWarden then return end;
					FHNotify("Warden Sword", " Boss killed!", 3);
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5206.92578, .997753382, 814.976746);
				end;
			end;
		end);
	end;
end);

FarmingHopTab:AddSection(" Sea 3 Farms");

local _FHEliteQuest = false;
FarmingHopTab:AddToggle({
	Title = "Auto Elite Quest [Sea 3]",
	Desc = "Vai ate Diablo/Urban/Deandre, mata o boss elite, hops se nao achar",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Elite Quest"] or false,
	Callback = function(state)
		_FHEliteQuest = state;
		_G.FarmEliteHunt = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then
			_G.Settings.FarmHop["Auto Elite Quest"] = state;
			(getgenv()).SaveSetting();
		end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _G.FarmEliteHunt then
				if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then

					local qt = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
					if string.find(qt, "Diablo") or string.find(qt, "Urban") or string.find(qt, "Deandre") then

						for _, e in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
							if string.find(e.Name,"Diablo") or string.find(e.Name,"Urban") or string.find(e.Name,"Deandre") then
								if e:FindFirstChild("HumanoidRootPart") then
									TweenPlayer(e.HumanoidRootPart.CFrame);
								end;
							end;
						end;

						for _, e in pairs(workspace.Enemies:GetChildren()) do
							if (string.find(e.Name,"Diablo") or string.find(e.Name,"Urban") or string.find(e.Name,"Deandre")) and G.Alive(e) then
								repeat
									wait();
									G.Kill(e, _G.FarmEliteHunt);
									TweenPlayer(e.HumanoidRootPart.CFrame * Pos);
								until not _G.FarmEliteHunt or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible or not e.Parent or e.Humanoid.Health <= 0;
							end;
						end;
					end;
				else

					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("EliteHunter");
				end;

				if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice")
				   or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")
				   or game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
					_G.FarmEliteHunt = false;
					_FHEliteQuest = false;
					FHNotify("Elite Quest", " Got rare item! Stopping.", 5);
				end;
			end;
		end);
	end;
end);

local _FHCitizenQuest = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Citizen Quest"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Citizen Quest / Ken V2 [Sea 3]",
	Desc = "Auto Citizen Quest para desbloquear Ken V2",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Citizen Quest"] or false,
	Callback = function(state)
		_FHCitizenQuest = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Citizen Quest"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local replicated = game:GetService("ReplicatedStorage");
			if _FHCitizenQuest and World3 then
				replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen");
				wait(0.1);
				replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1);
				local mob = GetConnectionEnemies("Forest Pirate") or GetConnectionEnemies("Captain Elephant");
				if mob then
					repeat wait(); G.Kill(mob, _FHCitizenQuest);
					until not _FHCitizenQuest or not mob.Parent or mob.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false;
				end;
			end;
		end);
	end;
end);

local _FHRipIndra = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Rip Indra"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Rip Indra [Sea 3 + Hop]",
	Desc = "Auto kill Rip Indra - hops server se nao encontrado",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Rip Indra"] or false,
	Callback = function(state)
		_FHRipIndra = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Rip Indra"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _FHRipIndra and World3 then
				local mob = GetConnectionEnemies("Rip_Indra");
				if mob then
					FHNotify("Rip Indra", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHRipIndra);
					until not _FHRipIndra or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHRipIndra then return end;
					FHNotify("Rip Indra", " Boss killed!", 3);
				else
					TweenPlayer(CFrame.new(-12386.9, 364.3, -7590.2));
					wait(1);
					if not GetConnectionEnemies("Rip_Indra") then
						FHNotify("Rip Indra", " Hoping Server...", 4);
						Hop();
					end;
				end;
			end;
		end);
	end;
end);

local _FHMarineCoat = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Marine Coat"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Marine Coat [Sea 1 + Hop]",
	Desc = "Auto farm Marine Coat - hops se Vice Admiral nao encontrado",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Marine Coat"] or false,
	Callback = function(state)
		_FHMarineCoat = state;
		_G.MarinesCoat = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Marine Coat"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _FHMarineCoat then
				local mob = GetConnectionEnemies("Vice Admiral") or GetConnectionEnemies("Fleet Admiral");
				if mob then
					FHNotify("Marine Coat", " Vice Admiral Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHMarineCoat);
					until not _FHMarineCoat or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHMarineCoat then return end;
					FHNotify("Marine Coat", " Boss killed! Restarting...", 3);
				else

					TweenPlayer(CFrame.new(-5039.58643, 27.3500385, 4324.68018));
					wait(1);
					if not GetConnectionEnemies("Vice Admiral") then
						FHNotify("Marine Coat", " Hoping Server...", 4);
						Hop();
					end;
				end;
			end;
		end);
	end;
end);

local _FHSwanCoat = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Swan Coat"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto Swan Coat [Sea 2 + Hop]",
	Desc = "Auto kill Don Swan para Swan Coat - Sea 2 Swan Room",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Swan Coat"] or false,
	Callback = function(state)
		_FHSwanCoat = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Swan Coat"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _FHSwanCoat then
				local mob = GetConnectionEnemies("Don Swan");
				if mob then
					FHNotify("Swan Coat", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHSwanCoat);
					until not _FHSwanCoat or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHSwanCoat then return end;
					FHNotify("Swan Coat", " Boss killed!", 3);
				else

					pcall(function() (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905)); end);
					wait(1);
					if not GetConnectionEnemies("Don Swan") then
						FHNotify("Swan Coat", " Hoping Server...", 4);
						Hop();
					end;
				end;
			end;
		end);
	end;
end);

local _FHGodChalice = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto God Chalice"]) or false;
FarmingHopTab:AddToggle({
	Title = "Auto God Chalice [Sea 3 + Hop]",
	Desc = "Auto farm God Chalice - hops quando boss nao encontrado",
	Value = _G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto God Chalice"] or false,
	Callback = function(state)
		_FHGodChalice = state;
		if not state then StopTween(false); end;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto God Chalice"] = state; (getgenv()).SaveSetting(); end;
		SaveFH();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _FHGodChalice then
				local mob = GetConnectionEnemies("Order") or GetConnectionEnemies("Cake Queen");
				if mob then
					FHNotify("God Chalice", " Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHGodChalice);
					until not _FHGodChalice or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHGodChalice then return end;
					FHNotify("God Chalice", " Boss killed!", 3);
				else
					FHNotify("God Chalice", " Hoping Server...", 4);
					wait(1);
					Hop();
				end;
			end;
		end);
	end;
end);

local _FHSkullGuitarMat = false;
FarmingHopTab:AddSection(" Material Farm");
FarmingHopTab:AddToggle({
	Title = "Auto Farm Material Skull Guitar",
	Desc = "Detecta e farma: 250 Ectoplasma (Haunted Ship Sea 2), 500 Bones (Haunted Castle Sea 2), 1 Dark Fragment (Darkbeard Sea 2). Ordem: Darkbeard > Ectoplasma > Ossos.",
	Value = false,
	Callback = function(state)
		_FHSkullGuitarMat = state;
		if _G.Settings and _G.Settings.FarmHop then _G.Settings.FarmHop["Auto Skull Guitar Mat"] = state; (getgenv()).SaveSetting(); end;
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if not _FHSkullGuitarMat or not World2 then return; end;
			local plr = game.Players.LocalPlayer;
			local hasEcto  = CheckItemCount and CheckItemCount("Ectoplasm", 250);
			local hasBones = CheckItemCount and CheckItemCount("Bone", 500);
			local hasFrag  = CheckItemCount and CheckItemCount("Dark Fragment", 1);
			if not hasFrag then
				local mob = GetConnectionEnemies("Darkbeard");
				if mob then
					FHNotify("Skull Guitar", "Matando Darkbeard...", 3);
					repeat wait(); G.Kill(mob, _FHSkullGuitarMat);
					until not _FHSkullGuitarMat or not mob.Parent or mob.Humanoid.Health <= 0;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625);
				end;
			elseif not hasEcto then
				local mob = workspace.Enemies:FindFirstChild("Zombie") or workspace.Enemies:FindFirstChild("Demonic Soul") or workspace.Enemies:FindFirstChild("Cursed Skeleton");
				if mob then
					repeat wait(); G.Kill(mob, _FHSkullGuitarMat);
					until not _FHSkullGuitarMat or not mob.Parent or mob.Humanoid.Health <= 0;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3898, 22, -4100);
				end;
			elseif not hasBones then
				local mob = workspace.Enemies:FindFirstChild("Possessed Mummy") or workspace.Enemies:FindFirstChild("Reaper") or workspace.Enemies:FindFirstChild("Cursed Skeleton");
				if mob then
					repeat wait(); G.Kill(mob, _FHSkullGuitarMat);
					until not _FHSkullGuitarMat or not mob.Parent or mob.Humanoid.Health <= 0;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5000, 22, -3200);
				end;
			else
				_FHSkullGuitarMat = false;
				FHNotify("Skull Guitar", "Todos os materiais coletados!", 6);
			end;
		end);
	end;
end);

pcall(function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
end);
_G.Settings = {
	Main = {
		["Select Weapon"] = "Melee",
		["Farm Level Method"] = "Quest",
		["Auto Farm"] = false,
		["Auto Fast Farm"] = false,
		["Mastery Method"] = "Quest",
		["Auto Farm Fruit Mastery"] = false,
		["Auto Farm Gun Mastery"] = false,
		["Selected Mastery Sword"] = nil,
		["Auto Farm Sword Mastery"] = false,
		["Auto Summon Tyrant Of The Skies"] = false,
		["Auto Kill Tyrant Of The Skies"] = false,
		["Selected Mon"] = nil,
		["Auto Farm Mon"] = false,
		["Selected Boss"] = nil,
		["Auto Farm Boss"] = false,
		["Auto Farm All Boss"] = false,
		["Farm Mode"] = "Level"
	},
	Event = {},
	Farm = {
		["Auto Elite Hunter"] = false,
		["Auto Elite Hunter Hop"] = false,
		["Selected Bone Farm Method"] = "Quest",
		["Auto Farm Bone"] = false,
		["Auto Random Surprise"] = false,
		["Auto Pirate Raid"] = false,
		["Auto Farm Chest Tween"] = false,
		["Auto Farm Chest Instant"] = false,
		["Auto Chest Hop"] = false,
		["Auto Farm Chest Mirage"] = false,
		["Auto Stop Items"] = false,
		["Auto Farm Katakuri"] = false,
		["Auto Spawn Cake Prince"] = false,
		["Auto Kill Cake Prince"] = false,
		["Auto Kill Dough King"] = false,
		["Selected Material"] = nil,
		["Auto Farm Material"] = false
	},
	Multi = {
		["Auto Fully Volcanic"] = false,
		["Auto Reset After Complete"] = false,
		["Auto Collect Egg"] = false,
		["Auto Collect Bone"] = false,
		["Auto Farm Bounty"] = false,
	},
	Setting = {
		["Auto Set Team"] = "Marines",
		["Spin Position"] = false,
		["Farm Distance"] = 35,
		["Player Tween Speed"] = 350,
		["Bring Mob"] = true,
		["Bring Mob Mode"] = "Normal",
		["Bring Mob Range"] = 235,
		["Bone Bring Range"] = 300,
		["Max Bring Mobs"] = 3,
		["Fast Attack"] = true,
		["Fast Attack V1"] = true,
		["Fast Attack V2"] = false,
		["Fast Attack V3"] = false,
		["Fast Attack Mode"] = "Normal",
		["Fast Attack Delay"] = 0.22,
		["Fast Attack Range"] = 60,
		["Attack Aura"] = true,
		["Hide Notification"] = false,
		["Hide Damage Text"] = true,
		["Black Screen"] = false,
		["White Screen"] = false,
		["Hide Monster"] = false,
		["Mastery Health"] = 25,
		["Fruit Mastery Skill Z"] = true,
		["Fruit Mastery Skill X"] = true,
		["Fruit Mastery Skill C"] = true,
		["Fruit Mastery Skill V"] = false,
		["Fruit Mastery Skill F"] = false,
		["Gun Mastery Skill Z"] = true,
		["Gun Mastery Skill X"] = true,
		["Auto Set Spawn Point"] = true,
		["Auto Observation"] = false,
		["Auto Haki"] = true,
		["Auto Rejoin"] = true,
		["Custom Speed Enabled"] = false,
		["Custom Speed Val"] = 16,
		["Custom Jump Enabled"] = false,
		["Custom Jump Pct"] = 100,
		["Fast M1 Fruit"] = false,
	},
	Stats = {
		["Auto Add Melee Stats"] = false,
		["Auto Add Defense Stats"] = false,
		["Auto Add Devil Fruit Stats"] = false,
		["Auto Add Sword Stats"] = false,
		["Auto Add Gun Stats"] = false,
		["Point Stats"] = 1
	},
	Items = {
		["Auto Second Sea"] = false,
		["Auto Third Sea"] = false,
		["Auto Farm Factory"] = false,
		["Auto Super Human"] = false,
		["Auto Death Step"] = false,
		["Auto Fishman Karate"] = false,
		["Auto Electric Claw"] = false,
		["Auto Dragon Talon"] = false,
		["Auto God Human"] = false,
		["Auto Saber"] = false,
		["Auto Buddy Sword"] = false,
		["Auto Soul Guitar"] = false,
		["Auto Rengoku"] = false,
		["Auto Hallow Scythe"] = false,
		["Auto Warden Sword"] = false,
		["Auto Cursed Dual Katana"] = false,
		["Auto CDK"] = false,
		["Auto Yama CDK"] = false,
		["Auto Yama"] = false,
		["Auto Tushita"] = false,
		["Auto Canvander"] = false,
		["Auto Dragon Trident"] = false,
		["Auto Pole"] = false,
		["Auto Shawk Saw"] = false,
		["Auto Greybeard"] = false,
		["Auto Swan Glasses"] = false,
		["Auto Arena Trainer"] = false,
		["Auto Dark Dagger"] = false,
		["Auto Pad Haki"] = false,
		["Spawn Rip Indra"] = false,
		["Auto Kill Rip Indra"] = false,
		["Auto Press Haki Button"] = false,
		["Auto Rainbow Haki"] = false,
		["Auto Holy Torch"] = false,
		["Auto Bartilo Quest"] = false
	},
	Esp = {
		["ESP Player"] = false,
		["ESP Chest"] = false,
		["ESP DevilFruit"] = false,
		["ESP RealFruit"] = false,
		["ESP Flower"] = false,
		["ESP Island"] = false,
		["ESP Npc"] = false,
		["ESP Sea Beast"] = false,
		["ESP Monster"] = false,
		["ESP Mirage"] = false,
		["ESP Kitsune"] = false,
		["ESP Frozen"] = false,
		["ESP Advanced Fruit Dealer"] = false,
		["ESP Aura"] = false,
		["ESP Gear"] = false
	},
	DragonDojo = {
		["Auto Farm Blaze Ember"] = false,
		["Auto Collect Blaze Ember"] = false,
		["Auto Upgrade Draco Trial"] = false,
		["Auto Draco V1"] = false,
		["Auto Draco V2"] = false,
		["Auto Draco V3"] = false,
		["Auto Relic Draco Trial"] = false
	},
	SeaEvent = {
		["Selected Boat"] = "Guardian",
		["Selected Zone"] = "Zone 5",
		["Boat Tween Speed"] = 300,
		["Sail Boat"] = false,
		["Auto Farm Shark"] = true,
		["Auto Farm Piranha"] = true,
		["Auto Farm Fish Crew Member"] = true,
		["Auto Farm Ghost Ship"] = true,
		["Auto Farm Pirate Brigade"] = true,
		["Auto Farm Pirate Grand Brigade"] = true,
		["Auto Farm Terrorshark"] = true,
		["Auto Farm Seabeasts"] = true,
		["Dodge Seabeasts Attack"] = true,
		["Dodge Terrorshark Attack"] = true
	},
	SettingSea = {
		Lightning = false,
		["Increase Boat Speed"] = false,
		["No Clip Rock"] = false,
		["Use Devil Fruit Skill"] = true,
		["Use Melee Skill"] = true,
		["Use Sword Skill"] = true,
		["Use Gun Skill"] = true,
		["Devil Fruit Z Skill"] = true,
		["Devil Fruit X Skill"] = true,
		["Devil Fruit C Skill"] = true,
		["Devil Fruit V Skill"] = false,
		["Devil Fruit F Skill"] = false,
		["Melee Z Skill"] = true,
		["Melee X Skill"] = true,
		["Melee C Skill"] = true,
		["Melee V Skill"] = true
	},
	SeaStack = {
		["Tween To Frozen Dimension"] = false,
		["Summon Frozen Dimension"] = false,
		["Tween To Kitsune Island"] = false,
		["Summon Kitsune Island"] = false,
		["Auto Collect Azure Ember"] = false,
		["Set Azure Ember"] = 20,
		["Auto Trade Azure Ember"] = false,
		["Tween To Mirage Island"] = false,
		["Auto Find Mirage"] = false,
		["Auto Blue Gear"] = false,
		["Teleport To Advanced Fruit Dealer"] = false,
		["Auto Attack Seabeasts"] = false,
		["Summon Prehistoric Island"] = false,
		["Tween To Prehistoric Island"] = false,
		["Auto Kill Lava Golem"] = false
	},
	Race = {
		["Auto Race V2"] = false,
		["Auto Race V3"] = false,
		["Selected Place"] = nil,
		["Teleport To Place"] = false,
		["Auto Buy Gear"] = false,
		["Tween To Highest Mirage"] = false,
		["Find Blue Gear"] = false,
		["Look Moon Ability"] = false,
		["Auto Train"] = false,
		["Auto Kill Player After Trial"] = false,
		["Auto Trial"] = false
	},
	Combat = {
		["Auto Kill Player Quest"] = false,
		["Aimbot Gun"] = false,
		["Aimbot Skill Neares"] = false,
		["Aimbot Skill"] = false,
		["Enable PvP"] = false
	},
	Raid = {
		["Selected Chip"] = nil,
		["Auto Raid"] = false,
		["Auto Awaken"] = false,
		["Price Devil Fruit"] = 1000000,
		["Unstore Devil Fruit"] = false,
		["Law Raid"] = false
	},
	Shop = {
		["Auto Buy Legendary Sword"] = false,
		["Auto Buy Haki Color"] = false
	},
	LocalPlayer = {
		["Infinite Energy"] = false,
		["Infinite Ability"] = true,
		["Infinite Geppo"] = false,
		["Infinite Soru"] = false,
		["Dodge No Cooldown"] = false,
		["Active Race V3"] = false,
		["Active Race V4"] = true,
		["Walk On Water"] = true,
		["No Clip"] = false
	},
	Fruit = {
		["Auto Buy Random Fruit"] = false,
		["Store Rarity Fruit"] = "Common - Mythical",
		["Auto Store Fruit"] = false,
		["Fruit Notification"] = false,
		["Teleport To Fruit"] = false,
		["Tween To Fruit"] = false
	},
	Misc = {
		["Hide Chat"] = false,
		["Hide Leaderboard"] = false,
		["Highlight Mode"] = false
	},
	FarmHop = {
		["Auto Saw Sword"] = false,
		["Auto Saber Sword"] = false,
		["Auto Usoap Hat"] = false,
		["Auto Observation"] = false,
		["Auto Bones"] = false,
		["Auto Bisento"] = false,
		["Auto Darkbeard"] = false,
		["Auto Warden"] = false,
		["Auto Elite Quest"] = false,
		["Auto Citizen Quest"] = false,
		["Auto Rip Indra"] = false,
		["Auto Marine Coat"] = false,
		["Auto Swan Coat"] = false,
		["Auto God Chalice"] = false,
		["Auto Skull Guitar Mat"] = false
	}
};
(getgenv()).Load = function()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("TR6.1") then makefolder("TR6.1"); end;
		if not isfolder("TR6.1/Blox Fruits/") then makefolder("TR6.1/Blox Fruits/"); end;
		local path = "TR6.1/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json";
		if not isfile(path) then
			writefile(path, (game:GetService("HttpService")):JSONEncode(_G.Settings));
		else
			local ok, Decode = pcall(function()
				return (game:GetService("HttpService")):JSONDecode(readfile(path));
			end);
			if ok and type(Decode) == "table" then

				for cat, savedVals in pairs(Decode) do
					if type(_G.Settings[cat]) == "table" and type(savedVals) == "table" then
						for k, v in pairs(savedVals) do
							_G.Settings[cat][k] = v;
						end;
					else
						_G.Settings[cat] = savedVals;
					end;
				end;
			end;
		end;
		print("Loaded!");
	else
		return warn("Status : Undetected Executor");
	end;
end;
(getgenv()).SaveSetting = function()
	if readfile and writefile and isfile and isfolder then
		if not isfile(("TR6.1/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
			(getgenv()).Load();
		else
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("TR6.1/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
			local Array = {};
			for i, v in pairs(_G.Settings) do
				Array[i] = v;
			end;
			writefile("TR6.1/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(Array));
		end;
	else
		return warn("Status : Undetected Executor");
	end;
end;
(getgenv()).Load();
_G.EclipseFarmMode = (_G.Settings.Main and _G.Settings.Main["Farm Mode"]) or "Level";
if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
    World1 = true;
elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
    World2 = true;
elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    World3 = true;
end;
task.spawn(function()
	task.wait(3);
	pcall(function()
		if World1 then
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905));
		elseif World2 then
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.85, 11.67, 1819.78));
		end;
	end);
end);
function CheckQuest()
	local I = game:GetService("Players").LocalPlayer.Data.Level.Value;
	if World1 and I > 699 then I = 650; end;
	if World2 and I > 1499 then I = 1450; end;
	if World1 then
		if I <= 9 then
			Mon="Bandit"; LevelQuest=1; NameQuest="BanditQuest1"; NameMon="Bandit";
			CFrameQuest=CFrame.new(1059,17,1546); CFrameMon=CFrame.new(943,45,1562);
		elseif I<=14 then
			Mon="Monkey"; LevelQuest=1; NameQuest="JungleQuest"; NameMon="Monkey";
			CFrameQuest=CFrame.new(-1598,37,153); CFrameMon=CFrame.new(-1524,50,37);
		elseif I<=29 then
			Mon="Gorilla"; LevelQuest=2; NameQuest="JungleQuest"; NameMon="Gorilla";
			CFrameQuest=CFrame.new(-1598,37,153); CFrameMon=CFrame.new(-1128,40,-451);
		elseif I<=39 then
			Mon="Pirate"; LevelQuest=1; NameQuest="BuggyQuest1"; NameMon="Pirate";
			CFrameQuest=CFrame.new(-1140,4,3829); CFrameMon=CFrame.new(-1262,40,3905);
		elseif I<=59 then
			Mon="Brute"; LevelQuest=2; NameQuest="BuggyQuest1"; NameMon="Brute";
			CFrameQuest=CFrame.new(-1140,4,3829); CFrameMon=CFrame.new(-976,55,4304);
		elseif I<=74 then
			Mon="Desert Bandit"; LevelQuest=1; NameQuest="DesertQuest"; NameMon="Desert Bandit";
			CFrameQuest=CFrame.new(897,6,4389); CFrameMon=CFrame.new(924,7,4482);
		elseif I<=89 then
			Mon="Desert Officer"; LevelQuest=2; NameQuest="DesertQuest"; NameMon="Desert Officer";
			CFrameQuest=CFrame.new(897,6,4389); CFrameMon=CFrame.new(1608,9,4371);
		elseif I<=99 then
			Mon="Snow Bandit"; LevelQuest=1; NameQuest="SnowQuest"; NameMon="Snow Bandit";
			CFrameQuest=CFrame.new(1385,87,-1298); CFrameMon=CFrame.new(1362,120,-1531);
		elseif I<=119 then
			Mon="Snowman"; LevelQuest=2; NameQuest="SnowQuest"; NameMon="Snowman";
			CFrameQuest=CFrame.new(1385,87,-1298); CFrameMon=CFrame.new(1243,140,-1437);
		elseif I<=149 then
			Mon="Chief Petty Officer"; LevelQuest=1; NameQuest="MarineQuest2"; NameMon="Chief Petty Officer";
			CFrameQuest=CFrame.new(-5035,29,4326); CFrameMon=CFrame.new(-4881,23,4274);
		elseif I<=174 then
			Mon="Sky Bandit"; LevelQuest=1; NameQuest="SkyQuest"; NameMon="Sky Bandit";
			CFrameQuest=CFrame.new(-4844,718,-2621); CFrameMon=CFrame.new(-4953,296,-2899);
		elseif I<=189 then
			Mon="Dark Master"; LevelQuest=2; NameQuest="SkyQuest"; NameMon="Dark Master";
			CFrameQuest=CFrame.new(-4844,718,-2621); CFrameMon=CFrame.new(-5260,391,-2229);
		elseif I<=209 then
			Mon="Prisoner"; LevelQuest=1; NameQuest="PrisonerQuest"; NameMon="Prisoner";
			CFrameQuest=CFrame.new(5306,2,477); CFrameMon=CFrame.new(5099,0,474);
		elseif I<=249 then
			Mon="Dangerous Prisoner"; LevelQuest=2; NameQuest="PrisonerQuest"; NameMon="Dangerous Prisoner";
			CFrameQuest=CFrame.new(5306,2,477); CFrameMon=CFrame.new(5655,16,866);
		elseif I<=274 then
			Mon="Toga Warrior"; LevelQuest=1; NameQuest="ColosseumQuest"; NameMon="Toga Warrior";
			CFrameQuest=CFrame.new(-1581,7,-2982); CFrameMon=CFrame.new(-1820,51,-2741);
		elseif I<=299 then
			Mon="Gladiator"; LevelQuest=2; NameQuest="ColosseumQuest"; NameMon="Gladiator";
			CFrameQuest=CFrame.new(-1581,7,-2982); CFrameMon=CFrame.new(-1268,30,-2996);
		elseif I<=324 then
			Mon="Military Soldier"; LevelQuest=1; NameQuest="MagmaQuest"; NameMon="Military Soldier";
			CFrameQuest=CFrame.new(-5319,12,8515); CFrameMon=CFrame.new(-5335,46,8638);
		elseif I<=374 then
			Mon="Military Spy"; LevelQuest=2; NameQuest="MagmaQuest"; NameMon="Military Spy";
			CFrameQuest=CFrame.new(-5319,12,8515); CFrameMon=CFrame.new(-5803,86,8829);
		elseif I<=399 then
			Mon="Fishman Warrior"; LevelQuest=1; NameQuest="FishmanQuest"; NameMon="Fishman Warrior";
			CFrameQuest=CFrame.new(61122,18,1567); CFrameMon=CFrame.new(60998,50,1534);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.85,11.67,1819.78));
			end;
		elseif I<=449 then
			Mon="Fishman Commando"; LevelQuest=2; NameQuest="FishmanQuest"; NameMon="Fishman Commando";
			CFrameQuest=CFrame.new(61122,18,1567); CFrameMon=CFrame.new(61866,55,1655);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.85,11.67,1819.78));
			end;
		elseif I<=474 then
			Mon="God's Guard"; LevelQuest=1; NameQuest="SkyExp1Quest"; NameMon="God's Guard";
			CFrameQuest=CFrame.new(-4720,846,-1951); CFrameMon=CFrame.new(-4720,846,-1951);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82,872.54,-1667.55));
			end;
		elseif I<=524 then
			Mon="Shanda"; LevelQuest=2; NameQuest="SkyExp1Quest"; NameMon="Shanda";
			CFrameQuest=CFrame.new(-7861,5545,-381); CFrameMon=CFrame.new(-7741,5580,-395);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61,5547.14,-380.29));
			end;
		elseif I<=549 then
			Mon="Royal Squad"; LevelQuest=1; NameQuest="SkyExp2Quest"; NameMon="Royal Squad";
			CFrameQuest=CFrame.new(-7903,5636,-1412); CFrameMon=CFrame.new(-7727,5650,-1410);
		elseif I<=624 then
			Mon="Royal Soldier"; LevelQuest=2; NameQuest="SkyExp2Quest"; NameMon="Royal Soldier";
			CFrameQuest=CFrame.new(-7903,5636,-1412); CFrameMon=CFrame.new(-7894,5640,-1629);
		elseif I<=649 then
			Mon="Galley Pirate"; LevelQuest=1; NameQuest="FountainQuest"; NameMon="Galley Pirate";
			CFrameQuest=CFrame.new(5258,39,4052); CFrameMon=CFrame.new(5391,70,4023);
		else
			Mon="Galley Captain"; LevelQuest=2; NameQuest="FountainQuest"; NameMon="Galley Captain";
			CFrameQuest=CFrame.new(5258,39,4052); CFrameMon=CFrame.new(5985,70,4790);
		end;
	elseif World2 then
		if I<=724 then
			Mon="Raider"; LevelQuest=1; NameQuest="Area1Quest"; NameMon="Raider";
			CFrameQuest=CFrame.new(-427,73,1835); CFrameMon=CFrame.new(-614,90,2240);
		elseif I<=774 then
			Mon="Mercenary"; LevelQuest=2; NameQuest="Area1Quest"; NameMon="Mercenary";
			CFrameQuest=CFrame.new(-427,73,1835); CFrameMon=CFrame.new(-867,110,1621);
		elseif I<=874 then
			Mon="Swan Pirate"; LevelQuest=1; NameQuest="Area2Quest"; NameMon="Swan Pirate";
			CFrameQuest=CFrame.new(635,73,919); CFrameMon=CFrame.new(635,73,919);
		elseif I<=899 then
			Mon="Marine Lieutenant"; LevelQuest=1; NameQuest="MarineQuest3"; NameMon="Marine Lieutenant";
			CFrameQuest=CFrame.new(-2441,73,-3219); CFrameMon=CFrame.new(-2552,110,-3050);
		elseif I<=949 then
			Mon="Marine Captain"; LevelQuest=2; NameQuest="MarineQuest3"; NameMon="Marine Captain";
			CFrameQuest=CFrame.new(-2441,73,-3219); CFrameMon=CFrame.new(-1695,110,-3299);
		elseif I<=974 then
			Mon="Zombie"; LevelQuest=1; NameQuest="ZombieQuest"; NameMon="Zombie";
			CFrameQuest=CFrame.new(-5495,48,-794); CFrameMon=CFrame.new(-5715,90,-917);
		elseif I<=999 then
			Mon="Vampire"; LevelQuest=2; NameQuest="ZombieQuest"; NameMon="Vampire";
			CFrameQuest=CFrame.new(-5495,48,-794); CFrameMon=CFrame.new(-6027,50,-1130);
		elseif I<=1049 then
			Mon="Snow Trooper"; LevelQuest=1; NameQuest="SnowMountainQuest"; NameMon="Snow Trooper";
			CFrameQuest=CFrame.new(607,401,-5371); CFrameMon=CFrame.new(445,440,-5175);
		elseif I<=1099 then
			Mon="Winter Warrior"; LevelQuest=2; NameQuest="SnowMountainQuest"; NameMon="Winter Warrior";
			CFrameQuest=CFrame.new(607,401,-5371); CFrameMon=CFrame.new(1224,460,-5332);
		elseif I<=1124 then
			Mon="Lab Subordinate"; LevelQuest=1; NameQuest="IceSideQuest"; NameMon="Lab Subordinate";
			CFrameQuest=CFrame.new(-6061,16,-4904); CFrameMon=CFrame.new(-5941,50,-4322);
		elseif I<=1174 then
			Mon="Horned Warrior"; LevelQuest=2; NameQuest="IceSideQuest"; NameMon="Horned Warrior";
			CFrameQuest=CFrame.new(-6061,16,-4904); CFrameMon=CFrame.new(-6306,50,-5752);
		elseif I<=1199 then
			Mon="Magma Ninja"; LevelQuest=1; NameQuest="FireSideQuest"; NameMon="Magma Ninja";
			CFrameQuest=CFrame.new(-5430,16,-5298); CFrameMon=CFrame.new(-5233,60,-6227);
		elseif I<=1249 then
			Mon="Lava Pirate"; LevelQuest=2; NameQuest="FireSideQuest"; NameMon="Lava Pirate";
			CFrameQuest=CFrame.new(-5430,16,-5298); CFrameMon=CFrame.new(-4955,60,-4836);
		elseif I<=1274 then
			Mon="Ship Deckhand"; LevelQuest=1; NameQuest="ShipQuest1"; NameMon="Ship Deckhand";
			CFrameQuest=CFrame.new(1037,125,32911); CFrameMon=CFrame.new(1212,150,33059);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21,126.97,32852.83));
			end;
		elseif I<=1299 then
			Mon="Ship Engineer"; LevelQuest=2; NameQuest="ShipQuest1"; NameMon="Ship Engineer";
			CFrameQuest=CFrame.new(1037,125,32911); CFrameMon=CFrame.new(919,43,32779);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21,126.97,32852.83));
			end;
		elseif I<=1324 then
			Mon="Ship Steward"; LevelQuest=1; NameQuest="ShipQuest2"; NameMon="Ship Steward";
			CFrameQuest=CFrame.new(968,125,33244); CFrameMon=CFrame.new(919,129,33436);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21,126.97,32852.83));
			end;
		elseif I<=1349 then
			Mon="Ship Officer"; LevelQuest=2; NameQuest="ShipQuest2"; NameMon="Ship Officer";
			CFrameQuest=CFrame.new(968,125,33244); CFrameMon=CFrame.new(1036,181,33315);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude>500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21,126.97,32852.83));
			end;
		elseif I<=1374 then
			Mon="Arctic Warrior"; LevelQuest=1; NameQuest="FrostQuest"; NameMon="Arctic Warrior";
			CFrameQuest=CFrame.new(5667,26,-6486); CFrameMon=CFrame.new(5966,62,-6179);
		elseif I<=1424 then
			Mon="Snow Lurker"; LevelQuest=2; NameQuest="FrostQuest"; NameMon="Snow Lurker";
			CFrameQuest=CFrame.new(5667,26,-6486); CFrameMon=CFrame.new(5407,69,-6880);
		elseif I<=1449 then
			Mon="Sea Soldier"; LevelQuest=1; NameQuest="ForgottenQuest"; NameMon="Sea Soldier";
			CFrameQuest=CFrame.new(-3054,235,-10142); CFrameMon=CFrame.new(-3028,64,-9775);
		else
			Mon="Water Fighter"; LevelQuest=2; NameQuest="ForgottenQuest"; NameMon="Water Fighter";
			CFrameQuest=CFrame.new(-3054,235,-10142); CFrameMon=CFrame.new(-3352,285,-10534);
		end;
	elseif World3 then
		if I<=1524 then
			Mon="Pirate Millionaire"; LevelQuest=1; NameQuest="PiratePortQuest"; NameMon="Pirate Millionaire";
			CFrameQuest=CFrame.new(-290,42,5581); CFrameMon=CFrame.new(-245,47,5584);
		elseif I<=1574 then
			Mon="Pistol Billionaire"; LevelQuest=2; NameQuest="PiratePortQuest"; NameMon="Pistol Billionaire";
			CFrameQuest=CFrame.new(-290,42,5581); CFrameMon=CFrame.new(-187,86,6013);
		elseif I<=1599 then
			Mon="Dragon Crew Warrior"; LevelQuest=1; NameQuest="AmazonQuest"; NameMon="Dragon Crew Warrior";
			CFrameQuest=CFrame.new(5832,51,-1101); CFrameMon=CFrame.new(6141,51,-1340);
		elseif I<=1624 then
			Mon="Dragon Crew Archer"; LevelQuest=2; NameQuest="AmazonQuest"; NameMon="Dragon Crew Archer";
			CFrameQuest=CFrame.new(5833,51,-1103); CFrameMon=CFrame.new(6616,441,446);
		elseif I<=1649 then
			Mon="Female Islander"; LevelQuest=1; NameQuest="AmazonQuest2"; NameMon="Female Islander";
			CFrameQuest=CFrame.new(5446,601,749); CFrameMon=CFrame.new(4685,735,815);
		elseif I<=1699 then
			Mon="Giant Islander"; LevelQuest=2; NameQuest="AmazonQuest2"; NameMon="Giant Islander";
			CFrameQuest=CFrame.new(5446,601,749); CFrameMon=CFrame.new(4729,590,-36);
		elseif I<=1724 then
			Mon="Marine Commodore"; LevelQuest=1; NameQuest="MarineTreeIsland"; NameMon="Marine Commodore";
			CFrameQuest=CFrame.new(2180,27,-6741); CFrameMon=CFrame.new(2286,73,-7159);
		elseif I<=1774 then
			Mon="Marine Rear Admiral"; LevelQuest=2; NameQuest="MarineTreeIsland"; NameMon="Marine Rear Admiral";
			CFrameQuest=CFrame.new(2179,28,-6740); CFrameMon=CFrame.new(3656,160,-7001);
		elseif I<=1799 then
			Mon="Fishman Raider"; LevelQuest=1; NameQuest="DeepForestIsland3"; NameMon="Fishman Raider";
			CFrameQuest=CFrame.new(-10581,330,-8761); CFrameMon=CFrame.new(-10407,331,-8368);
		elseif I<=1824 then
			Mon="Fishman Captain"; LevelQuest=2; NameQuest="DeepForestIsland3"; NameMon="Fishman Captain";
			CFrameQuest=CFrame.new(-10581,330,-8761); CFrameMon=CFrame.new(-10994,352,-9002);
		elseif I<=1849 then
			Mon="Forest Pirate"; LevelQuest=1; NameQuest="DeepForestIsland"; NameMon="Forest Pirate";
			CFrameQuest=CFrame.new(-13234,331,-7625); CFrameMon=CFrame.new(-13274,332,-7769);
		elseif I<=1899 then
			Mon="Mythological Pirate"; LevelQuest=2; NameQuest="DeepForestIsland"; NameMon="Mythological Pirate";
			CFrameQuest=CFrame.new(-13234,331,-7625); CFrameMon=CFrame.new(-13680,501,-6991);
		elseif I<=1924 then
			Mon="Jungle Pirate"; LevelQuest=1; NameQuest="DeepForestIsland2"; NameMon="Jungle Pirate";
			CFrameQuest=CFrame.new(-12680,389,-9902); CFrameMon=CFrame.new(-12256,331,-10485);
		elseif I<=1974 then
			Mon="Musketeer Pirate"; LevelQuest=2; NameQuest="DeepForestIsland2"; NameMon="Musketeer Pirate";
			CFrameQuest=CFrame.new(-12682,391,-9901); CFrameMon=CFrame.new(-13098,450,-9831);
		elseif I<=1999 then
			Mon="Reborn Skeleton"; LevelQuest=1; NameQuest="HauntedQuest1"; NameMon="Reborn Skeleton";
			CFrameQuest=CFrame.new(-9481,142,5565); CFrameMon=CFrame.new(-8680,190,5852);
		elseif I<=2024 then
			Mon="Living Zombie"; LevelQuest=2; NameQuest="HauntedQuest1"; NameMon="Living Zombie";
			CFrameQuest=CFrame.new(-9481,142,5565); CFrameMon=CFrame.new(-10144,140,5932);
		elseif I<=2049 then
			Mon="Demonic Soul"; LevelQuest=1; NameQuest="HauntedQuest2"; NameMon="Demonic Soul";
			CFrameQuest=CFrame.new(-9515,172,607); CFrameMon=CFrame.new(-9275,210,6166);
		elseif I<=2074 then
			Mon="Posessed Mummy"; LevelQuest=2; NameQuest="HauntedQuest2"; NameMon="Posessed Mummy";
			CFrameQuest=CFrame.new(-9515,172,607); CFrameMon=CFrame.new(-9442,60,6304);
		elseif I<=2099 then
			Mon="Peanut Scout"; LevelQuest=1; NameQuest="NutsIslandQuest"; NameMon="Peanut Scout";
			CFrameQuest=CFrame.new(-2104,38,-10194); CFrameMon=CFrame.new(-1870,100,-10225);
		elseif I<=2124 then
			Mon="Peanut President"; LevelQuest=2; NameQuest="NutsIslandQuest"; NameMon="Peanut President";
			CFrameQuest=CFrame.new(-2104,38,-10194); CFrameMon=CFrame.new(-2005,100,-10585);
		elseif I<=2149 then
			Mon="Ice Cream Chef"; LevelQuest=1; NameQuest="IceCreamIslandQuest"; NameMon="Ice Cream Chef";
			CFrameQuest=CFrame.new(-818,66,-10964); CFrameMon=CFrame.new(-501,100,-10883);
		elseif I<=2199 then
			Mon="Ice Cream Commander"; LevelQuest=2; NameQuest="IceCreamIslandQuest"; NameMon="Ice Cream Commander";
			CFrameQuest=CFrame.new(-818,66,-10964); CFrameMon=CFrame.new(-690,100,-11350);
		elseif I<=2224 then
			Mon="Cookie Crafter"; LevelQuest=1; NameQuest="CakeQuest1"; NameMon="Cookie Crafter";
			CFrameQuest=CFrame.new(-2023,38,-12028); CFrameMon=CFrame.new(-2332,90,-12049);
		elseif I<=2249 then
			Mon="Cake Guard"; LevelQuest=2; NameQuest="CakeQuest1"; NameMon="Cake Guard";
			CFrameQuest=CFrame.new(-2023,38,-12028); CFrameMon=CFrame.new(-1514,90,-12422);
		elseif I<=2274 then
			Mon="Baking Staff"; LevelQuest=1; NameQuest="CakeQuest2"; NameMon="Baking Staff";
			CFrameQuest=CFrame.new(-1931,38,-12840); CFrameMon=CFrame.new(-1930,90,-12963);
		elseif I<=2299 then
			Mon="Head Baker"; LevelQuest=2; NameQuest="CakeQuest2"; NameMon="Head Baker";
			CFrameQuest=CFrame.new(-1931,38,-12840); CFrameMon=CFrame.new(-2123,110,-12777);
		elseif I<=2324 then
			Mon="Cocoa Warrior"; LevelQuest=1; NameQuest="ChocQuest1"; NameMon="Cocoa Warrior";
			CFrameQuest=CFrame.new(235,25,-12199); CFrameMon=CFrame.new(110,80,-12245);
		elseif I<=2349 then
			Mon="Chocolate Bar Battler"; LevelQuest=2; NameQuest="ChocQuest1"; NameMon="Chocolate Bar Battler";
			CFrameQuest=CFrame.new(235,25,-12199); CFrameMon=CFrame.new(579,80,-12413);
		elseif I<=2374 then
			Mon="Sweet Thief"; LevelQuest=1; NameQuest="ChocQuest2"; NameMon="Sweet Thief";
			CFrameQuest=CFrame.new(150,25,-12777); CFrameMon=CFrame.new(-68,80,-12692);
		elseif I<=2399 then
			Mon="Candy Rebel"; LevelQuest=2; NameQuest="ChocQuest2"; NameMon="Candy Rebel";
			CFrameQuest=CFrame.new(150,25,-12777); CFrameMon=CFrame.new(17,80,-12962);
		elseif I<=2424 then
			Mon="Candy Pirate"; LevelQuest=1; NameQuest="CandyQuest1"; NameMon="Candy Pirate";
			CFrameQuest=CFrame.new(-1148,14,-14446); CFrameMon=CFrame.new(-1371,70,-14405);
		elseif I<=2449 then
			Mon="Snow Demon"; LevelQuest=2; NameQuest="CandyQuest1"; NameMon="Snow Demon";
			CFrameQuest=CFrame.new(-1148,14,-14446); CFrameMon=CFrame.new(-836,70,-14326);
		elseif I<=2474 then
			Mon="Isle Outlaw"; LevelQuest=1; NameQuest="TikiQuest1"; NameMon="Isle Outlaw";
			CFrameQuest=CFrame.new(-16547,56,-172); CFrameMon=CFrame.new(-16431,90,-223);
		elseif I<=2499 then
			Mon="Island Boy"; LevelQuest=2; NameQuest="TikiQuest1"; NameMon="Island Boy";
			CFrameQuest=CFrame.new(-16547,56,-172); CFrameMon=CFrame.new(-16668,70,-243);
		elseif I<=2524 then
			Mon="Sun-kissed Warrior"; LevelQuest=1; NameQuest="TikiQuest2"; NameMon="kissed";
			CFrameQuest=CFrame.new(-16540,56,1051); CFrameMon=CFrame.new(-16345,80,1004);
		elseif I<=2549 then
			Mon="Isle Champion"; LevelQuest=2; NameQuest="TikiQuest2"; NameMon="Isle Champion";
			CFrameQuest=CFrame.new(-16540,56,1051); CFrameMon=CFrame.new(-16634,85,1106);
		elseif I<=2574 then
			Mon="Serpent Hunter"; LevelQuest=1; NameQuest="TikiQuest3"; NameMon="Serpent Hunter";
			CFrameQuest=CFrame.new(-16665,105,1580);
			CFrameMon=CFrame.new(-16542.4824,146.675156,1529.61401,-0.999948919,1.0729811e-8,0.0101067368,1.0128324e-8,1,-5.9564663e-8,-0.0101067368,-5.9459257e-8,-0.999948919);
		elseif I<=2599 then
			Mon="Skull Slayer"; LevelQuest=2; NameQuest="TikiQuest3"; NameMon="Skull Slayer";
			CFrameQuest=CFrame.new(-16665,105,1580);
			CFrameMon=CFrame.new(-16849.9336,147.005066,1640.88354,0.470148534,0.491874039,-0.732816696,1.72165e-8,0.83030504,0.55730921,0.882587314,-0.262018114,0.390366673);

		elseif I<=2624 then
			Mon="Reef Bandit"; LevelQuest=1; NameQuest="SubmergedQuest1"; NameMon="Reef Bandit";
			CFrameQuest=CFrame.new(10882.264,-2086.322,10034.226);
			CFrameMon=CFrame.new(10736.6191,-2087.8439,9338.4882);
		elseif I<=2649 then
			Mon="Coral Pirate"; LevelQuest=2; NameQuest="SubmergedQuest1"; NameMon="Coral Pirate";
			CFrameQuest=CFrame.new(10882.264,-2086.322,10034.226);
			CFrameMon=CFrame.new(10965.1025,-2158.8842,9177.2597);
		elseif I<=2674 then
			Mon="Sea Chanter"; LevelQuest=1; NameQuest="SubmergedQuest2"; NameMon="Sea Chanter";
			CFrameQuest=CFrame.new(10882.264,-2086.322,10034.226);
			CFrameMon=CFrame.new(10621.0342,-2087.8440,10102.0332);
		elseif I<=2699 then
			Mon="Ocean Prophet"; LevelQuest=2; NameQuest="SubmergedQuest2"; NameMon="Ocean Prophet";
			CFrameQuest=CFrame.new(10882.264,-2086.322,10034.226);
			CFrameMon=CFrame.new(11056.1445,-2001.6717,10117.4493);
		elseif I<=2724 then
			Mon="High Disciple"; LevelQuest=1; NameQuest="SubmergedQuest3"; NameMon="High Disciple";
			CFrameQuest=CFrame.new(9636.52441,-1992.19507,9609.52832);
			CFrameMon=CFrame.new(9828.087890625,-1940.908935546875,9693.0634765625);
		else
			Mon="Grand Devotee"; LevelQuest=2; NameQuest="SubmergedQuest3"; NameMon="Grand Devotee";
			CFrameQuest=CFrame.new(9636.52441,-1992.19507,9609.52832);
			CFrameMon=CFrame.new(9557.5849609375,-1928.0404052734375,9859.1826171875);
		end;
	end;

	Qdata=LevelQuest; Qname=NameQuest; PosQ=CFrameQuest; PosM=CFrameMon; MonFarm=Mon;
end;

function Hop()
	local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
	module:Teleport(game.PlaceId);
end;
function isnil(thing)
	return thing == nil;
end;
local function round(n)
	return math.floor(tonumber(n) + 0.5);
end;
Number = math.random(1, 1000000);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Island"] then
					if v.Name ~= "Sea" then
						if not v:FindFirstChild("EspIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(0, 200, 0, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamMedium;
							name.TextSize = 14;
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = Enum.TextYAlignment.Top;
							name.BackgroundTransparency = 1;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
						else
							v.EspIsland.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v:FindFirstChild("EspIsland") then
					(v:FindFirstChild("EspIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Players")):GetChildren()) do
			pcall(function()
				if not isnil(v.Character) then
					if _G.Settings.Esp["ESP Player"] then
						if not v.Character.Head:FindFirstChild(("EspPlayer" .. Number)) then
							local bill = Instance.new("BillboardGui", v.Character.Head);
							bill.Name = "EspPlayer" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Character.Head;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Character.Head.Position)).Magnitude / 3) .. " Distance";
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							if v.Team == game.Players.LocalPlayer.Team then
								name.TextColor3 = Color3.fromRGB(50, 200, 50);
							else
								name.TextColor3 = Color3.fromRGB(200, 50, 50);
							end;
						else
							v.Character.Head["EspPlayer" .. Number].TextLabel.Text = v.Name .. " | " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth) .. "%";
						end;
					elseif v.Character.Head:FindFirstChild("EspPlayer" .. Number) then
						(v.Character.Head:FindFirstChild("EspPlayer" .. Number)):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace.ChestModels:GetChildren()) do
			pcall(function()
				if string.find(v.Name, "Chest") then
					if _G.Settings.Esp["ESP Chest"] then
						if string.find(v.Name, "Chest") then
							if not v:FindFirstChild(("EspChest" .. Number)) then
								local bill = Instance.new("BillboardGui", v);
								bill.Name = "EspChest" .. Number;
								bill.ExtentsOffset = Vector3.new(0, 1, 0);
								bill.Size = UDim2.new(1, 200, 1, 30);
								bill.Adornee = v;
								bill.AlwaysOnTop = true;
								local name = Instance.new("TextLabel", bill);
								name.Font = Enum.Font.Nunito;
								name.FontSize = "Size14";
								name.TextWrapped = true;
								name.Size = UDim2.new(1, 0, 1, 0);
								name.TextYAlignment = "Top";
								name.BackgroundTransparency = 1;
								name.TextStrokeTransparency = 0.5;
								if v.Name == "SilverChest" then
									name.TextColor3 = Color3.fromRGB(109, 109, 109);
									name.Text = "Silver Chest" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
								if v.Name == "GoldChest" then
									name.TextColor3 = Color3.fromRGB(173, 158, 21);
									name.Text = "Gold Chest" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
								if v.Name == "DiamondChest" then
									name.TextColor3 = Color3.fromRGB(20, 200, 200);
									name.Text = "Diamond Chest" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
							else
								v["EspChest" .. Number].TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
							end;
						end;
					elseif v:FindFirstChild("EspChest" .. Number) then
						(v:FindFirstChild("EspChest" .. Number)):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP DevilFruit"] then
					if v.Name and string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild(("EspDevilFruit" .. Number)) then
							local bill = Instance.new("BillboardGui", v.Handle);
							bill.Name = "EspDevilFruit" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Handle;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
							name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
							local TweenService = game:GetService("TweenService");
							local rainbowColors = {
								Color3.fromRGB(255, 0, 0),
								Color3.fromRGB(255, 127, 0),
								Color3.fromRGB(255, 255, 0),
								Color3.fromRGB(0, 255, 0),
								Color3.fromRGB(0, 0, 255),
								Color3.fromRGB(75, 0, 130),
								Color3.fromRGB(148, 0, 211)
							};
							local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
							(coroutine.wrap(function()
								while true do
									for _, color in ipairs(rainbowColors) do
										local tween = TweenService:Create(name, tweenInfo, {
											TextColor3 = color
										});
										tween:Play();
										tween.Completed:Wait();
									end;
								end;
							end))();
						else
							v.Handle["EspDevilFruit" .. Number].TextLabel.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v.Handle:FindFirstChild("EspDevilFruit" .. Number) then
					(v.Handle:FindFirstChild("EspDevilFruit" .. Number)):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0) do
		for i, v in pairs(game.Workspace._WorldOrigin:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP DevilFruit"] then
					if string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild(("EspDevilFruit" .. Number)) then
							local bill = Instance.new("BillboardGui", v.Handle);
							bill.Name = "EspDevilFruit" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Handle;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
							name.Text = v.Name .. "(SPAWNED)" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
							local TweenService = game:GetService("TweenService");
							local rainbowColors = {
								Color3.fromRGB(255, 0, 0),
								Color3.fromRGB(255, 127, 0),
								Color3.fromRGB(255, 255, 0),
								Color3.fromRGB(0, 255, 0),
								Color3.fromRGB(0, 0, 255),
								Color3.fromRGB(75, 0, 130),
								Color3.fromRGB(148, 0, 211)
							};
							local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
							(coroutine.wrap(function()
								while true do
									for _, color in ipairs(rainbowColors) do
										local tween = TweenService:Create(name, tweenInfo, {
											TextColor3 = color
										});
										tween:Play();
										tween.Completed:Wait();
									end;
								end;
							end))();
						else
							v.Handle["EspDevilFruit" .. Number].TextLabel.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v.Handle:FindFirstChild("EspDevilFruit" .. Number) then
					(v.Handle:FindFirstChild("EspDevilFruit" .. Number)):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if v.Name == "Flower2" or v.Name == "Flower1" then
					if _G.Settings.Esp["ESP Flower"] then
						if not v:FindFirstChild(("EspFlower" .. Number)) then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspFlower" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 100, 100);
							if v.Name == "Flower1" then
								name.Text = "Blue Flower" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
								name.TextColor3 = Color3.fromRGB(40, 40, 255);
							end;
							if v.Name == "Flower2" then
								name.Text = "Red Flower" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
								name.TextColor3 = Color3.fromRGB(255, 100, 100);
							end;
						else
							v["EspFlower" .. Number].TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
						end;
					elseif v:FindFirstChild("EspFlower" .. Number) then
						(v:FindFirstChild("EspFlower" .. Number)):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.Settings.Esp["ESP RealFruit"] then
					if not v.Handle:FindFirstChild(("EspRealFruit" .. Number)) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit" .. Number;
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(200, 70, 70);
						name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit" .. Number].TextLabel.Text = v.Name .. " " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit" .. Number) then
					(v.Handle:FindFirstChild("EspRealFruit" .. Number)):Destroy();
				end;
			end;
		end;
		for i, v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.Settings.Esp["ESP RealFruit"] then
					if not v.Handle:FindFirstChild(("EspRealFruit" .. Number)) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit" .. Number;
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(255, 170, 0);
						name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit" .. Number].TextLabel.Text = v.Name .. " " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit" .. Number) then
					(v.Handle:FindFirstChild("EspRealFruit" .. Number)):Destroy();
				end;
			end;
		end;
		for i, v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.Settings.Esp["ESP RealFruit"] then
					if not v.Handle:FindFirstChild(("EspRealFruit" .. Number)) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit" .. Number;
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(240, 255, 10);
						name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit" .. Number].TextLabel.Text = v.Name .. " " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit" .. Number) then
					(v.Handle:FindFirstChild("EspRealFruit" .. Number)):Destroy();
				end;
			end;
		end;
	end;
end);
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.Settings.Esp["ESP Monster"] then
				for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspMonster") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspMonster";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.GothamBold;
							TextLabel.TextColor3 = Color3.fromRGB(120, 130, 230);
							TextLabel.Text.Size = 35;
						end;
						local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspMonster.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
					if v:FindFirstChild("EspMonster") then
						v.EspMonster:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.Settings.Esp["ESP Sea Beast"] then
				for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspSeabeasts") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspSeabeasts";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.Gotham;
							TextLabel.TextColor3 = Color3.fromRGB(60, 240, 120);
							TextLabel.Text.Size = 35;
						end;
						local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspSeabeasts.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
					if v:FindFirstChild("EspSeabeasts") then
						v.EspSeabeasts:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.Settings.Esp["ESP Npc"] then
				for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspNpc") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspNpc";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.Cartoon;
							TextLabel.TextColor3 = Color3.fromRGB(200, 60, 120);
							TextLabel.Text.Size = 45;
						end;
						local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspNpc.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
					if v:FindFirstChild("EspNpc") then
						v.EspNpc:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Mirage"] then
					if v.Name == "Mirage Island" then
						if not v:FindFirstChild("EspMirageIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspMirageIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(50, 180, 50);
						else
							v.EspMirageIsland.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspMirageIsland") then
					(v:FindFirstChild("EspMirageIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Kitsune"] then
					if v.Name == "Kitsune Island" then
						if not v:FindFirstChild("EspKitsuneIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspKitsuneIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(40, 40, 180);
						else
							v.EspKitsuneIsland.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspKitsuneIsland") then
					(v:FindFirstChild("EspKitsuneIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Frozen"] then
					if v.Name == "Frozen Dimension" then
						if not v:FindFirstChild("EspFrozen") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspFrozen";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(50, 180, 255);
						else
							v.EspFrozen.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspFrozen") then
					(v:FindFirstChild("EspFrozen")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Prehistoric"] then
					if v.Name == "Prehistoric Island" then
						if not v:FindFirstChild("EspPrehistoric") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspPrehistoric";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(200, 50, 40);
						else
							v.EspPrehistoric.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspPrehistoric") then
					(v:FindFirstChild("EspPrehistoric")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Advanced Fruit Dealer"] then
					if v.Name == "Advanced Fruit Dealer" then
						if not v:FindFirstChild("EspAdvanceFruitDealer") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspAdvanceFruitDealer";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(250, 50, 50);
						else
							v.EspAdvanceFruitDealer.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspAdvanceFruitDealer") then
					(v:FindFirstChild("EspAdvanceFruitDealer")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Aura"] then
					if v.Name == "Master of Enhancement" then
						if not v:FindFirstChild("EspAura") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspAura";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(200, 55, 255);
						else
							v.EspAura.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspAura") then
					(v:FindFirstChild("EspAura")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		if (game:GetService("Workspace")).Map:FindFirstChild("MysticIsland") then
			for i, v in pairs((game:GetService("Workspace")).Map.MysticIsland:GetChildren()) do
				pcall(function()
					if _G.Settings.Esp["ESP Gear"] then
						if v.Name == "MeshPart" then
							if not v:FindFirstChild("AutoFarmBlazeEmber") then
								local bill = Instance.new("BillboardGui", v);
								bill.Name = "EspGear";
								bill.ExtentsOffset = Vector3.new(0, 1, 0);
								bill.Size = UDim2.new(1, 200, 1, 30);
								bill.Adornee = v;
								bill.AlwaysOnTop = true;
								local name = Instance.new("TextLabel", bill);
								name.Font = "Code";
								name.FontSize = "Size14";
								name.TextWrapped = true;
								name.Size = UDim2.new(1, 0, 1, 0);
								name.TextYAlignment = "Top";
								name.BackgroundTransparency = 1;
								name.TextStrokeTransparency = 0.5;
								name.TextColor3 = Color3.fromRGB(80, 245, 245);
							else
								v.EspGear.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
							end;
						end;
					elseif v:FindFirstChild("EspGear") then
						(v:FindFirstChild("EspGear")):Destroy();
					end;
				end);
			end;
		end;
	end;
end);
function Click()
	(game:GetService("VirtualUser")):CaptureController();
	(game:GetService("VirtualUser")):Button1Down(Vector2.new(1280, 672));
end;
function AutoHaki()
	if not (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("HasBuso") then
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("Buso");
	end;
end;
function UnEquipWeapon(Weapon)
	if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
		(game.Players.LocalPlayer.Character:FindFirstChild(Weapon)).Parent = game.Players.LocalPlayer.Backpack;
	end;
end;
function EquipWeapon(ToolSe)
	if not game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe);
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool);
		end;
	end;
end;

function EquipFarmWeapon()
	local wp = _G.ChooseWP or "Melee";
	local plr = game.Players.LocalPlayer;
	local char = plr.Character;
	if not char then return; end;
	if wp == "Sword" then
		for _, v in pairs(plr.Backpack:GetChildren()) do
			if v:IsA("Tool") and v.ToolTip == "Sword" then
				char.Humanoid:EquipTool(v); return;
			end;
		end;
	elseif wp == "Fruit" then
		for _, v in pairs(plr.Backpack:GetChildren()) do
			if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
				char.Humanoid:EquipTool(v); return;
			end;
		end;
	elseif wp == "Gun" then
		for _, v in pairs(plr.Backpack:GetChildren()) do
			if v:IsA("Tool") and v.ToolTip == "Gun" then
				char.Humanoid:EquipTool(v); return;
			end;
		end;
	else
		for _, v in pairs(plr.Backpack:GetChildren()) do
			if v:IsA("Tool") and (v.ToolTip == "Melee" or v.ToolTip == "Fighting Style") then
				char.Humanoid:EquipTool(v); return;
			end;
		end;
	end;
end;
spawn(function()
	for i, v in pairs((game:GetService("Workspace"))._WorldOrigin:GetChildren()) do
		pcall(function()
			if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" then
				v:Destroy();
			end;
		end);
	end;
end);
function GetDistance(target)
	return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude);
end;
function BTP(value)
	pcall(function()
		if (value.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			repeat
				wait();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetSpawnPoint");
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetSpawnPoint");
				wait();
				game.Players.LocalPlayer.Character.Head:Destroy();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
			until (value.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 and game.Players.LocalPlayer.Character.Humanoid.Health > 0;
		end;
	end);
end;
function InstantTp(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
end;

local function MountPlayerToBoat(boat)
	local plr  = game.Players.LocalPlayer;
	local char = plr.Character;
	if not char then return false; end;
	local hrp  = char:FindFirstChild("HumanoidRootPart");
	local hum  = char:FindFirstChildOfClass("Humanoid");
	local seat = boat:FindFirstChildWhichIsA("VehicleSeat");
	if not hrp or not hum or not seat then return false; end;
	if hum.Sit then return true; end;

	hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0);
	local t = 0;
	repeat task.wait(0.1); t = t + 0.1;
	until hum.Sit or t > 3;
	return hum.Sit;
end;

function TweenBoat(pos)
	local TweenService = game:GetService("TweenService");
	local RunService   = game:GetService("RunService");
	local boatName = _G.Settings.SeaEvent["Selected Boat"] or "Guardian";
	local Boat = workspace.Boats:FindFirstChild(boatName);
	if not Boat then

		for _, b in pairs(workspace.Boats:GetChildren()) do
			if b.Name == boatName then Boat = b; break; end;
		end;
	end;
	if not Boat or not Boat:FindFirstChildWhichIsA("VehicleSeat") then
		return { Stop = function() end };
	end;
	local seat = Boat:FindFirstChildWhichIsA("VehicleSeat");
	local targetCFrame = pos;
	if typeof(pos) == "Instance" and pos:IsA("BasePart") then
		targetCFrame = pos.CFrame;
	elseif typeof(pos) ~= "CFrame" then
		return { Stop = function() end };
	end;
	local startPos = seat.Position;
	local endPos   = targetCFrame.Position;
	local distance = (startPos - endPos).Magnitude;
	if distance <= 25 then
		return { Stop = function() end };
	end;

	pcall(function() MountPlayerToBoat(Boat); end);
	local speed    = _G.SetSpeedBoat or _G.Settings.SeaEvent["Boat Tween Speed"] or 300;
	local duration = distance / speed;
	local info  = TweenInfo.new(duration, Enum.EasingStyle.Linear);
	local tween = TweenService:Create(seat, info, { CFrame = targetCFrame });
	local stopped = false;

	local plr  = game.Players.LocalPlayer;
	local syncConn;
	syncConn = RunService.Heartbeat:Connect(function()
		if stopped then
			if syncConn then syncConn:Disconnect(); end;
			return;
		end;
		pcall(function()
			local char = plr.Character;
			if not char then return; end;
			local hrp  = char:FindFirstChild("HumanoidRootPart");
			local hum  = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return; end;

			if not hum.Sit then
				hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0);
			end;
		end);
	end);
	tween:Play();
	tween.Completed:Connect(function()
		stopped = true;
		if syncConn then syncConn:Disconnect(); end;
	end);
	local StopTweenBoat = {};
	function StopTweenBoat:Stop()
		stopped = true;
		if syncConn then syncConn:Disconnect(); end;
		if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
			tween:Cancel();
		end;
	end;
	return StopTweenBoat;
end;
local _B = false;
local PosMon = nil;
_G.BringRange = _G.BringRange or 235;
_G.MaxBringMobs = _G.MaxBringMobs or 3;
_G.MobHeight = _G.MobHeight or 20;
local TweenService = game:GetService("TweenService");
local TweenInfoBring = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local function IsRaidMob(mob)
	local n = mob.Name:lower();
	if n:find("raid") or n:find("microchip") or n:find("island") then
		return true;
	end;
	if mob:GetAttribute("IsRaid") or mob:GetAttribute("RaidMob") or mob:GetAttribute("IsBoss") then
		return true;
	end;
	local hum = mob:FindFirstChild("Humanoid");
	if hum and hum.WalkSpeed == 0 then
		return true;
	end;
	return false;
end;

local player = game.Players.LocalPlayer;

BringEnemy = function()
	if not _B or not PosMon then return end;

	local char = player.Character;
	local hrp = char and char:FindFirstChild("HumanoidRootPart");
	if not hrp then return end;

	local playerPos = hrp.Position;
	local farmDist = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Farm Distance"]) or 35;
	local posVec = Vector3.new(playerPos.X, playerPos.Y - farmDist, playerPos.Z);

	local BringRange = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Bring Mob Range"])
		or _G.BringRange or 235;
	local MaxMob = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Max Bring Mobs"])
		or _G.MaxBringMobs or 3;
	local count = 0;

	for _, enemy in pairs(workspace.Enemies:GetChildren()) do
		if count >= MaxMob then break end;
		if IsRaidMob(enemy) then continue end;

		local hum = enemy:FindFirstChild("Humanoid");
		local root = enemy:FindFirstChild("HumanoidRootPart");
		if not hum or not root or hum.Health <= 0 then continue end;
		if hum.MaxHealth == math.huge then continue end;
		if enemy:GetAttribute("Invulnerable") then continue end;
		if (root.Position - posVec).Magnitude > BringRange then continue end;

		count += 1;

		hum.WalkSpeed = 0;
		hum.JumpPower = 0;
		pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics); end);
		root.CanCollide = false;
		root.AssemblyLinearVelocity = Vector3.zero;
		root.AssemblyAngularVelocity = Vector3.zero;

		local pinPos = Vector3.new(posVec.X, root.Position.Y, posVec.Z);
		root.CFrame = CFrame.new(pinPos);

		local bp = root:FindFirstChild("_BringBP");
		if not bp then
			bp = Instance.new("BodyPosition");
			bp.Name = "_BringBP";
			bp.MaxForce = Vector3.new(1e6, 1e6, 1e6);
			bp.D = 9999;
			bp.P = 99999;
			bp.Parent = root;
		end;
		bp.Position = pinPos;
	end;
end;

task.spawn(function()
	local function applySimRad()
		pcall(function()
			if setscriptable then setscriptable(player, "SimulationRadius", true); end;
			if sethiddenproperty then sethiddenproperty(player, "SimulationRadius", math.huge); end;
		end);
	end;
	applySimRad();
	player.CharacterAdded:Connect(function()
		task.wait(1);
		applySimRad();
	end);

	while true do
		task.wait(5);
		applySimRad();
	end;
end);

task.spawn(function()
	while task.wait() do
		pcall(function()
			local farmActive = _G.EclipseStartFarm
				or _G.EclipseAutoTyrant
				or _G.Settings.Main["Auto Farm"]
				or _G.Settings.Main["Auto Farm Mon"]
				or _G.Settings.Main["Auto Farm Fast"]
				or _G.Settings.Main["Auto Farm All Boss"]
				or _G.Settings.Main["Auto Farm Boss"]
				or _G.Settings.Main["Auto Farm Fruit Mastery"]
				or _G.Settings.Main["Auto Farm Sword Mastery"]
				or _G.Settings.Main["Auto Farm Gun Mastery"];
			_B = (farmActive == true) and (_G.Settings.Setting["Bring Mob"] == true);
			if _B then
				BringEnemy();
			else
				for _, enemy in pairs(workspace.Enemies:GetChildren()) do
					pcall(function()
						local root = enemy:FindFirstChild("HumanoidRootPart");
						if not root then return; end;

						local bp = root:FindFirstChild("_BringBP");
						if bp then bp:Destroy(); end;
						local bp2 = root:FindFirstChild("BodyPosition");
						if bp2 then bp2:Destroy(); end;
						root.CanCollide = true;
						local hum = enemy:FindFirstChild("Humanoid");
						if hum then hum.WalkSpeed = 16; hum.JumpPower = 50; end;
					end);
				end;
			end;
		end);
	end;
end);

task.spawn(function()
	while task.wait(0.3) do
		pcall(function()
			local char2 = player.Character;
			if not char2 then return; end;
			local hrp2 = char2:FindFirstChild("HumanoidRootPart");
			if not hrp2 then return; end;
			if _B then
				if not hrp2:FindFirstChild("Stabilizer") then
					local bv = Instance.new("BodyVelocity");
					bv.Name = "Stabilizer";
					bv.MaxForce = Vector3.new(0, 1e6, 0);
					bv.Velocity = Vector3.new(0, 0.1, 0);
					bv.Parent = hrp2;
				end;
			else
				local stab = hrp2:FindFirstChild("Stabilizer");
				if stab then stab:Destroy(); end;
			end;
		end);
	end;
end);

local C = Instance.new("Part", workspace);
C.Size = Vector3.new(1, 1, 1);
C.Name = "SaturnFarmPart";
C.Anchored = true;
C.CanCollide = false;
C.CanTouch = false;
C.Transparency = 1;
do
	local existingC = workspace:FindFirstChild("SaturnFarmPart");
	if existingC and existingC ~= C then existingC:Destroy(); end;
end;
getgenv().TweenSpeedFar = 350;
getgenv().TweenSpeedNear = 700;
local shouldTween = false;
local _activeTween = nil;

task.spawn(function()
	local plr = game.Players.LocalPlayer;
	repeat task.wait() until plr.Character and plr.Character.PrimaryPart;
	C.CFrame = plr.Character.PrimaryPart.CFrame;
	while task.wait(0) do
		pcall(function()
			if not shouldTween then return; end;
			local char = plr.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;

			if (hrp.Position - C.Position).Magnitude <= 500 then
				hrp.CFrame = C.CFrame;
			end;

			-- Desativa colisão apenas durante tween (farm tem controle próprio)
			if not _G.EclipseStartFarm then
				for _, v in pairs(char:GetChildren()) do
					if v:IsA("BasePart") then v.CanCollide = false; end;
				end;
			end;
		end);
	end;
end);

task.spawn(function()
	local Players = game:GetService("Players")
	local plr = Players.LocalPlayer
	while true do
		task.wait(0.1)
		pcall(function()
			if _G.EclipseStartFarm then return end
			local char = plr.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp then
				local bp = hrp:FindFirstChild("_FarmFloatBP")
				if bp then bp:Destroy() end
				local bg = hrp:FindFirstChild("_FarmFloatBG")
				if bg then bg:Destroy() end
			end
			-- Restaura colisão quando farm para
			if char then
				for _, part in ipairs(char:GetDescendants()) do
					if part:IsA("BasePart") and not part.CanCollide then
						part.CanCollide = true;
					end
				end
			end
		end)
	end
end);

function TweenPlayer(pos)
	local plr = game.Players.LocalPlayer;
	local e = plr.Character;
	if not e or not e:FindFirstChild("HumanoidRootPart") then return; end;
	local HRP = e.HumanoidRootPart;
	local hum = e:FindFirstChildOfClass("Humanoid");

	if _activeTween then
		pcall(function() _activeTween:Cancel(); end);
		_activeTween = nil;
	end;
	shouldTween = false;
	task.wait(0);

	local dist = (pos.Position - HRP.Position).Magnitude;
	if dist < 3 then return; end;

	HRP.Anchored = false;
	if hum then
		if hum.WalkSpeed <= 0 then hum.WalkSpeed = 16; end;
		if hum.JumpPower <= 0 then hum.JumpPower = 50; end;
	end;

	local tweenSpeed = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Player Tween Speed"])
		or getgenv().TweenSpeedFar or 350;
	local duration = dist / tweenSpeed;
	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);

	C.CFrame = HRP.CFrame;
	local tween = TweenService:Create(C, info, {CFrame = pos});
	_activeTween = tween;
	shouldTween = true;
	tween:Play();

	task.spawn(function()
		tween.Completed:Wait();

		shouldTween = false;
		_activeTween = nil;
		pcall(function()
			if e and e.Parent then
				if HRP and HRP.Anchored then HRP.Anchored = false; end;
				if hum then
					if hum.WalkSpeed <= 0 then hum.WalkSpeed = 16; end;
					if hum.JumpPower <= 0 then hum.JumpPower = 50; end;
			end;
			for _, v in pairs(e:GetChildren()) do
				if v:IsA("BasePart") then v.CanCollide = true; end;
			end;
		end;
		end);
	end);
end;

task.spawn(function()
	while true do
		task.wait(2);
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return; end;

			if hrp.Anchored and not _G.EclipseAutoTyrant then
				hrp.Anchored = false;
			end;

			if hum.WalkSpeed <= 0 and not _G.EclipseAutoTyrant then
				hum.WalkSpeed = 16;
			end;
		end);
	end;
end);
G = G or {};
GetConnectionEnemies = function(I)
	local replicated = game:GetService("ReplicatedStorage");
	for _, K in pairs(replicated:GetChildren()) do
		if K:IsA("Model") and ((typeof(I) == "table" and table.find(I, K.Name) or K.Name == I) and (K:FindFirstChild("Humanoid") and K.Humanoid.Health > 0)) then
			return K;
		end;
	end;
	for _, K in next, game.Workspace.Enemies:GetChildren() do
		if K:IsA("Model") and ((typeof(I) == "table" and table.find(I, K.Name) or K.Name == I) and (K:FindFirstChild("Humanoid") and K.Humanoid.Health > 0)) then
			return K;
		end;
	end;
end;
G.Kill = function(I, e)
	if not (I and e) then return end;
	local hrp = I:FindFirstChild("HumanoidRootPart");
	if not hrp then return end;
	local hum = I:FindFirstChild("Humanoid");
	if not hum or hum.Health <= 0 then return end;
	if not I:GetAttribute("Locked") then
		I:SetAttribute("Locked", hrp.CFrame);
	end;
	PosMon = (I:GetAttribute("Locked")).Position;
	_B = true;
	BringEnemy();
	EquipWeapon(_G.SelectWeapon);
	local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
	if not tool then return end;
	TweenPlayer(hrp.CFrame * CFrame.new(0, _G.MobHeight, 0));

	task.spawn(function()
		task.wait(0.12);
		pcall(function()
			if hum and hum.Health > 0 then
				local head = I:FindFirstChild("Head") or hrp;
				AttackModule:AttackEnemy(head, {});
			end;
		end);
	end);
end;
G.Kill2 = function(I, e)
	if I and e then
		if not I:GetAttribute("Locked") then
			I:SetAttribute("Locked", I.HumanoidRootPart.CFrame);
		end;
		PosMon = (I:GetAttribute("Locked")).Position;
		BringEnemy();
		EquipWeapon(_G.SelectWeapon);
		local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
		if tool then
			if tool.ToolTip == "Blox Fruit" then
				TweenPlayer((I.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0));
			else
				TweenPlayer((I.HumanoidRootPart.CFrame * CFrame.new(0, 20, 8)) * CFrame.Angles(0, math.rad(180), 0));
			end;
		end;
	end;
end;
G.Mas = function(I, e)
	if I and e then
		if not I:GetAttribute("Locked") then
			I:SetAttribute("Locked", I.HumanoidRootPart.CFrame);
		end;
		PosMon = (I:GetAttribute("Locked")).Position;
		BringEnemy();
		if I.Humanoid.Health <= (_G.Settings.Main["Mastery Health"] or 25) then
			TweenPlayer(I.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0));
		else
			EquipWeapon(_G.Settings.Main["Mastery Fighting Style"]);
			TweenPlayer(I.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0));
		end;
	end;
end;
G.Masgun = function(I, e)
	if I and e then
		if not I:GetAttribute("Locked") then
			I:SetAttribute("Locked", I.HumanoidRootPart.CFrame);
		end;
		PosMon = (I:GetAttribute("Locked")).Position;
		BringEnemy();
		if I.Humanoid.Health <= (_G.Settings.Main["Mastery Health"] or 25) then
			TweenPlayer(I.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8));
		else
			EquipWeapon(_G.Settings.Main["Mastery Fighting Style"]);
			TweenPlayer(I.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0));
		end;
	end;
end;
spawn(function()
	(game:GetService("RunService")).RenderStepped:Connect(function()
		pcall(function()
			if setscriptable then
				setscriptable(game.Players.LocalPlayer, "SimulationRadius", true);
			end;
			if sethiddenproperty then
				sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
			end;
		end);
	end);
end);
local env = (getgenv or getrenv or getfenv)();
local rs = game:GetService("ReplicatedStorage");
local players = game:GetService("Players");
local client = players.LocalPlayer;
local modules = rs:WaitForChild("Modules");
local net = modules:WaitForChild("Net");
local charFolder = workspace:WaitForChild("Characters");
local enemyFolder = workspace:WaitForChild("Enemies");
local playerFolder = game:GetService("Players");
local AttackModule = {};
local RegisterAttack = net:WaitForChild("RE/RegisterAttack");
local RegisterHit    = net:WaitForChild("RE/RegisterHit");

function AttackModule:AttackEnemy(EnemyHead, Table)
	if not EnemyHead then return; end;
	pcall(function()
		RegisterAttack:FireServer(0);
		RegisterAttack:FireServer(1);
		RegisterAttack:FireServer(2);
		RegisterAttack:FireServer(3);
		RegisterHit:FireServer(EnemyHead, Table or {});
	end);
end;

function AttackModule:AttackNearest()
	local char = client.Character;
	if not char or not char:FindFirstChild("HumanoidRootPart") then return; end;
	local charPos = char.HumanoidRootPart.Position;
	local range = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Fast Attack Range"]) or 150;

	local head1, parts1 = nil, {};
	for _, Enemy in ipairs(enemyFolder:GetChildren()) do
		local hrp = Enemy:FindFirstChild("HumanoidRootPart");
		local hum = Enemy:FindFirstChild("Humanoid");
		if not hrp or not hum or hum.Health <= 0 then continue; end;
		if (hrp.Position - charPos).Magnitude > range then continue; end;
		if not head1 then
			head1 = Enemy:FindFirstChild("Head") or hrp;
		end;
		for _, part in ipairs(Enemy:GetChildren()) do
			if part:IsA("BasePart") then
				table.insert(parts1, {Enemy, part});
			end;
		end;
	end;

	if head1 and #parts1 > 0 then
		pcall(function()
			RegisterAttack:FireServer(0);
			RegisterHit:FireServer(head1, parts1);
		end);
	end;
end;

function AttackModule:BladeHits()

	local wp = _G.ChooseWP or (_G.Settings and _G.Settings.Main and _G.Settings.Main["Select Weapon"]) or "Melee";
	if wp ~= "Melee" then return; end;
	local char = client.Character;
	if not char then return; end;
	local tool = char:FindFirstChildOfClass("Tool");
	if tool and tool.ToolTip ~= "Gun" then
		self:AttackNearest();
	end;
end;
function Attack()

	local wp = _G.ChooseWP or (_G.Settings and _G.Settings.Main and _G.Settings.Main["Select Weapon"]) or "Melee";
	if wp == "Melee" then
		task.spawn(function()
			pcall(function()
				AttackModule:BladeHits();
			end)
		end)
	end
end;
function NormalAttack()
	AttackModule:BladeHits();
end;
function EquipWeaponSword()
	pcall(function()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA("Tool") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name);
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid);
			end;
		end;
	end);
end;
spawn(function()
	local angle = 0;
	while wait() do
		if _G.Settings.Setting["Spin Position"] then
			local radius = 20;
			local farmDistance = _G.Settings.Setting["Farm Distance"];
			local radian = math.rad(angle);
			local x = math.cos(radian) * radius;
			local z = math.sin(radian) * radius;
			Pos = CFrame.new(x, farmDistance, z);
			angle = (angle + 30) % 360;
		else
			Pos = CFrame.new(0, _G.Settings.Setting["Farm Distance"], 0);
		end;
		wait(0);
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			if World1 then
				if _G.Settings.Farm["Auto Farm Leather"] or _G.Settings.Farm["Auto Farm Magma Ore"] or _G.Settings.Farm["Auto Farm Scrap Metal"] or _G.Settings.Items["Auto Saber"] or _G.Settings.Items["Auto Second Sea"] or _G.Settings.Items["Auto Warden Sword"] or _G.Settings.Items["Auto Greybeard"] or _G.Settings.Items["Auto Pole"] or _G.Settings.Items["Auto Shark Saw"] or _G.Settings.Farm["Auto Farm Angel Wings"] then
					if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World1 then
				if _G.Settings.Items["Auto Saber"] or _G.Settings.Items["Auto Second Sea"] or _G.Settings.Items["Auto Warden Sword"] or _G.Settings.Items["Auto Greybeard"] or _G.Settings.Items["Auto Pole"] or _G.Settings.Items["Auto Shark Saw"] then
					for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World2 then
				if _G.Settings.Items["Auto Farm Factory"] or _G.Settings.Items["Auto Swan Glasses"] or _G.Settings.Raid["Law Raid"] or _G.Settings.Race["Auto Race V2"] or _G.Settings.Items["Auto Rengoku"] or _G.Settings.Items["Auto Bartilo Quest"] or _G.Settings.Items["Auto Third Sea"] or _G.Settings.Items["Auto Dragon Trident"] or _G.Settings.SeaStack["Auto Attack Seabeasts"] or _G.Settings.Raid["Auto Raid"] then
					if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World2 then
				if _G.Settings.Items["Auto Farm Factory"] or _G.Settings.Items["Auto Swan Glasses"] or _G.Settings.Raid["Law Raid"] or _G.Settings.Race["Auto Race V2"] or _G.Settings.Items["Auto Rengoku"] or _G.Settings.Items["Auto Bartilo Quest"] or _G.Settings.Items["Auto Third Sea"] or _G.Settings.Items["Auto Dragon Trident"] or _G.Settings.SeaStack["Auto Attack Seabeasts"] or _G.Settings.Raid["Auto Raid"] then
					for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World3 then
				if _G.Settings.Farm["Auto Pirate Raid"] or _G.Settings.Race["Auto Race V3"] or _G.Settings.Farm["Auto Kill Cake Prince"] or _G.Settings.SeaStack["Tween To Kitsune Island"] or _G.Settings.SeaStack["Teleport To Frozen Dimension"] or _G.Settings.SeaStack["Sail To Frozen Dimension"] or _G.Settings.SeaStack["Summon Frozen Dimension"] or _G.Settings.SeaStack["Summon Kitsune Island"] or _G.Settings.SeaStack["Tween To Mirage Island"] or _G.Settings.Race["Auto Train"] or _G.Settings.Items["Auto Press Haki Button"] or _G.Settings.SeaEvent["Sail Boat"] or _G.Settings.Items["Auto Arena Trainer"] or _G.Settings.Race["Auto Kill Player After Trial"] or _G.Settings.Race["Tween To Highest Mirage"] or _G.Settings.Race["Auto Trial"] or _G.Settings.Race["Find Blue Gear"] or _G.Settings.Combat["Auto Kill Player Quest"] or _G.Settings.Items["Auto Cursed Dual Katana"] or _G.Settings.Farm["Auto Farm Bone"] or _G.Settings.Farm["Auto Kill Dough King"] or _G.Settings.Items["Auto Soul Guitar"] or _G.Settings.Items["Auto Tushita"] or _G.Settings.Farm["Auto Elite Hunter"] or _G.AutoKillSelectedPlayer or _G.Settings.Items["Auto Rainbow Haki"] or _G.Settings.Items["Auto Dark Dagger"] or _G.Settings.Farm["Auto Farm Ectoplasm"] or _G.Settings.Farm["Auto Observation V2"] or _G.Settings.Farm["Auto Musketeer Hat"] or _G.Settings.Items["Auto Holy Torch"] or _G.Settings.Items["Auto Hallow Scythe"] or _G.Settings.Farm["Auto Farm Katakuri"] or _G.Settings.Items["Auto Buddy Sword"] or _G.Settings.Items["Auto Canvander"] or _G.Settings.Raid["Auto Raid"] or _G.Settings.Main["Auto Summon Tyrant Of The Skies"] or _G.Settings.Main["Auto Kill Tyrant Of The Skies"] then
					if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World3 then
				if _G.Settings.Farm["Auto Pirate Raid"] or _G.Settings.Race["Auto Race V3"] or _G.Settings.Farm["Auto Kill Cake Prince"] or _G.Settings.SeaStack["Tween To Kitsune Island"] or _G.Settings.SeaStack["Teleport To Frozen Dimension"] or _G.Settings.SeaStack["Sail To Frozen Dimension"] or _G.Settings.SeaStack["Summon Frozen Dimension"] or _G.Settings.SeaStack["Summon Kitsune Island"] or _G.Settings.SeaStack["Tween To Mirage Island"] or _G.Settings.Race["Auto Train"] or _G.Settings.Items["Auto Press Haki Button"] or _G.Settings.SeaEvent["Sail Boat"] or _G.Settings.Items["Auto Arena Trainer"] or _G.Settings.Race["Auto Kill Player After Trial"] or _G.Settings.Race["Tween To Highest Mirage"] or _G.Settings.Race["Auto Trial"] or _G.Settings.Race["Find Blue Gear"] or _G.Settings.Combat["Auto Kill Player Quest"] or _G.Settings.Items["Auto Cursed Dual Katana"] or _G.Settings.Farm["Auto Farm Bone"] or _G.Settings.Farm["Auto Kill Dough King"] or _G.Settings.Items["Auto Soul Guitar"] or _G.Settings.Items["Auto Tushita"] or _G.Settings.Farm["Auto Elite Hunter"] or _G.AutoKillSelectedPlayer or _G.Settings.Items["Auto Rainbow Haki"] or _G.Settings.Items["Auto Dark Dagger"] or _G.Settings.Farm["Auto Farm Ectoplasm"] or _G.Settings.Farm["Auto Observation V2"] or _G.Settings.Farm["Auto Musketeer Hat"] or _G.Settings.Items["Auto Holy Torch"] or _G.Settings.Items["Auto Hallow Scythe"] or _G.Settings.Farm["Auto Farm Katakuri"] or _G.Settings.Items["Auto Buddy Sword"] or _G.Settings.Items["Auto Canvander"] or _G.Settings.Farm["Auto Farm Leather"] or _G.Settings.Raid["Auto Raid"] or _G.Settings.Main["Auto Summon Tyrant Of The Skies"] or _G.Settings.Main["Auto Kill Tyrant Of The Skies"] then
					for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Settings.Main["Auto Farm"] or _G.Settings.Farm["Auto Farm Chest Tween"] or _G.Settings.Items["Auto Electric Claw"] or _G.Settings.Main["Auto Farm Fruit Mastery"] or _G.Settings.Main["Auto Farm Gun Mastery"] or _G.TeleportIsland or _G.AutoKillSelectedPlayer or _G.TeleportToPlayer or _G.Settings.Farm["Auto Farm Observation"] or _G.Settings.Fruit["Tween To Fruit"] or _G.TeleportNPC or _G.Settings.Main["Auto Farm Mon"] or _G.Settings.Main["Auto Farm Fast"] or _G.Settings.Main["Auto Farm All Boss"] or _G.Settings.Main["Auto Farm Boss"] or _G.Settings.Main["Auto Farm Sword Mastery"] or _G.Settings.Farm["Auto Farm Material"] then
				if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity");
					Noclip.Name = "BodyClip";
					Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
					Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
					Noclip.Velocity = Vector3.new(0, 0, 0);
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		(game:GetService("RunService")).Stepped:Connect(function()
			if _G.Settings.Main["Auto Farm"] or _G.Settings.Farm["Auto Farm Chest Tween"] or _G.Settings.Items["Auto Electric Claw"] or _G.Settings.Main["Auto Farm Fruit Mastery"] or _G.Settings.Main["Auto Farm Gun Mastery"] or _G.TeleportIsland or _G.AutoKillSelectedPlayer or _G.TeleportToPlayer or _G.Settings.Farm["Auto Farm Observation"] or _G.Settings.Fruit["Tween To Fruit"] or _G.TeleportNPC or _G.Settings.Main["Auto Farm Mon"] or _G.Settings.Main["Auto Farm Fast"] or _G.Settings.Main["Auto Farm All Boss"] or _G.Settings.Main["Auto Farm Boss"] or _G.Settings.Main["Auto Farm Sword Mastery"] or _G.Settings.Farm["Auto Farm Material"] then
				for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false;
					end;
				end;
			end;
		end);
	end);
end);
_G.BypassTeleportActive = false;
function StopTween(State)
	if not State then
		if _G.BypassTeleportActive then return; end;

		shouldTween = false;
		if _activeTween then
			pcall(function() _activeTween:Cancel(); end);
			_activeTween = nil;
		end;
		_G.StopTween = true;

		pcall(function()
			local hrp = game.Players.LocalPlayer.Character
				and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
			if hrp then
				hrp.Anchored = false;
				local bp = hrp:FindFirstChild("BodyClip");
				if bp then bp:Destroy(); end;
				local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
				if hum then
					if hum.WalkSpeed <= 0 then hum.WalkSpeed = 16; end;
					if hum.JumpPower <= 0 then hum.JumpPower = 50; end;
				end;

				for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("BasePart") then v.CanCollide = true; end;
				end;
			end;
		end);
		_G.StopTween = false;
	end;
end;
function RemoveAnimation(Mon)
	Mon.Humanoid:ChangeState(11);
	if Mon.Humanoid:FindFirstChild("Animator") then
		Mon.Humanoid.Animator:Destroy();
	end;
end;
spawn(function()
	pcall(function()
		while wait() do
			for i, v in pairs((game:GetService("Players")).LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then
						SelectWeaponGun = v.Name;
					end;
				end;
			end;
		end;
	end);
end);
MainSection = MainTab:AddSection("Main");
GameTimeParagraph = MainTab:AddParagraph({
	Title = "Game Time",
	Desc = "0",
	Image = "timer",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			local GameTime = math.floor(workspace.DistributedGameTime + 0.5);
			local Hour = math.floor(GameTime / 60 ^ 2) % 24;
			local Minute = math.floor(GameTime / 60 ^ 1) % 60;
			local Second = math.floor(GameTime / 60 ^ 0) % 60;
			GameTimeParagraph:SetDesc(Hour .. " Hours " .. Minute .. " Minute " .. Second .. " Second");
		end);
	end;
end);
LevelFarmSection = MainTab:AddSection(" Level Farm");

local function QuestNeta()
	CheckQuest();
	return {
		[1] = Mon,
		[2] = Qdata,
		[3] = Qname,
		[4] = PosM or CFrameMon,
		[5] = NameMon,
		[6] = PosQ,
	};
end;

_G.EclipseFarmMode    = (_G.Settings.Main and _G.Settings.Main["Farm Mode"]) or "Level";
_G.EclipseStartFarm   = false;
_G.EclipseLevel       = false;
_G.EclipseFarm_Bone   = false;
_G.EclipseFarm_Cake   = false;
_G.EclipseAutoTyrant  = false;
_G.EclipseAcceptQuest = false;

local FARM_HEIGHT          = 45;
local TP_DIST_THRESHOLD    = 15;

local function TpConditional(hrp, targetCF, threshold)
	if not hrp or not targetCF then return; end;
	if (targetCF.Position - hrp.Position).Magnitude > threshold then
		TweenPlayer(targetCF);
	end;
end;

MainTab:AddDropdown({
	Title = "Select Farm Mode",
	Desc = "Level = por quest/level | Bone = Haunted Castle | Cake Prince | Tyrant Of The Skies | Nearest = ataca NPCs proximos",
	Values = {"Level", "Bone", "Cake Prince", "Tyrant Of The Skies", "Nearest"},
	Value = (_G.Settings.Main and _G.Settings.Main["Farm Mode"]) or "Level",
	Callback = function(v)
		_G.EclipseFarmMode = v;
		_G.Settings.Main["Farm Mode"] = v;
		pcall(function() (getgenv()).SaveSetting(); end);
	end
});

MainTab:AddSlider({
	Title = "Bone Bring Range",
	Desc = "Range para puxar NPCs no modo Bone (Haunted Castle). Padrao = 300",
	Min = 50,
	Max = 800,
	Default = _G.Settings.Setting["Bone Bring Range"] or 300,
	Callback = function(value)
		_G.Settings.Setting["Bone Bring Range"] = value;
	end
});

task.spawn(function()
	while wait(0.3) do
		pcall(function()
			local tooltip = (_G.ChooseWP == "Fruit") and "Blox Fruit" or (_G.ChooseWP or "Melee");
			for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == tooltip then
					_G.Settings.Main["Selected Weapon"] = v.Name;
					_G.SelectWeapon = v.Name;
				end;
			end;
		end);
	end;
end);

MainTab:AddToggle({
	Title = "Accept Quests",
	Desc = "Aceita quest automaticamente antes de farmar",
	Value = false,
	Callback = function(v)
		_G.EclipseAcceptQuest = v;
	end
});

AutoLevelFarmToggle = MainTab:AddToggle({
	Title = "Start Farm",
	Desc = "Inicia o modo de farm selecionado",
	Value = _G.Settings.Main["Auto Farm"],
	Callback = function(v)
		_G.EclipseStartFarm = v;
		_G.Settings.Main["Auto Farm"] = v;

		if getgenv().SuperFastAttackEnabled ~= nil then
			getgenv().SuperFastAttackEnabled = v;
		end;

		_G.EclipseLevel      = false;
		_G.EclipseFarm_Bone  = false;
		_G.EclipseFarm_Cake  = false;
		_G.EclipseAutoTyrant = false;
		_G.EclipseFarm_Nearest = false;
		if v then
			if _G.EclipseFarmMode == "Level" then
				_G.EclipseLevel = true;
			elseif _G.EclipseFarmMode == "Bone" then
				_G.EclipseFarm_Bone = true;
			elseif _G.EclipseFarmMode == "Cake Prince" then
				_G.EclipseFarm_Cake = true;
			elseif _G.EclipseFarmMode == "Tyrant Of The Skies" then
				_G.EclipseAutoTyrant = true;
			elseif _G.EclipseFarmMode == "Nearest" then
				_G.EclipseFarm_Nearest = true;
			end;
		end;
		StopTween(_G.EclipseStartFarm);
		(getgenv()).SaveSetting();
	end
});

_G.EclipseFarm_Nearest = false;
_G.NearestFarmRadius = 150;
task.spawn(function()
	while task.wait(0.2) do
		if not _G.EclipseFarm_Nearest or not _G.EclipseStartFarm then continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local char = plr.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			local radius = _G.NearestFarmRadius or 150;

			local closest, closestDist = nil, radius;
			for _, v in pairs(workspace.Enemies:GetChildren()) do
				if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
					local d = (v.HumanoidRootPart.Position - hrp.Position).Magnitude;
					if d < closestDist then
						closestDist = d;
						closest = v;
					end;
				end;
			end;
			if not closest then return; end;
			EquipWeapon(_G.SelectWeapon);
			TweenPlayer(closest.HumanoidRootPart.CFrame * CFrame.new(0, _G.MobHeight or 15, 0));
			task.wait(0.05);

			pcall(function()
				closest.HumanoidRootPart.CFrame = closest.HumanoidRootPart.CFrame;
				if closest.Humanoid then closest.Humanoid.WalkSpeed = 0; end;
			end);
		end);
	end;
end);

task.spawn(function()
	while true do
		task.wait(0.1);
		if not (_G.EclipseLevel and _G.EclipseStartFarm) then continue; end;

		local plr = game:GetService("Players").LocalPlayer;
		local ok2, err2 = pcall(function() CheckQuest(); end);

		local _playerLevel = 0;
		pcall(function() _playerLevel = plr.Data.Level.Value; end);
		local _isSubQuest = LevelQuest and NameQuest and string.find(tostring(NameQuest or ""), "Submerged");
		if (_isSubQuest or _playerLevel >= 2600) then
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
			if hrp and hrp.Position.Y > -200 then
				if not _G._subEntering then
					_G._subEntering = true;
					local SubWorkerCF = CFrame.new(-16417.6, 74.26, 1811.3);
					TweenPlayer(SubWorkerCF);
					local t = 0;
					repeat task.wait(0.2); t += 0.2;
						hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
					until not hrp or (hrp.Position - SubWorkerCF.Position).Magnitude < 15 or t > 25;
					task.wait(0.5);
					pcall(function() (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("NPC", "Submarine Worker"); end);
					task.wait(0.5);
					pcall(function() game:GetService("ReplicatedStorage").Modules.Net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland"); end);
					t = 0;
					repeat task.wait(0.3); t += 0.3;
						hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
					until (hrp and hrp.Position.Y < -200) or t > 20;
					task.wait(1);
					_G._subEntering = false;
				end;
				continue;
			end;
		end;

		pcall(function() CheckQuest(); end);
		if not Mon or not CFrameQuest or not CFrameMon then continue; end;

		local okQ, QuestTitle = pcall(function()
			return plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
		end);
		if okQ and QuestTitle and not string.find(QuestTitle, NameMon or "") then
			pcall(function() (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest"); end);
		end;

		if not plr.PlayerGui.Main.Quest.Visible then
			if not shouldTween then
				TweenPlayer(CFrameQuest);
				repeat task.wait(0.1); until not shouldTween or not _G.EclipseStartFarm;
			end;
			if not _G.EclipseStartFarm then continue; end;
			pcall(function() (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest); end);
			task.wait(0.3);
			continue;
		end;

		if not workspace.Enemies:FindFirstChild(Mon) then

			if not shouldTween then
				TweenPlayer(CFrameMon);
				repeat task.wait(0.1); until not shouldTween or not _G.EclipseStartFarm;
			end;
			continue;
		end;

		for _, v in pairs(workspace.Enemies:GetChildren()) do
			if not (_G.EclipseLevel and _G.EclipseStartFarm) then break; end;
			if v.Name ~= Mon then continue; end;
			local vHum = v:FindFirstChild("Humanoid");
			local vRoot = v:FindFirstChild("HumanoidRootPart");
			if not vHum or not vRoot or vHum.Health <= 0 then continue; end;
			local okTitle, qTitle = pcall(function()
				return plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
			end);
			if not okTitle or not string.find(qTitle or "", NameMon) then continue; end;

			PosMon = vRoot.CFrame;
			MonFarm = v.Name;
			EquipWeapon(_G.Settings.Main["Selected Weapon"]);
			AutoHaki();

			local _fixedPos = v.HumanoidRootPart.CFrame * Pos;
			TweenPlayer(_fixedPos);
			repeat task.wait(0.05); until not shouldTween or not _G.EclipseStartFarm or not _G.EclipseLevel;
			if not (_G.EclipseStartFarm and _G.EclipseLevel) then break; end;

			local _farmBP = nil;
			local _farmBG = nil;
			pcall(function()
				local char = plr.Character;
				local hrp = char and char:FindFirstChild("HumanoidRootPart");
				if hrp then
					-- Remove instâncias antigas
					local old = hrp:FindFirstChild("_FarmFloatBP");
					if old then old:Destroy(); end;
					local oldg = hrp:FindFirstChild("_FarmFloatBG");
					if oldg then oldg:Destroy(); end;

					-- BodyVelocity: cancela gravidade (Y), não trava movimento
					local bv = Instance.new("BodyVelocity");
					bv.Name = "_FarmFloatBP";
					bv.MaxForce = Vector3.new(0, 1e5, 0);
					bv.Velocity = Vector3.new(0, 0, 0);
					bv.Parent = hrp;
					_farmBP = bv;

					-- BodyGyro: trava rotação para não ficar girando
					local bg = Instance.new("BodyGyro");
					bg.Name = "_FarmFloatBG";
					bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5);
					bg.D = 500;
					bg.P = 50000;
					bg.CFrame = hrp.CFrame; -- trava na rotação atual
					bg.Parent = hrp;
					_farmBG = bg;

					-- Desativa colisão em todo o personagem durante o farm
					for _, part in ipairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false;
						end;
					end;
				end;
			end);

			_G._farmMobTarget = v;
			repeat
				task.wait(0.15);
				if not (_G.EclipseStartFarm and _G.EclipseLevel) then break; end;
				EquipFarmWeapon();
				AutoHaki();
				PosMon = vRoot.CFrame;
				MonFarm = v.Name;
				vHum.WalkSpeed = 0;
				v.HumanoidRootPart.Size = Vector3.new(1,1,1);
				Attack();
			until not _G.EclipseStartFarm or not _G.EclipseLevel or vHum.Health <= 0 or (not v.Parent) or plr.PlayerGui.Main.Quest.Visible == false;

			pcall(function()
				if _farmBP and _farmBP.Parent then _farmBP:Destroy(); end;
				if _farmBG and _farmBG.Parent then _farmBG:Destroy(); end;
				local char = plr.Character;
				if char then
					local hrp = char:FindFirstChild("HumanoidRootPart");
					if hrp then
						local bp = hrp:FindFirstChild("_FarmFloatBP");
						if bp then bp:Destroy(); end;
						local bg = hrp:FindFirstChild("_FarmFloatBG");
						if bg then bg:Destroy(); end;
					end;
					for _, part in ipairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = true;
						end;
					end;
				end;
			end);
			_G._farmMobTarget = nil;
			break;
		end;
	end;
end);

task.spawn(function()
	while true do
		task.wait(0.3);
		pcall(function()
			local plr  = game.Players.LocalPlayer;
			local char = plr and plr.Character;
			local hrp  = char and char:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;

			if _G.EclipseFarm_Bone and _G.EclipseStartFarm then

				if not hrp:FindFirstChild("BoneStabilizer") then
					local bv = Instance.new("BodyVelocity");
					bv.Name     = "BoneStabilizer";
					bv.MaxForce = Vector3.new(0, 1e6, 0);
					bv.Velocity = Vector3.new(0, 0, 0);
					bv.Parent   = hrp;
				end;
			else

				local stab = hrp:FindFirstChild("BoneStabilizer");
				if stab then stab:Destroy(); end;
			end;
		end);
	end;
end);

task.spawn(function()
	while true do
		task.wait(0.1);
		if not (_G.EclipseFarm_Bone and _G.EclipseStartFarm) then continue; end;

		local plr  = game.Players.LocalPlayer;
		local char = plr.Character;
		local hrp  = char and char:FindFirstChild("HumanoidRootPart");
		if not hrp then continue; end;

		local QuestUI = plr.PlayerGui.Main.Quest;
		local MOBS    = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"};
		local npcPos  = CFrame.new(-9516.99, 172.01, 6078.46);

		if _G.EclipseAcceptQuest and not QuestUI.Visible then
			if (npcPos.Position - hrp.Position).Magnitude > 5 then
				TweenPlayer(npcPos);
				repeat task.wait(0.1);
				until not shouldTween
					or not (_G.EclipseFarm_Bone and _G.EclipseStartFarm);
				if not (_G.EclipseFarm_Bone and _G.EclipseStartFarm) then continue; end;
			else
				pcall(function()
					local quests = {
						{"StartQuest","HauntedQuest1",1},{"StartQuest","HauntedQuest1",2},
						{"StartQuest","HauntedQuest2",1},{"StartQuest","HauntedQuest2",2}
					};
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
						unpack(quests[math.random(1,#quests)])
					);
				end);
				task.wait(1);
			end;
			continue;
		end;

		local closest, shortest = nil, math.huge;
		for _, mobName in pairs(MOBS) do
			for _, mob in pairs(workspace.Enemies:GetChildren()) do
				if mob.Name == mobName
					and mob:FindFirstChild("Humanoid")
					and mob.Humanoid.Health > 0
					and mob.PrimaryPart then
					local dist = (mob.PrimaryPart.Position - hrp.Position).Magnitude;
					if dist < shortest then shortest = dist; closest = mob; end;
				end;
			end;
		end;

		if closest then
			local root = closest:FindFirstChild("HumanoidRootPart") or closest.PrimaryPart;
			local hum  = closest:FindFirstChild("Humanoid");

			local farmDist = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Farm Distance"]) or 35;
			local floatPos = root.CFrame * CFrame.new(0, farmDist, 0);

			if (floatPos.Position - hrp.Position).Magnitude > 8 then
				TweenPlayer(floatPos);
				repeat task.wait(0.05); until not shouldTween or not (_G.EclipseFarm_Bone and _G.EclipseStartFarm);
				if not (_G.EclipseFarm_Bone and _G.EclipseStartFarm) then continue; end;

				pcall(function()
					local old = hrp:FindFirstChild("_BoneFloatBP");
					if old then old:Destroy(); end;
					local bv = Instance.new("BodyVelocity");
					bv.Name = "_BoneFloatBP";
					bv.MaxForce = Vector3.new(0, 1e5, 0);
					bv.Velocity = Vector3.new(0, 0, 0);
					bv.Parent = hrp;
				end);
			end;

			local boneRange = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Bone Bring Range"]) or 300;
			for _, mobName in pairs(MOBS) do
				for _, mob in pairs(workspace.Enemies:GetChildren()) do
					if mob.Name ~= mobName then continue; end;
					local mobHum  = mob:FindFirstChild("Humanoid");
					local mobRoot = mob:FindFirstChild("HumanoidRootPart");
					if not mobHum or not mobRoot or mobHum.Health <= 0 then continue; end;
					if (mobRoot.Position - root.Position).Magnitude > boneRange then continue; end;

					mobHum.WalkSpeed = 0;
					mobHum.JumpPower = 0;
					pcall(function() mobHum:ChangeState(Enum.HumanoidStateType.Physics); end);
					mobRoot.CanCollide = false;
					mobRoot.AssemblyLinearVelocity = Vector3.zero;
					mobRoot.CFrame = CFrame.new(root.Position.X, mobRoot.Position.Y, root.Position.Z);

					local bp = mobRoot:FindFirstChild("_BringBP");
					if not bp then
						bp = Instance.new("BodyPosition");
						bp.Name = "_BringBP";
						bp.MaxForce = Vector3.new(1e6, 1e6, 1e6);
						bp.D = 9999;
						bp.P = 99999;
						bp.Parent = mobRoot;
					end;
					bp.Position = Vector3.new(root.Position.X, mobRoot.Position.Y, root.Position.Z);
				end;
			end;

			EquipFarmWeapon();
			AutoHaki();
			PosMon = root.CFrame;
			MonFarm = closest.Name;
			_G._farmMobTarget = closest;
			Attack();

		else
			pcall(function()
				local bp = hrp:FindFirstChild("_BoneFloatBP");
				if bp then bp:Destroy(); end;
			end);
			_G._farmMobTarget = nil;
			local spawnCF = CFrame.new(-9495.68, 453.58, 5977.34);
			if (spawnCF.Position - hrp.Position).Magnitude > 20 then
				TweenPlayer(spawnCF);
				local _bt = 0;
				repeat task.wait(0.1); _bt += 0.1;
				until not shouldTween
					or _bt > 20
					or not (_G.EclipseFarm_Bone and _G.EclipseStartFarm);
				shouldTween = false;
			end;
		end;
	end;
end);

task.spawn(function()
	while true do
		task.wait(0.1);
		if not (_G.EclipseFarm_Cake and _G.EclipseStartFarm) then continue; end;

		local plr  = game.Players.LocalPlayer;
		local char = plr.Character;
		local hrp  = char and char:FindFirstChild("HumanoidRootPart");
		if not hrp then continue; end;
		local enemies = workspace:FindFirstChild("Enemies");
		if not enemies then continue; end;

		local CakePos        = CFrame.new(-2091.91, 70.00, -12142.83);
		local PortalEntrance = CFrame.new(-2151.82, 149.32, -12404.91);
		local mirror     = workspace.Map:FindFirstChild("CakeLoaf");
		mirror = mirror and mirror:FindFirstChild("BigMirror");
		local other      = mirror and mirror:FindFirstChild("Other");
		local portalOpen = other and other.Transparency == 0;
		local boss       = enemies:FindFirstChild("Cake Prince") or enemies:FindFirstChild("Dough King");

		if not boss and not portalOpen and (hrp.Position - CakePos.Position).Magnitude > 3000 then
			TweenPlayer(CakePos);
			local _t = 0;
			repeat task.wait(0.1); _t += 0.1;
			until not shouldTween or _t > 30 or not (_G.EclipseFarm_Cake and _G.EclipseStartFarm);
			shouldTween = false;
			continue;
		end;

		if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and boss.PrimaryPart then
			local bossTarget = boss.PrimaryPart.CFrame * CFrame.new(0, 25, 0);
			if (bossTarget.Position - hrp.Position).Magnitude > 8 then
				TweenPlayer(bossTarget);
				local _t = 0;
				repeat task.wait(0.05); _t += 0.05;
				until not shouldTween or _t > 10 or not (_G.EclipseFarm_Cake and _G.EclipseStartFarm);
				shouldTween = false;
			end;
			if not (_G.EclipseFarm_Cake and _G.EclipseStartFarm) then continue; end;
			EquipWeapon(_G.Settings.Main["Selected Weapon"]);
			pcall(function() G.Kill(boss, true); end);
			continue;
		end;

		if portalOpen then
			if (hrp.Position - PortalEntrance.Position).Magnitude < 500 then
				TpConditional(hrp, PortalEntrance, TP_DIST_THRESHOLD);
			end;
			continue;
		end;

		if _G.EclipseAcceptQuest and not plr.PlayerGui.Main.Quest.Visible then
			local questPos = CFrame.new(-1927.92, 37.80, -12842.54);
			if (hrp.Position - questPos.Position).Magnitude > 40 then
				TpConditional(hrp, questPos, TP_DIST_THRESHOLD);
			else
				pcall(function()
					local q = {{"StartQuest","CakeQuest2",2},{"StartQuest","CakeQuest2",1},
							   {"StartQuest","CakeQuest1",1},{"StartQuest","CakeQuest1",2}};
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(q[math.random(1,4)]));
				end);
			end;
			continue;
		end;

		local CAKE_MOBS = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"};
		local bestMob, bestDist = nil, math.huge;
		for _, mob in ipairs(enemies:GetChildren()) do
			if table.find(CAKE_MOBS, mob.Name) and mob:FindFirstChild("Humanoid")
				and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
				local d = (mob.HumanoidRootPart.Position - hrp.Position).Magnitude;
				if d < bestDist then bestDist = d; bestMob = mob; end;
			end;
		end;

		if bestMob then
			local mobTarget = bestMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0);
			if (mobTarget.Position - hrp.Position).Magnitude > 8 then
				TweenPlayer(mobTarget);
				local _t = 0;
				repeat task.wait(0.05); _t += 0.05;
				until not shouldTween or _t > 10
					or not (bestMob.Parent and bestMob.Humanoid.Health > 0)
					or enemies:FindFirstChild("Cake Prince")
					or not (_G.EclipseFarm_Cake and _G.EclipseStartFarm);
				shouldTween = false;
			end;
			if bestMob.Parent and bestMob.Humanoid.Health > 0 then
				EquipWeapon(_G.Settings.Main["Selected Weapon"]);
				pcall(function() G.Kill(bestMob, true); end);
			end;
		else
			TpConditional(hrp, CFrame.new(-1927.92, 37.80, -12842.54), TP_DIST_THRESHOLD);
		end;
	end;
end);

spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		if _G.EclipseAutoTyrant and _G.EclipseStartFarm then
			local char = game.Players.LocalPlayer.Character;
			if char then
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") and part.CanCollide then
						part.CanCollide = false;
					end;
				end;
				if char:FindFirstChild("Humanoid") then
					char.Humanoid.AutoRotate = true;
					char.Humanoid:ChangeState(11);
				end;
			end;
		end;
	end);
end);

_G.TyrantKillCount = 0;
local _tyrantKillLabel = nil;
task.spawn(function()
	while true do
		task.wait(2);
		if _tyrantKillLabel and _tyrantKillLabel.SetDesc then
			pcall(function() _tyrantKillLabel:SetDesc(tostring(_G.TyrantKillCount) .. " / 400 NPCs derrotados"); end);
		end;
	end;
end);

local function HasSkullGuitar()
	local plr = game.Players.LocalPlayer;
	for _, v in pairs(plr.Backpack:GetChildren()) do
		if v:IsA("Tool") and v.Name:lower():find("skull guitar") then return true; end;
	end;
	if plr.Character then
		for _, v in pairs(plr.Character:GetChildren()) do
			if v:IsA("Tool") and v.Name:lower():find("skull guitar") then return true; end;
		end;
	end;
	return false;
end;

local function TyrantEquipSkullGuitar()
	local plr = game.Players.LocalPlayer;
	for _, v in pairs(plr.Backpack:GetChildren()) do
		if v:IsA("Tool") and v.Name:lower():find("skull guitar") then
			plr.Character.Humanoid:EquipTool(v); return true;
		end;
	end;
	return false;
end;

local function GetTyrantTargetByLevel()
	local lv = game.Players.LocalPlayer.Data.Level.Value;
	if lv >= 2575 then
		return {Name="Skull Slayer",   QuestArgs={"StartQuest","TikiQuest3",2},
			QuestPos=CFrame.new(-16665.0879,105.27478,1577.61743),FarmPos=CFrame.new(-16709.49,419.68,1751.09)};
	elseif lv > 2550 then
		return {Name="Serpent Hunter",  QuestArgs={"StartQuest","TikiQuest3",1},
			QuestPos=CFrame.new(-16665.0879,105.27478,1577.61743),FarmPos=CFrame.new(-16645.64,163.09,1352.87)};
	elseif lv >= 2525 then
		return {Name="Isle Champion",   QuestArgs={"StartQuest","TikiQuest2",2},
			QuestPos=CFrame.new(-16546.748,55.7216759,-172.865311),FarmPos=CFrame.new(-16602.1015625,130.38734436035,1087.2456054688)};
	elseif lv >= 2500 then
		return {Name="Sun-kissed Warrior",QuestArgs={"StartQuest","TikiQuest2",1},
			QuestPos=CFrame.new(-16546.748,55.7216759,-172.865311),FarmPos=CFrame.new(-16347,64,984)};
	elseif lv >= 2475 then
		return {Name="Island Boy",      QuestArgs={"StartQuest","TikiQuest1",2},
			QuestPos=CFrame.new(-16546.748,55.7216759,-172.865311),FarmPos=CFrame.new(-16670,43,-270)};
	else
		return {Name="Isle Outlaw",     QuestArgs={"StartQuest","TikiQuest1",1},
			QuestPos=CFrame.new(-16546.748,55.7216759,-172.865311),FarmPos=CFrame.new(-16350,45,-180)};
	end;
end;

local function GetTyrantEyesCount()
	local model = workspace:FindFirstChild("Map")
		and workspace.Map:FindFirstChild("TikiOutpost")
		and workspace.Map.TikiOutpost:FindFirstChild("IslandModel");
	local count = 0;
	if model then
		local chunks = model:FindFirstChild("IslandChunks");
		local eye3 = chunks and chunks:FindFirstChild("E") and chunks.E:FindFirstChild("Eye3");
		local eye4 = chunks and chunks:FindFirstChild("E") and chunks.E:FindFirstChild("Eye4");
		if model:FindFirstChild("Eye1") and model.Eye1.Transparency==0 then count+=1; end;
		if model:FindFirstChild("Eye2") and model.Eye2.Transparency==0 then count+=1; end;
		if eye3 and eye3.Transparency==0 then count+=1; end;
		if eye4 and eye4.Transparency==0 then count+=1; end;
	end;
	return count;
end;

local function TyrantUseSkills()
	local VIM = game:GetService("VirtualInputManager");
	local VU  = game:GetService("VirtualUser");
	local categories = {"Melee","Blox Fruit","Sword","Gun"};
	local skills = {"Z","X","C"};
	pcall(function()
		VIM:SendKeyEvent(true,"RightControl",false,game);
		workspace.CurrentCamera.CFrame = CFrame.new(
			workspace.CurrentCamera.CFrame.Position,
			workspace.CurrentCamera.CFrame.Position + Vector3.new(0,-1,0)
		);
	end);
	for _, toolType in ipairs(categories) do
		local tool = nil;
		for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") and v.ToolTip == toolType then tool = v; break; end;
		end;
		if not tool then
			local charTool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
			if charTool and charTool.ToolTip == toolType then tool = charTool; end;
		end;
		if tool then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool);
			task.wait(0.1);
			for i = 1, 3 do
				VU:CaptureController();
				VU:ClickButton1(Vector2.new(851,158));
				local sk = skills[i];
				if sk then
					VIM:SendKeyEvent(true,sk,false,game);
					task.wait(0.05);
					VIM:SendKeyEvent(false,sk,false,game);
				end;
				task.wait(0.1);
			end;
		end;
	end;
end;

local TyrantVaseIndex = 1;

local _TYRANT_DODGE_OFFSETS = {
	CFrame.new( 12,  4,  0),
	CFrame.new(-12,  4,  0),
	CFrame.new(  0,  4, 12),
	CFrame.new(  0,  4,-12),
	CFrame.new(  8,  4,  8),
	CFrame.new( -8,  4,  8),
	CFrame.new(  8,  4, -8),
	CFrame.new( -8,  4, -8),
};
local _tyrantDodgeIdx = 1;
local _tyrantLastDodgeTime = 0;
local _TYRANT_DODGE_INTERVAL = 0.35;

task.spawn(function()
	while task.wait(0.05) do
		if not (_G.EclipseAutoTyrant and _G.EclipseStartFarm) then continue; end;
		pcall(function()
			local plr  = game.Players.LocalPlayer;
			local boss = workspace.Enemies:FindFirstChild("Tyrant of the Skies");
			local eyes = GetTyrantEyesCount();

			if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
				EquipWeapon(_G.Settings.Main["Selected Weapon"]);
				AutoHaki();
				local plrChar = plr.Character;
				if not plrChar then return; end;
				local plrHum  = plrChar:FindFirstChildOfClass("Humanoid");
				local plrHRP  = plrChar:FindFirstChild("HumanoidRootPart");
				if not plrHum or not plrHRP then return; end;
				local bossHRP = boss:FindFirstChild("HumanoidRootPart");
				if not bossHRP then return; end;

				if plrHum.Health <= 4000 then
					local highPos = bossHRP.Position + Vector3.new(0, 1200, 0);
					plrHRP.Anchored = true;
					plrHRP.CFrame = CFrame.new(highPos);
					local t = 0;
					repeat
						task.wait(0.5); t = t + 0.5;
						plrChar = plr.Character;
						plrHum  = plrChar and plrChar:FindFirstChildOfClass("Humanoid");
						if plrHRP and plrHRP.Parent then plrHRP.CFrame = CFrame.new(highPos); end;
					until (not _G.EclipseAutoTyrant) or (plrHum and plrHum.Health >= 10000) or t > 40;
					if plrHRP and plrHRP.Parent then plrHRP.Anchored = false; end;
					return;
				end;

				local now = tick();
				if now - _tyrantLastDodgeTime >= _TYRANT_DODGE_INTERVAL then
					_tyrantLastDodgeTime = now;
					_tyrantDodgeIdx = (_tyrantDodgeIdx % #_TYRANT_DODGE_OFFSETS) + 1;
					local dodgeCF = bossHRP.CFrame * _TYRANT_DODGE_OFFSETS[_tyrantDodgeIdx];
					plrHRP.CFrame = dodgeCF;
				end;

				boss.HumanoidRootPart.Size = Vector3.new(1,1,1);
				G.Kill(boss, true);

			elseif eyes == 4 then
				local vasePOS = {
					CFrame.new(-16335.1,158.1,1465.6), CFrame.new(-16288.6,158.1,1470.3),
					CFrame.new(-16258.0,156.7,1461.4), CFrame.new(-16212.4,158.1,1466.3),
					CFrame.new(-16335.0,159.3,1324.8), CFrame.new(-16286.0,155.9,1323.8),
					CFrame.new(-16250.3,159.3,1316.3)
				};
				local pos = vasePOS[TyrantVaseIndex];
				if pos then
					local plrChar = plr.Character;
					local plrHRP  = plrChar and plrChar:FindFirstChild("HumanoidRootPart");
					if not plrHRP then return; end;
					plrHRP.CFrame = pos;
					task.wait(0.05);
					if (plrHRP.Position - pos.Position).Magnitude < 15 then
						plrHRP.Anchored = true;

						local VIM2 = game:GetService("VirtualInputManager");
						local _vSkills = {"Z","X","C","V","F"};
						for _si = 1, 10 do
							local sk = _vSkills[math.random(1,#_vSkills)];
							pcall(function()
								VIM2:SendKeyEvent(true,  sk, false, game);
								task.wait(0.04);
								VIM2:SendKeyEvent(false, sk, false, game);
							end);
							task.wait(0.06);
						end;
						task.wait(0.1);
						plrHRP.Anchored = false;
						TyrantVaseIndex = TyrantVaseIndex + 1;
						if TyrantVaseIndex > #vasePOS then TyrantVaseIndex = 1; end;
					end;
				end;

			else
				local TargetData = GetTyrantTargetByLevel();
				local hasQuest = pcall(function() return plr.PlayerGui.Main.Quest.Visible; end);
				local questVisible = false;
				pcall(function() questVisible = plr.PlayerGui.Main.Quest.Visible; end);
				if _G.EclipseAcceptQuest and not questVisible then
					local char = plr.Character;
					local hrp  = char and char:FindFirstChild("HumanoidRootPart");
					if hrp then
						local distToNPC = (hrp.Position - TargetData.QuestPos.Position).Magnitude;
						if distToNPC <= 3 then
							hrp.CFrame = TargetData.QuestPos;
							task.wait(0.1);
							pcall(function()
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
									unpack(TargetData.QuestArgs)
								);
							end);
							task.wait(0.5);
						else
							TweenPlayer(TargetData.QuestPos);
						end;
					end;
				else
					local char = plr.Character or plr.CharacterAdded:Wait();
					local hrp  = char:WaitForChild("HumanoidRootPart",1);
					if hrp then
						local AllTikiMobs = {
							"Skull Slayer","Serpent Hunter","Isle Champion",
							"Sun-kissed Warrior","Island Boy","Isle Outlaw"
						};
						local closestEnemy, shortestDist = nil, math.huge;
						for _, v in pairs(workspace.Enemies:GetChildren()) do
							if table.find(AllTikiMobs, v.Name) and v:FindFirstChild("Humanoid")
							   and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
								local d = (hrp.Position - v.HumanoidRootPart.Position).Magnitude;
								if d < shortestDist then shortestDist = d; closestEnemy = v; end;
							end;
						end;
						if closestEnemy then
							TweenPlayer(closestEnemy.HumanoidRootPart.CFrame * CFrame.new(0, FARM_HEIGHT, 0));
							EquipWeapon(_G.Settings.Main["Selected Weapon"]);
							G.Kill(closestEnemy, true);
						else
							TweenPlayer(TargetData.FarmPos);
						end;
					end;
				end;
			end;
		end);
	end;
end);

MasteryFarmSection = MainTab:AddSection("Mastery Farm");
if World3 then
	MasteryMethodList = {
		"Quest",
		"No Quest",
		"Nearest",
		"Cakeprince",
		"Bones"
	};
elseif World2 or World1 then
	MasteryMethodList = {
		"Quest",
		"No Quest",
		"Nearest"
	};
end;
MasteryMethodDropdown = MainTab:AddDropdown({
	Title = "Choose Mastery Method",
	Values = MasteryMethodList,
	Value = _G.Settings.Main["Mastery Method"],
	Callback = function(option)
		_G.Settings.Main["Mastery Method"] = option;
		(getgenv()).SaveSetting();
	end
});
AutoFruitMasteryToggle = MainTab:AddToggle({
	Title = "Auto Fruit Mastery",
	Value = _G.Settings.Main["Auto Farm Fruit Mastery"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm Fruit Mastery"] = state;
		StopTween(_G.Settings.Main["Auto Farm Fruit Mastery"]);
		(getgenv()).SaveSetting();
	end
});
AutoGunMasteryToggle = MainTab:AddToggle({
	Title = "Auto Gun Mastery",
	Value = _G.Settings.Main["Auto Farm Gun Mastery"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm Gun Mastery"] = state;
		StopTween(_G.Settings.Main["Auto Farm Gun Mastery"]);
		(getgenv()).SaveSetting();
	end
});
local SwordList = {};
local Inventory = (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("getInventory");
for i, v in pairs(Inventory) do
	if v.Type == "Sword" then
		table.insert(SwordList, v.Name);
	end;
end;
ChooseSwordDropdown = MainTab:AddDropdown({
	Title = "Choose Sword",
	Values = SwordList,
	Value = _G.Settings.Main["Selected Mastery Sword"],
	Callback = function(option)
		_G.Settings.Main["Selected Mastery Sword"] = option;
		(getgenv()).SaveSetting();
	end
});
function getInfoSword(SwordName)
	if game.Players.LocalPlayer.Character:FindFirstChild(SwordName) then
		return true;
	elseif game.Players.LocalPlayer.Backpack:FindFirstChild(SwordName) then
		return true;
	end;
	return false;
end;
spawn(function()
	while wait() do
		pcall(function()
			if _G.Settings.Main["Auto Farm Sword Mastery"] then
				if not getInfoSword(_G.Settings.Main["Selected Mastery Sword"]) then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("LoadItem", _G.Settings.Main["Selected Mastery Sword"]);
				end;
			end;
		end);
	end;
end);
AutoSwordMasteryToggle = MainTab:AddToggle({
	Title = "Auto Sword Mastery",
	Value = _G.Settings.Main["Auto Farm Sword Mastery"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm Sword Mastery"] = state;
		StopTween(_G.Settings.Main["Auto Farm Sword Mastery"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while task.wait(0.2) do
		if _G.Settings.Main["Auto Farm Sword Mastery"] and _G.Settings.Main["Mastery Method"] == "Quest" then
			pcall(function()
				CheckQuest();
				if not string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest");
					TweenPlayer(CFrameQuest);
					if (CFrameQuest.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end;
				elseif string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if game.Workspace.Enemies:FindFirstChild(Mon) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								if v.Name == Mon then
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										EquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
										Attack();
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										AutoHaki();
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
									until not _G.Settings.Main["Auto Farm Sword Mastery"] or (not v.Parent) or v.Humanoid.Health == 0 or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Quest";
								end;
							end;
						end;
					else
						TweenPlayer(CFrameMon);
						UnEquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Sword Mastery"] and _G.Settings.Main["Mastery Method"] == "No Quest" then
			pcall(function()
				CheckQuest();
				TweenPlayer(CFrameMon);
				if game.Workspace.Enemies:FindFirstChild(Mon) then
					for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							_G._farmMobTarget = v;
							repeat
								task.wait(0.15);
								EquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
								Attack();
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
							until not _G.Settings.Main["Auto Farm Sword Mastery"] or (not v.Parent) or v.Humanoid.Health == 0 or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "No Quest";
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
					TweenPlayer(CFrameMon);
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Sword Mastery"] and _G.Settings.Main["Mastery Method"] == "Bones" then
			pcall(function()
				TweenPlayer(QuestBonePos);
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace")).Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace")).Enemies:FindFirstChild("Demonic Soul") or (game:GetService("Workspace")).Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									EquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
									Attack();
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
								until not _G.Settings.Main["Auto Farm Sword Mastery"] or v.Humanoid.Health <= 0 or (not v.Parent) or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Bones";
							end;
						elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Demonic Soul") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Sword Mastery"] and _G.Settings.Main["Mastery Method"] == "Cakeprince" then
			pcall(function()
				local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375);
				TweenPlayer(PosCake);
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace")).Enemies:FindFirstChild("Baking Staff") or (game:GetService("Workspace")).Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									EquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
									Attack();
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
								until not _G.Settings.Main["Auto Farm Sword Mastery"] or v.Humanoid.Health <= 0 or (not v.Parent) or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Cakeprince";
							end;
						elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Baking Staff") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Sword Mastery"] and _G.Settings.Main["Mastery Method"] == "Nearest" then
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
							_G._farmMobTarget = v;
							repeat
								task.wait(0.15);
								EquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
								Attack();
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
							until not _G.Settings.Main["Auto Farm Sword Mastery"] or (not v.Parent) or v.Humanoid.Health == 0 or not _G.Settings.Main["Mastery Method"] == "Nearest";
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Sword Mastery"] and _G.Settings.Main["Mastery Method"] == "Boss" then
			if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				CheckBossQuest();
				TweenPlayer(CFrameQBoss);
				if (CFrameQBoss.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss);
				end;
			elseif (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckBossQuest();
					if (game:GetService("Workspace")).Enemies:FindFirstChild(SelectBoss) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									EquipWeapon(_G.Settings.Main["Selected Mastery Sword"]);
									Attack();
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
								until not _G.Settings.Main["Auto Farm Sword Mastery"] or not _G.Settings.Main["Mastery Method"] == "Boss" or (not v.Parent) or v.Humanoid.Health == 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name));
							end;
						end;
					end;
				end);
			end;
		end;
	end;
end);
spawn(function()
	while task.wait(0.2) do
		if _G.Settings.Main["Auto Farm Fruit Mastery"] and _G.Settings.Main["Mastery Method"] == "Quest" then
			pcall(function()
				CheckQuest();
				if not string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest");
					TweenPlayer(CFrameQuest);
					if (CFrameQuest.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end;
				elseif string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if game.Workspace.Enemies:FindFirstChild(Mon) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								if v.Name == Mon then
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
											EquipWeapon((game:GetService("Players")).LocalPlayer.Data.DevilFruit.Value);
											TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
											Skillaimbot = true;
											UseSkill = true;
										else
											UseSkill = false;
											Skillaimbot = false;
											EquipWeapon(_G.Settings.Main["Selected Weapon"]);
											NormalAttack();
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										end;
										AutoHaki();
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										AimBotSkillPosition = v.HumanoidRootPart.Position;
										Skillaimbot = true;
									until not _G.Settings.Main["Auto Farm Fruit Mastery"] or (not v.Parent) or v.Humanoid.Health == 0 or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Quest";
									UseSkill = false;
									Skillaimbot = false;
								end;
							end;
						end;
					else
						UseSkill = false;
						TweenPlayer(CFrameMon);
						UnEquipWeapon(SelectWeapon);
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Fruit Mastery"] and _G.Settings.Main["Mastery Method"] == "No Quest" then
			pcall(function()
				CheckQuest();
				TweenPlayer(CFrameMon);
				if game.Workspace.Enemies:FindFirstChild(Mon) then
					for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							_G._farmMobTarget = v;
							repeat
								task.wait(0.15);
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
									EquipWeapon((game:GetService("Players")).LocalPlayer.Data.DevilFruit.Value);
									UseSkill = true;
									Skillaimbot = true;
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
								else
									UseSkill = false;
									Skillaimbot = false;
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									NormalAttack();
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								AimBotSkillPosition = v.HumanoidRootPart.Position;
							until not _G.Settings.Main["Auto Farm Fruit Mastery"] or (not v.Parent) or v.Humanoid.Health == 0 or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "No Quest";
							UseSkill = false;
							Skillaimbot = false;
						end;
					end;
				else
					UseSkill = false;
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrameMon);
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Fruit Mastery"] and _G.Settings.Main["Mastery Method"] == "Bones" then
			pcall(function()
				TweenPlayer(QuestBonePos);
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace")).Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace")).Enemies:FindFirstChild("Demonic Soul") or (game:GetService("Workspace")).Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
										EquipWeapon((game:GetService("Players")).LocalPlayer.Data.DevilFruit.Value);
										UseSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										NormalAttack();
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.Settings.Main["Auto Farm Fruit Mastery"] or v.Humanoid.Health <= 0 or (not v.Parent) or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Bones";
								UseSkill = false;
								Skillaimbot = false;
							end;
						elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Demonic Soul") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Fruit Mastery"] and _G.Settings.Main["Mastery Method"] == "Cakeprince" then
			pcall(function()
				local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375);
				TweenPlayer(PosCake);
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace")).Enemies:FindFirstChild("Baking Staff") or (game:GetService("Workspace")).Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
										EquipWeapon((game:GetService("Players")).LocalPlayer.Data.DevilFruit.Value);
										UseSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										NormalAttack();
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.Settings.Main["Auto Farm Fruit Mastery"] or v.Humanoid.Health <= 0 or (not v.Parent) or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Cakeprince";
								UseSkill = false;
								Skillaimbot = false;
							end;
						elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Baking Staff") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Fruit Mastery"] and _G.Settings.Main["Mastery Method"] == "Nearest" then
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
							_G._farmMobTarget = v;
							repeat
								task.wait(0.15);
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
									EquipWeapon((game:GetService("Players")).LocalPlayer.Data.DevilFruit.Value);
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									Skillaimbot = true;
									UseSkill = true;
								else
									Skillaimbot = false;
									UseSkill = false;
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									NormalAttack();
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								AimBotSkillPosition = v.HumanoidRootPart.Position;
							until not _G.Settings.Main["Auto Farm Fruit Mastery"] or (not v.Parent) or v.Humanoid.Health == 0 or not _G.Settings.Main["Mastery Method"] == "Nearest";
							UseSkill = false;
							Skillaimbot = false;
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Fruit Mastery"] and _G.Settings.Main["Mastery Method"] == "Boss" then
			if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				CheckBossQuest();
				TweenPlayer(CFrameQBoss);
				if (CFrameQBoss.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss);
				end;
			elseif (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckBossQuest();
					if (game:GetService("Workspace")).Enemies:FindFirstChild(SelectBoss) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
										EquipWeapon((game:GetService("Players")).LocalPlayer.Data.DevilFruit.Value);
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
										Skillaimbot = true;
										UseSkill = true;
									else
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										UseSkill = false;
										Skillaimbot = false;
										NormalAttack();
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.Settings.Main["Auto Farm Fruit Mastery"] or not _G.Settings.Main["Mastery Method"] == "Boss" or (not v.Parent) or v.Humanoid.Health == 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name));
								UseSkill = false;
								Skillaimbot = false;
							end;
						end;
					else
						UseSkill = false;
						Skillaimbot = false;
					end;
				end);
			end;
		end;
	end;
end);
spawn(function()
	while task.wait(0.2) do
		if _G.Settings.Main["Auto Farm Gun Mastery"] and _G.Settings.Main["Mastery Method"] == "Quest" then
			pcall(function()
				CheckQuest();
				if not string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest");
					TweenPlayer(CFrameQuest);
					if (CFrameQuest.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end;
				elseif string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if game.Workspace.Enemies:FindFirstChild(Mon) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								if v.Name == Mon then
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
											EquipWeapon(SelectWeaponGun);
											local ShootPosition = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
											((game:GetService("Players")).LocalPlayer.Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
											TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
											UseGunSkill = true;
											Skillaimbot = true;
										else
											UseGunSkill = false;
											Skillaimbot = false;
											EquipWeapon(_G.Settings.Main["Selected Weapon"]);
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										end;
										AutoHaki();
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										NormalAttack();
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										AimBotSkillPosition = v.HumanoidRootPart.Position;
									until not _G.Settings.Main["Auto Farm Gun Mastery"] or (not v.Parent) or v.Humanoid.Health <= 0 or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "Quest";
									UseGunSkill = false;
									Skillaimbot = false;
								end;
							end;
						end;
					else
						UseGunSkill = false;
						Skillaimbot = false;
						TweenPlayer(CFrameMon);
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Gun Mastery"] and _G.Settings.Main["Mastery Method"] == "No Quest" then
			pcall(function()
				CheckQuest();
				TweenPlayer(CFrameMon);
				if game.Workspace.Enemies:FindFirstChild(Mon) then
					for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							_G._farmMobTarget = v;
							repeat
								task.wait(0.15);
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
									local ShootPosition = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
									((game:GetService("Players")).LocalPlayer.Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
									EquipWeapon(SelectWeaponGun);
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									UseGunSkill = true;
									Skillaimbot = true;
								else
									Skillaimbot = false;
									UseGunSkill = false;
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								NormalAttack();
								AimBotSkillPosition = v.HumanoidRootPart.Position;
							until not _G.Settings.Main["Auto Farm Gun Mastery"] or (not v.Parent) or v.Humanoid.Health <= 0 or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name)) or not _G.Settings.Main["Mastery Method"] == "No Quest";
						end;
					end;
				else
					UseGunSkill = false;
					Skillaimbot = false;
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrameMon);
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Gun Mastery"] and _G.Settings.Main["Mastery Method"] == "Bones" then
			pcall(function()
				TweenPlayer(QuestBonePos);
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace")).Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace")).Enemies:FindFirstChild("Demonic Soul") or (game:GetService("Workspace")).Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									task.wait(0.15);
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
										EquipWeapon(SelectWeaponGun);
										local ShootPosition = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
										((game:GetService("Players")).LocalPlayer.Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
										UseGunSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseGunSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									NormalAttack();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.Settings.Main["Auto Farm Gun Mastery"] or not _G.Settings.Main["Mastery Method"] == "Bones" or v.Humanoid.Health <= 0 or (not v.Parent);
								UseGunSkill = false;
								Skillaimbot = false;
							elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Demonic Soul") then
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							end;
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Gun Mastery"] and _G.Settings.Main["Mastery Method"] == "Cakeprince" then
			pcall(function()
				local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375);
				TweenPlayer(PosCake);
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace")).Enemies:FindFirstChild("Baking Staff") or (game:GetService("Workspace")).Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									task.wait(0.15);
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
										EquipWeapon(SelectWeaponGun);
										local ShootPosition = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
										((game:GetService("Players")).LocalPlayer.Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
										UseGunSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseGunSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									NormalAttack();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.Settings.Main["Auto Farm Gun Mastery"] or not _G.Settings.Main["Mastery Method"] == "Cakeprince" or v.Humanoid.Health <= 0 or (not v.Parent);
								UseGunSkill = false;
								Skillaimbot = false;
							elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Cake Guard") then
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							end;
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Gun Mastery"] and _G.Settings.Main["Mastery Method"] == "Nearest" then
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
							repeat
								task.wait(0.15);
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
									EquipWeapon(SelectWeaponGun);
									local ShootPosition = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
									((game:GetService("Players")).LocalPlayer.Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									UseGunSkill = true;
									Skillaimbot = true;
								else
									UseGunSkill = false;
									Skillaimbot = false;
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								NormalAttack();
								AimBotSkillPosition = v.HumanoidRootPart.Position;
							until not _G.Settings.Main["Auto Farm Gun Mastery"] or (not v.Parent) or v.Humanoid.Health <= 0 or not _G.Settings.Main["Mastery Method"] == "Nearest";
							UseGunSkill = false;
							Skillaimbot = false;
						end;
					end;
				end;
			end);
		elseif _G.Settings.Main["Auto Farm Gun Mastery"] and _G.Settings.Main["Mastery Method"] == "Boss" then
			if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				CheckBossQuest();
				TweenPlayer(CFrameQBoss);
				if (CFrameQBoss.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss);
				end;
			elseif (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckBossQuest();
					if (game:GetService("Workspace")).Enemies:FindFirstChild(SelectBoss) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat
									task.wait(0.15);
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
										EquipWeapon(SelectWeaponGun);
										local ShootPosition = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
										((game:GetService("Players")).LocalPlayer.Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
										UseGunSkill = true;
										Skillaimbot = true;
									else
										UseGunSkill = false;
										Skillaimbot = false;
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									NormalAttack();
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.Settings.Main["Auto Farm Gun Mastery"] or not _G.Settings.Main["Mastery Method"] == "Boss" or (not v.Parent) or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not (game:GetService("Workspace")).Enemies:FindFirstChild(v.Name));
								Skillaimbot = false;
							end;
						end;
					else
						UseGunSkill = false;
						Skillaimbot = false;
						TweenPlayer(((game:GetService("ReplicatedStorage")):FindFirstChild(SelectBoss)).HumanoidRootPart.CFrame * Pos);
					end;
				end);
			end;
		end;
	end;
end);

MonFarmSection = MainTab:AddSection("Mob Farm");
if World1 then
	tableMon = {
		"Bandit",
		"Monkey",
		"Gorilla",
		"Pirate",
		"Brute",
		"Desert Bandit",
		"Desert Officer",
		"Snow Bandit",
		"Snowman",
		"Chief Petty Officer",
		"Sky Bandit",
		"Dark Master",
		"Toga Warrior",
		"Gladiator",
		"Military Soldier",
		"Military Spy",
		"Fishman Warrior",
		"Fishman Commando",
		"God's Guard",
		"Shanda",
		"Royal Squad",
		"Royal Soldier",
		"Galley Pirate",
		"Galley Captain"
	};
elseif World2 then
	tableMon = {
		"Raider",
		"Mercenary",
		"Swan Pirate",
		"Factory Staff",
		"Marine Lieutenant",
		"Marine Captain",
		"Zombie",
		"Vampire",
		"Snow Trooper",
		"Winter Warrior",
		"Lab Subordinate",
		"Horned Warrior",
		"Magma Ninja",
		"Lava Pirate",
		"Ship Deckhand",
		"Ship Engineer",
		"Ship Steward",
		"Ship Officer",
		"Arctic Warrior",
		"Snow Lurker",
		"Sea Soldier",
		"Water Fighter"
	};
elseif World3 then
	tableMon = {
		"Pirate Millionaire",
		"Dragon Crew Warrior",
		"Dragon Crew Archer",
		"Female Islander",
		"Giant Islander",
		"Marine Commodore",
		"Marine Rear Admiral",
		"Fishman Raider",
		"Fishman Captain",
		"Forest Pirate",
		"Mythological Pirate",
		"Jungle Pirate",
		"Musketeer Pirate",
		"Reborn Skeleton",
		"Living Zombie",
		"Demonic Soul",
		"Posessed Mummy",
		"Peanut Scout",
		"Peanut President",
		"Ice Cream Chef",
		"Ice Cream Commander",
		"Cookie Crafter",
		"Cake Guard",
		"Baking Staff",
		"Head Baker",
		"Cocoa Warrior",
		"Chocolate Bar Battler",
		"Sweet Thief",
		"Candy Rebel",
		"Candy Pirate",
		"Snow Demon",
		"Isle Outlaw",
		"Island Boy",
		"Sun-kissed Warrior",
		"Isle Champion"
	};
end;
ChooseMonDropdown = MainTab:AddDropdown({
	Title = "Choose Mob",
	Values = tableMon,
	Value = _G.Settings.Main["Selected Mon"],
	Callback = function(option)
		_G.Settings.Main["Selected Mon"] = option;
		(getgenv()).SaveSetting();
	end
});
AutoMonFarmToggle = MainTab:AddToggle({
	Title = "Auto Farm Mob",
	Desc = "Auto Kill Mob When Spawn",
	Value = _G.Settings.Main["Auto Farm Mon"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm Mon"] = state;
		StopTween(_G.Settings.Main["Auto Farm Mon"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Auto Farm Mon"] then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild(_G.Settings.Main["Selected Mon"]) then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == _G.Settings.Main["Selected Mon"] then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Main["Auto Farm Mon"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);

BossSection = FarmingHopTab:AddSection(" Boss Farm");
BossStatusParagraph = FarmingHopTab:AddParagraph({
	Title = "Boss Status",
	Desc = "N/A"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if (game:GetService("ReplicatedStorage")):FindFirstChild(_G.Settings.Main["Selected Boss"]) or (game:GetService("Workspace")).Enemies:FindFirstChild(_G.Settings.Main["Selected Boss"]) then
				BossStatusParagraph:SetDesc("Spawn!");
			else
				BossStatusParagraph:SetDesc("Not Spawn");
			end;
		end);
	end;
end);
if World1 then
	tableBoss = {
		"The Gorilla King",
		"Bobby",
		"Yeti",
		"Mob Leader",
		"Vice Admiral",
		"Warden",
		"Chief Warden",
		"Swan",
		"Magma Admiral",
		"Fishman Lord",
		"Wysper",
		"Thunder God",
		"Cyborg",
		"Saber Expert"
	};
elseif World2 then
	tableBoss = {
		"Diamond",
		"Jeremy",
		"Fajita",
		"Don Swan",
		"Smoke Admiral",
		"Cursed Captain",
		"Darkbeard",
		"Order",
		"Awakened Ice Admiral",
		"Tide Keeper"
	};
elseif World3 then
	tableBoss = {
		"Stone",
		"Island Empress",
		"Kilo Admiral",
		"Captain Elephant",
		"Beautiful Pirate",
		"rip_indra True Form",
		"Longma",
		"Soul Reaper",
		"Cake Queen"
	};
end;
ChooseBossDropdown = FarmingHopTab:AddDropdown({
	Title = "Choose Boss",
	Values = tableBoss,
	Value = _G.Settings.Main["Selected Boss"],
	Callback = function(option)
		_G.Settings.Main["Selected Boss"] = option;
		(getgenv()).SaveSetting();
	end
});
AutoFarmBossToggle = FarmingHopTab:AddToggle({
	Title = "Auto Farm Boss",
	Desc = "Auto Kill Boss When Spawn",
	Value = _G.Settings.Main["Auto Farm Boss"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm Boss"] = state;
		StopTween(_G.Settings.Main["Auto Farm Boss"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Auto Farm Boss"] then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild(_G.Settings.Main["Selected Boss"]) then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == _G.Settings.Main["Selected Boss"] then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Main["Auto Farm Boss"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				elseif (game:GetService("ReplicatedStorage")):FindFirstChild(_G.Settings.Main["Selected Boss"]) then
					TweenPlayer(((game:GetService("ReplicatedStorage")):FindFirstChild(_G.Settings.Main["Selected Boss"])).HumanoidRootPart.CFrame * CFrame.new(5, 10, 2));
				end;
			end);
		end;
	end;
end);
AutoFarmAllBossToggle = FarmingHopTab:AddToggle({
	Title = "Auto Farm All Boss",
	Value = _G.Settings.Main["Auto Farm All Boss"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm All Boss"] = state;
		StopTween(_G.Settings.Main["Auto Farm All Boss"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Auto Farm All Boss"] then
			pcall(function()
				for i, boss in pairs(tableBoss) do
					if (game:GetService("Workspace")).Enemies:FindFirstChild(boss) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == boss then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
									until not _G.Settings.Main["Auto Farm All Boss"] or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					elseif (game:GetService("ReplicatedStorage")):FindFirstChild(boss) then
						TweenPlayer(((game:GetService("ReplicatedStorage")):FindFirstChild(boss)).HumanoidRootPart.CFrame * CFrame.new(5, 10, 2));
					end;
				end;
			end);
		end;
	end;
end);

FactoryRaidSection = OthersTab:AddSection("Factory Raid");
_G.Settings.Farm["Auto Factory Raid"] = _G.Settings.Farm["Auto Factory Raid"] or false;
AutoFactoryRaidToggle = OthersTab:AddToggle({
	Title = "Auto Factory Raid",
	Desc = "Entra na factory pelo portal do Dom Flamingo (Sea 2), vai ao topo e farma os inimigos.",
	Value = _G.Settings.Farm["Auto Factory Raid"],
	Callback = function(state)
		_G.Settings.Farm["Auto Factory Raid"] = state;
		(getgenv()).SaveSetting();
	end
});

local _FACTORY_PORTAL_POS = Vector3.new(1073.47, 14.52, 1560.72);
local _FACTORY_TOP_CF     = CFrame.new(1002.53, 500, 1522.34);
local _FACTORY_MOB_CF     = CFrame.new(1002.53, 490, 1520.0);

spawn(function()
	while wait(0.5) do
		if not _G.Settings.Farm["Auto Factory Raid"] then continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local char = plr.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return; end;

			local insideFactory = hrp.Position.Y > 300;
			if not insideFactory then

				pcall(function()
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
						"requestEntrance", _FACTORY_PORTAL_POS
					);
				end);
				task.wait(2);

				TweenPlayer(_FACTORY_TOP_CF);
				local t = 0;
				repeat task.wait(0.2); t=t+0.2;
				until hrp.Position.Y > 400 or t > 15;
				return;
			end;

			local foundEnemy = false;
			for _, mob in pairs(workspace.Enemies:GetChildren()) do
				local mobHRP = mob:FindFirstChild("HumanoidRootPart");
				local mobHum = mob:FindFirstChild("Humanoid");
				if mobHRP and mobHum and mobHum.Health > 0 then
					if mobHRP.Position.Y > 300 then

						foundEnemy = true;
						EquipWeapon(_G.Settings.Main["Selected Weapon"]);
						AutoHaki();
						TweenPlayer(mobHRP.CFrame * Pos);
						mobHum.WalkSpeed = 0;
						Attack();
						break;
					end;
				end;
			end;
			if not foundEnemy then

				TweenPlayer(_FACTORY_MOB_CF);
				task.wait(1);
			end;
		end);
	end;
end);

PirateRaidSection = OthersTab:AddSection("Pirate Raid");
AutoPirateRaidToggle = OthersTab:AddToggle({
	Title = "Auto Pirate Raid",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Farm["Auto Pirate Raid"],
	Callback = function(state)
		_G.Settings.Farm["Auto Pirate Raid"] = state;
		StopTween(_G.Settings.Farm["Auto Pirate Raid"]);
		(getgenv()).SaveSetting();
	end
});
function getPirateRaidEnemies()
	local PirateRaidPos = CFrame.new(-5515.08301, 343.112762, -3013.25171, 0.0679906458, 0.0000000121971047, -0.997685969, -0.0000000640159001, 1, 0.00000000786281706, 0.997685969, 0.000000063333168, 0.0679906458);
	for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
		if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			local enemyPos = v.HumanoidRootPart.Position;
			if (PirateRaidPos.Position - enemyPos).Magnitude <= 2000 then
				if v then
					return v;
				else
					return false;
				end;
			end;
		end;
	end;
end;
spawn(function()
	while wait() do
		if _G.Settings.Farm["Auto Pirate Raid"] then
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						if v.Name then
							if getPirateRaidEnemies() then
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										Attack();
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
									until not _G.Settings.Main["Auto Pirate Raid"] or (not v.Parent) or v.Humanoid.Health <= 0 or (not game.Workspace.Enemies:FindFirstChild(v.Name));
								end;
							else
								TweenPlayer(CFrame.new(-5515.08301, 343.112762, -3013.25171, 0.0679906458, 0.0000000121971047, -0.997685969, -0.0000000640159001, 1, 0.00000000786281706, 0.997685969, 0.000000063333168, 0.0679906458));
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
ChestFarmSection = OthersTab:AddSection("Chest Farm");

_G.FullyVolcanicActive = false;
_G.VolcanicAutoReset = false;
_G.VolcanicCollectEgg = false;
_G.VolcanicCollectBone = false;
_G._volcanicPhase = "idle";
_G.VolcanicSelectedBoat = _G.VolcanicSelectedBoat or "Guardian";

local _TIKI_BOAT_NPC_VOL_CF = CFrame.new(-16927.45, 9.08, 433.86);
local _VOLCANIC_ISLAND_SAIL_CF = CFrame.new(-270000, 9, 8500);

local _VOLCANIC_HOLE_POSITIONS = {
	CFrame.new(-270055, 22, 8480),
	CFrame.new(-270030, 22, 8520),
	CFrame.new(-270075, 22, 8500),
	CFrame.new(-270020, 22, 8490),
	CFrame.new(-270060, 22, 8535),
	CFrame.new(-270045, 22, 8465),
};

local _VOLCANIC_GOLEM_NAMES = {"Aura Golem", "Lava Golem", "Stone Golem", "Rock Golem"};

local function _volcanicNotify(txt, dur)
	Library:Notify({Title = "Volcanic Island", Content = txt, Icon = "bell", Duration = dur or 4});
end;

local function _buyBoatAtTiki(boatName)
	pcall(function()
		local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
		if not hrp then return; end;

		TweenPlayer(_TIKI_BOAT_NPC_VOL_CF);
		local t = 0;
		repeat task.wait(0.3); t=t+0.3;
		until (hrp.Position - _TIKI_BOAT_NPC_VOL_CF.Position).Magnitude < 20 or t > 30;
		task.wait(0.5);
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", boatName);
		task.wait(1);
	end);
end;

local function _goToVolcanicIsland()
	_volcanicNotify("Comprando barco e navegando para Volcanic Island (mar 6)...", 5);
	pcall(function()
		local existing = workspace.Boats:FindFirstChild(_G.VolcanicSelectedBoat);
		if not existing then
			_buyBoatAtTiki(_G.VolcanicSelectedBoat);
		end;
	end);
	local boatTimeout = 0;
	local _volcanicBoatTween = nil;
	while _G.FullyVolcanicActive and not workspace._WorldOrigin.Locations:FindFirstChild("Volcanic Island") and boatTimeout < 600 do
		pcall(function()
			local boat = workspace.Boats:FindFirstChild(_G.VolcanicSelectedBoat);
			if boat then
				local seat = boat:FindFirstChildWhichIsA("VehicleSeat") or boat:FindFirstChild("VehicleSeat");
				local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
				local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
				if seat and hrp and hum then
					if not hum.Sit then
						if _volcanicBoatTween then _volcanicBoatTween:Stop(); _volcanicBoatTween = nil; end;
						hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0);
					else
						if not _volcanicBoatTween then
							_volcanicBoatTween = TweenBoat(_VOLCANIC_ISLAND_SAIL_CF);
						end;
					end;
				end;
			else
				if _volcanicBoatTween then _volcanicBoatTween:Stop(); _volcanicBoatTween = nil; end;
				_volcanicNotify("Barco sumiu, comprando outro na Tiki...", 3);
				_buyBoatAtTiki(_G.VolcanicSelectedBoat);
			end;
		end);
		task.wait(1);
		boatTimeout = boatTimeout + 1;
	end;
	if _volcanicBoatTween then _volcanicBoatTween:Stop(); end;
end;

local function _solveVolcanicIsland()
	_volcanicNotify("Iniciando Raid: tampando buracos e matando Aura Golems...", 4);
	local islandDone = false;
	local raidStart = os.time();
	pcall(function()
		local loc = workspace._WorldOrigin.Locations:FindFirstChild("Volcanic Island");
		if loc then
			local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
			if hrp then hrp.CFrame = CFrame.new(loc.Position + Vector3.new(0, 5, 0)); end;
			task.wait(0.5);
		end;
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ActivateVolcanicIsland");
	end);
	task.wait(1.5);
	task.spawn(function()
		while _G.FullyVolcanicActive and not islandDone do
			pcall(function()
				for _, holePos in ipairs(_VOLCANIC_HOLE_POSITIONS) do
					if not _G.FullyVolcanicActive or islandDone then break; end;
					local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
					if hrp then
						hrp.CFrame = holePos;
						task.wait(0.1);
						Attack();
						task.wait(0.1);
					end;
				end;
			end);
			task.wait(0.2);
		end;
	end);
	while _G.FullyVolcanicActive and not islandDone do
		pcall(function()
			for _, golemName in pairs(_VOLCANIC_GOLEM_NAMES) do
				for _, v in pairs(workspace.Enemies:GetChildren()) do
					if v.Name == golemName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						AutoHaki();
						EquipWeapon(_G.Settings.Main["Selected Weapon"]);
						v.HumanoidRootPart.Size = Vector3.new(1,1,1);
						TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						Attack();
					end;
				end;
			end;
			if not workspace._WorldOrigin.Locations:FindFirstChild("Volcanic Island") and (os.time() - raidStart) > 30 then
				islandDone = true;
			end;
			if (os.time() - raidStart) >= 300 then
				islandDone = true;
				_volcanicNotify("Volcanic Island solada! Aguardando reset...", 10);
			end;
		end);
		task.wait(0.3);
	end;
	islandDone = true;
	if _G.VolcanicCollectEgg then
		_volcanicNotify("Coletando Egg...", 3);
		local eggTimeout = 0;
		while _G.FullyVolcanicActive and eggTimeout < 30 do
			pcall(function()
				for _, v in pairs(workspace:GetDescendants()) do
					if v.Name:lower():find("egg") and v:IsA("BasePart") then
						local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
						if hrp then hrp.CFrame = CFrame.new(v.Position); task.wait(0.3); end;
					end;
				end;
			end);
			task.wait(1);
			eggTimeout = eggTimeout + 1;
		end;
	end;
	if _G.VolcanicCollectBone then
		_volcanicNotify("Coletando Bone...", 3);
		local boneTimeout = 0;
		while _G.FullyVolcanicActive and boneTimeout < 30 do
			pcall(function()
				for _, v in pairs(workspace:GetDescendants()) do
					if (v.Name:lower():find("bone") or v.Name:lower():find("skull")) and v:IsA("BasePart") then
						local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
						if hrp then hrp.CFrame = CFrame.new(v.Position); task.wait(0.3); end;
					end;
				end;
			end);
			task.wait(1);
			boneTimeout = boneTimeout + 1;
		end;
	end;
end;

local _volcanicMainLoop;
_volcanicMainLoop = function()
	while _G.FullyVolcanicActive do
		_G._volcanicPhase = "sailing";
		if not workspace._WorldOrigin.Locations:FindFirstChild("Volcanic Island") then
			_goToVolcanicIsland();
		end;
		if not _G.FullyVolcanicActive then break; end;
		_G._volcanicPhase = "solving";
		_solveVolcanicIsland();
		if not _G.FullyVolcanicActive then break; end;
		_G._volcanicPhase = "waiting";
		_volcanicNotify("Volcanic Island Completa! Aguardando reset...", 8);
		local waitStart = os.time();
		while _G.FullyVolcanicActive and (workspace._WorldOrigin.Locations:FindFirstChild("Volcanic Island") or (os.time() - waitStart) < 60) do
			task.wait(2);
		end;
		if _G.VolcanicAutoReset and _G.FullyVolcanicActive then
			_volcanicNotify("Auto Reset em 10 segundos...", 10);
			local t = 0;
			while t < 10 and _G.FullyVolcanicActive and _G.VolcanicAutoReset do
				task.wait(1);
				t = t + 1;
			end;
			if _G.FullyVolcanicActive and _G.VolcanicAutoReset then
				pcall(function()
					local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
					if hum then hum.Health = 0; end;
				end);
				task.wait(4);
				_G._volcanicPhase = "idle";
			else
				break;
			end;
		else
			_G.FullyVolcanicActive = false;
			_G._volcanicPhase = "idle";
			break;
		end;
	end;
	_G._volcanicPhase = "idle";
end;

MultiFarmTab:AddSection("PRE HISTORIC KAITUN");

local _volcanicBoatList = {"Guardian", "Patrol Boat", "Speedboat", "Upgraded Boat", "Cannon Raft"};

MultiFarmTab:AddDropdown({
	Title = "Boat Selection",
	Desc = "Selecione o barco para navegar ate a Volcanic Island",
	Options = _volcanicBoatList,
	CurrentOption = {"Guardian"},
	Callback = function(sel)
		_G.VolcanicSelectedBoat = sel[1] or "Guardian";
	end
});

MultiFarmTab:AddToggle({
	Title = "Auto Fully Volcanic",
	Desc = "Compra barco na Tiki, navega ate Volcanic Island no mar 6, inicia Raid, tampa buracos de lava e mata Aura Golems. Sea 3.",
	Value = false,
	Callback = function(state)
		_G.FullyVolcanicActive = state;
		if _G.Settings and _G.Settings.Multi then _G.Settings.Multi["Auto Fully Volcanic"] = state; (getgenv()).SaveSetting(); end;
		if state then
			task.spawn(_volcanicMainLoop);
		end;
	end
});
MultiFarmTab:AddToggle({
	Title = "Auto Reset After Complete",
	Desc = "Espera 10 segundos e reseta automaticamente quando a Volcanic Island for completada.",
	Value = false,
	Callback = function(state)
		_G.VolcanicAutoReset = state;
		if _G.Settings and _G.Settings.Multi then _G.Settings.Multi["Auto Reset After Complete"] = state; (getgenv()).SaveSetting(); end;
	end
});
MultiFarmTab:AddToggle({
	Title = "Auto Collect Egg",
	Desc = "Coleta os Eggs que spawnam apos completar a Volcanic Island, antes de auto resetar.",
	Value = false,
	Callback = function(state)
		_G.VolcanicCollectEgg = state;
		if _G.Settings and _G.Settings.Multi then _G.Settings.Multi["Auto Collect Egg"] = state; (getgenv()).SaveSetting(); end;
	end
});
MultiFarmTab:AddToggle({
	Title = "Auto Collect Bone",
	Desc = "Coleta os ossos que caem apos completar a ilha. Funciona apos coletar Egg e antes do auto reset.",
	Value = false,
	Callback = function(state)
		_G.VolcanicCollectBone = state;
		if _G.Settings and _G.Settings.Multi then _G.Settings.Multi["Auto Collect Bone"] = state; (getgenv()).SaveSetting(); end;
	end
});

MultiFarmTab:AddSection("DUNGEON KAITUN");

_G.Settings.Main = _G.Settings.Main or {};
_G.Settings.Main["Auto Fully Dungeon"] = _G.Settings.Main["Auto Fully Dungeon"] or false;

MultiFarmTab:AddParagraph({
	Title = "Auto Fully Dungeon",
	Desc = "Entra na Dungeon, derrota todos os NPCs de cada Floor (incluindo Kitsune F10 e Gas F15), faz Skip Hub e repete. Funciona apenas na Dungeon World (Place ID: 73902483975735)."
});

local _AutoFullyDungeonToggle = MultiFarmTab:AddToggle({
	Title = "Auto Fully Dungeon",
	Desc = "Liga/desliga o ciclo completo de Dungeon automático.",
	Value = _G.Settings.Main["Auto Fully Dungeon"],
	Callback = function(state)
		_G.Settings.Main["Auto Fully Dungeon"] = state;

		if getgenv().DungeonConfig then
			getgenv().DungeonConfig.AutoFully = state;

			getgenv().DungeonConfig.AutoEnter    = state;
			getgenv().DungeonConfig.AutoComplete = state;
			getgenv().DungeonConfig.AutoSkipHub  = state;
			getgenv().DungeonConfig.SelectBuffs  = state;
		end;
		(getgenv()).SaveSetting();
	end
});

task.spawn(function()
	task.wait(3);
	if _G.Settings.Main["Auto Fully Dungeon"] then
		if getgenv().DungeonConfig then
			getgenv().DungeonConfig.AutoFully   = true;
			getgenv().DungeonConfig.AutoEnter   = true;
			getgenv().DungeonConfig.AutoComplete = true;
			getgenv().DungeonConfig.AutoSkipHub = true;
			getgenv().DungeonConfig.SelectBuffs = true;
		end;
		if _AutoFullyDungeonToggle and _AutoFullyDungeonToggle.SetStage then
			_AutoFullyDungeonToggle.SetStage(true);
		end;
		Library:Notify({Title = "Dungeon", Content = "Auto Fully Dungeon reativado automaticamente!", Icon = "zap", Duration = 4});
	end;
end);

task.spawn(function()
	local _DUNGEON_PID = 73902483975735;
	while true do
		task.wait(1);
		if not _G.Settings.Main["Auto Fully Dungeon"] then continue; end;
		if game.PlaceId ~= _DUNGEON_PID then

			Library:Notify({Title = "Auto Fully Dungeon", Content = "Não está na Dungeon World! Place ID: " .. _DUNGEON_PID, Icon = "alert-triangle", Duration = 5});
			task.wait(10);
			continue;
		end;
		pcall(function()

			if not (workspace:FindFirstChild("DungeonFloor") or workspace:FindFirstChild("FloorEnemies") or workspace:FindFirstChild("DungeonArea")) then
				if #game:GetService("Players"):GetPlayers() < 2 then return; end;

				for _, v in pairs(workspace:GetDescendants()) do
					local name = v.Name:lower();
					if (name:find("portal") or name:find("dungeon") or name:find("enter") or name:find("gate")) and v:IsA("BasePart") then
						TweenPlayer(v.CFrame * CFrame.new(0, 2, 0));
						task.wait(0.8);
						for _, pp in pairs(v:GetDescendants()) do
							if pp:IsA("ProximityPrompt") then pcall(function() fireproximityprompt(pp); end); end;
						end;
						local rep = game:GetService("ReplicatedStorage");
						local remote = rep:FindFirstChild("CommF_", true) or (rep.Remotes and rep.Remotes:FindFirstChild("CommF_"));
						if remote then
							pcall(function() remote:InvokeServer("EnterDungeon"); end);
							pcall(function() remote:InvokeServer("JoinDungeon"); end);
						end;
						break;
					end;
				end;
				return;
			end;

			local shrines = {};
			local leaks   = {};
			for _, v in pairs(workspace:GetDescendants()) do
				local name = v.Name:lower();
				if name:find("shrine") or (name:find("kitsune") and name:find("trap")) then
					if v:IsA("BasePart") or v:IsA("Model") then table.insert(shrines, v); end;
				end;
				if name:find("gas") or name:find("leak") then
					if v:IsA("BasePart") or v:IsA("Model") then table.insert(leaks, v); end;
				end;
			end;
			if #shrines > 0 then
				for _, sh in pairs(shrines) do
					local pos = sh:IsA("Model") and sh:GetPivot().Position or sh.Position;
					TweenPlayer(CFrame.new(pos.X, pos.Y + 15, pos.Z));
					task.wait(0.1);
					local vim = game:GetService("VirtualInputManager");
					for _, key in pairs({"Z","X","C","V","F"}) do
						pcall(function() vim:SendKeyEvent(true, key, false, game); task.wait(0.05); vim:SendKeyEvent(false, key, false, game); task.wait(0.03); end);
					end;
				end;
				return;
			end;
			if #leaks > 0 then
				for _, lk in pairs(leaks) do
					local pos = lk:IsA("Model") and lk:GetPivot().Position or lk.Position;
					TweenPlayer(CFrame.new(pos.X, pos.Y + 15, pos.Z));
					task.wait(0.1);
					local vim = game:GetService("VirtualInputManager");
					for _, key in pairs({"Z","X","C","V","F"}) do
						pcall(function() vim:SendKeyEvent(true, key, false, game); task.wait(0.05); vim:SendKeyEvent(false, key, false, game); task.wait(0.03); end);
					end;
				end;
				return;
			end;

			local enemyFolder = workspace:FindFirstChild("FloorEnemies") or workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("DungeonEnemies");
			if enemyFolder then
				for _, v in pairs(enemyFolder:GetChildren()) do
					if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						local hrp = v:FindFirstChild("HumanoidRootPart");
						if hrp then
							EquipWeapon(_G.Settings.Main["Selected Weapon"] or _G.SelectWeapon);
							TweenPlayer(hrp.CFrame * CFrame.new(0, 20, 0));
							task.wait(0.1);
						end;
						return;
					end;
				end;
			end;

			local rep = game:GetService("ReplicatedStorage");
			local remote = rep:FindFirstChild("CommF_", true) or (rep.Remotes and rep.Remotes:FindFirstChild("CommF_"));
			if remote then
				pcall(function() remote:InvokeServer("NextFloor"); end);
				pcall(function() remote:InvokeServer("AdvanceFloor"); end);
			end;
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("ProximityPrompt") then
					local n = (v.ActionText or v.Name):lower();
					if n:find("next") or n:find("advance") or n:find("continue") or n:find("pass") then
						pcall(function() fireproximityprompt(v); end);
					end;
				end;
			end;

			local plrGui = game.Players.LocalPlayer.PlayerGui;
			for _, gui in pairs(plrGui:GetDescendants()) do
				if (gui:IsA("TextButton") or gui:IsA("ImageButton")) and gui.Visible then
					local t = (gui.Text or ""):lower();
					if t:find("skip") or t:find("lobby") or t:find("return") or t:find("continue") or t:find("next") then
						gui:Activate();
						task.wait(1);
					end;
				end;
			end;
		end);
	end;
end);

local _chestTweenActive = false;
local _chestTweenLastBeli = 0;
_chestTweenActive = false;
_chestBypassActive = false;
_G.ChestHopActive = false;
_G.ChestHopCount = 0;
_G.ChestHopLimit = 20;
_chestTweenLastBeli = 0;

local function _isSpecialChestItem()
	local result = false;
	pcall(function()
		local plr = game.Players.LocalPlayer;
		local function checkContainer(c)
			if not c then return; end;
			if c:FindFirstChild("Mysterious Treasure") then result = true; end;
			if c:FindFirstChild("First of Darkness") then result = true; end;
			if c:FindFirstChild("God's Chalice") then result = true; end;
		end;
		checkContainer(plr.Backpack);
		checkContainer(plr.Character);
	end);
	return result;
end;

AutoFarmChestTweenToggle = OthersTab:AddToggle({
	Title = "Auto Farm Chest Tween",
	Desc = "Tween preciso para cada bau. Confirma coleta via Beli antes de ir pro proximo.",
	Value = _G.Settings.Farm["Auto Farm Chest Tween"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Chest Tween"] = state;
		_chestTweenActive = state;
		if not state then StopTween(false); end;
		(getgenv()).SaveSetting();
	end
});

task.spawn(function()
	local plr = game.Players.LocalPlayer;
	repeat task.wait() until plr.Data and plr.Data:FindFirstChild("Beli");
	plr.Data.Beli:GetPropertyChangedSignal("Value"):Connect(function()
		_chestTweenLastBeli = plr.Data.Beli.Value;
	end);
end);
task.spawn(function()
	while true do
		task.wait(0);
		if not _chestTweenActive then task.wait(0.2); continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			if _isSpecialChestItem() then
				_chestTweenActive = false;
				_G.Settings.Farm["Auto Farm Chest Tween"] = false;
				Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Item especial encontrado! Auto Chest parado.", Icon = "bell", Duration = 6});
				return;
			end;

			local chests = {};
			for _, v in pairs(workspace.ChestModels:GetChildren()) do
				if v.Name:find("Chest") and v:FindFirstChild("RootPart") then
					local dist = (v.RootPart.Position - hrp.Position).Magnitude;
					table.insert(chests, {model = v, dist = dist});
				end;
			end;
			if #chests == 0 then task.wait(0.5); return; end;
			table.sort(chests, function(a, b) return a.dist < b.dist; end);
			for _, entry in ipairs(chests) do
				if not _chestTweenActive then break; end;
				local v = entry.model;
				if not v or not v.Parent or not v:FindFirstChild("RootPart") then continue; end;
				if _isSpecialChestItem() then
					_chestTweenActive = false;
					_G.Settings.Farm["Auto Farm Chest Tween"] = false;
					Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Item especial encontrado!", Icon = "bell", Duration = 6});
					break;
				end;

				local targetCF = v.RootPart.CFrame;
				local beliBefore = _chestTweenLastBeli;
				TweenPlayer(targetCF);

				local tw = 0;
				repeat
					task.wait(0.1); tw = tw + 0.1;
					hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
					if not hrp then break; end;
				until not _chestTweenActive or not v.Parent
					or _chestTweenLastBeli > beliBefore
					or (hrp and (hrp.Position - targetCF.Position).Magnitude < 5)
					or tw > 8;

				if v.Parent and _chestTweenLastBeli <= beliBefore then
					if hrp then hrp.CFrame = targetCF; end;
					task.wait(0.3);
				end;
				_G.ChestHopCount = _G.ChestHopCount + 1;
			end;
			if _G.ChestHopActive and _G.ChestHopCount >= _G.ChestHopLimit then
				_G.ChestHopCount = 0;
				Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Chest Hop: limite atingido, trocando server...", Icon = "bell", Duration = 4});
				task.wait(2);
				local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
				module:Teleport(game.PlaceId);
			end;
		end);
	end;
end);

local _chestBypassActive = false;
AutoFarmChestInstantToggle = OthersTab:AddToggle({
	Title = "Auto Farm Chest Bypass",
	Desc = "Teleporte instantaneo e preciso em cada bau. Aguarda confirmacao de coleta antes do proximo.",
	Value = _G.Settings.Farm["Auto Farm Chest Instant"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Chest Instant"] = state;
		_chestBypassActive = state;
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	while true do
		task.wait(0);
		if not _chestBypassActive then task.wait(0.2); continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			if _isSpecialChestItem() then
				_chestBypassActive = false;
				_G.Settings.Farm["Auto Farm Chest Instant"] = false;
				Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Item especial encontrado! Chest Bypass parado.", Icon = "bell", Duration = 6});
				return;
			end;

			local chests = {};
			for _, v in pairs(workspace.ChestModels:GetChildren()) do
				if v and v.Parent and v.Name:find("Chest") and v:FindFirstChild("RootPart") then
					local dist = (v.RootPart.Position - hrp.Position).Magnitude;
					table.insert(chests, {model = v, dist = dist});
				end;
			end;
			if #chests == 0 then return; end;
			table.sort(chests, function(a, b) return a.dist < b.dist; end);
			local beli_ref = _chestTweenLastBeli;
			for _, entry in ipairs(chests) do
				if not _chestBypassActive then break; end;
				local v = entry.model;
				if not v or not v.Parent or not v:FindFirstChild("RootPart") then continue; end;
				if _isSpecialChestItem() then
					_chestBypassActive = false;
					_G.Settings.Farm["Auto Farm Chest Instant"] = false;
					break;
				end;
				local chestCF = v.RootPart.CFrame;
				local beliBefore = _chestTweenLastBeli;

				hrp.CFrame = chestCF;
				task.wait(0.03);

				local _VIM = game:GetService("VirtualInputManager");
				for _di = 1, 5 do
					pcall(function()
						_VIM:SendKeyEvent(true,  "Q", false, game);
						task.wait(0.02);
						_VIM:SendKeyEvent(false, "Q", false, game);
					end);
					task.wait(0.03);
				end;

				local timeout = 0;
				repeat
					task.wait(0.04); timeout = timeout + 0.04;
				until not _chestBypassActive or not v.Parent or _chestTweenLastBeli > beliBefore or timeout >= 1;

				if v.Parent and _chestTweenLastBeli <= beliBefore then
					hrp.CFrame = chestCF;
					task.wait(0.1);
				end;
				_G.ChestHopCount = _G.ChestHopCount + 1;
			end;
		end);

		if _chestBypassActive then
			local t = 0;
			while _chestBypassActive and t < 7 do task.wait(0.1); t = t + 0.1; end;
		end;
		if _G.ChestHopActive and _G.ChestHopCount >= _G.ChestHopLimit then
			_G.ChestHopCount = 0;
			Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Chest Hop: trocando server...", Icon = "bell", Duration = 4});
			task.wait(2);
			local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
			module:Teleport(game.PlaceId);
		end;
	end;
end);
OthersTab:AddToggle({
	Title = "Chest Hop",
	Desc = "Troca de servidor apos pegar X baus (define quantidade abaixo)",
	Value = false,
	Callback = function(state)
		_G.ChestHopActive = state;
		_G.ChestHopCount = 0;
	end
});
local _chestHopLimitOptions = {20,25,30,35,40,45,50};
OthersTab:AddDropdown({
	Title = "Chest Hop Limit",
	Desc = "Quantos baus pegar antes de trocar de servidor",
	Values = {"20","25","30","35","40","45","50"},
	Value = "20",
	Callback = function(v)
		_G.ChestHopLimit = tonumber(v) or 20;
	end
});
OthersTab:AddParagraph({
	Title = "Baus Coletados",
	Desc = "0"
});
task.spawn(function()
	local para = nil;
	for _, v in pairs(Tabs.OthersTab._elements or {}) do
		if type(v) == "table" and v.Title == "Baus Coletados" then para = v; break; end;
	end;
	while true do
		task.wait(1);
		if para and para.SetDesc then
			pcall(function() para:SetDesc(tostring(_G.ChestHopCount or 0) .. " / " .. tostring(_G.ChestHopLimit or 20)); end);
		end;
	end;
end);
AutoStopItemsToggle = OthersTab:AddToggle({
	Title = "Auto Stop Items",
	Desc = "Stop When Get God's Chalice or FoD",
	Value = _G.Settings.Farm["Auto Stop Items"],
	Callback = function(state)
		_G.Settings.Farm["Auto Stop Items"] = state;
		StopTween(_G.Settings.Farm["Auto Stop Items"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait() do
		pcall(function()
			if _G.Settings.Farm["Auto Stop Items"] then
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("God's Chalice") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("God's Chalice") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
					AutoFarmChestInstantToggle:SetValue(false);
					AutoFarmChestTweenToggle:SetValue(false);
					TweenPlayer((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame);
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Farm["Auto Farm Chest Tween"] then
				for i, v in pairs((game:GetService("Workspace")).ChestModels:GetChildren()) do
					if v.Name:find("Chest") then
						repeat
							wait();
							TweenPlayer(v.RootPart.CFrame);
						until _G.Settings.Farm["Auto Farm Chest Tween"] == false or (not v.Parent);
						TweenPlayer((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame);
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Farm["Auto Farm Chest Instant"] then
				for i, v in pairs((game:GetService("Workspace")).ChestModels:GetChildren()) do
					if v.Name:find("Chest") then
						repeat
							wait();
							if v.Name == "DiamondChest" then
								InstantTp(v.RootPart.CFrame);
							elseif v.Name == "GoldChest" then
								InstantTp(v.RootPart.CFrame);
							elseif v.Name == "SilverChest" then
								InstantTp(v.RootPart.CFrame);
							end;
						until not _G.Settings.Farm["Auto Farm Chest Instant"] or (not v.Parent);
					end;
				end;
			end;
		end);
	end;
end);
CakePrinceSection = OthersTab:AddSection("Cake Prince");
CakePrinceStatusParagraph = OthersTab:AddParagraph({
	Title = "Cake Prince Status",
	Desc = "N/A"
});
spawn(function()
	while task.wait(5) do
		pcall(function()
			if World3 then
				if string.len((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
					CakePrinceStatusParagraph:SetDesc(string.sub((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. " Remaining");
				elseif string.len((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
					CakePrinceStatusParagraph:SetDesc(string.sub((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. " Remaining");
				elseif string.len((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
					CakePrinceStatusParagraph:SetDesc(string.sub((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " Remaining");
				else
					CakePrinceStatusParagraph:SetDesc("Cake Prince Status: Spawned!");
				end;
			else
				CakePrinceStatusParagraph:SetDesc("Sea 3 only");
			end;
		end);
	end;
end);
AutoKatakuriToggle = OthersTab:AddToggle({
	Title = "Auto Katakuri",
	Desc = "Auto Farm + Kill Cake Prince [ Sea 3 Only ]",
	Value = _G.Settings.Farm["Auto Farm Katakuri"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Katakuri"] = state;
		StopTween(_G.Settings.Farm["Auto Farm Katakuri"]);
		(getgenv()).SaveSetting();
	end
});
AutoSpawnCakePrinceToggle = OthersTab:AddToggle({
	Title = "Auto Spawn Cake Prince",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Farm["Auto Spawn Cake Prince"],
	Callback = function(state)
		_G.Settings.Farm["Auto Spawn Cake Prince"] = state;
		StopTween(_G.Settings.Farm["Auto Spawn Cake Prince"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Farm["Auto Spawn Cake Prince"] and World3 then
			wait(2);
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("CakePrinceSpawner", true);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Farm["Auto Farm Katakuri"] and World3 then
			pcall(function()
				if game.ReplicatedStorage:FindFirstChild("Cake Prince") or (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Prince") then
					if (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Prince") then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == "Cake Prince" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									local _kHrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
									if _kHrp and (v.HumanoidRootPart.Position - _kHrp.Position).Magnitude > 5 then
										local _tY = v.HumanoidRootPart.Position.Y + (v.HumanoidRootPart.Size.Y/2) + (_kHrp.Size.Y/2) + 0.2;
										TweenPlayer(CFrame.new(v.HumanoidRootPart.Position.X, _tY, v.HumanoidRootPart.Position.Z));
										repeat task.wait(0.05); until not shouldTween or not _G.Settings.Farm["Auto Farm Katakuri"];
									end;
														_G._farmMobTarget = v;
														repeat
										task.wait(0.15);
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										RemoveAnimation(v);
										Attack();
									until not _G.Settings.Farm["Auto Farm Katakuri"] or (not v.Parent) or v.Humanoid.Health <= 0;
													end;
							end;
						end;
					elseif (game:GetService("Workspace")).Map.CakeLoaf.BigMirror.Other.Transparency == 0 and ((CFrame.new((-1990.672607421875), 4532.99951171875, (-14973.6748046875))).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
						TweenPlayer(CFrame.new(-2151.82153, 149.315704, -12404.9053));
					end;
				elseif (game:GetService("Workspace")).Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace")).Enemies:FindFirstChild("Baking Staff") or (game:GetService("Workspace")).Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								local _kHrp2 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
								if _kHrp2 and (v.HumanoidRootPart.Position - _kHrp2.Position).Magnitude > 5 then
									local _tY2 = v.HumanoidRootPart.Position.Y + (v.HumanoidRootPart.Size.Y/2) + (_kHrp2.Size.Y/2) + 0.2;
									TweenPlayer(CFrame.new(v.HumanoidRootPart.Position.X, _tY2, v.HumanoidRootPart.Position.Z));
									repeat task.wait(0.05); until not shouldTween or not _G.Settings.Farm["Auto Farm Katakuri"];
								end;
												_G._farmMobTarget = v;
												repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until not _G.Settings.Farm["Auto Farm Katakuri"] or (not v.Parent) or v.Humanoid.Health <= 0 or (game:GetService("Workspace")).Map.CakeLoaf.BigMirror.Other.Transparency == 0 or (game:GetService("ReplicatedStorage")):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]");
											end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375));
				end;
			end);
		end;
	end;
end);
AutoKillCakePrinceToggle = OthersTab:AddToggle({
	Title = "Auto Kill Cake Prince",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Farm["Auto Kill Cake Prince"],
	Callback = function(state)
		_G.Settings.Farm["Auto Kill Cake Prince"] = state;
		StopTween(_G.Settings.Farm["Auto Kill Cake Prince"]);
		(getgenv()).SaveSetting();
	end
});
AutoKillDoughKingToggle = OthersTab:AddToggle({
	Title = "Auto Kill Dough King",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Farm["Auto Kill Dough King"],
	Callback = function(state)
		_G.Settings.Farm["Auto Kill Dough King"] = state;
		StopTween(_G.Settings.Farm["Auto Kill Dough King"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Farm["Auto Kill Cake Prince"] and World3 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Prince") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cake Prince" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									RemoveAnimation(v);
									Attack();
									if v.Humanoid:FindFirstChild("Animator") then
										v.Humanoid.Animator:Destroy();
									end;
								until not _G.Settings.Farm["Auto Kill Cake Prince"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Farm["Auto Kill Dough King"] and World3 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Dough King") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Dough King" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									RemoveAnimation(v);
									Attack();
									if v.Humanoid:FindFirstChild("Animator") then
										v.Humanoid.Animator:Destroy();
									end;
								until not _G.Settings.Farm["Auto Kill Dough King"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
MaterialsSection = MainTab:AddSection("Materials");
if World1 then
	MaterialList = {
		"Magma Ore",
		"Angel Wings",
		"Leather",
		"Scrap Metal"
	};
elseif World2 then
	MaterialList = {
		"Radioactive",
		"Mystic Droplet",
		"Magma Ore",
		"Leather",
		"Ectoplasm",
		"Scrap Metal"
	};
elseif World3 then
	MaterialList = {
		"Leather",
		"Scrap Metal",
		"Conjured Cocoa",
		"Dragon Scale",
		"Gunpowder",
		"Fish Tail",
		"Mini Tusk"
	};
end;
function getConfigMaterial(Material)
	if Material == "Radioactive" and World2 then
		MaterialMon = {
			"Factory Staff"
		};
		MaterialPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312);
	elseif Material == "Mystic Droplet" and World2 then
		MaterialMon = {
			"Water Fighter"
		};
		MaterialPos = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875);
	elseif Material == "Magma Ore" and World1 then
		MaterialMon = {
			"Military Spy"
		};
		MaterialPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875);
	elseif Material == "Magma Ore" and World2 then
		MaterialMon = {
			"Lava Pirate"
		};
		MaterialPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375);
	elseif Material == "Angel Wings" and World1 then
		MaterialMon = {
			"Royal Soldier"
		};
		MaterialPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375);
	elseif Material == "Leather" and World1 then
		MaterialMon = {
			"Pirate"
		};
		MaterialPos = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625);
	elseif Material == "Leather" and World2 then
		MaterialMon = {
			"Marine Captain"
		};
		MaterialPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375);
	elseif Material == "Leather" and World3 then
		MaterialMon = {
			"Jungle Pirate"
		};
		MaterialPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375);
	elseif Material == "Ectoplasm" and World2 then
		MaterialMon = {
			"Ship Deckhand",
			"Ship Engineer",
			"Ship Steward",
			"Ship Officer"
		};
		MaterialPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625);
	elseif Material == "Scrap Metal" and World1 then
		MaterialMon = {
			"Brute"
		};
		MaterialPos = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125);
	elseif Material == "Scrap Metal" and World2 then
		MaterialMon = {
			"Mercenary"
		};
		MaterialPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125);
	elseif Material == "Scrap Metal" and World3 then
		MaterialMon = {
			"Pirate Millionaire"
		};
		MaterialPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875);
	elseif Material == "Conjured Cocoa" and World3 then
		MaterialMon = {
			"Chocolate Bar Battler"
		};
		MaterialPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375);
	elseif Material == "Dragon Scale" and World3 then
		MaterialMon = {
			"Dragon Crew Warrior"
		};
		MaterialPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125);
	elseif Material == "Gunpowder" and World3 then
		MaterialMon = {
			"Pistol Billionaire"
		};
		MaterialPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875);
	elseif Material == "Fish Tail" and World3 then
		MaterialMon = {
			"Fishman Captain"
		};
		MaterialPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875);
	elseif Material == "Mini Tusk" and World3 then
		MaterialMon = {
			"Mithological Pirate"
		};
		MaterialPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125);
	end;
end;
MaterialDropdown = MainTab:AddDropdown({
	Title = "Choose Material",
	Values = MaterialList,
	Value = _G.Settings.Farm["Selected Material"],
	Callback = function(option)
		_G.Settings.Farm["Selected Material"] = option;
	end
});
AutoFarmMaterialToggle = MainTab:AddToggle({
	Title = "Auto Farm Material",
	Value = _G.Settings.Farm["Auto Farm Material"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Material"] = state;
		StopTween(_G.Settings.Farm["Auto Farm Material"]);
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	while true do
		task.wait(0.1);
		if not _G.Settings.Farm["Auto Farm Material"] then continue; end;

		local plrMat = game.Players.LocalPlayer;
		local charMat = plrMat.Character;
		local hrpMat = charMat and charMat:FindFirstChild("HumanoidRootPart");
		if not hrpMat then continue; end;

		pcall(function() getConfigMaterial(_G.Settings.Farm["Selected Material"]); end);
		if not MaterialMon or not MaterialPos then continue; end;

		local foundMob = nil;
		for _, mon in pairs(MaterialMon) do
			for _, v in pairs(workspace.Enemies:GetChildren()) do
				if v.Name == mon and v:FindFirstChild("Humanoid")
					and v:FindFirstChild("HumanoidRootPart")
					and v.Humanoid.Health > 0 then
					foundMob = v;
					break;
				end;
			end;
			if foundMob then break; end;
		end;

		if foundMob then

			local vR = foundMob.HumanoidRootPart;
			PosMon = vR.CFrame;
			MonFarm = foundMob.Name;
			EquipWeapon(_G.Settings.Main["Selected Weapon"]);
			AutoHaki();

			local dist = (vR.Position - hrpMat.Position).Magnitude;
			if dist > 5 then
				local tY = vR.Position.Y + (vR.Size.Y/2) + (hrpMat.Size.Y/2) + 0.2;
				TweenPlayer(CFrame.new(vR.Position.X, tY, vR.Position.Z));
				repeat task.wait(0.05);
				until not shouldTween or not _G.Settings.Farm["Auto Farm Material"];
			end;
			if not _G.Settings.Farm["Auto Farm Material"] then continue; end;

			local vHum = foundMob:FindFirstChild("Humanoid");
			if vHum then vHum.WalkSpeed = 0; vHum.JumpPower = 0; end;
						_G._farmMobTarget = v;
						repeat
				task.wait(0.15);
				if not _G.Settings.Farm["Auto Farm Material"] then break; end;
				PosMon = vR.CFrame;
				AutoHaki();
				EquipWeapon(_G.Settings.Main["Selected Weapon"]);
				if vHum then vHum.WalkSpeed = 0; end;
				Attack();
			until not _G.Settings.Farm["Auto Farm Material"]
				or not foundMob.Parent or foundMob.Humanoid.Health <= 0;
					else

			UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
			if _G.Settings.Farm["Selected Material"] == "Ectoplasm" then
				local dist2 = (MaterialPos.Position - hrpMat.Position).Magnitude;
				if dist2 > 18000 then
					pcall(function()
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
					end);
				end;
			end;

			if not shouldTween then
				TweenPlayer(MaterialPos);
				repeat task.wait(0.1);
				until not shouldTween or not _G.Settings.Farm["Auto Farm Material"];
			end;
		end;
	end;
end);
local function ShowResetConfirm()
	pcall(function()
		local plr = game.Players.LocalPlayer;
		local screenGui = Instance.new("ScreenGui");
		screenGui.Name = "EclipseResetConfirm";
		screenGui.ResetOnSpawn = false;
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
		screenGui.Parent = plr.PlayerGui;

		local overlay = Instance.new("Frame");
		overlay.Size = UDim2.new(1,0,1,0);
		overlay.BackgroundColor3 = Color3.fromRGB(0,0,0);
		overlay.BackgroundTransparency = 0.5;
		overlay.BorderSizePixel = 0;
		overlay.ZIndex = 10;
		overlay.Parent = screenGui;

		local box = Instance.new("Frame");
		box.Size = UDim2.new(0,320,0,165);
		box.Position = UDim2.new(1,20,0.5,-82);
		box.BackgroundColor3 = Color3.fromRGB(18,18,24);
		box.BorderSizePixel = 0;
		box.ZIndex = 11;
		box.Parent = screenGui;
		Instance.new("UICorner", box).CornerRadius = UDim.new(0,10);
		local stroke = Instance.new("UIStroke");
		stroke.Color = Color3.fromRGB(80,180,255);
		stroke.Thickness = 1.5;
		stroke.Parent = box;

		local title = Instance.new("TextLabel");
		title.Size = UDim2.new(1,0,0,40);
		title.Position = UDim2.new(0,0,0,0);
		title.BackgroundTransparency = 1;
		title.Text = " Reset Settings";
		title.TextColor3 = Color3.fromRGB(255,255,255);
		title.Font = Enum.Font.GothamBold;
		title.TextSize = 16;
		title.ZIndex = 12;
		title.Parent = box;

		local msg = Instance.new("TextLabel");
		msg.Size = UDim2.new(1,-20,0,40);
		msg.Position = UDim2.new(0,10,0,42);
		msg.BackgroundTransparency = 1;
		msg.Text = "Tem certeza que quer resetar todas as configuracoes";
		msg.TextColor3 = Color3.fromRGB(200,200,200);
		msg.Font = Enum.Font.Gotham;
		msg.TextSize = 13;
		msg.TextWrapped = true;
		msg.ZIndex = 12;
		msg.Parent = box;

		local simBtn = Instance.new("TextButton");
		simBtn.Size = UDim2.new(0,130,0,38);
		simBtn.Position = UDim2.new(0,15,1,-52);
		simBtn.BackgroundColor3 = Color3.fromRGB(220,60,60);
		simBtn.Text = " Sim, Resetar";
		simBtn.TextColor3 = Color3.fromRGB(255,255,255);
		simBtn.Font = Enum.Font.GothamBold;
		simBtn.TextSize = 13;
		simBtn.BorderSizePixel = 0;
		simBtn.ZIndex = 12;
		simBtn.Parent = box;
		Instance.new("UICorner", simBtn).CornerRadius = UDim.new(0,7);

		local naoBtn = Instance.new("TextButton");
		naoBtn.Size = UDim2.new(0,130,0,38);
		naoBtn.Position = UDim2.new(1,-145,1,-52);
		naoBtn.BackgroundColor3 = Color3.fromRGB(40,40,60);
		naoBtn.Text = " Nao";
		naoBtn.TextColor3 = Color3.fromRGB(200,200,200);
		naoBtn.Font = Enum.Font.GothamBold;
		naoBtn.TextSize = 13;
		naoBtn.BorderSizePixel = 0;
		naoBtn.ZIndex = 12;
		naoBtn.Parent = box;
		Instance.new("UICorner", naoBtn).CornerRadius = UDim.new(0,7);

		game:GetService("TweenService"):Create(box,
			TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
			{Position = UDim2.new(1,-340,0.5,-82)}
		):Play();

		local function closeGui()
			game:GetService("TweenService"):Create(box,
				TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{Position = UDim2.new(1,20,0.5,-82)}
			):Play();
			task.wait(0.25);
			screenGui:Destroy();
		end;

		simBtn.MouseButton1Click:Connect(function()
			closeGui();
			pcall(function()
				if writefile and isfile then
					local path = "TR6.1/Blox Fruits/" .. plr.Name .. ".json";
					if isfile(path) then writefile(path, "{}"); end;
				end;
			end);
			Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Settings resetados! Reexecute o script.", Icon = "bell", Duration = 6});
		end);

		naoBtn.MouseButton1Click:Connect(function() closeGui(); end);
	end);
end;

SettingsSection = SettingsTab:AddSection("Settings");

SettingsTab:AddSection(" Super Fast Attack");
SettingsTab:AddToggle({
	Title = "Super Fast Attack",
	Desc = "Ataca mobs proximos em alta velocidade. Ative manualmente para farmar.",
	Value = false,
	Callback = function(state)
		getgenv().SuperFastAttackEnabled = state;
		Library:Notify({
			Title = "Abacaxi Hub - Blox Fruit",
			Content = state and "Super Fast Attack ATIVADO!" or "Super Fast Attack desativado.",
			Icon = state and "zap" or "zap-off",
			Duration = 3
		});
	end
});

SettingsTab:AddSection("Farm Weapon & Skills");

SettingsTab:AddParagraph({
	Title = "Como funciona",
	Desc = "Escolha o tipo de arma abaixo. As skills Z/X/C/V/F serao configuradas automaticamente. Voce pode ajustar as skills individualmente depois."
});

local WeaponList = {"Melee","Sword","Fruit","Gun"};
ChooseWeaponDropdown = SettingsTab:AddDropdown({
	Title = "Tipo de Arma",
	Desc = "Arma usada no farm. Melee = Fighting Style, Sword = Espada, Fruit = Fruta, Gun = Arma de Fogo",
	Values = WeaponList,
	Value = _G.Settings.Main["Select Weapon"] or "Melee",
	Callback = function(option)
		_G.Settings.Main["Select Weapon"] = option;
		_G.ChooseWP = option;

		if option == "Melee" then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = true;
			getgenv().HoldSkillConfig["V"] = false;
			getgenv().HoldSkillConfig["F"] = false;
		elseif option == "Sword" then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = false;
			getgenv().HoldSkillConfig["V"] = false;
			getgenv().HoldSkillConfig["F"] = false;
		elseif option == "Fruit" then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = true;
			getgenv().HoldSkillConfig["V"] = true;
			getgenv().HoldSkillConfig["F"] = true;
		elseif option == "Gun" then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = false;
			getgenv().HoldSkillConfig["V"] = false;
			getgenv().HoldSkillConfig["F"] = false;
		end;
		(getgenv()).SaveSetting();
	end
});

SettingsTab:AddSection("Skills Individuais");

SettingsTab:AddToggle({
	Title = "Skill Z",
	Value = getgenv().HoldSkillConfig and getgenv().HoldSkillConfig["Z"] or true,
	Callback = function(state)
		getgenv().HoldSkillConfig["Z"] = state;
	end
});
SettingsTab:AddToggle({
	Title = "Skill X",
	Value = getgenv().HoldSkillConfig and getgenv().HoldSkillConfig["X"] or true,
	Callback = function(state)
		getgenv().HoldSkillConfig["X"] = state;
	end
});
SettingsTab:AddToggle({
	Title = "Skill C",
	Value = getgenv().HoldSkillConfig and getgenv().HoldSkillConfig["C"] or true,
	Callback = function(state)
		getgenv().HoldSkillConfig["C"] = state;
	end
});
SettingsTab:AddToggle({
	Title = "Skill V",
	Value = getgenv().HoldSkillConfig and getgenv().HoldSkillConfig["V"] or false,
	Callback = function(state)
		getgenv().HoldSkillConfig["V"] = state;
	end
});
SettingsTab:AddToggle({
	Title = "Skill F",
	Value = getgenv().HoldSkillConfig and getgenv().HoldSkillConfig["F"] or false,
	Callback = function(state)
		getgenv().HoldSkillConfig["F"] = state;
	end
});

SettingsTab:AddSlider({
	Title = "Nearest Farm Distance",
	Desc = "Distancia maxima (em studs) para atacar NPCs proximos. Padrao da ilha = 150",
	Min = 20,
	Max = 600,
	Default = _G.NearestFarmRadius or 150,
	Callback = function(value)
		_G.NearestFarmRadius = value;
	end
});
ResetSettingsButton = SettingsTab:AddButton({
	Title = " Reset Settings",
	Desc = "Apaga todas as configuracoes salvas (pede confirmacao)",
	Callback = function()
		ShowResetConfirm();
	end
});

SettingsTab:AddSection(" Speed & Jump Control");
SettingsTab:AddToggle({
	Title = "Custom Walk Speed",
	Desc = "Ativa controle manual de velocidade do player",
	Value = _G.Settings.Setting["Custom Speed Enabled"] or false,
	Callback = function(state)
		_G.Settings.Setting["Custom Speed Enabled"] = state;
		if not state then
			pcall(function()
				local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
				if hum then hum.WalkSpeed = 16; end;
			end);
		end;
		(getgenv()).SaveSetting();
	end
});
SettingsTab:AddSlider({
	Title = "Walk Speed",
	Desc = "Velocidade direta do player. Normal = 16. Maximo = 300",
	Min = 16,
	Max = 300,
	Default = _G.Settings.Setting["Custom Speed Val"] or 16,
	Callback = function(value)
		_G.Settings.Setting["Custom Speed Val"] = value;
		if _G.Settings.Setting["Custom Speed Enabled"] then
			pcall(function()
				local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
				if hum then hum.WalkSpeed = value; end;
			end);
		end;
		(getgenv()).SaveSetting();
	end
});
SettingsTab:AddToggle({
	Title = "Custom Jump Power",
	Desc = "Ativa controle manual de altura de pulo do player",
	Value = _G.Settings.Setting["Custom Jump Enabled"] or false,
	Callback = function(state)
		_G.Settings.Setting["Custom Jump Enabled"] = state;
		if not state then
			pcall(function()
				local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
				if hum then hum.JumpPower = 50; end;
			end);
		end;
		(getgenv()).SaveSetting();
	end
});
SettingsTab:AddSlider({
	Title = "Jump Power %",
	Desc = "100% = pulo normal (50). 500% = 250. Maximo: 1000%",
	Min = 100,
	Max = 1000,
	Default = _G.Settings.Setting["Custom Jump Pct"] or 100,
	Callback = function(value)
		_G.Settings.Setting["Custom Jump Pct"] = value;
		if _G.Settings.Setting["Custom Jump Enabled"] then
			pcall(function()
				local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
				if hum then hum.JumpPower = math.floor(50 * (value / 100)); end;
			end);
		end;
		(getgenv()).SaveSetting();
	end
});

spawn(function()
	while wait(0.5) do
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return; end;
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hum then return; end;
			if _G.Settings.Setting["Custom Speed Enabled"] then
				local target = _G.Settings.Setting["Custom Speed Val"] or 16;
				if hum.WalkSpeed < target then hum.WalkSpeed = target; end;
			end;
			if _G.Settings.Setting["Custom Jump Enabled"] then
				local pct = _G.Settings.Setting["Custom Jump Pct"] or 100;
				hum.JumpPower = math.floor(50 * (pct / 100));
			end;
		end);
	end;
end);

local Marines = function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines");
end;
local Pirates = function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
end;
SpinPositionToggle = SettingsTab:AddToggle({
	Title = "Spin Position",
	Desc = "Spin Position When Farm",
	Value = _G.Settings.Setting["Spin Position"],
	Callback = function(state)
		_G.Settings.Setting["Spin Position"] = state;
		(getgenv()).SaveSetting();
	end
});
FarmDistanceSlider = SettingsTab:AddSlider({
	Title = "Farm Distance",
	Step = 1,
	Value = {
		Min = 10,
		Max = 50,
		Default = _G.Settings.Setting["Farm Distance"] or 35
	},
	Callback = function(value)
		_G.Settings.Setting["Farm Distance"] = value;
	end
});
PlayerTweenSpeedSlider = SettingsTab:AddSlider({
	Title = "Player Tween Speed",
	Step = 1,
	Value = {
		Min = 10,
		Max = 350,
		Default = _G.Settings.Setting["Player Tween Speed"] or 350
	},
	Callback = function(value)
		_G.Settings.Setting["Player Tween Speed"] = value;
	end
});
BringMobToggle = SettingsTab:AddToggle({
	Title = "Bring Mob",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Bring Mob"] = state;
		(getgenv()).SaveSetting();
	end
});

local BringList = {
	"Low",
	"Normal",
	"High"
};
BringMobDropdown = SettingsTab:AddDropdown({
	Title = "Bring Mob",
	Value = _G.Settings.Setting["Bring Mob Mode"],
	Values = BringList,
	Callback = function(option)
		_G.Settings.Setting["Bring Mob Mode"] = option;
	end
});
local AttackList = {
	"Slow",
	"Normal",
	"Fast",
	"Super Fast"
};
FastAttackMethodDropdown = SettingsTab:AddDropdown({
	Title = "Fast Attack Method",
	Value = _G.Settings.Setting["Fast Attack Mode"],
	Values = AttackList,
	Callback = function(option)
		_G.Settings.Setting["Fast Attack Mode"] = option;
	end
});

SettingsTab:AddSection("Fast Attack Modes");
SettingsTab:AddToggle({
	Title = "Auto Fast Attack V1",
	Desc = "Fast Attack normal. Velocidade controlada pelo dropdown acima.",
	Value = _G.Settings.Setting["Fast Attack"] or false,
	Callback = function(state)
		_G.Settings.Setting["Fast Attack"] = state;
		_G.Settings.Setting["Fast Attack V1"] = state;
		if state then
			_G.Settings.Setting["Fast Attack V2"] = false;
			_G.Settings.Setting["Fast Attack V3"] = false;
		end;
		(getgenv()).SaveSetting();
	end
});
SettingsTab:AddToggle({
	Title = "Auto Fast Attack V2 (Koby)",
	Desc = "Fast Attack via VirtualInputManager sem delay de animacao (metodo Koby).",
	Value = _G.Settings.Setting["Fast Attack V2"] or false,
	Callback = function(state)
		_G.Settings.Setting["Fast Attack V2"] = state;
		if state then
			_G.Settings.Setting["Fast Attack"] = false;
			_G.Settings.Setting["Fast Attack V3"] = false;
		end;
		(getgenv()).SaveSetting();
	end
});

SettingsTab:AddToggle({
	Title = "Auto Fast Attack V3 (Seed)",
	Desc = "Fast Attack mais avancado: usa RegisterHit com seed do servidor + cloneref para maior velocidade de hit. Recomendado para Sword/Melee.",
	Value = _G.Settings.Setting["Fast Attack V3"] or false,
	Callback = function(state)
		_G.Settings.Setting["Fast Attack V3"] = state;
		if state then
			_G.Settings.Setting["Fast Attack"] = false;
			_G.Settings.Setting["Fast Attack V2"] = false;
		end;
		(getgenv()).SaveSetting();
	end
});

spawn(function()
	local VIM = game:GetService("VirtualInputManager");
	while true do
		task.wait(0);
		if _G.Settings.Setting["Fast Attack V2"] then
			pcall(function()
				local char = game.Players.LocalPlayer.Character;
				if not char then return; end;
				local hum = char:FindFirstChildOfClass("Humanoid");
				if not hum or hum.Health <= 0 then return; end;
				VIM:SendMouseButtonEvent(851, 400, 0, true,  game, 0);
				task.wait(0.01);
				VIM:SendMouseButtonEvent(851, 400, 0, false, game, 0);
				task.wait(0.03);
			end);
		else
			task.wait(0.05);
		end;
	end;
end);

SettingsTab:AddSection("Fast Attack & Bring Mob - Configuracoes");

_G.Settings.Setting["Fast Attack Range"] = _G.Settings.Setting["Fast Attack Range"] or 60;
SettingsTab:AddSlider({
	Title = "Fast Attack Range",
	Desc = "Distancia maxima (studs) para o Fast Attack detectar e atacar NPCs. V1/V3 usam esse valor.",
	Min = 20,
	Max = 300,
	Default = _G.Settings.Setting["Fast Attack Range"] or 60,
	Callback = function(value)
		_G.Settings.Setting["Fast Attack Range"] = value;

		if _G.AttackModuleRange ~= nil then _G.AttackModuleRange = value; end;
		if getgenv().rz_FastAttack then
			getgenv().rz_FastAttack.Distance = value;
		end;
		(getgenv()).SaveSetting();
	end
});

_G.Settings.Setting["Max Bring Mobs"] = _G.Settings.Setting["Max Bring Mobs"] or 3;
SettingsTab:AddSlider({
	Title = "Max NPCs para Puxar",
	Desc = "Quantidade maxima de NPCs que o Bring Mob puxa de uma vez. Mais NPCs = mais dano por ciclo.",
	Min = 1,
	Max = 20,
	Default = _G.Settings.Setting["Max Bring Mobs"] or 3,
	Callback = function(value)
		_G.Settings.Setting["Max Bring Mobs"] = value;
		_G.MaxBringMobs = value;
		(getgenv()).SaveSetting();
	end
});

_G.Settings.Setting["Bring Mob Range"] = _G.Settings.Setting["Bring Mob Range"] or 235;
SettingsTab:AddSlider({
	Title = "Range do Bring Mob",
	Desc = "Distancia maxima (studs) para buscar NPCs e puxar para perto. Padrao = 235.",
	Min = 50,
	Max = 800,
	Default = _G.Settings.Setting["Bring Mob Range"] or 235,
	Callback = function(value)
		_G.Settings.Setting["Bring Mob Range"] = value;
		_G.BringRange = value;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait() do
		if _G.Settings.Setting["Fast Attack Mode"] == "Slow" then
			_G.Settings.Setting["Fast Attack Delay"] = 0.32;
		elseif _G.Settings.Setting["Fast Attack Mode"] == "Normal" then
			_G.Settings.Setting["Fast Attack Delay"] = 0.22;
		elseif _G.Settings.Setting["Fast Attack Mode"] == "Fast" then
			_G.Settings.Setting["Fast Attack Delay"] = 0.17;
		elseif _G.Settings.Setting["Fast Attack Mode"] == "Super Fast" then
			_G.Settings.Setting["Fast Attack Delay"] = 0.12;
		end;
	end;
end);
spawn(function()
	while wait() do
		if _G.Settings.Setting["Bring Mob"] then
			pcall(function()
				if _G.Settings.Setting["Bring Mob Mode"] == "Low" then
					BringMobDistance = 150;
				elseif _G.Settings.Setting["Bring Mob Mode"] == "Normal" then
					BringMobDistance = 250;
				elseif _G.Settings.Setting["Bring Mob Mode"] == "High" then
					BringMobDistance = 800;
				end;
			end);
		end;
	end;
end);
AttackAuraToggle = SettingsTab:AddToggle({
	Title = "Atatck Aura",
	Desc = "Attack Nearest Enemies",
	Value = _G.Settings.Items["Attack Aura"],
	Callback = function(state)
		_G.Settings.Items["Attack Aura"] = state;
		(getgenv()).SaveSetting();
	end
});

_G.Settings.Setting["Fast M1 Fruit"] = _G.Settings.Setting["Fast M1 Fruit"] or false;
SettingsTab:AddToggle({
	Title = "Fast M1 Fruit",
	Desc = "Spamma click da fruta muito rapido quando Weapon = Fruit e estiver farmando qualquer coisa. No Sea Beast com frutas especiais (Pain, T-Rex, Kitsune, Control, Dragon) usa apenas M1 sem skills.",
	Value = _G.Settings.Setting["Fast M1 Fruit"] or false,
	Callback = function(state)
		_G.Settings.Setting["Fast M1 Fruit"] = state;
		(getgenv()).SaveSetting();
	end
});

local _FastM1FruitList = {"Pain", "T-Rex", "Kitsune", "Control", "Dragon: Eastern Style", "Dragon: Western Style", "Dragon"};

local function _IsSpecialFruitEquipped()
	pcall(function()
		local char = game.Players.LocalPlayer.Character;
		if not char then return false; end;
		local tool = char:FindFirstChildOfClass("Tool");
		if not tool then

			for _, t in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if t.ToolTip == "Blox Fruit" then
					tool = t; break;
				end;
			end;
		end;
		if tool and tool.ToolTip == "Blox Fruit" then
			for _, fruitName in pairs(_FastM1FruitList) do
				if string.find(tool.Name:lower(), fruitName:lower()) then
					return true;
				end;
			end;
		end;
	end);
	return false;
end;

local _VIM_M1 = game:GetService("VirtualInputManager");
spawn(function()
	while true do
		task.wait(0);
		if _G.Settings.Setting["Fast M1 Fruit"]
			and (_G.ChooseWP == "Fruit" or _G.Settings.Main["Select Weapon"] == "Fruit")
			and (_G.EclipseStartFarm or _G.Settings.Main["Auto Farm Mon"] or _G.Settings.Main["Auto Farm Fast"]
				or _G.Settings.Main["Auto Farm All Boss"] or _G.Settings.Main["Auto Farm Boss"]
				or _G.Settings.Main["Auto Farm Fruit Mastery"] or _G.EclipseLevel)
		then
			pcall(function()
				local char = game.Players.LocalPlayer.Character;
				if not char then return; end;
				local hum = char:FindFirstChildOfClass("Humanoid");
				if not hum or hum.Health <= 0 then return; end;

				local hasSB = CheckSeaBeast and CheckSeaBeast();
				if hasSB and _IsSpecialFruitEquipped() then

					_VIM_M1:SendMouseButtonEvent(851, 400, 0, true,  game, 0);
					task.wait(0.008);
					_VIM_M1:SendMouseButtonEvent(851, 400, 0, false, game, 0);
					task.wait(0.025);
					return;
				end;

				_VIM_M1:SendMouseButtonEvent(851, 400, 0, true,  game, 0);
				task.wait(0.008);
				_VIM_M1:SendMouseButtonEvent(851, 400, 0, false, game, 0);
				task.wait(0.025);
			end);
		else
			task.wait(0.05);
		end;
	end;
end);
spawn(function()
	(game:GetService("RunService")).RenderStepped:Connect(function()
		if _G.Settings.Setting["Attack Aura"] and (not _G.Settings.Main["Auto Farm Fruit Mastery"]) and (not _G.Settings.Main["Auto Farm Gun Mastery"]) then
			pcall(function()
				Attack();
			end);
		end;
	end);
end);
GraphicSettingSection = SettingsTab:AddSection("Graphic");
HideNotificationToggle = SettingsTab:AddToggle({
	Title = "Hide Notification",
	Value = _G.Settings.Setting["Hide Notification"],
	Callback = function(state)
		_G.Settings.Setting["Hide Notification"] = state;
		StopTween(_G.Settings.Setting["Hide Notification"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["Hide Notification"] then
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false;
		else
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true;
		end;
	end;
end);
HideDamageTextToggle = SettingsTab:AddToggle({
	Title = "Hide Damage Text",
	Value = _G.Settings.Setting["Hide Damage Text"],
	Callback = function(state)
		_G.Settings.Setting["Hide Damage Text"] = state;
		StopTween(_G.Settings.Setting["Hide Damage Text"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["Hide Damage Text"] then
			(game:GetService("ReplicatedStorage")).Assets.GUI.DamageCounter.Enabled = false;
		else
			(game:GetService("ReplicatedStorage")).Assets.GUI.DamageCounter.Enabled = true;
		end;
	end;
end);
BlackScreenToggle = SettingsTab:AddToggle({
	Title = "Black Screen",
	Value = _G.Settings.Setting["Black Screen"],
	Callback = function(state)
		_G.Settings.Setting["Black Screen"] = state;
		StopTween(_G.Settings.Setting["Black Screen"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["Black Screen"] then
			(game:GetService("Players")).LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500);
		else
			(game:GetService("Players")).LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500);
		end;
	end;
end);
WhiteScreenToggle = SettingsTab:AddToggle({
	Title = "White Screen",
	Value = _G.Settings.Setting["White Screen"],
	Callback = function(state)
		_G.Settings.Setting["White Screen"] = state;
		StopTween(_G.Settings.Setting["White Screen"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["White Screen"] then
			(game:GetService("RunService")):Set3dRenderingEnabled(false);
		else
			(game:GetService("RunService")):Set3dRenderingEnabled(true);
		end;
	end;
end);

SettingsTab:AddSection("Performance");
SettingsTab:AddToggle({
	Title = "Fix Lag",
	Desc = "Reduz lag e stutters sem remover texturas do jogo",
	Value = false,
	Callback = function(state)
		getgenv().FixLagEnabled = state
		if state then
			pcall(function()
				local lighting = game:GetService("Lighting")
				lighting.GlobalShadows = false
				lighting.FogEnd = 9e9
			end)
		else
			pcall(function()
				local lighting = game:GetService("Lighting")
				lighting.GlobalShadows = true

				for _, v in ipairs(workspace:GetDescendants()) do
					if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
						v.Enabled = true
					end
				end
				settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
			end)
		end
	end
});

SettingsTab:AddToggle({
	Title = "FPS Boost",
	Desc = "Remove texturas e efeitos visuais para melhorar FPS e tentar reduzir ping",
	Value = false,
	Callback = function(state)
		_G.FpsBoostEnabled = state
		if state then
			pcall(function()

				for _, v in ipairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Material = Enum.Material.SmoothPlastic
					end
					if v:IsA("Texture") or v:IsA("Decal") then
						v.Transparency = 1
					end
					if v:IsA("SpecialMesh") then
						v.TextureId = ""
					end
					if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
						v.Enabled = false
					end
				end

				settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
				local lighting = game:GetService("Lighting")
				lighting.GlobalShadows = false
				lighting.Brightness = 2
				lighting.FogEnd = 9e9

				game:GetService("ContentProvider"):PreloadAsync({})
			end)
		else
			pcall(function()
				settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
				local lighting = game:GetService("Lighting")
				lighting.GlobalShadows = true
			end)
		end
	end
});
MasterySettingsSection = SettingsTab:AddSection("Mastery Settings");
MasteryHealthSlider = SettingsTab:AddSlider({
	Title = "Mastery Health %",
	Step = 1,
	Value = {
		Min = 1,
		Max = 100,
		Default = _G.Settings.Setting["Mastery Health"] or 25
	},
	Callback = function(value)
		_G.Settings.Setting["Mastery Health"] = value;
	end
});
DevilFruitParagraph = SettingsTab:AddParagraph({
	Title = "Devil Fruit Skill"
});
MasteryFruitSkillZToggle = SettingsTab:AddToggle({
	Title = "Skill Z",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill Z"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillXToggle = SettingsTab:AddToggle({
	Title = "Skill X",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill X"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillCToggle = SettingsTab:AddToggle({
	Title = "Skill C",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill C"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillVToggle = SettingsTab:AddToggle({
	Title = "Skill V",
	Value = _G.Settings.Setting["Fruit Mastery Skill V"],
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill V"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillFToggle = SettingsTab:AddToggle({
	Title = "Skill F",
	Value = _G.Settings.Setting["Fruit Mastery Skill F"],
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill F"] = state;
		(getgenv()).SaveSetting();
	end
});
GunSkillParagraph = SettingsTab:AddParagraph({
	Title = "Gun Skill"
});
MasteryGunSkillZToggle = SettingsTab:AddToggle({
	Title = "Skill Z",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Gun Mastery Skill Z"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryGunSkillXToggle = SettingsTab:AddToggle({
	Title = "Skill X",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Gun Mastery Skill X"] = state;
		(getgenv()).SaveSetting();
	end
});
OthersSettingsSection = SettingsTab:AddSection("Others");
AutoObservationToggle = SettingsTab:AddToggle({
	Title = "Auto Observation",
	Value = _G.Settings.Setting["Auto Observation"],
	Callback = function(state)
		_G.Settings.Setting["Auto Observation"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["Auto Observation"] then
			if not (game:GetService("Players")).LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
				(game:GetService("VirtualUser")):CaptureController();
				(game:GetService("VirtualUser")):SetKeyDown("0x65");
				wait();
				(game:GetService("VirtualUser")):SetKeyUp("0x65");
			end;
		end;
	end;
end);
AutoHakiToggle = SettingsTab:AddToggle({
	Title = "Auto Haki",
	Value = _G.Settings.Setting["Auto Haki"],
	Callback = function(state)
		_G.Settings.Setting["Auto Haki"] = state;
		(getgenv()).SaveSetting();
	end
});
AutoRejoinToggle = SettingsTab:AddToggle({
	Title = "Auto Rejoin",
	Value = _G.Settings.Setting["Auto Rejoin"],
	Callback = function(state)
		_G.Settings.Setting["Auto Rejoin"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["Auto Rejoin"] then
			game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v)
				if v.Name == "ErrorPrompt" and v:FindFirstChild("MessageArea") and v.MessageArea:FindFirstChild("ErrorFrame") then
					(game:GetService("TeleportService")):Teleport(game.PlaceId);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Setting["Auto Haki"] then
			if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("Buso");
			end;
		end;
	end;
end);
GunSwordSection = FarmingHopTab:AddSection(" Sea 1 Items");
GunSwordSection = FarmingHopTab:AddSection("World");
AutoSecondSeaToggle = FarmingHopTab:AddToggle({
	Title = "Auto Second Sea",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Second Sea"],
	Callback = function(state)
		_G.Settings.Items["Auto Second Sea"] = state;
		StopTween(_G.Settings.Items["Auto Second Sea"]);
		(getgenv()).SaveSetting();
	end
});
AutoThirdSeaToggle = FarmingHopTab:AddToggle({
	Title = "Auto Third Sea",
	Desc = "Function Sea 2 Only",
	Value = _G.Settings.Items["Auto Third Sea"],
	Callback = function(state)
		_G.Settings.Items["Auto Third Sea"] = state;
		StopTween(_G.Settings.Items["Auto Third Sea"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Third Sea"] then
			pcall(function()
				if (game:GetService("Players")).LocalPlayer.Data.Level.Value >= 1500 and World2 then
					if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
						TweenPlayer(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016));
						if ((CFrame.new((-1926.3221435547), 12.819851875305, 1738.3092041016)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
							wait(1.5);
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin");
						end;
						wait(1.8);
						if (game:GetService("Workspace")).Enemies:FindFirstChild("rip_indra") then
							for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
								if v.Name == "rip_indra" then
									OldCFrameThird = v.HumanoidRootPart.CFrame;
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										v.HumanoidRootPart.CFrame = OldCFrameThird;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.Humanoid.WalkSpeed = 0;
										Attack();
										(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelZou");
									until _G.Settings.Items["Auto Third Sea"] == false or v.Humanoid.Health <= 0 or (not v.Parent);
								end;
							end;
						elseif not (game:GetService("Workspace")).Enemies:FindFirstChild("rip_indra") and ((CFrame.new((-26880.93359375), 22.848554611206, 473.18951416016)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
							TweenPlayer(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016));
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Second Sea"] and World1 then
			pcall(function()
				local MyLevel = (game:GetService("Players")).LocalPlayer.Data.Level.Value;
				if MyLevel >= 700 and World1 then
					if (game:GetService("Workspace")).Map.Ice.Door.CanCollide == false and (game:GetService("Workspace")).Map.Ice.Door.Transparency == 1 then
						local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877);
						repeat
							TweenPlayer(CFrame1);
							wait();
						until (CFrame1.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Settings.Items["Auto Second Sea"] == false;
						wait(1.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective");
						wait(0.5);
						EquipWeapon("Key");
						_G._farmMobTarget = v;
						repeat
							TweenPlayer(CFrame.new(1347.7124, 37.3751602, -1325.6488));
							wait();
						until (Vector3.new(1347.7124, 37.3751602, (-1325.6488)) - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Settings.Items["Auto Second Sea"] == false;
						wait(0.5);
					elseif (game:GetService("Workspace")).Map.Ice.Door.CanCollide == false and (game:GetService("Workspace")).Map.Ice.Door.Transparency == 1 then
						if (game:GetService("Workspace")).Enemies:FindFirstChild("Ice Admiral") then
							for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
								if v.Name == "Ice Admiral" then
									if not v.Humanoid.Health <= 0 then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											OldCFrameSecond = v.HumanoidRootPart.CFrame;
											_G._farmMobTarget = v;
											repeat
												task.wait(0.15);
												AutoHaki();
												EquipWeapon(_G.Settings.Main["Selected Weapon"]);
												v.Humanoid.WalkSpeed = 0;
												v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
												v.HumanoidRootPart.CFrame = OldCFrameSecond;
												TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
												Attack();
											until not _G.Settings.Items["Auto Second Sea"] or (not v.Parent) or v.Humanoid.Health <= 0;
										end;
									else
										(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelDressrosa");
									end;
								end;
							end;
						elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Ice Admiral") then
							TweenPlayer(((game:GetService("ReplicatedStorage")):FindFirstChild("Ice Admiral")).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7));
						end;
					end;
				end;
			end);
		end;
	end;
end);
GunSwordSection = FarmingHopTab:AddSection("Fighting Style");
AutoSuperHumanToggle = FarmingHopTab:AddToggle({
	Title = "Auto Super Human",
	Value = _G.Settings.Items["Auto Super Human"],
	Callback = function(state)
		_G.Settings.Items["Auto Super Human"] = state;
		StopTween(_G.Settings.Items["Auto Super Human"]);
		(getgenv()).SaveSetting();
	end
});
AutoDeathStepToggle = FarmingHopTab:AddToggle({
	Title = "Auto Death Step",
	Value = _G.Settings.Items["Auto Death Step"],
	Callback = function(state)
		_G.Settings.Items["Auto Death Step"] = state;
		StopTween(_G.Settings.Items["Auto Death Step"]);
		(getgenv()).SaveSetting();
	end
});
AutoSharkmanKarateToggle = FarmingHopTab:AddToggle({
	Title = "Auto Sharkman Karate",
	Value = _G.Settings.Items["Auto Fishman Karate"],
	Callback = function(state)
		_G.Settings.Items["Auto Fishman Karate"] = state;
		StopTween(_G.Settings.Items["Auto Fishman Karate"]);
		(getgenv()).SaveSetting();
	end
});
AutoElectricClawToggle = FarmingHopTab:AddToggle({
	Title = "Auto Electric Claw",
	Value = _G.Settings.Items["Auto Electric Claw"],
	Callback = function(state)
		_G.Settings.Items["Auto Electric Claw"] = state;
		StopTween(_G.Settings.Items["Auto Electric Claw"]);
		(getgenv()).SaveSetting();
	end
});
AutoDragonTalonToggle = FarmingHopTab:AddToggle({
	Title = "Auto Dragon Talon",
	Value = _G.Settings.Items["Auto Dragon Talon"],
	Callback = function(state)
		_G.Settings.Items["Auto Dragon Talon"] = state;
		StopTween(_G.Settings.Items["Auto Dragon Talon"]);
		(getgenv()).SaveSetting();
	end
});
AutoGodHumanToggle = FarmingHopTab:AddToggle({
	Title = "Auto God Human",
	Value = _G.Settings.Items["Auto God Human"],
	Callback = function(state)
		_G.Settings.Items["Auto God Human"] = state;
		StopTween(_G.Settings.Items["Auto God Human"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while task.wait(0.2) do
		if _G.Settings.Items["Auto God Human"] then
			pcall(function()
				if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Superhuman") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Superhuman") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Black Leg") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Black Leg") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Death Step") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Death Step") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Fishman Karate") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Sharkman Karate") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electric Claw") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electric Claw") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Claw") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Talon") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Godhuman") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Godhuman") then
					if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then
						if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Superhuman") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Superhuman")).Level.Value >= 400 or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Superhuman") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Superhuman")).Level.Value >= 400 then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDeathStep");
						end;
					else
						Library:Notify({
							Title = "Notification",
							Content = "Not Have Superhuman",
							Icon = "bell",
							Duration = 5
						});
					end;
					if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1 then
						if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Death Step") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Death Step")).Level.Value >= 400 or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Death Step") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Death Step")).Level.Value >= 400 then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate");
						end;
					else
						Library:Notify({
							Title = "Notification",
							Content = "Not Have Death Step",
							Icon = "bell",
							Duration = 5
						});
					end;
					if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1 then
						if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Sharkman Karate")).Level.Value >= 400 or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Sharkman Karate") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Sharkman Karate")).Level.Value >= 400 then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw");
						end;
					else
						Library:Notify({
							Title = "Notification",
							Content = "Not Have Sharkman Karate",
							Icon = "bell",
							Duration = 5
						});
					end;
					if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1 then
						if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electric Claw") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electric Claw")).Level.Value >= 400 or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electric Claw") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electric Claw")).Level.Value >= 400 then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDragonTalon");
						end;
					else
						Library:Notify({
							Title = "Notification",
							Content = "Not Have Electric Claw",
							Icon = "bell",
							Duration = 5
						});
					end;
					if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
						if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Talon")).Level.Value >= 400 or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Talon") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Talon")).Level.Value >= 400 then
							if string.find((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyGodhuman", true), "Bring") then
								Library:Notify({
									Title = "Notification",
									Content = "Not Have Enough Material",
									Icon = "bell",
									Duration = 5
								});
							else
								(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyGodhuman");
							end;
						end;
					else
						Library:Notify({
							Title = "Notification",
							Content = "Not Have Dragon Talon",
							Icon = "bell",
							Duration = 5
						});
					end;
				else
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySuperhuman");
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Dragon Talon"] then
			if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Claw") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Talon") then
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value >= 400 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDragonTalon");
					_G.Settings.Main["Selected Weapon"] = "Dragon Talon";
				end;
				if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Claw") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Dragon Claw")).Level.Value >= 400 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDragonTalon");
					_G.Settings.Main["Selected Weapon"] = "Dragon Talon";
				end;
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value <= 399 then
					_G.Settings.Main["Selected Weapon"] = "Dragon Claw";
				end;
			else
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
			end;
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Items["Auto Fishman Karate"] then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyFishmanKarate");
				if string.find((game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
					if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Water Key") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Water Key") then
						TweenPlayer(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365));
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate");
					elseif (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Fishman Karate") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Fishman Karate")).Level.Value >= 400 then
					else
						Ms = "Tide Keeper";
						if (game:GetService("Workspace")).Enemies:FindFirstChild(Ms) then
							for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
								if v.Name == Ms then
									OldCFrameShark = v.HumanoidRootPart.CFrame;
									_G._farmMobTarget = v;
									repeat
										task.wait(0.15);
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.CFrame = OldCFrameShark;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
										Attack();
									until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.Items["Auto Fishman Karate"] == false or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Water Key") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Water Key");
								end;
							end;
						else
							TweenPlayer(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -0.000000013857326, 0.885206044, 0.0000000040332897, 1, 0.0000000135347511, -0.885206044, -0.00000000272606271, 0.465199202));
							wait(3);
						end;
					end;
				else
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate");
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Items["Auto Electric Claw"] then
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electric Claw") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electric Claw") then
					if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value >= 400 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw");
						_G.Settings.Main["Selected Weapon"] = "Electric Claw";
					end;
					if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro")).Level.Value >= 400 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw");
						_G.Settings.Main["Selected Weapon"] = "Electric Claw";
					end;
					if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value <= 399 then
						_G.Settings.Main["Selected Weapon"] = "Electro";
					end;
				else
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectro");
				end;
			end;
			if _G.Settings.Items["Auto Electric Claw"] then
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro") then
					if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value >= 400 or ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Electro")).Level.Value >= 400 then
						if _G.Settings.Main["Auto Farm"] == false then
							repeat
								task.wait(0.15);
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.Settings.Items["Auto Electric Claw"] or ((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
							wait(2);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438));
							until not _G.Settings.Items["Auto Electric Claw"] or ((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new((-12550.532226563), 336.22631835938, (-7510.4233398438))).Position).Magnitude <= 10;
							wait(1);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.Settings.Items["Auto Electric Claw"] or ((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							wait(1);
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw");
						elseif _G.Settings.Main["Auto Farm"] == true then
							_G.Settings.Main["Auto Farm"] = false;
							wait(1);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.Settings.Items["Auto Electric Claw"] or ((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
							wait(2);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438));
							until not _G.Settings.Items["Auto Electric Claw"] or ((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new((-12550.532226563), 336.22631835938, (-7510.4233398438))).Position).Magnitude <= 10;
							wait(1);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.Settings.Items["Auto Electric Claw"] or ((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							wait(1);
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw");
							_G.Settings.Main["Selected Weapon"] = "Electric Claw";
							wait(0.1);
							_G.Settings.Main["Auto Farm"] = true;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Death Step"] then
			if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Black Leg") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Black Leg") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Death Step") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Death Step") then
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Black Leg") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value >= 450 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDeathStep");
					_G.Settings.Main["Selected Weapon"] = "Death Step";
				end;
				if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Black Leg") and ((game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Black Leg")).Level.Value >= 450 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDeathStep");
					_G.Settings.Main["Selected Weapon"] = "Death Step";
				end;
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Black Leg") and ((game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value <= 449 then
					_G.Settings.Main["Selected Weapon"] = "Black Leg";
				end;
			else
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBlackLeg");
			end;
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Items["Auto Super Human"] then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 150000 then
					UnEquipWeapon("Combat");
					wait(0.1);
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBlackLeg");
				end;
				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
					_G.Settings.Main["Selected Weapon"] = "Superhuman";
				end;
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value <= 299 then
						_G.Settings.Main["Selected Weapon"] = "Black Leg";
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value <= 299 then
						_G.Settings.Main["Selected Weapon"] = "Electro";
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate")).Level.Value <= 299 then
						_G.Settings.Main["Selected Weapon"] = "Fishman Karate";
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value <= 299 then
						_G.Settings.Main["Selected Weapon"] = "Dragon Claw";
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value >= 300 and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 300000 then
						UnEquipWeapon("Black Leg");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectro");
					end;
					if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg")).Level.Value >= 300 and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 300000 then
						UnEquipWeapon("Black Leg");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectro");
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value >= 300 and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 750000 then
						UnEquipWeapon("Electro");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyFishmanKarate");
					end;
					if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and (game.Players.LocalPlayer.Character:FindFirstChild("Electro")).Level.Value >= 300 and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 750000 then
						UnEquipWeapon("Electro");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyFishmanKarate");
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate")).Level.Value >= 300 and (game:GetService("Players")).Localplayer.Data.Fragments.Value >= 1500 then
						UnEquipWeapon("Fishman Karate");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
					end;
					if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate")).Level.Value >= 300 and (game:GetService("Players")).Localplayer.Data.Fragments.Value >= 1500 then
						UnEquipWeapon("Fishman Karate");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
					end;
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value >= 300 and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 3000000 then
						UnEquipWeapon("Dragon Claw");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySuperhuman");
					end;
					if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw")).Level.Value >= 300 and (game:GetService("Players")).LocalPlayer.Data.Beli.Value >= 3000000 then
						UnEquipWeapon("Dragon Claw");
						wait(0.1);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySuperhuman");
					end;
				end;
			end;
		end;
	end);
end);
GunSwordSection = FarmingHopTab:AddSection("Gun & Sword");
AutoGetSaberToggle = FarmingHopTab:AddToggle({
	Title = "Auto Get Saber",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Saber"],
	Callback = function(state)
		_G.Settings.Items["Auto Saber"] = state;
		StopTween(_G.Settings.Items["Auto Saber"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while task.wait(0.2) do
		if _G.Settings.Items["Auto Saber"] and World1 and game.Players.LocalPlayer.Data.Level.Value >= 200 then
			pcall(function()
				if (game:GetService("Workspace")).Map.Jungle.Final.Part.Transparency == 0 then
					if (game:GetService("Workspace")).Map.Jungle.QuestPlates.Door.Transparency == 0 then
						if ((CFrame.new((-1612.55884), 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, (-0.928667724), 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, (-0.0000000439869794), 0.37091279)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
							TweenPlayer((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame);
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map.Jungle.QuestPlates.Plate1.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map.Jungle.QuestPlates.Plate2.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map.Jungle.QuestPlates.Plate3.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map.Jungle.QuestPlates.Plate4.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace")).Map.Jungle.QuestPlates.Plate5.Button.CFrame;
							wait(1);
						else
							TweenPlayer(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, -0.928667724, 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, -0.0000000439869794, 0.37091279));
						end;
					elseif (game:GetService("Workspace")).Map.Desert.Burn.Part.Transparency == 0 then
						if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
							EquipWeapon("Torch");
							TweenPlayer(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -0.00000000128799094, 0.761243105, -0.000000000570652914, 1, 0.00000000120584542, -0.761243105, 0.000000000347544882, -0.648466587));
						else
							TweenPlayer(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.0000342372805, -0.258850515, 0.965917408));
						end;
					elseif (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup");
						wait(0.5);
						EquipWeapon("Cup");
						wait(0.5);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", (game:GetService("Players")).LocalPlayer.Character.Cup);
						wait(0);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan");
					elseif (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
					elseif (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
						if (game:GetService("Workspace")).Enemies:FindFirstChild("Mob Leader") or (game:GetService("ReplicatedStorage")):FindFirstChild("Mob Leader") then
							TweenPlayer(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559));
							for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
								if v.Name == "Mob Leader" then
									if (game:GetService("Workspace")).Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											_G._farmMobTarget = v;
											repeat
												task.wait(0.15);
												AutoHaki();
												EquipWeapon(_G.Settings.Main["Selected Weapon"]);
												v.Humanoid.WalkSpeed = 0;
												v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
												TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
												Attack();
											until v.Humanoid.Health <= 0 or (not _G.Settings.Items["Auto Saber"]);
										end;
									end;
									if (game:GetService("ReplicatedStorage")):FindFirstChild("Mob Leader") then
										TweenPlayer(((game:GetService("ReplicatedStorage")):FindFirstChild("Mob Leader")).HumanoidRootPart.CFrame * Pos);
									end;
								end;
							end;
						end;
					elseif (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
						wait(0.5);
						EquipWeapon("Relic");
						wait(0.5);
						TweenPlayer(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 0.00000000566906877, 0.481375456, 0.0000000253851997, 1, -0.0000000579995607, -0.481375456, 0.0000000630572643, 0.876514494));
					end;
				elseif (game:GetService("Workspace")).Enemies:FindFirstChild("Saber Expert") or (game:GetService("ReplicatedStorage")):FindFirstChild("Saber Expert") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							if v.Name == "Saber Expert" then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until v.Humanoid.Health <= 0 or (not _G.Settings.Items["Auto Saber"]);
								if v.Humanoid.Health <= 0 then
									(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic");
								end;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
AutoBuddySwordToggle = FarmingHopTab:AddToggle({
	Title = "Auto Buddy Sword",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Buddy Sword"],
	Callback = function(state)
		_G.Settings.Items["Auto Buddy Sword"] = state;
		StopTween(_G.Settings.Items["Auto Buddy Sword"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Buddy Sword"] and World3 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Cake Queen") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cake Queen" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Items["Auto Buddy Sword"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875));
				end;
			end);
		end;
	end;
end);
function CheckItemCount(itemName, itemCount)
	for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
		if v.Name == itemName and v.Count >= itemCount then
			return true;
		end;
	end;
	return false;
end;
function DetectChest()
	local dist = math.huge;
	local name;
	for k, v in pairs(game.Workspace:GetChildren()) do
		if string.match(v.Name, "Chest") then
			local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude;
			if magnitude < dist then
				dist = magnitude;
				name = v;
			end;
		end;
	end;
	if not name then
		for i, v in next, (game:GetService("Workspace")).Map:GetDescendants() do
			if v:IsA("Part") and string.find(v.Name, "Chest") then
				local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude;
				if magnitude < dist then
					dist = magnitude;
					name = v;
				end;
			end;
		end;
	end;
	return name;
end;
local MobBlacklist = {};
function DetectPartSpawnMob(name)
	local name1;
	if string.find(name, "Lv.") then
		name1 = name:gsub(" %pLv. %d+%p", "");
	end;
	for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.EnemySpawns:GetChildren()) do
		local stringgsub;
		if string.find(v.Name, "Lv.") then
			stringgsub = v.Name:gsub(" %pLv. %d+%p", "");
		end;
		if v:IsA("Part") and (stringgsub and stringgsub == name or name == v.Name or name1 and v.Name == name1) then
			return v;
		end;
	end;
	for i, v in pairs(getnilinstances()) do
		local stringgsub;
		if string.find(v.Name, "Lv.") then
			stringgsub = v.Name:gsub(" %pLv. %d+%p", "");
		end;
		if v:IsA("Part") and (stringgsub and stringgsub == name or name == v.Name or name1 and v.Name == name1) then
			return v;
		end;
	end;
end;
function TeleportSpawnMob(Path, value)
	if typeof(Path) == "table" then
		if #MobBlacklist >= 4 then
			MobBlacklist = {};
			return;
		end;
		local GetPart;
		for i, v in next, Path do
			if not table.find(MobBlacklist, v) then
				GetPart = DetectPartSpawnMob(v);
				repeat
					task.wait();
					TweenPlayer(GetPart.CFrame * CFrame.new(0, 60, 0));
				until (GetPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(Path) or (not value);
			end;
		end;
	else
		GetPart = DetectPartSpawnMob(Path);
		TweenPlayer(GetPart.CFrame * CFrame.new(0, 60, 0));
	end;
end;
function DetectMob(c)
	local dist = math.huge;
	local name;
	for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
		local stringgsub = v.Name:gsub(" %pLv. %d+%p", "");
		if (typeof(c) == "table" and (table.find(c, v.Name) or table.find(c, stringgsub)) or (v.Name == c or c == stringgsub)) and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
			local magnitude = (v.HumanoidRootPart.Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).magnitude;
			if magnitude < dist then
				dist = magnitude;
				name = v;
			end;
		end;
	end;
	return name;
end;
function DetectRequestSoulGuitar()
	local Mob = {};
	local PlaceId;
	local NameRemote;
	if not CheckItemCount("Ectoplasm", 250) then
		Mob = {
			"Ship Deckhand [Lv. 1250]",
			"Ship Steward [Lv. 1300]",
			"Ship Officer [Lv. 1325]",
			"Ship Engineer [Lv. 1275]"
		};
		PlaceId = 4442272183;
		NameRemote = "TravelDressrosa";
	elseif not CheckItemCount("Bones", 500) then
		Mob = {
			"Reborn Skeleton [Lv. 1975]",
			"Demonic Soul [Lv. 2025]",
			"Living Zombie [Lv. 2000]",
			"Posessed Mummy [Lv. 2050]"
		};
		PlaceId = 7449423635;
		NameRemote = "TravelZou";
	end;
	return Mob, PlaceId, NameRemote;
end;
local CommF = (game:GetService("ReplicatedStorage")).Remotes.CommF_;
function GuitarPuzzleProgress()
	if not CommF:InvokeServer("GuitarPuzzleProgress", "Check") then
		if game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and (game.Lighting.ClockTime > 16 or game.Lighting.ClockTime < 5) then
			if (game:GetService("Players")).LocalPlayer:DistanceFromCharacter(Vector3.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) > 50 then
				TweenPlayer(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125));
			end;
			CommF:InvokeServer("gravestoneEvent", 2);
			CommF:InvokeServer("gravestoneEvent", 2, true);
			task.wait(1);
		else
			Library:Notify({
				Title = "Notification",
				Content = "Hop Full Moon",
				Icon = "bell",
				Duration = 5
			});
			Hop();
		end;
	else
		if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Dialogue.Visible then
			game.VirtualUser:Button1Down(Vector2.new(0, 0));
			game.VirtualUser:Button1Down(Vector2.new(0, 0));
		end;
		if not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Swamp then
			if ((CFrame.new((-10171.7607421875), 138.62667846679688, 6008.0654296875)).Position - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
				toTarget((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position, (CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).Position, CFrame.new(-10171.7607421875, 138.62667846679688 + 20, 6008.0654296875));
			elseif CountZombie() == 6 then
				for i, v in pairs(game.workspace.Enemies:GetChildren()) do
					if v.Name == "Living Zombie [Lv. 2000]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						repeat
							task.wait();
							EquipWeapon(_G.Settings.Main["Selected Weapon"]);
							AutoHaki();
							v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
							PosMon = v.HumanoidRootPart.CFrame;
							MonFarm = v.Name;
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							Attack();
						until v.Humanoid.Health <= 0 or (not v.Parent);
					end;
				end;
			end;
			return;
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Gravestones then
			if (game:GetService("Players")).LocalPlayer:DistanceFromCharacter(Vector3.new(-8761.4765625, 142.10487365722656, 6086.07861328125)) > 50 then
				TweenPlayer(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125));
			else
				local ClickSigns = {
					game.workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector,
					game.workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector,
					game.workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector,
					game.workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector,
					game.workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector,
					game.workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector,
					game.workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector
				};
				for i, v in pairs(ClickSigns) do
					fireclickdetector(v);
				end;
			end;
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Ghost then
			if (game:GetService("Players")).LocalPlayer:DistanceFromCharacter(Vector3.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)) > 50 then
				TweenPlayer(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375));
			end;
			CommF:InvokeServer("GuitarPuzzleProgress", "Ghost");
			task.wait(3);
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Trophies then
			if (game:GetService("Players")).LocalPlayer:DistanceFromCharacter(Vector3.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 50 then
				TweenPlayer(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375));
			end;
			local Tablet = game.workspace.Map["Haunted Castle"].Tablet;
			for i, v in pairs(BlankTablets) do
				local x = Tablet[v];
				if x.Line.Position.X ~= 0 then
					repeat
						task.wait();
						fireclickdetector(x.ClickDetector);
					until x.Line.Position.X == 0;
				end;
			end;
			for i, v in pairs(Trophy) do
				local x = game.workspace.Map["Haunted Castle"].Trophies.Quest[v].Handle.CFrame;
				x = tostring(x);
				x = (x:split(", "))[4];
				local c = "180";
				if x == "1" or x == "-1" then
					c = "90";
				end;
				if not string.find(tostring(Tablet[i].Line.Rotation.Z), c) then
					repeat
						task.wait();
						fireclickdetector(Tablet[i].ClickDetector);
					until string.find(tostring(Tablet[i].Line.Rotation.Z), c);
					print(i, c);
				end;
			end;
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Pipes then
			for i, v in pairs(Pipes) do
				local x = game.workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[i];
				if x.BrickColor.Name ~= v then
					repeat
						task.wait();
						fireclickdetector(x.ClickDetector);
					until x.BrickColor.Name == v;
				end;
			end;
		end;
	end;
end;
function AutoSoulGuitar()
	if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("soulGuitarBuy", true) == "[You already own this item.]" then
		Library:Notify({
			Title = "Notification",
			Content = "You already own this item",
			Icon = "bell",
			Duration = 5
		});
		task.wait(5);
		return;
	end;
	if game.Players.LocalPlayer.Data.Fragments.Value < 5000 then
		task.wait(2);
		Library:Notify({
			Title = "Notification",
			Content = "Need 5000 Fragments",
			Icon = "bell",
			Duration = 5
		});
		return;
	end;
	if not CheckItemCount("Ectoplasm", 250) then
		task.wait(2);
		Library:Notify({
			Title = "Notification",
			Content = "Need 250 Ectoplasm",
			Icon = "bell",
			Duration = 5
		});
		return;
	end;
	if CheckItemCount("Dark Fragment", 1) and CheckItemCount("Ectoplasm", 250) and CheckItemCount("Bones", 500) then
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("soulGuitarBuy", true);
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("soulGuitarBuy");
		if World3 then
			GuitarPuzzleProgress();
		else
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelZou");
		end;
		return;
	end;
	if not CheckItemCount("Dark Fragment", 1) then
		if World2 then
			if CheckNameBoss("Darkbeard [Lv. 1000] [Raid Boss]") then
				local v = CheckNameBoss("Darkbeard [Lv. 1000] [Raid Boss]");
				_G._farmMobTarget = v;
				repeat
					task.wait();
					AutoHaki();
					EquipWeapon(_G.Settings.Main["Selected Weapon"]);
					v.Humanoid.WalkSpeed = 0;
					v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
					TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
					Attack();
				until v.Humanoid.Health <= 0 or (not v.Parent);
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
				if ((game:GetService("Workspace")).Map.DarkbeardArena.Summoner.Detection.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
					EquipWeapon("Fist of Darkness");
					firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, (game:GetService("Workspace")).Map.DarkbeardArena.Summoner.Detection, 0);
					firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, (game:GetService("Workspace")).Map.DarkbeardArena.Summoner.Detection, 1);
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, (game:GetService("Workspace")).Map.DarkbeardArena.Summoner.Detection, 0);
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, (game:GetService("Workspace")).Map.DarkbeardArena.Summoner.Detection, 1);
				else
					TweenPlayer((game:GetService("Workspace")).Map.DarkbeardArena.Summoner.Detection.CFrame);
				end;
			else
				local v = DetectChest();
				repeat
					task.wait();
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 2 then
						firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0);
						firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1);
					end;
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 5 then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "W", false, game);
						task.wait();
						(game:service("VirtualInputManager")):SendKeyEvent(false, "W", false, game);
					end;
					InstantTp(v.CFrame * CFrame.new(0, 1, 0));
				until not v or (not v.Parent) or (not _G.Settings.Items["Auto Soul Guitar"]);
			end;
		else
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelDressrosa");
		end;
	else
		local Mob, PlaceId, NameRemote = DetectRequestSoulGuitar();
		if game.PlaceId == PlaceId then
			if not DetectMob(Mob) then
				TeleportSpawnMob(Mob, _G.Settings.Items["Auto Soul Guitar"]);
			else
				local v = DetectMob(Mob);
				repeat
					task.wait();
					EquipWeapon(_G.Settings.Main["Selected Weapon"]);
					AutoHaki();
					v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
					PosMon = v.HumanoidRootPart.CFrame;
					MonFarm = v.Name;
					TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
					Attack();
				until not v or (not v.Parent) or v.Humanoid.Health == 0 or (not _G.Settings.Items["Auto Soul Guitar"]);
			end;
		else
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(NameRemote);
		end;
	end;
end;
AutoSoulGuitarToggle = FarmingHopTab:AddToggle({
	Title = "Auto Soul Guitar",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Soul Guitar"],
	Callback = function(state)
		_G.Settings.Items["Auto Soul Guitar"] = state;
		StopTween(_G.Settings.Items["Auto Soul Guitar"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Items["Auto Soul Guitar"] then
				AutoSoulGuitar();
			end;
		end);
	end;
end);
AutoRengokuToggle = FarmingHopTab:AddToggle({
	Title = "Auto Rengoku",
	Desc = "Function Sea 2 Only",
	Value = _G.Settings.Items["Auto Rengoku"],
	Callback = function(state)
		_G.Settings.Items["Auto Rengoku"] = state;
		StopTween(_G.Settings.Items["Auto Rengoku"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Items["Auto Rengoku"] and World2 then
				if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Hidden Key") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Hidden Key") then
					EquipWeapon("Hidden Key");
					TweenPlayer(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875));
				elseif (game:GetService("Workspace")).Enemies:FindFirstChild("Snow Lurker") or (game:GetService("Workspace")).Enemies:FindFirstChild("Arctic Warrior") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then
							repeat
								task.wait(0.15);
								EquipWeapon(_G.Settings.Main["Selected Weapon"]);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								Attack();
							until (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.Settings.Items["Auto Rengoku"] == false or (not v.Parent) or v.Humanoid.Health <= 0;
						end;
					end;
				else
					TweenPlayer(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188));
				end;
			end;
		end;
	end);
end);
AutoHallowScytheToggle = FarmingHopTab:AddToggle({
	Title = "Auto Hallow Scythe",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Hallow Scythe"],
	Callback = function(state)
		_G.Settings.Items["Auto Hallow Scythe"] = state;
		StopTween(_G.Settings.Items["Auto Hallow Scythe"]);
		(getgenv()).SaveSetting();
	end
});
AutoWardenSwordToggle = FarmingHopTab:AddToggle({
	Title = "Auto Warden Sword",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Warden Sword"],
	Callback = function(state)
		_G.Settings.Items["Auto Warden Sword"] = state;
		StopTween(_G.Settings.Items["Auto Warden Sword"]);
		(getgenv()).SaveSetting();
	end
});
FarmingHopTab:AddSection(" CDK / Yama / Tushita");

_G._CDK_Active = false;
_G._CDK_YM_Active = false;

FarmingHopTab:AddToggle({
	Title = "Auto CDK [Last Quest - Boss]",
	Desc = "Auto CDK: progride a quest e derrota o Cursed Skeleton Boss. Sea 3.",
	Value = false,
	Callback = function(state)
		_G._CDK_Active = state;
		if _G.Settings and _G.Settings.Items then _G.Settings.Items["Auto CDK"] = state; (getgenv()).SaveSetting(); end;
	end
});
spawn(function()
	while wait(0.3) do
		pcall(function()
			if _G._CDK_Active then
				local replicated = game:GetService("ReplicatedStorage");
				replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
				replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
				replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Boss");
				local plr = game.Players.LocalPlayer;
				local v = GetConnectionEnemies("Cursed Skeleton Boss");
				if v then
					repeat wait();
						if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then EquipWeapon("Yama");
						elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then EquipWeapon("Tushita"); end;
						TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0));
						Attack();
					until not _G._CDK_Active or not v.Parent or v.Humanoid.Health <= 0;
				else
					plr.Character.HumanoidRootPart.CFrame = CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375);
					task.wait(0.5);
					local bossDoor = workspace.Map:FindFirstChild("Turtle") and workspace.Map.Turtle:FindFirstChild("Cursed") and workspace.Map.Turtle.Cursed:FindFirstChild("BossDoor");
					if bossDoor then
						plr.Character.HumanoidRootPart.CFrame = bossDoor.CFrame;
					end;
				end;
			end;
		end);
	end;
end);

FarmingHopTab:AddToggle({
	Title = "Auto Yama CDK",
	Desc = "Auto completa todas as etapas da quest Yama para CDK. Sea 3.",
	Value = false,
	Callback = function(state)
		_G._CDK_YM_Active = state;
		if _G.Settings and _G.Settings.Items then _G.Settings.Items["Auto Yama CDK"] = state; (getgenv()).SaveSetting(); end;
	end
});
spawn(function()
	while wait(0.3) do
		pcall(function()
			if _G._CDK_YM_Active then
				local replicated = game:GetService("ReplicatedStorage");
				local plr = game.Players.LocalPlayer;
				local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
				if not root then return; end;
				if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor");
					replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true);
				else
					local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress");
					if progress and progress["Finished"] == nil then
						replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
					elseif progress and progress["Finished"] == false then
						local evilProg = tonumber(progress["Evil"]);
						if evilProg == -3 then
							if not workspace.Enemies:FindFirstChild("Forest Pirate") then
								root.CFrame = CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375);
							else
								local v = GetConnectionEnemies("Forest Pirate");
								if v then root.CFrame = v.HumanoidRootPart.CFrame; Attack(); end;
							end;
						elseif evilProg == -4 then
							for _, v in pairs(workspace.Enemies:GetChildren()) do
								if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HazeESP") then
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								end;
							end;
						elseif evilProg == -5 then
							local hell = workspace.Map:FindFirstChild("HellDimension");
							if hell then
								for _, pp in pairs(hell:GetDescendants()) do
									if pp:IsA("ProximityPrompt") then fireproximityprompt(pp); end;
								end;
								for _, v in pairs(workspace.Enemies:GetChildren()) do
									if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - hell.Spawn.Position).Magnitude <= 300 and v.Humanoid.Health > 0 then
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
									end;
								end;
							else
								local sr = GetConnectionEnemies("Soul Reaper");
								if sr then
									root.CFrame = sr.HumanoidRootPart.CFrame;
									Attack();
								end;
							end;
						end;
					end;
				end;
			end;
		end);
	end;
end);

AutoGetYamaToggle = FarmingHopTab:AddToggle({
	Title = "Auto Get Yama",
	Desc = "Need 30 Elite Hunter, Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Yama"],
	Callback = function(state)
		_G.Settings.Items["Auto Yama"] = state;
		StopTween(_G.Settings.Items["Auto Yama"]);
		(getgenv()).SaveSetting();
	end
});
AutoGetYamaHopToggle = FarmingHopTab:AddToggle({
	Title = "Auto Get Yama Hop",
	Desc = "Hop If Elite Hunter Not Spawn",
	Value = _G.Settings.Items["Auto Yama Hop"],
	Callback = function(state)
		_G.Settings.Items["Auto Yama Hop"] = state;
		StopTween(_G.Settings.Items["Auto Yama Hop"]);
		(getgenv()).SaveSetting();
	end
});
AutoGetTushitaToggle = FarmingHopTab:AddToggle({
	Title = "Auto Get Tushita",
	Value = _G.Settings.Items["Auto Tushita"],
	Callback = function(state)
		_G.Settings.Items["Auto Tushita"] = state;
		StopTween(_G.Settings.Items["Auto Tushita"]);
		(getgenv()).SaveSetting();
	end
});
AutoDragonTridentToggle = FarmingHopTab:AddToggle({
	Title = "Auto Dragon Trident",
	Desc = "Function Sea 2 Only",
	Value = _G.Settings.Items["Auto Dragon Trident"],
	Callback = function(state)
		_G.Settings.Items["Auto Dragon Trident"] = state;
		StopTween(_G.Settings.Items["Auto Dragon Trident"]);
		(getgenv()).SaveSetting();
	end
});
AutoDragonTridentToggle = FarmingHopTab:AddToggle({
	Title = "Auto Greybeard",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Greybeard"],
	Callback = function(state)
		_G.Settings.Items["Auto Greybeard"] = state;
		StopTween(_G.Settings.Items["Auto Greybeard"]);
		(getgenv()).SaveSetting();
	end
});
AutoSharkSawToggle = FarmingHopTab:AddToggle({
	Title = "Auto Shark Saw",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Shark Saw"],
	Callback = function(state)
		_G.Settings.Items["Auto Shark Saw"] = state;
		StopTween(_G.Settings.Items["Auto Shark Saw"]);
		(getgenv()).SaveSetting();
	end
});
AutoPoleToggle = FarmingHopTab:AddToggle({
	Title = "Auto Pole",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Pole"],
	Callback = function(state)
		_G.Settings.Items["Auto Pole"] = state;
		StopTween(_G.Settings.Items["Auto Pole"]);
		(getgenv()).SaveSetting();
	end
});
AutoDarkDaggerToggle = FarmingHopTab:AddToggle({
	Title = "Auto Dark Dagger",
	Desc = "Need Spawn Rip Indra, Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Dark Dagger"],
	Callback = function(state)
		_G.Settings.Items["Auto Dark Dagger"] = state;
		StopTween(_G.Settings.Items["Auto Dark Dagger"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Items["Auto Dark Dagger"] and World3 then
				if (game:GetService("Workspace")).Enemies:FindFirstChild("rip_indra True Form") or (game:GetService("Workspace")).Enemies:FindFirstChild("rip_indra") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							repeat
								task.wait(0.15);
								AutoHaki();
								EquipWeapon(_G.Settings.Main["Selected Weapon"]);
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								Attack();
							until _G.Settings.Items["Auto Dark Dagger"] == false or v.Humanoid.Health <= 0;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781));
				end;
			end;
		end;
	end);
end);
_G._autoPadHakiActive = false;
_G._spawnRipIndraActive = false;
_G._autoKillRipIndraActive = false;
local _ripIndraHakiList = {"Legendary Haki (Pink)", "Legendary Haki (White)", "Legendary Haki (Red)"};
local _ripIndraHakiIndex = 1;
local _padHakiCF = CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016);
local _ripIndraTombCF = CFrame.new(-26965, 22.8, 495);

FarmingHopTab:AddToggle({
	Title = "Auto Pad Haki [Sea 3]",
	Desc = "Equipa Hakis lendarios (Rosa/Branco/Vermelho) e ativa os Pads no castelo. Troca a cada 7s.",
	Value = _G.Settings.Items["Auto Pad Haki"],
	Callback = function(state)
		_G.Settings.Items["Auto Pad Haki"] = state;
		_G._autoPadHakiActive = state;
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	local hakiTimer = 0;
	while true do
		task.wait(0.5);
		if _G._autoPadHakiActive and World3 then
			pcall(function()
				local plr = game.Players.LocalPlayer;
				local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
				if not hrp then return; end;
				hakiTimer = hakiTimer + 0.5;
				if hakiTimer >= 7 then
					hakiTimer = 0;
					_ripIndraHakiIndex = (_ripIndraHakiIndex % #_ripIndraHakiList) + 1;
				end;
				local hakiName = _ripIndraHakiList[_ripIndraHakiIndex];
				local inv = plr:FindFirstChild("Inventory") or plr:FindFirstChild("StarterGear");
				if inv then
					for _, item in pairs(inv:GetChildren()) do
						if item.Name:find("Haki") and item.Name:find(_ripIndraHakiList[_ripIndraHakiIndex]:match("%((.-)%)") or "") then
							pcall(function() item:Activate(); end);
						end;
					end;
				end;
				local distToPad = (_padHakiCF.Position - hrp.Position).Magnitude;
				if distToPad > 50 then
					TweenPlayer(_padHakiCF);
					task.wait(2);
				end;
				local padArea = workspace:FindFirstChild("_Padrao") or workspace:FindFirstChild("MarinePad") or workspace:FindFirstChild("HakiPad");
				if padArea then
					for _, pad in pairs(padArea:GetChildren()) do
						if pad:FindFirstChild("Touched") then
							pcall(function()
								hrp.CFrame = pad.CFrame;
								task.wait(0.1);
							end);
						end;
					end;
				end;
				local fireRemotes = {};
				local function findPadRemotes(parent)
					for _, v in pairs(parent:GetChildren()) do
						if v:IsA("RemoteEvent") and (v.Name:lower():find("haki") or v.Name:lower():find("pad")) then
							table.insert(fireRemotes, v);
						end;
						if #v:GetChildren() > 0 then findPadRemotes(v); end;
					end;
				end;
				pcall(function() findPadRemotes(game:GetService("ReplicatedStorage")); end);
				for _, rem in pairs(fireRemotes) do
					pcall(function() rem:FireServer(hakiName); end);
				end;
			end);
		end;
	end;
end);

FarmingHopTab:AddToggle({
	Title = "Spawn Rip Indra [Sea 3]",
	Desc = "Leva automaticamente o God Chalice ate a lapide para spawnar Rip Indra.",
	Value = _G.Settings.Items["Spawn Rip Indra"],
	Callback = function(state)
		_G.Settings.Items["Spawn Rip Indra"] = state;
		_G._spawnRipIndraActive = state;
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	while true do
		task.wait(1);
		if _G._spawnRipIndraActive and World3 then
			pcall(function()
				local plr = game.Players.LocalPlayer;
				local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
				if not hrp then return; end;
				if workspace.Enemies:FindFirstChild("rip_indra") or workspace.Enemies:FindFirstChild("rip_indra True Form") then return; end;
				local chalice = nil;
				for _, v in pairs(workspace:GetDescendants()) do
					if v.Name:lower():find("god") and v.Name:lower():find("chal") then chalice = v; break; end;
				end;
				if not chalice then
					local backpack = plr:FindFirstChild("Backpack");
					if backpack then
						for _, v in pairs(backpack:GetChildren()) do
							if v.Name:lower():find("god") and v.Name:lower():find("chal") then
								pcall(function() v:Activate(); end);
							end;
						end;
					end;
					return;
				end;
				TweenPlayer(_ripIndraTombCF);
				task.wait(2);
				if (_ripIndraTombCF.Position - hrp.Position).Magnitude < 30 then
					local rems = {};
					local function findTombRemotes(parent)
						for _, v in pairs(parent:GetChildren()) do
							if v:IsA("RemoteEvent") and (v.Name:lower():find("spawn") or v.Name:lower():find("tomb") or v.Name:lower():find("indra")) then
								table.insert(rems, v);
							end;
							if #v:GetChildren() > 0 then findTombRemotes(v); end;
						end;
					end;
					pcall(function() findTombRemotes(game:GetService("ReplicatedStorage")); end);
					for _, rem in pairs(rems) do
						pcall(function() rem:FireServer(); end);
					end;
				end;
			end);
		end;
	end;
end);

FarmingHopTab:AddToggle({
	Title = "Auto Kill Rip Indra [Sea 3]",
	Desc = "Mata automaticamente Rip Indra quando spawnar no Sea 3.",
	Value = _G.Settings.Items["Auto Kill Rip Indra"],
	Callback = function(state)
		_G.Settings.Items["Auto Kill Rip Indra"] = state;
		_G._autoKillRipIndraActive = state;
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	while true do
		task.wait(0.3);
		if _G._autoKillRipIndraActive and World3 then
			pcall(function()
				local boss = workspace.Enemies:FindFirstChild("rip_indra") or workspace.Enemies:FindFirstChild("rip_indra True Form");
				if boss and boss:FindFirstChild("Humanoid") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
					local plr = game.Players.LocalPlayer;
					local char = plr.Character;
					if not char then return; end;
					local hrp = char:FindFirstChild("HumanoidRootPart");
					local hum = char:FindFirstChild("Humanoid");
					if not hrp or not hum then return; end;
					AutoHaki();
					EquipWeapon(_G.Settings.Main["Selected Weapon"]);
					boss.HumanoidRootPart.Size = Vector3.new(1,1,1);
					local bossPos = boss.HumanoidRootPart.CFrame;
					local offsets = {
						CFrame.new(6,0,0), CFrame.new(-6,0,0),
						CFrame.new(0,0,6), CFrame.new(0,0,-6)
					};
					local dodgeIdx = math.random(1, #offsets);
					TweenPlayer(bossPos * offsets[dodgeIdx]);
					if hum.Health <= 2000 then
						TweenPlayer(CFrame.new(-26700, 22.8, 473));
						repeat task.wait(0.5); until (not _G._autoKillRipIndraActive) or (hum and hum.Health >= 5000) or not boss.Parent;
						if not _G._autoKillRipIndraActive then return; end;
						TweenPlayer(bossPos);
					end;
					Attack();
				end;
			end);
		end;
	end;
end);

spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Pole"] and World1 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Thunder God") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Thunder God" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Items["Auto Pole"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Shark Saw"] and World1 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("The Saw") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "The Saw" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Items["Auto Shark Saw"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Greybeard"] and World1 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Greybeard") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Greybeard" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Items["Auto Greybeard"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Dragon Trident"] and World2 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Tide Keeper") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Tide Keeper" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Items["Auto Dragon Trident"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125));
				end;
			end);
		end;
	end;
end);
function CheckTorch()
	local a;
	if not (game:GetService("Workspace")).Map.Turtle.QuestTorches.Torch1.Particles.Main.Enabled then
		a = "1";
	elseif not (game:GetService("Workspace")).Map.Turtle.QuestTorches.Torch2.Particles.Main.Enabled then
		a = "2";
	elseif not (game:GetService("Workspace")).Map.Turtle.QuestTorches.Torch3.Particles.Main.Enabled then
		a = "3";
	elseif not (game:GetService("Workspace")).Map.Turtle.QuestTorches.Torch4.Particles.Main.Enabled then
		a = "4";
	elseif not (game:GetService("Workspace")).Map.Turtle.QuestTorches.Torch5.Particles.Main.Enabled then
		a = "5";
	end;
	for i, v in next, (game:GetService("Workspace")).Map.Turtle.QuestTorches:GetChildren() do
		if v:IsA("MeshPart") and string.find(v.Name, a) and (not v.Particles.Main.Enabled) then
			return v;
		end;
	end;
end;
function CheckNameBoss(a)
	for i, v in next, game.ReplicatedStorage:GetChildren() do
		if v:IsA("Model") and (typeof(a) == "table" and table.find(a, v.Name) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			return v;
		end;
	end;
	for i, v in next, game.Workspace.Enemies:GetChildren() do
		if v:IsA("Model") and (typeof(a) == "table" and table.find(a, v.Name) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			return v;
		end;
	end;
end;
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Tushita"] and World3 then
			pcall(function()
				if not (game:GetService("Workspace")).Map.Turtle:FindFirstChild("TushitaGate") then
					if CheckNameBoss("Longma [Lv. 2000] [Boss]") then
						local v = CheckNameBoss("Longma [Lv. 2000] [Boss]");
						_G._farmMobTarget = v;
						repeat
							task.wait();
							AutoHaki();
							EquipWeapon(_G.Settings.Main["Selected Weapon"]);
							v.Humanoid.WalkSpeed = 0;
							v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							Attack();
						until not v or (not v.Parent) or v.Humanoid.Health == 0;
					end;
				elseif CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
					if not game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch")) then
						TweenPlayer((game:GetService("Workspace")).Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame);
					else
						EquipWeapon("Holy Torch");
						if CheckTorch() then
							TweenPlayer((CheckTorch()).CFrame);
						end;
					end;
				else
					Library:Notify({
						Title = "Notification",
						Content = "Rip Indra Not Spawn",
						Icon = "bell",
						Duration = 5
					});
					task.wait(3);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Yama Hop"] and World3 then
			pcall(function()
				if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
					if _G.Settings.Items["Auto Yama"] then
						if not (game:GetService("Workspace")).Enemies:FindFirstChild("Diablo") or (not (game:GetService("Workspace")).Enemies:FindFirstChild("Deandre")) or (not (game:GetService("Workspace")).Enemies:FindFirstChild("Urban")) then
							Hop();
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Yama"] and World3 then
			if (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
				_G._farmMobTarget = v;
				repeat
					wait(0.1);
					fireclickdetector((game:GetService("Workspace")).Map.Waterfall.SealedKatana.Handle.ClickDetector);
				until (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Yama") or (not _G.Settings.Items["Auto Yama"]);
			elseif string.find(QuestTitle, "Diablo") or string.find(QuestTitle, "Deandre") or string.find(QuestTitle, "Urban") then
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace")).Enemies:FindFirstChild("Deandre") or (game:GetService("Workspace")).Enemies:FindFirstChild("Urban") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until _G.Settings.Farm["Auto Yama"] == false or v.Humanoid.Health <= 0 or (not v.Parent);
							end;
						end;
					end;
				end;
			else
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("EliteHunter");
			end;
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Warden Sword"] and World1 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Chief Warden") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Chief Warden" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.Items["Auto Warden Sword"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					TweenPlayer(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Hallow Scythe"] then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Soul Reaper") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if string.find(v.Name, "Soul Reaper") then
							repeat
								task.wait(0.15);
								EquipWeapon(_G.Settings.Main["Selected Weapon"]);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								Attack();
								v.HumanoidRootPart.Transparency = 1;
							until v.Humanoid.Health <= 0 or _G.Settings.Items["Auto Hallow Scythe"] == false;
						end;
					end;
				elseif (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Hallow Essence") then
					repeat
						TweenPlayer(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125));
						wait();
					until ((CFrame.new((-8932.322265625), 146.83154296875, 6062.55078125)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8;
					EquipWeapon("Hallow Essence");
				elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Soul Reaper") then
					TweenPlayer(((game:GetService("ReplicatedStorage")):FindFirstChild("Soul Reaper")).HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
				end;
			end);
		end;
	end;
end);
StatsSection = StatsTab:AddSection("Stats");
StatsPointParagraph = StatsTab:AddParagraph({
	Title = "Stats",
	Desc = "0"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			StatsPointParagraph:SetDesc(tostring((game:GetService("Players")).LocalPlayer.Data.Points.Value));
		end);
	end;
end);
AutoAddMeleeStats = StatsTab:AddToggle({
	Title = "Add Melee Stats",
	Value = _G.Settings.Stats["Auto Add Melee Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Melee Stats"] = state;
	end
});
AutoAddDefenseStats = StatsTab:AddToggle({
	Title = "Add Defense Stats",
	Value = _G.Settings.Stats["Auto Add Defense Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Defense Stats"] = state;
	end
});
AutoAddSwordStats = StatsTab:AddToggle({
	Title = "Add Sword Stats",
	Value = _G.Settings.Stats["Auto Add Sword Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Sword Stats"] = state;
	end
});
AutoAddGunStats = StatsTab:AddToggle({
	Title = "Add Gun Stats",
	Value = _G.Settings.Stats["Auto Add Gun Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Gun Stats"] = state;
	end
});
AutoAddDevilFruitStats = StatsTab:AddToggle({
	Title = "Add Devil Fruit Stats",
	Value = _G.Settings.Stats["Auto Add Devil Fruit Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Devil Fruit Stats"] = state;
	end
});
PointStats = 1;
StatsPointToAddSlider = StatsTab:AddSlider({
	Title = "Point",
	Step = 1,
	Value = {
		Min = 1,
		Max = 100,
		Default = PointStats
	},
	Callback = function(value)
		PointStats = value;
	end
});
spawn(function()
	while wait(0.2) do
		if game.Players.localPlayer.Data.Points.Value >= PointStats then
			if _G.Settings.Stats["Auto Add Melee Stats"] then
				local args = {
					[1] = "AddPoint",
					[2] = "Melee",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if _G.Settings.Stats["Auto Add Defense Stats"] then
				local args = {
					[1] = "AddPoint",
					[2] = "Defense",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if _G.Settings.Stats["Auto Add Sword Stats"] then
				local args = {
					[1] = "AddPoint",
					[2] = "Sword",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if _G.Settings.Stats["Auto Add Gun Stats"] then
				local args = {
					[1] = "AddPoint",
					[2] = "Gun",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if _G.Settings.Stats["Auto Add Devil Fruit Stats"] then
				local args = {
					[1] = "AddPoint",
					[2] = "Demon Fruit",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
		end;
	end;
end);
RaidSection = RaidTab:AddSection("Raid");

local function RaidGetBP(itemName)
	return game.Players.LocalPlayer.Backpack:FindFirstChild(itemName)
		or (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(itemName));
end;

local RaidStatusParagraph = RaidTab:AddParagraph({
	Title = "Raid Status",
	Desc = "Desligado"
});

spawn(function()
	while wait(0.5) do
		pcall(function()
			local raidActive = game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible;
			if _G.Settings.Raid["Auto Raid"] then
				if raidActive then
					RaidStatusParagraph:SetDesc(" Raid em progresso! Matando inimigos...");
				else
					if RaidGetBP("Special Microchip") then
						RaidStatusParagraph:SetDesc(" Microchip pronto. Iniciando raid...");
					else
						RaidStatusParagraph:SetDesc(" Comprando Microchip...");
					end;
				end;
			else
				RaidStatusParagraph:SetDesc(" Desligado");
			end;
		end);
	end;
end);

ChooseChipRaidDropdown = RaidTab:AddDropdown({
	Title = "Choose Chip (Fruta para Microchip)",
	Desc = "Seleciona qual fruta trocar pelo Microchip",
	Values = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"},
	Value = _G.Settings.Raid["Selected Chip"] or "Flame",
	Callback = function(option)
		_G.Settings.Raid["Selected Chip"] = option;
		_G.SelectChip = option;
		(getgenv()).SaveSetting();
	end
});

AutoRaidToggle = RaidTab:AddToggle({
	Title = " Auto Raid (Start + Complete)",
	Desc = "Inicia a raid quando o chip esta na mochila e mata todos os inimigos nas ilhas. Nao compra chip.",
	Value = _G.Settings.Raid["Auto Raid"],
	Callback = function(state)
		_G.Settings.Raid["Auto Raid"] = state;
		_G.Raiding = state;
		StopTween(_G.Settings.Raid["Auto Raid"]);
		(getgenv()).SaveSetting();
	end
});

spawn(function()
	while true do
		task.wait(5);
		if _G.Settings.Raid["Auto Raid"] then
			pcall(function()
				if game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
					if RaidGetBP("Special Microchip") then
						if World2 then
							TweenPlayer(CFrame.new(-6438.73535, 250.645355, -4501.50684));
							wait(1);
							fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
						elseif World3 then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164,316.447021,-3142.66602));
							task.wait(0.5);
							TweenPlayer(CFrame.new(-5033.50879,315.014252,-2947.77539));
							wait(0.5);
							fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
						end;
					else
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.Settings.Raid["Selected Chip"] or "Flame");
					end;
				end;
			end);
		end;
	end;
end);

local function IsIslandRaid(cu)
	local locs = workspace._WorldOrigin.Locations;
	local minDist, closest = 4500, nil;
	for _, v in ipairs(locs:GetChildren()) do
		if v.Name == "Island "..cu then
			local d = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
			if d < minDist then minDist = d; closest = v; end;
		end;
	end;
	return closest;
end;

spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Raid["Auto Raid"] and (World2 or World3) then
				if game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
					for _, mob in pairs(workspace.Enemies:GetChildren()) do
						if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
							local dist = (mob.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
							if dist <= 800 then
								repeat
									pcall(function()
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(mob.HumanoidRootPart.CFrame * Pos);
										AutoHaki();
										Attack();
									end);
									task.wait();
								until not _G.Settings.Raid["Auto Raid"] or not mob.Parent or mob.Humanoid.Health <= 0;
							end;
						end;
					end;
					for _, id in ipairs({5,4,3,2,1}) do
						local island = IsIslandRaid(id);
						if island then
							TweenPlayer(island.CFrame * CFrame.new(0,50,0));
							NextIs = true;
							break;
						end;
					end;
				end;
			end;
		end;
	end);
end);

_G.AutoBuyChip = false;
AutoBuyChipToggle = RaidTab:AddToggle({
	Title = " Auto Buy Chip",
	Desc = "Troca uma fruta que JA esta na mochila pelo Microchip. Nao desarmazena frutas do estoque. Compra apenas 1 chip por vez.",
	Value = false,
	Callback = function(state)
		_G.AutoBuyChip = state;
		(getgenv()).SaveSetting();
	end
});

spawn(function()
	while true do
		task.wait(4);
		if _G.AutoBuyChip then
			pcall(function()
				if RaidGetBP("Special Microchip") then return; end;

				local _, raidActive = pcall(function()
					return game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible;
				end);
				if raidActive then return; end;
				local plr = game.Players.LocalPlayer;
				for _, tool in ipairs(plr.Backpack:GetChildren()) do
					if tool:IsA("Tool") and (tool.ToolTip == "Fruit" or tool:GetAttribute("Type") == "Fruit") then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.Settings.Raid["Selected Chip"] or "Flame");
						break;
					end;
				end;
			end);
		end;
	end;
end);

AutoAwakeningToggle = RaidTab:AddToggle({
	Title = "Auto Awaken",
	Desc = "Desperta a fruta automaticamente durante o raid",
	Value = _G.Settings.Raid["Auto Awaken"],
	Callback = function(state)
		_G.Settings.Raid["Auto Awaken"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Raid["Auto Awaken"] then
			pcall(function()
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("Awakener","Awaken");
			end);
		end;
	end;
end);

PriceDevilFruitToUnstoreSlider = RaidTab:AddSlider({
	Title = "Price (Auto Unstore Fruit)",
	Value = {Min = 1, Max = 10000000, Default = _G.Settings.Raid["Price Devil Fruit"] or 1000000},
	Callback = function(value)
		_G.Settings.Raid["Price Devil Fruit"] = value;
		(getgenv()).SaveSetting();
	end
});
AutoUnstoreDevilFruitToggle = RaidTab:AddToggle({
	Title = "Auto Unstore Fruit (< 1M)",
	Desc = "Tira do estoque frutas abaixo do preco definido (padrao: menos de 1.000.000). Use junto com Auto Buy Chip.",
	Value = _G.Settings.Raid["Unstore Devil Fruit"],
	Callback = function(state)
		_G.Settings.Raid["Unstore Devil Fruit"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Raid["Unstore Devil Fruit"] then
				local fruit = (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("getInventoryFruits");
				for _, v in pairs(fruit) do
					if v.Price < (_G.Settings.Raid["Price Devil Fruit"] or 1000000) then
						if not game.Players.LocalPlayer.Backpack:FindFirstChildMatching(".*Fruit.*") then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("LoadFruit", v.Name);
						end;
					end;
				end;
			end;
		end);
	end;
end);

TeleportToLabButton = RaidTab:AddButton({
	Title = "Teleport To Lab",
	Desc = "Vai para o summon da Raid",
	Callback = function()
		if World2 then TweenPlayer(CFrame.new(-6438.73535,250.645355,-4501.50684));
		elseif World3 then TweenPlayer(CFrame.new(-5033.50879,315.014252,-2947.77539));
		end;
	end
});

LawRaidSection = RaidTab:AddSection("Law Raid");
AutoLawRaidToggle = RaidTab:AddToggle({
	Title = "Auto Law Raid",
	Value = _G.Settings.Raid["Law Raid"],
	Callback = function(state)
		_G.Settings.Raid["Law Raid"] = value;
		StopTween(_G.Settings.Raid["Law Raid"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Raid["Law Raid"] then
				if not (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Microchip") and (not (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Microchip")) and (not (game:GetService("Workspace")).Enemies:FindFirstChild("Order")) and (not (game:GetService("ReplicatedStorage")):FindFirstChild("Order")) then
					wait(0.3);
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1");
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2");
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Raid["Law Raid"] then
				if not (game:GetService("Workspace")).Enemies:FindFirstChild("Order") and (not (game:GetService("ReplicatedStorage")):FindFirstChild("Order")) then
					if (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("Microchip") or (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Microchip") then
						fireclickdetector((game:GetService("Workspace")).Map.CircleIsland.RaidSummon.Button.Main.ClickDetector);
					end;
				end;
				if (game:GetService("ReplicatedStorage")):FindFirstChild("Order") or (game:GetService("Workspace")).Enemies:FindFirstChild("Order") then
					if (game:GetService("Workspace")).Enemies:FindFirstChild("Order") then
						for h, i in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if i.Name == "Order" then
								repeat
									task.wait(0.15);
									Attack();
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									TweenPlayer(i.HumanoidRootPart.CFrame * Pos);
									i.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									Attack();
								until not i.Parent or i.Humanoid.Health <= 0 or _G.Settings.Raid["Law Raid"] == false;
							end;
						end;
					elseif (game:GetService("ReplicatedStorage")):FindFirstChild("Order") then
						TweenPlayer(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875));
					end;
				end;
			end;
		end;
	end);
end);
RaceTabSection = RaceTab:AddSection("Race");
local PlaceV4List = {
	"Top Of GreatTree",
	"Timple Of Time",
	"Lever Pull",
	"Acient One"
};
SelectedPlaceDropdown = RaceTab:AddDropdown({
	Title = "Selected Place",
	Values = PlaceV4List,
	Value = _G.Settings.Race["Selected Place"],
	Callback = function(value)
		_G.Settings.Race["Selected Place"] = value;
		(getgenv()).SaveSetting();
	end
});
TeleportToPlaceToggle = RaceTab:AddToggle({
	Title = "Teleport To Place",
	Value = _G.Settings.Race["Teleport To Place"],
	Callback = function(state)
		_G.Settings.Race["Teleport To Place"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Race["Teleport To Place"] then
			pcall(function()
				if _G.Settings.Race["Selected Place"] == "Top Of GreatTree" then
					TweenPlayer(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625));
				elseif _G.Settings.Race["Selected Place"] == "Timple Of Time" then
					(game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
				elseif _G.Settings.Race["Selected Place"] == "Lever Pull" then
					local LeverPullPos = CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734);
					if (LeverPullPos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1000 then
						(game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
					else
						TweenPlayer(LeverPullPos);
					end;
				elseif _G.Settings.Race["Selected Place"] == "Acient One" then
					TweenPlayer(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375));
				end;
			end);
		end;
	end;
end);
AutoBuyGearToggle = RaceTab:AddToggle({
	Title = "Auto Buy Gear",
	Value = _G.Settings.Race["Auto Buy Gear"],
	Callback = function(state)
		_G.Settings.Race["Auto Buy Gear"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Auto Buy Gear"] then
				local args = {
					[1] = true
				};
				local args = {
					[1] = "UpgradeRace",
					[2] = "Buy"
				};
				(((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer(unpack(args));
			end;
		end;
	end);
end);
TweenToMirageIslandToggle = RaceTab:AddToggle({
	Title = "Tween To Mirage Island",
	Desc = "Tween to highest point",
	Value = _G.Settings.Race["Tween To Highest Mirage"],
	Callback = function(state)
		_G.Settings.Race["Tween To Highest Mirage"] = state;
		(getgenv()).SaveSetting();
	end
});
LookMoonAbilityToggle = RaceTab:AddToggle({
	Title = "Look Moon & use Ability",
	Value = _G.Settings.Race["Look Moon Ability"],
	Callback = function(state)
		_G.Settings.Race["Look Moon Ability"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Race["Look Moon Ability"] then
				wait();
				local moonDir = game.Lighting:GetMoonDirection();
				local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100;
				game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos);
			end;
		end);
	end;
end);
AutoTrainToggle = RaceTab:AddToggle({
	Title = "Auto Train",
	Value = _G.Settings.Race["Auto Train"],
	Callback = function(state)
		_G.Settings.Race["Auto Train"] = state;
		StopTween(_G.Settings.Race["Auto Train"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Auto Train"] then
				if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
					StartFarmTrain = false;
					TweenPlayer(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875));
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait(0.2) do
		if StartFarmTrain and World3 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Cocoa Warrior") or (game:GetService("Workspace")).Enemies:FindFirstChild("Chocolate Bar Battler") or (game:GetService("Workspace")).Enemies:FindFirstChild("Sweet Thief") or (game:GetService("Workspace")).Enemies:FindFirstChild("Candy Rebel") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not StartFarmTrain or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					TweenPlayer(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875));
				end;
			end);
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Auto Train"] then
				if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
					StartFarmTrain = true;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Race["Auto Train"] then
				if tonumber(((game:GetService("Players")).LocalPlayer.Character:WaitForChild("RaceEnergy")).Value) == 1 then
					if (game:GetService("Players")).LocalPlayer.Character.RaceTransformed.Value == false then
						(game:GetService("VirtualInputManager")):SendKeyEvent(true, "Y", false, game);
						wait(0.1);
						(game:GetService("VirtualInputManager")):SendKeyEvent(false, "Y", false, game);
					end;
				end;
			end;
		end);
	end;
end);
TeleportToRaceDoorButton = RaceTab:AddButton({
	Title = "Teleport To Race Door",
	Callback = function()
		(game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.1);
		(game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.1);
		(game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.1);
		(game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.5);
		if (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Human" then
			TweenPlayer(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375));
		elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Skypiea" then
			TweenPlayer(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375));
		elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Fishman" then
			TweenPlayer(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156));
		elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Cyborg" then
			TweenPlayer(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156));
		elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Ghoul" then
			TweenPlayer(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156));
		elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Mink" then
			TweenPlayer(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094));
		end;
	end
});
BuyAcientQuestButton = RaceTab:AddButton({
	Title = "Buy Acient Quest",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("UpgradeRace", "Buy");
	end
});

getgenv().SuperFastAttackEnabled = false;

task.spawn(function()
	local RS   = game:GetService("ReplicatedStorage")
	local lp   = game:GetService("Players").LocalPlayer

	local ok, NetMod = pcall(function() return RS.Modules.Net end)
	if not ok or not NetMod then return end
	local Net = require(NetMod)

	local attackRemote = RS.Modules.Net:FindFirstChild("RE/RegisterAttack")
	local hitRemote    = RS.Modules.Net:FindFirstChild("RE/RegisterHit")
	if not attackRemote or not hitRemote then return end

	local remote2, idremote2
	local function hookRemotes(folder)
		for _, n in ipairs(folder:GetChildren()) do
			if n:IsA("RemoteEvent") and n:GetAttribute("Id") then
				remote2, idremote2 = n, n:GetAttribute("Id")
			end
		end
		folder.ChildAdded:Connect(function(n)
			if n:IsA("RemoteEvent") and n:GetAttribute("Id") then
				remote2, idremote2 = n, n:GetAttribute("Id")
			end
		end)
	end
	for _, folder in ipairs({RS:FindFirstChild("Util"), RS:FindFirstChild("Common"),
							 RS:FindFirstChild("Remotes"), RS:FindFirstChild("Assets"), RS:FindFirstChild("FX")}) do
		if folder then hookRemotes(folder) end
	end

	local function IsAlive(char)
		return char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0
	end

	local function getPartsInRange(char, dist)
		local root = char:FindFirstChild("HumanoidRootPart")
		if not root then return {}, nil end
		local parts = {}
		local firstHead = nil
		for _, folder in ipairs({workspace:FindFirstChild("Enemies"), workspace:FindFirstChild("Characters")}) do
			if not folder then continue end
			for _, v in ipairs(folder:GetChildren()) do
				local hrp = v:FindFirstChild("HumanoidRootPart")
				local hum = v:FindFirstChild("Humanoid")
				if v == char or not hrp or not hum or hum.Health <= 0 then continue end
				if (hrp.Position - root.Position).Magnitude > dist then continue end
				if not firstHead then firstHead = v:FindFirstChild("Head") end
				for _, part in ipairs(v:GetChildren()) do
					if part:IsA("BasePart") then
						table.insert(parts, {v, part})
					end
				end
			end
		end
		return parts, firstHead
	end

	while task.wait(0.05) do
		if not getgenv().SuperFastAttackEnabled then continue end
		if not (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Fast Attack V3"]) then continue end
		local char = lp.Character
		if not IsAlive(char) then continue end
		local tool = char:FindFirstChildOfClass("Tool")
		if not tool or tool.ToolTip == "Gun" then continue end

		pcall(function()
			local dist = (_G.Settings and _G.Settings.Setting and _G.Settings.Setting["Fast Attack Range"]) or 60
			local parts, head = getPartsInRange(char, dist)
			if #parts == 0 or not head then return end

			local uuid = tostring(lp.UserId):sub(2,4) .. tostring(math.random(10000,99999))
			attackRemote:FireServer()
			hitRemote:FireServer(head, parts, {}, uuid)

			if remote2 and idremote2 then
				pcall(function()
					local seed = Net.seed and Net.seed:InvokeServer() or 0
					cloneref(remote2):FireServer(
						string.gsub("RE/RegisterHit", ".", function(c)
							return string.char(bit32.bxor(string.byte(c),
								math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1))
						end),
						bit32.bxor(idremote2 + 909090, seed * 2),
						head, parts
					)
				end)
			end
		end)
	end
end);

CombatTab:AddSection(" PvP Tools");

local _DUNGEON_PLACE_ID = 73902483975735;
local _IS_DUNGEON = game.PlaceId == _DUNGEON_PLACE_ID;

getgenv().DungeonConfig = getgenv().DungeonConfig or {
	AutoFuse        = false,
	AutoSpin        = false,
	AutoEnter       = false,
	AutoComplete    = false,
	AutoSkipHub     = false,
	SelectBuffs     = false,
	SelectedBuffs   = {},
	AutoFully       = false,
};

if not _IS_DUNGEON then

	DungeonTab:AddSection("Dungeon World");
	DungeonTab:AddParagraph({
		Title = "⚠ You are not in Dungeon World",
		Desc = "Please go to Dungeon World to use these features.\nDungeon Place ID: " .. tostring(_DUNGEON_PLACE_ID)
	});
else

	local _KNOWN_BUFFS = {
		"ATK UP","DEF UP","SPD UP","HP UP","CDR",
		"CRIT UP","DOUBLE HIT","LIFESTEAL","SHIELD",
		"REFLECT","REGEN","DASH UP","RANGE UP",
	};

	local function _InDungeonLobby()
		return workspace:FindFirstChild("DungeonLobby") ~= nil
			or workspace:FindFirstChild("Lobby") ~= nil;
	end;

	local function _InDungeonMatch()
		return workspace:FindFirstChild("DungeonFloor") ~= nil
			or workspace:FindFirstChild("FloorEnemies") ~= nil
			or workspace:FindFirstChild("DungeonArea") ~= nil;
	end;

	local function _FindRingNPC()
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				local name = v.Name:lower();
				if name:find("ring") and (name:find("npc") or name:find("dealer") or name:find("fus") or name:find("merge") or name:find("spin")) then
					return v;
				end;
			end;
		end;
		for _, v in pairs(workspace:FindFirstChild("NPCs") and workspace.NPCs:GetChildren() or {}) do
			if v.Name:lower():find("ring") then return v; end;
		end;
		return nil;
	end;

	local function _FindDungeonPortal()
		for _, v in pairs(workspace:GetDescendants()) do
			local name = v.Name:lower();
			if (name:find("portal") or name:find("dungeon") or name:find("enter") or name:find("gate")) and v:IsA("BasePart") then
				return v;
			end;
		end;
		return nil;
	end;

	local function _GetFloorEnemies()
		local enemies = {};
		local folder = workspace:FindFirstChild("FloorEnemies") or workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("DungeonEnemies");
		if folder then
			for _, v in pairs(folder:GetChildren()) do
				if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
					table.insert(enemies, v);
				end;
			end;
		end;
		return enemies;
	end;

	local function _GetKitsuneShrines()
		local shrines = {};
		for _, v in pairs(workspace:GetDescendants()) do
			local name = v.Name:lower();
			if name:find("shrine") or name:find("kitsune") or name:find("trap") then
				if v:IsA("BasePart") or v:IsA("Model") then
					table.insert(shrines, v);
				end;
			end;
		end;
		return shrines;
	end;

	local function _GetGasLeaks()
		local leaks = {};
		for _, v in pairs(workspace:GetDescendants()) do
			local name = v.Name:lower();
			if name:find("gas") or name:find("leak") or name:find("vent") or name:find("pipe") then
				if v:IsA("BasePart") or v:IsA("Model") then
					table.insert(leaks, v);
				end;
			end;
		end;
		return leaks;
	end;

	local function _AttackTarget(target)
		pcall(function()
			if not target then return; end;
			local hrp = target:IsA("Model") and (target:FindFirstChild("HumanoidRootPart") or target.PrimaryPart) or target;
			if not hrp then return; end;
			local char = game.Players.LocalPlayer.Character;
			if not char then return; end;
			EquipWeapon(_G.Settings.Main["Selected Weapon"] or _G.SelectWeapon);
			TweenPlayer(hrp.CFrame * CFrame.new(0, 20, 0));
			task.wait(0.1);
		end);
	end;

	local function _SpamSkillsAt(pos)
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return; end;
			TweenPlayer(CFrame.new(pos.X, pos.Y + 15, pos.Z));
			task.wait(0.15);
			local vim = game:GetService("VirtualInputManager");
			for _, key in pairs({"Z","X","C","V","F"}) do
				pcall(function()
					vim:SendKeyEvent(true, key, false, game);
					task.wait(0.06);
					vim:SendKeyEvent(false, key, false, game);
					task.wait(0.04);
				end);
			end;
		end);
	end;

	local function _SelectBuff(buffName)
		pcall(function()

			local plrGui = game.Players.LocalPlayer.PlayerGui;
			for _, gui in pairs(plrGui:GetDescendants()) do
				if (gui:IsA("TextButton") or gui:IsA("ImageButton")) then
					if gui.Text and gui.Text:lower():find(buffName:lower()) then
						gui:Activate();
						return;
					end;
				end;
			end;
		end);
	end;

	local function _PressSkipHub()
		pcall(function()
			local plrGui = game.Players.LocalPlayer.PlayerGui;
			for _, gui in pairs(plrGui:GetDescendants()) do
				if (gui:IsA("TextButton") or gui:IsA("ImageButton")) then
					local t = (gui.Text or ""):lower();
					if t:find("skip") or t:find("lobby") or t:find("return") or t:find("continue") or t:find("next") then
						gui:Activate();
						return;
					end;
				end;
			end;
		end);
	end;

	DungeonTab:AddSection("Rings");
	DungeonTab:AddToggle({
		Title = "Dungeon Auto Fuse Rings [BETA]",
		Desc = "Vai até o NPC de anéis no lobby e funde os anéis automaticamente.",
		Value = getgenv().DungeonConfig.AutoFuse,
		Callback = function(state)
			getgenv().DungeonConfig.AutoFuse = state;
		end
	});
	task.spawn(function()
		while true do
			task.wait(1);
			if not getgenv().DungeonConfig.AutoFuse then continue; end;
			pcall(function()
				local npc = _FindRingNPC();
				if not npc then return; end;
				local hrp_npc = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart;
				if not hrp_npc then return; end;
				TweenPlayer(hrp_npc.CFrame * CFrame.new(0, 0, 5));
				task.wait(0.8);

				local rep = game:GetService("ReplicatedStorage");
				local remote = rep:FindFirstChild("CommF_", true) or rep.Remotes and rep.Remotes:FindFirstChild("CommF_");
				if remote then
					pcall(function() remote:InvokeServer("FuseRing"); end);
					pcall(function() remote:InvokeServer("MergeRing"); end);
					pcall(function() remote:InvokeServer("CombineRing"); end);
				end;

				for _, pp in pairs(npc:GetDescendants()) do
					if pp:IsA("ProximityPrompt") then
						pcall(function() fireproximityprompt(pp); end);
					end;
				end;
			end);
		end;
	end);

	DungeonTab:AddToggle({
		Title = "Dungeon Auto Spin Rings [BETA]",
		Desc = "Gira anéis automaticamente no NPC do lobby.",
		Value = getgenv().DungeonConfig.AutoSpin,
		Callback = function(state)
			getgenv().DungeonConfig.AutoSpin = state;
		end
	});
	task.spawn(function()
		while true do
			task.wait(1);
			if not getgenv().DungeonConfig.AutoSpin then continue; end;
			pcall(function()
				local npc = _FindRingNPC();
				if not npc then return; end;
				local hrp_npc = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart;
				if not hrp_npc then return; end;
				TweenPlayer(hrp_npc.CFrame * CFrame.new(0, 0, 5));
				task.wait(0.8);
				local rep = game:GetService("ReplicatedStorage");
				local remote = rep:FindFirstChild("CommF_", true) or rep.Remotes and rep.Remotes:FindFirstChild("CommF_");
				if remote then
					pcall(function() remote:InvokeServer("SpinRing"); end);
					pcall(function() remote:InvokeServer("RollRing"); end);
					pcall(function() remote:InvokeServer("RerollRing"); end);
				end;
				for _, pp in pairs(npc:GetDescendants()) do
					if pp:IsA("ProximityPrompt") then
						local name = pp.ActionText and pp.ActionText:lower() or "";
						if name:find("spin") or name:find("roll") or name:find("reroll") then
							pcall(function() fireproximityprompt(pp); end);
						end;
					end;
				end;
			end);
		end;
	end);

	DungeonTab:AddSection("Dungeon");
	DungeonTab:AddToggle({
		Title = "Auto Enter Dungeon",
		Desc = "Teleporta para o chao amarelo na entrada da Dungeon e fica tentando iniciar a partida.",
		Value = getgenv().DungeonConfig.AutoEnter,
		Callback = function(state)
			getgenv().DungeonConfig.AutoEnter = state;
		end
	});

	local _DUNGEON_ENTRY_FLOOR_CF = CFrame.new(-2.5, 0.5, -35.5);
	task.spawn(function()
		while true do
			task.wait(0.5);
			if not getgenv().DungeonConfig.AutoEnter then continue; end;
			pcall(function()
				if _InDungeonMatch() then return; end;

				local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
				if not hrp then return; end;

				local yellowFloor = nil;
				for _, v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						local col = v.Color;

						if col.R > 0.7 and col.G > 0.6 and col.B < 0.3 then
							local name = v.Name:lower();
							if name:find("floor") or name:find("enter") or name:find("lobby") or name:find("start") or name:find("ground") then
								yellowFloor = v;
								break;
							end;
						end;
					end;
				end;

				if yellowFloor then
					local targetCF = CFrame.new(yellowFloor.Position.X, yellowFloor.Position.Y + 3, yellowFloor.Position.Z);
					hrp.CFrame = targetCF;
				else

					local portal = _FindDungeonPortal();
					if portal then
						hrp.CFrame = portal.CFrame * CFrame.new(0, 3, 5);
					end;
				end;
				task.wait(0.2);

				for _, pp in pairs(workspace:GetDescendants()) do
					if pp:IsA("ProximityPrompt") then
						local n = (pp.ActionText or pp.Name):lower();
						if n:find("enter") or n:find("start") or n:find("join") or n:find("dungeon") or n:find("portal") then
							pcall(function() fireproximityprompt(pp); end);
						end;
					end;
				end;
				local rep = game:GetService("ReplicatedStorage");
				local remote = rep:FindFirstChild("CommF_", true) or (rep.Remotes and rep.Remotes:FindFirstChild("CommF_"));
				if remote then
					pcall(function() remote:InvokeServer("EnterDungeon"); end);
					pcall(function() remote:InvokeServer("JoinDungeon"); end);
					pcall(function() remote:InvokeServer("StartDungeon"); end);
				end;
			end);
		end;
	end);

	DungeonTab:AddToggle({
		Title = "Auto Complete Dungeon",
		Desc = "Ataca todos os NPCs proximos de cada Floor, destroi Shrines do Kitsune (Floor 10), destroi vazamentos de gas (Floor 15) e avanca automaticamente.",
		Value = getgenv().DungeonConfig.AutoComplete,
		Callback = function(state)
			getgenv().DungeonConfig.AutoComplete = state;
		end
	});
	task.spawn(function()
		while true do
			task.wait(0.15);
			if not getgenv().DungeonConfig.AutoComplete then continue; end;
			pcall(function()
				if not _InDungeonMatch() then return; end;

				local floorNum = 0;
				for _, v in pairs(workspace:GetDescendants()) do
					local name = v.Name:lower();
					if name:find("floor") then
						local n = tonumber(name:match("%d+"));
						if n and n > floorNum then floorNum = n; end;
					end;
				end;

				if floorNum == 10 then
					local shrines = _GetKitsuneShrines();
					if #shrines > 0 then
						for _, shrine in pairs(shrines) do
							if not getgenv().DungeonConfig.AutoComplete then break; end;
							local pos = shrine:IsA("Model") and shrine:GetPivot().Position or shrine.Position;

							local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
							if hrp then hrp.CFrame = CFrame.new(pos.X, pos.Y + 8, pos.Z); end;
							task.wait(0.05);
							_SpamSkillsAt(pos);
							task.wait(0.1);
						end;
						return;
					end;
				end;

				if floorNum == 15 then
					local leaks = _GetGasLeaks();
					if #leaks > 0 then
						for _, leak in pairs(leaks) do
							if not getgenv().DungeonConfig.AutoComplete then break; end;
							local pos = leak:IsA("Model") and leak:GetPivot().Position or leak.Position;
							local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
							if hrp then hrp.CFrame = CFrame.new(pos.X, pos.Y + 8, pos.Z); end;
							task.wait(0.05);
							_SpamSkillsAt(pos);
							task.wait(0.1);
						end;
						return;
					end;
				end;

				local enemies = _GetFloorEnemies();
				if #enemies > 0 then

					local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
					local nearest, nearestDist = enemies[1], math.huge;
					if hrp then
						for _, enemy in pairs(enemies) do
							if enemy:FindFirstChild("HumanoidRootPart") then
								local d = (enemy.HumanoidRootPart.Position - hrp.Position).Magnitude;
								if d < nearestDist then
									nearestDist = d;
									nearest = enemy;
								end;
							end;
						end;
					end;
					if nearest and nearest:FindFirstChild("Humanoid") and nearest.Humanoid.Health > 0 then

						pcall(function() nearest.Humanoid.WalkSpeed = 0; end);
						_AttackTarget(nearest);
					end;
				else

					local rep = game:GetService("ReplicatedStorage");
					local remote = rep:FindFirstChild("CommF_", true) or (rep.Remotes and rep.Remotes:FindFirstChild("CommF_"));
					if remote then
						pcall(function() remote:InvokeServer("NextFloor"); end);
						pcall(function() remote:InvokeServer("AdvanceFloor"); end);
						pcall(function() remote:InvokeServer("CompleteFloor"); end);
					end;

					for _, v in pairs(workspace:GetDescendants()) do
						if v:IsA("ProximityPrompt") then
							local n = (v.ActionText or v.Name):lower();
							if n:find("next") or n:find("advance") or n:find("continue") or n:find("pass") or n:find("floor") then
								pcall(function() fireproximityprompt(v); end);
							end;
						end;
					end;
				end;
			end);
		end;
	end);

	DungeonTab:AddSection("Buffs");
	DungeonTab:AddToggle({
		Title = "Dungeon Select Buffs [BETA]",
		Desc = "Ativa a seleção automática de buffs quando aparecer a tela de cartas na dungeon.",
		Value = getgenv().DungeonConfig.SelectBuffs,
		Callback = function(state)
			getgenv().DungeonConfig.SelectBuffs = state;
		end
	});
	DungeonTab:AddDropdown({
		Title = "Dungeon Buffs to Select [BETA]",
		Desc = "Escolha quais buffs devem ser selecionados automaticamente (multi-seleção)",
		Values = _KNOWN_BUFFS,
		Value = getgenv().DungeonConfig.SelectedBuffs[1] or _KNOWN_BUFFS[1],
		Callback = function(option)

			local found = false;
			for i, v in pairs(getgenv().DungeonConfig.SelectedBuffs) do
				if v == option then found = true; table.remove(getgenv().DungeonConfig.SelectedBuffs, i); break; end;
			end;
			if not found then table.insert(getgenv().DungeonConfig.SelectedBuffs, option); end;
		end
	});

	task.spawn(function()
		while true do
			task.wait(0.5);
			if not getgenv().DungeonConfig.SelectBuffs then continue; end;
			if #getgenv().DungeonConfig.SelectedBuffs == 0 then continue; end;
			pcall(function()
				local plrGui = game.Players.LocalPlayer.PlayerGui;
				for _, gui in pairs(plrGui:GetDescendants()) do
					if (gui:IsA("TextButton") or gui:IsA("ImageButton")) and gui.Visible then
						local t = (gui.Text or ""):lower();
						for _, buffName in pairs(getgenv().DungeonConfig.SelectedBuffs) do
							if t:find(buffName:lower()) then
								gui:Activate();
								task.wait(0.3);
								break;
							end;
						end;
					end;
				end;
			end);
		end;
	end);

	DungeonTab:AddSection("Post-Dungeon");
	DungeonTab:AddToggle({
		Title = "Dungeon Auto Skip Hub [BETA]",
		Desc = "Quando a dungeon terminar, aperta automaticamente para voltar ao lobby.",
		Value = getgenv().DungeonConfig.AutoSkipHub,
		Callback = function(state)
			getgenv().DungeonConfig.AutoSkipHub = state;
		end
	});
	task.spawn(function()
		while true do
			task.wait(1);
			if not getgenv().DungeonConfig.AutoSkipHub then continue; end;
			pcall(function()
				_PressSkipHub();
			end);
		end;
	end);

end;

local PvPTargetList = {};
local SelectedPvPTarget = nil;

local function RefreshPvPTargets()
	PvPTargetList = {};
	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		if p ~= game.Players.LocalPlayer then
			table.insert(PvPTargetList, p.Name);
		end;
	end;
	return PvPTargetList;
end;
RefreshPvPTargets();

local PvPPlayerDropdown = CombatTab:AddDropdown({
	Title = "Select Player",
	Desc = "Seleciona o jogador alvo para PvP",
	Values = PvPTargetList,
	Value = PvPTargetList[1] or "No Players",
	Callback = function(v)
		SelectedPvPTarget = v;
	end
});

CombatTab:AddButton({
	Title = " Refresh Player List",
	Desc = "Atualiza a lista de jogadores no servidor",
	Callback = function()
		RefreshPvPTargets();
		pcall(function()
			PvPPlayerDropdown:SetValues(PvPTargetList);
		end);
		pcall(function()
			PvPPlayerDropdown:Refresh(PvPTargetList);
		end);
		pcall(function()
			PvPPlayerDropdown:Set(PvPTargetList[1] or "");
		end);
	end
});

CombatTab:AddButton({
	Title = " TP to Selected Player",
	Desc = "Teleporta para a posicao do jogador selecionado",
	Callback = function()
		pcall(function()
			if SelectedPvPTarget then
				local target = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					TweenPlayer(target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 5));
				end;
			end;
		end);
	end
});

local _PvPAutoTP = false;
CombatTab:AddToggle({
	Title = "Auto Follow / TP to Player",
	Desc = "Segue e fica em cima do jogador selecionado constantemente",
	Value = false,
	Callback = function(v)
		_PvPAutoTP = v;
	end
});
spawn(function()
	while wait(0.1) do
		if _PvPAutoTP and SelectedPvPTarget then
			pcall(function()
				local target = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					TweenPlayer(target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3));
				end;
			end);
		end;
	end;
end);

CombatTab:AddToggle({
	Title = "Auto Activate PvP",
	Desc = "Mantem PvP ativado automaticamente",
	Value = false,
	Callback = function(v)
		if v then
			spawn(function()
				while v do
					pcall(function()
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ActivatePvp", true);
					end);
					task.wait(5);
				end;
			end);
		end;
	end
});

local _PvPAutoKill = false;
CombatTab:AddToggle({
	Title = "Auto Kill Selected Player",
	Desc = "Mata automaticamente o jogador selecionado",
	Value = false,
	Callback = function(v)
		_PvPAutoKill = v;
	end
});
spawn(function()
	while wait(0.1) do
		if _PvPAutoKill and SelectedPvPTarget then
			pcall(function()
				local target = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if target and target.Character and target.Character:FindFirstChild("Humanoid")
				   and target.Character.Humanoid.Health > 0 then
					Attack();
					EquipWeapon(_G.Settings.Main["Selected Weapon"]);
					AutoHaki();
					TweenPlayer(target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 2));
				end;
			end);
		end;
	end;
end);

local _PvPSpamSkills = false;
CombatTab:AddToggle({
	Title = " Auto Spam Skills (All)",
	Desc = "Spama todas as skills de todas as categorias automaticamente em PvP",
	Value = false,
	Callback = function(v)
		_PvPSpamSkills = v;
	end
});
spawn(function()
	local VIM = game:GetService("VirtualInputManager");
	local VU  = game:GetService("VirtualUser");
	local skillKeys = {"Z","X","C","V","F"};
	local categories = {"Melee","Sword","Blox Fruit","Gun"};
	while true do
		task.wait(0.05);
		if _PvPSpamSkills then
			pcall(function()
				local char = game.Players.LocalPlayer.Character;
				if not char then return; end;

				if SelectedPvPTarget then
					local target = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
					if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
						workspace.CurrentCamera.CFrame = CFrame.lookAt(
							workspace.CurrentCamera.CFrame.Position,
							target.Character.HumanoidRootPart.Position
						);
					end;
				end;

				for _, toolType in ipairs(categories) do
					local tool = nil;
					for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") and v.ToolTip == toolType then tool = v; break; end;
					end;
					if tool then
						char.Humanoid:EquipTool(tool);
						task.wait(0.05);
						for _, sk in ipairs(skillKeys) do
							VIM:SendKeyEvent(true, sk, false, game);
							task.wait(0.02);
							VIM:SendKeyEvent(false, sk, false, game);
						end;
						VU:CaptureController();
						VU:ClickButton1(Vector2.new(851, 158));
						task.wait(0.05);
					end;
				end;
				Attack();
			end);
		end;
	end;
end);

CombatTab:AddSection("Aimbot");

_G.AimLockSkill   = false;
_G.AimLockNPC     = false;
_G.AimLockPlayer  = false;
_G.SilentAimSkill = false;
_G.SilentAimNPC   = false;
_G.SilentAimPlayer = false;

local function _getNearestNPC()
	local hrp = game.Players.LocalPlayer.Character and
			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
	if not hrp then return nil; end;
	local closest, dist = nil, math.huge;
	for _, v in pairs(workspace.Enemies:GetChildren()) do
		if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid")
				and v.Humanoid.Health > 0 then
			local d = (v.HumanoidRootPart.Position - hrp.Position).Magnitude;
			if d < dist then dist = d; closest = v; end;
		end;
	end;
	return closest;
end;

local function _lookAt(targetPos)
	pcall(function()
		workspace.CurrentCamera.CFrame = CFrame.lookAt(
			workspace.CurrentCamera.CFrame.Position, targetPos
		);
	end);
end;

CombatTab:AddToggle({
	Title = "AimLock Skill",
	Desc = "Mantem a camera travada no alvo selecionado ao usar skills. Nao move o jogador.",
	Value = false,
	Callback = function(v)
		_G.AimLockSkill = v;
	end
});

CombatTab:AddToggle({
	Title = "AimLock NPC",
	Desc = "Trava camera no NPC mais proximo automaticamente",
	Value = false,
	Callback = function(v)
		_G.AimLockNPC = v;
	end
});

CombatTab:AddToggle({
	Title = "AimLock Player",
	Desc = "Trava camera no player selecionado automaticamente",
	Value = false,
	Callback = function(v)
		_G.AimLockPlayer = v;
	end
});

spawn(function()
	while task.wait(0.03) do
		pcall(function()
			if _G.AimLockSkill and SelectedPvPTarget then
				local t = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
					_lookAt(t.Character.HumanoidRootPart.Position);
				end;
			end;
			if _G.AimLockNPC then
				local npc = _getNearestNPC();
				if npc then _lookAt(npc.HumanoidRootPart.Position); end;
			end;
			if _G.AimLockPlayer and SelectedPvPTarget then
				local t = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
					_lookAt(t.Character.HumanoidRootPart.Position);
				end;
			end;
		end);
	end;
end);

CombatTab:AddToggle({
	Title = "Silent Aim Skill",
	Desc = "Redireciona os projecteis/hits da skill para o alvo sem precisar olhar pra ele",
	Value = false,
	Callback = function(v)
		_G.SilentAimSkill = v;
	end
});

CombatTab:AddToggle({
	Title = "Silent Aim NPC",
	Desc = "Redireciona hits para o NPC mais proximo sem olhar para ele",
	Value = false,
	Callback = function(v)
		_G.SilentAimNPC = v;
	end
});

CombatTab:AddToggle({
	Title = "Silent Aim Player",
	Desc = "Redireciona hits para o player selecionado sem olhar para ele",
	Value = false,
	Callback = function(v)
		_G.SilentAimPlayer = v;
	end
});

spawn(function()
	while task.wait(0.03) do
		pcall(function()
			local target = nil;
			if _G.SilentAimSkill and SelectedPvPTarget then
				local tp = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if tp and tp.Character and tp.Character:FindFirstChild("HumanoidRootPart") then
					target = tp.Character.HumanoidRootPart;
				end;
			end;
			if _G.SilentAimNPC then
				local npc = _getNearestNPC();
				if npc then target = npc.HumanoidRootPart; end;
			end;
			if _G.SilentAimPlayer and SelectedPvPTarget then
				local tp = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
				if tp and tp.Character and tp.Character:FindFirstChild("HumanoidRootPart") then
					target = tp.Character.HumanoidRootPart;
				end;
			end;
			if target then

				for _, part in pairs(workspace:GetDescendants()) do
					if part:IsA("BasePart") and part.Name:lower():find("hitbox") then
						local creator = part:FindFirstChild("creator") or part:FindFirstChild("Creator");
						if creator and creator.Value == game.Players.LocalPlayer then
							part.CFrame = target.CFrame;
						end;
					end;
				end;

				workspace.CurrentCamera.CFrame = CFrame.lookAt(
					workspace.CurrentCamera.CFrame.Position,
					target.Position
				);
			end;
		end);
	end;
end);

spawn(function()
	while task.wait(0.5) do
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return; end;
			local hum = char:FindFirstChildOfClass("Humanoid");
			if hum and not _G.EclipseLevel and not _G.EclipseFarm_Bone
					and not _G.EclipseFarm_Cake and not _G.EclipseAutoTyrant then
				if hum.WalkSpeed < 16 then hum.WalkSpeed = 16; end;
			end;
		end);
	end;
end);

AutoTrialToggle = RaceTab:AddToggle({
	Title = "Auto Trial",
	Value = _G.Settings.Race["Auto Trial"],
	Callback = function(value)
		_G.Settings.Race["Auto Trial"] = value;
		StopTween(_G.Settings.Race["Auto Trial"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Auto Trial"] then
				if (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Human" then
					for i, v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat
									wait(0.1);
									v.Humanoid.Health = 0;
								until not _G.Settings.Race["Auto Trial"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end);
						end;
					end;
				elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Skypiea" then
					for i, v in pairs((game:GetService("Workspace")).Map.SkyTrial.Model:GetDescendants()) do
						if v.Name == "snowisland_Cylinder.081" then
							TweenPlayer(v.CFrame * CFrame.new(0, 0, 0));
						end;
					end;
				elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Fishman" then
					for i, v in pairs((game:GetService("Workspace")).SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name == "HumanoidRootPart" then
							repeat
								wait();
								TweenPlayer(v.CFrame * CFrame.new(0, 200, 0));
								useAllSkill();
							until not _G.Settings.Race["Auto Trial"] or (not v.Parent) or v.Humanoid.Health <= 0 or (not v:FindFirstChild("HumanoidRootPart"));
						end;
					end;
				elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Cyborg" then
					TweenPlayer(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Ghoul" then
					for i, v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat
									wait(0.1);
									v.Humanoid.Health = 0;
								until not _G.Settings.Race["Auto Trial"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end);
						end;
					end;
				elseif (game:GetService("Players")).LocalPlayer.Data.Race.Value == "Mink" then
					for i, v in pairs((game:GetService("Workspace")):GetDescendants()) do
						if v.Name == "StartPoint" then
							TweenPlayer(v.CFrame * CFrame.new(0, 10, 0));
						end;
					end;
				end;
			end;
		end;
	end);
end);
AutoKillPlayerAfterTrialToggle = RaceTab:AddToggle({
	Title = "Auto Kill Player After Trial",
	Value = _G.Settings.Race["Auto Kill Player After Trial"],
	Callback = function(value)
		_G.Settings.Race["Auto Kill Player After Trial"] = value;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Race["Auto Kill Player After Trial"] then
			if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.TopHUDList.Timer.Visible == true then
				for i, v in pairs((game:GetService("Players")):GetPlayers()) do
					if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
						if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
							if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
								repeat
									task.wait(0.15);
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									AutoHaki();
									TweenPlayer(v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 40));
									Attack();
								until not _G.Settings.Race["Auto Kill Player After Trial"] or (not v.Character) or v.Character.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end);
TeleportSection = TeleportTab:AddSection("Teleport");
TeleportToFirstSeaButton = TeleportTab:AddButton({
	Title = "Teleport To First Sea",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelMain");
	end
});
TeleportToSecondSeaButton = TeleportTab:AddButton({
	Title = "Teleport To Second Sea",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelDressrosa");
	end
});
TeleportToThirdSeaButton = TeleportTab:AddButton({
	Title = "Teleport To Third Sea",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelZou");
	end
});
TeleportIslandSection = TeleportTab:AddSection("Island");
ShopSection = ShopTab:AddSection("Shop");
AutoBuyLegendarySwordToggle = ShopTab:AddToggle({
	Title = "Auto Buy Legendary Sword",
	Value = _G.Settings.Shop["Auto Buy Legendary Sword"],
	Callback = function(state)
		_G.Settings.Shop["Auto Buy Legendary Sword"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Shop["Auto Buy Legendary Sword"] then
			pcall(function()
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1");
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2");
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3");
			end);
		end;
	end;
end);
AutoBuyHakiColorToggle = ShopTab:AddToggle({
	Title = "Auto Buy Haki Color",
	Value = _G.Settings.Shop["Auto Buy Haki Color"],
	Callback = function(state)
		_G.Settings.Shop["Auto Buy Haki Color"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Shop["Auto Buy Haki Color"] then
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("ColorsDealer", "2");
		end;
	end;
end);
AbilitiesShopSection = ShopTab:AddSection("Abilities");
BuyGeppoButton = ShopTab:AddButton({
	Title = "Buy Geppo",
	Desc = "$10,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
	end
});
BuyBusoHaki = ShopTab:AddButton({
	Title = "Buy Buso Haki",
	Desc = "$25,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
	end
});
BuySoruButton = ShopTab:AddButton({
	Title = "Buy Soru",
	Desc = "$25,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
	end
});
BuyObservationHakiButton = ShopTab:AddButton({
	Title = "Buy Observation Haki",
	Desc = "$750,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("KenTalk", "Buy");
	end
});
ShopTab:AddSection(" Buy Fight Styles - Tween to NPC");

local FightStyleNPCs = {
	["Black Leg"]      = {npc="Black Leg Teacher",   pos=CFrame.new(-988, 13, 3996),           buy="BuyBlackLeg"},
	["Electro"]        = {npc="Mad Scientist",        pos=CFrame.new(61050, 19, 1537),          buy="BuyElectro",   portal=Vector3.new(61163.8,11.7,1819.8)},
	["Fishman Karate"] = {npc="Fishman Karate Teacher",pos=CFrame.new(61584.35, 18.85, 988.89), buy="BuyFishmanKarate"},
	["Superhuman"]     = {npc="Martial Arts Master",  pos=CFrame.new(1378.05, 247.43, -5189.37),buy="BuySuperhuman"},
	["Death Step"]     = {npc="Phoeyu, the Reformed", pos=CFrame.new(6360.04, 296.67, -6763.93),buy="BuyDeathStep"},
	["Sharkman Karate"]= {npc="Sharkman Karate Teacher",pos=CFrame.new(-2602.40, 239.22, -10314.75),buy="BuySharkmanKarate"},
	["Electric Claw"]  = {npc="Previous Hero",        pos=CFrame.new(-10369.83,331.69,-10126.49),buy="BuyElectricClaw"},
	["Dragon Talon"]   = {npc="UzothDragon",          pos=CFrame.new(5662.03,1211.32,858.60),   buy="BuyDragonTalon"},
	["God Human"]      = {npc="Ancient Monk",          pos=CFrame.new(-13775.56,334.66,-9877.67),buy="BuyGodhuman"},
	["Sanguine Art"]   = {npc="Shafi",                pos=CFrame.new(-16514.86,23.18,-190.84),  buy="BuySanguineArt"},
	["Water Kung Fu"]  = {npc="Water Kung Fu Teacher", pos=CFrame.new(-4960.04, 35.08, -4662.67),buy="BuyFishmanKarate", submerged=true},
};

local FightStyleOrder = {
	"Black Leg","Electro","Fishman Karate","Superhuman","Death Step",
	"Sharkman Karate","Electric Claw","Dragon Talon","God Human","Sanguine Art","Water Kung Fu"
};

local SelectedFightStyle = FightStyleOrder[1];
ShopTab:AddDropdown({
	Title = "Select Fight Style",
	Values = FightStyleOrder,
	Value = FightStyleOrder[1],
	Callback = function(v) SelectedFightStyle = v; end
});

local function BuyFightStyleFull(styleName)
	local data = FightStyleNPCs[styleName];
	if not data then
		Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Estilo nao encontrado: " .. tostring(styleName), Icon = "alert-triangle", Duration = 4});
		return;
	end;
	local plr = game.Players.LocalPlayer;
	local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
	if not hrp then return; end;

	if data.portal then
		pcall(function()
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", data.portal);
		end);
		task.wait(2);
		hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
		if not hrp then return; end;
	end;

	if data.submerged then
		local SubWorkerCF = CFrame.new(-16417.6, 74.26, 1811.3);
		TweenPlayer(SubWorkerCF);
		local tw = 0;
		repeat task.wait(0.2); tw=tw+0.2; until (hrp.Position - SubWorkerCF.Position).Magnitude < 18 or tw > 15;
		task.wait(0.5);
		pcall(function()
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("NPC", "Submarine Worker");
		end);
		task.wait(0.5);
		pcall(function()
			game:GetService("ReplicatedStorage").Modules.Net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland");
		end);
		tw = 0;
		repeat task.wait(0.3); tw=tw+0.3; until hrp.Position.Y < -200 or tw > 18;
		task.wait(1);
		hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
		if not hrp then return; end;
	end;

	TweenPlayer(data.pos);
	local t = 0;
	repeat task.wait(0.2); t=t+0.2; until (hrp.Position - data.pos.Position).Magnitude < 15 or t > 20;
	task.wait(0.5);

	pcall(function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("NPC", data.npc);
	end);
	task.wait(0.6);

	pcall(function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(data.buy);
	end);
	task.wait(0.3);
	pcall(function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(data.buy, true);
	end);
	Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Compra enviada: " .. styleName, Icon = "check", Duration = 4});
end;

ShopTab:AddButton({
	Title = " Go Buy Selected Fight Style",
	Desc = "Tween ate o NPC, faz dialogo e compra o estilo selecionado",
	Callback = function()
		task.spawn(function() pcall(BuyFightStyleFull, SelectedFightStyle); end);
	end
});

local _autoBuyAllActive = false;
ShopTab:AddToggle({
	Title = "Auto Buy All Fight Styles",
	Desc = "Vai em cada NPC em ordem e compra todos os estilos",
	Value = false,
	Callback = function(state)
		_autoBuyAllActive = state;
		if state then
			task.spawn(function()
				for _, styleName in ipairs(FightStyleOrder) do
					if not _autoBuyAllActive then break; end;
					pcall(BuyFightStyleFull, styleName);
					task.wait(1.5);
				end;
				_autoBuyAllActive = false;
			end);
		end;
	end
});
SwordShopSection = ShopTab:AddSection("Sword");
BuyCutlassButton = ShopTab:AddButton({
	Title = "Buy Cutlass",
	Desc = "$1,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
	end
});
BuyKatanaButton = ShopTab:AddButton({
	Title = "Buy Katana",
	Desc = "$1,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Katana");
	end
});
BuyIronMaceButton = ShopTab:AddButton({
	Title = "Buy Iron Mace",
	Desc = "$25,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
	end
});
BuyDualKatanaButton = ShopTab:AddButton({
	Title = "Buy Dual Katana",
	Desc = "$12,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Dual Katana");
	end
});
BuyTripleKatanaButton = ShopTab:AddButton({
	Title = "Buy Triple Katana",
	Desc = "$60,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
	end
});
BuyPipeButton = ShopTab:AddButton({
	Title = "Buy Pipe",
	Desc = "$100,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
	end
});
BuyDualHeadedBladeButton = ShopTab:AddButton({
	Title = "Buy Dual Headed Blade",
	Desc = "$400,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
	end
});
BuyBisentoButton = ShopTab:AddButton({
	Title = "Buy Bisento",
	Desc = "$1,200,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
	end
});
BuySoulCaneButton = ShopTab:AddButton({
	Title = "Buy Soul Cane",
	Desc = "$1,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
	end
});
GunShopSection = ShopTab:AddSection("Gun");
BuySlingshotButton = ShopTab:AddButton({
	Title = "Buy Slingshot",
	Desc = "$5,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Slingshot");
	end
});
BuyMusketButton = ShopTab:AddButton({
	Title = "Buy Musket",
	Desc = "$8,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Musket");
	end
});
BuyFintlockButton = ShopTab:AddButton({
	Title = "Buy Flintlock",
	Desc = "$10,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Flintlock");
	end
});
BuyRefinedFintlockButton = ShopTab:AddButton({
	Title = "Buy Refined Fintlock",
	Desc = "$60,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Refined Fintlock");
	end
});
BuyCanonButton = ShopTab:AddButton({
	Title = "Buy Cannon",
	Desc = "$100,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Cannon");
	end
});
BuyKabuchaButton = ShopTab:AddButton({
	Title = "Buy Kabucha",
	Desc = "B$1,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2");
	end
});
StatsShopSection = ShopTab:AddSection("Stats");
ResetStatsShopButton = ShopTab:AddButton({
	Title = "Reset Stats",
	Desc = "B$2,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2");
	end
});
RandomRaceShopButton = ShopTab:AddButton({
	Title = "Random Race",
	Desc = "B$3,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2");
	end
});
AccessoriesShopSection = ShopTab:AddSection("Accessories");
BuyBlackCapeButton = ShopTab:AddButton({
	Title = "Buy Black Cape",
	Desc = "$50,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Black Cape");
	end
});
BuySwordsmanHatButton = ShopTab:AddButton({
	Title = "Buy Swordsman Hat",
	Desc = "$150,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat");
	end
});
BuyTomoeRingButton = ShopTab:AddButton({
	Title = "Buy Tomoe Ring",
	Desc = "$500,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring");
	end
});

local IslandList = {};
if World1 then
	IslandList = {
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
	};
elseif World2 then
	IslandList = {
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
		"Punk Hazard",
		"Cursed Ship",
		"Ice Castle",
		"Forgotten Island",
		"Ussop Island",
		"Mini Sky Island"
	};
elseif World3 then
	IslandList = {
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
		"Cocoa Island",
		"Candy Island",
		"Tiki Outpost",
		"Dragon Dojo"
	};
end;

local EclipseIslandList = {};
pcall(function()
	for _, loc in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
		table.insert(EclipseIslandList, loc.Name);
	end;
end);

local PortalIslands = {
	["Sky Island 2"]         = Vector3.new(-4607.82275, 872.54248, -1667.55688),
	["Sky Island 3"]         = Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047),
	["Under Water Island"]   = Vector3.new(61163.8515625, 11.6796875, 1819.7841796875),
	["Castle On The Sea"]    = Vector3.new(-5083.26025390625, 314.6056823730469, -3175.673095703125),
	["Mansion"]              = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375),
	["Hydra Island"]         = Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625),
};
SelectedTeleportIslandDropdown = TeleportTab:AddDropdown({
	Title = "Choose Island",
	Desc = "Lista dinamica do Eclipse - le o mapa real",
	Values = EclipseIslandList,
	Value = EclipseIslandList[1] or "",
	Callback = function(option)
		_G.SelectIsland = option;
	end
});

AutoTeleportToIslandToggle = TeleportTab:AddToggle({
	Title = "Tween To Island",
	Desc = "Move suavemente ate a ilha selecionada e para ao chegar. Player pode se mover normalmente.",
	Value = false,
	Callback = function(state)
		_G.TweenToIslandActive = state;
		if not state then StopTween(false); return; end;
		task.spawn(function()
			if not _G.SelectIsland or _G.SelectIsland == "" then return; end;
			local plr = game.Players.LocalPlayer;
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			if PortalIslands and PortalIslands[_G.SelectIsland] then
				pcall(function()
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
						"requestEntrance", PortalIslands[_G.SelectIsland]
					);
				end);
				task.wait(1.5);
			else
				local target = workspace._WorldOrigin.Locations:FindFirstChild(_G.SelectIsland);
				if target then
					local destCF = target.CFrame * CFrame.new(0, 5, 0);

					TweenPlayer(destCF);

					local t = 0;
					repeat
						task.wait(0.1); t = t + 0.1;
						hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
						if not hrp then break; end;
					until not _G.TweenToIslandActive
						or (hrp.Position - destCF.p).Magnitude < 20
						or t > 60;

					StopTween(false);
					_G.TweenToIslandActive = false;
					if AutoTeleportToIslandToggle then
						pcall(function() AutoTeleportToIslandToggle:SetValue(false); end);
					end;
				end;
			end;
		end);
	end
});

_G.BypassTeleportActive = false;
TeleportTab:AddToggle({
	Title = "Bypass Teleport to Island",
	Desc = "Teleporta via bypass (com reset) para a ilha selecionada. Repete ate chegar. Player pode pular/mover.",
	Value = false,
	Callback = function(state)
		_G.BypassTeleportActive = state;
		if not state then return; end;
		task.spawn(function()
			while _G.BypassTeleportActive do
				pcall(function()
					if not _G.SelectIsland or _G.SelectIsland == "" then return; end;
					local plr = game.Players.LocalPlayer;
					local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
					if not hrp then return; end;
					if PortalIslands and PortalIslands[_G.SelectIsland] then

						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
							"requestEntrance", PortalIslands[_G.SelectIsland]
						);
						task.wait(1.5);
					else
						local target = workspace._WorldOrigin.Locations:FindFirstChild(_G.SelectIsland);
						if target then
							local destCF = target.CFrame * CFrame.new(0, 5, 0);

							hrp.CFrame = destCF;
							task.wait(0.3);

							hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
							if hrp and (hrp.Position - destCF.p).Magnitude < 20 then

								_G.BypassTeleportActive = false;
								Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Chegou em: " .. _G.SelectIsland, Icon = "map-pin", Duration = 4});
							end;
						end;
					end;
				end);
				task.wait(0.5);
			end;
		end);
	end
});

_G.TweenIsland = false;
AutoTweenToIslandToggle = TeleportTab:AddToggle({
	Title = "Tween To Island",
	Desc = "Move suavemente ate a ilha selecionada",
	Value = false,
	Callback = function(state)
		_G.TweenIsland = state;
		if not state then StopTween(false); end;
		if state then
			task.spawn(function()
				repeat
					pcall(function()
						if not _G.SelectIsland then return; end;
						local plr = game.Players.LocalPlayer;
						local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
						if not hrp then return; end;
						if PortalIslands[_G.SelectIsland] then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
								"requestEntrance", PortalIslands[_G.SelectIsland]
							);
							task.wait(1);
						else
							local target = workspace._WorldOrigin.Locations:FindFirstChild(_G.SelectIsland);
							if target then
								local destPos = target.CFrame * CFrame.new(0, 5, 0);
								local dist = (hrp.Position - destPos.p).Magnitude;
								if dist > 15 then
									TweenPlayer(destPos);

									local t = 0;
									repeat
										task.wait(0.1);
										t = t + 0.1;
										hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
										if not hrp then break; end;
									until not _G.TweenIsland
										or (hrp.Position - destPos.p).Magnitude < 20
										or t > 15;
								end;
							end;
						end;
					end);
					task.wait(0.3);
				until not _G.TweenIsland;
			end);
		end;
	end
});

TeleportNpcSection = TeleportTab:AddSection("Npc");
local EclipseNPCList = {};
pcall(function()
	local replNPCs = (game:GetService("ReplicatedStorage")):FindFirstChild("NPCs");
	if replNPCs then
		for _, npc in pairs(replNPCs:GetChildren()) do
			table.insert(EclipseNPCList, npc.Name);
		end;
	end;
end);
local SelectedNpcName = EclipseNPCList[1] or "";
SelectedNpcTeleport = TeleportTab:AddDropdown({
	Title = "Choose Npc",
	Desc = "Lista dinamica do Eclipse - NPCs reais do servidor",
	Values = EclipseNPCList,
	Value = EclipseNPCList[1] or "",
	Callback = function(option)
		SelectedNpcName = option;
		_G.SelectNPC = option;
	end
});

TeleportToNpcToggle = TeleportTab:AddToggle({
	Title = "Teleport To Npc",
	Desc = "Teleporte instantaneo direto para o NPC",
	Value = false,
	Callback = function(state)
		_G.TeleportNPC = state;
		if not state then StopTween(false); end;
		if state then
			task.spawn(function()
				repeat
					pcall(function()
						local replNPCs = (game:GetService("ReplicatedStorage")):FindFirstChild("NPCs");
						if replNPCs then
							for _, npcModel in pairs(replNPCs:GetChildren()) do
								if npcModel.Name == SelectedNpcName then
									local hrp = npcModel:FindFirstChild("HumanoidRootPart");
									if hrp then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
											hrp.CFrame * CFrame.new(0, 3, 4);
									end;
								end;
							end;
						end;
					end);
					task.wait(0.5);
				until not _G.TeleportNPC;
			end);
		end;
	end
});

_G.TweenNPC = false;
TweenToNpcToggle = TeleportTab:AddToggle({
	Title = "Tween To Npc",
	Desc = "Move suavemente ate o NPC selecionado",
	Value = false,
	Callback = function(state)
		_G.TweenNPC = state;
		if not state then StopTween(false); end;
		if state then
			task.spawn(function()
				repeat
					pcall(function()
						local plr = game.Players.LocalPlayer;
						local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
						if not hrp then return; end;
						local replNPCs = (game:GetService("ReplicatedStorage")):FindFirstChild("NPCs");
						if replNPCs then
							for _, npcModel in pairs(replNPCs:GetChildren()) do
								if npcModel.Name == SelectedNpcName then
									local npcHrp = npcModel:FindFirstChild("HumanoidRootPart");
									if npcHrp then
										local dest = npcHrp.CFrame * CFrame.new(0, 3, 4);
										local dist = (hrp.Position - dest.p).Magnitude;
										if dist > 10 then
											TweenPlayer(dest);

											local t = 0;
											repeat
												task.wait(0.1);
												t = t + 0.1;
												hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
												if not hrp then break; end;
											until not _G.TweenNPC
												or (hrp.Position - dest.p).Magnitude < 12
												or t > 12;
										end;
									end;
								end;
							end;
						end;
					end);
					task.wait(0.3);
				until not _G.TweenNPC;
			end);
		end;
	end
});
EspSection = EspTab:AddSection("Esp");
EspPlayerToggle = EspTab:AddToggle({
	Title = "Esp Player",
	Desc = "Highlight Player",
	Value = _G.Settings.Esp["ESP Player"],
	Callback = function(state)
		_G.Settings.Esp["ESP Player"] = state;
	end
});
EspChestToggle = EspTab:AddToggle({
	Title = "Esp Chest",
	Desc = "Highlight Chest",
	Value = _G.Settings.Esp["ESP Chest"],
	Callback = function(state)
		_G.Settings.Esp["ESP Chest"] = state;
	end
});
EspDevilFruitToggle = EspTab:AddToggle({
	Title = "Esp DevilFruit",
	Desc = "Highlight DevilFruit",
	Value = _G.Settings.Esp["ESP DevilFruit"],
	Callback = function(state)
		_G.Settings.Esp["ESP DevilFruit"] = state;
	end
});
EspRealFruitToggle = EspTab:AddToggle({
	Title = "Esp RealFruit",
	Desc = "Highlight RealFruit",
	Value = _G.Settings.Esp["ESP RealFruit"],
	Callback = function(state)
		_G.Settings.Esp["ESP RealFruit"] = state;
	end
});
EspFlowerToggle = EspTab:AddToggle({
	Title = "Esp Flower",
	Desc = "Highlight Flower",
	Value = _G.Settings.Esp["ESP Flower"],
	Callback = function(state)
		_G.Settings.Esp["ESP Flower"] = state;
	end
});
EspIslandToggle = EspTab:AddToggle({
	Title = "Esp Island",
	Desc = "Highlight Island",
	Value = _G.Settings.Esp["ESP Island"],
	Callback = function(state)
		_G.Settings.Esp["ESP Island"] = state;
	end
});
EspNpcToggle = EspTab:AddToggle({
	Title = "Esp Npc",
	Desc = "Highlight Npc",
	Value = _G.Settings.Esp["ESP Npc"],
	Callback = function(state)
		_G.Settings.Esp["ESP Npc"] = state;
	end
});
EspSeaBeastToggle = EspTab:AddToggle({
	Title = "Esp Sea Beast",
	Desc = "Highlight SeaBeast",
	Value = _G.Settings.Esp["ESP Sea Beast"],
	Callback = function(state)
		_G.Settings.Esp["ESP Sea Beast"] = state;
	end
});
EspMonsterToggle = EspTab:AddToggle({
	Title = "Esp Mob",
	Desc = "Highlight Monster",
	Value = _G.Settings.Esp["ESP Monster"],
	Callback = function(state)
		_G.Settings.Esp["ESP Monster"] = state;
	end
});
EspMirageIslandToggle = EspTab:AddToggle({
	Title = "Esp Mirage Island",
	Desc = "Highlight Mirage Island",
	Value = _G.Settings.Esp["ESP Mirage"],
	Callback = function(state)
		_G.Settings.Esp["ESP Mirage"] = state;
	end
});
EspKitsuneIslandToggle = EspTab:AddToggle({
	Title = "Esp Kitsune Island",
	Desc = "Highlight Kitsune Island",
	Value = _G.Settings.Esp["ESP Kitsune"],
	Callback = function(state)
		_G.Settings.Esp["ESP Kitsune"] = state;
	end
});
EspFrozenDimensionToggle = EspTab:AddToggle({
	Title = "Esp Frozen Dimension",
	Desc = "Highlight Frozen Dimension",
	Value = _G.Settings.Esp["ESP Frozen"],
	Callback = function(state)
		_G.Settings.Esp["ESP Frozen"] = state;
	end
});
EspPrehistoricIslandToggle = EspTab:AddToggle({
	Title = "Esp Prehistoric Island",
	Desc = "Highlight Prehistoric Island",
	Value = _G.Settings.Esp["ESP Prehistoric"],
	Callback = function(state)
		_G.Settings.Esp["ESP Prehistoric"] = state;
	end
});
EspGearToggle = EspTab:AddToggle({
	Title = "Esp Gear",
	Desc = "Highlight Gear",
	Value = _G.Settings.Esp["ESP Gear"],
	Callback = function(state)
		_G.Settings.Esp["ESP Gear"] = state;
	end
});
DragonDojoTab:AddSection(" Dojo Quest - Belt Trainer");

DragonDojoTab:AddParagraph({
	Title = "Auto Dojo Trainer",
	Desc = "Completa as quests de faixa automaticamente (White -> Black)"
});

local _G_Dojoo = false;
local debugDojo = false;

local function printBeltName(I)
	if type(I) == "table" and I.Quest and I.Quest.BeltName then
		return I.Quest.BeltName;
	end;
end;

DragonDojoTab:AddToggle({
	Title = "Auto Dojo Trainer",
	Desc = "Pega e completa quests de faixa: White, Yellow, Green, Purple, Red, Black",
	Value = false,
	Callback = function(I)
		_G_Dojoo = I;
		_G.Dojoo = I;
	end
});

spawn(function()
	while wait(0.2) do
		if _G_Dojoo then
			pcall(function()
				local I = {{[1] = {NPC="Dojo Trainer", Command="RequestQuest"}}};
				local e = (game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")):InvokeServer(unpack(I[1]));
				local K = printBeltName(e);
				if debugDojo == false and (not e and not K) then

					TweenPlayer(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875));
					debugDojo = true;
				elseif debugDojo == true and ((CFrame.new(5865.0234375,1208.3154296875,871.15185546875)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
					if K == "White" then

						local mob = GetConnectionEnemies("Skull Slayer");
						if mob then
							repeat task.wait(); G.Kill(mob, _G_Dojoo); until not e or not _G_Dojoo or not G.Alive(mob);
						else
							TweenPlayer(CFrame.new(-16759.58984375, 71.283767700195, 1595.3399658203));
						end;
					elseif K == "Yellow" or K == "Green" or K == "Red" then

						repeat task.wait();
							_G.SeaBeast1=true; _G.SailBoats=true;
						until not _G_Dojoo or not e;
						_G.SeaBeast1=false; _G.SailBoats=false;
					elseif K == "Purple" then

						repeat task.wait(); _G.FarmEliteHunt=true; until not _G_Dojoo or not e;
						_G.FarmEliteHunt=false;
					elseif K == "Black" then

						repeat task.wait();
							if workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
								_G.Prehis_Find=true; _G.Prehis_Skills=false;
							else
								_G.Prehis_Find=true;
							end;
						until not _G_Dojoo or not e;
						_G.Prehis_Find=false; _G.Prehis_Skills=false;
					elseif K == "Orange" or K == "Blue" then
						return nil;
					end;
				end;
				if not e then
					debugDojo = false;

					local J = {{[1] = {NPC="Dojo Trainer", Command="ClaimQuest"}}};
					(game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")):InvokeServer(unpack(J[1]));
				end;
			end);
		end;
	end;
end);

DragonDojoSection = DragonDojoTab:AddSection("Dragon Dojo");
AutoFarmBlazeEmberToggle = DragonDojoTab:AddToggle({
	Title = "Auto Farm Blaze Ember",
	Desc = "Auto Compleate Quest + Collect Blaze Ember [ Sea 3 Only ]",
	Value = _G.Settings.DragonDojo["Auto Farm Blaze Ember"],
	Callback = function(state)
		_G.Settings.DragonDojo["Auto Farm Blaze Ember"] = state;
		StopTween(_G.Settings.DragonDojo["Auto Farm Blaze Ember"]);
		(getgenv()).SaveSetting();
	end
});
function getBlazeEmberQuest()
	local ResQuest = ((((game:GetService("ReplicatedStorage")):WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
		Context = "Check"
	});
	if ResQuest then
		for key, value in pairs(ResQuest) do
			if key == "Text" then
				return value;
			end;
		end;
	end;
end;
function getRequestQuest()
	local Req = ((((game:GetService("ReplicatedStorage")):WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
		Context = "RequestQuest"
	});
	return Req;
end;
function getIsOnQuest()
	local ResQuest = ((((game:GetService("ReplicatedStorage")):WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
		Context = "Check"
	});
	if ResQuest then
		for key, value in pairs(ResQuest) do
			if key == "Text" then
				if string.find(value, "Venomous Assailant") or string.find(value, "Hydra Enforcer") or string.find(value, "Destroy 10 trees") then
					return true;
				end;
			end;
		end;
	end;
	return false;
end;
spawn(function()
	while wait(0.2) do
		if _G.Settings.DragonDojo["Auto Farm Blaze Ember"] then
			pcall(function()
				if not _G.OnBlzeQuest and (not getIsOnQuest()) then
					local DragonHunterPos = CFrame.new(5864.86377, 1209.55066, 812.775024, 0.879059196, 0.00000000381980803, 0.476712614, -0.0000000131110456, 1, 0.0000000161639893, -0.476712614, -0.0000000204593036, 0.879059196);
					TweenPlayer(DragonHunterPos);
					((((game:GetService("ReplicatedStorage")):WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
						Context = "RequestQuest"
					});
				end;
				SaveBlazeEmberQuest();
				_G.OnBlzeQuest = true;
			end);
		end;
	end;
end);
function SaveBlazeEmberQuest()
	if string.find(getBlazeEmberQuest(), "Venomous Assailant") then
		_G.BlazeEmberQuest = "Venomous Assailant";
	elseif string.find(getBlazeEmberQuest(), "Hydra Enforcer") then
		_G.BlazeEmberQuest = "Hydra Enforcer";
	elseif string.find(getBlazeEmberQuest(), "Destroy 10 trees") then
		_G.BlazeEmberQuest = "Destroy 10 trees";
	end;
end;
_G.OnBlzeQuest = false;
spawn(function()
	while wait(0.2) do
		if isQuestCompleated() then
			_G.OnBlzeQuest = false;
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.DragonDojo["Auto Farm Blaze Ember"] then
			pcall(function()
				if _G.BlazeEmberQuest == "Venomous Assailant" and _G.OnBlzeQuest then
					autoKillVenemousAssailant();
				elseif _G.BlazeEmberQuest == "Hydra Enforcer" and _G.OnBlzeQuest then
					autoKillHydraEnforcer();
				elseif _G.BlazeEmberQuest == "Destroy 10 trees" and _G.OnBlzeQuest then
					autoDestroyHydraTrees();
				end;
			end);
		end;
	end;
end);
function isQuestCompleated()
	for i, v in pairs((game:GetService("Players")).LocalPlayer.PlayerGui.Notifications:GetChildren()) do
		for _, Notif in pairs(v:GetChildren()) do
			if string.find(Notif.Text, "Task completed!") or string.find(Notif.Text, "Head back to the Dojo") then
				return true;
			end;
		end;
	end;
	return false;
end;
function CollectBlazeEmber()
	InstantTp((((game:GetService("Workspace")):WaitForChild("EmberTemplate")):FindFirstChild("Part")).CFrame);
end;
function autoKillVenemousAssailant()
	if not (game:GetService("Workspace")).Enemies:FindFirstChild("Venomous Assailant") then
		TweenPlayer(CFrame.new(4789.29639, 1078.59082, 962.764099, -0.381989956, 0.0000000198627319, 0.924166501, 0.0000000126859874, 1, -0.0000000162490341, -0.924166501, 0.00000000551699708, -0.381989956));
	else
		for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
			if v.Name == "Venomous Assailant" then
				if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					_G._farmMobTarget = v;
					repeat
						task.wait(0.15);
						AutoHaki();
						EquipWeapon(_G.Settings.Main["Selected Weapon"]);
						v.Humanoid.WalkSpeed = 0;
						v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
						PosMon = v.HumanoidRootPart.CFrame;
						MonFarm = v.Name;
						TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						Attack();
					until not v.Parent or v.Humanoid.Health <= 0 or (not _G.Settings.DragonDojo["Auto Farm Blaze Ember"]) or (not _G.OnBlzeQuest);
				end;
			end;
		end;
	end;
end;
function autoKillHydraEnforcer()
	if not (game:GetService("Workspace")).Enemies:FindFirstChild("Hydra Enforcer") then
		TweenPlayer(CFrame.new(4789.29639, 1078.59082, 962.764099, -0.381989956, 0.0000000198627319, 0.924166501, 0.0000000126859874, 1, -0.0000000162490341, -0.924166501, 0.00000000551699708, -0.381989956));
	else
		for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
			if v.Name == "Hydra Enforcer" then
				if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					_G._farmMobTarget = v;
					repeat
						task.wait(0.15);
						AutoHaki();
						EquipWeapon(_G.Settings.Main["Selected Weapon"]);
						v.Humanoid.WalkSpeed = 0;
						v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
						PosMon = v.HumanoidRootPart.CFrame;
						MonFarm = v.Name;
						TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						Attack();
					until not v.Parent or v.Humanoid.Health <= 0 or (not _G.Settings.DragonDojo["Auto Farm Blaze Ember"]) or (not _G.OnBlzeQuest);
				end;
			end;
		end;
	end;
end;
function autoDestroyHydraTrees()
	local Pos1 = CFrame.new(5260.28223, 1004.24329, 347.062622, 0.923247099, -0.00000000370291953, 0.384206682, -0.000000000671108058, 1, 0.0000000112505019, -0.384206682, -0.0000000106448379, 0.923247099);
	local Pos2 = CFrame.new(5237.94775, 1004.24329, 429.596344, 0.371416599, 0.00000000207420636, 0.92846632, 0.00000000476562345, 1, -0.00000000414041734, -0.92846632, 0.00000000596254068, 0.371416599);
	local Pos3 = CFrame.new(5320.87793, 1004.24329, 439.152954, 0.136340275, -0.0000000995428806, -0.990662038, 0.0000000610136723, 1, -0.0000000920841288, 0.990662038, -0.0000000478891593, 0.136340275);
	local Pos4 = CFrame.new(5346.70752, 1004.24329, 359.389008, 0.296962529, 0.0000000642768185, -0.954889119, -0.0000000737323518, 1, 0.0000000443832349, 0.954889119, 0.0000000572260639, 0.296962529);
	local myPos = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame;
	if (myPos.Position - Pos1.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos1);
	end;
	if (myPos.Position - Pos2.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos2);
	end;
	if (myPos.Position - Pos3.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos3);
	end;
	if (myPos.Position - Pos4.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos4);
	end;
end;
DoneSkillGun = false;
DoneSkillSword = false;
DoneSkillFruit = false;
DoneSkillMelee = false;
function useAllSkill()
	if DoneSkillFruit == false then
		for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				if v.ToolTip == "Blox Fruit" then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
				end;
			end;
		end;
		(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "C", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "C", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "V", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "V", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "F", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "F", false, game);
		DoneSkillFruit = true;
	end;
	if DoneSkillMelee == false then
		for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				if v.ToolTip == "Melee" then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
				end;
			end;
		end;
		(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "C", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "C", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "V", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "V", false, game);
		DoneSkillMelee = true;
	end;
	if DoneSkillSword == false then
		for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				if v.ToolTip == "Sword" then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
				end;
			end;
		end;
		(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
		wait(0);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
		DoneSkillSword = true;
	end;
	if DoneSkillGun == false then
		for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				if v.ToolTip == "Gun" then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
				end;
			end;
		end;
		(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
		wait(0.1);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
		(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
		wait(0.1);
		(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
		DoneSkillGun = true;
	end;
	DoneSkillGun = false;
	DoneSkillSword = false;
	DoneSkillFruit = false;
	DoneSkillMelee = false;
end;
spawn(function()
	while wait(0.2) do
		if _G.Settings.DragonDojo["Auto Farm Blaze Ember"] then
			pcall(function()
				if ((game:GetService("Workspace")):WaitForChild("EmberTemplate")):FindFirstChild("Part") then
					CollectBlazeEmber();
				end;
			end);
		end;
	end;
end);
CraftVolcanicMagnetButton = DragonDojoTab:AddButton({
	Title = "Craft Volcanic Magnet",
	Callback = function()
		(((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("CraftItem", "Craft", "Volcanic Magnet");
	end
});
DragonDojoTab:AddSection("Draco Trial");
GetQuestDracoLevel = function()
	local I = { [1] = { NPC = "Dragon Wizard", Command = "Upgrade" } };
	return (game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")):InvokeServer(unpack(I));
end;
UpgradeDracoTrialToggle = DragonDojoTab:AddToggle({
	Title = "Auto Upgrade Draco Trial",
	Desc = "Auto tween to Dragon Wizard and upgrade",
	Value = _G.Settings.DragonDojo["Auto Upgrade Draco Trial"],
	Callback = function(state)
		_G.Settings.DragonDojo["Auto Upgrade Draco Trial"] = state;
		StopTween(_G.Settings.DragonDojo["Auto Upgrade Draco Trial"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _G.Settings.DragonDojo["Auto Upgrade Draco Trial"] then
				if GetQuestDracoLevel() == false then
					return nil;
				elseif GetQuestDracoLevel() == true then
					TweenPlayer(CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609));
					local I = { [1] = { NPC = "Dragon Wizard", Command = "Upgrade" } };
					(game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")):InvokeServer(unpack(I));
				end;
			end;
		end);
	end;
end);
DracoV1Toggle = DragonDojoTab:AddToggle({
	Title = "Auto Draco V1",
	Desc = "Auto Quest 1 + Prehistoric Event + Collect Dragon Eggs",
	Value = _G.Settings.DragonDojo["Auto Draco V1"],
	Callback = function(state)
		_G.Settings.DragonDojo["Auto Draco V1"] = state;
		StopTween(_G.Settings.DragonDojo["Auto Draco V1"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _G.Settings.DragonDojo["Auto Draco V1"] then
				if GetM("Dragon Egg") <= 0 then
					repeat
						wait();
						_G.Prehis_Find = true;
						_G.Prehis_Skills = true;
						_G.Prehis_DE = true;
					until not _G.Settings.DragonDojo["Auto Draco V1"] or GetM("Dragon Egg") >= 1;
					_G.Prehis_Find = false;
					_G.Prehis_Skills = false;
					_G.Prehis_DE = false;
				end;
			end;
		end);
	end;
end);
DracoV2Toggle = DragonDojoTab:AddToggle({
	Title = "Auto Draco V2",
	Desc = "Auto Kill Forest Pirate + Collect Fire Flower",
	Value = _G.Settings.DragonDojo["Auto Draco V2"],
	Callback = function(state)
		_G.Settings.DragonDojo["Auto Draco V2"] = state;
		StopTween(_G.Settings.DragonDojo["Auto Draco V2"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.5) do
		if _G.Settings.DragonDojo["Auto Draco V2"] then
			pcall(function()
				local flowers = workspace:FindFirstChild("FireFlowers");
				local enemy = GetConnectionEnemies("Forest Pirate");
				if enemy then
					repeat
						wait();
						G.Kill(enemy, _G.Settings.DragonDojo["Auto Draco V2"]);
					until not _G.Settings.DragonDojo["Auto Draco V2"] or not enemy.Parent or enemy.Humanoid.Health <= 0 or flowers;
				else
					TweenPlayer(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375));
				end;
				if flowers then
					for _, f in pairs(flowers:GetChildren()) do
						if f:IsA("Model") and f.PrimaryPart then
							local dist = (f.PrimaryPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
							if dist <= 100 then
								(game:GetService("VirtualInputManager")):SendKeyEvent(true, "E", false, game);
								wait(1.5);
								(game:GetService("VirtualInputManager")):SendKeyEvent(false, "E", false, game);
							else
								TweenPlayer(CFrame.new(f.PrimaryPart.Position));
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
DracoV3Toggle = DragonDojoTab:AddToggle({
	Title = "Auto Draco V3",
	Desc = "Auto Sea Event Kill Terror Shark",
	Value = _G.Settings.DragonDojo["Auto Draco V3"],
	Callback = function(state)
		_G.Settings.DragonDojo["Auto Draco V3"] = state;
		StopTween(_G.Settings.DragonDojo["Auto Draco V3"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if _G.Settings.DragonDojo["Auto Draco V3"] then
				repeat
					wait();
					_G.DangerSc = "Lv Infinite";
					_G.Settings.SeaEvent["Sail Boat"] = true;
					_G.Settings.SeaEvent["Auto Farm Terror Shark"] = true;
				until not _G.Settings.DragonDojo["Auto Draco V3"];
				_G.DangerSc = "Lv 1";
				_G.Settings.SeaEvent["Sail Boat"] = false;
				_G.Settings.SeaEvent["Auto Farm Terror Shark"] = false;
			end;
		end);
	end;
end);
RelicDracoTrialToggle = DragonDojoTab:AddToggle({
	Title = "Auto Relic Draco Trial [Beta]",
	Desc = "Auto Trial V4 - Collect the Relic yourself first",
	Value = _G.Settings.DragonDojo["Auto Relic Draco Trial"],
	Callback = function(state)
		_G.Settings.DragonDojo["Auto Relic Draco Trial"] = state;
		StopTween(_G.Settings.DragonDojo["Auto Relic Draco Trial"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.5) do
		if _G.Settings.DragonDojo["Auto Relic Draco Trial"] then
			pcall(function()
				local Root = game.Players.LocalPlayer.Character.HumanoidRootPart;
				if workspace.Map:FindFirstChild("DracoTrial") then
					game:GetService("ReplicatedStorage").Remotes.DracoTrial:InvokeServer();
					wait(0.5);
					repeat wait(); TweenPlayer(CFrame.new(-39934.9765625, 10685.359375, 22999.34375));
					until not _G.Settings.DragonDojo["Auto Relic Draco Trial"] or (Root.Position - CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position).Magnitude <= 10;
					repeat wait(); TweenPlayer(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625));
					until not _G.Settings.DragonDojo["Auto Relic Draco Trial"] or (Root.Position - CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position).Magnitude <= 10;
					wait(2.5);
					repeat wait(); TweenPlayer(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375));
					until not _G.Settings.DragonDojo["Auto Relic Draco Trial"] or (Root.Position - CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position).Magnitude <= 10;
					repeat wait(); TweenPlayer(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375));
					until not _G.Settings.DragonDojo["Auto Relic Draco Trial"] or (Root.Position - CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position).Magnitude <= 10;
					wait(2.5);
					repeat wait(); TweenPlayer(CFrame.new(-39908.5, 10685.405273438, 22990.04296875));
					until not _G.Settings.DragonDojo["Auto Relic Draco Trial"] or (Root.Position - CFrame.new(-39908.5, 10685.405273438, 22990.04296875).Position).Magnitude <= 10;
					repeat wait(); TweenPlayer(CFrame.new(-39609.5, 9376.400390625, 23472.94335975));
					until not _G.Settings.DragonDojo["Auto Relic Draco Trial"] or (Root.Position - CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position).Magnitude <= 10;
				else
					local tp = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
					if tp and tp:IsA("Part") then
						TweenPlayer(CFrame.new(tp.Position));
					end;
				end;
			end);
		end;
	end;
end);
local function CheckShark()
	for _, v in pairs(workspace:GetChildren()) do
		if v.Name == "Shark" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	for _, v in pairs(workspace:GetDescendants()) do
		if (v.Name == "Shark" or v.Name == "Bull Shark") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;
local function CheckTerrorShark()
	for _, v in pairs(workspace:GetChildren()) do
		if (v.Name == "Terror Shark" or v.Name == "TerrorShark") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;
local function CheckFishCrew()
	for _, v in pairs(workspace.Enemies:GetChildren()) do
		if (string.find(v.Name, "Fish") or string.find(v.Name, "Crew")) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;
local function CheckPiranha()
	for _, v in pairs(workspace:GetChildren()) do
		if v.Name == "Piranha" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;
local function CheckEnemiesBoat()
	for _, v in pairs(workspace:GetDescendants()) do
		if (string.find(v.Name, "Pirate") or string.find(v.Name, "Marine")) and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			local hrp = v:FindFirstChild("HumanoidRootPart");
			if hrp then
				local plrHrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
				if plrHrp and (hrp.Position - plrHrp.Position).Magnitude < 500 then return true; end;
			end;
		end;
	end;
	return false;
end;
local function CheckPirateGrandBrigade()
	for _, v in pairs(workspace:GetDescendants()) do
		if string.find(v.Name, "Grand Brigade") and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;
local function CheckHauntedCrew()
	for _, v in pairs(workspace.Enemies:GetChildren()) do
		if (string.find(v.Name, "Haunted") or v.Name == "Ghost" or v.Name == "Pirate Ghost") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;
local function CheckLeviathan()
	for _, v in pairs(workspace:GetChildren()) do
		if string.find(v.Name, "Leviathan") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true; end;
	end;
	return false;
end;

SeaEventTab:AddSection(" Sea Event - Setting Sail");

ChooseBoatDropdown = SeaEventTab:AddDropdown({
	Title = "Choose Boat",
	Desc = "Tipo de barco para comprar e usar",
	Values = {"Guardian","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop","Beast Hunter"},
	Value = _G.Settings.SeaEvent["Selected Boat"] or "Guardian",
	Callback = function(option)
		_G.Settings.SeaEvent["Selected Boat"] = option;
		_G.SelectedBoat = option;
		(getgenv()).SaveSetting();
	end
});

ChooseZoneDropdown = SeaEventTab:AddDropdown({
	Title = "Choose Zone (Sea 3)",
	Desc = "Nivel de perigo para navegar (Sea 3 apenas)",
	Values = {"Lv 1","Lv 2","Lv 3","Lv 4","Lv 5","Lv 6","Lv Infinite"},
	Value = "Lv 1",
	Callback = function(option)
		_G.DangerSc = option;
	end
});

local BoatSpeedSlider = SeaEventTab:AddSlider({
	Title = "Boat Speed",
	Desc = "Velocidade do barco (padrao: 300)",
	Min = 10,
	Max = 350,
	Default = 300,
	Callback = function(v)
		_G.SetSpeedBoat = v;
		_G.Settings.SeaEvent["Boat Tween Speed"] = v;
	end
});

SeaEventTab:AddToggle({
	Title = "Activate Boat Speed",
	Desc = "Aplica velocidade customizada no barco em tempo real",
	Value = false,
	Callback = function(v)
		_G.SpeedBoat = v;
	end
});
task.spawn(function()
	while task.wait(0.1) do
		if not _G.SpeedBoat then continue; end;
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return; end;
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hum or not hum.Sit then return; end;
			local spd = _G.SetSpeedBoat or 300;
			for _, boat in pairs(workspace.Boats:GetChildren()) do
				local seat = boat:FindFirstChildWhichIsA("VehicleSeat");
				if seat then
					seat.MaxSpeed = spd;
					seat.Torque   = 30;
					seat.TurnSpeed = 10;
				end;
			end;
		end);
	end;
end);

local _BOAT_DEALER_CF = CFrame.new(-16927.451, 9.086, 433.864);
local _DANGER_ZONES = {
	["Lv 1"]        = CFrame.new(-21998.375, 30.0006084, -682.309143),
	["Lv 2"]        = CFrame.new(-26779.5215, 30.0005474, -822.858032),
	["Lv 3"]        = CFrame.new(-31171.957, 30.0001011, -2256.93774),
	["Lv 4"]        = CFrame.new(-34054.6875, 30.2187767, -2560.12012),
	["Lv 5"]        = CFrame.new(-38887.5547, 30.0004578, -2162.99023),
	["Lv 6"]        = CFrame.new(-44541.7617, 30.0003204, -1244.8584),
	["Lv Infinite"] = CFrame.new(-148073.36, 9.0, 7721.05),
};

_G.SailBoat = false;
_G.SailBoats = false;

local _SAIL_WAYPOINT_A = CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581E-9, 0.967632651, 2.87320709E-8, 1, 3.21888249E-9, -0.967632651, 2.86144175E-8, -0.252362996);
local _SAIL_WAYPOINT_B = CFrame.new(-42250.2227, -0.3221744, 9247.07715, -0.45916447, 6.39043236E-8, 0.888351262, -3.36711423E-8, 1, -8.93395651E-8, -0.888351262, -7.09333605E-8, -0.45916447);

local function _TweenBoatTo(targetCF)
	pcall(function()
		local plr = game.Players.LocalPlayer;
		local char = plr.Character;
		if not char then return; end;
		local hum = char:FindFirstChildOfClass("Humanoid");
		if not hum then return; end;
		local selectedBoat = _G.Settings.SeaEvent["Selected Boat"] or "Guardian";
		local boat = nil;
		for _, b in pairs(workspace.Boats:GetChildren()) do
			if b.Name == selectedBoat then
				local own = b:FindFirstChild("OwnerName") or b:FindFirstChild("Owner");
				if own and own.Value == plr.Name then boat = b; break; end;
			end;
		end;
		if not boat then return; end;
		local seat = boat:FindFirstChildWhichIsA("VehicleSeat");
		if not seat then return; end;
		local dist = (targetCF.Position - seat.Position).Magnitude;
		local spd = _G.SetSpeedBoat or _G.Settings.SeaEvent["Boat Tween Speed"] or 300;
		local tweenInfo = TweenInfo.new(dist / spd, Enum.EasingStyle.Linear);
		local tw = TweenService:Create(seat, tweenInfo, {CFrame = targetCF});
		tw:Play();
		local elapsed = 0;
		while tw.PlaybackState == Enum.PlaybackState.Playing do
			elapsed = elapsed + 0.05;
			if not _G.SailBoat or elapsed > (dist / spd) + 5 then tw:Cancel(); break; end;
			task.wait(0.05);
		end;
	end);
end;

local function _hasSeaEnemy()
	return (CheckShark() and _G.Settings.SeaEvent["Auto Farm Shark"])
		or (CheckTerrorShark() and _G.Settings.SeaEvent["Auto Farm Terrorshark"])
		or (CheckFishCrew() and _G.Settings.SeaEvent["Auto Farm Fish Crew Member"])
		or (CheckPiranha() and _G.Settings.SeaEvent["Auto Farm Piranha"])
		or (CheckSeaBeast() and _G.Settings.SeaEvent["Auto Farm Seabeasts"])
		or (CheckEnemiesBoat() and _G.Settings.SeaEvent["Auto Farm Pirate Brigade"])
		or (CheckPirateGrandBrigade() and _G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"])
		or (CheckHauntedCrew() and _G.Settings.SeaEvent["Auto Farm Ghost Ship"])
		or (CheckLeviathan() and _G.Settings.SeaEvent["Auto Farm Seabeasts"]);
end;

SailSeaToggle = SeaEventTab:AddToggle({
	Title = "Sail Sea",
	Desc = "Compra barco, monta e navega automaticamente entre zonas atacando eventos do mar. Para ao encontrar inimigos.",
	Value = false,
	Callback = function(state)
		_G.SailBoat = state;
		_G.SailBoats = state;
		_G.Settings.SeaEvent["Sail Boat"] = state;
		(getgenv()).SaveSetting();
	end
});

task.spawn(function()
	while task.wait(0.3) do
		if not _G.SailBoat then continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local char = plr.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return; end;
			local selectedBoat = _G.Settings.SeaEvent["Selected Boat"] or "Guardian";

			local myBoat = nil;
			for _, b in pairs(workspace.Boats:GetChildren()) do
				if b.Name == selectedBoat then
					local own = b:FindFirstChild("OwnerName") or b:FindFirstChild("Owner");
					if own and own.Value == plr.Name then myBoat = b; break; end;
				end;
			end;

			if not myBoat then
				TweenPlayer(_BOAT_DEALER_CF);
				local tw = 0;
				repeat task.wait(0.2); tw = tw + 0.2;
				until (hrp.Position - _BOAT_DEALER_CF.Position).Magnitude < 15 or tw > 15 or not _G.SailBoat;
				if not _G.SailBoat then return; end;
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", selectedBoat);
				task.wait(1);
				return;
			end;

			if myBoat and not hum.Sit then
				local seat = myBoat:FindFirstChildWhichIsA("VehicleSeat");
				if seat then
					hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0);
					task.wait(0.5);
				end;
				return;
			end;

			if _hasSeaEnemy() then return; end;

			for _, d in pairs(workspace.Boats:GetDescendants()) do
				if d:IsA("BasePart") then d.CanCollide = false; end;
			end;
			local zoneCF = _DANGER_ZONES[_G.DangerSc or "Lv 1"] or _DANGER_ZONES["Lv 1"];

			if not _G.SailCurrentWP or _G.SailCurrentWP == "B" then
				_G.SailCurrentWP = "A";
				_TweenBoatTo(_SAIL_WAYPOINT_A);
			else
				_G.SailCurrentWP = "B";
				_TweenBoatTo(_SAIL_WAYPOINT_B);
			end;
		end);
	end;
end);

SeaEventTab:AddButton({
	Title = "Bring Boat",
	Desc = "Teleporta o barco selecionado ate a sua posicao atual.",
	Callback = function()
		pcall(function()
			local selectedBoat = _G.Settings.SeaEvent["Selected Boat"] or "Guardian";
			local boat = workspace.Boats:FindFirstChild(selectedBoat);
			local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
			if boat and hrp then
				boat:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(0,0,-15));
			end;
		end);
	end
});

spawn(function()
	while wait(0.1) do
		pcall(function()
			for _, boat in pairs(workspace.Boats:GetChildren()) do
				for _, part in pairs(boat:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false;
					end;
				end;
			end;
		end);
	end;
end);

SeaEventEnemiesSection = SeaEventTab:AddSection("Enemies Sea");
AutoFarmSharkToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Shark",
	Value = _G.Settings.SeaEvent["Auto Farm Shark"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Shark"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Shark"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmPiranhaToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Piranha",
	Value = _G.Settings.SeaEvent["Auto Farm Piranha"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Piranha"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Piranha"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmFishCrewMemberToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Fish Crew Member",
	Value = _G.Settings.SeaEvent["Auto Farm Fish Crew Member"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Fish Crew Member"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Fish Crew Member"]);
		(getgenv()).SaveSetting();
	end
});
SeaEventBoatSection = SeaEventTab:AddSection("Enemies Sea (Boat)");
AutoFarmGhostShipToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Ghost Ship",
	Value = _G.Settings.SeaEvent["Auto Farm Ghost Ship"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Ghost Ship"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Ghost Ship"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmPirateBrigadeToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Pirate Brigade",
	Value = _G.Settings.SeaEvent["Auto Farm Pirate Brigade"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Pirate Brigade"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Pirate Brigade"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmPirateGrandBrigadeToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Pirate Grand Brigade",
	Value = _G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"]);
		(getgenv()).SaveSetting();
	end
});
SeaEventBossSection = SeaEventTab:AddSection("Enemies Sea (Boss)");
AutoFarmTerrorsharkToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Terrorshark",
	Value = _G.Settings.SeaEvent["Auto Farm Terrorshark"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Terrorshark"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Terrorshark"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmSeabeastsToggle = SeaEventTab:AddToggle({
	Title = "Auto Farm Seabeasts",
	Value = _G.Settings.SeaEvent["Auto Farm Seabeasts"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Seabeasts"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Seabeasts"]);
		(getgenv()).SaveSetting();
	end
});
SeaStackSection = SeaStackTab:AddSection("Islands");
spawn(function()
	pcall(function()
		while wait(0.2) do
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
				MirageStatusSeaStackParagraph:SetDesc("Mirage Island Spawning");
			else
				MirageStatusSeaStackParagraph:SetDesc("Mirage Island Not Spawn");
			end;
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
				KitsuneStatusSeaStackParagraph:SetDesc("Kitsune Island Spawning");
			else
				KitsuneStatusSeaStackParagraph:SetDesc("Kitsune Island Not Spawn");
			end;
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				FrozenStatusSeaStackParagraph:SetDesc("Frozen Dimension Spawning");
			else
				FrozenStatusSeaStackParagraph:SetDesc("Frozen Dimension Not Spawn");
			end;
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				PrehistoricStatusSeaStackParagraph:SetDesc("Prehistoric Island Spawning");
			else
				PrehistoricStatusSeaStackParagraph:SetDesc("Prehistoric Island Not Spawn");
			end;
		end;
	end);
end);
PrehistoricStatusSeaStackParagraph = SeaStackTab:AddParagraph({
	Title = "Prehistoric Status",
	Desc = "N/A"
});
AutoSummonPrehistoricIslandToggle = SeaStackTab:AddToggle({
	Title = "Summon Prehistoric Island",
	Desc = "Need Volcanic Magnet",
	Value = _G.Settings.SeaStack["Summon Prehistoric Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Summon Prehistoric Island"] = state;
		StopTween(_G.Settings.SeaStack["Summon Prehistoric Island"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.SeaStack["Summon Prehistoric Island"] and World3 then
				if not (game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"]) then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoat = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoat then
							BuyBoat:Stop();
						end;
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBoat", _G.Settings.SeaEvent["Selected Boat"]);
						wait(1);
					end;
				elseif (game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"]) then
					repeat
						wait();
						if (game.Players.LocalPlayer.Character:WaitForChild("Humanoid")).Sit == false then
							if TweenBoatPrehistoric then
								TweenBoatPrehistoric:Stop();
							end;
							local stoppos = TweenPlayer(((game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"])).VehicleSeat.CFrame * CFrame.new(0, 1, 0));
						elseif (game.Players.LocalPlayer.Character:WaitForChild("Humanoid")).Sit == true then
							TweenBoatPrehistoric = TweenBoat(CFrame.new(-148073.359, 8.99999523, 7721.05078, -0.0825930536, -0.00000154416148, 0.996583343, -0.000018696026, 1, -0.000000000000391858095, -0.996583343, -0.0000186321486, -0.0825930536));
						end;
					until not _G.Settings.SeaStack["Summon Prehistoric Island"] or game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island");
					if TweenBoatPrehistoric then
						TweenBoatPrehistoric:Stop();
					end;
				end;
			end;
		end);
	end;
end);
TweenToPrehistoricIslandToggle = SeaStackTab:AddToggle({
	Title = "Tween To Prehistoric Island",
	Desc = "Need Spawn",
	Value = _G.Settings.SeaStack["Tween To Prehistoric Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Tween To Prehistoric Island"] = state;
		StopTween(_G.Settings.SeaStack["Tween To Prehistoric Island"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait() do
		if _G.Settings.SeaStack["Tween To Prehistoric Island"] then
			pcall(function()
				if (game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
					TweenPlayer(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")).CFrame);
				end;
			end);
		end;
	end;
end);
AutoKillLavaGolemToggle = SeaStackTab:AddToggle({
	Title = "Auto Kill Lava Golem",
	Value = _G.Settings.SeaStack["Auto Kill Lava Golem"],
	Callback = function(state)
		_G.Settings.SeaStack["Auto Kill Lava Golem"] = state;
		StopTween(_G.Settings.SeaStack["Auto Kill Lava Golem"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.DragonDojo["Auto Kill Lava Golem"] and World3 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Lava Golem") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Lava Golem" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								_G._farmMobTarget = v;
								repeat
									task.wait(0.15);
									AutoHaki();
									EquipWeapon(_G.Settings.SeaStack["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.Settings.DragonDojo["Auto Kill Lava Golem"] or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
FrozenStatusSeaStackParagraph = SeaStackTab:AddParagraph({
	Title = "Frozen Status",
	Desc = "N/A"
});
AutoSummonFrozenDimensionToggle = SeaStackTab:AddToggle({
	Title = "Summon Frozen Dimension",
	Value = _G.Settings.SeaStack["Summon Frozen Dimension"],
	Callback = function(state)
		_G.Settings.SeaStack["Summon Frozen Dimension"] = state;
		StopTween(_G.Settings.SeaStack["Summon Frozen Dimension"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.SeaStack["Summon Frozen Dimension"] and World3 then
				if not (game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"]) then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoat = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoat then
							BuyBoat:Stop();
						end;
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBoat", _G.Settings.SeaEvent["Selected Boat"]);
						wait(1);
					end;
				elseif (game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"]) then
					repeat
						wait();
						if (game.Players.LocalPlayer.Character:WaitForChild("Humanoid")).Sit == false then
							if TweenBoatFrozen then
								TweenBoatFrozen:Stop();
							end;
							local stoppos = TweenPlayer(((game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"])).VehicleSeat.CFrame * CFrame.new(0, 1, 0));
						elseif (game.Players.LocalPlayer.Character:WaitForChild("Humanoid")).Sit == true then
							TweenBoatFrozen = TweenBoat(CFrame.new(-148073.359, 8.99999523, 7721.05078, -0.0825930536, -0.00000154416148, 0.996583343, -0.000018696026, 1, -0.000000000000391858095, -0.996583343, -0.0000186321486, -0.0825930536));
						end;
					until not _G.Settings.SeaStack["Summon Frozen Dimension"] or game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension");
					if TweenBoatFrozen then
						TweenBoatFrozen:Stop();
					end;
				end;
			end;
		end);
	end;
end);
TweenToFrozenDimensionToggle = SeaStackTab:AddToggle({
	Title = "Tween To Frozen Dimension",
	Value = _G.Settings.SeaStack["Tween To Frozen Dimension"],
	Callback = function(state)
		_G.Settings.SeaStack["Tween To Frozen Dimension"] = state;
		StopTween(_G.Settings.SeaStack["Tween To Frozen Dimension"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.SeaStack["Tween To Frozen Dimension"] then
			pcall(function()
				repeat
					wait();
					TweenPlayer(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")).CFrame);
				until not _G.Settings.SeaStack["Tween To Frozen Dimension"];
			end);
		end;
	end;
end);
BribeLeviathanStatusParagraph = SeaStackTab:AddParagraph({
	Title = "Leviathan Status",
	Desc = "0"
});
BribeLeviathanButton = SeaStackTab:AddButton({
	Title = "Bribe Leviathan",
	Callback = function()
		local Status = (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("InfoLeviathan", "2");
		BribeLeviathanStatusParagraph:SetDesc(Status);
	end
});

SeaStackTab:AddToggle({
	Title = "Auto Active Leviathan",
	Desc = "Quando encontrar a ilha do Leviathan, vai ate o NPC e ativa ele automaticamente.",
	Value = false,
	Callback = function(state)
		_G.AutoActivateLeviathan = state;
	end
});
task.spawn(function()
	while task.wait(0.5) do
		if not _G.AutoActivateLeviathan then continue end
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return end
			local hrp = char:FindFirstChild("HumanoidRootPart");
			if not hrp then return end

			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and (v.Name:lower():find("leviathan") or v.Name:lower():find("bribe")) then
					local npcRoot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChildWhichIsA("BasePart");
					if npcRoot then
						local dist = (hrp.Position - npcRoot.Position).Magnitude;
						if dist > 20 then
							TweenPlayer(npcRoot.CFrame);
						else

							pcall(function()
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ActivateLeviathan");
							end)
							pcall(function()
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "1");
							end)
						end
					end
				end
			end
		end)
	end
end);

SeaStackTab:AddToggle({
	Title = "Auto Kill Leviathan",
	Desc = "Detecta as caudas do Leviathan vivas e vai ate elas spammando todas as skills (Z X C V F).",
	Value = false,
	Callback = function(state)
		_G.AutoKillLeviathan = state;
	end
});
task.spawn(function()
	while task.wait(0.1) do
		if not _G.AutoKillLeviathan then continue end
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return end
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return end

			local closestTail = nil;
			local closestDist = math.huge;
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v.Name:lower():find("tail") then
					local tailHum = v:FindFirstChildOfClass("Humanoid");
					if tailHum and tailHum.Health > 0 then
						local tailRoot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChildWhichIsA("BasePart");
						if tailRoot then
							local dist = (hrp.Position - tailRoot.Position).Magnitude;
							if dist < closestDist then
								closestDist = dist;
								closestTail = tailRoot;
							end
						end
					end
				end
			end
			if closestTail then
				if closestDist > 30 then
					TweenPlayer(closestTail.CFrame * CFrame.new(0, 5, -10));
				else

					local VirtualUser = game:GetService("VirtualUser");
					hrp.CFrame = CFrame.lookAt(hrp.Position, closestTail.Position);

					local skillKeys = {"Z","X","C","V","F"};
					for _, key in pairs(skillKeys) do
						pcall(function()
							VirtualUser:CaptureController();
							VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame);
							task.wait(0.05);
						end)
						pcall(function()
							game:GetService("UserInputService");
							local inputObject = InputObject.new();
						end)

						pcall(function()
							game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game);
							task.wait(0.08);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game);
						end)
					end
				end
			end
		end)
	end
end);

SeaStackTab:AddToggle({
	Title = "Auto Get Heart Leviathan",
	Desc = "Quando Leviathan morrer, pega barco Beast Hunter, centraliza no local e atira no coracao.",
	Value = false,
	Callback = function(state)
		_G.AutoGetHeartLeviathan = state;
	end
});
task.spawn(function()
	while task.wait(0.5) do
		if not _G.AutoGetHeartLeviathan then continue end
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return end
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return end

			local beastHunter = nil;
			for _, b in pairs(workspace.Boats:GetChildren()) do
				if b.Name == "Beast Hunter" then
					local own = b:FindFirstChild("OwnerName") or b:FindFirstChild("Owner");
					if own and own.Value == game.Players.LocalPlayer.Name then
						beastHunter = b; break;
					end
				end
			end

			if not beastHunter then
				TweenPlayer(_BOAT_DEALER_CF);
				local tw = 0;
				repeat task.wait(0.2); tw = tw + 0.2;
				until (hrp.Position - _BOAT_DEALER_CF.Position).Magnitude < 20 or tw > 15;
				task.wait(0.3);
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Beast Hunter");
				task.wait(2);
				for _, b in pairs(workspace.Boats:GetChildren()) do
					if b.Name == "Beast Hunter" then
						local own = b:FindFirstChild("OwnerName") or b:FindFirstChild("Owner");
						if own and own.Value == game.Players.LocalPlayer.Name then
							beastHunter = b; break;
						end
					end
				end
			end
			if not beastHunter then return end

			local leviathanHeart = nil;
			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name:lower():find("heart") and v:IsA("BasePart") then
					leviathanHeart = v; break;
				end
			end
			if not leviathanHeart then return end

			if not hum.Sit then
				local seat = beastHunter:FindFirstChildWhichIsA("VehicleSeat");
				if seat then
					hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0);
					task.wait(0.8);
				end
				return;
			end

			local heartPos = leviathanHeart.Position;
			local targetCF = CFrame.new(heartPos.X, heartPos.Y - 10, heartPos.Z);
			local boatSeat = beastHunter:FindFirstChildWhichIsA("VehicleSeat");
			if boatSeat then
				local boatPos = boatSeat.Position;
				local distToHeart = (boatPos - heartPos).Magnitude;
				if distToHeart > 50 then
					TweenBoat(targetCF);
				else

					if distToHeart <= 15 then

						for _, v in pairs(workspace:GetDescendants()) do
							if v:IsA("Seat") and v.Name:lower():find("cannon") then
								hrp.CFrame = v.CFrame * CFrame.new(0, 1, 0);
								task.wait(0.5);

								pcall(function()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("FireCannon", leviathanHeart.Position);
								end)

								task.wait(1);
								local stillExists = false;
								for _, p in pairs(workspace:GetDescendants()) do
									if p.Name:lower():find("heart") and p:IsA("BasePart") then
										stillExists = true; break;
									end
								end
								if not stillExists then
									_G.AutoGetHeartLeviathan = false;
								end
								break;
							end
						end
					end
				end
			end
		end)
	end
end);

local _leviathanIslandList = {"Cachoeira Hydra", "Tiki Outpost"};
local _leviathanIslandCFrames = {
	["Cachoeira Hydra"] = CFrame.new(-44541.7617, 30.0003204, -1244.8584),
	["Tiki Outpost"] = CFrame.new(-16927.451, 9.086, 433.864),
};
SeaStackTab:AddDropdown({
	Title = "Auto Drive Boat - Ilha Destino",
	Desc = "Selecione a ilha de destino para o Auto Drive Boat",
	Values = _leviathanIslandList,
	Value = "Tiki Outpost",
	Callback = function(opt)
		_G.AutoDriveBoatIsland = opt;
	end
});
SeaStackTab:AddToggle({
	Title = "Auto Drive Boat",
	Desc = "Monta no barco Beast Hunter mais proximo e vai via Tween para a ilha selecionada.",
	Value = false,
	Callback = function(state)
		_G.AutoDriveBoat = state;
	end
});
task.spawn(function()
	while task.wait(0.5) do
		if not _G.AutoDriveBoat then continue end
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return end
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return end

			local closestBoat = nil;
			local closestDist = math.huge;
			for _, b in pairs(workspace.Boats:GetChildren()) do
				if b.Name == "Beast Hunter" then
					local seat = b:FindFirstChildWhichIsA("VehicleSeat");
					if seat then
						local dist = (hrp.Position - seat.Position).Magnitude;
						if dist < closestDist then
							closestDist = dist;
							closestBoat = b;
						end
					end
				end
			end
			if not closestBoat then return end

			if not hum.Sit then
				local seat = closestBoat:FindFirstChildWhichIsA("VehicleSeat");
				if seat then
					hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0);
					task.wait(0.8);
				end
				return;
			end

			local islandName = _G.AutoDriveBoatIsland or "Tiki Outpost";
			local islandCF = _leviathanIslandCFrames[islandName];
			if islandCF then
				local dist = (hrp.Position - islandCF.Position).Magnitude;
				if dist > 200 then
					TweenBoat(islandCF);
				else

					_G.AutoDriveBoat = false;
				end
			end
		end)
	end
end);
KitsuneStatusSeaStackParagraph = SeaStackTab:AddParagraph({
	Title = "Kitsune Status",
	Desc = "N/A"
});
AutoSummonKitsuneIslandToggle = SeaStackTab:AddToggle({
	Title = "Summon Kitsune Island",
	Value = _G.Settings.SeaStack["Summon Kitsune Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Summon Kitsune Island"] = state;
		StopTween(_G.Settings.SeaStack["Summon Kitsune Island"]);
		(getgenv()).SaveSetting();
	end
});
TweenToKitsuneIslandToggle = SeaStackTab:AddToggle({
	Title = "Tween To Kitsune Island",
	Value = _G.Settings.SeaStack["Tween To Kitsune Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Tween To Kitsune Island"] = state;
		StopTween(_G.Settings.SeaStack["Tween To Kitsune Island"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.SeaStack["Tween To Kitsune Island"] and World3 then
			if (game:GetService("Workspace")).Map:FindFirstChild("KitsuneIsland") then
				TweenPlayer(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0, 0, 10));
			end;
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.SeaStack["Summon Kitsune Island"] and World3 then
				if not (game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"]) then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoatKitsune = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoatKitsune then
							BuyBoatKitsune:Stop();
						end;
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBoat", _G.Settings.SeaEvent["Selected Boat"]);
						wait(1);
					end;
				elseif (game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"]) then
					repeat
						wait();
						if (game.Players.LocalPlayer.Character:WaitForChild("Humanoid")).Sit == false then
							if TweenBoatKitsune then
								TweenBoatKitsune:Stop();
							end;
							local stoppos = TweenPlayer(((game:GetService("Workspace")).Boats:FindFirstChild(_G.Settings.SeaEvent["Selected Boat"])).VehicleSeat.CFrame * CFrame.new(0, 1, 0));
						elseif (game.Players.LocalPlayer.Character:WaitForChild("Humanoid")).Sit == true then
							TweenBoatKitsune = TweenBoat(CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 0.000000000202319411, -0.99428153, -0.0651681125, -0.0846010372));
						end;
					until not _G.Settings.SeaStack["Summon Kitsune Island"] or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island");
					if TweenBoatKitsune then
						TweenBoatKitsune:Stop();
					end;
				end;
			end;
		end);
	end;
end);
AutoCollectAzureEmberToggle = SeaStackTab:AddToggle({
	Title = "Auto Collect Azure Ember",
	Value = _G.Settings.SeaStack["Auto Collect Azure Ember"],
	Callback = function(state)
		_G.Settings.SeaStack["Auto Collect Azure Ember"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.SeaStack["Auto Collect Azure Ember"] and World3 then
			pcall(function()
				if (game:GetService("Workspace")):FindFirstChild("AttachedAzureEmber") then
					TweenPlayer((((game:GetService("Workspace")):WaitForChild("EmberTemplate")):FindFirstChild("Part")).CFrame);
				end;
			end);
		end;
	end;
end);
SetAzureEmberSlider = SeaStackTab:AddSlider({
	Title = "Set Azure Ember",
	Step = 1,
	Value = {
		Min = 1,
		Max = 25,
		Default = _G.Settings.SeaStack["Set Azure Ember"] or 0
	},
	Callback = function(value)
		_G.Settings.SeaStack["Set Azure Ember"] = value;
		(getgenv()).SaveSetting();
	end
});
AutoTradeAzureEmberToggle = SeaStackTab:AddToggle({
	Title = "Auto Trade Azure Ember",
	Value = _G.Settings.SeaStack["Auto Trade Azure Ember"],
	Callback = function(state)
		_G.Settings.SeaStack["Auto Trade Azure Ember"] = state;
		(getgenv()).SaveSetting();
	end
});
function GetCountMaterials(MaterialName)
	local Inventory = (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("getInventory");
	for i, v in pairs(Inventory) do
		if v.Name == MaterialName then
			return v.Count;
		end;
	end;
end;
spawn(function()
	while wait(0.2) do
		if _G.Settings.SeaStack["Auto Trade Azure Ember"] and World3 then
			pcall(function()
				local AzureAvilable = GetCountMaterials("Azure Ember");
				if AzureAvilable >= _G.Settings.SeaStack["Set Azure Ember"] then
					((game:GetService("ReplicatedStorage")).Modules.Net:FindFirstChild("RF/KitsuneStatuePray")):InvokeServer();
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("KitsuneStatuePray");
				end;
			end);
		end;
	end;
end);
MirageStatusSeaStackParagraph = SeaStackTab:AddParagraph({
	Title = "Mirage Status",
	Desc = "N/A"
});
TweenToMirageIslandToggle = SeaStackTab:AddToggle({
	Title = "Tween To Mirage Island",
	Value = _G.Settings.SeaStack["Tween To Mirage Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Tween To Mirage Island"] = state;
		StopTween(_G.Settings.SeaStack["Tween To Mirage Island"]);
		(getgenv()).SaveSetting();
	end
});

_G.FindMirage = _G.FindMirage or false;
_G.AutoBlueGear = _G.AutoBlueGear or false;

SeaStackTab:AddSection("MIRAGE ISLAND");

SeaStackTab:AddToggle({
	Title = "Auto Find Mirage Island",
	Desc = "Compra barco na Tiki, vai ao mar Lv 4, patrulha ate Mirage spawnar. Se barco quebrar, reseta e recomeca.",
	Value = _G.Settings.SeaStack["Auto Find Mirage"] or false,
	Callback = function(state)
		_G.FindMirage = state;
		if _G.Settings and _G.Settings.SeaStack then _G.Settings.SeaStack["Auto Find Mirage"] = state; (getgenv()).SaveSetting(); end;
	end
});
spawn(function()
	while wait(0.5) do
		pcall(function()
			if not _G.FindMirage then return; end;
			local plr = game.Players.LocalPlayer;
			local char = plr.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if not hrp or not hum then return; end;
			local mirage = workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island");
			if mirage then
				TweenPlayer(mirage.CFrame);
				return;
			end;
			local selectedBoat = _G.Settings.SeaEvent["Selected Boat"] or "Guardian";
			local boat = nil;
			for _, b in pairs(workspace.Boats:GetChildren()) do
				if b.Name == selectedBoat then
					local owner = b:FindFirstChild("OwnerName") or b:FindFirstChild("Owner");
					if not owner or owner.Value == plr.Name then boat = b; break; end;
				end;
			end;
			if not boat then
				local _TIKI_NPC_CF = CFrame.new(-16927.451, 9.086, 433.864);
				TweenPlayer(_TIKI_NPC_CF);
				task.wait(2);
				if (hrp.Position - _TIKI_NPC_CF.Position).Magnitude < 30 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", selectedBoat);
					task.wait(1.5);
				end;
				return;
			end;
			if not hum.Sit then
				local seat = boat:FindFirstChildWhichIsA("VehicleSeat");
				if seat then hrp.CFrame = seat.CFrame * CFrame.new(0,1.5,0); end;
				return;
			end;
			local _MIRAGE_PATROL_CF = CFrame.new(-34054.6875, 30.22, -2560.12);
			local _MIRAGE_PATROL_CF2 = CFrame.new(-38887.5547, 30.0, -2162.99);
			local patrolTarget = (hrp.Position - _MIRAGE_PATROL_CF.Position).Magnitude < 500 and _MIRAGE_PATROL_CF2 or _MIRAGE_PATROL_CF;
			TweenBoat(patrolTarget);
		end);
	end;
end);

SeaStackTab:AddToggle({
	Title = "Auto Blue Gear",
	Desc = "Vai ao ponto mais alto da Mirage, olha fixamente para a lua. Quando a lua brilhar a noite, teleporta para a engrenagem.",
	Value = _G.Settings.SeaStack["Auto Blue Gear"] or false,
	Callback = function(state)
		_G.AutoBlueGear = state;
		if _G.Settings and _G.Settings.SeaStack then _G.Settings.SeaStack["Auto Blue Gear"] = state; (getgenv()).SaveSetting(); end;
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if not _G.AutoBlueGear then continue; end;
			local mystic = workspace.Map:FindFirstChild("MysticIsland");
			if not mystic then continue; end;
			local highPoint = GetHighestPoint and GetHighestPoint();
			if not highPoint then continue; end;
			local plr = game.Players.LocalPlayer;
			local char = plr.Character;
			if not char then continue; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			if not hrp then continue; end;
			TweenPlayer(highPoint.CFrame * CFrame.new(0, 211.88, 0));
			local moonDir = game.Lighting:GetMoonDirection();
			local lookAtPos = hrp.Position + moonDir * 100;
			workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.p, lookAtPos);
			local nightTime = game.Lighting.ClockTime >= 18 or game.Lighting.ClockTime <= 6;
			if nightTime then
				for _, v in pairs(mystic:GetDescendants()) do
					if v:IsA("MeshPart") and v.Material == Enum.Material.Neon and v.BrickColor == BrickColor.new("Bright blue") then
						hrp.CFrame = v.CFrame;
						task.wait(0.2);
						pcall(function()
							Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Quest completa!", Icon = "bell", Duration = 6});
						end);
						_G.AutoBlueGear = false;
						if _G.Settings and _G.Settings.SeaStack then _G.Settings.SeaStack["Auto Blue Gear"] = false; (getgenv()).SaveSetting(); end;
						return;
					end;
				end;
				for _, v in pairs(mystic:GetDescendants()) do
					if v:IsA("MeshPart") and v.Material == Enum.Material.Neon then
						hrp.CFrame = v.CFrame;
						task.wait(0.2);
						pcall(function()
							Library:Notify({Title = "Abacaxi Hub - Blox Fruit", Content = "Quest completa!", Icon = "bell", Duration = 6});
						end);
						_G.AutoBlueGear = false;
						if _G.Settings and _G.Settings.SeaStack then _G.Settings.SeaStack["Auto Blue Gear"] = false; (getgenv()).SaveSetting(); end;
						return;
					end;
				end;
			end;
		end;
	end);
end);

function GetHighestPoint()
	for i, v in pairs((game:GetService("Workspace")).Map.MysticIsland:GetDescendants()) do
		if v:IsA("MeshPart") then
			if v.MeshId == "rbxassetid://83190276951914" then
				return v;
			end;
		end;
	end;
end;
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Tween To Highest Mirage"] then
				if (game:GetService("Workspace")).Map:FindFirstChild("MysticIsland") then
					TweenPlayer((GetHighestPoint()).CFrame * CFrame.new(0, 211.88, 0));
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Tween To Mirage Island"] then
				if (game:GetService("Workspace")).Map:FindFirstChild("MysticIsland") then
					TweenPlayer((GetHighestPoint()).CFrame * CFrame.new(0, 211.88, 0));
				end;
			end;
		end;
	end);
end);
SeaBeastSeaStackSection = SeaStackTab:AddSection("Sea Beasts");
AutoAttackSeaBeastsToggle = SeaStackTab:AddToggle({
	Title = "Auto Attack Seabeasts",
	Value = _G.Settings.SeaStack["Auto Attack Seabeasts"],
	Callback = function(state)
		_G.Settings.SeaStack["Auto Attack Seabeasts"] = state;
		StopTween(_G.Settings.SeaStack["Auto Attack Seabeasts"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait() do
			if _G.Settings.SeaStack["Auto Attack Seabeasts"] and (World2 or World3) then
				if (game:GetService("Workspace")):FindFirstChild("SeaBeasts") then
					for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
						if CheckSeaBeast() then
							repeat
								task.wait(0.15);
								CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0);
								if (CFrameSeaBeast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 400 then
									_G.SeaSkill = true;
								else
									_G.SeaSkill = false;
								end;
								AutoHaki();
								Skillaimbot = true;
								AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position;
								if SBAttacking then
									TweenPlayer(CFrameSeaBeast * CFrame.new(math.random(100, 300), 100, math.random(100, 300)));
								else
									TweenPlayer(CFrameSeaBeast * CFrame.new(0, 100, 0));
								end;
							until not _G.Settings.SeaEvent["Auto Attack Seabeasts"] or CheckSeaBeast() == false or (not v:FindFirstChild("Humanoid")) or (not v:FindFirstChild("HumanoidRootPart")) or v.Humanoid.Health < 0 or (not v.Parent);
							Skillaimbot = false;
							_G.SeaSkill = false;
						else
							Skillaimbot = false;
							_G.SeaSkill = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
SettingSeaSection = SeaSettingsTab:AddSection("Setting Sea");
LightningToggle = SeaSettingsTab:AddToggle({
	Title = "Lightning",
	Value = _G.Settings.SettingSea.Lightning,
	Callback = function(state)
		_G.Settings.SettingSea.Lightning = state;
	end
});
local RunService = game:GetService("RunService");
RunService.Heartbeat:Connect(function()
	local Lighting = game:GetService("Lighting");
	if _G.Settings.SettingSea.Lightning then
		Lighting.ClockTime = 12;
	end;
end);
IncreaseSpeedBoatToggle = SeaSettingsTab:AddToggle({
	Title = "Increase Speed Boat",
	Value = _G.Settings.SettingSea["Increase Speed Boat"],
	Callback = function(state)
		_G.Settings.SettingSea["Increase Speed Boat"] = state;
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			local vehicleSeats = {};
			for i, v in pairs(game.Workspace.Boats:GetDescendants()) do
				if v:IsA("VehicleSeat") then
					table.insert(vehicleSeats, v);
				end;
			end;
			if _G.Settings.SettingSea["Increase Boat Speed"] then
				for _, v in pairs(vehicleSeats) do
					v.MaxSpeed = 350;
				end;
			else
				for _, v in pairs(vehicleSeats) do
					v.MaxSpeed = 150;
				end;
			end;
		end);
	end;
end);
NoClipRockToggle = SeaSettingsTab:AddToggle({
	Title = "No Clip Rock",
	Value = _G.Settings.SettingSea["No Clip Rock"],
	Callback = function(state)
		_G.Settings.SettingSea["No Clip Rock"] = state;
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			for i, boat in pairs((game:GetService("Workspace")).Boats:GetChildren()) do
				for _, v in pairs((game:GetService("Workspace")).Boats[boat.Name]:GetDescendants()) do
					if v:IsA("BasePart") then
						if _G.Settings.SettingSea["No Clip Rock"] or _G.Settings.SeaEvent["Sail Boat"] then
							v.CanCollide = false;
						else
							v.CanCollide = true;
						end;
					end;
				end;
			end;
		end);
	end;
end);
SettingSeaSection = SeaSettingsTab:AddSection("Tools");
UseDevilFruitSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Use Devil Fruit Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Devil Fruit Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
UseMeleeSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Use Melee Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Melee Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
UseSwordSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Use Sword Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Sword Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
UseGunSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Use Gun Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Gun Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitSkillSection = SeaSettingsTab:AddSection("Devil Fruit Skill");
DevilFruitZSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Devil Fruit Z Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit Z Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitXSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Devil Fruit X Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit X Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitCSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Devil Fruit C Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit C Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitVSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Devil Fruit V Skill",
	Value = _G.Settings.SettingSea["Devil Fruit V Skill"],
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit V Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitFSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Devil Fruit F Skill",
	Value = _G.Settings.SettingSea["Devil Fruit F Skill"],
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit F Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeSkillSection = SeaSettingsTab:AddSection("Melee Skill");
MeleeZSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Melee Z Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee Z Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeXSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Melee X Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee X Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeCSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Melee C Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee C Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeVSkillToggle = SeaSettingsTab:AddToggle({
	Title = "Melee V Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee V Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DoneSkillGun = false;
DoneSkillSword = false;
DoneSkillFruit = false;
DoneSkillMelee = false;
spawn(function()
	while wait() do
		pcall(function()
			if _G.SeaSkill then
				if _G.Settings.SettingSea["Use Devil Fruit Skill"] and DoneSkillFruit == false then
					for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") then
							if v.ToolTip == "Blox Fruit" then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
							end;
						end;
					end;
					if _G.Settings.SettingSea["Devil Fruit Z Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
						wait();
						(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
					end;
					if _G.Settings.SettingSea["Devil Fruit X Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
						wait();
						(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
					end;
					if _G.Settings.SettingSea["Devil Fruit C Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "C", false, game);
						wait();
						(game:service("VirtualInputManager")):SendKeyEvent(false, "C", false, game);
					end;
					if _G.Settings.SettingSea["Devil Fruit V Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "V", false, game);
						wait();
						(game:service("VirtualInputManager")):SendKeyEvent(false, "V", false, game);
					end;
					if _G.Settings.SettingSea["Devil Fruit F Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "F", false, game);
						wait();
						(game:service("VirtualInputManager")):SendKeyEvent(false, "F", false, game);
					end;
					DoneSkillFruit = true;
				end;
				if _G.Settings.SettingSea["Use Melee Skill"] and DoneSkillMelee == false then
					for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") then
							if v.ToolTip == "Melee" then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
							end;
						end;
					end;
					if _G.Settings.SettingSea["Melee Z Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
						wait(0);
						(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
					end;
					if _G.Settings.SettingSea["Melee X Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
						wait(0);
						(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
					end;
					if _G.Settings.SettingSea["Melee C Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "C", false, game);
						wait(0);
						(game:service("VirtualInputManager")):SendKeyEvent(false, "C", false, game);
					end;
					if _G.Settings.SettingSea["Melee V Skill"] then
						(game:service("VirtualInputManager")):SendKeyEvent(true, "V", false, game);
						wait(0);
						(game:service("VirtualInputManager")):SendKeyEvent(false, "V", false, game);
					end;
					DoneSkillMelee = true;
				end;
				if _G.Settings.SettingSea["Use Sword Skill"] and DoneSkillSword == false then
					for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") then
							if v.ToolTip == "Sword" then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
							end;
						end;
					end;
					(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
					wait(0);
					(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
					(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
					wait(0);
					(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
					DoneSkillSword = true;
				end;
				if _G.Settings.SettingSea["Use Gun Skill"] and DoneSkillGun == false then
					for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") then
							if v.ToolTip == "Gun" then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
							end;
						end;
					end;
					(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
					wait(0.1);
					(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
					(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
					wait(0.1);
					(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
					DoneSkillGun = true;
				end;
				DoneSkillGun = false;
				DoneSkillSword = false;
				DoneSkillFruit = false;
				DoneSkillMelee = false;
			end;
		end);
	end;
end);
function CheckSeaBeast()
	if (game:GetService("Workspace")):FindFirstChild("SeaBeasts") then
		for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
			if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 then
				return true;
			end;
		end;
	end;
	return false;
end;
local gg = getrawmetatable(game);
local old = gg.__namecall;
setreadonly(gg, false);
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod();
	local args = {
		...
	};
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition;
					return old(unpack(args));
				end;
			end;
		end;
	end;
	return old(...);
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			if UseSkill then
				for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
					if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
						if _G.Settings.Setting["Fruit Mastery Skill Z"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
						end;
						if _G.Settings.Setting["Fruit Mastery Skill X"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
						end;
						if _G.Settings.Setting["Fruit Mastery Skill C"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "C", false, game);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "C", false, game);
						end;
						if _G.Settings.Setting["Fruit Mastery Skill V"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "V", false, game);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "V", false, game);
						end;
						if _G.Settings.Setting["Fruit Mastery Skill F"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "F", false, game);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "F", false, game);
						end;
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		pcall(function()
			if UseGunSkill then
				for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
					if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Settings.Setting["Mastery Health"] / 100 then
						if _G.Settings.Setting["Gun Mastery Skill Z"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "Z", false, game);
							wait(0.5);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "Z", false, game);
						end;
						if _G.Settings.Setting["Gun Mastery Skill X"] then
							(game:service("VirtualInputManager")):SendKeyEvent(true, "X", false, game);
							wait(0.5);
							(game:service("VirtualInputManager")):SendKeyEvent(false, "X", false, game);
						end;
					end;
				end;
			end;
		end);
	end;
end);
LocalPlayerSection = LocalPlayerTab:AddSection("Local Player");
AutoActiveRaceV3Toggle = LocalPlayerTab:AddToggle({
	Title = "Active Race V3",
	Value = _G.Settings.LocalPlayer["Active Race V3"],
	Callback = function(state)
		_G.Settings.LocalPlayer["Active Race V3"] = state;
		(getgenv()).SaveSetting();
	end
});
AutoActiveRaceV4Toggle = LocalPlayerTab:AddToggle({
	Title = "Active Race V4",
	Value = _G.Settings.LocalPlayer["Active Race V4"],
	Callback = function(state)
		_G.Settings.LocalPlayer["Active Race V4"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.LocalPlayer["Active Race V4"] then
			if tonumber(((game:GetService("Players")).LocalPlayer.Character:WaitForChild("RaceEnergy")).Value) == 1 then
				if (game:GetService("Players")).LocalPlayer.Character.RaceTransformed.Value == false then
					(game:GetService("VirtualInputManager")):SendKeyEvent(true, "Y", false, game);
					wait(0.1);
					(game:GetService("VirtualInputManager")):SendKeyEvent(false, "Y", false, game);
				end;
			end;
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait(1) do
			if _G.Settings.LocalPlayer["Active Race V3"] then
				(game:GetService("ReplicatedStorage")).Remotes.CommE:FireServer("ActivateAbility");
			end;
		end;
	end);
end);
WalkOnWaterToggle = LocalPlayerTab:AddToggle({
	Title = "Walk On Water",
	Value = _G.Settings.LocalPlayer["Walk On Water"],
	Callback = function(state)
		_G.Settings.LocalPlayer["Walk On Water"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while task.wait(0.2) do
		pcall(function()
			if _G.Settings.LocalPlayer["Walk On Water"] then
				(game:GetService("Workspace")).Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000);
			else
				(game:GetService("Workspace")).Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000);
			end;
		end);
	end;
end);
NoClipPlayerToggle = LocalPlayerTab:AddToggle({
	Title = "No Clip",
	Value = _G.Settings.LocalPlayer["No Clip"],
	Callback = function(state)
		_G.Settings.LocalPlayer["No Clip"] = state;
		(getgenv()).SaveSetting();
	end
});
FruitSection = FruitTab:AddSection("Fruit");
AutoRandomFruitToggle = FruitTab:AddToggle({
	Title = "Auto Random Fruit",
	Value = _G.Settings.Fruit["Auto Buy Random Fruit"],
	Callback = function(state)
		_G.Settings.Fruit["Auto Buy Random Fruit"] = state;
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Fruit["Auto Buy Random Fruit"] then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("Cousin", "Buy");
			end;
		end;
	end);
end);
local RarityFruits = {
	Common = {
		"Rocket Fruit",
		"Spin Fruit",
		"Blade Fruit",
		"Spring Fruit",
		"Bomb Fruit",
		"Smoke Fruit",
		"Spike Fruit"
	},
	Uncommon = {
		"Flame Fruit",
		"Falcon Fruit",
		"Ice Fruit",
		"Sand Fruit",
		"Diamond Fruit",
		"Dark Fruit"
	},
	Rare = {
		"Light Fruit",
		"Rubber Fruit",
		"Barrier Fruit",
		"Ghost Fruit",
		"Magma Fruit"
	},
	Legendary = {
		"Quake Fruit",
		"Buddha Fruit",
		"Love Fruit",
		"Spider Fruit",
		"Sound Fruit",
		"Phoenix Fruit",
		"Portal Fruit",
		"Rumble Fruit",
		"Pain Fruit",
		"Blizzard Fruit"
	},
	Mythical = {
		"Gravity Fruit",
		"Mammoth Fruit",
		"T-Rex Fruit",
		"Dough Fruit",
		"Shadow Fruit",
		"Venom Fruit",
		"Control Fruit",
		"Gas Fruit",
		"Spirit Fruit",
		"Leopard Fruit",
		"Yeti Fruit",
		"Kitsune Fruit",
		"Dragon Fruit"
	}
};
local SelectRarityFruits = {
	"Common - Mythical",
	"Uncommon - Mythical",
	"Rare - Mythical",
	"Legendary - Mythical",
	"Mythical"
};
StoreRarityFruitDropdown = FruitTab:AddDropdown({
	Title = "Store Rarity Fruit",
	Values = SelectRarityFruits,
	Value = _G.Settings.Fruit["Store Rarity Fruit"],
	Callback = function(option)
		_G.Settings.Fruit["Store Rarity Fruit"] = option;
		(getgenv()).SaveSetting();
	end
});
function CheckFruits()
	for i, v in pairs(RarityFruits) do
		if _G.Settings.Fruit["Store Rarity Fruit"] == "Common - Mythical" then
			if i == "Common" or i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.Settings.Fruit["Store Rarity Fruit"] == "Uncommon - Mythical" then
			if i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.Settings.Fruit["Store Rarity Fruit"] == "Rare - Mythical" then
			if i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.Settings.Fruit["Store Rarity Fruit"] == "Legendary - Mythical" then
			if i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.Settings.Fruit["Store Rarity Fruit"] == "Mythical" then
			if i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		end;
	end;
end;
AutoStoreFruitToggle = FruitTab:AddToggle({
	Title = "Auto Store Fruit",
	Desc = "Verifica inventario e armazena frutas elegiveis de forma rapida.",
	Value = _G.Settings.Fruit["Auto Store Fruit"],
	Callback = function(state)
		_G.Settings.Fruit["Auto Store Fruit"] = state;
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	while true do
		task.wait(0.3);
		if not _G.Settings.Fruit["Auto Store Fruit"] then continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;

			ResultStoreFruits = {};
			CheckFruits();
			if #ResultStoreFruits == 0 then return; end;

			local containers = {plr.Backpack};
			if plr.Character then table.insert(containers, plr.Character); end;
			for _, container in ipairs(containers) do
				for _, tool in ipairs(container:GetChildren()) do
					if not tool.Name:find("Fruit") then continue; end;

					local shouldStore = false;
					for _, fruitName in ipairs(ResultStoreFruits) do
						if tool.Name == fruitName then shouldStore = true; break; end;
					end;
					if not shouldStore then continue; end;

					local hasSlot = true;
					pcall(function()
						local stashData = plr:FindFirstChild("Data") and plr.Data:FindFirstChild("Fruits");
						if stashData then
							local count = #stashData:GetChildren();
							if count >= 2 then hasSlot = false; end;
						end;
					end);
					if not hasSlot then continue; end;

					local toolRef = container:FindFirstChild(tool.Name);
					if toolRef then
						local firstName = string.gsub(tool.Name, " Fruit", "");
						pcall(function()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
								"StoreFruit",
								firstName .. "-" .. firstName,
								toolRef
							);
						end);
						task.wait(0.1);
					end;
				end;
			end;
		end);
	end;
end);
FruitNotification = FruitTab:AddToggle({
	Title = "Fruit Notification",
	Value = _G.Settings.Fruit["Fruit Notification"],
	Callback = function(state)
		_G.Settings.Fruit["Fruit Notification"] = value;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(2) do
		if _G.Settings.Fruit["Fruit Notification"] then
			for i, v in pairs(game.Workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					Library:Notify({
						Title = "Fruit found",
						Content = v.Name,
						Icon = "bell",
						Duration = 3
					});
				end;
			end;
		end;
	end;
end);

_G.FruitInterrupt = false;

local _PORTAL_DON_FLAMINGO = CFrame.new(-5685.5, 318.4, -3246.5);
local _PORTAL_MANSION_S3   = CFrame.new(-12471, 374.9, -7551.6);
local _PORTAL_CASTLE_S3    = CFrame.new(-26880, 22.8, 473.1);
local _PORTAL_HYDRA_S3     = CFrame.new(5643.4, 1013, -340.5);

local function _getFruitInWorkspace()
	for _, v in pairs(workspace:GetChildren()) do
		if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
			return v;
		end;
	end;
	return nil;
end;

local function _getPortalForFruitPos(fruitPos)
	local function dist(cf) return (fruitPos - cf.Position).Magnitude; end;
	if World3 then
		if dist(_PORTAL_HYDRA_S3) < 3500 then return _PORTAL_HYDRA_S3; end;
		if dist(_PORTAL_MANSION_S3) < 5000 then return _PORTAL_MANSION_S3; end;
		if dist(_PORTAL_CASTLE_S3) < 5000 then return _PORTAL_CASTLE_S3; end;
	elseif World2 then
		if dist(_PORTAL_DON_FLAMINGO) < 8000 then return _PORTAL_DON_FLAMINGO; end;
	end;
	return nil;
end;

local function _tweenToFruitAndPick(fruit)
	if not fruit or not fruit.Parent or not fruit:FindFirstChild("Handle") then return; end;
	local char = game.Players.LocalPlayer.Character;
	if not char then return; end;
	local hrp = char:FindFirstChild("HumanoidRootPart");
	local hum = char:FindFirstChildOfClass("Humanoid");
	if not hrp or not hum then return; end;

	pcall(function()
		hrp.Anchored = false;
		hum.WalkSpeed = 16;
		hum.JumpPower = 50;
	end);

	local fruitPos = fruit.Handle.Position;
	local portal = _getPortalForFruitPos(fruitPos);
	local TweenSvc = game:GetService("TweenService");

	if portal then
		local distToPortal = (hrp.Position - portal.Position).Magnitude;
		if distToPortal > 100 then
			local dur1 = math.max(0.5, distToPortal / (_G.Settings.Setting["Player Tween Speed"] or 350));
			local tw1 = TweenSvc:Create(hrp, TweenInfo.new(dur1, Enum.EasingStyle.Linear), {CFrame = portal});
			tw1:Play();
			local t1 = 0;
			while tw1.PlaybackState == Enum.PlaybackState.Playing do
				task.wait(0.05); t1 = t1 + 0.05;
				if t1 > dur1 + 1 then break; end;
			end;
			task.wait(0.5);
			hrp.CFrame = portal;
			task.wait(0.3);
		end;
	end;

	if not fruit or not fruit.Parent or not fruit:FindFirstChild("Handle") then return; end;
	local dist = (hrp.Position - fruit.Handle.Position).Magnitude;
	local dur = math.max(0.3, dist / (_G.Settings.Setting["Player Tween Speed"] or 350));
	local info = TweenInfo.new(dur, Enum.EasingStyle.Linear);
	local tween = TweenSvc:Create(hrp, info, {CFrame = fruit.Handle.CFrame});
	tween:Play();
	local elapsed = 0;
	while tween.PlaybackState == Enum.PlaybackState.Playing do
		task.wait(0.05);
		elapsed = elapsed + 0.05;
		if elapsed > dur + 1 then break; end;
	end;

	pcall(function()
		if fruit and fruit.Parent and fruit:FindFirstChild("Handle") then
			fruit.Handle.CFrame = hrp.CFrame;
		end;
	end);

	pcall(function()
		hrp.Anchored = false;
		hum.WalkSpeed = 16;
		hum.JumpPower = 50;
	end);
end;

local function _pauseFarmForFruit(fruit)
	if _G.FruitInterrupt then return; end;
	_G.FruitInterrupt = true;

	local sv_EclipseStart = _G.EclipseStartFarm;
	local sv_EclipseLevel = _G.EclipseLevel;
	local sv_EclipseBone  = _G.EclipseFarm_Bone;
	local sv_EclipseCake  = _G.EclipseFarm_Cake;
	local sv_AutoFarm     = _G.Settings.Main["Auto Farm"];
	local sv_Mastery      = _G.Settings.Main["Auto Farm Fruit Mastery"];
	local sv_Sword        = _G.Settings.Main["Auto Farm Sword Mastery"];

	_G.EclipseStartFarm = false;
	_G.EclipseLevel     = false;
	_G.EclipseFarm_Bone = false;
	_G.EclipseFarm_Cake = false;
	_G.Settings.Main["Auto Farm"] = false;
	_G.Settings.Main["Auto Farm Fruit Mastery"] = false;
	_G.Settings.Main["Auto Farm Sword Mastery"] = false;
	StopTween(false);

	pcall(function()
		local char = game.Players.LocalPlayer.Character;
		if char then
			local hrp = char:FindFirstChild("HumanoidRootPart");
			local hum = char:FindFirstChildOfClass("Humanoid");
			if hrp then hrp.Anchored = false; end;
			if hum then hum.WalkSpeed = 16; hum.JumpPower = 50; end;
		end;
	end);
	task.wait(0.3);

	_tweenToFruitAndPick(fruit);
	task.wait(0.3);
	_G.FruitInterrupt = false;

	if _G.Settings.Fruit["Tween To Fruit"] then
		_G.EclipseStartFarm = sv_EclipseStart;
		_G.EclipseLevel     = sv_EclipseLevel;
		_G.EclipseFarm_Bone = sv_EclipseBone;
		_G.EclipseFarm_Cake = sv_EclipseCake;
		_G.Settings.Main["Auto Farm"] = sv_AutoFarm;
		_G.Settings.Main["Auto Farm Fruit Mastery"] = sv_Mastery;
		_G.Settings.Main["Auto Farm Sword Mastery"] = sv_Sword;
	end;
end;

workspace.ChildAdded:Connect(function(child)
	if _G.Settings.Fruit["Tween To Fruit"]
	   and not _G.FruitInterrupt
	   and string.find(child.Name, "Fruit")
	   and child:FindFirstChild("Handle") then
		task.spawn(function()
			task.wait(0.1);
			_pauseFarmForFruit(child);
		end);
	end;
end);

TeleportToFruitToggle = FruitTab:AddToggle({
	Title = "Teleport To Fruit",
	Desc = " RISCO DE BAN - Teleporta instantaneo para a fruta. Use com cautela.",
	Value = _G.Settings.Fruit["Teleport To Fruit"],
	Callback = function(state)
		_G.Settings.Fruit["Teleport To Fruit"] = state;
		if not state then StopTween(false); end;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Fruit["Teleport To Fruit"] then
			local char = game.Players.LocalPlayer.Character;
			if not char then continue; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			if not hrp then continue; end;
			for _, v in pairs(workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
					hrp.CFrame = v.Handle.CFrame;
					task.wait(0.05);
					v.Handle.CFrame = hrp.CFrame;
				end;
			end;
		end;
	end;
end);

local collectFruits = function()
	local char = game.Players.LocalPlayer.Character;
	if not char then return end;
	for _, v in pairs(workspace:GetChildren()) do
		if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
			v.Handle.CFrame = char.HumanoidRootPart.CFrame;
		end;
	end;
end;

TweenToFruitToggle = FruitTab:AddToggle({
	Title = "Tween To Fruit",
	Desc = "Move suavemente ate a fruta e para o farm quando ela aparecer.",
	Value = _G.Settings.Fruit["Tween To Fruit"],
	Callback = function(state)
		_G.Settings.Fruit["Tween To Fruit"] = state;
		if not state then
			_G.FruitInterrupt = false;
		end;
		(getgenv()).SaveSetting();
	end
});

spawn(function()
	while wait(0.5) do
		if _G.Settings.Fruit["Tween To Fruit"] and not _G.FruitInterrupt then
			local fruit = _getFruitInWorkspace();
			if fruit then
				task.spawn(function()
					_pauseFarmForFruit(fruit);
				end);
			end;
		end;
	end;
end);
GrabFruitButton = FruitTab:AddButton({
	Title = "Grab Fruit",
	Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v:IsA("Tool") then
				v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
			end;
		end;
	end
});
VisualSection = FruitTab:AddSection("Visual");
function rainFruit()
	for h, i in pairs((game:GetObjects("rbxassetid://14759368201"))[1]:GetChildren()) do
		i.Parent = game.Workspace.Map;
		i:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random((-50), 50), 100, math.random((-50), 50)));
		if i.Fruit:FindFirstChild("AnimationController") then
			((i.Fruit:FindFirstChild("AnimationController")):LoadAnimation(i.Fruit:FindFirstChild("Idle"))):Play();
		end;
		i.Handle.Touched:Connect(function(cR)
			if cR.Parent == game.Players.LocalPlayer.Character then
				i.Parent = game.Players.LocalPlayer.Backpack;
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(i);
			end;
		end);
	end;
end;
RainFruitButton = FruitTab:AddButton({
	Title = "Rain Fruit",
	Callback = function()
		rainFruit();
	end
});
MiscSection = MiscTab:AddSection("Misc");
JoinPiratesTeamButton = MiscTab:AddButton({
	Title = "Join Pirates Team",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
	end
});
JoinMarinesTeamButton = MiscTab:AddButton({
	Title = "Join Marines Team",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetTeam", "Marines");
	end
});
CodeSection = MiscTab:AddSection("Codes");
local codeList = {
	"KITTGAMING",
	"ENYU_IS_PRO",
	"FUDD10",
	"BIGNEWS",
	"THEGREATACE",
	"SUB2GAMERROBOT_EXP1",
	"STRAWHATMAIME",
	"SUB2OFFICIALNOOBIE",
	"SUB2NOOBMASTER123",
	"SUB2DAIGROCK",
	"AXIORE",
	"TANTAIGAMIMG",
	"STRAWHATMAINE",
	"JCWK",
	"FUDD10_V2",
	"SUB2FER999",
	"MAGICBIS",
	"TY_FOR_WATCHING",
	"STARCODEHEO"
};
function redeemCode(code)
	(game:GetService("ReplicatedStorage")).Remotes.Redeem:InvokeServer(code);
end;
local RedeemAllCodesButton = MiscTab:AddButton({
	Title = "Redeem All Codes",
	Callback = function()
		for i, v in pairs(codeList) do
			redeemCode(v);
		end;
	end
});
GraphicMiscSection = MiscTab:AddSection("Graphic");
function boostFps()
	local I = true;
	local e = game;
	local K = e.Workspace;
	local n = e.Lighting;
	local d = K.Terrain;
	d.WaterWaveSize = 0;
	d.WaterWaveSpeed = 0;
	d.WaterReflectance = 0;
	d.WaterTransparency = 0;
	n.GlobalShadows = false;
	n.FogEnd = 9000000000.0;
	n.Brightness = 1;
	(settings()).Rendering.QualityLevel = "Level01";
	for e, K in pairs(e:GetDescendants()) do
		if K:IsA("Part") or K:IsA("Union") or K:IsA("CornerWedgePart") or K:IsA("TrussPart") then
			K.Material = "Plastic";
			K.Reflectance = 0;
		elseif K:IsA("Decal") or K:IsA("Texture") and I then
			K.Transparency = 1;
		elseif K:IsA("ParticleEmitter") or K:IsA("Trail") then
			K.Lifetime = NumberRange.new(0);
		elseif K:IsA("Explosion") then
			K.BlastPressure = 1;
			K.BlastRadius = 1;
		elseif K:IsA("Fire") or K:IsA("SpotLight") or K:IsA("Smoke") or K:IsA("Sparkles") then
			K.Enabled = false;
		elseif K:IsA("MeshPart") then
			K.Material = "Plastic";
			K.Reflectance = 0;
			K.TextureID = 10385902758728957;
		end;
	end;
	for I, e in pairs(n:GetChildren()) do
		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
			e.Enabled = false;
		end;
	end;
end;
FpsBoostButton = MiscTab:AddButton({
	Title = "Fps Boost",
	Callback = function()
		boostFps();
	end
});
RemoveFogButton = MiscTab:AddButton({
	Title = "Remove Fog",
	Callback = function()
		(game:GetService("Lighting")).LightingLayers:Destroy();
		(game:GetService("Lighting")).Sky:Destroy();
		game.Lighting.FogEnd = 9000000000;
	end
});
RemoveLavaButton = MiscTab:AddButton({
	Title = "Remove Lava",
	Callback = function()
		for i, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy();
			end;
		end;
		for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy();
			end;
		end;
	end
});
ServerTabSection = ServerTab:AddSection("Server");

local _FpsParagraph = ServerTab:AddParagraph({
	Title = "FPS",
	Desc = "0",
	Image = "monitor",
	ImageSize = 20
});
spawn(function()
	while task.wait(0.5) do
		pcall(function()
			_FpsParagraph:SetDesc(math.floor(workspace:GetRealPhysicsFPS()));
		end);
	end;
end);
local _PingParagraph = ServerTab:AddParagraph({
	Title = "Ping",
	Desc = "0",
	Image = "signal",
	ImageSize = 20
});
spawn(function()
	while task.wait(0.5) do
		pcall(function()
			_PingParagraph:SetDesc((game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ms");
		end);
	end;
end);
RejoinServerButton = ServerTab:AddButton({
	Title = "Rejoin Server",
	Callback = function()
		(game:GetService("TeleportService")):Teleport(game.PlaceId);
	end
});
ServerHopButton = ServerTab:AddButton({
	Title = "Server Hop",
	Callback = function()
		local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
		module:Teleport(game.PlaceId);
	end
});
JobIdParagraph = ServerTab:AddParagraph({
	Title = "Job ID",
	Desc = game.JobId,
	Buttons = {
		{
			Title = "Copy",
			Callback = function()
				setclipboard(game.JobId);
			end
		}
	}
});
EnterJobIdInput = ServerTab:AddInput({
	Title = "Enter Job ID",
	Placeholder = "Coloque o ID do servidor",
	Callback = function(value)
		_G.JobId = value;
	end
});
JoinJobIdButton = ServerTab:AddButton({
	Title = "Join Job ID",
	Callback = function()
		(game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, _G.JobId);
	end
});
StatusServerSection = ServerTab:AddSection("Status");
MoonServerParagraph = ServerTab:AddParagraph({
	Title = "Moon Server",
	Desc = "N/A"
});
KitsuneStatusParagraph = ServerTab:AddParagraph({
	Title = "Kitsune Status",
	Desc = "N/A"
});
FrozenStatusParagraph = ServerTab:AddParagraph({
	Title = "Frozen Status",
	Desc = "N/A"
});
MirageStatusParagraph = ServerTab:AddParagraph({
	Title = "Mirage Status",
	Desc = "N/A"
});
HakiDealerStatusParagraph = ServerTab:AddParagraph({
	Title = "Haki Dealer Status",
	Desc = "N/A"
});
PrehistoricStatusParagraph = ServerTab:AddParagraph({
	Title = "Prehistoric Status",
	Desc = "N/A"
});
spawn(function()
	while task.wait() do
		pcall(function()
			if (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
				MoonServerParagraph:SetDesc("Full Moon 100%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
				MoonServerParagraph:SetDesc("Full Moon 75%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
				MoonServerParagraph:SetDesc("Full Moon 50%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
				MoonServerParagraph:SetDesc("Full Moon 25%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
				MoonServerParagraph:SetDesc("Full Moon 15%");
			else
				MoonServerParagraph:SetDesc("Full Moon 0%");
			end;
		end);
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World3 then
				if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
					KitsuneStatusParagraph:SetDesc("Kitsune Island is Spawning");
				else
					KitsuneStatusParagraph:SetDesc("Kitsune Island Not Spawn");
				end;
			else
				KitsuneStatusParagraph:SetDesc("World 3 Only");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World3 then
				if game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
					PrehistoricStatusParagraph:SetDesc("Prehistoric Island is Spawning");
				else
					PrehistoricStatusParagraph:SetDesc("Prehistoric Island Not Spawn");
				end;
			else
				PrehistoricStatusParagraph:SetDesc("World 3 Only");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				FrozenStatusParagraph:SetDesc("Frozen Dimension Spawning");
			else
				FrozenStatusParagraph:SetDesc("Frozen Dimension Not Spawn");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World2 or World3 then
				if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
					MirageStatusParagraph:SetDesc("Mirage Island is Spawning");
				else
					MirageStatusParagraph:SetDesc("Mirage Island Not Spawn");
				end;
			else
				MirageStatusParagraph:SetDesc("World 3 Only");
			end;
		end;
	end);
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			local response = (((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("ColorsDealer", "1");
			if response then
				HakiDealerStatusParagraph:SetDesc("Master Of Auras Spawning");
			else
				HakiDealerStatusParagraph:SetDesc("Master Of Auras Not Spawn");
			end;
		end);
	end;
end);
local _seaStatusParagraph = ServerTab:AddParagraph({
	Title = "SEA ATUAL",
	Desc = "Detectando..."
});
local _serverTimeParagraph = ServerTab:AddParagraph({
	Title = "TEMPO DE SERVIDOR",
	Desc = "N/A"
});
local _fodStatusParagraph = ServerTab:AddParagraph({
	Title = "FIRST OF DARKNESS",
	Desc = "N/A"
});
local _chaliceStatusParagraph = ServerTab:AddParagraph({
	Title = "GOD CHALICE",
	Desc = "N/A"
});
local _raidBossStatusParagraph = ServerTab:AddParagraph({
	Title = "RAID BOSS",
	Desc = "N/A"
});
local _pirateRaidStatusParagraph = ServerTab:AddParagraph({
	Title = "PIRATES RAID",
	Desc = "N/A"
});
local _factoryStatusParagraph = ServerTab:AddParagraph({
	Title = "FACTORY",
	Desc = "N/A"
});
local _jobIdParagraph = ServerTab:AddParagraph({
	Title = "JOB ID",
	Desc = tostring(game.JobId or "N/A")
});
local _serverStartTime = os.time();
task.spawn(function()
	while true do
		task.wait(1);
		pcall(function()
			local elapsed = os.time() - _serverStartTime;
			local mins = math.floor(elapsed / 60);
			local secs = elapsed % 60;
			_serverTimeParagraph:SetDesc(string.format("%02d:%02d ativos", mins, secs));
		end);
	end;
end);
task.spawn(function()
	while true do
		task.wait(0.5);
		pcall(function()
			if World1 then
				_seaStatusParagraph:SetDesc("SEA 1 (First Sea)");
			elseif World2 then
				_seaStatusParagraph:SetDesc("SEA 2 (Second Sea)");
			elseif World3 then
				_seaStatusParagraph:SetDesc("SEA 3 (Third Sea)");
			else
				_seaStatusParagraph:SetDesc("Sea desconhecido");
			end;
		end);
	end;
end);
task.spawn(function()
	while true do
		task.wait(1);
		pcall(function()
			local found = false;
			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name:lower():find("first") and v.Name:lower():find("dark") then
					found = true; break;
				end;
			end;
			_fodStatusParagraph:SetDesc(found and "SPAWNED no servidor!" or "Nao encontrado");
		end);
	end;
end);
task.spawn(function()
	while true do
		task.wait(1);
		pcall(function()
			local found = false;
			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name:lower():find("god") and v.Name:lower():find("chal") then
					found = true; break;
				end;
			end;
			_chaliceStatusParagraph:SetDesc(found and "SPAWNED no servidor!" or "Nao encontrado");
		end);
	end;
end);
task.spawn(function()
	while true do
		task.wait(1);
		pcall(function()
			local raidBossNames = {"Darkbeard", "rip_indra", "Dough King", "Ice Admiral", "Cyborg", "Thunder God"};
			local found = false;
			for _, bossName in pairs(raidBossNames) do
				if workspace.Enemies:FindFirstChild(bossName) then
					found = true;
					_raidBossStatusParagraph:SetDesc("SPAWNED: " .. bossName);
					break;
				end;
			end;
			if not found then _raidBossStatusParagraph:SetDesc("Nenhum Raid Boss ativo"); end;
		end);
	end;
end);
task.spawn(function()
	while true do
		task.wait(1);
		pcall(function()
			local pirateRaid = workspace:FindFirstChild("PirateRaid") or workspace:FindFirstChild("Pirate Raid") or workspace:FindFirstChild("PiratesRaid");
			if pirateRaid then
				_pirateRaidStatusParagraph:SetDesc("ATIVO no servidor!");
			else
				_pirateRaidStatusParagraph:SetDesc("Inativo");
			end;
		end);
	end;
end);
task.spawn(function()
	while true do
		task.wait(1);
		pcall(function()
			local factory = workspace:FindFirstChild("Factory") or workspace:FindFirstChild("FactoryFortress");
			if factory then
				_factoryStatusParagraph:SetDesc("ATIVO no servidor!");
			else
				_factoryStatusParagraph:SetDesc("Inativo");
			end;
		end);
	end;
end);

getgenv().HoldSkillConfig = {
	["Z"] = true,
	["X"] = true,
	["C"] = true,
	["V"] = false,
	["F"] = false,
	["Melee"] = false,
	["Sword"] = false,
	["Gun"] = false,
}

HoldAndSkillTab:AddSection("Skills Config - Selecione as skills para usar nos farms");

HoldAndSkillTab:AddParagraph({
	Title = "Como funciona",
	Desc = "Selecione abaixo quais teclas/skills serao usadas em TODOS os farms e funcoes do hub que precisam de skills. As combinacoes Z X C Melee, Z X C V F Fruit, Z X Sword e Z X Gun definem grupos rapidos."
});

HoldAndSkillTab:AddToggle({
	Title = "Z X C Melee",
	Desc = "Usa apenas Z, X, C de Melee (Fighting Style)",
	Value = false,
	Callback = function(state)
		if state then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = true;
			getgenv().HoldSkillConfig["V"] = false;
			getgenv().HoldSkillConfig["F"] = false;
			getgenv().HoldSkillConfig["Melee"] = true;
			getgenv().HoldSkillConfig["Sword"] = false;
			getgenv().HoldSkillConfig["Gun"] = false;
		end
	end
});

HoldAndSkillTab:AddToggle({
	Title = "Z X C V F Fruit",
	Desc = "Usa Z, X, C, V e F de Fruta (Devil Fruit)",
	Value = false,
	Callback = function(state)
		if state then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = true;
			getgenv().HoldSkillConfig["V"] = true;
			getgenv().HoldSkillConfig["F"] = true;
			getgenv().HoldSkillConfig["Melee"] = false;
			getgenv().HoldSkillConfig["Sword"] = false;
			getgenv().HoldSkillConfig["Gun"] = false;
		end
	end
});

HoldAndSkillTab:AddToggle({
	Title = "Z X Sword",
	Desc = "Usa apenas Z e X de Espada (Sword)",
	Value = false,
	Callback = function(state)
		if state then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = false;
			getgenv().HoldSkillConfig["V"] = false;
			getgenv().HoldSkillConfig["F"] = false;
			getgenv().HoldSkillConfig["Melee"] = false;
			getgenv().HoldSkillConfig["Sword"] = true;
			getgenv().HoldSkillConfig["Gun"] = false;
		end
	end
});

HoldAndSkillTab:AddToggle({
	Title = "Z X Gun",
	Desc = "Usa apenas Z e X de Arma de Fogo (Gun)",
	Value = false,
	Callback = function(state)
		if state then
			getgenv().HoldSkillConfig["Z"] = true;
			getgenv().HoldSkillConfig["X"] = true;
			getgenv().HoldSkillConfig["C"] = false;
			getgenv().HoldSkillConfig["V"] = false;
			getgenv().HoldSkillConfig["F"] = false;
			getgenv().HoldSkillConfig["Melee"] = false;
			getgenv().HoldSkillConfig["Sword"] = false;
			getgenv().HoldSkillConfig["Gun"] = true;
		end
	end
});

HoldAndSkillTab:AddSection("Skills Individuais");

HoldAndSkillTab:AddToggle({
	Title = "Usar Skill Z",
	Desc = "Ativa o uso da tecla Z nos farms",
	Value = true,
	Callback = function(state)
		getgenv().HoldSkillConfig["Z"] = state;
	end
});
HoldAndSkillTab:AddToggle({
	Title = "Usar Skill X",
	Desc = "Ativa o uso da tecla X nos farms",
	Value = true,
	Callback = function(state)
		getgenv().HoldSkillConfig["X"] = state;
	end
});
HoldAndSkillTab:AddToggle({
	Title = "Usar Skill C",
	Desc = "Ativa o uso da tecla C nos farms",
	Value = true,
	Callback = function(state)
		getgenv().HoldSkillConfig["C"] = state;
	end
});
HoldAndSkillTab:AddToggle({
	Title = "Usar Skill V",
	Desc = "Ativa o uso da tecla V nos farms",
	Value = false,
	Callback = function(state)
		getgenv().HoldSkillConfig["V"] = state;
	end
});
HoldAndSkillTab:AddToggle({
	Title = "Usar Skill F",
	Desc = "Ativa o uso da tecla F nos farms",
	Value = false,
	Callback = function(state)
		getgenv().HoldSkillConfig["F"] = state;
	end
});

getgenv().UseConfiguredSkills = function(targetPosition)
	task.spawn(function()
		pcall(function()
			local char = game.Players.LocalPlayer.Character;
			if not char then return end

			local vim = game:GetService("VirtualInputManager");
			local skillsToUse = {};
			if getgenv().HoldSkillConfig["Z"] then table.insert(skillsToUse, "Z") end
			if getgenv().HoldSkillConfig["X"] then table.insert(skillsToUse, "X") end
			if getgenv().HoldSkillConfig["C"] then table.insert(skillsToUse, "C") end
			if getgenv().HoldSkillConfig["V"] then table.insert(skillsToUse, "V") end
			if getgenv().HoldSkillConfig["F"] then table.insert(skillsToUse, "F") end
			for _, key in pairs(skillsToUse) do
				pcall(function()
					vim:SendKeyEvent(true, key, false, game);
					task.wait(0.05);
					vim:SendKeyEvent(false, key, false, game);
					task.wait(0.03);
				end)
			end
		end)
	end)
end
