local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")

local jumpKeyHeld = false
local jumpCooldown = 0.0000001  -- Задержка между прыжками (в секундах)

-- Функция для выполнения прыжка
local function jump()
    if not jumpKeyHeld then
        jumpKeyHeld = true
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(jumpCooldown)
        jumpKeyHeld = false
    end
end

-- Обработчик ввода клавиатуры
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Space and not gameProcessed then
        while input.UserInputState == Enum.UserInputState.Begin do
            jump()
            wait(jumpCooldown)  -- Задержка, чтобы избежать слишком частых прыжков
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        jumpKeyHeld = false -- Сброс флага при отпускании клавиши
    end
end)
