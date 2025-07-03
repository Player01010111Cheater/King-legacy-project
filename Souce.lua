local HttpService = game:GetService("HttpService")

local botToken = "7839137362:AAEx49nB40uTJHE_ysCTBAzSwp87hAfyXno" -- токен бота
local chatId = "8157698531" -- chat_id (можно ID пользователя или группы)
local text = "Привет! Игрок в игре: " .. game.Players.LocalPlayer.Name 

-- Telegram API URL
local url = string.format("https://api.telegram.org/bot%s/sendMessage", botToken)

-- Создаем тело запроса
local body = HttpService:JSONEncode({
    chat_id = chatId,
    text = text
})

-- Отправляем POST-запрос через request()
request({
    Url = url,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = body
})

