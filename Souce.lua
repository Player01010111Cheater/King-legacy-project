-- NIGHT MODE + SNOW EFFECT

local Lighting = game:GetService("Lighting")

-- ТЁМНОЕ ОСВЕЩЕНИЕ

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
emitter.Texture = "rbxassetid://6012524446" -- Снежинка
emitter.Rate = 300
emitter.Lifetime = NumberRange.new(3, 5)
emitter.Speed = NumberRange.new(1, 3)
emitter.Acceleration = Vector3.new(0, -10, 0) -- ← это тянет частицы вниз
emitter.Size = NumberSequence.new(0.5)
emitter.Transparency = NumberSequence.new(0.3)
emitter.VelocitySpread = 0
emitter.Rotation = NumberRange.new(0, 360)
emitter.RotSpeed = NumberRange.new(-90, 90)
emitter.LightInfluence = 0

