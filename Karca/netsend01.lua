--Written by Protocol73 For ComputerCraft 1.6 +
--netsend.lua
KARCAver = 0.8
P73core = require("Core/P73_core") --Import Core Functions
NP_73 = require("core/NET_Protocols") --Import Protocol
hostname = P73core.PChostname() --check/set hostname
os.loadAPI("Karca/Config/nsCFG.lua") --Pull Config File
cfgver = nsCFG.KARCAver
Debug = nsCFG.Debug
DTS_Override = "Test Data from " .. hostname --Used for Debugging

if nsCFG.clearAtStart == true then
	P73core.clearTerm()
end

function help()
	P73core.clearTerm()
	print("NetSend Help")
	print("NetSend 'Protocol' 'Data to send' 'PC-ID' ")
	print("Avalable Protocols are:\n")
	NP_73.printProtocols()
	print("\n'PC-ID' should be the ID you want to send to")
	print("\n If no PC-ID is entered you will broadcast to all")
	print("EX: netsend TestNet 'Testing 123' '5'\n")
end

Mainver_KARCAver = KARCAver 
P73core.getVer()

--Program Startup & Prerun Checks
local tArgs = { ... }
protocol = tArgs[1] --Set protocol via the 1st Argument.
DataForSend = tArgs[2] --Set Data or Program for Protocol
Receiver = tArgs[3] --PC hostname or ID
ExtaParms = tArgs[4] --For Protocols that need a fourth argument

if protocol == 'help' then
	help()
	error("Printed Help, Exiting",0)
end

if #tArgs < 2 then
    print("Usage: NetSent Protocol 'Data/Args' PC-ID ")
    return
end

function DTSChecks()
	if DataForSend~= nil then
		P73core.Debugger("Data to send:", DataForSend)
	elseif DataForSend == nil then
		P73core.Debugger("DTS was:", DataForSend)
		DataForSend = nsCFG.DTS_Override
		P73core.Debugger("Using DTS_Override:", DataForSend)
	end
	--Check Called Protocol using DTS

	--Set Cleared for Send Data
	CFS = DataForSend

	--Return CFS & Protocol it's Cleared for.
	return CFS,protocol
end

function PresendChecks() --Presend Checks
	--Do some Verifcation
	CFS, protocol = DTSChecks()
	if Receiver == nil then
		P73core.confirmYN("No PC-ID set:\nAre you sure you want to broadcast?")
	end
end

PresendChecks()

--Send it!
rednet.open(nsCFG.modemside)
if Receiver ~= nil then
	ReceiverID = tonumber(Receiver)
	rednet.send(ReceiverID,CFS,protocol)
else
	rednet.broadcast(CFS,protocol)
end

print("Sent Message via", protocol, "of:")
print(CFS)

--END Karca/NetSend
