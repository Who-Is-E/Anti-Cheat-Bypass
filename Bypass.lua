--[[
MADE BY: WhoIsE.#9106
THIS WONT BYPASS ANY INSANE ANTI CHEAT JUST DOGSHIT ONES DONT DM ME SAYING "YOUR BYPASS IS ASS".
Edit the settings accordingly; if it throws any error's or doesn't work then DM me on discord Servers you can reach me in:
script ware, krnl, HID systems
]]
-- ============ SETTINGS ============
local BlockRemotes = false -- only use if your exploit uses newcclousure or how ever the fuck you spell it
local clientWalkSpeedBypass = true
local GuiDetectionBypass = true
local InstaFlyBypass = true -- non retarded devs can fix patch this easily but i'll work on a new one
local MemCheckBypas = true
local gcInfoBypass = true
local AntiKick = true -- bypasses local script :kick() function
local bypassLegion = true -- A popular open sourced anti cheat
local bypassBtools = true
local humanoidChecksBypass = false -- Still working on this
local BypassErrorChecking = true
-- ============ DESCRIPTIONS (DON'T CHANGE)============
if game:IsLoaded() then
	pcall(function()
local LgService = game:GetService("LogService")
local LocalPlayer = game.Players.LocalPlayer
local function BlockRemots()
  local mt = getrawmetatable(game)
		local old = mt.__namecall

		setreadonly(mt, false)

		mt.__namecall = newcclosure(function(self, ...)
			local arguments = {...}
			if getnamecallmethod() == "FireServer"  then
				return
			end
			return old(self, unpack(arguments))
		end)
		setreadonly(mt, true)
end

local function clientWSP()
  local mt = getrawmetatable(game)
	setreadonly(mt,false)
	oldindex = mt.__index
	mt.__index = newcclosure(function(t,k)
		if tostring(t) == "Humanoid" and tostring(k) == "WalkSpeed" then
			return 16
		end
		return oldindex(t,k)
	end)
 end

local function hookGC()
  hookfunction(gcinfo, function(...)
      return error() -- Better method because they can check GC Drops as well, so we just return some random stuff
       end)
  end
local function bpError()
for i,v in next, getconnections(LgService.MessageOut) do
    v:Disable()
end
for i,v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end			
end
local function guiBypass()
  for i, v in pairs(getconnections(game.DescendantAdded)) do
			v:Disable()
		end 
  for i, v in pairs(getconnections(LocalPlayer.PlayerGui.ChildAdded)) do
			v:Disable()
		end 
  end
local function btoolsBypass()
  for i, v in pairs(getconnections(LocalPlayer.Backpack.ChildAdded)) do
			v:Disable()
		end 
 end
local function InstantFlyBP()
 for i, v in pairs(getconnections(LocalPlayer.Charachter.ChildAdded)) do
		v:Disable()
	end
end
  local function bypassMemCheck()
  local gamemt = getrawmetatable(game)
 setreadonly(gamemt, false)
  
local nc = gamemt.__namecall

gamemt.__namecall = newcclosure(function(...)
  if (getnamecallmethod() == 'GetTotalMemoryUsageMb') or (getnamecallmethod() == 'GetTotalMemoryUsageMbForTag("LuaHeap")') then
    return math.random(10, 15) -- if this is detected lower the threash hold
  end
  return nc(...)
 end)
 end
local function antiKick()
		local Players = game:GetService("Players")
	local OldNameCall;
	OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
		local NameCallMethod = getnamecallmethod()
		if tostring(string.lower(NameCallMethod)) == "kick" or tostring(string.lower(NameCallMethod)) == "Kick" then
			return print("kick")
		end
	end)   
   end
	local function antiLegion()
		for i, v in pairs(game:GetDescendants()) do
		if v:IsA("LocalScript") and v.Name == "Anti" or v.Name == "Main" then
			v.Disabled = true
		end
	end
end
	if BypassErrorChecking == true then
	  return bpError()
	end
	if BlockRemotes == true then
		return BlockRemots()
	end
	if clientWalkSpeedBypass == true then
		return clientWSP()
   end
	if GuiDetectionBypass == true then
		return guiBypass()
	end
	if gcInfoBypass == true then
		return hookGC()
	end
	if bypassLegion == true then 
		return antiLegion()
	end
	if AntiKick == true then
		return antiKick()
	end
	if InstaFlyBypass == true then
		return InstantFlyBP()
	end
	if bypassBtools == true then
		return btoolsBypass()
	end
	if MemCheckBypas == true then
		return bypassMemCheck()
	end
     end)
end -- last

