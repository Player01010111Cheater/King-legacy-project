local WindUI = require(game:GetService("ReplicatedStorage"):WaitForChild("WindUI"))
task.wait(1)

local themes = WindUI:GetThemes()

print("Тип:", typeof(themes))
print("Всего тем:", #themes)

for _, theme in ipairs(themes) do
    print("Тема:", theme)
end
