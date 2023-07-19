
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local speed = 0
   if isfile("boliga.mp3") then
  if readfile("boliga.mp3") ~= game:HttpGet("https://drive.google.com/uc?export=download&id=1rAJtRsGtzRHsxexeX6xyXHBgbMcgfZuC") then
     writefile("boliga.mp3", game:HttpGet("https://drive.google.com/uc?export=download&id=1rAJtRsGtzRHsxexeX6xyXHBgbMcgfZuC"))
  end
else
  writefile("boliga.mp3", game:HttpGet("https://drive.google.com/uc?export=download&id=1PQpneYZIx76_VPRddLiqCMSQYBXKigf1"))
end
local boliga = getsynasset("boliga.mp3")

local function handleCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	while humanoid and humanoid.Parent do

local kabloom = wait()
	player.Character.HumanoidRootPart.Running.SoundId = boliga
player.Character.HumanoidRootPart.Running.PlaybackSpeed = 1
player.Character.HumanoidRootPart.Running.Volume = 10

if humanoid.MoveDirection.Magnitude > 0 then
			character:TranslateBy(humanoid.MoveDirection * speed * kabloom * 10)
		end
	end

end

local function handleChildAdded(child)
	if child.Name == "Humanoid" then
		handleCharacterAdded(child.Parent)
	end
end

spawn(function()
	local guiLibrary = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
	local window = guiLibrary:CreateWindow("Teleport Walk")
	local folder = window:CreateFolder("Speed")
	local speedLabel = folder:Label("Speed: "..speed, {
		TextSize = 25,
		TextColor = Color3.fromRGB(255, 255, 255),
		BgColor = Color3.fromRGB(69, 69, 69)
	})

	mouse.KeyDown:Connect(function(key)
		if key == "=" then
			speed = speed + 0.1
			speedLabel:Refresh("Speed: "..math.floor(speed * 10 + 0.5) / 10)
		elseif key == "-" then
			speed = speed - 0.1
			speedLabel:Refresh("Speed: "..math.floor(speed * 10 + 0.5) / 10)
		end
	end)
end)

player.CharacterAdded:Connect(handleCharacterAdded)
handleCharacterAdded(player.Character)
