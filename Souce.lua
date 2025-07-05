local TweenService = game:GetService("TweenService")

local function showESPNotification(enabled, duration, customText, bgColor)
    duration = duration or 3

    local player = game.Players.LocalPlayer
    local screenGuiName = "CrystalNotification"

    -- Удаляем старое уведомление
    local existing = player:WaitForChild("PlayerGui"):FindFirstChild(screenGuiName)
    if existing then
        existing:Destroy()
    end

    -- Проверка: мобильное устройство или нет
    local screenSize = workspace.CurrentCamera.ViewportSize
    local isMobile = screenSize.X < 700

    local notifWidth = isMobile and 200 or 250
    local notifHeight = isMobile and 50 or 60
    local notifOffset = isMobile and -210 or -270

    -- Создание GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = screenGuiName
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Фрейм уведомления
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, notifWidth, 0, notifHeight)
    frame.Position = UDim2.new(1, notifOffset, 0.05, 0)
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0, 0)
    frame.Parent = screenGui

    -- Иконка
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 36, 0, 36)
    icon.Position = UDim2.new(0, 10, 0.5, -18)
    icon.BackgroundTransparency = 1
    icon.Image = enabled and "rbxassetid://6034818371" or "rbxassetid://6035047409"
    icon.Parent = frame

    -- Текст
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 54, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = customText or (enabled and "AutoESP Enabled" or "AutoESP Disabled")
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.Gotham
    label.Parent = frame

    -- Анимация удаления (в сторону)
    task.delay(duration, function()
        if frame and frame.Parent then
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
            local exitTween = TweenService:Create(
                frame,
                tweenInfo,
                { Position = UDim2.new(1, 10, frame.Position.Y.Scale, frame.Position.Y.Offset) }
            )
            exitTween:Play()
            exitTween.Completed:Wait()
            screenGui:Destroy()
        end
    end)
end


showESPNotification(true, 3, "Test", 0, 128, 128)
