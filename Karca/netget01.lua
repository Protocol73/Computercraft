--Written by Protocol73 For ComputerCraft 1.6
NSver = "v0.6"
P73core = require("Core/P73_core") --Import Core Functions
--LocalCFG = require("CFG/NetGetCFG.lua") --Pull Config File

--Settings (Move to NetGet.cfg)
modemside = "top"
reciverID = nil
protocol = nil
hostname = os.getComputerLabel()
Debug = true

function RemoteRunLine(RunThis ,NETrepy2)
	shell.run(RunThis)
	--reply code here using NETrepy2
end

--Program Startup & Prerun Checks
local tArgs = { ... }

if #tArgs < 1 then
    print("Usage: NetGet 'Protocol'")
    return
end
--Set Protocol
protocol = tArgs[1] --Sets the protocol via the first Argument passed.

--REDNET CODE
print("Listening on " .. protocol .. " Protocol.")
activemodem = rednet.open(modemside)
NETsenderID, NETMessage, NETprotocol = rednet.receive()

--Protocol's Defined (Maybe move to ML-NET.)

--Check Protocol of Data Received
if NETprotocol == "TestNet" then
	P73core.Debugger("Remote PC via TestNet:",NETMessage)
	print("Received from PC-ID#",NETsenderID)
elseif NETprotocol == "RemoteRun" then
	NETrepy2 = NETsenderID
	RemoteRunLine(NETMessage,NETrepy2)
else
	print("Got Message via unknown protocol")
	if Debug == false then
		print("Set Debug = true to see info")
	else
		P73core.Debugger(NETprotocol, NETMessage)
	end
end
