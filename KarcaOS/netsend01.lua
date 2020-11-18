--Written by Protocol73 For ComputerCraft 1.6
NSver = "v0.6"
P73core = require ("Core/P73_core") --Import Core Functions
--LocalCFG = require("CFG/NetSendCFG.lua") --Pull Config File

--Settings (Move to NetSent.cfg)
Debug = true
clearAtStart = true
modemside = "top"
reciverID = 1
protocol = nil
hostname = P73core.PChostname() --set hostname
DTS_Override = "Test Data from " .. hostname --Data to Send

if clearAtStart == true then
	term.clear()
	term.setCursorPos(1,1)
end
--Program Startup & Prerun Checks
local tArgs = { ... }

if #tArgs < 2 then
    print("Usage: NetSent 'Protocol' 'Data'")
    return
end
--Set Protocol
protocol = tArgs[1] --Set protocol via the 1st Argument.
DataForSend = tArgs[2] --Set Data or Program for Protocol
ExtaParms = tArgs[3] --For Protocols that need a third argument

function DTSChecks()
	if DataForSend~= nil then
	P73core.Debugger("Data to send:", DataForSend)
	elseif DataForSend == nil then
		P73core.Debugger("DTS was:", DataForSend)
		DataForSend = DTS_Override
		P73core.Debugger("Using DTS_Override:", DataForSend)
	end
	--Check Called Protocol using DTS

	--Set Cleared for Send Data
	CFS = DataForSend

	--Return CFS & Protocol it's Cleared for.
	return CFS,protocol
end

function PresendChecks() --Presend Checks
	
	end

--PresendChecks()
CFS, protocol = DTSChecks()

--Send it!
rednet.open(modemside)
rednet.broadcast(CFS,protocol)
print("Sent Message via", protocol, "of:")
print(CFS)
