-- Example Client Script --
local RS = game:GetService("ReplicatedStorage")
local LoafRemoteHandler = require(RS:WaitForChild("LoafRemoteHandler"))
local newonce:RemoteEvent = LoafRemoteHandler.Get("Real", true, 10)
newonce.OnClientEvent:Connect(function()
	print("So sigma")
end)
	