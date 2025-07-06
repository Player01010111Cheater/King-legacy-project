-- Создаём невидимую платформу в небе
local snowPart = Instance.new("Part")
snowPart.Size = Vector3.new(500, 3, 500)
snowPart.Position = Vector3.new(0, 200, 0)
snowPart.Anchored = true
snowPart.Transparency = 1
snowPart.CanCollide = false
snowPart.Name = "SnowEmitter"
snowPart.Parent = workspace

-- Создаём эмиттер снега
local emitter = Instance.new("ParticleEmitter")
emitter.Texture = "rbxassetid://6012524446" -- снежинка
emitter.Rate = 200 -- плотность
emitter.Lifetime = NumberRange.new(5, 7) -- сколько живёт частица
emitter.Speed = NumberRange.new(3, 6) -- скорость падения
emitter.Acceleration = Vector3.new(0, -10, 0) -- помогает тянуть вниз
emitter.EmissionDirection = Enum.NormalId.Top -- важно: частицы вниз
emitter.Size = NumberSequence.new(0.5)
emitter.Transparency = NumberSequence.new(0.3)
emitter.VelocitySpread = 10
emitter.Rotation = NumberRange.new(0, 360)
emitter.RotSpeed = NumberRange.new(-30, 30)
emitter.LightInfluence = 0
emitter.Parent = snowPart
