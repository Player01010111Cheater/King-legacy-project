local function fireproximityprompt(prompt: ProximityPrompt, amount: number?, skip: boolean?)
    assert(prompt and prompt:IsA("ProximityPrompt"), "Нужен объект ProximityPrompt")
    local originalHold = prompt.HoldDuration
    if skip then
        prompt.HoldDuration = 0
    end
    for i = 1, amount or 1 do
        prompt:InputHoldBegin()
        if not skip then
            wait(originalHold)
        end
        prompt:InputHoldEnd()
    end
    prompt.HoldDuration = originalHold
end
local myPrompt = workspace:WaitForChild("MyPrompt")
fireproximityprompt(myPrompt, 1, true)  -- мгновенная активация
