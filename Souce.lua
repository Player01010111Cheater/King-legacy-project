local prompt = workspace:WaitForChild("MyPrompt")

prompt.HoldDuration = 0
prompt.RequiresLineOfSight = false
prompt.MaxActivationDistance = 1000

prompt:InputHoldBegin(Enum.UserInputType.Keyboard)
task.wait()
prompt:InputHoldEnd(Enum.UserInputType.Keyboard)


