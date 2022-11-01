--[[
MADE BY: WhoIsE.#9106
THIS WONT BYPASS ANY INSANE ANTI CHEAT JUST DOGSHIT ONES DONT DM ME SAYING "YOUR BYPASS IS ASS".
Edit the settings accordingly; if it throws any error's or doesn't work then DM me on discord Servers you can reach me in:
script ware, krnl, HID systems
]]

-- THIS SCRIPT IS UNDERGOING A RE-Write
local function CheckForFunctions()
 local getconnections = getconnections or get_connections
 local checkCaller = checkcaller or check_caller
 local hookFunction = hookfunction or hook_function
 local getNameCall = getnamecallmethod
 local newC = newcclosure
 local hookmetamethod = hookmetamethod or hook_metamethod
	
	if not (getconnections) or not (checkCaller) or not (hookFunction) or not (getNameCall) or not (newC) or not (hookmetamethod) then 
	return warn("Executor Not Supported")
     end
end

CheckForFunctions()

local LogService, ScriptContextService = game:GetService("LogService"), game:GetService("ScriptContext")
local gc, gc2,  memory = gcinfo(), collectgarbage('count'), game["Stats"]["GetTotalMemoryUseageMb"]

local Connections[] = {
game.ChildAdded,
game["ChildAdded"],
game.DescendantAdded,
game["DescendantAdded"],

}




