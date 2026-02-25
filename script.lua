Library = loadstring(game:HttpGet("https://luacrack.site/index.php/anhkhoarb500gmail.com/raw/LibraryObii.lua"))()
if Library.SetColors then
    Library:SetColors({
        Background      = Color3.fromRGB(0, 0, 0),
        Header          = Color3.fromRGB(5, 5, 5),
        DarkContrast    = Color3.fromRGB(10, 10, 10),
        LightContrast   = Color3.fromRGB(18, 18, 18),
        SchemeColor     = Color3.fromRGB(0, 200, 255),
        TextColor       = Color3.fromRGB(255, 255, 255),
        BorderColor     = Color3.fromRGB(0, 200, 255),
        ButtonColor     = Color3.fromRGB(0, 200, 255),
        ButtonTextColor = Color3.fromRGB(0, 0, 0),
        ToggleColor     = Color3.fromRGB(0, 200, 255),
        Transparency    = 0.3,
    })
elseif Library.SetScheme then
    Library:SetScheme(Color3.fromRGB(0, 200, 255))
end
-- WindUI shim: compatibilidade com o restante do código
local WindUI = {}
WindUI._lib = Library

-- ====== FAST ATTACK MODULE ======
task.spawn(function()
	local Players = game:GetService("Players");
	local LP = Players.LocalPlayer;
	repeat task.wait() until game:IsLoaded();
	repeat task.wait() until LP and LP.Character;
	local success, err = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhDangNhoEm/TuanAnhIOS/refs/heads/main/koby"))();
	end);
	if not success then
		warn("Fast Attack load failed:", err);
	end;
end);

local Window = Library:CreateWindow({
    Title = "☄️Eclipse Hub☄️",
    Subtitle = "- Blox Fruits",
    Image = "rbxassetid://112518061635682",
    Icon  = "rbxassetid://112518061635682",
    Transparency = 0.3,
})
-- Shim: método Tab como AddTab
local _origTab = Window
Window._tabs = {}
function Window:Tab(opts)
    local title = opts.Title or ""
    local libTab = _origTab:AddTab(title)
    -- Wrapper que emula WindUI Tab API
    local tabWrapper = {_libTab = libTab, _groupboxes = {}}
    -- _lastGB: guarda o último groupbox criado para elementos sem Section
    tabWrapper._lastGB = nil
    local function ensureGB()
        if not tabWrapper._lastGB then
            tabWrapper._lastGB = libTab:AddLeftGroupbox("")
        end
        return tabWrapper._lastGB
    end
    function tabWrapper:Section(sopts)
        local gb = libTab:AddLeftGroupbox(sopts.Title or "")
        tabWrapper._lastGB = gb
        return _makeSection(gb)
    end
    function tabWrapper:Toggle(topts) return _makeSection(ensureGB()):Toggle(topts) end
    function tabWrapper:Button(bopts) return _makeSection(ensureGB()):Button(bopts) end
    function tabWrapper:Dropdown(dopts) return _makeSection(ensureGB()):Dropdown(dopts) end
    function tabWrapper:Slider(sopts) return _makeSection(ensureGB()):Slider(sopts) end
    function tabWrapper:Input(iopts) return _makeSection(ensureGB()):Input(iopts) end
    function tabWrapper:Paragraph(popts) return _makeSection(ensureGB()):Paragraph(popts) end
    return tabWrapper
end
function Window:SelectTab(n) end -- no-op
-- Shim: seção helper
_keyGen = 0
function _makeSection(gb)
    local sec = {}
    function sec:Toggle(opts)
        _keyGen = _keyGen + 1
        local key = ((opts.Title or ""):gsub("[^%w]","")) .. "_" .. _keyGen
        local tog = gb:AddToggle(key, {
            Title = opts.Title or "",
            Default = opts.Value or false,
            Callback = opts.Callback or function() end,
        })
        -- Shim SetValue
        local wrapper = {}
        function wrapper:SetValue(v)
            if Toggles and Toggles[key] then Toggles[key]:SetValue(v) end
        end
        return wrapper
    end
    function sec:Button(opts)
        gb:AddButton({Title = opts.Title or "", Callback = opts.Callback or function() end})
    end
    function sec:Dropdown(opts)
        _keyGen = _keyGen + 1
        local key = ((opts.Title or ""):gsub("[^%w]","")) .. "_" .. _keyGen
        gb:AddDropdown(key, {
            Title    = opts.Title or "",
            Values   = opts.Values or {},
            Default  = opts.Value or nil,
            Multi    = false,
            Callback = opts.Callback or function() end,
        })
    end
    function sec:Slider(opts)
        local v = opts.Value or {}
        gb:AddSlider({
            Title    = opts.Title or "",
            Min      = (type(v) == "table" and v.Min) or opts.Min or 0,
            Max      = (type(v) == "table" and v.Max) or opts.Max or 100,
            Default  = (type(v) == "table" and v.Default) or opts.Default or 0,
            Rounding = opts.Step or 0,
            Callback = opts.Callback or function() end,
        })
    end
    function sec:Input(opts)
        _keyGen = _keyGen + 1
        local key = ((opts.Title or ""):gsub("[^%w]","")) .. "_" .. _keyGen
        gb:AddInput(key, {
            Title    = opts.Title or "",
            Default  = opts.Value or "",
            Callback = opts.Callback or function() end,
        })
    end
    function sec:Paragraph(opts)
        local lbl = gb:AddLabel((opts.Title or "") .. (opts.Desc and (": " .. opts.Desc) or ""))
        local prefix = opts.Title or ""
        return {
            SetDesc = function(_, txt) pcall(function() lbl:SetText(prefix .. ": " .. (txt or "")) end) end
        }
    end
    return sec
end
local Tabs = {
	InfoTab = Window:Tab({
		Title = "Info",
		Icon = "info",
		Desc = "Eclipse Hub Info & Discord"
	}),
	MainTab = Window:Tab({
		Title = "Main",
		Icon = "house",
		Desc = "Main Section"
	}),
	OthersTab = Window:Tab({
		Title = "Others",
		Icon = "inbox",
		Desc = "Farming Section"
	}),
	FarmingHopTab = Window:Tab({
		Title = "Farming And Hop",
		Icon = "zap",
		Desc = "Quest Farms & Server Hop"
	}),
	ItemsTab = Window:Tab({
		Title = "Items",
		Icon = "box",
		Desc = "Items Section"
	}),
	FruitTab = Window:Tab({
		Title = "Fruit",
		Icon = "vegan",
		Desc = "Fruit Section"
	}),
	RaidTab = Window:Tab({
		Title = "Raid",
		Icon = "door-open",
		Desc = "Raid Section"
	}),
	CombatTab = Window:Tab({
		Title = "Combat",
		Icon = "sword",
		Desc = "Combat Section"
	}),
	RaceTab = Window:Tab({
		Title = "Race",
		Icon = "bot",
		Desc = "Race Section"
	}),
	DragonDojoTab = Window:Tab({
		Title = "Dragon Dojo",
		Icon = "shield",
		Desc = "Dragon Dojo Section"
	}),
	SeaEventTab = Window:Tab({
		Title = "Sea Event",
		Icon = "anchor",
		Desc = "Sea Event Section"
	}),
	SeaStackTab = Window:Tab({
		Title = "Islands",
		Icon = "waves",
		Desc = "Islands Section"
	}),
	EspTab = Window:Tab({
		Title = "Esp",
		Icon = "scan-eye",
		Desc = "Esp Section"
	}),
	TeleportTab = Window:Tab({
		Title = "Teleport",
		Icon = "map-pinned",
		Desc = "Teleport Section"
	}),
	LocalPlayerTab = Window:Tab({
		Title = "Local Player",
		Icon = "user",
		Desc = "Local Player Section"
	}),
	StatsTab = Window:Tab({
		Title = "Stats",
		Icon = "chart-no-axes-column",
		Desc = "Stats Section"
	}),
	SettingsTab = Window:Tab({
		Title = "Settings",
		Icon = "settings",
		Desc = "Settings Section"
	}),
	SeaSettingsTab = Window:Tab({
		Title = "Sea Settings",
		Icon = "cog",
		Desc = "Sea Settings Section"
	}),
	MiscTab = Window:Tab({
		Title = "Misc",
		Icon = "layout-grid",
		Desc = "Misc Section"
	}),
	ServerTab = Window:Tab({
		Title = "Server",
		Icon = "server",
		Desc = "Server Section"
	}),
	ShopTab = Window:Tab({
		Title = "Shop",
		Icon = "shopping-cart",
		Desc = "Shop Section"
	}),
	MultiFarmTab = Window:Tab({
		Title = "Multi Farm",
		Icon = "layers",
		Desc = "Multi Farm - Em Breve"
	}),
};
-- Window:SelectTab(1) -- handled by shim

-- Script Loaded notification (fires after UI is ready)
task.delay(2, function()
	pcall(function()
		Library:Notify({
			Title = "☄️ Eclipse Hub",
			Content = "Script carregado com sucesso!\nBem-vindo, " .. game.Players.LocalPlayer.Name .. " 👋",
			Icon = "rocket",
			Duration = 6
		});
	end);
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "☄️ Eclipse Hub",
			Text = "✅ Script carregado! Bem-vindo, " .. game.Players.LocalPlayer.Name,
			Duration = 5
		});
	end);
end);

-- ========================================
-- INFO TAB
-- ========================================
local InfoSection = Tabs.InfoTab:Section({
	Title = "☄️ Eclipse Hub ☄️",
	TextXAlignment = "Left"
});
Tabs.InfoTab:Paragraph({
	Title = "Eclipse Hub",
	Desc = "Version: Gen4 | Game: Blox Fruits\nMade with ❤️ for the Eclipse Community\nAll features are free to use."
});
Tabs.InfoTab:Paragraph({
	Title = "🌐 Discord Server",
	Desc = "Join our community for updates, support and more!\nLink: discord.gg/QwBHNFyzPq"
});
Tabs.InfoTab:Button({
	Title = "Join Eclipse Community Discord",
	Desc = "Click to open the Discord invite link",
	Callback = function()
		setclipboard("https://discord.gg/QwBHNFyzPq");
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "☄️ Eclipse Hub",
			Text = "Discord link copied to clipboard!\ndiscord.gg/QwBHNFyzPq",
			Duration = 5
		});
	end
});
Tabs.InfoTab:Paragraph({
	Title = "📋 Credits",
	Desc = "Dev: 1x1x1x1x1x1\nOwner: David Basuki\n\nEclipse Hub Gen4 — Blox Fruits"
});
-- ========================================
-- FARMING AND HOP TAB
-- ========================================

-- Notificação helper para Farm Hop
local function FHNotify(title, text, duration)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "☄️ " .. title,
			Text = text,
			Duration = duration or 4
		});
	end);
end;

-- Hop original do Eclipse
local Hop = function()
	FHNotify("Farm Hop", "🔄 Hoping Server...", 5);
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

-- Save Farm Hop settings
local function SaveFH()
	pcall(function() (getgenv()).SaveSetting(); end);
end;

-- ============================================================
-- SEA 1 FARMS
-- ============================================================
local FarmSea1Section = Tabs.FarmingHopTab:Section({
	Title = "🌊 Sea 1 Farms",
	TextXAlignment = "Left"
});

local _FHAutoSaw = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Saw Sword"]) or false;
Tabs.FarmingHopTab:Toggle({
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
					FHNotify("Saw Sword", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHAutoSaw);
					until not _FHAutoSaw or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHAutoSaw then return end;
					FHNotify("Saw Sword", "✅ Boss killed!", 3);
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906);
				end;
			end;
		end);
	end;
end);

local _FHAutoSaber = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Saber Sword"]) or false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Saber Sword [Sea 1]",
	Desc = "Auto complete Saber Expert quest chain — Sea 1",
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
					FHNotify("Saber Sword", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHAutoSaber);
					until mob.Humanoid.Health <= 0 or not _FHAutoSaber;
					if mob.Humanoid.Health <= 0 then
						replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic");
						FHNotify("Saber Sword", "✅ Quest step done!", 3);
					end;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1401.85046, 29.9773273, 8.81916237);
				end;
			end;
		end);
	end;
end);

local _FHAutoUsoap = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Usoap Hat"]) or false;
Tabs.FarmingHopTab:Toggle({
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
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Farm Observation [All Seas]",
	Desc = "Auto farm Observation Haki (Ken) — Sea 1, 2 e 3",
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
Tabs.FarmingHopTab:Toggle({
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

-- ============================================================
local _FHBisento = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Bisento"]) or false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Bisento V2 [Sea 1]",
	Desc = "Auto kill Greybeard para Bisento — Sea 1",
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
					FHNotify("Bisento V2", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHBisento);
					until not _FHBisento or not mob.Parent or mob.Humanoid.Health <= 0;
					if mob and mob.Humanoid.Health <= 0 then
						FHNotify("Bisento V2", "✅ Greybeard killed!", 3);
					end;
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5023.3833007812, 28.652032852173, 4332.3818359375);
				end;
			end);
		end;
	end;
end);


-- SEA 2 FARMS
-- ============================================================
local FarmSea2Section = Tabs.FarmingHopTab:Section({
	Title = "🌊 Sea 2 Farms",
	TextXAlignment = "Left"
});

local _FHDarkbeard = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Darkbeard"]) or false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Darkbeard [Sea 2 + Hop]",
	Desc = "Auto kill Darkbeard — hops server se não encontrado",
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
					FHNotify("Darkbeard", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHDarkbeard);
					until not _FHDarkbeard or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHDarkbeard then return end;
					FHNotify("Darkbeard", "✅ Boss killed!", 3);
				else
					FHNotify("Darkbeard", "🔄 Hoping Server...", 4);
					TweenPlayer(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625));
					wait(1);
					if not GetConnectionEnemies("Darkbeard") then Hop(); end;
				end;
			end;
		end);
	end;
end);

local _FHWarden = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Warden"]) or false;
Tabs.FarmingHopTab:Toggle({
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
					FHNotify("Warden Sword", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHWarden);
					until not _FHWarden or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHWarden then return end;
					FHNotify("Warden Sword", "✅ Boss killed!", 3);
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5206.92578, .997753382, 814.976746);
				end;
			end;
		end);
	end;
end);

-- ============================================================
-- SEA 3 FARMS
-- ============================================================
local FarmSea3Section = Tabs.FarmingHopTab:Section({
	Title = "🌊 Sea 3 Farms",
	TextXAlignment = "Left"
});

-- ====== AUTO ELITE BOSS (Motor Eclipse - Sea 3) ======
local _FHEliteQuest = false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Elite Quest [Sea 3]",
	Desc = "Vai até Diablo/Urban/Deandre, mata o boss elite, hops se não achar",
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
					-- Tem quest ativa: tenta achar o boss elite
					local qt = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
					if string.find(qt, "Diablo") or string.find(qt, "Urban") or string.find(qt, "Deandre") then
						-- Tenta achar via Replicated (se estiver lá)
						for _, e in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
							if string.find(e.Name,"Diablo") or string.find(e.Name,"Urban") or string.find(e.Name,"Deandre") then
								if e:FindFirstChild("HumanoidRootPart") then
									TweenPlayer(e.HumanoidRootPart.CFrame);
								end;
							end;
						end;
						-- Mata nos Enemies
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
					-- Sem quest: pede a quest do Elite Hunter
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("EliteHunter");
				end;
				-- Para se pegar Chalice ou Fist of Darkness
				if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice")
				   or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")
				   or game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
					_G.FarmEliteHunt = false;
					_FHEliteQuest = false;
					FHNotify("Elite Quest", "🏆 Got rare item! Stopping.", 5);
				end;
			end;
		end);
	end;
end);

local _FHCitizenQuest = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Citizen Quest"]) or false;
Tabs.FarmingHopTab:Toggle({
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
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Rip Indra [Sea 3 + Hop]",
	Desc = "Auto kill Rip Indra — hops server se não encontrado",
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
					FHNotify("Rip Indra", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHRipIndra);
					until not _FHRipIndra or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHRipIndra then return end;
					FHNotify("Rip Indra", "✅ Boss killed!", 3);
				else
					TweenPlayer(CFrame.new(-12386.9, 364.3, -7590.2));
					wait(1);
					if not GetConnectionEnemies("Rip_Indra") then
						FHNotify("Rip Indra", "🔄 Hoping Server...", 4);
						Hop();
					end;
				end;
			end;
		end);
	end;
end);

local _FHMarineCoat = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Marine Coat"]) or false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Marine Coat [Sea 1 + Hop]",
	Desc = "Auto farm Marine Coat — hops se Vice Admiral não encontrado",
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
					FHNotify("Marine Coat", "⚔️ Vice Admiral Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHMarineCoat);
					until not _FHMarineCoat or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHMarineCoat then return end;
					FHNotify("Marine Coat", "✅ Boss killed! Restarting...", 3);
				else
					-- Sea 1: MarineFord area
					TweenPlayer(CFrame.new(-5039.58643, 27.3500385, 4324.68018));
					wait(1);
					if not GetConnectionEnemies("Vice Admiral") then
						FHNotify("Marine Coat", "🔄 Hoping Server...", 4);
						Hop();
					end;
				end;
			end;
		end);
	end;
end);

local _FHSwanCoat = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto Swan Coat"]) or false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto Swan Coat [Sea 2 + Hop]",
	Desc = "Auto kill Don Swan para Swan Coat — Sea 2 Swan Room",
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
					FHNotify("Swan Coat", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHSwanCoat);
					until not _FHSwanCoat or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHSwanCoat then return end;
					FHNotify("Swan Coat", "✅ Boss killed!", 3);
				else
					-- Sea 2: Swan Room area
					pcall(function() (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905)); end);
					wait(1);
					if not GetConnectionEnemies("Don Swan") then
						FHNotify("Swan Coat", "🔄 Hoping Server...", 4);
						Hop();
					end;
				end;
			end;
		end);
	end;
end);

local _FHGodChalice = (_G.Settings and _G.Settings.FarmHop and _G.Settings.FarmHop["Auto God Chalice"]) or false;
Tabs.FarmingHopTab:Toggle({
	Title = "Auto God Chalice [Sea 3 + Hop]",
	Desc = "Auto farm God Chalice — hops quando boss não encontrado",
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
					FHNotify("God Chalice", "⚔️ Boss Spawned! Killing...", 3);
					repeat wait(); G.Kill(mob, _FHGodChalice);
					until not _FHGodChalice or not mob.Parent or mob.Humanoid.Health <= 0;
					if not _FHGodChalice then return end;
					FHNotify("God Chalice", "✅ Boss killed!", 3);
				else
					FHNotify("God Chalice", "🔄 Hoping Server...", 4);
					wait(1);
					Hop();
				end;
			end;
		end);
	end;
end);

-- Tyrant Of The Skies (separado, no final)
pcall(function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines");
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
		["Auto Farm All Boss"] = false
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
	Setting = {
		["Auto Set Team"] = "Marines",
		["Spin Position"] = false,
		["Farm Distance"] = 35,
		["Player Tween Speed"] = 350,
		["Bring Mob"] = true,
		["Bring Mob Mode"] = "Normal",
		["Fast Attack"] = true,
		["Fast Attack Mode"] = "Normal",
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
		["Auto Rejoin"] = true
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
		["Auto God Chalice"] = false
	}
};
(getgenv()).Load = function()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("Relz Hub New") then
			makefolder("Relz Hub New");
		end;
		if not isfolder("Relz Hub New/Blox Fruits/") then
			makefolder("Relz Hub New/Blox Fruits/");
		end;
		if not isfile(("Relz Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
			writefile("Relz Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(_G.Settings));
		else
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("Relz Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
			for i, v in pairs(Decode) do
				_G.Settings[i] = v;
			end;
		end;
		print("Loaded!");
	else
		return warn("Status : Undetected Executor");
	end;
end;
(getgenv()).SaveSetting = function()
	if readfile and writefile and isfile and isfolder then
		if not isfile(("Relz Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
			(getgenv()).Load();
		else
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("Relz Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
			local Array = {};
			for i, v in pairs(_G.Settings) do
				Array[i] = v;
			end;
			writefile("Relz Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(Array));
		end;
	else
		return warn("Status : Undetected Executor");
	end;
end;
(getgenv()).Load();
if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
    World1 = true;
elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
    World2 = true;
elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    World3 = true;
end;
function CheckQuest()
	local I = game.Players.LocalPlayer.Data.Level.Value;
	if World1 and I > 699 then
		I = 650;
	end;
	if World2 and I > 1499 then
		I = 1450;
	end;
	if World1 then
		if I == 1 or I <= 9 then
			if tostring(game.Players.LocalPlayer.Team) == "Marines" then
				Mon = "Trainee";
				Qname = "MarineQuest";
				Qdata = 1;
				NameMon = "Trainee";
				PosM = CFrame.new(-2709.67944, 24.5206585, 2104.24585);
				PosQ = CFrame.new(-2709.67944, 24.5206585, 2104.24585);
			elseif tostring(game.Players.LocalPlayer.Team) == "Pirates" then
				Mon = "Bandit";
				Qdata = 1;
				Qname = "BanditQuest1";
				NameMon = "Bandit";
				PosM = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125);
				PosQ = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125);
			end;
		elseif I >= 10 and I <= 14 then
			Mon = "Monkey";
			Qdata = 1;
			Qname = "JungleQuest";
			NameMon = "Monkey";
			PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838);
			PosM = CFrame.new(-1448.5180664062, 67.853012084961, 11.465796470642);
		elseif I >= 15 and I <= 29 then
			Mon = "Gorilla";
			Qdata = 2;
			Qname = "JungleQuest";
			NameMon = "Gorilla";
			PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838);
			PosM = CFrame.new(-1129.8836669922, 40.46354675293, -525.42370605469);
		elseif I >= 30 and I <= 39 then
			Mon = "Pirate";
			Qdata = 1;
			Qname = "BuggyQuest1";
			NameMon = "Pirate";
			PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498);
			PosM = CFrame.new(-1103.5134277344, 13.752052307129, 3896.0910644531);
		elseif I >= 40 and I <= 59 then
			Mon = "Brute";
			Qdata = 2;
			Qname = "BuggyQuest1";
			NameMon = "Brute";
			PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498);
			PosM = CFrame.new(-1140.0837402344, 14.809885025024, 4322.9213867188);
		elseif I >= 60 and I <= 74 then
			Mon = "Desert Bandit";
			Qdata = 1;
			Qname = "DesertQuest";
			NameMon = "Desert Bandit";
			PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359);
			PosM = CFrame.new(924.7998046875, 6.4486746788025, 4481.5859375);
		elseif I >= 75 and I <= 89 then
			Mon = "Desert Officer";
			Qdata = 2;
			Qname = "DesertQuest";
			NameMon = "Desert Officer";
			PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359);
			PosM = CFrame.new(1608.2822265625, 8.6142244338989, 4371.0073242188);
		elseif I >= 90 and I <= 99 then
			Mon = "Snow Bandit";
			Qdata = 1;
			Qname = "SnowQuest";
			NameMon = "Snow Bandit";
			PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796);
			PosM = CFrame.new(1354.3479003906, 87.272773742676, -1393.9465332031);
		elseif I >= 100 and I <= 119 then
			Mon = "Snowman";
			Qdata = 2;
			Qname = "SnowQuest";
			NameMon = "Snowman";
			PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796);
			PosM = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625);
		elseif I >= 120 and I <= 149 then
			Mon = "Chief Petty Officer";
			Qdata = 1;
			Qname = "MarineQuest2";
			NameMon = "Chief Petty Officer";
			PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018);
			PosM = CFrame.new(-4881.2309570312, 22.652044296265, 4273.7524414062);
		elseif I >= 150 and I <= 174 then
			Mon = "Sky Bandit";
			Qdata = 1;
			Qname = "SkyQuest";
			NameMon = "Sky Bandit";
			PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165);
			PosM = CFrame.new(-4953.20703125, 295.74420166016, -2899.2290039062);
		elseif I >= 175 and I <= 189 then
			Mon = "Dark Master";
			Qdata = 2;
			Qname = "SkyQuest";
			NameMon = "Dark Master";
			PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165);
			PosM = CFrame.new(-5259.8447265625, 391.39767456055, -2229.0354003906);
		elseif I >= 190 and I <= 209 then
			Mon = "Prisoner";
			Qdata = 1;
			Qname = "PrisonerQuest";
			NameMon = "Prisoner";
			PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514);
			PosM = CFrame.new(5098.9736328125, -0.3204058110714, 474.23733520508);
		elseif I >= 210 and I <= 249 then
			Mon = "Dangerous Prisoner";
			Qdata = 2;
			Qname = "PrisonerQuest";
			NameMon = "Dangerous Prisoner";
			PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514);
			PosM = CFrame.new(5654.5634765625, 15.633401870728, 866.29919433594);
		elseif I >= 250 and I <= 274 then
			Mon = "Toga Warrior";
			Qdata = 1;
			Qname = "ColosseumQuest";
			NameMon = "Toga Warrior";
			PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534);
			PosM = CFrame.new(-1820.21484375, 51.683856964111, -2740.6650390625);
		elseif I >= 275 and I <= 299 then
			Mon = "Gladiator";
			Qdata = 2;
			Qname = "ColosseumQuest";
			NameMon = "Gladiator";
			PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534);
			PosM = CFrame.new(-1292.8381347656, 56.380882263184, -3339.0314941406);
		elseif I >= 300 and I <= 324 then
			Mon = "Military Soldier";
			Qdata = 1;
			Qname = "MagmaQuest";
			NameMon = "Military Soldier";
			PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395);
			PosM = CFrame.new(-5411.1645507812, 11.081554412842, 8454.29296875);
		elseif I >= 325 and I <= 374 then
			Mon = "Military Spy";
			Qdata = 2;
			Qname = "MagmaQuest";
			NameMon = "Military Spy";
			PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395);
			PosM = CFrame.new(-5802.8681640625, 86.262413024902, 8828.859375);
		elseif I >= 375 and I <= 399 then
			Mon = "Fishman Warrior";
			Qdata = 1;
			Qname = "FishmanQuest";
			NameMon = "Fishman Warrior";
			PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
			PosM = CFrame.new(60878.30078125, 18.482830047607, 1543.7574462891);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
			end;
		elseif I >= 400 and I <= 449 then
			Mon = "Fishman Commando";
			Qdata = 2;
			Qname = "FishmanQuest";
			NameMon = "Fishman Commando";
			PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
			PosM = CFrame.new(61922.6328125, 18.482830047607, 1493.9343261719);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
			end;
		elseif I >= 450 and I <= 474 then
			Mon = "God's Guard";
			Qdata = 1;
			Qname = "SkyExp1Quest";
			NameMon = "God's Guard";
			PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643);
			PosM = CFrame.new(-4710.04296875, 845.27697753906, -1927.3079833984);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688));
			end;
		elseif I >= 475 and I <= 524 then
			Mon = "Shanda";
			Qdata = 2;
			Qname = "SkyExp1Quest";
			NameMon = "Shanda";
			PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196);
			PosM = CFrame.new(-7678.4897460938, 5566.4038085938, -497.21560668945);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047));
			end;
		elseif I >= 525 and I <= 549 then
			Mon = "Royal Squad";
			Qdata = 1;
			Qname = "SkyExp2Quest";
			NameMon = "Royal Squad";
			PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194);
			PosM = CFrame.new(-7624.2524414062, 5658.1333007812, -1467.3542480469);
		elseif I >= 550 and I <= 624 then
			Mon = "Royal Soldier";
			Qdata = 2;
			Qname = "SkyExp2Quest";
			NameMon = "Royal Soldier";
			PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194);
			PosM = CFrame.new(-7836.7534179688, 5645.6640625, -1790.6236572266);
		elseif I >= 625 and I <= 649 then
			Mon = "Galley Pirate";
			Qdata = 1;
			Qname = "FountainQuest";
			NameMon = "Galley Pirate";
			PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293);
			PosM = CFrame.new(5551.0219726562, 78.901351928711, 3930.4128417969);
		elseif I >= 650 then
			Mon = "Galley Captain";
			Qdata = 2;
			Qname = "FountainQuest";
			NameMon = "Galley Captain";
			PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293);
			PosM = CFrame.new(5441.9516601562, 42.502059936523, 4950.09375);
		end;
	elseif World2 then
		if I >= 700 and I <= 724 then
			Mon = "Raider";
			Qdata = 1;
			Qname = "Area1Quest";
			NameMon = "Raider";
			PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188);
			PosM = CFrame.new(-728.32672119141, 52.779319763184, 2345.7705078125);
		elseif I >= 725 and I <= 774 then
			Mon = "Mercenary";
			Qdata = 2;
			Qname = "Area1Quest";
			NameMon = "Mercenary";
			PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188);
			PosM = CFrame.new(-1004.3244018555, 80.158866882324, 1424.6193847656);
		elseif I >= 775 and I <= 799 then
			Mon = "Swan Pirate";
			Qdata = 1;
			Qname = "Area2Quest";
			NameMon = "Swan Pirate";
			PosQ = CFrame.new(638.43811, 71.769989, 918.282898);
			PosM = CFrame.new(1068.6643066406, 137.61428833008, 1322.1060791016);
		elseif I >= 800 and I <= 874 then
			Mon = "Factory Staff";
			Qname = "Area2Quest";
			Qdata = 2;
			NameMon = "Factory Staff";
			PosQ = CFrame.new(632.698608, 73.1055908, 918.666321);
			PosM = CFrame.new(73.078674316406, 81.863441467285, -27.470672607422);
		elseif I >= 875 and I <= 899 then
			Mon = "Marine Lieutenant";
			Qdata = 1;
			Qname = "MarineQuest3";
			NameMon = "Marine Lieutenant";
			PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812);
			PosM = CFrame.new(-2821.3723144531, 75.897277832031, -3070.0891113281);
		elseif I >= 900 and I <= 949 then
			Mon = "Marine Captain";
			Qdata = 2;
			Qname = "MarineQuest3";
			NameMon = "Marine Captain";
			PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812);
			PosM = CFrame.new(-1861.2310791016, 80.176582336426, -3254.6975097656);
		elseif I >= 950 and I <= 974 then
			Mon = "Zombie";
			Qdata = 1;
			Qname = "ZombieQuest";
			NameMon = "Zombie";
			PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061);
			PosM = CFrame.new(-5657.7768554688, 78.969734191895, -928.68701171875);
		elseif I >= 975 and I <= 999 then
			Mon = "Vampire";
			Qdata = 2;
			Qname = "ZombieQuest";
			NameMon = "Vampire";
			PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061);
			PosM = CFrame.new(-6037.66796875, 32.184638977051, -1340.6597900391);
		elseif I >= 1000 and I <= 1049 then
			Mon = "Snow Trooper";
			Qdata = 1;
			Qname = "SnowMountainQuest";
			NameMon = "Snow Trooper";
			PosQ = CFrame.new(609.858826, 400.119904, -5372.25928);
			PosM = CFrame.new(549.14733886719, 427.38705444336, -5563.6987304688);
		elseif I >= 1050 and I <= 1099 then
			Mon = "Winter Warrior";
			Qdata = 2;
			Qname = "SnowMountainQuest";
			NameMon = "Winter Warrior";
			PosQ = CFrame.new(609.858826, 400.119904, -5372.25928);
			PosM = CFrame.new(1142.7451171875, 475.63980102539, -5199.4165039062);
		elseif I >= 1100 and I <= 1124 then
			Mon = "Lab Subordinate";
			Qdata = 1;
			Qname = "IceSideQuest";
			NameMon = "Lab Subordinate";
			PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852);
			PosM = CFrame.new(-5707.4716796875, 15.951709747314, -4513.3920898438);
		elseif I >= 1125 and I <= 1174 then
			Mon = "Horned Warrior";
			Qdata = 2;
			Qname = "IceSideQuest";
			NameMon = "Horned Warrior";
			PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852);
			PosM = CFrame.new(-6341.3666992188, 15.951770782471, -5723.162109375);
		elseif I >= 1175 and I <= 1199 then
			Mon = "Magma Ninja";
			Qdata = 1;
			Qname = "FireSideQuest";
			NameMon = "Magma Ninja";
			PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457);
			PosM = CFrame.new(-5449.6728515625, 76.658744812012, -5808.2006835938);
		elseif I >= 1200 and I <= 1249 then
			Mon = "Lava Pirate";
			Qdata = 2;
			Qname = "FireSideQuest";
			NameMon = "Lava Pirate";
			PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457);
			PosM = CFrame.new(-5213.3315429688, 49.737880706787, -4701.451171875);
		elseif I >= 1250 and I <= 1274 then
			Mon = "Ship Deckhand";
			Qdata = 1;
			Qname = "ShipQuest1";
			NameMon = "Ship Deckhand";
			PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016);
			PosM = CFrame.new(1212.0111083984, 150.79205322266, 33059.24609375);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif I >= 1275 and I <= 1299 then
			Mon = "Ship Engineer";
			Qdata = 2;
			Qname = "ShipQuest1";
			NameMon = "Ship Engineer";
			PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016);
			PosM = CFrame.new(919.47863769531, 43.544013977051, 32779.96875);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif I >= 1300 and I <= 1324 then
			Mon = "Ship Steward";
			Qdata = 1;
			Qname = "ShipQuest2";
			NameMon = "Ship Steward";
			PosQ = CFrame.new(968.80957, 125.092171, 33244.125);
			PosM = CFrame.new(919.43853759766, 129.55599975586, 33436.03515625);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif I >= 1325 and I <= 1349 then
			Mon = "Ship Officer";
			Qdata = 2;
			Qname = "ShipQuest2";
			NameMon = "Ship Officer";
			PosQ = CFrame.new(968.80957, 125.092171, 33244.125);
			PosM = CFrame.new(1036.0179443359, 181.4390411377, 33315.7265625);
			if _G.Settings.Main["Auto Farm"] and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif I >= 1350 and I <= 1374 then
			Mon = "Arctic Warrior";
			Qdata = 1;
			Qname = "FrostQuest";
			NameMon = "Arctic Warrior";
			PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984);
			PosM = CFrame.new(5966.24609375, 62.970020294189, -6179.3828125);
		elseif I >= 1375 and I <= 1424 then
			Mon = "Snow Lurker";
			Qdata = 2;
			Qname = "FrostQuest";
			NameMon = "Snow Lurker";
			PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984);
			PosM = CFrame.new(5407.0737304688, 69.194374084473, -6880.8803710938);
		elseif I >= 1425 and I <= 1449 then
			Mon = "Sea Soldier";
			Qdata = 1;
			Qname = "ForgottenQuest";
			NameMon = "Sea Soldier";
			PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193);
			PosM = CFrame.new(-3028.2236328125, 64.674514770508, -9775.4267578125);
		elseif I >= 1450 then
			Mon = "Water Fighter";
			Qdata = 2;
			Qname = "ForgottenQuest";
			NameMon = "Water Fighter";
			PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193);
			PosM = CFrame.new(-3352.9013671875, 285.01556396484, -10534.841796875);
		end;
	elseif World3 then
		if I >= 1500 and I <= 1524 then
			Mon = "Pirate Millionaire";
			Qdata = 1;
			Qname = "PiratePortQuest";
			NameMon = "Pirate Millionaire";
			PosQ = CFrame.new(-290.07, 42.90, 5581.59);
			PosM = CFrame.new(-246.00, 47.31, 5584.10);
		elseif I >= 1525 and I <= 1574 then
			Mon = "Pistol Billionaire";
			Qdata = 2;
			Qname = "PiratePortQuest";
			NameMon = "Pistol Billionaire";
			PosQ = CFrame.new(-290.07, 42.90, 5581.59);
			PosM = CFrame.new(-187.33, 86.24, 6013.51);
		elseif I >= 1575 and I <= 1599 then
			Mon = "Dragon Crew Warrior";
			Qdata = 1;
			Qname = "DragonCrewQuest";
			NameMon = "Dragon Crew Warrior";
			PosQ = CFrame.new(6737.06055, 127.417763, -712.300659, -0.463954359, -7.19574755e-09, 0.885859072, 7.69187665e-08, 1, 4.84078626e-08, -0.885859072, 9.05982276e-08, -0.463954359);
			PosM = CFrame.new(6709.76367, 52.3442993, -1139.02966, -0.763515472, 0, 0.645789504, 0, 1, 0, -0.645789504, 0, -0.763515472);
		elseif I >= 1600 and I <= 1624 then
			Mon = "Dragon Crew Archer";
			Qdata = 2;
			Qname = "DragonCrewQuest";
			NameMon = "Dragon Crew Archer";
			PosQ = CFrame.new(6737.06055, 127.417763, -712.300659, -0.463954359, -7.19574755e-09, 0.885859072, 7.69187665e-08, 1, 4.84078626e-08, -0.885859072, 9.05982276e-08, -0.463954359);
			PosM = CFrame.new(6668.76172, 481.376923, 329.12207, -0.121787429, 0, -0.992556155, 0, 1, 0, 0.992556155, 0, -0.121787429);
		elseif I >= 1625 and I <= 1649 then
			Mon = "Hydra Enforcer";
			Qname = "VenomCrewQuest";
			Qdata = 1;
			NameMon = "Hydra Enforcer";
			PosQ = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875);
			PosM = CFrame.new(4547.11523, 1003.10217, 334.194824, 0.388810456, -0, -0.921317935, 0, 1, -0, 0.921317935, 0, 0.388810456);
		elseif I >= 1650 and I <= 1699 then
			Mon = "Venomous Assailant";
			Qname = "VenomCrewQuest";
			Qdata = 2;
			NameMon = "Venomous Assailant";
			PosQ = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875);
			PosM = CFrame.new(4674.92676, 1134.82654, 996.308838, 0.731321394, -0, -0.682033002, 0, 1, -0, 0.682033002, 0, 0.731321394);
		elseif I >= 1700 and I <= 1724 then
			Mon = "Marine Commodore";
			Qdata = 1;
			Qname = "MarineTreeIsland";
			NameMon = "Marine Commodore";
			PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747);
			PosM = CFrame.new(2286.0078125, 73.133918762207, -7159.8090820312);
		elseif I >= 1725 and I <= 1774 then
			Mon = "Marine Rear Admiral";
			NameMon = "Marine Rear Admiral";
			Qname = "MarineTreeIsland";
			Qdata = 2;
			PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813);
			PosM = CFrame.new(3656.7736816406, 160.52406311035, -7001.5986328125);
		elseif I >= 1775 and I <= 1799 then
			Mon = "Fishman Raider";
			Qdata = 1;
			Qname = "DeepForestIsland3";
			NameMon = "Fishman Raider";
			PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			PosM = CFrame.new(-10407.526367188, 331.76263427734, -8368.5166015625);
		elseif I >= 1800 and I <= 1824 then
			Mon = "Fishman Captain";
			Qdata = 2;
			Qname = "DeepForestIsland3";
			NameMon = "Fishman Captain";
			PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			PosM = CFrame.new(-10994.701171875, 352.38140869141, -9002.1103515625);
		elseif I >= 1825 and I <= 1849 then
			Mon = "Forest Pirate";
			Qdata = 1;
			Qname = "DeepForestIsland";
			NameMon = "Forest Pirate";
			PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, 0.707134247);
			PosM = CFrame.new(-13274.478515625, 332.37814331055, -7769.5805664062);
		elseif I >= 1850 and I <= 1899 then
			Mon = "Mythological Pirate";
			Qdata = 2;
			Qname = "DeepForestIsland";
			NameMon = "Mythological Pirate";
			PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, 0.707134247);
			PosM = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125);
		elseif I >= 1900 and I <= 1924 then
			Mon = "Jungle Pirate";
			Qdata = 1;
			Qname = "DeepForestIsland2";
			NameMon = "Jungle Pirate";
			PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
			PosM = CFrame.new(-12256.16015625, 331.73828125, -10485.836914062);
		elseif I >= 1925 and I <= 1974 then
			Mon = "Musketeer Pirate";
			Qdata = 2;
			Qname = "DeepForestIsland2";
			NameMon = "Musketeer Pirate";
			PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
			PosM = CFrame.new(-13457.904296875, 391.54565429688, -9859.177734375);
		elseif I >= 1975 and I <= 1999 then
			Mon = "Reborn Skeleton";
			Qdata = 1;
			Qname = "HauntedQuest1";
			NameMon = "Reborn Skeleton";
			PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0);
			PosM = CFrame.new(-8763.7236328125, 165.72299194336, 6159.8618164062);
		elseif I >= 2000 and I <= 2024 then
			Mon = "Living Zombie";
			Qdata = 2;
			Qname = "HauntedQuest1";
			NameMon = "Living Zombie";
			PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0);
			PosM = CFrame.new(-10144.131835938, 138.6266784668, 5838.0888671875);
		elseif I >= 2025 and I <= 2049 then
			Mon = "Demonic Soul";
			Qdata = 1;
			Qname = "HauntedQuest2";
			NameMon = "Demonic Soul";
			PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			PosM = CFrame.new(-9505.8720703125, 172.10482788086, 6158.9931640625);
		elseif I >= 2050 and I <= 2074 then
			Mon = "Posessed Mummy";
			Qdata = 2;
			Qname = "HauntedQuest2";
			NameMon = "Posessed Mummy";
			PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			PosM = CFrame.new(-9582.0224609375, 6.2515273094177, 6205.478515625);
		elseif I >= 2075 and I <= 2099 then
			Mon = "Peanut Scout";
			Qdata = 1;
			Qname = "NutsIslandQuest";
			NameMon = "Peanut Scout";
			PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			PosM = CFrame.new(-2143.2419433594, 47.721984863281, -10029.995117188);
		elseif I >= 2100 and I <= 2124 then
			Mon = "Peanut President";
			Qdata = 2;
			Qname = "NutsIslandQuest";
			NameMon = "Peanut President";
			PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			PosM = CFrame.new(-1859.3540039062, 38.103168487549, -10422.4296875);
		elseif I >= 2125 and I <= 2149 then
			Mon = "Ice Cream Chef";
			Qdata = 1;
			Qname = "IceCreamIslandQuest";
			NameMon = "Ice Cream Chef";
			PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			PosM = CFrame.new(-872.24658203125, 65.81957244873, -10919.95703125);
		elseif I >= 2150 and I <= 2199 then
			Mon = "Ice Cream Commander";
			Qdata = 2;
			Qname = "IceCreamIslandQuest";
			NameMon = "Ice Cream Commander";
			PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			PosM = CFrame.new(-558.06103515625, 112.04895782471, -11290.774414062);
		elseif I >= 2200 and I <= 2224 then
			Mon = "Cookie Crafter";
			Qdata = 1;
			Qname = "CakeQuest1";
			NameMon = "Cookie Crafter";
			PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931);
			PosM = CFrame.new(-2374.13671875, 37.798263549805, -12125.30859375);
		elseif I >= 2225 and I <= 2249 then
			Mon = "Cake Guard";
			Qdata = 2;
			Qname = "CakeQuest1";
			NameMon = "Cake Guard";
			PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931);
			PosM = CFrame.new(-1598.3070068359, 43.773197174072, -12244.581054688);
		elseif I >= 2250 and I <= 2274 then
			Mon = "Baking Staff";
			Qdata = 1;
			Qname = "CakeQuest2";
			NameMon = "Baking Staff";
			PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446);
			PosM = CFrame.new(-1887.8099365234, 77.618507385254, -12998.350585938);
		elseif I >= 2275 and I <= 2299 then
			Mon = "Head Baker";
			Qdata = 2;
			Qname = "CakeQuest2";
			NameMon = "Head Baker";
			PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446);
			PosM = CFrame.new(-2216.1882324219, 82.884521484375, -12869.293945312);
		elseif I >= 2300 and I <= 2324 then
			Mon = "Cocoa Warrior";
			Qdata = 1;
			Qname = "ChocQuest1";
			NameMon = "Cocoa Warrior";
			PosQ = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438);
			PosM = CFrame.new(-21.553283691406, 80.574996948242, -12352.387695312);
		elseif I >= 2325 and I <= 2349 then
			Mon = "Chocolate Bar Battler";
			Qdata = 2;
			Qname = "ChocQuest1";
			NameMon = "Chocolate Bar Battler";
			PosQ = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438);
			PosM = CFrame.new(582.59057617188, 77.188095092773, -12463.162109375);
		elseif I >= 2350 and I <= 2374 then
			Mon = "Sweet Thief";
			Qdata = 1;
			Qname = "ChocQuest2";
			NameMon = "Sweet Thief";
			PosQ = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688);
			PosM = CFrame.new(165.1884765625, 76.058853149414, -12600.836914062);
		elseif I >= 2375 and I <= 2399 then
			Mon = "Candy Rebel";
			Qdata = 2;
			Qname = "ChocQuest2";
			NameMon = "Candy Rebel";
			PosQ = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688);
			PosM = CFrame.new(134.86563110352, 77.247680664062, -12876.547851562);
		elseif I >= 2400 and I <= 2449 then
			Mon = "Candy Pirate";
			Qdata = 1;
			Qname = "CandyQuest1";
			NameMon = "Candy Pirate";
			PosQ = CFrame.new(-1150.0400390625, 20.378934860229, -14446.334960938);
			PosM = CFrame.new(-1310.5003662109, 26.016523361206, -14562.404296875);
		elseif I >= 2450 and I <= 2474 then
			Mon = "Isle Outlaw";
			Qdata = 1;
			Qname = "TikiQuest1";
			NameMon = "Isle Outlaw";
			PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566);
			PosM = CFrame.new(-16479.900390625, 226.6117401123, -300.31143188477);
		elseif I >= 2475 and I <= 2499 then
			Mon = "Island Boy";
			Qdata = 2;
			Qname = "TikiQuest1";
			NameMon = "Island Boy";
			PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566);
			PosM = CFrame.new(-16849.396484375, 192.86505126953, -150.78532409668);
		elseif I >= 2500 and I <= 2524 then
			Mon = "Sun-kissed Warrior";
			Qdata = 1;
			Qname = "TikiQuest2";
			NameMon = "Sun-kissed Warrior";
			PosM = CFrame.new(-16347, 64, 984);
			PosQ = CFrame.new(-16538, 55, 1049);
		elseif I >= 2525 and I <= 2550 then
			Mon = "Isle Champion";
			Qdata = 2;
			Qname = "TikiQuest2";
			NameMon = "Isle Champion";
			PosQ = CFrame.new(-16541.0215, 57.3082275, 1051.46118, 0.0410757065, 0, -0.999156058, 0, 1, 0, 0.999156058, 0, 0.0410757065);
			PosM = CFrame.new(-16602.1015625, 130.38734436035, 1087.2456054688);
		elseif I >= 2551 and I <= 2574 then
			Mon = "Serpent Hunter";
			Qdata = 1;
			Qname = "TikiQuest3";
			NameMon = "Serpent Hunter";
			PosQ = CFrame.new(-16668.03, 105.32, 1568.60);
			PosM = CFrame.new(-16645.64, 163.09, 1352.87);
		elseif I >= 2575 and I <= 2699 then
			Mon = "Skull Slayer";
			Qdata = 2;
			Qname = "TikiQuest3";
			NameMon = "Skull Slayer";
			PosQ = CFrame.new(-16668.03, 105.32, 1568.60);
			PosM = CFrame.new(-16709.49, 419.68, 1751.09);
		-- =============================================
		-- SUBMERGED ISLAND (Level 2700+) — entra pelo
		-- NPC do submarino na Tiki Outpost
		-- =============================================
		elseif I >= 2700 and I <= 2749 then
			Mon = "Drowned Pirate";
			Qdata = 1;
			Qname = "SubmergedQuest1";
			NameMon = "Drowned Pirate";
			PosQ = CFrame.new(-16490.18, 55.77, 1768.44);   -- NPC submarino (Tiki)
			PosM = CFrame.new(-16480.00, -85.00, 1740.00);  -- área submarina
			if _G.Settings.Main["Auto Farm"] then
				pcall(function()
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
						"requestEntrance", Vector3.new(-16490.18, 55.77, 1768.44)
					);
				end);
			end;
		elseif I >= 2750 and I <= 2824 then
			Mon = "Lurker";
			Qdata = 2;
			Qname = "SubmergedQuest1";
			NameMon = "Lurker";
			PosQ = CFrame.new(-16490.18, 55.77, 1768.44);
			PosM = CFrame.new(-16420.00, -90.00, 1700.00);
			if _G.Settings.Main["Auto Farm"] then
				pcall(function()
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
						"requestEntrance", Vector3.new(-16490.18, 55.77, 1768.44)
					);
				end);
			end;
		elseif I >= 2825 then
			Mon = "Sea Raider";
			Qdata = 2;
			Qname = "SubmergedQuest2";
			NameMon = "Sea Raider";
			PosQ = CFrame.new(-16490.18, 55.77, 1768.44);
			PosM = CFrame.new(-16380.00, -95.00, 1680.00);
			if _G.Settings.Main["Auto Farm"] then
				pcall(function()
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
						"requestEntrance", Vector3.new(-16490.18, 55.77, 1768.44)
					);
				end);
			end;
		end;
	end;
	LevelQuest = Qdata;
	NameQuest = Qname;
	CFrameQuest = PosQ;
	CFrameMon = PosM;
	MonFarm = Mon;
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
-- Equipa a arma correta automaticamente baseado no tipo selecionado (Melee/Sword/Fruit/Gun)
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
	else -- Melee / Fighting Style
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
			if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds" then
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
function TweenBoat(pos)
	local TweenService = game:GetService("TweenService");
	local Boat = workspace.Boats[_G.Settings.SeaEvent["Selected Boat"]];
	if not Boat or (not Boat:FindFirstChild("VehicleSeat")) then
		warn("Boat atau VehicleSeat tidak ditemukan!");
		return {
			Stop = function()
			end
		};
	end;
	local targetCFrame = pos;
	if typeof(pos) == "Instance" and pos:IsA("BasePart") then
		targetCFrame = pos.CFrame;
	elseif typeof(pos) ~= "CFrame" then
		warn("Argumen 'pos' harus berupa CFrame atau BasePart!");
		return {
			Stop = function()
			end
		};
	end;
	local startPosition = Boat.VehicleSeat.Position;
	local endPosition = targetCFrame.Position;
	local distance = (startPosition - endPosition).Magnitude;
	local tween = nil;
	local duration = distance / (_G.Settings.SeaEvent["Boat Tween Speed"] or 100);
	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear);
	tween = TweenService:Create(Boat.VehicleSeat, info, {
		CFrame = targetCFrame
	});
	if distance > 25 then
		tween:Play();
	else
		warn("Jarak terlalu dekat, tween dibatalkan.");
	end;
	local StopTweenBoat = {};
	function StopTweenBoat:Stop()
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
BringEnemy = function()
	if not _G.Settings.Setting["Bring Mob"] or not _B then return end;
	local plr = game.Players.LocalPlayer;
	local char = plr.Character;
	local hrp = char and char:FindFirstChild("HumanoidRootPart");
	if not hrp then return end;
	pcall(function()
		sethiddenproperty(plr, "SimulationRadius", math.huge);
	end);
	local rawPos = PosMon or hrp.Position;
	local targetPos = typeof(rawPos) == "CFrame" and rawPos.Position or rawPos;
	local enemies = workspace.Enemies:GetChildren();
	local count = 0;
	for _, mob in ipairs(enemies) do
		if count >= _G.MaxBringMobs then break end;
		local hum = mob:FindFirstChild("Humanoid");
		local root = mob:FindFirstChild("HumanoidRootPart");
		if hum and root and hum.Health > 0 and not IsRaidMob(mob) then
			local dist = (root.Position - targetPos).Magnitude;
			if dist <= _G.BringRange and not root:GetAttribute("Tweening") then
				count = count + 1;
				root:SetAttribute("Tweening", true);
				-- Teleporte direto: mais confiável que tween para garantir ataque
				root.CFrame = CFrame.new(targetPos);
				root:SetAttribute("Tweening", false);
				-- Ataca o mob imediatamente após trazer
				pcall(function()
					local head = mob:FindFirstChild("Head") or root;
					if head and hum.Health > 0 then
						local otherMobs = {};
						for _, m2 in ipairs(enemies) do
							if m2 ~= mob and m2:FindFirstChild("HumanoidRootPart") then
								table.insert(otherMobs, {[1] = m2, [2] = m2:FindFirstChild("HumanoidRootPart")});
							end;
						end;
						AttackModule:AttackEnemy(head, otherMobs);
					end;
				end);
			end;
		end;
	end;
end;
task.spawn(function()
	while task.wait(0.8) do
		if _G.Settings.Setting["Bring Mob"] then
			_B = true;
			BringEnemy();
		else
			_B = false;
		end;
	end;
end);
local C = Instance.new("Part", workspace);
C.Size = Vector3.new(1, 1, 1);
C.Name = "SaturnFarmPart";
C.Anchored = true;
C.CanCollide = false;
C.CanTouch = false;
C.Transparency = 1;
local existingC = workspace:FindFirstChild(C.Name);
if existingC and existingC ~= C then
	existingC:Destroy();
end;
getgenv().TweenSpeedFar = 350;
getgenv().TweenSpeedNear = 700;
local shouldTween = false;
local _tweenRestored = true; -- track if CanCollide was restored
task.spawn(function()
	local plr = game.Players.LocalPlayer;
	repeat task.wait() until plr.Character and plr.Character.PrimaryPart;
	C.CFrame = plr.Character.PrimaryPart.CFrame;
	while task.wait() do
		pcall(function()
			if shouldTween then
				_tweenRestored = false;
				if C and C.Parent == workspace then
					local e = plr.Character and plr.Character.PrimaryPart;
					if e and (e.Position - C.Position).Magnitude <= 200 then
						e.CFrame = C.CFrame;
					else
						C.CFrame = e.CFrame;
					end;
				end;
				-- Desativa colisão APENAS durante tween ativo
				local e = plr.Character;
				if e then
					for _, v in pairs(e:GetChildren()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			else
				-- Restaura colisão imediatamente quando tween para
				if not _tweenRestored then
					_tweenRestored = true;
					local e = plr.Character;
					if e then
						for _, v in pairs(e:GetChildren()) do
							if v:IsA("BasePart") then
								v.CanCollide = true;
							end;
						end;
						-- Sincroniza C com posição atual
						local hrp = e:FindFirstChild("HumanoidRootPart");
						if hrp and C and C.Parent then
							C.CFrame = hrp.CFrame;
						end;
					end;
				end;
			end;
		end);
	end;
end);
function TweenPlayer(pos)
	local plr = game.Players.LocalPlayer;
	local e = plr.Character;
	if not e or not e:FindFirstChild("HumanoidRootPart") then return end;
	local HRP = e.HumanoidRootPart;
	shouldTween = true;
	if HRP.Anchored then
		HRP.Anchored = false;
		task.wait();
	end;
	local dist = (pos.Position - HRP.Position).Magnitude;
	local speed = dist <= 15 and (getgenv().TweenSpeedNear or 700) or (getgenv().TweenSpeedFar or 350);
	local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear);
	local tween = TweenService:Create(C, info, {CFrame = pos});
	if e.Humanoid.Sit == true then
		C.CFrame = CFrame.new(C.Position.X, pos.Y, C.Position.Z);
	end;
	tween:Play();
	task.spawn(function()
		while tween.PlaybackState == Enum.PlaybackState.Playing do
			if not shouldTween or _G.StopTween then
				tween:Cancel();
				shouldTween = false;
				break;
			end;
			task.wait(0.1);
		end;
	end);
end;
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
	-- Garante ataque direto ao mob (não depende só da proximidade)
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
local RegisterHit = net:WaitForChild("RE/RegisterHit");
function AttackModule:AttackEnemy(EnemyHead, Table)
	if EnemyHead then
		RegisterAttack:FireServer(0);
		RegisterAttack:FireServer(1);
		RegisterAttack:FireServer(2);
		RegisterAttack:FireServer(3);
		RegisterHit:FireServer(EnemyHead, Table or {});
	end;
end;
function AttackModule:AttackNearest()
	local mon = {nil, {}};
	for _, Enemy in enemyFolder:GetChildren() do
		if not mon[1] and Enemy:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 60 then
			mon[1] = Enemy:FindFirstChild("HumanoidRootPart");
		elseif Enemy:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 60 then
			table.insert(mon[2], {[1] = Enemy, [2] = Enemy:FindFirstChild("HumanoidRootPart")});
		end;
	end;
	self:AttackEnemy(unpack(mon));
	local player = {nil, {}};
	for _, Player in playerFolder:GetChildren() do
		if Player.Character then
			if not player[1] and Player.Character:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Player.Character.HumanoidRootPart.Position) < 60 then
				player[1] = Player.Character:FindFirstChild("HumanoidRootPart");
			elseif Player.Character:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Player.Character.HumanoidRootPart.Position) < 60 then
				table.insert(player[2], {[1] = Player, [2] = Player.Character:FindFirstChild("HumanoidRootPart")});
			end;
		end;
	end;
	self:AttackEnemy(unpack(player));
end;
function AttackModule:BladeHits()
	self:AttackNearest();
end;
function Attack()
	if not _G.Settings.Main["Auto Farm Fruit Mastery"] or (not _G.Settings.Main["Auto Farm Gun Mastery"]) then
		if _G.Settings.Setting["Fast Attack"] then
			wait(_G.Settings.Setting["Fast Attack Delay"]);
			AttackModule:BladeHits();
		else
			wait(0.5);
			AttackModule:BladeHits();
		end;
	end;
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
function StopTween(State)
	if not State then
		_G.StopTween = true;
		shouldTween = false;
		-- Cancela tweens ativos imediatamente
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local char = plr.Character;
			if not char then return; end;
			local hrp = char:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			-- Sincroniza C com posição atual para não arrastar
			if C and C.Parent then
				C.CFrame = hrp.CFrame;
			end;
			-- Remove BodyClip se existir
			if hrp:FindFirstChild("BodyClip") then
				hrp:FindFirstChild("BodyClip"):Destroy();
			end;
			-- Restaura física de todas as partes do personagem
			for _, v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = true;
					if v.Anchored and v ~= hrp then
						v.Anchored = false;
					end;
				end;
			end;
			-- Libera HRP
			hrp.Anchored = false;
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
MainSection = Tabs.MainTab:Section({
	Title = "Main",
	TextXAlignment = "Left"
});
GameTimeParagraph = Tabs.MainTab:Paragraph({
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
FpsParagraph = Tabs.MainTab:Paragraph({
	Title = "Fps",
	Desc = "0",
	Image = "monitor",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			FpsParagraph:SetDesc(workspace:GetRealPhysicsFPS());
		end);
	end;
end);
PingParagraph = Tabs.MainTab:Paragraph({
	Title = "Ping",
	Desc = "0",
	Image = "signal",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			PingParagraph:SetDesc((game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValueString());
		end);
	end;
end);
DiscordServerParagraph = Tabs.MainTab:Paragraph({
	Title = "Discord Server",
	Desc = "Join discord server to get update info and webhooks!",
	TextXAlignment = "Left",
	Buttons = {
		{
			Title = "Copy Link",
			Callback = function()
				setclipboard("https://discord.gg/BJVQqMtZ2A");
				Library:Notify({
					Title = "Notification",
					Content = "Copied",
					Icon = "bell",
					Duration = 3
				});
			end
		}
	}
});
-- ========== LEVEL FARM (Sistema Atualizado - Dinâmico) ==========

LevelFarmSection = Tabs.MainTab:Section({
	Title = "🌾 Level Farm (Motor Eclipse)",
	TextXAlignment = "Left"
});

-- ---- QuestNeta: wrapper que usa o CheckQuest() do Eclipse ----
-- Garante compatibilidade total com o sistema de quests existente
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

-- ---- Variáveis de controle Eclipse ----
_G.EclipseFarmMode    = "Level";
_G.EclipseStartFarm   = false;
_G.EclipseLevel       = false;
_G.EclipseFarm_Bone   = false;
_G.EclipseFarm_Cake   = false;
_G.EclipseAutoTyrant  = false;
_G.EclipseAcceptQuest = false;

local FARM_HEIGHT          = 45;
local TP_DIST_THRESHOLD    = 15;

-- ============================================================
-- RESPAWN HANDLER: continua farm mesmo após morte/reset
-- ============================================================
local _waitingForChar = false;
game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
	_waitingForChar = true;
	task.wait(2); -- aguarda personagem carregar completamente
	_waitingForChar = false;
	-- Re-sincroniza a parte C com o novo personagem
	pcall(function()
		local newHRP = newChar:WaitForChild("HumanoidRootPart", 5);
		if newHRP and C and C.Parent then
			C.CFrame = newHRP.CFrame;
		end;
		shouldTween = false;
		_tweenRestored = false;
	end);
	-- Restaura estado de farm se estava ativo
	if _G.EclipseStartFarm then
		task.wait(1);
		_G.StopTween = false;
	end;
end);

local function TpConditional(hrp, targetCF, threshold)
	if not hrp or not targetCF then return; end;
	if (targetCF.Position - hrp.Position).Magnitude > threshold then
		TweenPlayer(targetCF);
	end;
end;

-- ---- Dropdown: Modo de Farm ----
Tabs.MainTab:Dropdown({
	Title = "Select Farm Mode",
	Desc = "Level = por quest/level | Bone = Haunted Castle | Cake Prince | Tyrant Of The Skies",
	Values = {"Level", "Bone", "Cake Prince", "Tyrant Of The Skies"},
	Value = "Level",
	Callback = function(v)
		_G.EclipseFarmMode = v;
	end
});

-- ---- Dropdown: Arma ----
local WeaponList = {"Melee","Sword","Fruit","Gun"};
ChooseWeaponDropdown = Tabs.MainTab:Dropdown({
	Title = "Choose Weapon",
	Desc = "Tipo de arma para equipar durante o farm",
	Values = WeaponList,
	Value = _G.Settings.Main["Select Weapon"] or "Melee",
	Callback = function(option)
		_G.Settings.Main["Select Weapon"] = option;
		_G.ChooseWP = option;
		(getgenv()).SaveSetting();
	end
});

-- Auto-detect arma do backpack
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

-- ---- Toggle: Accept Quests ----
Tabs.MainTab:Toggle({
	Title = "Accept Quests",
	Desc = "Aceita quest automaticamente antes de farmar",
	Value = false,
	Callback = function(v)
		_G.EclipseAcceptQuest = v;
	end
});

-- ---- Toggle: Start Farm (ativa o modo selecionado) ----
AutoLevelFarmToggle = Tabs.MainTab:Toggle({
	Title = "Start Farm",
	Desc = "Inicia o modo de farm selecionado",
	Value = _G.Settings.Main["Auto Farm"],
	Callback = function(v)
		_G.EclipseStartFarm = v;
		_G.Settings.Main["Auto Farm"] = v;
		-- Reset de todas as flags para evitar conflito
		_G.EclipseLevel      = false;
		_G.EclipseFarm_Bone  = false;
		_G.EclipseFarm_Cake  = false;
		_G.EclipseAutoTyrant = false;
		if v then
			if _G.EclipseFarmMode == "Level" then
				_G.EclipseLevel = true;
			elseif _G.EclipseFarmMode == "Bone" then
				_G.EclipseFarm_Bone = true;
			elseif _G.EclipseFarmMode == "Cake Prince" then
				_G.EclipseFarm_Cake = true;
			elseif _G.EclipseFarmMode == "Tyrant Of The Skies" then
				_G.EclipseAutoTyrant = true;
			end;
		end;
		StopTween(_G.EclipseStartFarm);
		(getgenv()).SaveSetting();
	end
});

-- ==============================================================
-- LOOP 1: LEVEL FARM (Quest by level - motor Eclipse)
-- ==============================================================
local M3LevelCurrentMob = nil;
local function GetNearestLevelMob(targetName)
	local Root = game.Players.LocalPlayer.Character and
				 game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
	if not Root then return nil; end;
	local Closest, Dist = nil, math.huge;
	for _, Mob in pairs(workspace.Enemies:GetChildren()) do
		if G.Alive(Mob) and Mob.Name == targetName and Mob:FindFirstChild("HumanoidRootPart") then
			local d = (Mob.HumanoidRootPart.Position - Root.Position).Magnitude;
			if d < Dist then Dist = d; Closest = Mob; end;
		end;
	end;
	return Closest;
end;

spawn(function()
	while task.wait(0.1) do
		if _G.EclipseLevel and _G.EclipseStartFarm then
			-- Pausa se personagem está respawnando
			if _waitingForChar then task.wait(2.5); end;
			-- Pausa se fruta apareceu
			if _G.FruitInterrupt then task.wait(0.1); end;
			pcall(function()
				local plr  = game.Players.LocalPlayer;
				-- Re-obtém personagem após respawn
				local char = plr.Character;
				if not char then return; end;
				local Root = char:FindFirstChild("HumanoidRootPart");
				if not Root then return; end;
				local Q = QuestNeta();
				if not Q or not Q[1] then return; end;
				-- Verifica quest ativa
				local QuestVisible = plr.PlayerGui.Main.Quest.Visible;
				local QuestTitle   = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				-- Cancela quest anterior ou errada IMEDIATAMENTE
				if QuestVisible and not string.find(QuestTitle, Q[5] or "") then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest");
					task.wait(0.3);
					return;
				end;
				-- Pega quest se não tiver
				if not QuestVisible then
					TweenPlayer(Q[6]);
					task.wait(0.1);
					if (Root.Position - Q[6].Position).Magnitude <= 50 then
						task.wait(0.8);
						if not _G.EclipseStartFarm or not _G.EclipseLevel then return; end;
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", Q[3], Q[2]);
						task.wait(0.3);
						EquipFarmWeapon();
					end;
					return;
				end;
				-- Equipa arma e haki
				EquipFarmWeapon();
				AutoHaki();
				-- Procura mob mais próximo
				local Nearest = GetNearestLevelMob(Q[1]);
				if M3LevelCurrentMob and G.Alive(M3LevelCurrentMob) and M3LevelCurrentMob.Parent then
					G.Kill(M3LevelCurrentMob, true);
					return;
				else
					M3LevelCurrentMob = nil;
				end;
				if not Nearest then
					TweenPlayer(Q[4]);
					return;
				end;
				M3LevelCurrentMob = Nearest;
				if M3LevelCurrentMob and M3LevelCurrentMob:FindFirstChild("HumanoidRootPart") then
					-- Usa _G.FarmOffset para posição customizada
					local farmOffset = _G.FarmOffset or Pos;
					TweenPlayer(M3LevelCurrentMob.HumanoidRootPart.CFrame * farmOffset);
					EquipFarmWeapon();
					AutoHaki();
				end;
				repeat
					task.wait();
					if _G.FruitInterrupt or _waitingForChar then break; end;
					-- Revalida personagem a cada iteração
					char = plr.Character;
					if not char or not char:FindFirstChild("HumanoidRootPart") then break; end;
					G.Kill(M3LevelCurrentMob, true);
					EquipFarmWeapon();
					AutoHaki();
				until not _G.EclipseStartFarm or not _G.EclipseLevel
					  or _G.FruitInterrupt or _waitingForChar
					  or not M3LevelCurrentMob.Parent
					  or M3LevelCurrentMob.Humanoid.Health <= 0;
				M3LevelCurrentMob = nil;
			end);
		end;
	end;
end);

-- ==============================================================
-- LOOP 2: BONE FARM - Haunted Castle (motor Eclipse melhorado)
-- ==============================================================
spawn(function()
	while task.wait() do
		if _G.EclipseFarm_Bone and _G.EclipseStartFarm then
			pcall(function()
				local plr = game.Players.LocalPlayer;
				local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
				if not hrp then return; end;
				local QuestUI  = plr.PlayerGui.Main.Quest;
				local MOBS     = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"};
				local npcPos   = CFrame.new(-9516.99, 172.01, 6078.46);
				-- Vai ao NPC pegar quest
				if _G.EclipseAcceptQuest and not QuestUI.Visible then
					if (npcPos.Position - hrp.Position).Magnitude > 5 then
						TweenPlayer(npcPos);
					else
						task.wait(0.5);
						local quests = {
							{"StartQuest","HauntedQuest1",1},{"StartQuest","HauntedQuest1",2},
							{"StartQuest","HauntedQuest2",1},{"StartQuest","HauntedQuest2",2}
						};
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
							unpack(quests[math.random(1,#quests)])
						);
						task.wait(1);
					end;
				else
					local function GetClosestBoneMob()
						local closest, shortest = nil, math.huge;
						for _, mobName in pairs(MOBS) do
							for _, mob in pairs(workspace.Enemies:GetChildren()) do
								if mob.Name == mobName and mob:FindFirstChild("Humanoid")
								   and mob.Humanoid.Health > 0 and mob.PrimaryPart then
									local dist = (mob.PrimaryPart.Position - hrp.Position).Magnitude;
									if dist < shortest then shortest = dist; closest = mob; end;
								end;
							end;
						end;
						return closest;
					end;
					local mob = GetClosestBoneMob();
					if mob then
						TweenPlayer(mob.PrimaryPart.CFrame * Pos);
						EquipWeapon(_G.Settings.Main["Selected Weapon"]);
						G.Kill(mob, true);
					else
						TweenPlayer(CFrame.new(-9495.68, 453.58, 5977.34));
					end;
				end;
			end);
		end;
	end;
end);

-- ==============================================================
-- LOOP 3: CAKE PRINCE FARM (motor Eclipse melhorado)
-- ==============================================================
spawn(function()
	while task.wait() do
		if _G.EclipseFarm_Cake and _G.EclipseStartFarm then
			pcall(function()
				local plr     = game.Players.LocalPlayer;
				local hrp     = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
				if not hrp then return; end;
				local enemies = workspace:FindFirstChild("Enemies");
				if not enemies then return; end;
				local CakePos       = CFrame.new(-2091.91, 70.00, -12142.83);
				local PortalEntrance= CFrame.new(-2151.82, 149.32, -12404.91);
				local mirror        = workspace.Map:FindFirstChild("CakeLoaf");
				mirror = mirror and mirror:FindFirstChild("BigMirror");
				local other         = mirror and mirror:FindFirstChild("Other");
				local portalOpen    = other and other.Transparency == 0;
				local boss          = enemies:FindFirstChild("Cake Prince") or enemies:FindFirstChild("Dough King");
				if not boss and not portalOpen
				   and (hrp.Position - CakePos.Position).Magnitude > 3000 then
					TweenPlayer(CakePos); return;
				end;
				if boss or portalOpen then
					if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and boss.PrimaryPart then
						TweenPlayer(boss.PrimaryPart.CFrame * CFrame.new(0, 25, 0));
						EquipWeapon(_G.Settings.Main["Selected Weapon"]);
						G.Kill(boss, true);
						return;
					end;
					if (hrp.Position - PortalEntrance.Position).Magnitude < 500 then
						TpConditional(hrp, PortalEntrance, TP_DIST_THRESHOLD);
					end;
					return;
				end;
				local CAKE_MOBS = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"};
				if _G.EclipseAcceptQuest and not plr.PlayerGui.Main.Quest.Visible then
					local questPos = CFrame.new(-1927.92, 37.80, -12842.54);
					TpConditional(hrp, questPos, TP_DIST_THRESHOLD);
					if (hrp.Position - questPos.Position).Magnitude <= 40 then
						local q = {
							{"StartQuest","CakeQuest2",2},{"StartQuest","CakeQuest2",1},
							{"StartQuest","CakeQuest1",1},{"StartQuest","CakeQuest1",2}
						};
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
							unpack(q[math.random(1,4)])
						);
					end;
					return;
				end;
				local bestMob, bestDist = nil, math.huge;
				for _, mob in ipairs(enemies:GetChildren()) do
					if table.find(CAKE_MOBS, mob.Name) and mob:FindFirstChild("Humanoid")
					   and mob.Humanoid.Health > 0 then
						local dist = (mob.HumanoidRootPart.Position - hrp.Position).Magnitude;
						if dist < bestDist then bestDist = dist; bestMob = mob; end;
					end;
				end;
				if bestMob then
					repeat
						task.wait();
						if enemies:FindFirstChild("Cake Prince") or
						   (workspace.Map.CakeLoaf.BigMirror.Other.Transparency == 0) then
							break;
						end;
						if bestMob.Parent and bestMob.Humanoid.Health > 0 then
							TweenPlayer(bestMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0));
							EquipWeapon(_G.Settings.Main["Selected Weapon"]);
							G.Kill(bestMob, true);
						else break; end;
					until not _G.EclipseStartFarm or not _G.EclipseFarm_Cake
						  or not bestMob.Parent or bestMob.Humanoid.Health <= 0;
				else
					TpConditional(hrp, CFrame.new(-1927.92, 37.80, -12842.54), TP_DIST_THRESHOLD);
				end;
			end);
		end;
	end;
end);

-- ==============================================================
-- LOOP 4: TYRANT OF THE SKIES (EXCLUSIVO Eclipse - Tiki Outpost)
-- ==============================================================

-- NoClip para Tyrant
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

-- Seleciona mob/quest certo pelo level (Tiki Outpost)
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

-- Conta vasos (olhos) do Tiki Outpost para invocar o Tyrant
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

-- Usa skills para quebrar os vasos do Tyrant
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
spawn(function()
	while task.wait() do
		if _G.EclipseAutoTyrant and _G.EclipseStartFarm then
			pcall(function()
				local plr  = game.Players.LocalPlayer;
				local boss = workspace.Enemies:FindFirstChild("Tyrant of the Skies");
				local eyes = GetTyrantEyesCount();
				-- [1] Matar boss se spawnou
				if boss and boss.Humanoid.Health > 0 then
					TweenPlayer(boss.HumanoidRootPart.CFrame * CFrame.new(0, FARM_HEIGHT, 0));
					EquipWeapon(_G.Settings.Main["Selected Weapon"]);
					repeat
						task.wait();
						if boss and boss:FindFirstChild("HumanoidRootPart") then
							TweenPlayer(boss.HumanoidRootPart.CFrame * CFrame.new(0, FARM_HEIGHT, 0));
							G.Kill(boss, true);
						else break; end;
					until not boss.Parent or boss.Humanoid.Health <= 0
						  or not _G.EclipseStartFarm or not _G.EclipseAutoTyrant;
				-- [2] Quebrar vasos para invocar
				elseif eyes == 4 then
					local vasePOS = {
						CFrame.new(-16335.1,158.1,1465.6), CFrame.new(-16288.6,158.1,1470.3),
						CFrame.new(-16258.0,156.7,1461.4), CFrame.new(-16212.4,158.1,1466.3),
						CFrame.new(-16335.0,159.3,1324.8), CFrame.new(-16286.0,155.9,1323.8),
						CFrame.new(-16250.3,159.3,1316.3)
					};
					local pos = vasePOS[TyrantVaseIndex];
					if pos then
						TweenPlayer(pos);
						local char = plr.Character;
						if char and char:FindFirstChild("HumanoidRootPart") then
							if (char.HumanoidRootPart.Position - pos.Position).Magnitude < 15 then
								char.HumanoidRootPart.Anchored = true;
								TyrantUseSkills();
								task.wait(0.1);
								char.HumanoidRootPart.Anchored = false;
								TyrantVaseIndex = TyrantVaseIndex + 1;
								if TyrantVaseIndex > #vasePOS then TyrantVaseIndex = 1; end;
							end;
						end;
					end;
				-- [3] Farm normal de mobs + quest
				else
					local TargetData = GetTyrantTargetByLevel();
					local hasQuest = plr.PlayerGui.Main.Quest.Visible;
					if _G.EclipseAcceptQuest and not hasQuest then
						local char = plr.Character;
						if char and char:FindFirstChild("HumanoidRootPart") then
							local distToNPC = (char.HumanoidRootPart.Position - TargetData.QuestPos.Position).Magnitude;
							if distToNPC <= 3 then
								char.HumanoidRootPart.CFrame = TargetData.QuestPos;
								task.wait(0.1);
								(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
									unpack(TargetData.QuestArgs)
								);
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
	end;
end);

-- [Auto Fast Farm removido]

MasteryFarmSection = Tabs.MainTab:Section({
	Title = "Mastery Farm",
	TextXAlignment = "Left"
});
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
MasteryMethodDropdown = Tabs.MainTab:Dropdown({
	Title = "Choose Mastery Method",
	Values = MasteryMethodList,
	Value = _G.Settings.Main["Mastery Method"],
	Callback = function(option)
		_G.Settings.Main["Mastery Method"] = option;
		(getgenv()).SaveSetting();
	end
});
AutoFruitMasteryToggle = Tabs.MainTab:Toggle({
	Title = "Auto Fruit Mastery",
	Value = _G.Settings.Main["Auto Farm Fruit Mastery"],
	Callback = function(state)
		_G.Settings.Main["Auto Farm Fruit Mastery"] = state;
		StopTween(_G.Settings.Main["Auto Farm Fruit Mastery"]);
		(getgenv()).SaveSetting();
	end
});
AutoGunMasteryToggle = Tabs.MainTab:Toggle({
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
ChooseSwordDropdown = Tabs.MainTab:Dropdown({
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
AutoSwordMasteryToggle = Tabs.MainTab:Toggle({
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
							repeat
								(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
							repeat
								(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
							repeat
								(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
							repeat
								(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
							repeat
								(game:GetService("RunService")).Heartbeat:wait();
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
									(game:GetService("RunService")).Heartbeat:wait();
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
									(game:GetService("RunService")).Heartbeat:wait();
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
								(game:GetService("RunService")).Heartbeat:wait();
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
									(game:GetService("RunService")).Heartbeat:wait();
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
-- ============================================================
-- TYRANT OF THE SKIES (separado do Boss Farm)
-- ============================================================
TyrantOfTheSkiesSection = Tabs.FarmingHopTab:Section({
	Title = "🦅 Tyrant Of The Skies",
	TextXAlignment = "Left"
});
AutoSummonTyrantOfTheSkiesToggle = Tabs.FarmingHopTab:Toggle({
	Title = "Auto Summon Tyrant Of The Skies",
	Default = false,
	Callback = function(state)
		_G.Settings.Main["Auto Summon Tyrant Of The Skies"] = state;
		StopTween(_G.Settings.Main["Auto Summon Tyrant Of The Skies"]);
	end
});
function checkEagleEye()
	local islandModel = (game:GetService("Workspace")).Map.TikiOutpost.IslandModel;
	local targetEyes = {
		Eye1 = false,
		Eye2 = false,
		Eye3 = false,
		Eye4 = false
	};
	for _, v in ipairs(islandModel:GetChildren()) do
		if string.match(v.Name, "^Eye%d$") and targetEyes[v.Name] ~= nil then
			if tonumber(v.Transparency) == 0 then
				targetEyes[v.Name] = true;
			end;
		end;
	end;
	for _, found in pairs(targetEyes) do
		if not found then
			return false;
		end;
	end;
	return true;
end;
function AttackGucci()
	for _, model in pairs((game:GetService("Workspace")).Map.TikiOutpost.IslandModel:GetChildren()) do
		if model:FindFirstChild("EagleBossArena") then
			for i, v in pairs(model.EagleBossArena:GetChildren()) do
				if v.Name == "Tree" then
					TweenPlayer(CFrame.new(v.WorldPivot.Position));
					useAllSkill();
				end;
			end;
		end;
	end;
end;
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Auto Summon Tyrant Of The Skies"] then
			pcall(function()
				if not (game:GetService("Workspace")).Enemies:FindFirstChild("Tyrant of the Skies") then
					if not checkEagleEye() then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == "Serpent Hunter" or v.Name == "Skull Slayer" or v.Name == "Isle Champion" or v.Name == "Sun-kissed Warrior" then
								if v.Humanoid and v.Humanoid.Health > 0 then
									repeat
										wait();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
										AutoHaki();
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
									until not v.Parent or v.Humanoid.Health <= 0 or checkEagleEye() or (not _G.Settings.Main["Auto Summon Tyrant Of The Skies"]);
								end;
							end;
						end;
					else
						repeat wait()
							AttackGucci();
						until (game:GetService("Workspace")).Enemies:FindFirstChild("Tyrant of the Skies") or (not _G.Settings.Main["Auto Summon Tyrant Of The Skies"]);
					end;
				end;
			end);
		end;
	end;
end);
AutoKillTyrantOfTheSkiesToggle = Tabs.FarmingHopTab:Toggle({
	Title = "Auto Kill Tyrant Of The Skies",
	Default = false,
	Callback = function(state)
		_G.Settings.Main["Auto Kill Tyrant Of The Skies"] = state;
		StopTween(_G.Settings.Main["Auto Kill Tyrant Of The Skies"]);
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Auto Kill Tyrant Of The Skies"] then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Tyrant of the Skies") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Tyrant of the Skies" then
							repeat
								wait();
								EquipWeapon(_G.Settings.Main["Selected Weapon"]);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								Attack();
								AutoHaki();
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
							until not v.parent or (not (game:GetService("Workspace")).Enemies:FindFirstChild("Tyrant of the Skies")) or (not _G.Settings.Main["Auto Kill Tyrant Of The Skies"]);
						end;
					end;
				end;
			end);
		end;
	end;
end);
MonFarmSection = Tabs.MainTab:Section({
	Title = "Mob Farm",
	TextXAlignment = "Left"
});
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
ChooseMonDropdown = Tabs.MainTab:Dropdown({
	Title = "Choose Mob",
	Values = tableMon,
	Value = _G.Settings.Main["Selected Mon"],
	Callback = function(option)
		_G.Settings.Main["Selected Mon"] = option;
		(getgenv()).SaveSetting();
	end
});
AutoMonFarmToggle = Tabs.MainTab:Toggle({
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
-- ============================================================
-- BOSS FARM (Select Boss + Farm All Boss)
-- ============================================================
BossSection = Tabs.FarmingHopTab:Section({
	Title = "🎯 Boss Farm",
	TextXAlignment = "Left"
});
BossStatusParagraph = Tabs.FarmingHopTab:Paragraph({
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
ChooseBossDropdown = Tabs.FarmingHopTab:Dropdown({
	Title = "Choose Boss",
	Values = tableBoss,
	Value = _G.Settings.Main["Selected Boss"],
	Callback = function(option)
		_G.Settings.Main["Selected Boss"] = option;
		(getgenv()).SaveSetting();
	end
});
AutoFarmBossToggle = Tabs.FarmingHopTab:Toggle({
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
AutoFarmAllBossToggle = Tabs.FarmingHopTab:Toggle({
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
-- [Auto Elite Hunter + Hop foram movidos para a aba Farming And Hop para evitar duplicação]
PirateRaidSection = Tabs.OthersTab:Section({
	Title = "Pirate Raid",
	TextXAlignment = "Left"
});
AutoPirateRaidToggle = Tabs.OthersTab:Toggle({
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
ChestFarmSection = Tabs.OthersTab:Section({
	Title = "Chest Farm",
	TextXAlignment = "Left"
});

-- =========================================================
-- AUTO FARM CHEST TWEEN
-- TweenPlayer rápido e preciso para cada baú em sequência.
-- Detecta subida de Beli para confirmar coleta e salta
-- imediatamente para o próximo baú sem esperar timeout.
-- =========================================================
-- AUTO FARM CHEST TWEEN
-- Varre TODO o workspace em busca de baús (não só ChestModels).
-- Ordena por distância do jogador → vai pro mais perto primeiro.
-- Detector de Beli via evento: pula pro próximo baú imediatamente
-- assim que o dinheiro sobe (coleta confirmada).
-- =========================================================
local _chestTweenActive = false;
local _chestTweenLastBeli = 0;
AutoFarmChestTweenToggle = Tabs.OthersTab:Toggle({
	Title = "Auto Farm Chest Tween",
	Desc = "Tween do mais perto ao mais longe — todo o mapa",
	Value = _G.Settings.Farm["Auto Farm Chest Tween"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Chest Tween"] = state;
		_chestTweenActive = state;
		if not state then StopTween(false); end;
		(getgenv()).SaveSetting();
	end
});
-- Listener de Beli: sinal imediato ao coletar
task.spawn(function()
	local plr = game.Players.LocalPlayer;
	repeat task.wait() until plr.Data and plr.Data:FindFirstChild("Beli");
	plr.Data.Beli:GetPropertyChangedSignal("Value"):Connect(function()
		_chestTweenLastBeli = plr.Data.Beli.Value;
	end);
end);
-- Função que coleta TODOS os baús do mapa (busca recursiva)
local function _getAllMapChests(playerPos)
	local chests = {};
	local function scanFolder(folder)
		if not folder then return; end;
		for _, v in pairs(folder:GetChildren()) do
			local rp = v:FindFirstChild("RootPart") or v:FindFirstChild("HumanoidRootPart");
			if v.Name:find("Chest") and rp then
				local dist = (rp.Position - playerPos).Magnitude;
				table.insert(chests, {model = v, root = rp, dist = dist});
			end;
			if #v:GetChildren() > 0 then scanFolder(v); end;
		end;
	end;
	-- Procura em ChestModels (spawn normal)
	pcall(function() scanFolder(workspace:FindFirstChild("ChestModels")); end);
	-- Procura em todo o workspace (baús em ilhas/localizações)
	pcall(function()
		for _, v in pairs(workspace:GetDescendants()) do
			local rp = v:FindFirstChild("RootPart");
			if rp and v.Name:find("Chest") and not v:IsA("BasePart") then
				-- Evita duplicatas já adicionadas
				local alreadyAdded = false;
				for _, c in ipairs(chests) do
					if c.model == v then alreadyAdded = true; break; end;
				end;
				if not alreadyAdded then
					local dist = (rp.Position - playerPos).Magnitude;
					table.insert(chests, {model = v, root = rp, dist = dist});
				end;
			end;
		end;
	end);
	table.sort(chests, function(a, b) return a.dist < b.dist; end);
	return chests;
end;
task.spawn(function()
	while task.wait(0) do
		if not _chestTweenActive then task.wait(0.15); continue; end;
		pcall(function()
			local plr = game.Players.LocalPlayer;
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			local chests = _getAllMapChests(hrp.Position);
			if #chests == 0 then task.wait(0.5); return; end;
			for _, entry in ipairs(chests) do
				if not _chestTweenActive then break; end;
				local v   = entry.model;
				local rp  = entry.root;
				if not v or not v.Parent or not rp or not rp.Parent then continue; end;
				local beliBefore = _chestTweenLastBeli;
				TweenPlayer(rp.CFrame);
				-- Aguarda chegada: sai quando Beli sobe (coletou) ou baú sumiu
				local timeout = 0;
				repeat
					task.wait(0.03);
					timeout = timeout + 0.03;
				until not _chestTweenActive
					or not v.Parent
					or _chestTweenLastBeli > beliBefore
					or timeout >= 3;
			end;
		end);
	end;
end);

-- =========================================================
-- AUTO FARM CHEST BYPASS
-- Teleporte CFrame direto para cada baú — zero delay.
-- Após varrer todos os baús, reseta em 7 segundos e repete.
-- =========================================================
local _chestBypassActive = false;
AutoFarmChestInstantToggle = Tabs.OthersTab:Toggle({
	Title = "Auto Farm Chest Bypass",
	Desc = "Teleporte instantâneo — reset a cada 7s",
	Value = _G.Settings.Farm["Auto Farm Chest Instant"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Chest Instant"] = state;
		_chestBypassActive = state;
		(getgenv()).SaveSetting();
	end
});
task.spawn(function()
	while task.wait(0) do
		if not _chestBypassActive then task.wait(0.2); continue; end;
		pcall(function()
			local hrp = game.Players.LocalPlayer.Character
				and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
			if not hrp then return; end;
			-- Varre workspace.ChestModels + workspace inteiro
			local visited = {};
			local function bypassFolder(folder)
				if not folder then return; end;
				for _, v in pairs(folder:GetChildren()) do
					if not _chestBypassActive then break; end;
					local rp = v:FindFirstChild("RootPart");
					if v.Name:find("Chest") and rp and not visited[v] then
						visited[v] = true;
						hrp.CFrame = rp.CFrame;
						task.wait(0.03);
					end;
					if #v:GetChildren() > 0 then bypassFolder(v); end;
				end;
			end;
			pcall(function() bypassFolder(workspace:FindFirstChild("ChestModels")); end);
		end);
		-- Reset em 7 segundos para o próximo ciclo de respawn
		if _chestBypassActive then
			local t = 0;
			while _chestBypassActive and t < 7 do
				task.wait(0.1);
				t = t + 0.1;
			end;
		end;
	end;
end);
AutoStopItemsToggle = Tabs.OthersTab:Toggle({
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
CakePrinceSection = Tabs.OthersTab:Section({
	Title = "Cake Prince",
	TextXAlignment = "Left"
});
CakePrinceStatusParagraph = Tabs.OthersTab:Paragraph({
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
AutoKatakuriToggle = Tabs.OthersTab:Toggle({
	Title = "Auto Katakuri",
	Desc = "Auto Farm + Kill Cake Prince [ Sea 3 Only ]",
	Value = _G.Settings.Farm["Auto Farm Katakuri"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Katakuri"] = state;
		StopTween(_G.Settings.Farm["Auto Farm Katakuri"]);
		(getgenv()).SaveSetting();
	end
});
AutoSpawnCakePrinceToggle = Tabs.OthersTab:Toggle({
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
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
AutoKillCakePrinceToggle = Tabs.OthersTab:Toggle({
	Title = "Auto Kill Cake Prince",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Farm["Auto Kill Cake Prince"],
	Callback = function(state)
		_G.Settings.Farm["Auto Kill Cake Prince"] = state;
		StopTween(_G.Settings.Farm["Auto Kill Cake Prince"]);
		(getgenv()).SaveSetting();
	end
});
AutoKillDoughKingToggle = Tabs.OthersTab:Toggle({
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
MaterialsSection = Tabs.MainTab:Section({
	Title = "Materials",
	TextXAlignment = "Left"
});
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
MaterialDropdown = Tabs.MainTab:Dropdown({
	Title = "Choose Material",
	Values = MaterialList,
	Value = _G.Settings.Farm["Selected Material"],
	Callback = function(option)
		_G.Settings.Farm["Selected Material"] = option;
	end
});
AutoFarmMaterialToggle = Tabs.MainTab:Toggle({
	Title = "Auto Farm Material",
	Value = _G.Settings.Farm["Auto Farm Material"],
	Callback = function(state)
		_G.Settings.Farm["Auto Farm Material"] = state;
		StopTween(_G.Settings.Farm["Auto Farm Material"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Farm["Auto Farm Material"] then
			pcall(function()
				getConfigMaterial(_G.Settings.Farm["Selected Material"]);
				for i, mon in pairs(MaterialMon) do
					if (game:GetService("Workspace")).Enemies:FindFirstChild(mon) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v.Name == mon then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.Settings.Main["Selected Weapon"]);
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
									until not _G.Settings.Farm["Auto Farm Material"] or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					else
						UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
						local Distance = (Vector3.new(MaterialPos) - (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
						if Distance > 18000 and _G.Settings.Farm["Selected Material"] == "Ectoplasm" then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
						end;
						TweenPlayer(MaterialPos);
					end;
				end;
			end);
		end;
	end;
end);
-- ========================================
-- RESET SETTINGS CONFIRMATION GUI
-- ========================================
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
		title.Text = "☄️ Reset Settings";
		title.TextColor3 = Color3.fromRGB(255,255,255);
		title.Font = Enum.Font.GothamBold;
		title.TextSize = 16;
		title.ZIndex = 12;
		title.Parent = box;

		local msg = Instance.new("TextLabel");
		msg.Size = UDim2.new(1,-20,0,40);
		msg.Position = UDim2.new(0,10,0,42);
		msg.BackgroundTransparency = 1;
		msg.Text = "Tem certeza que quer resetar todas as configurações?";
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
		simBtn.Text = "✅ Sim, Resetar";
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
		naoBtn.Text = "❌ Não";
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
					local path = "Relz Hub New/Blox Fruits/" .. plr.Name .. ".json";
					if isfile(path) then writefile(path, "{}"); end;
				end;
			end);
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "☄️ Eclipse Hub",
				Text = "✅ Settings resetados! Reexecute o script.",
				Duration = 6
			});
		end);

		naoBtn.MouseButton1Click:Connect(function() closeGui(); end);
		overlay.InputBegan:Connect(function() closeGui(); end);
	end);
end;

SettingsSection = Tabs.SettingsTab:Section({
	Title = "Settings",
	TextXAlignment = "Left"
});
ResetSettingsButton = Tabs.SettingsTab:Button({
	Title = "🔴 Reset Settings",
	Desc = "Apaga todas as configurações salvas (pede confirmação)",
	Callback = function()
		ShowResetConfirm();
	end
});
local Marines = function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines");
end;
local Pirates = function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
end;
TeamSection = Tabs.SettingsTab:Section({
	Title = "Team",
	TextXAlignment = "Left"
});
SetMarinesButton = Tabs.SettingsTab:Button({
	Title = "Set Team Marines",
	Desc = "Join Marines team on execute",
	Callback = function()
		Marines();
	end
});
SetPiratesButton = Tabs.SettingsTab:Button({
	Title = "Set Team Pirates",
	Desc = "Join Pirates team on execute",
	Callback = function()
		Pirates();
	end
});
AutoSetTeamSection = Tabs.SettingsTab:Section({
	Title = "Auto Set Team On Execute",
	TextXAlignment = "Left"
});
local AutoTeamList = {"None", "Marines", "Pirates"};
AutoSetTeamDropdown = Tabs.SettingsTab:Dropdown({
	Title = "Auto Set Team",
	Desc = "Automatically joins chosen team when script executes",
	Values = AutoTeamList,
	Value = _G.Settings.Setting["Auto Set Team"] or "None",
	Callback = function(option)
		_G.Settings.Setting["Auto Set Team"] = option;
		(getgenv()).SaveSetting();
	end
});
pcall(function()
	local autoTeam = _G.Settings.Setting["Auto Set Team"] or "Marines";
	if autoTeam == "Marines" then
		Marines();
	elseif autoTeam == "Pirates" then
		Pirates();
	end;
end);
SpinPositionToggle = Tabs.SettingsTab:Toggle({
	Title = "Spin Position",
	Desc = "Spin Position When Farm",
	Value = _G.Settings.Setting["Spin Position"],
	Callback = function(state)
		_G.Settings.Setting["Spin Position"] = state;
		(getgenv()).SaveSetting();
	end
});
FarmDistanceSlider = Tabs.SettingsTab:Slider({
	Title = "Farm Distance",
	Step = 1,
	Value = {
		Min = 10,
		Max = 50,
		Default = _G.Settings.Setting["Farm Distance"]
	},
	Callback = function(value)
		_G.Settings.Setting["Farm Distance"] = value;
	end
});

-- ============================================================
-- FARM POSITION OFFSET - Ajusta posição em relação ao mob
-- ============================================================
Tabs.SettingsTab:Section({Title = "Posição de Farm"});
-- Inicializa offset global
_G.FarmOffsetX = _G.FarmOffsetX or 0;
_G.FarmOffsetY = _G.FarmOffsetY or 35;
_G.FarmOffsetZ = _G.FarmOffsetZ or 0;
local function _updateFarmOffset()
	_G.FarmOffset = CFrame.new(_G.FarmOffsetX, _G.FarmOffsetY, _G.FarmOffsetZ);
end;
_updateFarmOffset();
-- Preset positions
Tabs.SettingsTab:Dropdown({
	Title = "Preset de Posição",
	Desc = "Posição pré-definida em relação ao mob",
	Values = {"Cima (Padrão)", "Perto (Chão)", "Longe (Acima)", "Lado Direito", "Lado Esquerdo", "Atrás"},
	Value = "Cima (Padrão)",
	Callback = function(opt)
		if opt == "Cima (Padrão)" then
			_G.FarmOffsetX = 0; _G.FarmOffsetY = 35; _G.FarmOffsetZ = 0;
		elseif opt == "Perto (Chão)" then
			_G.FarmOffsetX = 0; _G.FarmOffsetY = 5; _G.FarmOffsetZ = 0;
		elseif opt == "Longe (Acima)" then
			_G.FarmOffsetX = 0; _G.FarmOffsetY = 60; _G.FarmOffsetZ = 0;
		elseif opt == "Lado Direito" then
			_G.FarmOffsetX = 8; _G.FarmOffsetY = 20; _G.FarmOffsetZ = 0;
		elseif opt == "Lado Esquerdo" then
			_G.FarmOffsetX = -8; _G.FarmOffsetY = 20; _G.FarmOffsetZ = 0;
		elseif opt == "Atrás" then
			_G.FarmOffsetX = 0; _G.FarmOffsetY = 20; _G.FarmOffsetZ = 8;
		end;
		_updateFarmOffset();
	end
});
Tabs.SettingsTab:Slider({
	Title = "Offset X (Lateral)",
	Step = 1,
	Value = {Min = -50, Max = 50, Default = 0},
	Callback = function(v)
		_G.FarmOffsetX = v; _updateFarmOffset();
	end
});
Tabs.SettingsTab:Slider({
	Title = "Offset Y (Altura)",
	Step = 1,
	Value = {Min = 0, Max = 80, Default = 35},
	Callback = function(v)
		_G.FarmOffsetY = v; _updateFarmOffset();
	end
});
Tabs.SettingsTab:Slider({
	Title = "Offset Z (Frente/Trás)",
	Step = 1,
	Value = {Min = -50, Max = 50, Default = 0},
	Callback = function(v)
		_G.FarmOffsetZ = v; _updateFarmOffset();
	end
});
-- Mantém o Pos global sincronizado com FarmOffset para compatibilidade
spawn(function()
	while task.wait(0.1) do
		if not _G.Settings.Setting["Spin Position"] then
			Pos = _G.FarmOffset or CFrame.new(0, _G.Settings.Setting["Farm Distance"] or 35, 0);
		end;
	end;
end);
PlayerTweenSpeedSlider = Tabs.SettingsTab:Slider({
	Title = "Player Tween Speed",
	Step = 1,
	Value = {
		Min = 10,
		Max = 350,
		Default = _G.Settings.Setting["Player Tween Speed"]
	},
	Callback = function(value)
		_G.Settings.Setting["Player Tween Speed"] = value;
	end
});
BringMobToggle = Tabs.SettingsTab:Toggle({
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
BringMobDropdown = Tabs.SettingsTab:Dropdown({
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
FastAttackMethodDropdown = Tabs.SettingsTab:Dropdown({
	Title = "Fast Attack Method",
	Value = _G.Settings.Setting["Fast Attack Mode"],
	Values = AttackList,
	Callback = function(option)
		_G.Settings.Setting["Fast Attack Mode"] = option;
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
AttackAuraToggle = Tabs.SettingsTab:Toggle({
	Title = "Atatck Aura",
	Desc = "Attack Nearest Enemies",
	Value = _G.Settings.Items["Attack Aura"],
	Callback = function(state)
		_G.Settings.Items["Attack Aura"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	(game:GetService("RunService")).RenderStepped:Connect(function()
		if _G.Settings.Setting["Attack Aura"] and (not _G.Settings.Main["Auto Farm Fruit Mastery"]) and (not _G.Settings.Main["Auto Farm Gun Mastery"]) then
			pcall(function()
				Attack();
			end);
		end;
	end);
end);
GraphicSettingSection = Tabs.SettingsTab:Section({
	Title = "Graphic",
	TextXAlignment = "Left"
});
HideNotificationToggle = Tabs.SettingsTab:Toggle({
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
HideDamageTextToggle = Tabs.SettingsTab:Toggle({
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
BlackScreenToggle = Tabs.SettingsTab:Toggle({
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
WhiteScreenToggle = Tabs.SettingsTab:Toggle({
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
MasterySettingsSection = Tabs.SettingsTab:Section({
	Title = "Mastery Settings",
	TextXAlignment = "Left"
});
MasteryHealthSlider = Tabs.SettingsTab:Slider({
	Title = "Mastery Health %",
	Step = 1,
	Value = {
		Min = 1,
		Max = 100,
		Default = _G.Settings.Setting["Mastery Health"]
	},
	Callback = function(value)
		_G.Settings.Setting["Mastery Health"] = value;
	end
});
DevilFruitParagraph = Tabs.SettingsTab:Paragraph({
	Title = "Devil Fruit Skill"
});
MasteryFruitSkillZToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill Z",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill Z"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillXToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill X",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill X"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillCToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill C",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill C"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillVToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill V",
	Value = _G.Settings.Setting["Fruit Mastery Skill V"],
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill V"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryFruitSkillFToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill F",
	Value = _G.Settings.Setting["Fruit Mastery Skill F"],
	Callback = function(state)
		_G.Settings.Setting["Fruit Mastery Skill F"] = state;
		(getgenv()).SaveSetting();
	end
});
GunSkillParagraph = Tabs.SettingsTab:Paragraph({
	Title = "Gun Skill"
});
MasteryGunSkillZToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill Z",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Gun Mastery Skill Z"] = state;
		(getgenv()).SaveSetting();
	end
});
MasteryGunSkillXToggle = Tabs.SettingsTab:Toggle({
	Title = "Skill X",
	Value = true,
	Callback = function(state)
		_G.Settings.Setting["Gun Mastery Skill X"] = state;
		(getgenv()).SaveSetting();
	end
});
OthersSettingsSection = Tabs.SettingsTab:Section({
	Title = "Others",
	TextXAlignment = "Left"
});
AutoSetSpawnPointToggle = Tabs.SettingsTab:Toggle({
	Title = "Auto Set Spawn Point",
	Value = _G.Settings.Setting["Auto Set Spawn Point"],
	Callback = function(state)
		_G.Settings.Setting["Auto Set Spawn Point"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait() do
		if _G.Settings.Setting["Auto Set Spawn Point"] then
			pcall(function()
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetSpawnPoint");
			end);
		end;
	end;
end);
AutoObservationToggle = Tabs.SettingsTab:Toggle({
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
AutoHakiToggle = Tabs.SettingsTab:Toggle({
	Title = "Auto Haki",
	Value = _G.Settings.Setting["Auto Haki"],
	Callback = function(state)
		_G.Settings.Setting["Auto Haki"] = state;
		(getgenv()).SaveSetting();
	end
});
AutoRejoinToggle = Tabs.SettingsTab:Toggle({
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
GunSwordSection = Tabs.ItemsTab:Section({
	Title = "World",
	TextXAlignment = "Left"
});
AutoSecondSeaToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Second Sea",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Second Sea"],
	Callback = function(state)
		_G.Settings.Items["Auto Second Sea"] = state;
		StopTween(_G.Settings.Items["Auto Second Sea"]);
		(getgenv()).SaveSetting();
	end
});
AutoThirdSeaToggle = Tabs.ItemsTab:Toggle({
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
											repeat
												(game:GetService("RunService")).Heartbeat:wait();
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
GunSwordSection = Tabs.ItemsTab:Section({
	Title = "Fighting Style",
	TextXAlignment = "Left"
});
AutoSuperHumanToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Super Human",
	Value = _G.Settings.Items["Auto Super Human"],
	Callback = function(state)
		_G.Settings.Items["Auto Super Human"] = state;
		StopTween(_G.Settings.Items["Auto Super Human"]);
		(getgenv()).SaveSetting();
	end
});
AutoDeathStepToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Death Step",
	Value = _G.Settings.Items["Auto Death Step"],
	Callback = function(state)
		_G.Settings.Items["Auto Death Step"] = state;
		StopTween(_G.Settings.Items["Auto Death Step"]);
		(getgenv()).SaveSetting();
	end
});
AutoSharkmanKarateToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Sharkman Karate",
	Value = _G.Settings.Items["Auto Fishman Karate"],
	Callback = function(state)
		_G.Settings.Items["Auto Fishman Karate"] = state;
		StopTween(_G.Settings.Items["Auto Fishman Karate"]);
		(getgenv()).SaveSetting();
	end
});
AutoElectricClawToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Electric Claw",
	Value = _G.Settings.Items["Auto Electric Claw"],
	Callback = function(state)
		_G.Settings.Items["Auto Electric Claw"] = state;
		StopTween(_G.Settings.Items["Auto Electric Claw"]);
		(getgenv()).SaveSetting();
	end
});
AutoDragonTalonToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Dragon Talon",
	Value = _G.Settings.Items["Auto Dragon Talon"],
	Callback = function(state)
		_G.Settings.Items["Auto Dragon Talon"] = state;
		StopTween(_G.Settings.Items["Auto Dragon Talon"]);
		(getgenv()).SaveSetting();
	end
});
AutoGodHumanToggle = Tabs.ItemsTab:Toggle({
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
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
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
								(game:GetService("RunService")).Heartbeat:wait();
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
GunSwordSection = Tabs.ItemsTab:Section({
	Title = "Gun & Sword",
	TextXAlignment = "Left"
});
AutoGetSaberToggle = Tabs.ItemsTab:Toggle({
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
											repeat
												(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
AutoBuddySwordToggle = Tabs.ItemsTab:Toggle({
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
AutoSoulGuitarToggle = Tabs.ItemsTab:Toggle({
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
AutoRengokuToggle = Tabs.ItemsTab:Toggle({
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
								(game:GetService("RunService")).Heartbeat:wait();
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
AutoHallowScytheToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Hallow Scythe",
	Desc = "Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Hallow Scythe"],
	Callback = function(state)
		_G.Settings.Items["Auto Hallow Scythe"] = state;
		StopTween(_G.Settings.Items["Auto Hallow Scythe"]);
		(getgenv()).SaveSetting();
	end
});
AutoWardenSwordToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Warden Sword",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Warden Sword"],
	Callback = function(state)
		_G.Settings.Items["Auto Warden Sword"] = state;
		StopTween(_G.Settings.Items["Auto Warden Sword"]);
		(getgenv()).SaveSetting();
	end
});
AutoGetYamaToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Get Yama",
	Desc = "Need 30 Elite Hunter, Function Sea 3 Only",
	Value = _G.Settings.Items["Auto Yama"],
	Callback = function(state)
		_G.Settings.Items["Auto Yama"] = state;
		StopTween(_G.Settings.Items["Auto Yama"]);
		(getgenv()).SaveSetting();
	end
});
AutoGetYamaHopToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Get Yama Hop",
	Desc = "Hop If Elite Hunter Not Spawn",
	Value = _G.Settings.Items["Auto Yama Hop"],
	Callback = function(state)
		_G.Settings.Items["Auto Yama Hop"] = state;
		StopTween(_G.Settings.Items["Auto Yama Hop"]);
		(getgenv()).SaveSetting();
	end
});
AutoGetTushitaToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Get Tushita",
	Value = _G.Settings.Items["Auto Tushita"],
	Callback = function(state)
		_G.Settings.Items["Auto Tushita"] = state;
		StopTween(_G.Settings.Items["Auto Tushita"]);
		(getgenv()).SaveSetting();
	end
});
AutoDragonTridentToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Dragon Trident",
	Desc = "Function Sea 2 Only",
	Value = _G.Settings.Items["Auto Dragon Trident"],
	Callback = function(state)
		_G.Settings.Items["Auto Dragon Trident"] = state;
		StopTween(_G.Settings.Items["Auto Dragon Trident"]);
		(getgenv()).SaveSetting();
	end
});
AutoDragonTridentToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Greybeard",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Greybeard"],
	Callback = function(state)
		_G.Settings.Items["Auto Greybeard"] = state;
		StopTween(_G.Settings.Items["Auto Greybeard"]);
		(getgenv()).SaveSetting();
	end
});
AutoSharkSawToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Shark Saw",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Shark Saw"],
	Callback = function(state)
		_G.Settings.Items["Auto Shark Saw"] = state;
		StopTween(_G.Settings.Items["Auto Shark Saw"]);
		(getgenv()).SaveSetting();
	end
});
AutoPoleToggle = Tabs.ItemsTab:Toggle({
	Title = "Auto Pole",
	Desc = "Function Sea 1 Only",
	Value = _G.Settings.Items["Auto Pole"],
	Callback = function(state)
		_G.Settings.Items["Auto Pole"] = state;
		StopTween(_G.Settings.Items["Auto Pole"]);
		(getgenv()).SaveSetting();
	end
});
AutoDarkDaggerToggle = Tabs.ItemsTab:Toggle({
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
								(game:GetService("RunService")).Heartbeat:wait();
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
spawn(function()
	while wait(0.2) do
		if _G.Settings.Items["Auto Pole"] and World1 then
			pcall(function()
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Thunder God") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Thunder God" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
				repeat
					wait(0.1);
					fireclickdetector((game:GetService("Workspace")).Map.Waterfall.SealedKatana.Handle.ClickDetector);
				until (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild("Yama") or (not _G.Settings.Items["Auto Yama"]);
			elseif string.find(QuestTitle, "Diablo") or string.find(QuestTitle, "Deandre") or string.find(QuestTitle, "Urban") then
				if (game:GetService("Workspace")).Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace")).Enemies:FindFirstChild("Deandre") or (game:GetService("Workspace")).Enemies:FindFirstChild("Urban") then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
								(game:GetService("RunService")).Heartbeat:wait();
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
StatsSection = Tabs.StatsTab:Section({
	Title = "Stats",
	TextXAlignment = "Left"
});
StatsPointParagraph = Tabs.StatsTab:Paragraph({
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
AutoAddMeleeStats = Tabs.StatsTab:Toggle({
	Title = "Add Melee Stats",
	Value = _G.Settings.Stats["Auto Add Melee Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Melee Stats"] = state;
	end
});
AutoAddDefenseStats = Tabs.StatsTab:Toggle({
	Title = "Add Defense Stats",
	Value = _G.Settings.Stats["Auto Add Defense Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Defense Stats"] = state;
	end
});
AutoAddSwordStats = Tabs.StatsTab:Toggle({
	Title = "Add Sword Stats",
	Value = _G.Settings.Stats["Auto Add Sword Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Sword Stats"] = state;
	end
});
AutoAddGunStats = Tabs.StatsTab:Toggle({
	Title = "Add Gun Stats",
	Value = _G.Settings.Stats["Auto Add Gun Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Gun Stats"] = state;
	end
});
AutoAddDevilFruitStats = Tabs.StatsTab:Toggle({
	Title = "Add Devil Fruit Stats",
	Value = _G.Settings.Stats["Auto Add Devil Fruit Stats"],
	Callback = function(state)
		_G.Settings.Stats["Auto Add Devil Fruit Stats"] = state;
	end
});
PointStats = 1;
StatsPointToAddSlider = Tabs.StatsTab:Slider({
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
-- ====== AUTO RAID - SISTEMA SIMPLIFICADO ======
RaidSection = Tabs.RaidTab:Section({
	Title = "Raid",
	TextXAlignment = "Left"
});

-- Helper
local function RaidGetBP(itemName)
	return game.Players.LocalPlayer.Backpack:FindFirstChild(itemName)
		or (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(itemName));
end;

-- Paragraph de status
local RaidStatusParagraph = Tabs.RaidTab:Paragraph({
	Title = "Raid Status",
	Desc = "Desligado"
});

spawn(function()
	while wait(0.5) do
		pcall(function()
			local raidActive = game.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible;
			if _G.Settings.Raid["Auto Raid"] then
				if raidActive then
					RaidStatusParagraph:SetDesc("⚔️ Raid em progresso! Matando inimigos...");
				else
					if RaidGetBP("Special Microchip") then
						RaidStatusParagraph:SetDesc("🔑 Microchip pronto. Iniciando raid...");
					else
						RaidStatusParagraph:SetDesc("🛒 Comprando Microchip...");
					end;
				end;
			else
				RaidStatusParagraph:SetDesc("⚪ Desligado");
			end;
		end);
	end;
end);

-- Chip dropdown
ChooseChipRaidDropdown = Tabs.RaidTab:Dropdown({
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

-- ÚNICO BOTÃO: Auto Raid completo
AutoRaidToggle = Tabs.RaidTab:Toggle({
	Title = "⚔️ Auto Raid (Start + Complete)",
	Desc = "Compra chip, inicia a raid, mata inimigos, navega ilhas — Tudo automático!",
	Value = _G.Settings.Raid["Auto Raid"],
	Callback = function(state)
		_G.Settings.Raid["Auto Raid"] = state;
		_G.Raiding = state;
		StopTween(_G.Settings.Raid["Auto Raid"]);
		(getgenv()).SaveSetting();
	end
});

-- LOOP: Comprar Microchip com fruta barata
spawn(function()
	while true do
		task.wait(3);
		if _G.Settings.Raid["Auto Raid"] then
			pcall(function()
				if not RaidGetBP("Special Microchip") then
					local cheapFruits = {};
					for _, data in next, (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("GetFruits") do
						local rarity = tostring(data.Rarity or ""):lower();
						if data.Price <= 1150000 or rarity=="common" or rarity=="uncommon" or rarity=="rare" then
							table.insert(cheapFruits, data.Name);
						end;
					end;
					for _, fruitName in pairs(cheapFruits) do
						if not RaidGetBP("Special Microchip") then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("LoadFruit", fruitName);
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.Settings.Raid["Selected Chip"] or "Flame");
						end;
					end;
				end;
			end);
		end;
	end;
end);

-- LOOP: Iniciar Raid automaticamente
spawn(function()
	while true do
		task.wait(10);
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

-- LOOP: Completar Raid (matar inimigos + navegar ilhas)
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
					-- Mata inimigos próximos
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
					-- Navega para próxima ilha
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

AutoAwakeningToggle = Tabs.RaidTab:Toggle({
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

PriceDevilFruitToUnstoreSlider = Tabs.RaidTab:Slider({
	Title = "Price (Auto Unstore Fruit)",
	Value = {Min = 1, Max = 10000000, Default = _G.Settings.Raid["Price Devil Fruit"] or 1000000},
	Callback = function(value)
		_G.Settings.Raid["Price Devil Fruit"] = value;
		(getgenv()).SaveSetting();
	end
});
AutoUnstoreDevilFruitToggle = Tabs.RaidTab:Toggle({
	Title = "Auto Unstore Devil Fruit",
	Desc = "Tira do armazém frutas abaixo do preço definido",
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

TeleportToLabButton = Tabs.RaidTab:Button({
	Title = "Teleport To Lab",
	Desc = "Vai para o summon da Raid",
	Callback = function()
		if World2 then TweenPlayer(CFrame.new(-6438.73535,250.645355,-4501.50684));
		elseif World3 then TweenPlayer(CFrame.new(-5033.50879,315.014252,-2947.77539));
		end;
	end
});

LawRaidSection = Tabs.RaidTab:Section({
	Title = "Law Raid",
	TextXAlignment = "Left"
});
AutoLawRaidToggle = Tabs.RaidTab:Toggle({
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
									(game:GetService("RunService")).Heartbeat:wait();
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
RaceTabSection = Tabs.RaceTab:Section({
	Title = "Race",
	TextXAlignment = "Left"
});
local PlaceV4List = {
	"Top Of GreatTree",
	"Timple Of Time",
	"Lever Pull",
	"Acient One"
};
SelectedPlaceDropdown = Tabs.RaceTab:Dropdown({
	Title = "Selected Place",
	Values = PlaceV4List,
	Value = _G.Settings.Race["Selected Place"],
	Callback = function(value)
		_G.Settings.Race["Selected Place"] = value;
		(getgenv()).SaveSetting();
	end
});
TeleportToPlaceToggle = Tabs.RaceTab:Toggle({
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
AutoBuyGearToggle = Tabs.RaceTab:Toggle({
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
TweenToMirageIslandToggle = Tabs.RaceTab:Toggle({
	Title = "Tween To Mirage Island",
	Desc = "Tween to highest point",
	Value = _G.Settings.Race["Tween To Highest Mirage"],
	Callback = function(state)
		_G.Settings.Race["Tween To Highest Mirage"] = state;
		(getgenv()).SaveSetting();
	end
});
FindBlueGearToggle = Tabs.RaceTab:Toggle({
	Title = "Find Blue Gear",
	Value = _G.Settings.Race["Find Blue Gear"],
	Callback = function(state)
		_G.Settings.Race["Find Blue Gear"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.Settings.Race["Find Blue Gear"] then
				if (game:GetService("Workspace")).Map:FindFirstChild("MysticIsland") then
					for i, v in pairs((game:GetService("Workspace")).Map.MysticIsland:GetChildren()) do
						if v:IsA("MeshPart") then
							if v.Material == Enum.Material.Neon then
								TweenPlayer(v.CFrame);
							end;
						end;
					end;
				end;
			end;
		end;
	end);
end);
LookMoonAbilityToggle = Tabs.RaceTab:Toggle({
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
AutoTrainToggle = Tabs.RaceTab:Toggle({
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
TeleportToRaceDoorButton = Tabs.RaceTab:Button({
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
BuyAcientQuestButton = Tabs.RaceTab:Button({
	Title = "Buy Acient Quest",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("UpgradeRace", "Buy");
	end
});
-- ====================================================
-- ============== TAB PVP (Nova Tab) ==================
-- ====================================================
local PvpSection = Tabs.CombatTab:Section({
	Title = "⚔️ PvP Tools",
	TextXAlignment = "Left"
});

-- Target Player
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

local PvPPlayerDropdown = Tabs.CombatTab:Dropdown({
	Title = "Select Player",
	Desc = "Seleciona o jogador alvo para PvP",
	Values = PvPTargetList,
	Value = PvPTargetList[1] or "No Players",
	Callback = function(v)
		SelectedPvPTarget = v;
	end
});

Tabs.CombatTab:Button({
	Title = "🔄 Refresh Player List",
	Desc = "Atualiza a lista de jogadores no servidor",
	Callback = function()
		RefreshPvPTargets();
		if PvPPlayerDropdown and PvPPlayerDropdown.SetValues then
			PvPPlayerDropdown:SetValues(PvPTargetList);
		end;
	end
});

Tabs.CombatTab:Button({
	Title = "📍 TP to Selected Player",
	Desc = "Teleporta para a posição do jogador selecionado",
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

-- Auto TP para player (segue o alvo)
local _PvPAutoTP = false;
Tabs.CombatTab:Toggle({
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

-- Auto Activate PvP
Tabs.CombatTab:Toggle({
	Title = "Auto Activate PvP",
	Desc = "Mantém PvP ativado automaticamente",
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

-- Auto Kill PvP
local _PvPAutoKill = false;
Tabs.CombatTab:Toggle({
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

-- Auto Spam Skills (todas as categorias)
local _PvPSpamSkills = false;
Tabs.CombatTab:Toggle({
	Title = "⚡ Auto Spam Skills (All)",
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
				-- Auto-aim na câmera para o alvo
				if SelectedPvPTarget then
					local target = game:GetService("Players"):FindFirstChild(SelectedPvPTarget);
					if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
						workspace.CurrentCamera.CFrame = CFrame.lookAt(
							workspace.CurrentCamera.CFrame.Position,
							target.Character.HumanoidRootPart.Position
						);
					end;
				end;
				-- Equipa cada categoria e spama skills
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

AutoTrialToggle = Tabs.RaceTab:Toggle({
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
AutoKillPlayerAfterTrialToggle = Tabs.RaceTab:Toggle({
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
									(game:GetService("RunService")).Heartbeat:Wait();
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
TeleportSection = Tabs.TeleportTab:Section({
	Title = "Teleport",
	TextXAlignment = "Left"
});
TeleportToFirstSeaButton = Tabs.TeleportTab:Button({
	Title = "Teleport To First Sea",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelMain");
	end
});
TeleportToSecondSeaButton = Tabs.TeleportTab:Button({
	Title = "Teleport To Second Sea",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelDressrosa");
	end
});
TeleportToThirdSeaButton = Tabs.TeleportTab:Button({
	Title = "Teleport To Third Sea",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("TravelZou");
	end
});
TeleportIslandSection = Tabs.TeleportTab:Section({
	Title = "Island",
	TextXAlignment = "Left"
});
ShopSection = Tabs.ShopTab:Section({
	Title = "Shop",
	TextXAlignment = "Left"
});
AutoBuyLegendarySwordToggle = Tabs.ShopTab:Toggle({
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
AutoBuyHakiColorToggle = Tabs.ShopTab:Toggle({
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
AbilitiesShopSection = Tabs.ShopTab:Section({
	Title = "Abilities",
	TextXAlignment = "Left"
});
BuyGeppoButton = Tabs.ShopTab:Button({
	Title = "Buy Geppo",
	Desc = "$10,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
	end
});
BuyBusoHaki = Tabs.ShopTab:Button({
	Title = "Buy Buso Haki",
	Desc = "$25,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
	end
});
BuySoruButton = Tabs.ShopTab:Button({
	Title = "Buy Soru",
	Desc = "$25,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
	end
});
BuyObservationHakiButton = Tabs.ShopTab:Button({
	Title = "Buy Observation Haki",
	Desc = "$750,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("KenTalk", "Buy");
	end
});
-- ====== AUTO BUY FIGHT STYLES (vai até o NPC para evitar ban) ======
local AutoBuyFightSection = Tabs.ShopTab:Section({
	Title = "🥋 Auto Buy Fight Styles",
	TextXAlignment = "Left"
});

-- Mapa de Fight Styles e posições dos NPCs
local FightStyleNPCs = {
	["Dark Step"]     = {pos=CFrame.new(979.7, 261.2, 1557.7),   cost=150000},
	["Electro"]       = {pos=CFrame.new(61122.65, 18.5, 1569.4), cost=500000, portal=Vector3.new(61163.8,11.7,1819.8)},
	["Fishman Karate"]= {pos=CFrame.new(61122.65, 18.5, 1569.4), cost=2500000, portal=Vector3.new(61163.8,11.7,1819.8)},
	["Dragon Breath"]  = {pos=CFrame.new(-429.54, 71.77, 1836.18), cost=1500000},
	["Superhuman"]    = {pos=CFrame.new(-5039.59, 27.35, 4324.68), cost=3000000},
	["Death Step"]    = {pos=CFrame.new(-5497.06, 47.59, -795.24), cost=5000000},
	["Sharkman Karate"]= {pos=CFrame.new(609.86, 400.12, -5372.26), cost=5000000},
	["Electric Claw"] = {pos=CFrame.new(-6064.07, 15.24, -4902.98), cost=5000000},
	["Dragon Talon"]  = {pos=CFrame.new(-290.07, 42.90, 5581.59),  cost=5000000},
	["God Human"]     = {pos=CFrame.new(-16546.748, 55.72, -172.87), cost=5000000},
};

local FightStyleNames = {};
for k, _ in pairs(FightStyleNPCs) do table.insert(FightStyleNames, k); end;
table.sort(FightStyleNames);

local SelectedFightStyle = FightStyleNames[1];
Tabs.ShopTab:Dropdown({
	Title = "Select Fight Style to Buy",
	Desc = "Seleciona o estilo de luta para comprar indo até o NPC",
	Values = FightStyleNames,
	Value = FightStyleNames[1],
	Callback = function(v) SelectedFightStyle = v; end
});

Tabs.ShopTab:Button({
	Title = "🏃 Go Buy Fight Style (Tele to NPC)",
	Desc = "Teleporta até o NPC e compra o estilo selecionado",
	Callback = function()
		pcall(function()
			local data = FightStyleNPCs[SelectedFightStyle];
			if not data then return; end;
			-- Usa portal se necessário (ex: Fishman Island)
			if data.portal then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", data.portal);
				task.wait(1);
			end;
			TweenPlayer(data.pos);
			task.wait(1.5);
			-- Tenta comprar via servidor (método InvokeServer)
			(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyAbility", SelectedFightStyle);
		end);
	end
});

Tabs.ShopTab:Toggle({
	Title = "Auto Buy All Fight Styles",
	Desc = "Vai em cada NPC e compra todos os estilos de luta",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				for styleName, data in pairs(FightStyleNPCs) do
					if not state then break; end;
					pcall(function()
						if data.portal then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", data.portal);
							task.wait(1);
						end;
						TweenPlayer(data.pos);
						task.wait(2);
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyAbility", styleName);
						task.wait(1);
					end);
				end;
			end);
		end;
	end
});

FightingStyleShopSection = Tabs.ShopTab:Section({
	Title = "Fighting Style",
	TextXAlignment = "Left"
});
BuyBlackLegButton = Tabs.ShopTab:Button({
	Title = "Buy Black Leg",
	Desc = "$150,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBlackLeg");
	end
});
BuyElectroButton = Tabs.ShopTab:Button({
	Title = "Buy Electro",
	Desc = "$550,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectro");
	end
});
BuyFishmanKarateButton = Tabs.ShopTab:Button({
	Title = "Buy Fishman Karate",
	Desc = "$750,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyFishmanKarate");
	end
});
BuyDragonClawButton = Tabs.ShopTab:Button({
	Title = "Buy Dragon Claw",
	Desc = "Æ’1,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
	end
});
BuySuperhumanButton = Tabs.ShopTab:Button({
	Title = "Buy Superhuman",
	Desc = "$3,000,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySuperhuman");
	end
});
BuyDeathStepButton = Tabs.ShopTab:Button({
	Title = "Buy Death Step",
	Desc = "Æ’5,000 $5,000,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDeathStep");
	end
});
BuySharkmanKarateButton = Tabs.ShopTab:Button({
	Title = "Buy Sharkman Karate",
	Desc = "Æ’5,000 $2,500,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate", true);
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySharkmanKarate");
	end
});
BuyElectricClawButton = Tabs.ShopTab:Button({
	Title = "Buy Electric Claw",
	Desc = "Æ’5,000 $3,000,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyElectricClaw");
	end
});
BuyDragonTalonButton = Tabs.ShopTab:Button({
	Title = "Buy Dragon Talon",
	Desc = "Æ’5,000 $3,000,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyDragonTalon");
	end
});
BuyGodHumanButton = Tabs.ShopTab:Button({
	Title = "Buy God Human",
	Desc = "Æ’5,000 $5,000,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyGodhuman");
	end
});
BuySanguineArtButton = Tabs.ShopTab:Button({
	Title = "Buy Sanguine Art",
	Desc = "Æ’5,000 $5,000,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySanguineArt", true);
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuySanguineArt");
	end
});
SwordShopSection = Tabs.ShopTab:Section({
	Title = "Sword",
	TextXAlignment = "Left"
});
BuyCutlassButton = Tabs.ShopTab:Button({
	Title = "Buy Cutlass",
	Desc = "$1,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
	end
});
BuyKatanaButton = Tabs.ShopTab:Button({
	Title = "Buy Katana",
	Desc = "$1,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Katana");
	end
});
BuyIronMaceButton = Tabs.ShopTab:Button({
	Title = "Buy Iron Mace",
	Desc = "$25,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
	end
});
BuyDualKatanaButton = Tabs.ShopTab:Button({
	Title = "Buy Dual Katana",
	Desc = "$12,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Dual Katana");
	end
});
BuyTripleKatanaButton = Tabs.ShopTab:Button({
	Title = "Buy Triple Katana",
	Desc = "$60,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
	end
});
BuyPipeButton = Tabs.ShopTab:Button({
	Title = "Buy Pipe",
	Desc = "$100,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
	end
});
BuyDualHeadedBladeButton = Tabs.ShopTab:Button({
	Title = "Buy Dual Headed Blade",
	Desc = "$400,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
	end
});
BuyBisentoButton = Tabs.ShopTab:Button({
	Title = "Buy Bisento",
	Desc = "$1,200,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
	end
});
BuySoulCaneButton = Tabs.ShopTab:Button({
	Title = "Buy Soul Cane",
	Desc = "$1,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
	end
});
GunShopSection = Tabs.ShopTab:Section({
	Title = "Gun",
	TextXAlignment = "Left"
});
BuySlingshotButton = Tabs.ShopTab:Button({
	Title = "Buy Slingshot",
	Desc = "$5,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Slingshot");
	end
});
BuyMusketButton = Tabs.ShopTab:Button({
	Title = "Buy Musket",
	Desc = "$8,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Musket");
	end
});
BuyFintlockButton = Tabs.ShopTab:Button({
	Title = "Buy Flintlock",
	Desc = "$10,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Flintlock");
	end
});
BuyRefinedFintlockButton = Tabs.ShopTab:Button({
	Title = "Buy Refined Fintlock",
	Desc = "$60,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Refined Fintlock");
	end
});
BuyCanonButton = Tabs.ShopTab:Button({
	Title = "Buy Cannon",
	Desc = "$100,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Cannon");
	end
});
BuyKabuchaButton = Tabs.ShopTab:Button({
	Title = "Buy Kabucha",
	Desc = "Æ’1,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2");
	end
});
StatsShopSection = Tabs.ShopTab:Section({
	Title = "Stats",
	TextXAlignment = "Left"
});
ResetStatsShopButton = Tabs.ShopTab:Button({
	Title = "Reset Stats",
	Desc = "Æ’2,500",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2");
	end
});
RandomRaceShopButton = Tabs.ShopTab:Button({
	Title = "Random Race",
	Desc = "Æ’3,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1");
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2");
	end
});
AccessoriesShopSection = Tabs.ShopTab:Section({
	Title = "Accessories",
	TextXAlignment = "Left"
});
BuyBlackCapeButton = Tabs.ShopTab:Button({
	Title = "Buy Black Cape",
	Desc = "$50,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Black Cape");
	end
});
BuySwordsmanHatButton = Tabs.ShopTab:Button({
	Title = "Buy Swordsman Hat",
	Desc = "$150,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat");
	end
});
BuyTomoeRingButton = Tabs.ShopTab:Button({
	Title = "Buy Tomoe Ring",
	Desc = "$500,000",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring");
	end
});
CombatTabSection = Tabs.CombatTab:Section({
	Title = "Combat",
	TextXAlignment = "Left"
});
PlayerInServerTotalParagraph = Tabs.CombatTab:Paragraph({
	Title = "Players In Server",
	Desc = "0"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			for i, v in pairs((game:GetService("Players")):GetPlayers()) do
				if i == 12 then
					PlayerInServerTotalParagraph:SetDesc(i .. " / " .. "12" .. "(Max)");
				elseif i == 1 then
					PlayerInServerTotalParagraph:SetDesc(i .. " / " .. "12");
				else
					PlayerInServerTotalParagraph:SetDesc(i .. " / " .. "12");
				end;
			end;
		end);
	end;
end);
local PlayerList = {};
for i, v in pairs((game:GetService("Players")):GetChildren()) do
	table.insert(PlayerList, v.Name);
end;
SelectedPlayerDropdown = Tabs.CombatTab:Dropdown({
	Title = "Choose Player",
	Values = PlayerList,
	Value = tostring(PlayerList[1]),
	Callback = function(option)
		_G.SelectedPlayer = option;
	end
});
RefreshPlayerButton = Tabs.CombatTab:Button({
	Title = "Refresh Player",
	Callback = function()
		PlayerList = {};
		for i, v in pairs((game:GetService("Players")):GetChildren()) do
			table.insert(PlayerList, v.Name);
		end;
		SelectedPlayerDropdown:Refresh(PlayerList);
	end
});
SpectatePlayerToggle = Tabs.CombatTab:Toggle({
	Title = "Spectate Player",
	Value = false,
	Callback = function(state)
		SpectatePlys = state;
		repeat
			wait(0.1);
			(game:GetService("Workspace")).Camera.CameraSubject = ((game:GetService("Players")):FindFirstChild(_G.SelectedPlayer)).Character.Humanoid;
		until SpectatePlys == false or (not (game:GetService("Players")):FindFirstChild(_G.SelectedPlayer));
		(game:GetService("Workspace")).Camera.CameraSubject = (game:GetService("Players")).LocalPlayer.Character.Humanoid;
	end
});
TeleportToPlayerToggle = Tabs.CombatTab:Toggle({
	Title = "Teleport To Player",
	Value = false,
	Callback = function(state)
		_G.TeleportToPlayer = value;
		pcall(function()
			if _G.TeleportToPlayer then
				repeat
					TweenPlayer((game:GetService("Players"))[_G.SelectedPlayer].Character.HumanoidRootPart.CFrame);
					wait();
				until _G.TeleportToPlayer == false or (not (game:GetService("Players")):FindFirstChild(_G.SelectedPlayer));
			end;
			StopTween(_G.TeleportToPlayer);
		end);
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
-- ========== TELEPORT TO ISLAND (Sistema Atualizado - Dinâmico) ==========
-- Lista dinâmica: lê as ilhas direto do workspace (como o Eclipse faz)
local EclipseIslandList = {};
pcall(function()
	for _, loc in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
		table.insert(EclipseIslandList, loc.Name);
	end;
end);
-- Portais que precisam de requestEntrance (não TweenPlayer)
local PortalIslands = {
	["Sky Island 2"]         = Vector3.new(-4607.82275, 872.54248, -1667.55688),
	["Sky Island 3"]         = Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047),
	["Under Water Island"]   = Vector3.new(61163.8515625, 11.6796875, 1819.7841796875),
	["Castle On The Sea"]    = Vector3.new(-5083.26025390625, 314.6056823730469, -3175.673095703125),
	["Mansion"]              = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375),
	["Hydra Island"]         = Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625),
};
SelectedTeleportIslandDropdown = Tabs.TeleportTab:Dropdown({
	Title = "Choose Island",
	Desc = "Lista dinâmica do Eclipse - lê o mapa real",
	Values = EclipseIslandList,
	Value = EclipseIslandList[1] or "",
	Callback = function(option)
		_G.SelectIsland = option;
	end
});

-- Teleport To Island (CFrame instantâneo)
AutoTeleportToIslandToggle = Tabs.TeleportTab:Toggle({
	Title = "Teleport To Island",
	Desc = "Teleporte instantâneo para a ilha selecionada",
	Value = false,
	Callback = function(state)
		_G.TeleportIsland = state;
		if not state then StopTween(false); end;
		if state then
			task.spawn(function()
				repeat
					pcall(function()
						if not _G.SelectIsland then return; end;
						local hrp = game.Players.LocalPlayer.Character
							and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
						if not hrp then return; end;
						if PortalIslands[_G.SelectIsland] then
							(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(
								"requestEntrance", PortalIslands[_G.SelectIsland]
							);
							task.wait(0.8);
						else
							local target = workspace._WorldOrigin.Locations:FindFirstChild(_G.SelectIsland);
							if target then
								hrp.CFrame = target.CFrame * CFrame.new(0, 5, 0);
							end;
						end;
					end);
					task.wait(0.5);
				until not _G.TeleportIsland;
			end);
		end;
	end
});

-- Tween To Island (movimento suave até a ilha)
_G.TweenIsland = false;
AutoTweenToIslandToggle = Tabs.TeleportTab:Toggle({
	Title = "Tween To Island",
	Desc = "Move suavemente até a ilha selecionada",
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
									-- Aguarda chegar
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

-- ========== NPC TELEPORT (Sistema Atualizado - Dinâmico) ==========
TeleportNpcSection = Tabs.TeleportTab:Section({
	Title = "Npc",
	TextXAlignment = "Left"
});
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
SelectedNpcTeleport = Tabs.TeleportTab:Dropdown({
	Title = "Choose Npc",
	Desc = "Lista dinâmica do Eclipse - NPCs reais do servidor",
	Values = EclipseNPCList,
	Value = EclipseNPCList[1] or "",
	Callback = function(option)
		SelectedNpcName = option;
		_G.SelectNPC = option;
	end
});

-- Teleport To Npc (CFrame instantâneo)
TeleportToNpcToggle = Tabs.TeleportTab:Toggle({
	Title = "Teleport To Npc",
	Desc = "Teleporte instantâneo direto para o NPC",
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

-- Tween To Npc (movimento suave até o NPC)
_G.TweenNPC = false;
TweenToNpcToggle = Tabs.TeleportTab:Toggle({
	Title = "Tween To Npc",
	Desc = "Move suavemente até o NPC selecionado",
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
											-- Aguarda chegar
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
EspSection = Tabs.EspTab:Section({
	Title = "Esp",
	TextXAlignment = "Left"
});
EspPlayerToggle = Tabs.EspTab:Toggle({
	Title = "Esp Player",
	Desc = "Highlight Player",
	Value = _G.Settings.Esp["ESP Player"],
	Callback = function(state)
		_G.Settings.Esp["ESP Player"] = state;
	end
});
EspChestToggle = Tabs.EspTab:Toggle({
	Title = "Esp Chest",
	Desc = "Highlight Chest",
	Value = _G.Settings.Esp["ESP Chest"],
	Callback = function(state)
		_G.Settings.Esp["ESP Chest"] = state;
	end
});
EspDevilFruitToggle = Tabs.EspTab:Toggle({
	Title = "Esp DevilFruit",
	Desc = "Highlight DevilFruit",
	Value = _G.Settings.Esp["ESP DevilFruit"],
	Callback = function(state)
		_G.Settings.Esp["ESP DevilFruit"] = state;
	end
});
EspRealFruitToggle = Tabs.EspTab:Toggle({
	Title = "Esp RealFruit",
	Desc = "Highlight RealFruit",
	Value = _G.Settings.Esp["ESP RealFruit"],
	Callback = function(state)
		_G.Settings.Esp["ESP RealFruit"] = state;
	end
});
EspFlowerToggle = Tabs.EspTab:Toggle({
	Title = "Esp Flower",
	Desc = "Highlight Flower",
	Value = _G.Settings.Esp["ESP Flower"],
	Callback = function(state)
		_G.Settings.Esp["ESP Flower"] = state;
	end
});
EspIslandToggle = Tabs.EspTab:Toggle({
	Title = "Esp Island",
	Desc = "Highlight Island",
	Value = _G.Settings.Esp["ESP Island"],
	Callback = function(state)
		_G.Settings.Esp["ESP Island"] = state;
	end
});
EspNpcToggle = Tabs.EspTab:Toggle({
	Title = "Esp Npc",
	Desc = "Highlight Npc",
	Value = _G.Settings.Esp["ESP Npc"],
	Callback = function(state)
		_G.Settings.Esp["ESP Npc"] = state;
	end
});
EspSeaBeastToggle = Tabs.EspTab:Toggle({
	Title = "Esp Sea Beast",
	Desc = "Highlight SeaBeast",
	Value = _G.Settings.Esp["ESP Sea Beast"],
	Callback = function(state)
		_G.Settings.Esp["ESP Sea Beast"] = state;
	end
});
EspMonsterToggle = Tabs.EspTab:Toggle({
	Title = "Esp Mob",
	Desc = "Highlight Monster",
	Value = _G.Settings.Esp["ESP Monster"],
	Callback = function(state)
		_G.Settings.Esp["ESP Monster"] = state;
	end
});
EspMirageIslandToggle = Tabs.EspTab:Toggle({
	Title = "Esp Mirage Island",
	Desc = "Highlight Mirage Island",
	Value = _G.Settings.Esp["ESP Mirage"],
	Callback = function(state)
		_G.Settings.Esp["ESP Mirage"] = state;
	end
});
EspKitsuneIslandToggle = Tabs.EspTab:Toggle({
	Title = "Esp Kitsune Island",
	Desc = "Highlight Kitsune Island",
	Value = _G.Settings.Esp["ESP Kitsune"],
	Callback = function(state)
		_G.Settings.Esp["ESP Kitsune"] = state;
	end
});
EspFrozenDimensionToggle = Tabs.EspTab:Toggle({
	Title = "Esp Frozen Dimension",
	Desc = "Highlight Frozen Dimension",
	Value = _G.Settings.Esp["ESP Frozen"],
	Callback = function(state)
		_G.Settings.Esp["ESP Frozen"] = state;
	end
});
EspPrehistoricIslandToggle = Tabs.EspTab:Toggle({
	Title = "Esp Prehistoric Island",
	Desc = "Highlight Prehistoric Island",
	Value = _G.Settings.Esp["ESP Prehistoric"],
	Callback = function(state)
		_G.Settings.Esp["ESP Prehistoric"] = state;
	end
});
EspGearToggle = Tabs.EspTab:Toggle({
	Title = "Esp Gear",
	Desc = "Highlight Gear",
	Value = _G.Settings.Esp["ESP Gear"],
	Callback = function(state)
		_G.Settings.Esp["ESP Gear"] = state;
	end
});
-- ====== AUTO DOJO TRAINER (Motor Eclipse - Dragon Dojo) ======
local DojoTrainerSection = Tabs.DragonDojoTab:Section({
	Title = "🥋 Dojo Quest - Belt Trainer",
	TextXAlignment = "Left"
});

Tabs.DragonDojoTab:Paragraph({
	Title = "Auto Dojo Trainer",
	Desc = "Completa as quests de faixa automaticamente (White → Black)"
});

local _G_Dojoo = false;
local debugDojo = false;

local function printBeltName(I)
	if type(I) == "table" and I.Quest and I.Quest.BeltName then
		return I.Quest.BeltName;
	end;
end;

Tabs.DragonDojoTab:Toggle({
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
					-- Vai ao Dojo Trainer
					TweenPlayer(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875));
					debugDojo = true;
				elseif debugDojo == true and ((CFrame.new(5865.0234375,1208.3154296875,871.15185546875)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
					if K == "White" then
						-- Mata Skull Slayer no Tiki Outpost
						local mob = GetConnectionEnemies("Skull Slayer");
						if mob then
							repeat task.wait(); G.Kill(mob, _G_Dojoo); until not e or not _G_Dojoo or not G.Alive(mob);
						else
							TweenPlayer(CFrame.new(-16759.58984375, 71.283767700195, 1595.3399658203));
						end;
					elseif K == "Yellow" or K == "Green" or K == "Red" then
						-- Sea Events (ativa automático)
						repeat task.wait();
							_G.SeaBeast1=true; _G.SailBoats=true;
						until not _G_Dojoo or not e;
						_G.SeaBeast1=false; _G.SailBoats=false;
					elseif K == "Purple" then
						-- Elite Hunter
						repeat task.wait(); _G.FarmEliteHunt=true; until not _G_Dojoo or not e;
						_G.FarmEliteHunt=false;
					elseif K == "Black" then
						-- Prehistoric Island
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
					-- Reclama a quest concluída
					local J = {{[1] = {NPC="Dojo Trainer", Command="ClaimQuest"}}};
					(game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")):InvokeServer(unpack(J[1]));
				end;
			end);
		end;
	end;
end);

DragonDojoSection = Tabs.DragonDojoTab:Section({
	Title = "Dragon Dojo",
	TextXAlignment = "Left"
});
AutoFarmBlazeEmberToggle = Tabs.DragonDojoTab:Toggle({
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
					repeat
						(game:GetService("RunService")).Heartbeat:wait();
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
					repeat
						(game:GetService("RunService")).Heartbeat:wait();
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
CraftVolcanicMagnetButton = Tabs.DragonDojoTab:Button({
	Title = "Craft Volcanic Magnet",
	Callback = function()
		(((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("CraftItem", "Craft", "Volcanic Magnet");
	end
});
local DracoTrialSection = Tabs.DragonDojoTab:Section({
	Title = "Draco Trial",
	TextXAlignment = "Left"
});
GetQuestDracoLevel = function()
	local I = { [1] = { NPC = "Dragon Wizard", Command = "Upgrade" } };
	return (game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")):InvokeServer(unpack(I));
end;
UpgradeDracoTrialToggle = Tabs.DragonDojoTab:Toggle({
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
DracoV1Toggle = Tabs.DragonDojoTab:Toggle({
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
DracoV2Toggle = Tabs.DragonDojoTab:Toggle({
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
DracoV3Toggle = Tabs.DragonDojoTab:Toggle({
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
RelicDracoTrialToggle = Tabs.DragonDojoTab:Toggle({
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
local SeaEventSection = Tabs.SeaEventTab:Section({
	Title = "🌊 Sea Event - Setting Sail",
	TextXAlignment = "Left"
});

-- Barcos disponíveis
ChooseBoatDropdown = Tabs.SeaEventTab:Dropdown({
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

ChooseZoneDropdown = Tabs.SeaEventTab:Dropdown({
	Title = "Choose Zone (Sea 3)",
	Desc = "Nível de perigo para navegar (Sea 3 apenas)",
	Values = {"Lv 1","Lv 2","Lv 3","Lv 4","Lv 5","Lv 6","Lv Infinite"},
	Value = "Lv 1",
	Callback = function(option)
		_G.DangerSc = option;
	end
});

local BoatSpeedSlider = Tabs.SeaEventTab:Slider({
	Title = "Boat Speed",
	Desc = "Velocidade customizada do barco (padrão: 300)",
	Value = {Min = 50, Max = 2000, Default = 300},
	Callback = function(v)
		_G.SetSpeedBoat = v;
	end
});

-- Auto Boat Speed aplicada em tempo real
Tabs.SeaEventTab:Toggle({
	Title = "Activate Boat Speed",
	Desc = "Aplica velocidade customizada no barco",
	Value = false,
	Callback = function(v)
		_G.SpeedBoat = v;
	end
});
task.spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.SpeedBoat then
			pcall(function()
				if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				   and game.Players.LocalPlayer.Character.Humanoid.Sit then
					for _, boat in pairs(workspace.Boats:GetChildren()) do
						local seat = boat:FindFirstChildWhichIsA("VehicleSeat");
						if seat then
							seat.MaxSpeed = _G.SetSpeedBoat or 300;
							seat.Torque = 0.2;
							seat.TurnSpeed = 5;
						end;
					end;
				end;
			end);
		end;
	end);
end);

-- Auto Sail (Motor Eclipse - teleporte direto no barco)
AutoSailBoatToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Start Sail (Buy Boat + Navigate)",
	Desc = "Compra o barco, senta nele, navega para a zona de farm selecionada",
	Value = _G.Settings.SeaEvent["Sail Boat"],
	Callback = function(state)
		_G.Settings.SeaEvent["Sail Boat"] = state;
		_G.SailBoats = state;
		(getgenv()).SaveSetting();
	end
});

spawn(function()
	while wait() do
		if _G.SailBoats then
			pcall(function()
				local boat = CheckBoat();
				local hasEnemy = (CheckShark() and _G.Shark)
					or (CheckTerrorShark() and _G.TerrorShark)
					or (CheckFishCrew() and _G.MobCrew)
					or (CheckPiranha() and _G.Piranha)
					or (CheckEnemiesBoat() and _G.FishBoat)
					or (CheckSeaBeast() and _G.SeaBeast1)
					or (_G.PGB and CheckPirateGrandBrigade())
					or (_G.HCM and CheckHauntedCrew())
					or (_G.Leviathan1 and CheckLeviathan());

				if not boat then
					-- Compra barco no dealer
					local dealerPos = CFrame.new(-16927.451, 9.086, 433.864);
					TweenPlayer(dealerPos);
					if (dealerPos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
						(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat or "Guardian");
					end;
				elseif not hasEnemy then
					if game.Players.LocalPlayer.Character.Humanoid.Sit == false then
						-- Senta no barco
						local seat = boat:FindFirstChildWhichIsA("VehicleSeat");
						if seat then
							_tp(seat.CFrame * CFrame.new(0,1,0));
						end;
					else
						-- Navega para a zona de perigo
						local zone = CFrame.new(-21998.375, 30.0006084, -682.309143);
						if _G.DangerSc == "Lv 2" then zone = CFrame.new(-26779.5215, 30.0005474, -822.858032);
						elseif _G.DangerSc == "Lv 3" then zone = CFrame.new(-31171.957, 30.0001011, -2256.93774);
						elseif _G.DangerSc == "Lv 4" then zone = CFrame.new(-34054.6875, 30.2187767, -2560.12012);
						elseif _G.DangerSc == "Lv 5" then zone = CFrame.new(-38887.5547, 30.0004578, -2162.99023);
						elseif _G.DangerSc == "Lv 6" then zone = CFrame.new(-44541.7617, 30.0003204, -1244.8584);
						elseif _G.DangerSc == "Lv Infinite" then zone = CFrame.new(-10000000, 31, 37016.25);
						end;
						_tp(zone);
					end;
				end;
			end);
		end;
	end;
end);

-- NoClip para barcos
spawn(function()
	while wait(0.2) do
		pcall(function()
			for _, boat in pairs(workspace.Boats:GetChildren()) do
				for _, part in pairs(boat:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = not (_G.SailBoats or _G.FindMirage);
					end;
				end;
			end;
		end);
	end;
end);

SeaEventEnemiesSection = Tabs.SeaEventTab:Section({
	Title = "Enemies",
	TextXAlignment = "Left"
});
AutoFarmSharkToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Shark",
	Value = _G.Settings.SeaEvent["Auto Farm Shark"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Shark"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Shark"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmPiranhaToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Piranha",
	Value = _G.Settings.SeaEvent["Auto Farm Piranha"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Piranha"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Piranha"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmFishCrewMemberToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Fish Crew Member",
	Value = _G.Settings.SeaEvent["Auto Farm Fish Crew Member"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Fish Crew Member"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Fish Crew Member"]);
		(getgenv()).SaveSetting();
	end
});
SeaEventBoatSection = Tabs.SeaEventTab:Section({
	Title = "Boat",
	TextXAlignment = "Left"
});
AutoFarmGhostShipToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Ghost Ship",
	Value = _G.Settings.SeaEvent["Auto Farm Ghost Ship"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Ghost Ship"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Ghost Ship"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmPirateBrigadeToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Pirate Brigade",
	Value = _G.Settings.SeaEvent["Auto Farm Pirate Brigade"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Pirate Brigade"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Pirate Brigade"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmPirateGrandBrigadeToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Pirate Grand Brigade",
	Value = _G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Pirate Grand Brigade"]);
		(getgenv()).SaveSetting();
	end
});
SeaEventBossSection = Tabs.SeaEventTab:Section({
	Title = "Boss",
	TextXAlignment = "Left"
});
AutoFarmTerrorsharkToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Terrorshark",
	Value = _G.Settings.SeaEvent["Auto Farm Terrorshark"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Terrorshark"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Terrorshark"]);
		(getgenv()).SaveSetting();
	end
});
AutoFarmSeabeastsToggle = Tabs.SeaEventTab:Toggle({
	Title = "Auto Farm Seabeasts",
	Value = _G.Settings.SeaEvent["Auto Farm Seabeasts"],
	Callback = function(state)
		_G.Settings.SeaEvent["Auto Farm Seabeasts"] = state;
		StopTween(_G.Settings.SeaEvent["Auto Farm Seabeasts"]);
		(getgenv()).SaveSetting();
	end
});
SeaStackSection = Tabs.SeaStackTab:Section({
	Title = "Islands",
	TextXAlignment = "Left"
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
				MirageStatusSeaStackParagraph:SetDesc("ðŸï¸ Mirage Island Spawning");
			else
				MirageStatusSeaStackParagraph:SetDesc("ðŸï¸ Mirage Island Not Spawn");
			end;
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
				KitsuneStatusSeaStackParagraph:SetDesc("â›©ï¸ Kitsune Island Spawning");
			else
				KitsuneStatusSeaStackParagraph:SetDesc("â›©ï¸ Kitsune Island Not Spawn");
			end;
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				FrozenStatusSeaStackParagraph:SetDesc("â„ï¸ Frozen Dimension Spawning");
			else
				FrozenStatusSeaStackParagraph:SetDesc("â„ï¸ Frozen Dimension Not Spawn");
			end;
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				PrehistoricStatusSeaStackParagraph:SetDesc("ðŸ¦´ Prehistoric Island Spawning");
			else
				PrehistoricStatusSeaStackParagraph:SetDesc("ðŸ¦´ Prehistoric Island Not Spawn");
			end;
		end;
	end);
end);
PrehistoricStatusSeaStackParagraph = Tabs.SeaStackTab:Paragraph({
	Title = "Prehistoric Status",
	Desc = "N/A"
});
AutoSummonPrehistoricIslandToggle = Tabs.SeaStackTab:Toggle({
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
TweenToPrehistoricIslandToggle = Tabs.SeaStackTab:Toggle({
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
AutoKillLavaGolemToggle = Tabs.SeaStackTab:Toggle({
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
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
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
FrozenStatusSeaStackParagraph = Tabs.SeaStackTab:Paragraph({
	Title = "Frozen Status",
	Desc = "N/A"
});
AutoSummonFrozenDimensionToggle = Tabs.SeaStackTab:Toggle({
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
TweenToFrozenDimensionToggle = Tabs.SeaStackTab:Toggle({
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
BribeLeviathanStatusParagraph = Tabs.SeaStackTab:Paragraph({
	Title = "Leviathan Status",
	Desc = "0"
});
BribeLeviathanButton = Tabs.SeaStackTab:Button({
	Title = "Bribe Leviathan",
	Callback = function()
		local Status = (game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("InfoLeviathan", "2");
		BribeLeviathanStatusParagraph:SetDesc(Status);
	end
});
KitsuneStatusSeaStackParagraph = Tabs.SeaStackTab:Paragraph({
	Title = "Kitsune Status",
	Desc = "N/A"
});
AutoSummonKitsuneIslandToggle = Tabs.SeaStackTab:Toggle({
	Title = "Summon Kitsune Island",
	Value = _G.Settings.SeaStack["Summon Kitsune Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Summon Kitsune Island"] = state;
		StopTween(_G.Settings.SeaStack["Summon Kitsune Island"]);
		(getgenv()).SaveSetting();
	end
});
TweenToKitsuneIslandToggle = Tabs.SeaStackTab:Toggle({
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
AutoCollectAzureEmberToggle = Tabs.SeaStackTab:Toggle({
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
SetAzureEmberSlider = Tabs.SeaStackTab:Slider({
	Title = "Set Azure Ember",
	Step = 1,
	Value = {
		Min = 1,
		Max = 25,
		Default = _G.Settings.SeaStack["Set Azure Ember"]
	},
	Callback = function(value)
		_G.Settings.SeaStack["Set Azure Ember"] = value;
		(getgenv()).SaveSetting();
	end
});
AutoTradeAzureEmberToggle = Tabs.SeaStackTab:Toggle({
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
MirageStatusSeaStackParagraph = Tabs.SeaStackTab:Paragraph({
	Title = "Mirage Status",
	Desc = "N/A"
});
TweenToMirageIslandToggle = Tabs.SeaStackTab:Toggle({
	Title = "Tween To Mirage Island",
	Value = _G.Settings.SeaStack["Tween To Mirage Island"],
	Callback = function(state)
		_G.Settings.SeaStack["Tween To Mirage Island"] = state;
		StopTween(_G.Settings.SeaStack["Tween To Mirage Island"]);
		(getgenv()).SaveSetting();
	end
});
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
SeaBeastSeaStackSection = Tabs.SeaStackTab:Section({
	Title = "Sea Beasts",
	TextXAlignment = "Left"
});
AutoAttackSeaBeastsToggle = Tabs.SeaStackTab:Toggle({
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
								(game:GetService("RunService")).Heartbeat:wait();
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
SettingSeaSection = Tabs.SeaSettingsTab:Section({
	Title = "Setting Sea",
	TextXAlignment = "Left"
});
LightningToggle = Tabs.SeaSettingsTab:Toggle({
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
IncreaseSpeedBoatToggle = Tabs.SeaSettingsTab:Toggle({
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
NoClipRockToggle = Tabs.SeaSettingsTab:Toggle({
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
SettingSeaSection = Tabs.SeaSettingsTab:Section({
	Title = "Tools",
	TextXAlignment = "Left"
});
UseDevilFruitSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Use Devil Fruit Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Devil Fruit Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
UseMeleeSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Use Melee Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Melee Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
UseSwordSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Use Sword Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Sword Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
UseGunSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Use Gun Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Use Gun Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitSkillSection = Tabs.SeaSettingsTab:Section({
	Title = "Devil Fruit Skill",
	TextXAlignment = "Left"
});
DevilFruitZSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Devil Fruit Z Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit Z Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitXSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Devil Fruit X Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit X Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitCSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Devil Fruit C Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit C Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitVSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Devil Fruit V Skill",
	Value = _G.Settings.SettingSea["Devil Fruit V Skill"],
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit V Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
DevilFruitFSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Devil Fruit F Skill",
	Value = _G.Settings.SettingSea["Devil Fruit F Skill"],
	Callback = function(state)
		_G.Settings.SettingSea["Devil Fruit F Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeSkillSection = Tabs.SeaSettingsTab:Section({
	Title = "Melee Skill",
	TextXAlignment = "Left"
});
MeleeZSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Melee Z Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee Z Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeXSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Melee X Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee X Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeCSkillToggle = Tabs.SeaSettingsTab:Toggle({
	Title = "Melee C Skill",
	Value = true,
	Callback = function(state)
		_G.Settings.SettingSea["Melee C Skill"] = state;
		(getgenv()).SaveSetting();
	end
});
MeleeVSkillToggle = Tabs.SeaSettingsTab:Toggle({
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
LocalPlayerSection = Tabs.LocalPlayerTab:Section({
	Title = "Local Player",
	TextXAlignment = "Left"
});
AutoActiveRaceV3Toggle = Tabs.LocalPlayerTab:Toggle({
	Title = "Active Race V3",
	Value = _G.Settings.LocalPlayer["Active Race V3"],
	Callback = function(state)
		_G.Settings.LocalPlayer["Active Race V3"] = state;
		(getgenv()).SaveSetting();
	end
});
AutoActiveRaceV4Toggle = Tabs.LocalPlayerTab:Toggle({
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
WalkOnWaterToggle = Tabs.LocalPlayerTab:Toggle({
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
NoClipPlayerToggle = Tabs.LocalPlayerTab:Toggle({
	Title = "No Clip",
	Value = _G.Settings.LocalPlayer["No Clip"],
	Callback = function(state)
		_G.Settings.LocalPlayer["No Clip"] = state;
		(getgenv()).SaveSetting();
	end
});
FruitSection = Tabs.FruitTab:Section({
	Title = "Fruit",
	TextXAlignment = "Left"
});
AutoRandomFruitToggle = Tabs.FruitTab:Toggle({
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
StoreRarityFruitDropdown = Tabs.FruitTab:Dropdown({
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
AutoStoreFruitToggle = Tabs.FruitTab:Toggle({
	Title = "Auto Store Fruit",
	Value = _G.Settings.Fruit["Auto Store Fruit"],
	Callback = function(state)
		_G.Settings.Fruit["Auto Store Fruit"] = state;
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.Settings.Fruit["Auto Store Fruit"] then
				for i, v in pairs((game:GetService("Players")).LocalPlayer.Backpack:GetChildren()) do
					if string.find(v.Name, "Fruit") then
						ResultStoreFruits = {};
						CheckFruits();
						for z, Res in pairs(ResultStoreFruits) do
							if v.Name == Res then
								local NameFruit = v.Name;
								local FirstNameFruit = string.gsub(v.Name, " Fruit", "");
								if (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild(NameFruit) then
									(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StoreFruit", FirstNameFruit .. "-" .. FirstNameFruit, (game:GetService("Players")).LocalPlayer.Backpack:FindFirstChild(NameFruit));
								end;
							end;
						end;
					end;
				end;
			end;
		end);
	end;
end);
FruitNotification = Tabs.FruitTab:Toggle({
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
-- ======================================================
-- FRUIT INTERRUPT SYSTEM
-- Quando Tween To Fruit está ativo e uma fruta aparece,
-- para tudo que envolve farm/teleporte imediatamente
-- ======================================================
_G.FruitInterrupt = false;

local function _getFruitInWorkspace()
	for _, v in pairs(workspace:GetChildren()) do
		if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
			return v;
		end;
	end;
	return nil;
end;

local function _tweenToFruitAndPick(fruit)
	if not fruit or not fruit.Parent or not fruit:FindFirstChild("Handle") then return; end;
	local char = game.Players.LocalPlayer.Character;
	if not char then return; end;
	local hrp = char:FindFirstChild("HumanoidRootPart");
	if not hrp then return; end;
	local TweenSvc = game:GetService("TweenService");
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
	-- Pega a fruta
	pcall(function()
		if fruit and fruit.Parent and fruit:FindFirstChild("Handle") then
			fruit.Handle.CFrame = hrp.CFrame;
		end;
	end);
end;

local function _pauseFarmForFruit(fruit)
	if _G.FruitInterrupt then return; end;
	_G.FruitInterrupt = true;
	-- Salva estados atuais
	local sv_EclipseStart = _G.EclipseStartFarm;
	local sv_EclipseLevel = _G.EclipseLevel;
	local sv_EclipseBone  = _G.EclipseFarm_Bone;
	local sv_EclipseCake  = _G.EclipseFarm_Cake;
	local sv_AutoFarm     = _G.Settings.Main["Auto Farm"];
	local sv_Mastery      = _G.Settings.Main["Auto Farm Fruit Mastery"];
	local sv_Sword        = _G.Settings.Main["Auto Farm Sword Mastery"];
	-- Para tudo
	_G.EclipseStartFarm = false;
	_G.EclipseLevel     = false;
	_G.EclipseFarm_Bone = false;
	_G.EclipseFarm_Cake = false;
	_G.Settings.Main["Auto Farm"] = false;
	_G.Settings.Main["Auto Farm Fruit Mastery"] = false;
	_G.Settings.Main["Auto Farm Sword Mastery"] = false;
	StopTween(false);
	task.wait(0.2);
	-- Vai buscar a fruta com tween real
	_tweenToFruitAndPick(fruit);
	task.wait(0.2);
	_G.FruitInterrupt = false;
	-- Restaura somente se o toggle ainda estiver ativo
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

-- Detecta fruta ao aparecer no workspace (responde instantaneamente)
workspace.ChildAdded:Connect(function(child)
	if _G.Settings.Fruit["Tween To Fruit"]
	   and not _G.FruitInterrupt
	   and string.find(child.Name, "Fruit")
	   and child:FindFirstChild("Handle") then
		task.spawn(function()
			task.wait(0.1); -- aguarda Handle estar pronto
			_pauseFarmForFruit(child);
		end);
	end;
end);

-- ======================================================
-- TELEPORT TO FRUIT
-- Teleporta instantaneamente até a fruta (comportamento antigo)
-- ⚠️ RISCO DE BAN — use por sua conta e risco
-- ======================================================
TeleportToFruitToggle = Tabs.FruitTab:Toggle({
	Title = "Teleport To Fruit",
	Desc = "⚠️ RISCO DE BAN — Teleporta instantâneo para a fruta. Use com cautela.",
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

-- ======================================================
-- TWEEN TO FRUIT
-- Move o personagem até a fruta usando tween (suave)
-- Para tudo que está farmando ao detectar a fruta
-- ======================================================
local collectFruits = function()
	local char = game.Players.LocalPlayer.Character;
	if not char then return end;
	for _, v in pairs(workspace:GetChildren()) do
		if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
			v.Handle.CFrame = char.HumanoidRootPart.CFrame;
		end;
	end;
end;

TweenToFruitToggle = Tabs.FruitTab:Toggle({
	Title = "Tween To Fruit",
	Desc = "Move suavemente até a fruta e para o farm quando ela aparecer.",
	Value = _G.Settings.Fruit["Tween To Fruit"],
	Callback = function(state)
		_G.Settings.Fruit["Tween To Fruit"] = state;
		if not state then
			_G.FruitInterrupt = false;
		end;
		(getgenv()).SaveSetting();
	end
});
-- Loop de verificação para frutas que já estão no workspace
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
GrabFruitButton = Tabs.FruitTab:Button({
	Title = "Grab Fruit",
	Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v:IsA("Tool") then
				v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
			end;
		end;
	end
});
VisualSection = Tabs.FruitTab:Section({
	Title = "Visual",
	TextXAlignment = "Left"
});
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
RainFruitButton = Tabs.FruitTab:Button({
	Title = "Rain Fruit",
	Callback = function()
		rainFruit();
	end
});
MiscSection = Tabs.MiscTab:Section({
	Title = "Misc",
	TextXAlignment = "Left"
});
JoinPiratesTeamButton = Tabs.MiscTab:Button({
	Title = "Join Pirates Team",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
	end
});
JoinMarinesTeamButton = Tabs.MiscTab:Button({
	Title = "Join Marines Team",
	Callback = function()
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetTeam", "Marines");
	end
});
CodeSection = Tabs.MiscTab:Section({
	Title = "Codes",
	TextXAlignment = "Left"
});
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
local RedeemAllCodesButton = Tabs.MiscTab:Button({
	Title = "Redeem All Codes",
	Callback = function()
		for i, v in pairs(codeList) do
			redeemCode(v);
		end;
	end
});
GraphicMiscSection = Tabs.MiscTab:Section({
	Title = "Graphic",
	TextXAlignment = "Left"
});
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
FpsBoostButton = Tabs.MiscTab:Button({
	Title = "Fps Boost",
	Callback = function()
		boostFps();
	end
});
RemoveFogButton = Tabs.MiscTab:Button({
	Title = "Remove Fog",
	Callback = function()
		(game:GetService("Lighting")).LightingLayers:Destroy();
		(game:GetService("Lighting")).Sky:Destroy();
		game.Lighting.FogEnd = 9000000000;
	end
});
RemoveLavaButton = Tabs.MiscTab:Button({
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
ServerTabSection = Tabs.ServerTab:Section({
	Title = "Server",
	TextXAlignment = "Left"
});
RejoinServerButton = Tabs.ServerTab:Button({
	Title = "Rejoin Server",
	Callback = function()
		(game:GetService("TeleportService")):Teleport(game.PlaceId);
	end
});
ServerHopButton = Tabs.ServerTab:Button({
	Title = "Server Hop",
	Callback = function()
		local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
		module:Teleport(game.PlaceId);
	end
});
JobIdParagraph = Tabs.ServerTab:Paragraph({
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
EnterJobIdInput = Tabs.ServerTab:Input({
	Title = "Enter Job ID",
	Callback = function(value)
		_G.JobId = value;
	end
});
JoinJobIdButton = Tabs.ServerTab:Button({
	Title = "Join Job ID",
	Callback = function()
		(game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, _G.JobId);
	end
});
StatusServerSection = Tabs.ServerTab:Section({
	Title = "Status",
	TextXAlignment = "Left"
});
MoonServerParagraph = Tabs.ServerTab:Paragraph({
	Title = "Moon Server",
	Desc = "N/A"
});
KitsuneStatusParagraph = Tabs.ServerTab:Paragraph({
	Title = "Kitsune Status",
	Desc = "N/A"
});
FrozenStatusParagraph = Tabs.ServerTab:Paragraph({
	Title = "Frozen Status",
	Desc = "N/A"
});
MirageStatusParagraph = Tabs.ServerTab:Paragraph({
	Title = "Mirage Status",
	Desc = "N/A"
});
HakiDealerStatusParagraph = Tabs.ServerTab:Paragraph({
	Title = "Haki Dealer Status",
	Desc = "N/A"
});
PrehistoricStatusParagraph = Tabs.ServerTab:Paragraph({
	Title = "Prehistoric Status",
	Desc = "N/A"
});
spawn(function()
	while task.wait() do
		pcall(function()
			if (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
				MoonServerParagraph:SetDesc("ðŸŒ• Full Moon 100%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
				MoonServerParagraph:SetDesc("ðŸŒ– Full Moon 75%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
				MoonServerParagraph:SetDesc("ðŸŒ— Full Moon 50%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
				MoonServerParagraph:SetDesc("ðŸŒ˜ Full Moon 25%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
				MoonServerParagraph:SetDesc("ðŸŒ˜ Full Moon 15%");
			else
				MoonServerParagraph:SetDesc("ðŸŒ‘ Full Moon 0%");
			end;
		end);
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World3 then
				if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
					KitsuneStatusParagraph:SetDesc("â›©ï¸ Kitsune Island is Spawning");
				else
					KitsuneStatusParagraph:SetDesc("â›©ï¸ Kitsune Island Not Spawn");
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
					PrehistoricStatusParagraph:SetDesc("ðŸ¦´ Prehistoric Island is Spawning");
				else
					PrehistoricStatusParagraph:SetDesc("ðŸ¦´ Prehistoric Island Not Spawn");
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
				FrozenStatusParagraph:SetDesc("â„ï¸ Frozen Dimension Spawning");
			else
				FrozenStatusParagraph:SetDesc("â„ï¸ Frozen Dimension Not Spawn");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World2 or World3 then
				if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
					MirageStatusParagraph:SetDesc("ðŸï¸ Mirage Island is Spawning");
				else
					MirageStatusParagraph:SetDesc("ðŸï¸ Mirage Island Not Spawn");
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
				HakiDealerStatusParagraph:SetDesc("ðŸŸ¢ Master Of Auras Spawning");
			else
				HakiDealerStatusParagraph:SetDesc("ðŸ”´ Master Of Auras Not Spawn");
			end;
		end);
	end;
end);
-- ==============================================================
-- MULTI FARM TAB
-- ==============================================================
do
	local MF = Tabs.MultiFarmTab;
	local MFSection = MF:Section({ Title = "Multi Farm", TextXAlignment = "Left" });

	-- Banner de "Em breve"
	MFSection:Paragraph({
		Title = "🚧  EM BREVE  🚧",
		Desc  = "A função Multi Farm está sendo desenvolvida e chegará em breve!\nAguarde as próximas atualizações do Eclipse Hub."
	});

	-- Preview placeholder
	MFSection:Paragraph({
		Title = "O que será:",
		Desc  = "• Farm em múltiplos personagens ao mesmo tempo\n• Rotas automáticas de farm personalizado\n• Ciclos de boss + quest + baú integrados\n• Suporte a todas as ilhas dos 3 mares"
	});
end

