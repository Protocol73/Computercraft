--Written by Protocol73 For ComputerCraft 1.6
NSver = "v0.6"
P73core = require ("Core/P73_core") --Import Core Functions
--LocalCFG = require("CFG/NetSendCFG.lua") --Pull Config File

--Settings (Move to NetSent.cfg)
clearAtStart = true
modemside = "top"
reciverID = 1
protocol = nil
hostname = "Test-01"
DTS_Override = "Test Data from " .. hostname --Data to Send

if clearAtStart == true then
	term.clear()
	term.setCursorPos(1,1)
end
--Program Startup & Prerun Checks
local tArgs = { ... }

if #tArgs < 2 then
    print("Usage: NetSent 'Protocol'")
    return
end
--Set Protocol
protocol = tArgs[1] --Sets protocol via the 1st Argument passed.
DTS = tArgs[2]


function DTSChecks()
	if DTS ~= nil then
	P73core.Debugger("Data To Send:", DTS)
	elseif DTS == nil then
	DTS = DTS_Override
	end
end

function PresendChecks() --Presend Checks
	end

--PresendChecks()

--Send it!

rednet.open(modemside)
rednet.broadcast(DTS,protocol)
print("Sent Message via", protocol, "of:")
print(DTS_Override)
