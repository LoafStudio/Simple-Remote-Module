-- Example Server Script --
local RS = game:GetService("ReplicatedStorage")
local LRH = require(RS:FindFirstChild("LoafRemoteHandler"))
local Newremote = LRH.New("RemoteEvent")
local Remote = Newremote.Create(Newremote, "Real")
task.wait(.5)
Remote:FireAllClients()