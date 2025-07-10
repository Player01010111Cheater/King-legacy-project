local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local petslist = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/CrystHub/main/CrystalHub_GaG-petlist.lua"))()
local players = game:GetService("Players")
local replicated_st = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local player_gui = player:WaitForChild("PlayerGui")
local StarterGui = game:GetService("StarterGui")
local player_character = player.Character
local player_backpack = player.Backpack
local gamevent_global = replicated_st.GameEvents

-- Темы UI
WindUI:AddTheme({
  Name = "Ocean",
  Accent = "#154359",
  Outline = "#FFFFFF",
  Text = "#EFEFEF",
  Placeholder = "#A0B0C0",
  Background = "#0A1F29",
  Button = "#23617E",
  Icon = "#A5D8FF",
})
-- (Добавь остальные темы по необходимости...)

local function get_theme()
    local themes = {}
    for name, _ in pairs(WindUI:GetThemes()) do
        table.insert(themes, name)
    end
    return themes
end

local themes = get_theme()
local random_theme = themes[math.random(1, #themes)]

local Window = WindUI:CreateWindow({
    Title = "Crystal Client",
    Icon = "gem",
    Author = "v1.7",
    Folder = "CrystalClient",
    Size = UDim2.fromOffset(580, 350),
    Transparent = true,
    Theme = random_theme,
    SideBarWidth = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            -- Тут логика для пользователя
        end,
    },
})

local tab = Window:Tab({Title = "test", Icon = "gem"})

local autosellpets_rarity = {}
local autosellpets_interval = 60
local petsell_event = gamevent_global.SellPet_RE
local pet_filter = {}
local autosellpets_persale = 2 -- Кол-во продажи за раз (по умолчанию 2)

local dropdown_rarity = nil
local slider_interval = nil
local dropdown_petfilter = nil
local slider_persale = nil

-- Функция получения списка питомцев по выбранным редкостям
local function get_pets(rarity_list)
    local result = {}
    for _, rarity in ipairs(rarity_list) do
        local pets_in_rarity = petslist[rarity]
        if pets_in_rarity then
            for pet_name, _ in pairs(pets_in_rarity) do
                table.insert(result, pet_name)
            end
        else
            warn("Category not found:", rarity)
        end
    end
    return result
end

local function clear_custom_ui()
    if dropdown_rarity then dropdown_rarity:Destroy() dropdown_rarity = nil end
    if dropdown_petfilter then dropdown_petfilter:Destroy() dropdown_petfilter = nil end
    if slider_interval then slider_interval:Destroy() slider_interval = nil end
    if slider_persale then slider_persale:Destroy() slider_persale = nil end
    pet_filter = {}
end

local filter_dropdown = tab:Dropdown({
    Title = "Filter",
    Values = {"Auto", "Custom"},
    Value = "Auto",
    Callback = function(option)
        clear_custom_ui()

        if option == "Auto" then
            -- Автоматические настройки
            autosellpets_rarity = {"Common", "Uncommon"}
            autosellpets_interval = 60
            pet_filter = {}
            autosellpets_persale = 2

        elseif option == "Custom" then
            -- Инициализация редкостей
            autosellpets_rarity = {"Common", "Uncommon"}

            dropdown_rarity = tab:Dropdown({
                Title = "Rarity Filter",
                Values = {"Common", "Uncommon", "Rare", "Legendary", "Mythical", "Divine"},
                Value = autosellpets_rarity,
                Multi = true,
                AllowNone = true,
                Callback = function(selected_rarities)
                    autosellpets_rarity = selected_rarities

                    -- Удаляем старый dropdown питомцев если есть
                    if dropdown_petfilter then
                        dropdown_petfilter:Destroy()
                        dropdown_petfilter = nil
                        pet_filter = {}
                    end

                    local pets_for_filter = get_pets(autosellpets_rarity)
                    if #pets_for_filter > 0 then
                        dropdown_petfilter = tab:Dropdown({
                            Title = "Pet Filter",
                            Values = pets_for_filter,
                            Value = pet_filter,
                            Multi = true,
                            AllowNone = true,
                            Callback = function(selected_pets)
                                pet_filter = selected_pets
                            end
                        })
                    else
                        pet_filter = {}
                    end
                end
            })

            -- Создаем dropdown питомцев по умолчанию сразу
            local pets_for_filter = get_pets(autosellpets_rarity)
            if #pets_for_filter > 0 then
                dropdown_petfilter = tab:Dropdown({
                    Title = "Pet Filter",
                    Values = pets_for_filter,
                    Value = pet_filter,
                    Multi = true,
                    AllowNone = true,
                    Callback = function(selected_pets)
                        pet_filter = selected_pets
                    end
                })
            else
                pet_filter = {}
            end

            -- Слайдер интервала продажи
            slider_interval = tab:Slider({
                Title = "Sell Interval",
                Desc = "The recommended interval is 60s",
                Step = 1,
                Value = {
                    Min = 1,
                    Max = 120,
                    Default = autosellpets_interval,
                },
                Callback = function(value)
                    autosellpets_interval = value
                end
            })

            -- Слайдер количества продажи за раз (1-6)
            slider_persale = tab:Slider({
                Title = "Amount per sale",
                Desc = "Choose how many pets to sell at once (1-6)",
                Step = 1,
                Value = {
                    Min = 1,
                    Max = 6,
                    Default = autosellpets_persale,
                },
                Callback = function(value)
                    autosellpets_persale = value
                end
            })
        end
    end
})
