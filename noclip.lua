local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local uis = game:GetService("UserInputService")
local button = script.Parent 

local flying = false

local function toggleFlight()
	if flying then
		
		flying = false
		char.PrimaryPart:FindFirstChild("FlightForce"):Destroy()

		
		for _, part in ipairs(char:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end

		uis.MouseBehavior = Enum.MouseBehavior.Default
	else
		
		flying = true

		
		for _, part in ipairs(char:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end

		local bv = Instance.new("BodyVelocity", char.PrimaryPart)
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = Vector3.new(0, 0, 0)
		bv.Name = "FlightForce"

		while flying do
			wait(0.1)
			local cam = workspace.CurrentCamera
			bv.Velocity = Vector3.new(0, 0, 0)

			local wPressed = uis:IsKeyDown(Enum.KeyCode.W)
			local sPressed = uis:IsKeyDown(Enum.KeyCode.S)
			local aPressed = uis:IsKeyDown(Enum.KeyCode.A)
			local dPressed = uis:IsKeyDown(Enum.KeyCode.D)

			if wPressed then
				bv.Velocity = cam.CFrame.LookVector * 100
			elseif sPressed then
				bv.Velocity = cam.CFrame.LookVector * -100
			elseif aPressed then
				bv.Velocity = cam.CFrame.RightVector * -100
			elseif dPressed then
				bv.Velocity = cam.CFrame.RightVector * 100
			end
		end
	end
end

button.MouseButton1Click:Connect(toggleFlight)

uis.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.Six then                                         --<BIND
		toggleFlight()
	end
end)
