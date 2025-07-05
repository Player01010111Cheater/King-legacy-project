local TweenService = game:GetService("TweenService")

local function showESPNotification(enabled, duration, customText, bgColor)
    duration = duration or 3

    local player = game.Players.LocalPlayer
    local screenGuiName = "ESPNotification"

    -- Удалить старое
    local existing = player:WaitForChild("PlayerGui"):FindFirstChild(screenGuiName)
    if existing then
        existing:Destroy()
    end

    -- Размеры экрана
    local screenSize = workspace.CurrentCamera.ViewportSize
    local isMobile = screenSize.X < 700

    local notifWidth = isMobile and 180 or 220
    local notifHeight = isMobile and 40 or 50
    local notifOffset = isMobile and -190 or -240

    -- GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = screenGuiName
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Фрейм уведомления
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, notifWidth, 0, notifHeight)
    frame.Position = UDim2.new(1, notifOffset, 0.05, 0)
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0, 0)
    frame.Parent = screenGui

    -- Скругление
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    -- Прогресс-бар сверху
    local progressBarBG = Instance.new("Frame")
    progressBarBG.Size = UDim2.new(1, 0, 0, 4)
    progressBarBG.Position = UDim2.new(0, 0, 0, 0)
    progressBarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    progressBarBG.BorderSizePixel = 0
    progressBarBG.Parent = frame

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.Position = UDim2.new(0, 0, 0, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 127) -- ярко-зелёный
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBarBG

    -- Скругление прогресс-бара
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 2)
    progressCorner.Parent = progressBar

    -- Иконка
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 24, 0, 24)
    icon.Position = UDim2.new(0, 10, 0.5, -12)
    icon.BackgroundTransparency = 1
    icon.Image = enabled and "rbxassetid://6031094678" or "rbxassetid://6031097225"
    icon.Parent = frame

    -- Текст
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -44, 1, 0)
    label.Position = UDim2.new(0, 40, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = customText or (enabled and "AutoESP Enabled" or "AutoESP Disabled")
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.GothamSemibold
    label.ClipsDescendants = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    -- Анимация полоски
    local progressTween = TweenService:Create(
        progressBar,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        { Size = UDim2.new(0, 0, 1, 0) }
    )
    progressTween:Play()

    -- Анимация удаления в бок
    task.delay(duration, function()
        if frame and frame.Parent then
            local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
            local tween = TweenService:Create(
                frame,
                tweenInfo,
                { Position = UDim2.new(1, 20, frame.Position.Y.Scale, frame.Position.Y.Offset) }
            )
            tween:Play()
            tween.Completed:Wait()
            screenGui:Destroy()
        end
    end)
end




showESPNotification(true, 3, "Test", Color3.fromRGB(0, 128, 128))
