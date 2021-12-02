-- Please remember this won't bypas insane anti cheats like HID or simple ac don't come crying to me later on.
-- ============ SETTINGS ============
local BlockRemotes = false -- only use if your exploit uses newcclousure or how ever the fuck you spell it
local clientWalkSpeedBypass = true
local GuiDetectionBypass = true
local InstaFlyBypass = true
local MemCheckBypas = true
local gcInfoBypass = true
local AntiKick = true
local bypassLegion = true -- A popular open sourced anti cheat
local bypassBtools = true
local humanoidChecksBypass = true
-- ============ DESCRIPTIONS (DON'T CHANGE)============
if game:IsLoaded() then
local LocalPlayer = game.Players.LocalPlayer
  local hum =
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
      return math.random(30, 35)
       end)
  end

local function guiBypass()
  for i, v in pairs(getconnections(game.DescendantAdded)) do
			v:Disable()
		end 
  for i, v in pairs(getconnections(game.LocalPlayer.PlayerGui.ChildAdded)) do
			v:Disable()
		end 
    local Detections = {
        "FindFirstChild",
        "FindFirstChildWhichIsA",
        "FindFirstChildOfClass",
        "IsA"
    }
  end
local function btoolsBypass()
  for i, v in pairs(getconnections(game.LocalPlayer.Backpack.ChildAdded)) do
			v:Disable()
		end 
 end
local function InstantFlyBP()
 for i, v in pairs(getconnections(LocalPlayer.ChildAdded)) do
		v:Disable()
	end
end
  local function bypassMemCheck()
  local gamemt = getrawmetatable(game)
 setreadonly(gamemt, false)
  
local nc = gamemt.__namecall

gamemt.__namecall = newcclosure(function(...)
  if (getnamecallmethod() == 'GetTotalMemoryUsageMb') or (getnamecallmethod() == 'GetTotalMemoryUsageMbForTag("LuaHeap")') then
    return math.random(200, 205)
  end
  return nc(...)
 end)
 end
  local function humBypass()
     for i, v in pairs(getconnections()) do
		v:Disable()
	end
 end
end -- last

