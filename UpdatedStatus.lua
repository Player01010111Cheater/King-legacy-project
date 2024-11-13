if workspace:FindFirstChild("UpdatedStatus") then
workspace.UpdateStatus:Destroy()
  else
  local Updated = Instance.new("BoolValue")
  Updated.Name = "UpdateStatus"
  Updated.Parent = workspace
  Updated.Value = true
end
