if workspace:FindFirstChild("UpdateStatus") then
workspace.UpdateStatus:Destroy()
  else
  local Updated = Instance.new("BoolValue")
  Updated.Name = "UpdateStatus"
  Updated.Parent = workspace
  Updated.Value = false
end
