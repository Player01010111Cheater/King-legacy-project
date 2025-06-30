-- 🔧 Минимальный логгер FireServer, оптимизированный под мобильные устройства

local logged = {} -- чтобы не логировать один и тот же Remote 100 раз

local mt = getrawmetatable(game)
setreadonly(mt, false)

local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if method == "FireServer" and typeof(self) == "Instance" and self:IsA("RemoteEvent") then
        local name = self:GetFullName()
        if not logged[name] then
            logged[name] = true
            print("📦 FireServer →", name)
            wait(10)
            -- Если хочешь видеть аргументы (но осторожно с лагами):
            -- for i, v in ipairs({...}) do print("   ➜ Arg", i, v) end
        end
    end

    return old(self, ...)
end)

print("✅ Оптимизированный FireServer-логгер активен.")

