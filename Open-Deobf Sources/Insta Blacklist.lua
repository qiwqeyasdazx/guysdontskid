local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local onenabledshotho = false

-- =============================================
--              BLACKLIST
-- =============================================
local BLACKLISTED_IDS = {
    -- 123456789,  -- ejemplo de ID
}

local BLACKLISTED_NAMES = {
    -- "NombreDeUsuario",  -- ejemplo de nombre
}

local function isBlacklisted()
    local userId = LocalPlayer.UserId
    local userName = LocalPlayer.Name

    for _, id in ipairs(BLACKLISTED_IDS) do
        if userId == id then return true end
    end
    for _, name in ipairs(BLACKLISTED_NAMES) do
        if string.lower(userName) == string.lower(name) then return true end
    end
    return false
end

if isBlacklisted() then
    -- Crear GUI de ban
    local banGui = Instance.new("ScreenGui")
    banGui.ResetOnSpawn = false
    banGui.Parent = game.CoreGui

    local banOverlay = Instance.new("Frame")
    banOverlay.Size = UDim2.new(1, 0, 1, 0)
    banOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    banOverlay.BackgroundTransparency = 0.4
    banOverlay.Parent = banGui

    local banFrame = Instance.new("Frame")
    banFrame.Size = UDim2.new(0, 320, 0, 140)
    banFrame.Position = UDim2.new(0.5, -160, 0.5, -70)
    banFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    banFrame.Parent = banGui

    local banCorner = Instance.new("UICorner")
    banCorner.CornerRadius = UDim.new(0, 14)
    banCorner.Parent = banFrame

    local banStroke = Instance.new("UIStroke")
    banStroke.Color = Color3.fromRGB(200, 0, 0)
    banStroke.Thickness = 2
    banStroke.Parent = banFrame

    local banTitle = Instance.new("TextLabel")
    banTitle.Size = UDim2.new(1, 0, 0, 45)
    banTitle.Position = UDim2.new(0, 0, 0, 10)
    banTitle.BackgroundTransparency = 1
    banTitle.Text = "🚫  Access Denied"
    banTitle.TextColor3 = Color3.fromRGB(255, 60, 60)
    banTitle.Font = Enum.Font.GothamBold
    banTitle.TextSize = 20
    banTitle.Parent = banFrame

    local banMsg = Instance.new("TextLabel")
    banMsg.Size = UDim2.new(1, -20, 0, 60)
    banMsg.Position = UDim2.new(0, 10, 0, 55)
    banMsg.BackgroundTransparency = 1
    banMsg.Text = "You are not allowed to use this script.\nContact us at discord.gg/jt6Qf7bFCW"
    banMsg.TextColor3 = Color3.fromRGB(180, 180, 180)
    banMsg.Font = Enum.Font.Gotham
    banMsg.TextSize = 13
    banMsg.TextWrapped = true
    banMsg.Parent = banFrame

    return  -- Detiene el script completamente
end

-- =============================================
--              KEY SYSTEM
-- =============================================
local VALID_KEY = "bleiker-2026"
local EXPIRED_KEYS = {"SHOTHO-2025"}

local keyGui = Instance.new("ScreenGui")
keyGui.ResetOnSpawn = false
keyGui.Name = "KeySystemGui"
keyGui.Parent = game.CoreGui

-- Background blur overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.5
overlay.Parent = keyGui

-- Main key box
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 320, 0, 200)
keyFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyFrame.Parent = keyGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 14)
keyCorner.Parent = keyFrame

local keyStroke = Instance.new("UIStroke")
keyStroke.Color = Color3.fromRGB(255, 255, 255)
keyStroke.Thickness = 1.5
keyStroke.Transparency = 0.6
keyStroke.Parent = keyFrame

-- Title
local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Position = UDim2.new(0, 0, 0, 10)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "🔑  Enter your key"
keyTitle.TextColor3 = Color3.new(1, 1, 1)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 18
keyTitle.Parent = keyFrame

-- Discord hint label
local discordHint = Instance.new("TextLabel")
discordHint.Size = UDim2.new(1, -20, 0, 30)
discordHint.Position = UDim2.new(0, 10, 0, 48)
discordHint.BackgroundTransparency = 1
discordHint.Text = "Get your key by joining our Discord:\ndiscord.gg/jt6Qf7bFCW"
discordHint.TextColor3 = Color3.fromRGB(150, 150, 150)
discordHint.Font = Enum.Font.Gotham
discordHint.TextSize = 12
discordHint.TextWrapped = true
discordHint.Parent = keyFrame

-- Input box
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -30, 0, 36)
keyInput.Position = UDim2.new(0, 15, 0, 100)
keyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
keyInput.TextColor3 = Color3.new(1, 1, 1)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 14
keyInput.PlaceholderText = "Paste your key here..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
keyInput.Text = ""
keyInput.ClearTextOnFocus = false
keyInput.Parent = keyFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = keyInput

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(80, 80, 80)
inputStroke.Thickness = 1
inputStroke.Parent = keyInput

-- Submit button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(1, -30, 0, 34)
submitBtn.Position = UDim2.new(0, 15, 0, 148)
submitBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
submitBtn.TextColor3 = Color3.new(1, 1, 1)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 14
submitBtn.Text = "Submit"
submitBtn.Parent = keyFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 8)
submitCorner.Parent = submitBtn

-- Error label (hidden by default)
local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(1, -20, 0, 28)
errorLabel.Position = UDim2.new(0, 10, 1, 6)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = "❌  Wrong key. Join discord.gg/jt6Qf7bFCW to get yours."
errorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
errorLabel.Font = Enum.Font.Gotham
errorLabel.TextSize = 11
errorLabel.TextWrapped = true
errorLabel.Visible = false
errorLabel.Parent = keyFrame

-- =============================================
--         MAIN SCRIPT (hidden until key OK)
-- =============================================
local function showAdNotification()
    local adGui = Instance.new("ScreenGui")
    adGui.ResetOnSpawn = false
    adGui.Name = "AdNotification"
    adGui.Parent = game.CoreGui

    local adFrame = Instance.new("Frame")
    adFrame.Size = UDim2.new(0, 300, 0, 80)
    adFrame.Position = UDim2.new(1, 10, 1, -100) -- empieza fuera de pantalla
    adFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    adFrame.Parent = adGui

    local adCorner = Instance.new("UICorner")
    adCorner.CornerRadius = UDim.new(0, 12)
    adCorner.Parent = adFrame

    local adStroke = Instance.new("UIStroke")
    adStroke.Color = Color3.fromRGB(255, 215, 0)
    adStroke.Thickness = 1.5
    adStroke.Parent = adFrame

    local adIcon = Instance.new("TextLabel")
    adIcon.Size = UDim2.new(0, 30, 1, 0)
    adIcon.Position = UDim2.new(0, 8, 0, 0)
    adIcon.BackgroundTransparency = 1
    adIcon.Text = "⭐"
    adIcon.TextSize = 22
    adIcon.Font = Enum.Font.GothamBold
    adIcon.Parent = adFrame

    local adTitle = Instance.new("TextLabel")
    adTitle.Size = UDim2.new(1, -50, 0, 28)
    adTitle.Position = UDim2.new(0, 42, 0, 8)
    adTitle.BackgroundTransparency = 1
    adTitle.Text = "Want a MUCH better script?"
    adTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    adTitle.Font = Enum.Font.GothamBold
    adTitle.TextSize = 13
    adTitle.TextXAlignment = Enum.TextXAlignment.Left
    adTitle.Parent = adFrame

    local adMsg = Instance.new("TextLabel")
    adMsg.Size = UDim2.new(1, -50, 0, 36)
    adMsg.Position = UDim2.new(0, 42, 0, 34)
    adMsg.BackgroundTransparency = 1
    adMsg.Text = "Join discord.gg/jt6Qf7bFCW\nand ask for  Rivals Premium!"
    adMsg.TextColor3 = Color3.fromRGB(200, 200, 200)
    adMsg.Font = Enum.Font.Gotham
    adMsg.TextSize = 11
    adMsg.TextXAlignment = Enum.TextXAlignment.Left
    adMsg.TextWrapped = true
    adMsg.Parent = adFrame

    -- Animación: deslizar desde la derecha
    adFrame:TweenPosition(
        UDim2.new(1, -310, 1, -100),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quint,
        0.5,
        true
    )

    -- Esperar 5 segundos y deslizar hacia afuera
    task.delay(5, function()
        adFrame:TweenPosition(
            UDim2.new(1, 10, 1, -100),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Quint,
            0.4,
            true,
            function()
                adGui:Destroy()
            end
        )
    end)
end

local function loadMainScript()
    keyGui:Destroy()
    showAdNotification()

    -- GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.CoreGui

    -- Botón principal (Frame) con borde y glow
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(0, 140, 0, 55)
    buttonFrame.Position = UDim2.new(0.1, 0, 0.7, 0)
    buttonFrame.BackgroundTransparency = 0
    buttonFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    buttonFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = buttonFrame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2
    stroke.Parent = buttonFrame

    local glow = Instance.new("UIStroke")
    glow.Color = Color3.fromRGB(255, 255, 255)
    glow.Thickness = 6
    glow.Transparency = 0.7
    glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    glow.Parent = buttonFrame

    local imgFrame = Instance.new("Frame")
    imgFrame.Size = UDim2.new(1, -8, 1, -8)
    imgFrame.Position = UDim2.new(0, 4, 0, 4)
    imgFrame.BackgroundTransparency = 1
    imgFrame.Parent = buttonFrame

    local bg = Instance.new("ImageLabel")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundTransparency = 1
    bg.Image = "rbxassetid://97814938166007"
    bg.Parent = imgFrame

    local greenOverlay = Instance.new("Frame")
    greenOverlay.Size = UDim2.new(1, -8, 1, -8)
    greenOverlay.Position = UDim2.new(0, 4, 0, 4)
    greenOverlay.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    greenOverlay.BackgroundTransparency = 0.88
    greenOverlay.Visible = false
    greenOverlay.ZIndex = 2
    greenOverlay.Parent = buttonFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.6, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Rivals"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.ZIndex = 3
    title.Parent = buttonFrame

    local titleOutline = Instance.new("UIStroke")
    titleOutline.Color = Color3.new(0, 0, 0)
    titleOutline.Thickness = 2
    titleOutline.Parent = title

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0.4, 0)
    subtitle.Position = UDim2.new(0, 0, 0.6, 0)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "one shot"
    subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextScaled = true
    subtitle.ZIndex = 3
    subtitle.Parent = buttonFrame

    local subtitleOutline = Instance.new("UIStroke")
    subtitleOutline.Color = Color3.new(0, 0, 0)
    subtitleOutline.Thickness = 1.5
    subtitleOutline.Parent = subtitle

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = ""
    button.Parent = buttonFrame

    -- Toggle
    button.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        onenabledshotho = not onenabledshotho
        greenOverlay.Visible = onenabledshotho

        if onenabledshotho then
            task.spawn(function()
                while onenabledshotho do
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        if humanoid.MaxHealth > 0 and (humanoid.Health / humanoid.MaxHealth) <= 0.2 then
                            onenabledshotho = false
                            greenOverlay.Visible = false
                            break
                        end
                    end

                    local pos = hrp.Position
                    hrp.CFrame = CFrame.new(pos.X, pos.Y - 795679695796326795679695796326, pos.Z)
                    task.wait(0.01)
                end
            end)
        end
    end)

    -- DRAG SYSTEM
    local dragging = false
    local dragStart
    local startPos

    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = buttonFrame.Position
        end
    end)

    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            buttonFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- =============================================
--            KEY VERIFICATION
-- =============================================
local function isExpired(key)
    for _, expired in ipairs(EXPIRED_KEYS) do
        if key == expired then return true end
    end
    return false
end

local function shakeFrame()
    local originalPos = keyFrame.Position
    for i = 1, 4 do
        keyFrame.Position = UDim2.new(0.5, -160 + (i % 2 == 0 and 6 or -6), 0.5, -100)
        task.wait(0.05)
    end
    keyFrame.Position = originalPos
end

local function checkKey()
    local entered = keyInput.Text
    if entered == VALID_KEY then
        loadMainScript()
    elseif isExpired(entered) then
        errorLabel.Text = "⚠️  This key has expired. Get a new one at discord.gg/jt6Qf7bFCW"
        errorLabel.TextColor3 = Color3.fromRGB(255, 180, 0)
        errorLabel.Visible = true
        shakeFrame()
    else
        errorLabel.Text = "❌  Wrong key. Join discord.gg/jt6Qf7bFCW to get yours."
        errorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        errorLabel.Visible = true
        shakeFrame()
    end
end

submitBtn.MouseButton1Click:Connect(checkKey)

keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkKey()
    end
end)
