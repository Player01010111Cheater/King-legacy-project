local Lighting = game:GetService("Lighting")

-- Удаляем стандартное небо, если оно есть
if Lighting:FindFirstChild("Sky") then
    Lighting.Sky:Destroy()
end

-- Создаем новое небо
local newSky = Instance.new("Sky")
newSky.Parent = Lighting

-- Настраиваем розовые тона
newSky.SkyboxBk = "rbxassetid://2710425166" -- Задний фон (можно заменить на свой)
newSky.SkyboxDn = "rbxassetid://2710425321" -- Низ
newSky.SkyboxFt = "rbxassetid://2710425503" -- Перед
newSky.SkyboxLf = "rbxassetid://2710425682" -- Лево
newSky.SkyboxRt = "rbxassetid://2710425845" -- Право
newSky.SkyboxUp = "rbxassetid://2710426017" -- Верх

-- Дополнительные настройки для красивого розового неба
newSky.CelestialBodiesShown = false -- Убираем звёзды/планеты
newSky.StarCount = 0 -- Отключаем звёзды

-- Меняем атмосферные эффекты (опционально)
newSky.Atmosphere.Color = Color3.fromRGB(255, 200, 200) -- Розоватый оттенок атмосферы
newSky.Atmosphere.Decay = Color3.fromRGB(255, 150, 150) -- Эффект заката
newSky.Atmosphere.Glare = 0.2 -- Лёгкое свечение
newSky.Atmosphere.Haze = 5 -- Лёгкая дымка

-- Сохраняем изменения
Lighting:SetSky(newSky)
