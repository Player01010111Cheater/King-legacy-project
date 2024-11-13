if workspace:FindFirstChild("UpdatedStatus") then
workspace.UpdatedStatus:Destroy()
  else
  local Updated = Instance.new("BoolValue")
  Updated.Name = "UpdateStatus"
  Updated.Parent = workspace
  Updated.Value = false
end
