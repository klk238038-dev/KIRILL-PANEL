--// KIRILL_PANEL NO KEY V1.35
--// MUSCLE LEGENDS
--// SCROLL MENU

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- SETTINGS
--==================================================

local AutoTrain = false
local AutoRebirth = false
local AutoKing = false
local AntiAFK = false
local AutoEgg = false
local AutoDurability = false

--==================================================
-- REMOVE OLD GUI
--==================================================

local OldGui = PlayerGui:FindFirstChild("KIRILL_PANEL_NO_KEY")

if OldGui then
OldGui:Destroy()
end

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "KIRILL_PANEL NO KEY"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

--==================================================
-- OPEN BUTTON
--==================================================

local OpenButton = Instance.new("TextButton")

OpenButton.Size = UDim2.new(0,55,0,55)
OpenButton.Position = UDim2.new(1,-70,0,15)

OpenButton.BackgroundColor3 =
Color3.fromRGB(30,30,30)

OpenButton.TextColor3 =
Color3.new(1,1,1)

OpenButton.Text = "⚡"
OpenButton.TextSize = 28
OpenButton.Font = Enum.Font.GothamBlack

OpenButton.BorderSizePixel = 0
OpenButton.Parent = Gui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1,0)
OpenCorner.Parent = OpenButton

--==================================================
-- MAIN PANEL
--==================================================

local Panel = Instance.new("Frame")

Panel.Size = UDim2.new(0,310,0,420)
Panel.Position = UDim2.new(0,15,0.5,-210)

Panel.BackgroundColor3 =
Color3.fromRGB(25,25,25)

Panel.BorderSizePixel = 0
Panel.Visible = false
Panel.Parent = Gui

local PanelCorner = Instance.new("UICorner")
PanelCorner.CornerRadius = UDim.new(0,12)
PanelCorner.Parent = Panel

--==================================================
-- TITLE
--==================================================

local Title = Instance.new("TextLabel")

Title.Size = UDim2.new(1,-90,0,40)
Title.Position = UDim2.new(0,15,0,5)

Title.BackgroundTransparency = 1

Title.Text = "⚡ KIRILL_PANEL NO KEY"
Title.TextColor3 = Color3.new(1,1,1)

Title.TextSize = 18
Title.Font = Enum.Font.GothamBlack

Title.TextXAlignment =
Enum.TextXAlignment.Left

Title.Parent = Panel
--==================================================
-- DRAG MENU
--==================================================

local UserInputService = game:GetService("UserInputService")

local Dragging = false
local DragStart
local StartPosition

Title.Active = true

Title.InputBegan:Connect(function(Input)

if Input.UserInputType == Enum.UserInputType.MouseButton1
or Input.UserInputType == Enum.UserInputType.Touch then

Dragging = true    
DragStart = Input.Position    
StartPosition = Panel.Position

end

end)

Title.InputEnded:Connect(function(Input)

if Input.UserInputType == Enum.UserInputType.MouseButton1
or Input.UserInputType == Enum.UserInputType.Touch then

Dragging = false

end

end)

UserInputService.InputChanged:Connect(function(Input)

if not Dragging then
return
end

if Input.UserInputType == Enum.UserInputType.MouseMovement
or Input.UserInputType == Enum.UserInputType.Touch then

local Delta = Input.Position - DragStart    

Panel.Position = UDim2.new(    
	StartPosition.X.Scale,    
	StartPosition.X.Offset + Delta.X,    

	StartPosition.Y.Scale,    
	StartPosition.Y.Offset + Delta.Y    
)

end

end)
--==================================================
-- VERSION
--==================================================

local Version = Instance.new("TextLabel")

Version.Size = UDim2.new(0,55,0,30)
Version.Position = UDim2.new(1,-100,0,10)

Version.BackgroundTransparency = 1

Version.Text = "V1.35"
Version.TextColor3 = Color3.new(1,1,1)

Version.TextSize = 14
Version.Font = Enum.Font.GothamBlack

Version.TextXAlignment =
Enum.TextXAlignment.Right

Version.Parent = Panel

--==================================================
-- CLOSE
--==================================================

local Close = Instance.new("TextButton")

Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-42,0,9)

Close.BackgroundColor3 =
Color3.fromRGB(170,50,50)

Close.Text = "×"
Close.TextColor3 = Color3.new(1,1,1)

Close.TextSize = 20
Close.Font = Enum.Font.GothamBlack

Close.BorderSizePixel = 0
Close.Parent = Panel

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,7)
CloseCorner.Parent = Close

--==================================================
-- STATS AREA
--==================================================

local StatsFrame = Instance.new("Frame")

StatsFrame.Size =
UDim2.new(1,-30,0,65)

StatsFrame.Position =
UDim2.new(0,15,0,48)

StatsFrame.BackgroundColor3 =
Color3.fromRGB(35,35,35)

StatsFrame.BorderSizePixel = 0
StatsFrame.Parent = Panel

local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0,8)
StatsCorner.Parent = StatsFrame

--==================================================
-- STATS LABELS
--==================================================

local StrengthLabel = Instance.new("TextLabel")

StrengthLabel.Size =
UDim2.new(0.5,-5,0,28)

StrengthLabel.Position =
UDim2.new(0,8,0,4)

StrengthLabel.BackgroundTransparency = 1

StrengthLabel.Text =
"Сила: ?"

StrengthLabel.TextColor3 =
Color3.new(1,1,1)

StrengthLabel.TextSize = 14
StrengthLabel.Font = Enum.Font.GothamBold

StrengthLabel.TextXAlignment =
Enum.TextXAlignment.Left

StrengthLabel.Parent = StatsFrame

--==================================================

local RebirthLabel = Instance.new("TextLabel")

RebirthLabel.Size =
UDim2.new(0.5,-5,0,28)

RebirthLabel.Position =
UDim2.new(0.5,0,0,4)

RebirthLabel.BackgroundTransparency = 1

RebirthLabel.Text =
"Ребитхи: ?"

RebirthLabel.TextColor3 =
Color3.new(1,1,1)

RebirthLabel.TextSize = 14
RebirthLabel.Font = Enum.Font.GothamBold

RebirthLabel.TextXAlignment =
Enum.TextXAlignment.Left

RebirthLabel.Parent = StatsFrame

--==================================================

local DurabilityLabel = Instance.new("TextLabel")

DurabilityLabel.Size =
UDim2.new(0.5,-5,0,28)

DurabilityLabel.Position =
UDim2.new(0,8,0,34)

DurabilityLabel.BackgroundTransparency = 1

DurabilityLabel.Text =
"Дурабилити: ?"

DurabilityLabel.TextColor3 =
Color3.new(1,1,1)

DurabilityLabel.TextSize = 14
DurabilityLabel.Font = Enum.Font.GothamBold

DurabilityLabel.TextXAlignment =
Enum.TextXAlignment.Left

DurabilityLabel.Parent = StatsFrame

--==================================================

local AgilityLabel = Instance.new("TextLabel")

AgilityLabel.Size =
UDim2.new(0.5,-5,0,28)

AgilityLabel.Position =
UDim2.new(0.5,0,0,34)

AgilityLabel.BackgroundTransparency = 1

AgilityLabel.Text =
"Ловкость: ?"

AgilityLabel.TextColor3 =
Color3.new(1,1,1)

AgilityLabel.TextSize = 14
AgilityLabel.Font = Enum.Font.GothamBold

AgilityLabel.TextXAlignment =
Enum.TextXAlignment.Left

AgilityLabel.Parent = StatsFrame

--==================================================
-- SCROLLING FRAME
--==================================================

local Scroll = Instance.new("ScrollingFrame")

Scroll.Size =
UDim2.new(1,-30,1,-125)

Scroll.Position =
UDim2.new(0,15,0,120)

Scroll.BackgroundTransparency = 1

Scroll.BorderSizePixel = 0

Scroll.CanvasSize =
UDim2.new(0,0,0,430)

Scroll.ScrollBarThickness = 6

Scroll.ScrollBarImageColor3 =
Color3.fromRGB(100,100,100)

Scroll.ScrollingDirection =
Enum.ScrollingDirection.Y

Scroll.Parent = Panel

--==================================================
-- BUTTON CREATOR
--==================================================

local function CreateButton(Text,Y)

local Button = Instance.new("TextButton")

Button.Size =
UDim2.new(1,-10,0,55)

Button.Position =
UDim2.new(0,5,0,Y)

Button.BackgroundColor3 =
Color3.fromRGB(150,50,50)

Button.TextColor3 =
Color3.new(1,1,1)

Button.Text =
Text

Button.TextSize = 17
Button.Font = Enum.Font.GothamBlack

Button.BorderSizePixel = 0
Button.Parent = Scroll

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,8)
Corner.Parent = Button

return Button

end

--==================================================
-- BUTTONS
--==================================================

local TrainButton =
CreateButton(
"💪 Прокачка: ВЫКЛ",
5
)

local RebirthButton =
CreateButton(
"🔄 Авто-Ребитх: ВЫКЛ",
70
)

local KingButton =
CreateButton(
"👑 Авто-Тп-Кинг: ВЫКЛ",
135
)

local AFKButton =
CreateButton(
"🛡️ Анти-Афк: ВЫКЛ",
200
)

local EggButton =
CreateButton(
"🥚 Авто-Яйцо: ВЫКЛ",
265
)

local DurabilityButton =
CreateButton(
"🥊 Авто-Дурабилити: ВЫКЛ",
330
)

--==================================================
-- UPDATE BUTTON
--==================================================

local function SetButton(Button,Text,Enabled)

if Enabled then

Button.Text =    
	Text .. ": ВКЛ"    

Button.BackgroundColor3 =    
	Color3.fromRGB(    
		50,160,70    
	)

else

Button.Text =    
	Text .. ": ВЫКЛ"    

Button.BackgroundColor3 =    
	Color3.fromRGB(    
		150,50,50    
	)

end

end

--==================================================
-- UPDATE STATS
--==================================================

task.spawn(function()

while Gui.Parent do

local Stats =    
	Player:FindFirstChild(    
		"leaderstats"    
	)    

local Strength =    
	Stats and    
	Stats:FindFirstChild(    
		"Strength"    
	)    

local Rebirths =    
	Stats and    
	Stats:FindFirstChild(    
		"Rebirths"    
	)    

local Durability =    
	Player:FindFirstChild(    
		"Durability"    
	)    

local Agility =    
	Player:FindFirstChild(    
		"Agility"    
	)    

StrengthLabel.Text =    
	"Сила: " ..    
	(    
		Strength    
		and tostring(Strength.Value)    
		or "?"    
	)    

RebirthLabel.Text =    
	"Ребитхи: " ..    
	(    
		Rebirths    
		and tostring(Rebirths.Value)    
		or "?"    
	)    

DurabilityLabel.Text =    
	"Дурабилити: " ..    
	(    
		Durability    
		and tostring(Durability.Value)    
		or "?"    
	)    

AgilityLabel.Text =    
	"Ловкость: " ..    
	(    
		Agility    
		and tostring(Agility.Value)    
		or "?"    
	)    

task.wait(0.1)

end

end)

--==================================================
-- OPEN / CLOSE
--==================================================

OpenButton.Activated:Connect(function()

Panel.Visible = true
OpenButton.Visible = false

end)

Close.Activated:Connect(function()

Panel.Visible = false
OpenButton.Visible = true

end)

--==================================================
-- AUTO TRAIN
--==================================================

TrainButton.Activated:Connect(function()

AutoTrain = not AutoTrain

SetButton(
TrainButton,
"💪 Прокачка",
AutoTrain
)

end)

task.spawn(function()

while Gui.Parent do

if AutoTrain then    

	local MuscleEvent =    
		Player:FindFirstChild(    
			"muscleEvent"    
		)    

	if MuscleEvent then    

		pcall(function()    

			MuscleEvent:    
				FireServer(    
					"rep"    
				)    

		end)    

	end    

end    

task.wait(0.1)

end

end)

--==================================================
-- AUTO REBIRTH
--==================================================

RebirthButton.Activated:Connect(function()

AutoRebirth =
not AutoRebirth

SetButton(
RebirthButton,
"🔄 Авто-Ребитх",
AutoRebirth
)

end)

task.spawn(function()

while Gui.Parent do

if AutoRebirth then    

	local rEvents =    
		ReplicatedStorage:    
		FindFirstChild(    
			"rEvents"    
		)    

	local Remote =    
		rEvents and    
		rEvents:FindFirstChild(    
			"rebirthRemote"    
		)    

	if Remote then    

		pcall(function()    

			Remote:    
				InvokeServer(    
					"rebirthRequest"    
				)    

		end)    

	end    

end    

task.wait(0.1)

end

end)

--==================================================
-- PUNCH
--==================================================

local function GetPunch()

local Character =
Player.Character

if Character then

local Punch =    
	Character:FindFirstChild(    
		"Punch"    
	)    

if Punch then    
	return Punch    
end

end

local Backpack =
Player:FindFirstChild(
"Backpack"
)

if Backpack then

return Backpack:    
	FindFirstChild(    
		"Punch"    
	)

end

return nil

end

local function EquipPunch()

local Character =
Player.Character

local Humanoid =
Character and
Character:FindFirstChildOfClass(
"Humanoid"
)

local Punch =
GetPunch()

if not Punch
or not Humanoid then

return nil

end

if Punch.Parent ~= Character then

pcall(function()    

	Humanoid:    
		EquipTool(    
			Punch    
		)    

end)    

task.wait(0.1)

end

return Punch

end

--==================================================
-- DURABILITY REQUIREMENT
--==================================================

local function GetRequiredDurability(
Machine,
Rock
)

local Needed =
Machine:FindFirstChild(
"neededDurability"
)

if Needed then

local Value =    
	tonumber(    
		Needed.Value    
	)    

if Value then    
	return Value    
end

end

Needed =
Rock:FindFirstChild(
"neededDurability"
)

if Needed then

local Value =    
	tonumber(    
		Needed.Value    
	)    

if Value then    
	return Value    
end

end

local Attribute =
Machine:GetAttribute(
"neededDurability"
)

if typeof(Attribute) == "number" then
return Attribute
end

Attribute =
Rock:GetAttribute(
"neededDurability"
)

if typeof(Attribute) == "number" then
return Attribute
end

return nil

end

--==================================================
-- FIND BEST ROCK
--==================================================

local function FindBestRock()

local Durability =
Player:FindFirstChild(
"Durability"
)

if not Durability then
return nil
end

local MachinesFolder =
workspace:FindFirstChild(
"machinesFolder"
)

if not MachinesFolder then
return nil
end

local CurrentDurability =
tonumber(
Durability.Value
) or 0

local BestRock = nil
local BestRequired = -1

for _,Machine in ipairs(
MachinesFolder:GetChildren()
) do

local Rock =    
	Machine:FindFirstChild(    
		"Rock"    
	)    

if Rock    
	and Rock:IsA("BasePart") then    

	local Required =    
		GetRequiredDurability(    
			Machine,    
			Rock    
		)    

	if Required    
		and Required <= CurrentDurability    
		and Required > BestRequired then    

		BestRequired =    
			Required    

		BestRock =    
			Rock    

	end    
end

end

return BestRock

end

--==================================================
-- MOVE TO ROCK
--==================================================

local function MoveToRock(Rock)

local Character =
Player.Character

if not Character then
return false
end

local Root =
Character:FindFirstChild(
"HumanoidRootPart"
)

if not Root then
return false
end

if not Rock
or not Rock:IsA("BasePart") then

return false

end

local Distance =
math.max(
Rock.Size.Z / 2 + 2,
4
)

local Position =
Rock.Position -
Rock.CFrame.LookVector *
Distance

Root.CFrame =
CFrame.lookAt(
Position,
Rock.Position
)

return true

end

--==================================================
-- AUTO DURABILITY
--==================================================

DurabilityButton.Activated:Connect(function()

AutoDurability =
not AutoDurability

SetButton(
DurabilityButton,
"🥊 Авто-Дурабилити",
AutoDurability
)

end)

task.spawn(function()

while Gui.Parent do

if AutoDurability then    

	local Punch =    
		EquipPunch()    

	if Punch then    

		-- Ищем камень ЗАНОВО    
		-- после каждого цикла    

		local Rock =    
			FindBestRock()    

		if Rock then    

			MoveToRock(    
				Rock    
			)    

			local MuscleEvent =    
				Player:FindFirstChild(    
					"muscleEvent"    
				)    

			pcall(function()    
				Punch:Activate()    
			end)    

			if MuscleEvent then    

				pcall(function()    

					MuscleEvent:    
						FireServer(    
							"punch",    
							"leftHand"    
						)    

				end)    

				task.wait(0.06)    

				pcall(function()    

					MuscleEvent:    
						FireServer(    
							"punch",    
							"rightHand"    
						)    

				end)    

			end    
		end    
	end    

	task.wait(0.12)    

else    

	task.wait(0.2)    

end

end

end)

--==================================================
-- KING ROCK
--==================================================

local function GetKingRock()

local MachinesFolder =
workspace:FindFirstChild(
"machinesFolder"
)

if not MachinesFolder then
return nil
end

for _,Machine in ipairs(
MachinesFolder:GetChildren()
) do

local Rock =    
	Machine:FindFirstChild(    
		"Rock"    
	)    

if Rock    
	and Rock:IsA("BasePart") then    

	local MachineName =    
		string.lower(    
			Machine.Name    
		)    

	local RockName =    
		string.lower(    
			Rock.Name    
		)    

	if string.find(    
		MachineName,    
		"king"    
	)    
	or string.find(    
		RockName,    
		"king"    
	) then    

		return Rock    

	end    
end

end

return nil

end

--==================================================
-- TELEPORT KING
--==================================================

local function TeleportKing()

local Character =
Player.Character

if not Character then
return
end

local Root =
Character:FindFirstChild(
"HumanoidRootPart"
)

if not Root then
return
end

local Rock =
GetKingRock()

if not Rock then
return
end

local TopY =
Rock.Position.Y +
Rock.Size.Y / 2

local Position =
Vector3.new(
Rock.Position.X,
TopY + 4,
Rock.Position.Z
)

Root.CFrame =
CFrame.new(
Position
)

end

--==================================================
-- AUTO KING
--==================================================

KingButton.Activated:Connect(function()

AutoKing =
not AutoKing

SetButton(
KingButton,
"👑 Авто-Тп-Кинг",
AutoKing
)

end)

task.spawn(function()

while Gui.Parent do

if AutoKing then    

	TeleportKing()    

end    

task.wait(0.1)

end

end)

--==================================================
-- ANTI AFK
--==================================================

AFKButton.Activated:Connect(function()

AntiAFK =
not AntiAFK

SetButton(
AFKButton,
"🛡️ Анти-Афк",
AntiAFK
)

end)

task.spawn(function()

while Gui.Parent do

task.wait(900)    

if AntiAFK then    

	pcall(function()    

		VirtualUser:    
			CaptureController()    

		VirtualUser:    
			ClickButton2(    
				Vector2.new(0,0)    
			)    

	end)    

end

end

end)

--==================================================
-- AUTO EGG
--==================================================

EggButton.Activated:Connect(function()

AutoEgg =
not AutoEgg

SetButton(
EggButton,
"🥚 Авто-Яйцо",
AutoEgg
)

end)

task.spawn(function()

while Gui.Parent do

if AutoEgg then    

	local Egg =    
		Player.Backpack:    
		FindFirstChild(    
			"Protein Egg"    
		)    

	if not Egg    
		and Player.Character then    

		Egg =    
			Player.Character:    
			FindFirstChild(    
				"Protein Egg"    
			)    

	end    

	if Egg then    

		pcall(function()    

			if Egg.Parent    
				~= Player.Character then    

				Egg.Parent =    
					Player.Character    

			end    

			Egg:Activate()    

		end)    

		-- 29 минут 55 секунд    

		task.wait(1795)    

	else    

		task.wait(1)    

	end    

else    

	task.wait(1)    

end

end

end)

--==================================================
-- LOADED
--==================================================

print("==============================")
print("⚡ KIRILL_PANEL NO KEY V1.35 LOADED")
print("Player:",Player.Name)
print("==============================")
