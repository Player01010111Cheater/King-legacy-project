-- ✅ Проверка безопасности
if not getrawmetatable or not setreadonly or not newcclosure or not getnamecallmethod then
    warn("❌ Твой executor не поддерживает нужные функции.")
    return
end

-- 🔓 Получаем доступ к метатаблице
local mt = getrawmetatable(game)
setreadonly(mt, false)

-- 💾 Сохраняем оригинальный метод
local oldNamecall = mt.__namecall

-- 🔁 Подмена __namecall для логов
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if method == "FireServer" and typeof(self) == "Instance" and self:IsA("RemoteEvent") then
        warn("📦 FireServer на:", self:GetFullName())
        
        -- Аргументы
        local args = {...}
        for i, v in ipairs(args) do
            warn("   ➜ Аргумент ["..i.."]: ", v)
        end
    end

    return oldNamecall(self, ...)
end)

warn("✅ Скрипт ловли FireServer успешно загружен!")
