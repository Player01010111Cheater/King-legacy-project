local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/Sigmna/refs/heads/main/Souce.lua"))()
local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/dxhooknotify/src.lua", true))()
local Window = redzlib:MakeWindow({"It's time to win Free version", "", ""})
Window:AddMinimizeButton({
  Button = { Image = redzlib:GetIcon("Apple"), BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})
local esp = Window:MakeTab({'ESP' , 'Home'})
local loadbasesection = esp:AddSection({"ESP"})
local alldroppedfruitsfolder = workspace.AllDroppedFruit
local player = game.Players.LocalPlayer
local camerafield = workspace.CurrentCamera
local name =  "PassiveTree"
local allnpc = workspace.AllNPC
local folderplayerinworkspace = workspace.PlayerCharacters
local stop = false
local fruitesp = esp:AddToggle({
  Name = "dropped fruit esp",
  Default = false,
  Flag = "dropfruitesp",
  Callback = function (fruitespmaintoggle)
    if fruitespmaintoggle == true then
    local function fruitesp(part)
      local a = Instance.new("BillboardGui" ,part)
      a.AlwaysOnTop = true
      a.MaxDistance = 999999999999
      a.Enabled = true
      a.ResetOnSpawn = false
      a.Active = true
      a.Size = UDim2.new(0,5,0,25)
      a.Name = "ESP"
      local b = Instance.new("TextLabel" , a)
      local camera = workspace.Camera
      b.Size = UDim2.new(0,1,0,1)
      b.BackgroundTransparency = 1
      b.TextSize = 12
      b.Text = b.Parent.Parent.Name
      b.Position = UDim2.new(0,0,0,0)
      b.TextColor = BrickColor.new("White")
    end
    stop = true
    while wait(1.3) do
      if stop == false then
        
      else
        for _, deletefruitofplayers in pairs(game.Players:GetDescendants()) do
              if deletefruitofplayers.Name == "ESP" then
                deletefruitofplayers:Destroy()
          end
        end
        for _, deletefruitininvent in pairs(folderplayerinworkspace:GetDescendants()) do
              if deletefruitininvent.Name == "ESP" then
                deletefruitininvent:Destroy()
          end
        end
        for _, v in pairs(alldroppedfruitsfolder:GetDescendants()) do
          if v.Name  == "ESP" then
            v:Destroy()
          else
            if v.Name == "Handle" then
            fruitesp(v.Parent)
            end
          end
          end
        end
      end
  else
    for _, v in pairs(workspace:GetDescendants()) do
      if v.Name  == "ESP" then
        v:Destroy()
      end
    end
    stop = false
  end
  end})

local GetlastCFrame = nil
local stop2 = true
  local Items = Window:MakeTab({'Items' , 'database'})
  local itemssection = Items:AddSection({"Items"})
local toggleitems = Items:AddToggle({
  Name = "Get all dropped fruit",
  Flag = "",
  Default = false,
  Callback = function (toggleitemsget)
    if toggleitemsget == true then
      stop2 = true
    while wait(0.2) do
      if stop2 == true then
        for _, t in pairs(alldroppedfruitsfolder:GetDescendants()) do
          if t.Name == "Handle" then
            GetlastCFrame = player.Character.HumanoidRootPart.CFrame
            wait(0.1)
            player.Character.HumanoidRootPart.CFrame = t.CFrame
            wait(1)
            player.Character.HumanoidRootPart.CFrame = GetlastCFrame
          end
        end
      else

      end
    end
  else
    stop2 = false
    end
  end
})


local playersetting = Window:MakeTab({'Player Setting' , 'database'})
local sectionplayersetting = playersetting:AddSection({"Player Setting"})

local FieldOfviewchanger = playersetting:AddSlider({
  Name = "Select field of view",
  Flag = "Slider Teste",
  Min = 70,
  Max = 120,
  Default = 16,
  Callback = function (fieldofview)
      camerafield.MaxAxisFieldOfView = 155.55
    camerafield.FieldOfView = fieldofview
  end
})


local valuebuykey = nil
local Buyoropen = Window:MakeTab({'Buy /Open' , 'database'})
local buyopensection = Buyoropen:AddSection({"Buy/Open"})
local buyopenslider = Buyoropen:AddSlider({
  Name = "Select how much copper key buy ",
  Flag = "Lllld",
  Description = "Price : 25k",
  Min = 1,
  Max = 10,
  Default = 0,
  Callback = function (howmuchbuyvalue)
    valuebuykey = howmuchbuyvalue
  end
})
local buyvaluemuch = Buyoropen:AddButton({"Buy" , function ()
  for i = 0,valuebuykey do
    wait(0.1)
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.BuyKey:InvokeServer("Copper Key")
  end
end})
local misc = Window:MakeTab({'Misc' , 'database'})
local sectionmisc = misc:AddSection({'Misc'})
local reedemallcodes = misc:AddButton({'Redeem all new codes' , function ()
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Peodiz")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("FruitAwakeningTime")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Update7.1")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Halloween2024")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("<3LEEPUNGG")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("PlayKingLegacyFor5Gems")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("RainbowDragon")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("DragonColorRefund")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("PassiveMaste")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("InfernoKingAwait")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("SKGames")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Update7.0.4")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("EpicAdventure")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("TelekinesisFruitPower")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Update7Release")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("OWNERMETEOR")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("WELCOMETOKINGLEGACY")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("PLAYKINGLEGACYFOR10GEMS")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("FREESTATSRESET")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("UPDATE6")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("DOUGHAWAKENING")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("ExperienceDoubling")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("10KYZX-4LPQ8-WFJ")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("YT10K")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("UPDATE5")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("shutdownhotfix")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("UPDATE5SILVERKEY")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("10KYZX-4LPQ8-WFJ")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Peodiz10k")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Halloween2023")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Sub2Leepungg")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("2MFAV")
  wait(0.1)
  game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer("Update4.7")
end})
local yeskey = ""
local texbox = misc:AddTextBox({
  Name = "Enter key for more functions",
  Description = "Opem  more funtions",
  PlaceholderText = "Type here",
  Callback = function (getvalue)
    yeskey = getvalue
  end
})
local Autoraid = Window:MakeTab({'Auto Raid' , 'Sword'})
local sectionautoraid = Autoraid:AddSection("Auto Raid")
local addtotelegram = Autoraid:AddDiscordInvite({
  Name = "you cant do it in free version",
  Description = "Get key in my telegram bot",
  Logo = "rbxassetid://77647946260910",
  Invite = "@Getkeyregister_bot",
})
local checkkey = misc:AddButton({"Check key" , function ()
if yeskey == "-H2hIld9a132kda92laa-" then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/Private/refs/heads/main/Privatesousrc.lua?token=GHSAT0AAAAAACZ6KTYLRU56TUUK7SQPPVGAZZWGMTQ"))()
end
end})
