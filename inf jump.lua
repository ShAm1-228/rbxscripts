local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Устанавливаем базовую скорость
local speedBoost = 100
local normalWalkSpeed = character.Humanoid.WalkSpeed

-- Функция для включения спидхаука
local function enableSpeedHack()
	character.Humanoid.WalkSpeed = normalWalkSpeed + speedBoost
end

-- Функция для отключения спидхаука
local function disableSpeedHack()
	character.Humanoid.WalkSpeed = normalWalkSpeed
end

-- Привязываем функции к событиям, например, к клавише
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.6 and not gameProcessedEvent then -- при нажатии E
		enableSpeedHack()
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.6 and not gameProcessedEvent then
		disableSpeedHack()
	end
end)
