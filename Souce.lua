-- Надёжный Remote Spy (альтернатива Turtle Spy)
-- Ловит FireServer, InvokeServer, Fire, Invoke

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

-- Хук __namecall (ловит :FireServer(), :InvokeServer(), и т.п.)
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if typeof(self) == "Instance" and self:IsA("RemoteEvent") or self:IsA("RemoteFunction") then
        if method == "FireServer" or method == "InvokeServer" then
            warn("[Remote Call] " .. self:GetFullName() .. ":" .. method .. "(" .. formatArgs(args) .. ")")
        end
    end

    return old(self, ...)
end)

-- Также перехват прямых вызовов (например, Remote:Fire() или Remote:Invoke())
for _, methodName in ipairs({"Fire", "Invoke"}) do
    local original = Instance.new("BindableEvent")[methodName]
    hookfunction(original, newcclosure(function(self, ...)
        local args = {...}
        if typeof(self) == "Instance" and (self:IsA("BindableEvent") or self:IsA("BindableFunction")) then
            warn("[Bindable Call] " .. self:GetFullName() .. ":" .. methodName .. "(" .. formatArgs(args) .. ")")
        end
        return original(self, ...)
    end))
end

warn("✅ Remote Spy запущен!")

