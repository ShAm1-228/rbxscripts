local Players = game:GetService("Players")
local Camera = game.Workspace.CurrentCamera
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local button = script.Parent

local aiming = false

function aimAtNearestPlayer()
	local nearestPlayer = nil
	local shortestDistance = math.huge

	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= Player then
			local character = otherPlayer.Character
			if character and character:FindFirstChild("Head") then
				local distance = (Player.Character.Head.Position - character.Head.Position).magnitude

				if distance < shortestDistance then
					shortestDistance = distance
					nearestPlayer = character
				end
			end
		end
	end

	if nearestPlayer then
		local targetPosition = nearestPlayer.Head.Position
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
	else
		print("Нет ближайшего игрока для наведения.")
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.Five then                                  --<BIND
		aiming = not aiming
		print("Наведение: " .. tostring(aiming))
		while aiming do
			aimAtNearestPlayer()
			wait(0.0000000000001)
		end
	end
end)

button.MouseButton1Click:Connect(function()
	aiming = not aiming
	print("Наведение: " .. tostring(aiming))

	if aiming then
		while aiming do
			aimAtNearestPlayer()
			wait(0.0000000000001)
		end
	elseif not aiming then
		print("Наведение остановлено.")
	end
end)
