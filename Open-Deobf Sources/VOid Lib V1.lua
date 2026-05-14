--[[
    ██╗   ██╗ ██████╗ ██╗██████╗     ██╗     ██╗██████╗ 
    ██║   ██║██╔═══██╗██║██╔══██╗    ██║     ██║██╔══██╗
    ██║   ██║██║   ██║██║██║  ██║    ██║     ██║██████╔╝
    ╚██╗ ██╔╝██║   ██║██║██║  ██║    ██║     ██║██╔══██╗
     ╚████╔╝ ╚██████╔╝██║██████╔╝    ███████╗██║██████╔╝
      ╚═══╝   ╚═════╝ ╚═╝╚═════╝     ╚══════╝╚═╝╚═════╝ 
    
    VOid Lib v2.0 - Purple Futuristic UI for Roblox
    Desenvolvido com estilo galaxy dark purple
--]]

-- ════════════════════════════════════════════════
--              SERVICES & VARIABLES
-- ════════════════════════════════════════════════
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local HttpService      = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ════════════════════════════════════════════════
--                   CONSTANTS
-- ════════════════════════════════════════════════
local UI_W     = 629
local UI_H     = 359
local TAB_W    = 155
local HDR_H    = 44
local CORNER   = 10

-- Asset IDs
local LOGO_ID    = "rbxassetid://123323709846536"
local BTN_IMG_ID = "rbxassetid://140299368368062"
local BANNER_ID  = "rbxassetid://126274248294859"
local DISCORD_ID = "126274248294859"

-- Palette
local C = {
    bg          = Color3.fromRGB(8,  4,  18),
    panel       = Color3.fromRGB(12, 5,  24),
    panelLight  = Color3.fromRGB(18, 8,  36),
    headerBg    = Color3.fromRGB(22, 5,  45),
    border      = Color3.fromRGB(90, 0,  170),
    purple1     = Color3.fromRGB(130, 0,  220),
    purple2     = Color3.fromRGB(80,  0,  160),
    purple3     = Color3.fromRGB(50,  0,  100),
    purpleLight = Color3.fromRGB(180, 60, 255),
    purpleDim   = Color3.fromRGB(100, 40, 180),
    text        = Color3.fromRGB(215, 195, 255),
    textDim     = Color3.fromRGB(120, 100, 160),
    subtitle    = Color3.fromRGB(65,  55, 90),
    white       = Color3.fromRGB(255, 255, 255),
    green       = Color3.fromRGB(67,  181, 129),
    grayDot     = Color3.fromRGB(130, 130, 160),
    discord     = Color3.fromRGB(88,  101, 242),
    aura        = Color3.fromRGB(100, 0,   200),
}

-- ════════════════════════════════════════════════
--                TWEEN HELPERS
-- ════════════════════════════════════════════════
local function Tween(obj, t, style, dir, props)
    style = style or Enum.EasingStyle.Quad
    dir   = dir   or Enum.EasingDirection.Out
    local tw = TweenService:Create(obj, TweenInfo.new(t, style, dir), props)
    tw:Play()
    return tw
end

local function TweenLoop(obj, t, style, dir, props)
    style = style or Enum.EasingStyle.Sine
    dir   = dir   or Enum.EasingDirection.InOut
    local tw = TweenService:Create(obj, TweenInfo.new(t, style, dir, -1, true), props)
    tw:Play()
    return tw
end

-- ════════════════════════════════════════════════
--              RIPPLE EFFECT
-- ════════════════════════════════════════════════
local function Ripple(parent)
    local r = Instance.new("Frame")
    r.Size     = UDim2.new(0, 0, 0, 0)
    r.Position = UDim2.new(0.5, 0, 0.5, 0)
    r.AnchorPoint = Vector2.new(0.5, 0.5)
    r.BackgroundColor3 = C.purpleLight
    r.BackgroundTransparency = 0.55
    r.ZIndex = (parent.ZIndex or 1) + 2
    r.Parent = parent
    Instance.new("UICorner", r).CornerRadius = UDim.new(1,0)
    local sz = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y) * 2.8
    Tween(r, 0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, {
        Size = UDim2.new(0, sz, 0, sz),
        BackgroundTransparency = 1
    })
    task.delay(0.55, function() r:Destroy() end)
end

-- ════════════════════════════════════════════════
--           UICorner / UIStroke shortcuts
-- ════════════════════════════════════════════════
local function Corner(parent, radius)
    local c = Instance.new("UICorner", parent)
    c.CornerRadius = UDim.new(0, radius or CORNER)
    return c
end

local function Stroke(parent, color, thick, transp)
    local s = Instance.new("UIStroke", parent)
    s.Color       = color or C.border
    s.Thickness   = thick or 1
    s.Transparency = transp or 0.4
    return s
end

local function Gradient(parent, c0, c1, rotation)
    local g = Instance.new("UIGradient", parent)
    g.Color = ColorSequence.new(c0, c1)
    g.Rotation = rotation or 90
    return g
end

-- ════════════════════════════════════════════════
--              BUILD SCREENGU
-- ════════════════════════════════════════════════
if PlayerGui:FindFirstChild("VOidLib") then
    PlayerGui:FindFirstChild("VOidLib"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name            = "VOidLib"
ScreenGui.ResetOnSpawn    = false
ScreenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder    = 999
ScreenGui.Parent          = PlayerGui

-- ════════════════════════════════════════════════
--                  AURA LAYERS
-- ════════════════════════════════════════════════
local AuraHolder = Instance.new("Frame", ScreenGui)
AuraHolder.Name                 = "AuraHolder"
AuraHolder.Size                 = UDim2.new(0, UI_W + 80, 0, UI_H + 80)
AuraHolder.Position             = UDim2.new(0.5, -(UI_W+80)/2, 0.5, -(UI_H+80)/2)
AuraHolder.BackgroundTransparency = 1
AuraHolder.ZIndex               = 1

for i = 1, 5 do
    local al = Instance.new("Frame", AuraHolder)
    al.Size     = UDim2.new(1, 0, 1, 0)
    al.Position = UDim2.new(0, 0, 0, 0)
    al.BackgroundColor3     = C.aura
    al.BackgroundTransparency = 0.82 + i * 0.025
    al.ZIndex               = 1
    Corner(al, 18 + i * 5)
    TweenLoop(al, 2.2 + i * 0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {
        BackgroundTransparency = 0.94 + i * 0.01,
        Size   = UDim2.new(1, i*4,   1, i*4),
        Position = UDim2.new(0, -i*2, 0, -i*2)
    })
end

-- ════════════════════════════════════════════════
--                MAIN FRAME
-- ════════════════════════════════════════════════
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name                 = "MainFrame"
MainFrame.Size                 = UDim2.new(0, UI_W, 0, UI_H)
MainFrame.Position             = UDim2.new(0.5, -UI_W/2, 0.5, -UI_H/2)
MainFrame.BackgroundColor3     = C.bg
MainFrame.BorderSizePixel      = 0
MainFrame.ZIndex               = 2
MainFrame.ClipsDescendants     = true
Corner(MainFrame, CORNER)

-- Outer border glow
local BorderGlow = Instance.new("Frame", ScreenGui)
BorderGlow.Size     = UDim2.new(0, UI_W+4, 0, UI_H+4)
BorderGlow.Position = UDim2.new(0.5, -(UI_W+4)/2, 0.5, -(UI_H+4)/2)
BorderGlow.BackgroundColor3 = C.purple1
BorderGlow.BackgroundTransparency = 0.55
BorderGlow.ZIndex   = 1
BorderGlow.BorderSizePixel = 0
Corner(BorderGlow, CORNER+2)
TweenLoop(BorderGlow, 2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {
    BackgroundTransparency = 0.75
})

-- ════════════════════════════════════════════════
--                   HEADER
-- ════════════════════════════════════════════════
local Header = Instance.new("Frame", MainFrame)
Header.Name               = "Header"
Header.Size               = UDim2.new(1, 0, 0, HDR_H)
Header.BackgroundColor3   = C.headerBg
Header.BorderSizePixel    = 0
Header.ZIndex             = 3
Corner(Header, CORNER)

-- Fill bottom corners of header
local HdrFill = Instance.new("Frame", Header)
HdrFill.Size   = UDim2.new(1, 0, 0, CORNER)
HdrFill.Position = UDim2.new(0, 0, 1, -CORNER)
HdrFill.BackgroundColor3 = C.headerBg
HdrFill.BorderSizePixel = 0
HdrFill.ZIndex = 3

Gradient(Header,
    Color3.fromRGB(35, 5, 70),
    Color3.fromRGB(15, 3, 32), 90)

-- Bottom separator line on header
local HdrLine = Instance.new("Frame", MainFrame)
HdrLine.Size   = UDim2.new(1, 0, 0, 1)
HdrLine.Position = UDim2.new(0, 0, 0, HDR_H)
HdrLine.BackgroundColor3 = C.border
HdrLine.BackgroundTransparency = 0.4
HdrLine.BorderSizePixel = 0
HdrLine.ZIndex = 3

-- Logo image (square, left of title)
local LogoImg = Instance.new("ImageLabel", Header)
LogoImg.Size   = UDim2.new(0, 34, 0, 34)
LogoImg.Position = UDim2.new(0, 6, 0.5, -17)
LogoImg.BackgroundColor3 = C.purple3
LogoImg.Image  = LOGO_ID
LogoImg.ZIndex = 4
Corner(LogoImg, 7)
Stroke(LogoImg, C.purpleLight, 1, 0.3)

-- Title "VOid Lib" with animated galaxy gradient
local TitleLbl = Instance.new("TextLabel", Header)
TitleLbl.Size     = UDim2.new(0, 180, 0, 24)
TitleLbl.Position = UDim2.new(0, 46, 0, 4)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text     = "VOid Lib"
TitleLbl.TextSize = 19
TitleLbl.Font     = Enum.Font.GothamBlack
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.ZIndex   = 4

local TitleGrad = Instance.new("UIGradient", TitleLbl)
TitleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(200, 80,  255)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(130, 0,   220)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 130, 255)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(90,  0,   200)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(220, 80,  255)),
})
TitleGrad.Rotation = 0

-- Subtitle
local SubLbl = Instance.new("TextLabel", Header)
SubLbl.Size     = UDim2.new(0, 180, 0, 12)
SubLbl.Position = UDim2.new(0, 47, 0, 28)
SubLbl.BackgroundTransparency = 1
SubLbl.Text     = "script hub  •  v2.0"
SubLbl.TextSize = 9
SubLbl.Font     = Enum.Font.Gotham
SubLbl.TextColor3 = C.subtitle
SubLbl.TextXAlignment = Enum.TextXAlignment.Left
SubLbl.ZIndex   = 4

-- Animate galaxy gradient on title
local gradAngle = 0
RunService.Heartbeat:Connect(function(dt)
    gradAngle = (gradAngle + dt * 28) % 360
    TitleGrad.Rotation = gradAngle
end)

-- ════════════════════════════════════════════════
--       TOGGLE BUTTON (Round, outside left)
-- ════════════════════════════════════════════════
local ToggleBtn = Instance.new("ImageButton", ScreenGui)
ToggleBtn.Name  = "ToggleBtn"
ToggleBtn.Size  = UDim2.new(0, 46, 0, 46)
ToggleBtn.Position = UDim2.new(0.5, -UI_W/2 - 58, 0.5, -23)
ToggleBtn.BackgroundColor3 = C.purple3
ToggleBtn.Image = BTN_IMG_ID
ToggleBtn.ZIndex = 12
ToggleBtn.BorderSizePixel = 0
Corner(ToggleBtn, 50)
Stroke(ToggleBtn, C.purpleLight, 2, 0.2)

-- Pulsing aura on toggle button
local ToggleAura = Instance.new("Frame", ToggleBtn)
ToggleAura.Size   = UDim2.new(1, 12, 1, 12)
ToggleAura.Position = UDim2.new(0, -6, 0, -6)
ToggleAura.BackgroundColor3 = C.purpleLight
ToggleAura.BackgroundTransparency = 0.65
ToggleAura.ZIndex = 11
Corner(ToggleAura, 50)
TweenLoop(ToggleAura, 1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {
    BackgroundTransparency = 0.93,
    Size = UDim2.new(1, 22, 1, 22),
    Position = UDim2.new(0, -11, 0, -11)
})

ToggleBtn.MouseEnter:Connect(function()
    Tween(ToggleBtn, 0.2, nil, nil, {BackgroundColor3 = C.purple2})
end)
ToggleBtn.MouseLeave:Connect(function()
    Tween(ToggleBtn, 0.2, nil, nil, {BackgroundColor3 = C.purple3})
end)

-- ════════════════════════════════════════════════
--         BODY = TAB LIST + CONTENT AREA
-- ════════════════════════════════════════════════
local Body = Instance.new("Frame", MainFrame)
Body.Name     = "Body"
Body.Size     = UDim2.new(1, 0, 1, -HDR_H - 1)
Body.Position = UDim2.new(0, 0, 0, HDR_H + 1)
Body.BackgroundTransparency = 1
Body.ZIndex   = 2

-- Tab scroll list
local TabList = Instance.new("ScrollingFrame", Body)
TabList.Name  = "TabList"
TabList.Size  = UDim2.new(0, TAB_W, 1, -8)
TabList.Position = UDim2.new(0, 4, 0, 4)
TabList.BackgroundColor3 = C.panel
TabList.BorderSizePixel = 0
TabList.ScrollBarThickness = 2
TabList.ScrollBarImageColor3 = C.purple2
TabList.ZIndex = 3
Corner(TabList, 8)

local TabLayout = Instance.new("UIListLayout", TabList)
TabLayout.Padding = UDim.new(0, 3)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

local TabPad = Instance.new("UIPadding", TabList)
TabPad.PaddingTop    = UDim.new(0, 5)
TabPad.PaddingLeft   = UDim.new(0, 4)
TabPad.PaddingRight  = UDim.new(0, 4)
TabPad.PaddingBottom = UDim.new(0, 5)

-- Content area
local ContentArea = Instance.new("Frame", Body)
ContentArea.Name     = "ContentArea"
ContentArea.Size     = UDim2.new(1, -TAB_W - 12, 1, -8)
ContentArea.Position = UDim2.new(0, TAB_W + 8, 0, 4)
ContentArea.BackgroundColor3 = C.panel
ContentArea.BorderSizePixel = 0
ContentArea.ZIndex   = 3
ContentArea.ClipsDescendants = true
Corner(ContentArea, 8)

-- Thin divider
local Divider = Instance.new("Frame", Body)
Divider.Size   = UDim2.new(0, 1, 1, -8)
Divider.Position = UDim2.new(0, TAB_W + 6, 0, 4)
Divider.BackgroundColor3 = C.border
Divider.BackgroundTransparency = 0.6
Divider.BorderSizePixel = 0
Divider.ZIndex = 3

-- ════════════════════════════════════════════════
--              DRAGGABLE HEADER
-- ════════════════════════════════════════════════
do
    local dragging, dragStart, startPos = false, nil, nil

    Header.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = inp.Position
            startPos  = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(inp)
        if not dragging then return end
        if inp.UserInputType ~= Enum.UserInputType.MouseMovement
        and inp.UserInputType ~= Enum.UserInputType.Touch then return end

        local d = inp.Position - dragStart
        local nx = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                             startPos.Y.Scale, startPos.Y.Offset + d.Y)
        MainFrame.Position  = nx
        BorderGlow.Position = UDim2.new(nx.X.Scale, nx.X.Offset - 2,
                                        nx.Y.Scale, nx.Y.Offset - 2)
        AuraHolder.Position = UDim2.new(nx.X.Scale, nx.X.Offset - 40,
                                        nx.Y.Scale, nx.Y.Offset - 40)
        ToggleBtn.Position  = UDim2.new(nx.X.Scale, nx.X.Offset - 58,
                                        nx.Y.Scale, nx.Y.Offset + UI_H/2 - 23)
    end)

    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- ════════════════════════════════════════════════
--          OPEN / CLOSE ANIMATIONS
-- ════════════════════════════════════════════════
local isOpen = true

local function GetUICenter()
    return UDim2.new(
        MainFrame.Position.X.Scale,
        MainFrame.Position.X.Offset + UI_W/2,
        MainFrame.Position.Y.Scale,
        MainFrame.Position.Y.Offset + UI_H/2
    )
end

local function CloseUI()
    if not isOpen then return end
    isOpen = false

    -- Phase 1 (0–1s): compress vertically to center
    Tween(MainFrame, 1.0, Enum.EasingStyle.Quad, Enum.EasingDirection.In, {
        Size = UDim2.new(0, UI_W, 0, UI_H * 0.55)
    })
    task.wait(0.9)
    -- Phase 2 (1–2s): squash horizontally + vertical continues
    Tween(MainFrame, 0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.In, {
        Size = UDim2.new(0, UI_W * 0.45, 0, UI_H * 0.20)
    })
    task.wait(0.8)
    -- Phase 3 (2–3s): collapse to nothing
    Tween(MainFrame, 0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0.7
    })
    Tween(BorderGlow, 0.4, nil, nil, {BackgroundTransparency = 1})
    Tween(AuraHolder, 0.4, nil, nil, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    task.wait(0.4)
    MainFrame.Visible  = false
    BorderGlow.Visible = false
    AuraHolder.Visible = false
end

local function OpenUI()
    if isOpen then return end
    isOpen = true
    MainFrame.Visible  = true
    BorderGlow.Visible = true
    AuraHolder.Visible = true

    -- Snap to zero then spring open
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.BackgroundTransparency = 0.5
    BorderGlow.BackgroundTransparency = 1
    AuraHolder.Size = UDim2.new(0, 0, 0, 0)

    Tween(MainFrame, 0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {
        Size = UDim2.new(0, UI_W, 0, UI_H),
        BackgroundTransparency = 0
    })
    Tween(BorderGlow, 0.55, nil, nil, {BackgroundTransparency = 0.55})
    Tween(AuraHolder, 0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {
        Size = UDim2.new(0, UI_W+80, 0, UI_H+80)
    })
end

ToggleBtn.MouseButton1Click:Connect(function()
    Ripple(ToggleBtn)
    if isOpen then
        task.spawn(CloseUI)
    else
        OpenUI()
    end
end)

-- ════════════════════════════════════════════════
--             TAB SYSTEM
-- ════════════════════════════════════════════════
local tabButtons  = {}
local tabContents = {}
local currentTab  = nil

local function SwitchTab(name)
    if currentTab == name then return end

    -- Hide previous
    if currentTab and tabContents[currentTab] then
        local prev = tabContents[currentTab]
        Tween(prev, 0.18, nil, nil, {BackgroundTransparency = 1})
        task.delay(0.18, function() prev.Visible = false end)
    end

    -- Deactivate all
    for n, btn in pairs(tabButtons) do
        Tween(btn.bg, 0.25, nil, nil, {
            BackgroundColor3 = C.panelLight,
            BackgroundTransparency = 0.6
        })
        btn.ind.BackgroundTransparency = 1
        btn.lbl.TextColor3 = C.textDim
        btn.lbl.Font = Enum.Font.Gotham
    end

    -- Show new
    if tabContents[name] then
        local content = tabContents[name]
        content.Visible   = true
        content.Position  = UDim2.new(0.06, 0, 0, 0)
        content.BackgroundTransparency = 1
        Tween(content, 0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, {
            Position = UDim2.new(0, 0, 0, 0)
        })
    end

    -- Activate button
    if tabButtons[name] then
        local btn = tabButtons[name]
        Tween(btn.bg, 0.25, nil, nil, {
            BackgroundColor3 = C.purple2,
            BackgroundTransparency = 0
        })
        Tween(btn.ind, 0.25, nil, nil, {BackgroundTransparency = 0})
        btn.lbl.TextColor3 = C.white
        btn.lbl.Font = Enum.Font.GothamBold
    end

    currentTab = name
end

local function AddTab(name, order)
    -- Tab button
    local tbBtn = Instance.new("TextButton", TabList)
    tbBtn.Name  = name
    tbBtn.Size  = UDim2.new(1, 0, 0, 26)
    tbBtn.BackgroundTransparency = 1
    tbBtn.Text  = ""
    tbBtn.ZIndex = 4
    tbBtn.LayoutOrder = order
    tbBtn.ClipsDescendants = true

    local tbBg = Instance.new("Frame", tbBtn)
    tbBg.Size   = UDim2.new(1, 0, 1, 0)
    tbBg.BackgroundColor3 = C.panelLight
    tbBg.BackgroundTransparency = 0.6
    tbBg.ZIndex = 4
    Corner(tbBg, 6)

    -- Left indicator bar
    local tbInd = Instance.new("Frame", tbBtn)
    tbInd.Size   = UDim2.new(0, 3, 0.65, 0)
    tbInd.Position = UDim2.new(0, 0, 0.175, 0)
    tbInd.BackgroundColor3 = C.purpleLight
    tbInd.BackgroundTransparency = 1
    tbInd.ZIndex = 6
    Corner(tbInd, 3)

    local tbLbl = Instance.new("TextLabel", tbBtn)
    tbLbl.Size   = UDim2.new(1, -10, 1, 0)
    tbLbl.Position = UDim2.new(0, 8, 0, 0)
    tbLbl.BackgroundTransparency = 1
    tbLbl.Text   = name:gsub("Tab | ", "")
    tbLbl.TextSize = 11
    tbLbl.Font   = Enum.Font.Gotham
    tbLbl.TextColor3 = C.textDim
    tbLbl.TextXAlignment = Enum.TextXAlignment.Left
    tbLbl.TextTruncate   = Enum.TextTruncate.AtEnd
    tbLbl.ZIndex = 6

    -- Content ScrollingFrame
    local content = Instance.new("ScrollingFrame", ContentArea)
    content.Name  = name .. "_Content"
    content.Size  = UDim2.new(1, 0, 1, 0)
    content.Position = UDim2.new(0, 0, 0, 0)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 3
    content.ScrollBarImageColor3 = C.purple2
    content.Visible = false
    content.ZIndex  = 4

    local cLayout = Instance.new("UIListLayout", content)
    cLayout.Padding    = UDim.new(0, 5)
    cLayout.SortOrder  = Enum.SortOrder.LayoutOrder

    local cPad = Instance.new("UIPadding", content)
    cPad.PaddingTop    = UDim.new(0, 7)
    cPad.PaddingLeft   = UDim.new(0, 7)
    cPad.PaddingRight  = UDim.new(0, 7)
    cPad.PaddingBottom = UDim.new(0, 7)

    cLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        content.CanvasSize = UDim2.new(0, 0, 0, cLayout.AbsoluteContentSize.Y + 14)
    end)

    tabButtons[name]  = {btn = tbBtn, bg = tbBg, ind = tbInd, lbl = tbLbl}
    tabContents[name] = content

    -- Hover
    tbBtn.MouseEnter:Connect(function()
        if currentTab ~= name then
            Tween(tbBg, 0.15, nil, nil, {
                BackgroundColor3 = C.purple3,
                BackgroundTransparency = 0.2
            })
        end
    end)
    tbBtn.MouseLeave:Connect(function()
        if currentTab ~= name then
            Tween(tbBg, 0.15, nil, nil, {
                BackgroundColor3 = C.panelLight,
                BackgroundTransparency = 0.6
            })
        end
    end)

    tbBtn.MouseButton1Click:Connect(function()
        Ripple(tbBg)
        SwitchTab(name)
    end)

    return content
end

-- Update tab list canvas
TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TabList.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y + 10)
end)

-- ════════════════════════════════════════════════
--              COMPONENT LIBRARY
-- ════════════════════════════════════════════════
local Comp = {}

-- ─── Section Header ───────────────────────────
function Comp.Section(parent, text)
    local f = Instance.new("Frame", parent)
    f.Size   = UDim2.new(1, 0, 0, 22)
    f.BackgroundTransparency = 1
    f.ZIndex = 5

    local line = Instance.new("Frame", f)
    line.Size  = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0.5, 0)
    line.BackgroundColor3 = C.purple2
    line.BackgroundTransparency = 0.45
    line.ZIndex = 5

    local bg = Instance.new("TextLabel", f)
    bg.Size   = UDim2.new(0, 0, 1, 0)
    bg.AutomaticSize = Enum.AutomaticSize.X
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = C.panel
    bg.BorderSizePixel  = 0
    bg.Text  = "  " .. text .. "  "
    bg.TextSize = 10
    bg.Font  = Enum.Font.GothamBold
    bg.TextColor3 = C.purpleLight
    bg.ZIndex = 6
    return f
end

-- ─── Label ────────────────────────────────────
function Comp.Label(parent, text)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size   = UDim2.new(1, 0, 0, 20)
    lbl.BackgroundTransparency = 1
    lbl.Text   = text
    lbl.TextSize = 11
    lbl.Font   = Enum.Font.Gotham
    lbl.TextColor3 = C.textDim
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 5
    return lbl
end

-- ─── Toggle ───────────────────────────────────
function Comp.Toggle(parent, text, default, callback)
    local state = default or false

    local frame = Instance.new("Frame", parent)
    frame.Size  = UDim2.new(1, 0, 0, 34)
    frame.BackgroundColor3 = C.panelLight
    frame.BorderSizePixel  = 0
    frame.ZIndex = 5
    Corner(frame, 8)

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size  = UDim2.new(1, -58, 1, 0)
    lbl.Position = UDim2.new(0, 11, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text  = text
    lbl.TextSize = 12
    lbl.Font  = Enum.Font.Gotham
    lbl.TextColor3 = C.text
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6

    -- Track
    local track = Instance.new("Frame", frame)
    track.Size  = UDim2.new(0, 38, 0, 19)
    track.Position = UDim2.new(1, -48, 0.5, -9.5)
    track.BackgroundColor3 = state and C.purple1 or C.purple3
    track.BorderSizePixel  = 0
    track.ZIndex = 6
    Corner(track, 20)

    -- Thumb
    local thumb = Instance.new("Frame", track)
    thumb.Size   = UDim2.new(0, 15, 0, 15)
    thumb.Position = state and UDim2.new(1, -17, 0.5, -7.5) or UDim2.new(0, 2, 0.5, -7.5)
    thumb.BackgroundColor3 = C.white
    thumb.ZIndex = 7
    Corner(thumb, 20)

    -- Thumb inner glow
    local tg = Instance.new("Frame", thumb)
    tg.Size   = UDim2.new(1, 6, 1, 6)
    tg.Position = UDim2.new(0, -3, 0, -3)
    tg.BackgroundColor3 = C.purpleLight
    tg.BackgroundTransparency = state and 0.5 or 1
    tg.ZIndex = 6
    Corner(tg, 20)

    local clickBtn = Instance.new("TextButton", frame)
    clickBtn.Size   = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text   = ""
    clickBtn.ZIndex = 8

    clickBtn.MouseButton1Click:Connect(function()
        state = not state
        local toPos = state and UDim2.new(1,-17,0.5,-7.5) or UDim2.new(0,2,0.5,-7.5)
        local toClr = state and C.purple1 or C.purple3
        Tween(thumb,  0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {Position = toPos})
        Tween(track,  0.22, nil, nil, {BackgroundColor3 = toClr})
        Tween(tg,     0.22, nil, nil, {BackgroundTransparency = state and 0.5 or 1})
        if callback then task.spawn(callback, state) end
    end)

    clickBtn.MouseEnter:Connect(function()
        Tween(frame, 0.15, nil, nil, {BackgroundColor3 = Color3.fromRGB(24,10,45)})
    end)
    clickBtn.MouseLeave:Connect(function()
        Tween(frame, 0.15, nil, nil, {BackgroundColor3 = C.panelLight})
    end)

    return {
        Frame = frame,
        Get   = function() return state end,
        Set   = function(v)
            state = v
            thumb.Position = v and UDim2.new(1,-17,0.5,-7.5) or UDim2.new(0,2,0.5,-7.5)
            track.BackgroundColor3 = v and C.purple1 or C.purple3
        end
    }
end

-- ─── Button ───────────────────────────────────
function Comp.Button(parent, text, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size  = UDim2.new(1, 0, 0, 32)
    frame.BackgroundTransparency = 1
    frame.ZIndex = 5

    local btn = Instance.new("TextButton", frame)
    btn.Size   = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = C.purple2
    btn.BorderSizePixel  = 0
    btn.Text   = text
    btn.TextSize = 12
    btn.Font   = Enum.Font.GothamBold
    btn.TextColor3 = C.white
    btn.ZIndex = 6
    btn.ClipsDescendants = true
    Corner(btn, 8)
    Stroke(btn, C.purpleLight, 1, 0.5)
    Gradient(btn,
        Color3.fromRGB(110, 0, 190),
        Color3.fromRGB(55,  0, 110), 90)

    btn.MouseEnter:Connect(function()
        Tween(btn, 0.18, nil, nil, {BackgroundColor3 = Color3.fromRGB(140,0,240)})
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, 0.18, nil, nil, {BackgroundColor3 = C.purple2})
    end)
    btn.MouseButton1Down:Connect(function()
        Tween(btn, 0.08, nil, nil, {
            Size = UDim2.new(0.96, 0, 0.9, 0),
            Position = UDim2.new(0.02, 0, 0.05, 0)
        })
    end)
    btn.MouseButton1Up:Connect(function()
        Tween(btn, 0.18, Enum.EasingStyle.Back, nil, {
            Size = UDim2.new(1,0,1,0),
            Position = UDim2.new(0,0,0,0)
        })
    end)
    btn.MouseButton1Click:Connect(function()
        Ripple(btn)
        if callback then task.spawn(callback) end
    end)

    return {Frame = frame, Button = btn}
end

-- ─── Dropdown ─────────────────────────────────
function Comp.Dropdown(parent, label, opts, callback)
    local selected  = opts[1] or ""
    local expanded  = false
    local totalH    = #opts * 27 + 10

    local container = Instance.new("Frame", parent)
    container.Name  = "DD_"..label
    container.Size  = UDim2.new(1, 0, 0, 32)
    container.BackgroundTransparency = 1
    container.ZIndex = 5
    container.ClipsDescendants = false

    local header = Instance.new("TextButton", container)
    header.Size   = UDim2.new(1, 0, 0, 32)
    header.BackgroundColor3 = C.panelLight
    header.BorderSizePixel  = 0
    header.Text   = ""
    header.ZIndex = 6
    header.ClipsDescendants = true
    Corner(header, 8)
    Stroke(header, C.border, 1, 0.5)

    local hLbl = Instance.new("TextLabel", header)
    hLbl.Size   = UDim2.new(1, -36, 1, 0)
    hLbl.Position = UDim2.new(0, 10, 0, 0)
    hLbl.BackgroundTransparency = 1
    hLbl.Text   = label .. ":  " .. selected
    hLbl.TextSize = 12
    hLbl.Font   = Enum.Font.Gotham
    hLbl.TextColor3 = C.text
    hLbl.TextXAlignment = Enum.TextXAlignment.Left
    hLbl.ZIndex = 7

    local arrow = Instance.new("TextLabel", header)
    arrow.Size   = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -26, 0.5, -10)
    arrow.BackgroundTransparency = 1
    arrow.Text   = "▼"
    arrow.TextSize = 11
    arrow.Font   = Enum.Font.GothamBold
    arrow.TextColor3 = C.purpleLight
    arrow.ZIndex = 7

    -- Drop list (sits on top via ZIndex, outside container)
    local dropList = Instance.new("Frame", container)
    dropList.Size   = UDim2.new(1, 0, 0, 0)
    dropList.Position = UDim2.new(0, 0, 1, 3)
    dropList.BackgroundColor3 = C.panelLight
    dropList.BorderSizePixel  = 0
    dropList.ZIndex  = 20
    dropList.ClipsDescendants = true
    Corner(dropList, 8)
    Stroke(dropList, C.border, 1, 0.4)

    local dlLayout = Instance.new("UIListLayout", dropList)
    dlLayout.Padding = UDim.new(0, 2)
    local dlPad = Instance.new("UIPadding", dropList)
    dlPad.PaddingTop    = UDim.new(0, 4)
    dlPad.PaddingLeft   = UDim.new(0, 4)
    dlPad.PaddingRight  = UDim.new(0, 4)
    dlPad.PaddingBottom = UDim.new(0, 4)

    for _, opt in ipairs(opts) do
        local ob = Instance.new("TextButton", dropList)
        ob.Size   = UDim2.new(1, 0, 0, 25)
        ob.BackgroundColor3 = C.purple3
        ob.BackgroundTransparency = 0.5
        ob.BorderSizePixel  = 0
        ob.Text   = opt
        ob.TextSize = 11
        ob.Font   = Enum.Font.Gotham
        ob.TextColor3 = C.text
        ob.ZIndex = 21
        Corner(ob, 5)

        ob.MouseEnter:Connect(function()
            Tween(ob, 0.14, nil, nil, {
                BackgroundColor3 = C.purple2,
                BackgroundTransparency = 0
            })
        end)
        ob.MouseLeave:Connect(function()
            Tween(ob, 0.14, nil, nil, {
                BackgroundColor3 = C.purple3,
                BackgroundTransparency = 0.5
            })
        end)
        ob.MouseButton1Click:Connect(function()
            selected = opt
            hLbl.Text = label .. ":  " .. selected
            expanded = false
            Tween(dropList, 0.22, nil, nil, {Size = UDim2.new(1,0,0,0)})
            Tween(arrow, 0.22, nil, nil, {Rotation = 0})
            container.Size = UDim2.new(1, 0, 0, 32)
            if callback then task.spawn(callback, selected) end
        end)
    end

    header.MouseButton1Click:Connect(function()
        expanded = not expanded
        if expanded then
            Tween(dropList, 0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {
                Size = UDim2.new(1, 0, 0, totalH)
            })
            Tween(arrow, 0.25, nil, nil, {Rotation = 180})
            container.Size = UDim2.new(1, 0, 0, 32 + totalH + 5)
        else
            Tween(dropList, 0.2, nil, nil, {Size = UDim2.new(1,0,0,0)})
            Tween(arrow, 0.2, nil, nil, {Rotation = 0})
            container.Size = UDim2.new(1, 0, 0, 32)
        end
    end)

    return {Frame = container, Get = function() return selected end}
end

-- ─── Slider ───────────────────────────────────
function Comp.Slider(parent, text, minV, maxV, defV, callback)
    local value   = defV or minV
    local sliding = false

    local frame = Instance.new("Frame", parent)
    frame.Size  = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = C.panelLight
    frame.BorderSizePixel  = 0
    frame.ZIndex = 5
    Corner(frame, 8)

    local topRow = Instance.new("Frame", frame)
    topRow.Size   = UDim2.new(1, 0, 0, 24)
    topRow.BackgroundTransparency = 1
    topRow.ZIndex = 6

    local sLbl = Instance.new("TextLabel", topRow)
    sLbl.Size   = UDim2.new(0.7, 0, 1, 0)
    sLbl.Position = UDim2.new(0, 11, 0, 0)
    sLbl.BackgroundTransparency = 1
    sLbl.Text   = text
    sLbl.TextSize = 12
    sLbl.Font   = Enum.Font.Gotham
    sLbl.TextColor3 = C.text
    sLbl.TextXAlignment = Enum.TextXAlignment.Left
    sLbl.ZIndex = 6

    local vLbl = Instance.new("TextLabel", topRow)
    vLbl.Size   = UDim2.new(0.3, -11, 1, 0)
    vLbl.Position = UDim2.new(0.7, 0, 0, 0)
    vLbl.BackgroundTransparency = 1
    vLbl.Text   = tostring(math.floor(value))
    vLbl.TextSize = 11
    vLbl.Font   = Enum.Font.GothamBold
    vLbl.TextColor3 = C.purpleLight
    vLbl.TextXAlignment = Enum.TextXAlignment.Right
    vLbl.ZIndex = 6

    -- Track
    local track = Instance.new("Frame", frame)
    track.Size  = UDim2.new(1, -22, 0, 5)
    track.Position = UDim2.new(0, 11, 0, 36)
    track.BackgroundColor3 = C.purple3
    track.BorderSizePixel  = 0
    track.ZIndex = 6
    Corner(track, 5)

    local pct = (value - minV) / (maxV - minV)

    local fill = Instance.new("Frame", track)
    fill.Size  = UDim2.new(pct, 0, 1, 0)
    fill.BackgroundColor3 = C.purple1
    fill.ZIndex = 7
    Corner(fill, 5)
    Gradient(fill,
        Color3.fromRGB(100, 0, 180),
        Color3.fromRGB(200, 70, 255), 0)

    local thumb = Instance.new("Frame", track)
    thumb.Size  = UDim2.new(0, 13, 0, 13)
    thumb.Position = UDim2.new(pct, -6.5, 0.5, -6.5)
    thumb.BackgroundColor3 = C.white
    thumb.ZIndex = 9
    Corner(thumb, 20)

    local tGl = Instance.new("Frame", thumb)
    tGl.Size   = UDim2.new(1, 8, 1, 8)
    tGl.Position = UDim2.new(0, -4, 0, -4)
    tGl.BackgroundColor3 = C.purpleLight
    tGl.BackgroundTransparency = 0.55
    tGl.ZIndex = 8
    Corner(tGl, 20)

    -- Invisible input region
    local inputBtn = Instance.new("TextButton", frame)
    inputBtn.Size   = UDim2.new(1, -22, 0, 18)
    inputBtn.Position = UDim2.new(0, 11, 0, 29)
    inputBtn.BackgroundTransparency = 1
    inputBtn.Text   = ""
    inputBtn.ZIndex = 10

    local function UpdateSlider(X)
        local tp  = track.AbsolutePosition.X
        local tw  = track.AbsoluteSize.X
        local rel = math.clamp((X - tp) / tw, 0, 1)
        value = math.floor(minV + (maxV - minV) * rel)
        local p = (value - minV) / (maxV - minV)
        fill.Size     = UDim2.new(p, 0, 1, 0)
        thumb.Position = UDim2.new(p, -6.5, 0.5, -6.5)
        vLbl.Text = tostring(value)
        if callback then task.spawn(callback, value) end
    end

    inputBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            sliding = true
            UpdateSlider(inp.Position.X)
        end
    end)

    UserInputService.InputChanged:Connect(function(inp)
        if sliding and (inp.UserInputType == Enum.UserInputType.MouseMovement
        or inp.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(inp.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)

    return {Frame = frame, Get = function() return value end}
end

-- ─── Discord Card ─────────────────────────────
function Comp.DiscordCard(parent, guildId, inviteCode)
    local card = Instance.new("Frame", parent)
    card.Size   = UDim2.new(1, 0, 0, 138)
    card.BackgroundColor3 = Color3.fromRGB(13, 6, 28)
    card.BorderSizePixel  = 0
    card.ZIndex = 5
    card.ClipsDescendants = true
    Corner(card, 10)
    Stroke(card, C.border, 1, 0.3)

    -- Banner
    local banner = Instance.new("ImageLabel", card)
    banner.Size  = UDim2.new(1, 0, 0, 68)
    banner.BackgroundColor3 = C.purple3
    banner.Image = BANNER_ID
    banner.ScaleType = Enum.ScaleType.Crop
    banner.ZIndex = 6

    -- Dark gradient over banner bottom
    local bannerGrad = Instance.new("Frame", banner)
    bannerGrad.Size  = UDim2.new(1, 0, 1, 0)
    bannerGrad.BackgroundColor3 = Color3.new(0,0,0)
    bannerGrad.BackgroundTransparency = 0.3
    bannerGrad.ZIndex = 7
    local bg2 = Instance.new("UIGradient", bannerGrad)
    bg2.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.65, 0.5),
        NumberSequenceKeypoint.new(1, 0)
    })
    bg2.Rotation = 90

    -- Server name over banner
    local srvName = Instance.new("TextLabel", banner)
    srvName.Size  = UDim2.new(1, -12, 0, 22)
    srvName.Position = UDim2.new(0, 12, 1, -25)
    srvName.BackgroundTransparency = 1
    srvName.Text  = "VOid Hub"
    srvName.TextSize = 13
    srvName.Font  = Enum.Font.GothamBlack
    srvName.TextColor3 = C.white
    srvName.TextXAlignment = Enum.TextXAlignment.Left
    srvName.ZIndex = 8

    -- Bottom area
    local bottom = Instance.new("Frame", card)
    bottom.Size  = UDim2.new(1, 0, 0, 70)
    bottom.Position = UDim2.new(0, 0, 0, 68)
    bottom.BackgroundColor3 = Color3.fromRGB(18, 8, 38)
    bottom.BorderSizePixel  = 0
    bottom.ZIndex = 6

    -- Online dot + label
    local onDot = Instance.new("Frame", bottom)
    onDot.Size  = UDim2.new(0, 8, 0, 8)
    onDot.Position = UDim2.new(0, 12, 0, 12)
    onDot.BackgroundColor3 = C.green
    onDot.ZIndex = 7
    Corner(onDot, 10)

    local onLbl = Instance.new("TextLabel", bottom)
    onLbl.Size  = UDim2.new(0.55, -28, 0, 18)
    onLbl.Position = UDim2.new(0, 26, 0, 7)
    onLbl.BackgroundTransparency = 1
    onLbl.Text  = "Carregando..."
    onLbl.TextSize = 11
    onLbl.Font  = Enum.Font.Gotham
    onLbl.TextColor3 = C.green
    onLbl.TextXAlignment = Enum.TextXAlignment.Left
    onLbl.ZIndex = 7

    -- Total dot + label
    local totDot = Instance.new("Frame", bottom)
    totDot.Size  = UDim2.new(0, 8, 0, 8)
    totDot.Position = UDim2.new(0, 12, 0, 38)
    totDot.BackgroundColor3 = C.grayDot
    totDot.ZIndex = 7
    Corner(totDot, 10)

    local totLbl = Instance.new("TextLabel", bottom)
    totLbl.Size  = UDim2.new(0.55, -28, 0, 18)
    totLbl.Position = UDim2.new(0, 26, 0, 33)
    totLbl.BackgroundTransparency = 1
    totLbl.Text  = "Carregando..."
    totLbl.TextSize = 11
    totLbl.Font  = Enum.Font.Gotham
    totLbl.TextColor3 = C.grayDot
    totLbl.TextXAlignment = Enum.TextXAlignment.Left
    totLbl.ZIndex = 7

    -- Join button
    local joinBtn = Instance.new("TextButton", bottom)
    joinBtn.Size  = UDim2.new(0, 95, 0, 28)
    joinBtn.Position = UDim2.new(1, -105, 0.5, -14)
    joinBtn.BackgroundColor3 = C.discord
    joinBtn.BorderSizePixel  = 0
    joinBtn.Text  = "Enter in Group"
    joinBtn.TextSize = 11
    joinBtn.Font  = Enum.Font.GothamBold
    joinBtn.TextColor3 = C.white
    joinBtn.ZIndex = 8
    joinBtn.ClipsDescendants = true
    Corner(joinBtn, 6)

    -- Pulse on join button
    TweenLoop(joinBtn, 1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {
        BackgroundColor3 = Color3.fromRGB(110, 125, 255)
    })

    local copied = false
    joinBtn.MouseButton1Click:Connect(function()
        if copied then return end
        copied = true
        Ripple(joinBtn)

        pcall(function()
            setclipboard("https://discord.gg/" .. (inviteCode or "voidhub"))
        end)

        -- Animate text change
        local origText = joinBtn.Text
        Tween(joinBtn, 0.12, nil, nil, {
            BackgroundColor3 = C.green,
            Size = UDim2.new(0, 95, 0, 28)
        })
        joinBtn.Text = "✓ Link Copiado!"

        task.delay(2.5, function()
            copied = false
            joinBtn.Text = origText
            Tween(joinBtn, 0.3, nil, nil, {BackgroundColor3 = C.discord})
        end)
    end)

    -- Fetch Discord member count
    task.spawn(function()
        local ok, res = pcall(function()
            local raw = HttpService:GetAsync(
                "https://discord.com/api/guilds/" .. guildId .. "/widget.json", true)
            return HttpService:JSONDecode(raw)
        end)
        if ok and res then
            local online = res.presence_count or res.approximate_presence_count
            local total  = res.approximate_member_count
            onLbl.Text   = tostring(online or "?") .. " Online"
            totLbl.Text  = tostring(total  or "?") .. " Membros"
        else
            onLbl.Text  = "Entre no discord!"
            totLbl.Text = "discord.gg/voidhub"
        end
    end)

    return {Frame = card}
end

-- ════════════════════════════════════════════════
--          CREATE ALL TABS (in order)
-- ════════════════════════════════════════════════
local TABS = {
    "Tab | Discord",
    "Tab | Status And Server",
    "Tab | Shop",
    "Tab | Settings",
    "Tab | Hold And Skill",
    "Tab | Main Farm",
    "Tab | Multi Farm",
    "Tab | Sub Farm",
    "Tab | Sea And Events",
    "Tab | Draco And Dojo",
    "Tab | Prehistoric Event",
    "Tab | Races And Mirage",
    "Tab | Fruits And Raid",
    "Tab | Stats And Esp",
    "Tab | PvP",
    "Tab | Teleport",
    "Tab | Misc"
}

local tabFrames = {}
for i, name in ipairs(TABS) do
    tabFrames[name] = AddTab(name, i)
end

-- ════════════════════════════════════════════════
--       DISCORD TAB — SHOWCASE ALL COMPONENTS
-- ════════════════════════════════════════════════
local dTab = tabFrames["Tab | Discord"]

-- Discord card
Comp.Section(dTab, "SERVIDOR DISCORD")
Comp.DiscordCard(dTab, DISCORD_ID, "voidhub")

-- Toggles showcase
Comp.Section(dTab, "TOGGLES")
Comp.Toggle(dTab, "Auto Farm Ativo", false, function(v)
    print("[VOid] Auto Farm:", v)
end)
Comp.Toggle(dTab, "Auto Quest", true, function(v)
    print("[VOid] Auto Quest:", v)
end)
Comp.Toggle(dTab, "God Mode (Visual)", false, function(v)
    print("[VOid] God Mode:", v)
end)
Comp.Toggle(dTab, "No Clip", false, function(v)
    print("[VOid] No Clip:", v)
end)

-- Buttons showcase
Comp.Section(dTab, "BOTÕES")
Comp.Button(dTab, "🔗  Conectar ao Servidor", function()
    print("[VOid] Conectando...")
end)
Comp.Button(dTab, "🔄  Rejoin Servidor", function()
    print("[VOid] Rejoin...")
end)

-- Dropdowns showcase
Comp.Section(dTab, "DROPDOWNS")
Comp.Dropdown(dTab, "Região", {"Auto", "US East", "US West", "EU", "Asia", "BR"}, function(v)
    print("[VOid] Região:", v)
end)
Comp.Dropdown(dTab, "Modo de Jogo", {"Normal", "Hard", "Extreme", "Chaos"}, function(v)
    print("[VOid] Modo:", v)
end)

-- Sliders showcase
Comp.Section(dTab, "SLIDERS")
Comp.Slider(dTab, "Walk Speed", 0, 500, 16, function(v)
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
end)
Comp.Slider(dTab, "Jump Power", 0, 500, 50, function(v)
    pcall(function()
        LocalPlayer.Character.Humanoid.JumpPower = v
    end)
end)
Comp.Slider(dTab, "Campo de Visão (FOV)", 60, 120, 70, function(v)
    print("[VOid] FOV:", v)
end)
Comp.Slider(dTab, "Transparência Personagem", 0, 100, 0, function(v)
    print("[VOid] Transparência:", v)
end)

-- ════════════════════════════════════════════════
--   OTHER TABS — Placeholder com estrutura pronta
-- ════════════════════════════════════════════════
local function PlaceholderTab(name)
    local t = tabFrames[name]
    local short = name:gsub("Tab | ", "")
    Comp.Section(t, short:upper())
    Comp.Toggle(t, "Ativar " .. short, false, function(v)
        print("[VOid] "..short..":", v)
    end)
    Comp.Button(t, "Executar " .. short, function()
        print("[VOid] Executando "..short)
    end)
    Comp.Slider(t, "Velocidade", 0, 100, 50, nil)
    Comp.Label(t, "Adicione seus scripts aqui...")
end

for _, name in ipairs(TABS) do
    if name ~= "Tab | Discord" then
        PlaceholderTab(name)
    end
end

-- ════════════════════════════════════════════════
--           INITIAL OPEN ANIMATION
-- ════════════════════════════════════════════════
MainFrame.Size = UDim2.new(0, UI_W, 0, 0)
MainFrame.BackgroundTransparency = 0.6
BorderGlow.BackgroundTransparency = 1
AuraHolder.Size = UDim2.new(0, 0, 0, 0)

task.delay(0.05, function()
    Tween(MainFrame, 0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {
        Size = UDim2.new(0, UI_W, 0, UI_H),
        BackgroundTransparency = 0
    })
    Tween(BorderGlow, 0.55, nil, nil, {BackgroundTransparency = 0.55})
    Tween(AuraHolder, 0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {
        Size = UDim2.new(0, UI_W+80, 0, UI_H+80)
    })
end)

-- Select first tab
task.delay(0.1, function()
    SwitchTab("Tab | Discord")
end)

-- ════════════════════════════════════════════════
print("[VOid Lib] UI Carregada com sucesso! ✓")
-- ════════════════════════════════════════════════
