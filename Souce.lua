-- NIGHT MODE + SNOW EFFECT

local Lighting = game:GetService("Lighting")

-- ТЁМНОЕ ОСВЕЩЕНИЕ
Lighting.Brightness = 1
Lighting.ClockTime = 0 -- Полночь
Lighting.FogEnd = 500
Lighting.FogColor = Color3.fromRGB(20, 20, 35)
Lighting.Ambient = Color3.fromRGB(30, 30, 60)
Lighting.OutdoorAmbient = Color3.fromRGB(25, 25, 40)
Lighting.EnvironmentDiffuseScale = 0.5
Lighting.EnvironmentSpecularScale = 0.5

-- КАСТОМНОЕ НЕБО
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299" -- Можно заменить на кастом
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454288"
sky.MoonAngularSize = 11
sky.StarCount = 3000
sky.SunAngularSize = 0
sky.Parent = Lighting

-- СНЕГ (создаёт падающие снежинки)
local snowPart = Instance.new("Part")
snowPart.Size = Vector3.new(1000, 1, 1000)
snowPart.Anchored = true
snowPart.Position = Vector3.new(0, 100, 0)
snowPart.Transparency = 1
snowPart.CanCollide = false
snowPart.Name = "SnowEmitter"
snowPart.Parent = workspace

local emitter = Instance.new("ParticleEmitter", snowPart)
emitter.Texture = "rbxassetid://6012524446" -- Текстура снежинки
emitter.Rate = 300
emitter.Lifetime = NumberRange.new(3, 5)
emitter.Speed = NumberRange.new(1, 3)
emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.5)})
emitter.Transparency = NumberSequence.new(0.3)
emitter.VelocitySpread = 180
emitter.Rotation = NumberRange.new(0, 360)
emitter.RotSpeed = NumberRange.new(-90, 90)
emitter.LightInfluence = 0
