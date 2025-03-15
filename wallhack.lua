local player = game.Players.LocalPlayer
local espEnabled = false
local UserInputService = game:GetService("UserInputService")
local button = script.Parent

local function createESP(target)
	local highlight = Instance.new("Highlight")
	highlight.Parent = target
	highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	highlight.OutlineColor = Color3.fromRGB(0, 0, 0) 
end

local function removeESP(target)
	for _, child in ipairs(target:GetChildren()) do
		if child:IsA("Highlight") then
			child:Destroy()
		end
	end
end

local function toggleESP()
	espEnabled = not espEnabled

	for _, obj in pairs(workspace:GetChildren()) do
		if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj.Name ~= player.Name then
			if espEnabled then
				createESP(obj)
			else
				removeESP(obj)
			end
		end
	end
end


UserInputService.InputBegan:Connect(function(input, processed)
	if not processed then
		if input.KeyCode == Enum.KeyCode.Seven then                                  --<BIND
			toggleESP()
		end
	end
end)

button.MouseButton1Click:Connect(function()
	if not processed then
			toggleESP()
	end
end)
