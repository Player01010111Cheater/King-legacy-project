local folderofupdate = Instance.new("Folder")
folderofupdate.Parent = workspace
folderofupdate.Name "UpdateFolder"
if workspace.UpdateFolder.UpdatedStatus.Value == true then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Player01010111Cheater/King-legacy-project/refs/heads/main/Souce.lua"))()
else
  for _, v in pairs(workspace.UpdateFolder:GetDescendants()) do
    if v.Name == "UpdatedStatus" then
      v:Destroy()
    else
      local Update = Instance.new("BoolValue")
      Update.Name = "UpdateStatus"
      Update.Parent = workspace
      Update.Value = false
    end
  end
end
