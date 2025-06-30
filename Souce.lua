-- Лёгкий Remote Spy с GUI

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LightRemoteSpyGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.BorderSizePixel = 0
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Text = "Remote Spy Logs"
title.Parent = frame

local logBox = Instance.new("ScrollingFrame")
logBox.Size = UDim2.new(1, -20, 1, -60)
logBox.Position = UDim2.new(0, 10, 0, 40)
logBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logBox.BorderSizePixel = 0
logBox.CanvasSize = UDim2.new(0, 0, 1, 0)
logBox.ScrollBarThickness = 6
logBox.Parent = frame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.Parent = logBox

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(0.5, -75, 1, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
toggleButton.BorderSizePixel = 0
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 18
toggleButton.Text = "Показать логи"
toggleButton.Parent = gui

local loggedEvents = {}
local seen = {}

local function addLog(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = text
    label.Parent = logBox

    -- Обновляем размер канвы для скролла
    local totalSize = uiListLayout.AbsoluteContentSize
    logBox.CanvasSize = UDim2.new(0, 0, 0, totalSize.Y)
end

-- Переключение видимости логов
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    if frame.Visible then
        toggleButton.Text = "Скрыть логи"
    else
        toggleButton.Text = "Показать логи"
    end
end)

-- Хук __namecall
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if typeof(self) == "Instance" and self:IsA("RemoteEvent") and method == "FireServer" then
        local name = self:GetFullName()
        if not seen[name] then
            seen[name] = true
            table.insert(loggedEvents, "[RemoteEvent FireServer] " .. name)

            -- Если окно открыто — сразу показываем лог
            if frame.Visible then
                addLog(loggedEvents[#loggedEvents])
            end
        end
    end

    return old(self, ...)
end)

print("✅ Лёгкий Remote Spy с GUI запущен!")


