local function scanRemotes(parent)
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("RemoteEvent") then
            print("[RemoteEvent] " .. child:GetFullName())
        elseif child:IsA("RemoteFunction") then
            print("[RemoteFunction] " .. child:GetFullName())
        end
        scanRemotes(child)
    end
end

print("Начинаю сканирование RemoteEvent и RemoteFunction в игре...")
scanRemotes(game)
print("Сканирование завершено.")
