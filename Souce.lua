local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/Sigmna/refs/heads/main/Souce.lua"))()
local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/dxhooknotify/src.lua", true))()
local Window = redzlib:MakeWindow({"King Legacy", "", ""})
Window:AddMinimizeButton({
  Button = { Image = redzlib:GetIcon("Apple"), BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})
local esp = Window:MakeTab({'ESP' , 'database'})
local loadbasesection = esp:AddSection({"ESP"})
local alldroppedfruitsfolder = workspace.AllDroppedFruit
local player = game.Players.LocalPlayer
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
    while wait(0.5) do
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

while wait(5) do
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/King-legacy-project/refs/heads/main/UpdatedStatus.lua"))()
end

local playersetting = Window:MakeTab({'Player Setting' , 'database'})
local sectionplayersetting = playersetting:AddSection({"Player Setting"})
local Fildofview = playersetting:AddToggle({
  Name = "Custom Field of View"
})


