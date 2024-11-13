local folderofupdate = Instance.new("Folder")
folderofupdate.Parent = workspace
folderofupdate.Name "UpdateFolder"
while wait(10) do

    for _, v in pairs(workspace.UpdateFolder:GetDescendants()) do
      if v.Name == "UpdateStatus" then
        v:Destroy()
      else
        local Update = Instance.new("BoolValue")
        Update.Name = "UpdateStatus"
        Update.Parent = workspace
        Update.Value = false
    end
  end
end
