-- Module --

local Loaf = {}
Loaf.__index = Loaf
local RS = game:GetService("ReplicatedStorage")

local function FolderCreate() -- Creates Folder if you don't already have it
	if not RS:FindFirstChild("RemoteFolder") then
		local RemoteFolder = Instance.new("Folder")
		RemoteFolder.Parent = game:GetService("ReplicatedStorage")
		RemoteFolder.Name = "RemoteFolder"
		return RemoteFolder
	end
end

function Loaf.Get(RemoteEventName: string, RepeatUntil: boolean, MaxRepeat: number) -- You can call it from here
	if RS:WaitForChild("RemoteFolder") then
		if RepeatUntil then -- Checks if you want it to keep on repeating until you get the remote
			local Remote = nil
			local Retrys = 0
			repeat
				Remote = RS.RemoteFolder:FindFirstChild(RemoteEventName)
				Retrys += 1
                if MaxRepeat then
                    if Retrys >= MaxRepeat then -- Checks
					    break
				    end 
                end
				task.wait(1)
			until Remote 
			if not Remote then
				warn("Remote not found")
				return nil
			else
				return Remote
			end
		else
			local Remote = RS.RemoteFolder:FindFirstChild(RemoteEventName)
			return Remote
		end
	end
end

function Loaf.New(Remote: string) -- Creates the objects 
	local self = setmetatable({}, Loaf)
	local Folder = FolderCreate()
	self.Folder = Folder
	self.Type = Remote
	self.Remote = nil
	return self	
end

Loaf.Create = function(self, Name:string) -- Creates the new remote event
	local NewRemote : RemoteEvent = Instance.new(self.Type)
	NewRemote.Parent = self.Folder
	if Name then
		NewRemote.Name = Name
	end
	self.Remote = NewRemote
	return self.Remote
end

return Loaf