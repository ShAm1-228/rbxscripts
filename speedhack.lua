local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local speedBoost = 100
local normalWalkSpeed = character.Humanoid.WalkSpeed

local function enableSpeedHack()
	character.Humanoid.WalkSpeed = normalWalkSpeed + speedBoost
end

local function disableSpeedHack()
	character.Humanoid.WalkSpeed = normalWalkSpeed
end

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.Six and not gameProcessedEvent then
		enableSpeedHack()
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.Six and not gameProcessedEvent then
		disableSpeedHack()
	end
end)
