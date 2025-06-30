local loggedEvents = {}

local function formatArgs(args)
    local output = {}
    for i, v in ipairs(args) do
        local valueType = typeof(v)
        local str = ""
        if valueType == "string" then
            str = '"' .. v .. '"'
        elseif valueType == "Instance" then
            str = v:GetFullName()
        else
            pcall(function() str = tostring(v) end)
        end
        table.insert(output, str)
    end
    return table.concat(output, ", ")
end

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

local debounce = {}
local DEBOUNCE_TIME = 1 -- секунда между выводом одинаковых вызовов

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if typeof(self) == "Instance" and self:IsA("RemoteEvent") and method == "FireServer" then
        local key = self:GetFullName() .. method .. formatArgs(args)
        local now = tick()
        if not debounce[key] or now - debounce[key] > DEBOUNCE_TIME then
            debounce[key] = now
            local log = "[Remote Call] " .. self:GetFullName() .. ":" .. method .. "(" .. formatArgs(args) .. ")"
            table.insert(loggedEvents, log)
            print(log)
        end
    end

    return old(self, ...)
end)

print("✅ Облегчённый Remote Spy запущен! Логи будут выводиться и сохраняться.")


