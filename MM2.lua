--// KIRILL_PANEL NO KEY V1.0 [MM2 EDITION]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- НАСТРОЙКИ
--==================================================

local AutoFarmCoins = false
local ESPEnabled = false
local AutoGrabGun = false
local AntiAFK = false
local SpeedBoost = false

local CurrentLanguage = "ru"
local ESPHighlights = {}

--==================================================
-- УДАЛЯЕМ СТАРУЮ GUI
--==================================================

local OldGui = PlayerGui:FindFirstChild("KIRILL_PANEL_MM2")
if OldGui then OldGui:Destroy() end

--==================================================
-- ВЫБОР ЯЗЫКА
--==================================================

local LangGui = Instance.new("ScreenGui")
LangGui.Name = "KIRILL_LANGUAGE_MM2"
LangGui.ResetOnSpawn = false
LangGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LangGui.Parent = PlayerGui

local LangFrame = Instance.new("Frame")
LangFrame.Size = UDim2.new(0,260,0,150)
LangFrame.Position = UDim2.new(0.5,-130,0.5,-75)
LangFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
LangFrame.BorderSizePixel = 0
LangFrame.Parent = LangGui

Instance.new("UICorner", LangFrame).CornerRadius = UDim.new(0,10)

local LangTitle = Instance.new("TextLabel")
LangTitle.Size = UDim2.new(1,0,0,45)
LangTitle.BackgroundTransparency = 1
LangTitle.Text = "Language / Язык"
LangTitle.TextColor3 = Color3.new(1,1,1)
LangTitle.TextSize = 20
LangTitle.Font = Enum.Font.GothamBlack
LangTitle.Parent = LangFrame

local EnglishBtn = Instance.new("TextButton")
EnglishBtn.Size = UDim2.new(0,210,0,38)
EnglishBtn.Position = UDim2.new(0.5,-105,0,55)
EnglishBtn.BackgroundColor3 = Color3.fromRGB(50,100,180)
EnglishBtn.TextColor3 = Color3.new(1,1,1)
EnglishBtn.Text = "English"
EnglishBtn.TextSize = 15
EnglishBtn.Font = Enum.Font.GothamBlack
EnglishBtn.BorderSizePixel = 0
EnglishBtn.Parent = LangFrame

Instance.new("UICorner", EnglishBtn).CornerRadius = UDim.new(0,6)

local RussianBtn = Instance.new("TextButton")
RussianBtn.Size = UDim2.new(0,210,0,38)
RussianBtn.Position = UDim2.new(0.5,-105,0,102)
RussianBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
RussianBtn.TextColor3 = Color3.new(1,1,1)
RussianBtn.Text = "Русский"
RussianBtn.TextSize = 15
RussianBtn.Font = Enum.Font.GothamBlack
RussianBtn.BorderSizePixel = 0
RussianBtn.Parent = LangFrame

Instance.new("UICorner", RussianBtn).CornerRadius = UDim.new(0,6)

local LanguageChosen = false

EnglishBtn.Activated:Connect(function()
    CurrentLanguage = "en"
    LanguageChosen = true
    LangGui:Destroy()
end)

RussianBtn.Activated:Connect(function()
    CurrentLanguage = "ru"
    LanguageChosen = true
    LangGui:Destroy()
end)

repeat task.wait() until LanguageChosen

--==================================================
-- ТЕКСТЫ
--==================================================

local T = {
    ru = {
        title = "KIRILL_PANEL MM2 V1.0",
        autofarm = "🪙 Авто-Сбор Монет",
        esp = "👁️ ESP (Подсветка)",
        grabgun = "🔫 Авто-Забор Пушки",
        speed = "⚡ Скорость Бега",
        afk = "🛡️ Анти-АФК",
        off = "ВЫКЛ",
        on = "ВКЛ"
    },
    en = {
        title = "KIRILL_PANEL MM2 V1.0",
        autofarm = "🪙 Auto-Farm Coins",
        esp = "👁️ ESP Player Roles",
        grabgun = "🔫 Auto-Grab Gun",
        speed = "⚡ WalkSpeed",
        afk = "🛡️ Anti-AFK",
        off = "OFF",
        on = "ON"
    }
}

local function L(Name)
    return T[CurrentLanguage][Name]
end

--==================================================
-- GUI ИНТЕРФЕЙС
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "KIRILL_PANEL_MM2"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

local Open = Instance.new("TextButton")
Open.Size = UDim2.new(0,45,0,45)
Open.Position = UDim2.new(1,-65,0,10)
Open.BackgroundColor3 = Color3.fromRGB(30,30,30)
Open.TextColor3 = Color3.new(1,1,1)
Open.Text = "🔪"
Open.TextSize = 22
Open.Font = Enum.Font.GothamBlack
Open.BorderSizePixel = 0
Open.Parent = Gui

Instance.new("UICorner", Open).CornerRadius = UDim.new(1,0)

local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0,230,0,250)
Panel.Position = UDim2.new(0.5,-115,0.5,-125)
Panel.BackgroundColor3 = Color3.fromRGB(25,25,25)
Panel.BorderSizePixel = 0
Panel.Visible = false
Panel.Parent = Gui

Instance.new("UICorner", Panel).CornerRadius = UDim.new(0,10)

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1,0,0,35)
TitleBar.BackgroundColor3 = Color3.fromRGB(35,35,35)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Panel

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-40,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = L("title")
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 11
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0,25,0,25)
Close.Position = UDim2.new(1,-32,0,5)
Close.BackgroundColor3 = Color3.fromRGB(170,50,50)
Close.Text = "×"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextSize = 16
Close.Font = Enum.Font.GothamBlack
Close.BorderSizePixel = 0
Close.Parent = TitleBar

Instance.new("UICorner", Close).CornerRadius = UDim.new(0,5)

-- ПЕРЕТАСКИВАНИЕ ОКНА
local Dragging, DragStart, StartPos = false, nil, nil

TitleBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true; DragStart = Input.Position; StartPos = Panel.Position
    end
end)

TitleBar.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - DragStart
        Panel.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1,-10,1,-40)
Scroll.Position = UDim2.new(0,5,0,40)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.CanvasSize = UDim2.new(0,0,0,230)
Scroll.ScrollBarThickness = 4
Scroll.Parent = Panel

local function CreateButton(Text, Y)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,-10,0,40)
    Btn.Position = UDim2.new(0,5,0,Y)
    Btn.BackgroundColor3 = Color3.fromRGB(150,50,50)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Text = Text
    Btn.TextSize = 12
    Btn.Font = Enum.Font.GothamBlack
    Btn.BorderSizePixel = 0
    Btn.Parent = Scroll
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,6)
    return Btn
end

local FarmBtn = CreateButton(L("autofarm") .. ": " .. L("off"), 2)
local ESPBtn = CreateButton(L("esp") .. ": " .. L("off"), 46)
local GrabBtn = CreateButton(L("grabgun") .. ": " .. L("off"), 90)
local SpeedBtn = CreateButton(L("speed") .. ": " .. L("off"), 134)
local AFKBtn = CreateButton(L("afk") .. ": " .. L("off"), 178)

local function SetBtn(Btn, Text, On)
    if On then
        Btn.Text = Text .. ": " .. L("on")
        Btn.BackgroundColor3 = Color3.fromRGB(50,160,70)
    else
        Btn.Text = Text .. ": " .. L("off")
        Btn.BackgroundColor3 = Color3.fromRGB(150,50,50)
    end
end

Open.Activated:Connect(function() Panel.Visible = true; Open.Visible = false end)
Close.Activated:Connect(function() Panel.Visible = false; Open.Visible = true end)

--==================================================
-- ЛОГИКА ФУНКЦИЙ
--==================================================

-- 1. АВТО-СБОР МОНЕТ
FarmBtn.Activated:Connect(function()
    AutoFarmCoins = not AutoFarmCoins
    SetBtn(FarmBtn, L("autofarm"), AutoFarmCoins)
end)

task.spawn(function()
    while task.wait(0.2) do
        if AutoFarmCoins then
            pcall(function()
                local Char = Player.Character
                if Char and Char:FindFirstChild("HumanoidRootPart") then
                    for _, Map in ipairs(Workspace:GetChildren()) do
                        local CoinContainer = Map:FindFirstChild("CoinContainer")
                        if CoinContainer then
                            for _, Coin in ipairs(CoinContainer:GetChildren()) do
                                if Coin:IsA("BasePart") and Coin.Transparency < 1 then
                                    Char.HumanoidRootPart.CFrame = Coin.CFrame
                                    task.wait(0.12)
                                    if not AutoFarmCoins then break end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- 2. ESP (ПОДСВЕТКА РОЛЕЙ)
local function RemoveESP()
    for _, Highlight in pairs(ESPHighlights) do
        if Highlight then Highlight:Destroy() end
    end
    ESPHighlights = {}
end

ESPBtn.Activated:Connect(function()
    ESPEnabled = not ESPEnabled
    SetBtn(ESPBtn, L("esp"), ESPEnabled)
    if not ESPEnabled then RemoveESP() end
end)

task.spawn(function()
    while task.wait(1) do
        if ESPEnabled then
            pcall(function()
                for _, Target in ipairs(Players:GetPlayers()) do
                    if Target ~= Player and Target.Character and Target.Character:FindFirstChild("Humanoid") then
                        local Char = Target.Character
                        local Highlight = ESPHighlights[Target] or Instance.new("Highlight")
                        Highlight.Name = "MM2_ESP"
                        Highlight.Adornee = Char
                        Highlight.Parent = Char
                        
                        local Color = Color3.fromRGB(0, 255, 0) -- Зеленый (Мирный)
                        if Target.Backpack:FindFirstChild("Knife") or Char:FindFirstChild("Knife") then
                            Color = Color3.fromRGB(255, 0, 0) -- Красный (Убийца)
                        elseif Target.Backpack:FindFirstChild("Gun") or Char:FindFirstChild("Gun") then
                            Color = Color3.fromRGB(0, 100, 255) -- Синий (Шериф)
                        end
                        
                        Highlight.FillColor = Color
                        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        ESPHighlights[Target] = Highlight
                    end
                end
            end)
        end
    end
end)

-- 3. АВТО-ЗАБОР ПУШКИ
GrabBtn.Activated:Connect(function()
    AutoGrabGun = not AutoGrabGun
    SetBtn(GrabBtn, L("grabgun"), AutoGrabGun)
end)

task.spawn(function()
    while task.wait(0.3) do
        if AutoGrabGun then
            pcall(function()
                local Char = Player.Character
                if Char and Char:FindFirstChild("HumanoidRootPart") then
                    local DropGun = Workspace:FindFirstChild("GunDrop", true)
                    if DropGun and DropGun:IsA("BasePart") then
                        Char.HumanoidRootPart.CFrame = DropGun.CFrame
                    end
                end
            end)
        end
    end
end)

-- 4. СКОРОСТЬ
SpeedBtn.Activated:Connect(function()
    SpeedBoost = not SpeedBoost
    SetBtn(SpeedBtn, L("speed"), SpeedBoost)
    if not SpeedBoost and Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = 16
    end
end)

RunService.RenderStepped:Connect(function()
    if SpeedBoost then
        pcall(function()
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.WalkSpeed = 24
            end
        end)
    end
end)

-- 5. АНТИ-АФК
AFKBtn.Activated:Connect(function()
    AntiAFK = not AntiAFK
    SetBtn(AFKBtn, L("afk"), AntiAFK)
end)

task.spawn(function()
    while task.wait(600) do
        if AntiAFK then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new(0,0))
            end)
        end
    end
end)

print("⚡ KIRILL_PANEL MM2 V1.0 LOADED SUCCESSFUL")

