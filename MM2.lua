--// KIRILL_PANEL NO KEY V1 [MM2 EDITION]

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
local FlingingAll = false

local CurrentLanguage = "ru"
local ESPCache = {}

--==================================================
-- УДАЛЯЕМ СТАРУЮ GUI
--==================================================

local OldGui = PlayerGui:FindFirstChild("KIRILL_PANEL_NO_KEY_V1")

if OldGui then
    OldGui:Destroy()
end

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

repeat
    task.wait()
until LanguageChosen

--==================================================
-- ТЕКСТЫ
--==================================================

local T = {

    ru = {
        title = "KIRILL_PANEL NO KEY V1",
        autofarm = "💵 Авто-Сбор Монет",
        esp = "👁️ ESP (Подсветка)",
        grabgun = "🔫 Авто-Забор Пушки",
        speed = "⚡ Скорость Бега",
        fling = "🚀 Выкинуть Всех (Fling)",
        afk = "🛡️ Анти-АФК",
        off = "ВЫКЛ",
        on = "ВКЛ"
    },

    en = {
        title = "KIRILL_PANEL NO KEY V1",
        autofarm = "💵 Auto-Farm Coins",
        esp = "👁️ ESP Player Roles",
        grabgun = "🔫 Auto-Grab Gun",
        speed = "⚡ WalkSpeed",
        fling = "🚀 Fling All Players",
        afk = "🛡️ Anti-AFK",
        off = "OFF",
        on = "ON"
    }

}

local function L(Name)
    return T[CurrentLanguage][Name]
end

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "KIRILL_PANEL_NO_KEY_V1"
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
Panel.Size = UDim2.new(0,230,0,326)
Panel.Position = UDim2.new(0.5,-115,0.5,-163)
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

--==================================================
-- ПЕРЕТАСКИВАНИЕ
--==================================================

local Dragging = false
local DragStart = nil
local StartPos = nil

TitleBar.InputBegan:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = Input.Position
        StartPos = Panel.Position

    end

end)

TitleBar.InputEnded:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false

    end

end)

UserInputService.InputChanged:Connect(function(Input)

    if Dragging
        and (
            Input.UserInputType == Enum.UserInputType.MouseMovement
            or Input.UserInputType == Enum.UserInputType.Touch
        ) then

        local Delta = Input.Position - DragStart

        Panel.Position = UDim2.new(
            StartPos.X.Scale,
            StartPos.X.Offset + Delta.X,
            StartPos.Y.Scale,
            StartPos.Y.Offset + Delta.Y
        )

    end

end)

--==================================================
-- SCROLL
--==================================================

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1,-10,1,-40)
Scroll.Position = UDim2.new(0,5,0,40)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.CanvasSize = UDim2.new(0,0,0,270)
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

local FarmBtn = CreateButton(
    L("autofarm") .. ": " .. L("off"),
    2
)

local ESPBtn = CreateButton(
    L("esp") .. ": " .. L("off"),
    46
)

local GrabBtn = CreateButton(
    L("grabgun") .. ": " .. L("off"),
    90
)

local SpeedBtn = CreateButton(
    L("speed") .. ": " .. L("off"),
    134
)

local FlingBtn = CreateButton(
    L("fling"),
    178
)

local AFKBtn = CreateButton(
    L("afk") .. ": " .. L("off"),
    222
)

FlingBtn.BackgroundColor3 = Color3.fromRGB(180,80,20)

--==================================================
-- СОСТОЯНИЕ КНОПОК
--==================================================

local function SetBtn(Btn, Text, On)

    if On then

        Btn.Text = Text .. ": " .. L("on")
        Btn.BackgroundColor3 = Color3.fromRGB(50,160,70)

    else

        Btn.Text = Text .. ": " .. L("off")
        Btn.BackgroundColor3 = Color3.fromRGB(150,50,50)

    end

end

--==================================================
-- ОТКРЫТИЕ / ЗАКРЫТИЕ
--==================================================

Open.Activated:Connect(function()

    Panel.Visible = true
    Open.Visible = false

end)

Close.Activated:Connect(function()

    Panel.Visible = false
    Open.Visible = true

end)

--==================================================
-- 1. АВТО-СБОР МОНЕТ
--==================================================

FarmBtn.Activated:Connect(function()

    AutoFarmCoins = not AutoFarmCoins

    SetBtn(
        FarmBtn,
        L("autofarm"),
        AutoFarmCoins
    )

end)

-- Отключаем столкновения персонажа во время автофарма
RunService.Stepped:Connect(function()

    if AutoFarmCoins and Player.Character then

        for _, Part in ipairs(
            Player.Character:GetDescendants()
        ) do

            if Part:IsA("BasePart") then
                Part.CanCollide = false
            end

        end

    end

end)

--==================================================
-- ПОИСК МОНЕТ
--==================================================

local function GetCoins()

    local Coins = {}

    for _, Object in ipairs(
        Workspace:GetDescendants()
    ) do

        if Object:IsA("BasePart") then

            local Name =
                string.lower(Object.Name)

            if Name == "coin"
                or Name == "coins"
                or Name == "snowflake"
                or Name == "candy"
                or string.find(Name,"coin")
                or string.find(Name,"snowflake")
                or string.find(Name,"candy") then

                if Object.Transparency < 1 then

                    table.insert(
                        Coins,
                        Object
                    )

                end

            end

        elseif Object:IsA("Model") then

            local Name =
                string.lower(Object.Name)

            if Name == "coin"
                or Name == "coins"
                or string.find(Name,"coin")
                or string.find(Name,"snowflake")
                or string.find(Name,"candy") then

                local Part =
                    Object.PrimaryPart
                    or Object:FindFirstChildWhichIsA(
                        "BasePart",
                        true
                    )

                if Part then

                    table.insert(
                        Coins,
                        Part
                    )

                end

            end

        end

    end

    return Coins

end

--==================================================
-- ДВИЖЕНИЕ К МОНЕТАМ
--==================================================

task.spawn(function()

    while task.wait(0.05) do

        if AutoFarmCoins then

            pcall(function()

                local Character =
                    Player.Character

                local Root =
                    Character
                    and Character:FindFirstChild(
                        "HumanoidRootPart"
                    )

                local Humanoid =
                    Character
                    and Character:FindFirstChild(
                        "Humanoid"
                    )

                if not Root or not Humanoid then
                    return
                end

                -- Такая же скорость, как
                -- у "Скорость Бега"
                local FarmSpeed = 24

                Humanoid.WalkSpeed =
                    FarmSpeed

                local Coins =
                    GetCoins()

                if #Coins == 0 then
                    return
                end

                -- Ищем ближайшую монету
                local NearestCoin = nil
                local NearestDistance =
                    math.huge

                for _, Coin in ipairs(Coins) do

                    if Coin
                        and Coin.Parent
                        and Coin:IsA("BasePart")
                        and Coin.Transparency < 1 then

                        local Distance =
                            (
                                Root.Position
                                - Coin.Position
                            ).Magnitude

                        if Distance <
                            NearestDistance then

                            NearestDistance =
                                Distance

                            NearestCoin =
                                Coin

                        end

                    end

                end

                if NearestCoin then

                    -- Движение, а НЕ телепорт
                    Humanoid:MoveTo(
                        NearestCoin.Position
                    )

                end

            end)

        end

    end

end)

--==================================================
-- 2. ESP РОЛЕЙ
--==================================================

local function ClearESP()

    for _, Data in pairs(ESPCache) do

        if Data.Highlight then
            Data.Highlight:Destroy()
        end

        if Data.Billboard then
            Data.Billboard:Destroy()
        end

    end

    ESPCache = {}

end

ESPBtn.Activated:Connect(function()

    ESPEnabled = not ESPEnabled

    SetBtn(
        ESPBtn,
        L("esp"),
        ESPEnabled
    )

    if not ESPEnabled then
        ClearESP()
    end

end)

local function GetRole(TargetPlayer)

    local Character =
        TargetPlayer.Character

    local Backpack =
        TargetPlayer:FindFirstChild("Backpack")

    if (
        Character
        and Character:FindFirstChild("Knife")
    )
    or (
        Backpack
        and Backpack:FindFirstChild("Knife")
    ) then

        return "Убийца",
            Color3.fromRGB(255,0,0)

    elseif (
        Character
        and Character:FindFirstChild("Gun")
    )
    or (
        Backpack
        and Backpack:FindFirstChild("Gun")
    ) then

        return "Шериф",
            Color3.fromRGB(0,120,255)

    end

    return "Мирный",
        Color3.fromRGB(0,255,100)

end

RunService.RenderStepped:Connect(function()

    if not ESPEnabled then
        return
    end

    for _, Target in ipairs(
        Players:GetPlayers()
    ) do

        if Target ~= Player
            and Target.Character
            and Target.Character:FindFirstChild(
                "HumanoidRootPart"
            )
            and Target.Character:FindFirstChild(
                "Humanoid"
            ) then

            local Char =
                Target.Character

            local Root =
                Char.HumanoidRootPart

            local RoleText,
                RoleColor =
                GetRole(Target)

            local Data =
                ESPCache[Target]

            if not Data then

                Data = {}

                local Highlight =
                    Instance.new("Highlight")

                Highlight.Name =
                    "MM2_ESP_Highlight"

                Highlight.Adornee =
                    Char

                Highlight.FillTransparency =
                    0.4

                Highlight.OutlineTransparency =
                    0

                Highlight.Parent =
                    Char

                Data.Highlight =
                    Highlight

                local Billboard =
                    Instance.new("BillboardGui")

                Billboard.Name =
                    "MM2_ESP_Billboard"

                Billboard.Adornee =
                    Root

                Billboard.Size =
                    UDim2.new(0,120,0,40)

                Billboard.StudsOffset =
                    Vector3.new(0,3,0)

                Billboard.AlwaysOnTop =
                    true

                local Label =
                    Instance.new("TextLabel")

                Label.Size =
                    UDim2.new(1,0,1,0)

                Label.BackgroundTransparency =
                    1

                Label.Font =
                    Enum.Font.GothamBold

                Label.TextSize =
                    12

                Label.TextColor3 =
                    RoleColor

                Label.TextStrokeTransparency =
                    0.1

                Label.TextStrokeColor3 =
                    Color3.fromRGB(0,0,0)

                Label.Parent =
                    Billboard

                Billboard.Parent =
                    Char

                Data.Billboard =
                    Billboard

                Data.Label =
                    Label

                ESPCache[Target] =
                    Data

            end

            Data.Highlight.FillColor =
                RoleColor

            Data.Highlight.OutlineColor =
                RoleColor

            local MyRoot =
                Player.Character
                and Player.Character:FindFirstChild(
                    "HumanoidRootPart"
                )

            local Dist = 0

            if MyRoot then

                Dist =
                    math.floor(
                        (
                            MyRoot.Position
                            - Root.Position
                        ).Magnitude
                    )

            end

            Data.Label.Text =
                Target.Name
                .. "\n["
                .. RoleText
                .. "]\n"
                .. Dist
                .. "m"

            Data.Label.TextColor3 =
                RoleColor

        else

            if ESPCache[Target] then

                if ESPCache[Target].Highlight then
                    ESPCache[Target].Highlight:Destroy()
                end

                if ESPCache[Target].Billboard then
                    ESPCache[Target].Billboard:Destroy()
                end

                ESPCache[Target] = nil

            end

        end

    end

end)

--==================================================
-- 3. АВТО-ЗАБОР ПУШКИ
--==================================================

GrabBtn.Activated:Connect(function()

    AutoGrabGun = not AutoGrabGun

    SetBtn(
        GrabBtn,
        L("grabgun"),
        AutoGrabGun
    )

end)

task.spawn(function()

    while task.wait(0.2) do

        if AutoGrabGun then

            pcall(function()

                local Char =
                    Player.Character

                local Root =
                    Char
                    and Char:FindFirstChild(
                        "HumanoidRootPart"
                    )

                if Root then

                    local DropGun =
                        Workspace:FindFirstChild(
                            "GunDrop",
                            true
                        )

                    if DropGun
                        and DropGun:IsA("BasePart") then

                        Root.CFrame =
                            DropGun.CFrame

                    end

                end

            end)

        end

    end

end)

--==================================================
-- 4. СКОРОСТЬ БЕГА
--==================================================

SpeedBtn.Activated:Connect(function()

    SpeedBoost = not SpeedBoost

    SetBtn(
        SpeedBtn,
        L("speed"),
        SpeedBoost
    )

    if not SpeedBoost
        and Player.Character
        and Player.Character:FindFirstChild(
            "Humanoid"
        ) then

        Player.Character.Humanoid.WalkSpeed =
            16

    end

end)

RunService.RenderStepped:Connect(function()

    if SpeedBoost
        and Player.Character
        and Player.Character:FindFirstChild(
            "Humanoid"
        ) then

        Player.Character.Humanoid.WalkSpeed =
            24

    end

end)

--==================================================
-- 5. FLING ALL
--==================================================

FlingBtn.Activated:Connect(function()

    if FlingingAll then
        return
    end

    FlingingAll = true

    FlingBtn.Text =
        "⏳ Выкидывание..."

    task.spawn(function()

        local Char =
            Player.Character

        local Root =
            Char
            and Char:FindFirstChild(
                "HumanoidRootPart"
            )

        if not Root then

            FlingingAll = false
            FlingBtn.Text = L("fling")

            return

        end

        local SavedCFrame =
            Root.CFrame

        for _, Target in ipairs(
            Players:GetPlayers()
        ) do

            if Target ~= Player
                and Target.Character
                and Target.Character:FindFirstChild(
                    "HumanoidRootPart"
                ) then

                local TargetRoot =
                    Target.Character.HumanoidRootPart

                local StartTime =
                    tick()

                while tick() - StartTime < 0.8 do

                    if TargetRoot
                        and TargetRoot.Parent then

                        Root.CFrame =
                            TargetRoot.CFrame

                        Root.Velocity =
                            Vector3.new(
                                9999,
                                9999,
                                9999
                            )

                    end

                    task.wait()

                end

            end

        end

        Root.Velocity =
            Vector3.new(0,0,0)

        Root.RotVelocity =
            Vector3.new(0,0,0)

        Root.CFrame =
            SavedCFrame

        FlingingAll = false

        FlingBtn.Text =
            L("fling")

    end)

end)

--==================================================
-- 6. АНТИ-АФК
--==================================================

AFKBtn.Activated:Connect(function()

    AntiAFK = not AntiAFK

    SetBtn(
        AFKBtn,
        L("afk"),
        AntiAFK
    )

end)

task.spawn(function()

    while task.wait(600) do

        if AntiAFK then

            pcall(function()

                VirtualUser:CaptureController()

                VirtualUser:ClickButton2(
                    Vector2.new(0,0)
                )

            end)

        end

    end

end)

--==================================================
-- ГОТОВО
--==================================================

print(
    "⚡ KIRILL_PANEL NO KEY V1 LOADED"
)
