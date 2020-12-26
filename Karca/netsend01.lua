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
	print("NetSend 'Protocol'")
	print("Avalable Protocols are:\n")
	NP_73.printProtocols()
	print("\nLoop Mode can be blank or 'true'")
	print("EX: netsend TestNet 'Testing 123'\n")
end

Mainver_KARCAver = KARCAver 
P73core.getVer()

--Program Startup & Prerun Checks
local tArgs = { ... }
protocol = tArgs[1] --Set protocol via the 1st Argument.
DataForSend = tArgs[2] --Set Data or Program for Protocol
ExtaParms = tArgs[3] --For Protocols that need a third argument

if protocol == 'help' then
	help()
	error("Printed Help, Exiting",0)
end

if #tArgs < 2 then
    print("Usage: NetSent Protocol 'Data/Args' ")
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
	end

--PresendChecks()
CFS, protocol = DTSChecks()

--Send it!
rednet.open(nsCFG.modemside)
rednet.broadcast(CFS,protocol)
print("Sent Message via", protocol, "of:")
print(CFS)

--END Karca/NetSend
