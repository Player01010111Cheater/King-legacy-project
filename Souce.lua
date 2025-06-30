local loggedEvents = {}
local seen = {}

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
        end
    end

    return old(self, ...)
end)

print("🔍 Лёгкий Remote Spy запущен. Логи будут выводиться раз в 5 секунд.")

-- Таймер для вывода логов пачкой
spawn(function()
    while true do
        wait(5)
        if #loggedEvents > 0 then
            print("=== Новые RemoteEvent вызовы ===")
            for i, log in ipairs(loggedEvents) do
                print(log)
            end
            loggedEvents = {}
        end
    end
end)


