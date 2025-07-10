local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local petslist = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/CrystHub/refs/heads/main/CrystalHub_GaG-petlist.lua"))()
local players = game:GetService("Players")
local replicated_st = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local player_gui = player:WaitForChild("PlayerGui")
local StarterGui = game:GetService("StarterGui")
local player_character = player.Character
local player_backpack = player.Backpack
local gamevent_global = replicated_st.GameEvents

-- theme
WindUI:AddTheme({
  Name = "Ocean",
  Accent = "#154359",
  Outline = "#FFFFFF",
  Text = "#EFEFEF",
  Placeholder = "#A0B0C0",
  Background = "#0A1F29",
  Button = "#23617E", -- old #23617E
  Icon = "#A5D8FF",
})
WindUI:AddTheme({
    Name = "DarkPremium",
    Accent = "#8b5cf6",        -- Фиолетовый премиум-оттенок (фиолетовый – цвет роскоши)
    Dialog = "#18181b",
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#999999",
    Background = "#0e0e10",
    Button = "#8b5cf6",
    Icon = "#d4d4d8",          -- Светло-серый для иконок
})
WindUI:AddTheme({
    Name = "DarkIce",
    Accent = "#60a5fa",        -- Холодный светло-синий (ледяной акцент)
    Dialog = "#1e293b",        -- Тёмно-сине-серый фон диалогов
    Outline = "#60a5fa",       -- Светло-голубая рамка (ледяная)
    Text = "#f1f5f9",          -- Почти белый текст (для контраста)
    Placeholder = "#64748b",   -- Холодный серо-голубой (нейтральный)
    Background = "#0f172a",    -- Очень тёмный сине-серый фон
    Button = "#3b82f6",        -- Синий с яркостью (кнопки)
    Icon = "#60a5fa",          -- Иконки цвета акцента
})
WindUI:AddTheme({
    Name = "MidnightSunset",
    Accent = "#FF6B6B",        -- Тёплый розово-красный закат
    Dialog = "#1A1A2E",        -- Очень тёмный синий
    Outline = "#FF6B6B",
    Text = "#F5F5F5",          -- Мягкий белый
    Placeholder = "#AAAAAA",
    Background = "#0F0F1C",    -- Почти чёрный с синим отливом
    Button = "#D64550",        -- Глубокий тёплый акцент
    Icon = "#FFB6B6",          -- Светлый вариант акцента
})
WindUI:AddTheme({
    Name = "DesertStorm",
    Accent = "#D4A373",        -- Песочно-оранжевый
    Dialog = "#2E2A26",        -- Коричнево-серый
    Outline = "#D4A373",
    Text = "#F5F5DC",          -- Кремово-белый
    Placeholder = "#B3A89F",   -- Тёплый серый
    Background = "#1F1B16",    -- Очень тёмный песчаный
    Button = "#C68642",        -- Оранжево-коричневый
    Icon = "#EAD8C0",          -- Светло-бежевый
})
WindUI:AddTheme({
    Name = "MonoVoid",
    Accent = "#AAAAAA",
    Dialog = "#1C1C1C",
    Outline = "#AAAAAA",
    Text = "#EAEAEA",
    Placeholder = "#777777",
    Background = "#121212",
    Button = "#333333",
    Icon = "#CCCCCC"
})
WindUI:AddTheme({
    Name = "SakuraBloom",
    Accent = "#FFB7C5",        -- Нежно-розовый (вишневый цвет)
    Dialog = "#2B1B1B",        -- Тёмно-красновато-коричневый
    Outline = "#FFB7C5",
    Text = "#FFF0F5",          -- Светлый розоватый текст
    Placeholder = "#D8A7B1",   -- Теплый пастельный
    Background = "#1A0A0A",    -- Очень тёмный бордо
    Button = "#E295B5",        -- Ярко-розовая кнопка
    Icon = "#FFD3DC"           -- Светло-розовые иконки
})
WindUI:AddTheme({
    Name = "ArcticMist",
    Accent = "#7FDBFF",        -- Мягкий голубой акцент
    Dialog = "#1B262C",        -- Холодный тёмный сине-серый
    Outline = "#7FDBFF",
    Text = "#E0F7FA",          -- Очень светлый голубовато-белый
    Placeholder = "#88A2B9",   -- Серо-голубой нейтрал
    Background = "#0F141A",    -- Почти чёрный с холодным оттенком
    Button = "#3CAEA3",        -- Бирюзовый сдержанный
    Icon = "#A0E9F5"           -- Светло-голубые иконки
})
WindUI:AddTheme({
    Name = "EmberFade",
    Accent = "#FF8A65",        -- Тёплый персиковый/угольный
    Dialog = "#2B1D1B",        -- Глубокий коричнево-красный
    Outline = "#FF8A65",
    Text = "#FFF3E0",          -- Светло-оранжевый белый
    Placeholder = "#C79277",   -- Пыльный теплый серо-оранжевый
    Background = "#1A0E0B",    -- Тёмный с тёплым отливом
    Button = "#F4511E",        -- Огненно-оранжевый
    Icon = "#FFDAB9"           -- Персиково-светлый
})
WindUI:AddTheme({
    Name = "MossGlow",
    Accent = "#81C784",        -- Светлый травяной акцент
    Dialog = "#1E2A1F",        -- Глубокий зелёный
    Outline = "#AED581",       
    Text = "#E8F5E9",          -- Светлый зелёно-белый
    Placeholder = "#A0BFA3",   -- Приглушённый серо-зелёный
    Background = "#0D1B12",    -- Очень тёмный зелёный фон
    Button = "#66BB6A",        -- Сочный зелёный
    Icon = "#C5E1A5"           -- Светлый зелёный для иконок
})

local function get_theme()
    local themes = {}
    for name, _ in pairs(WindUI:GetThemes()) do
        table.insert(themes, name)
    end
    return themes
end
local themes = get_theme()
local random_theme = themes[math.random(1, #themes)]
-- window
local Window = WindUI:CreateWindow({
    Title = "Crystal Client",
    Icon = "gem",
    Author = "v1.7",
    Folder = "CrystalClient",
    Size = UDim2.fromOffset(580, 350),
    Transparent = true,
    Theme = random_theme,
    SideBarWidth = 200,
    -- Background = "", -- rbxassetid only
    -- BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            -- Тут логика
        end,
    },

})
local tab = Window:Tab({Title = "test", Icon = "gem"})

local autosellpets_rarity = {}
local autosellpets_interval = 60
local petsell_event = gamevent_global.SellPet_RE -- :FireServer(workspace.LocalPlayer.Ostrich)
local pet_filter = {}
local autosellpets_persale = 2  -- Кол-во продажи за раз (по умолчанию 2)

local dropdown_rarity = nil
local slider_interval = nil
local dropdown_petfilter = nil
local slider_persale = nil

local function get_pets(pet_lst)
    local result = {}
    for _, category in ipairs(pet_lst) do
        local pets_in_category = petslist[category]
        if pets_in_category then
            for _, pet_name in ipairs(pets_in_category) do
                table.insert(result, pet_name)
            end
        end
    end
    return result
end

local d = tab:Dropdown({
    Title = "Filter",
    Values = {"Auto", "Custom"},
    Value = "Auto",
    Callback = function (option)
            if dropdown_rarity then
                dropdown_rarity:Destroy()
            dropdown_rarity = nil
        end
        if slider_interval then
                slider_interval:Destroy()
                slider_interval = nil
        end
        if dropdown_petfilter then
                dropdown_petfilter:Destroy()
                dropdown_petfilter = nil
        end
        if slider_persale then
            slider_persale:Destroy()
            slider_persale = nil
        end
        if option == "Auto" then
            autosellpets_rarity = {"Common", "Uncommon"}
            autosellpets_interval = 60
            pet_filter = {}  -- очищаем фильтр по питомцам
            autosellpets_persale = 2  -- сброс количества продажи

        elseif option == "Custom" then
            dropdown_rarity = tab:Dropdown({
                Title = "Rarity Filter",
                Values = {"Common", "Uncommon", "Rare", "Legendary", "Mythical", "Divine"},
                Value = {},
                Multi = true,
                AllowNone = true,
                Callback = function (options)
                    autosellpets_rarity = options
                end
            })

            slider_interval = tab:Slider({
                Title = "Sell Interval",
                Desc = "The recommended interval is 60s",
                Step = 1,
                Value = {
                    Min = 1,
                    Max = 120,
                    Default = 60,
                },
                Callback = function (value)
                    autosellpets_interval = value
                end
            })

            dropdown_petfilter = tab:Dropdown({
                Title = "Pet Filter",
                Values = get_pets(autosellpets_rarity),  -- список питомцев по редкости
                Value = {},
                Multi = true,
                AllowNone = true,
                Callback = function (pets)
                    pet_filter = pets
                end
            })

            slider_persale = tab:Slider({
                Title = "Amount per sale",
                Desc = "Choose how many pets to sell at once (1-6)",
                Step = 1,
                Value = {
                    Min = 1,
                    Max = 6,
                    Default = autosellpets_persale,
                },
                Callback = function (value)
                    autosellpets_persale = value
                end
            })
        end
    end
})

