local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldNamecall = mt.__namecall

local seen = {}

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if typeof(self) == "Instance" and self:IsA("RemoteEvent") and method == "FireServer" then
        local name = self:GetFullName()
        if not seen[name] then
            seen[name] = true
            print("[RemoteEvent FireServer] "..name)
        end
    end

    return oldNamecall(self, ...)
end)

print("✅ Минимальный Remote Spy запущен")

