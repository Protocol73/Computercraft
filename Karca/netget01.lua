--Written by Protocol73 For ComputerCraft 1.6 +
KARCAver = "v0.7"
P73core = require("Core/P73_core") --Import Core Functions
hostname = P73core.PChostname() --check/set hostname
os.loadAPI("Karca/Config/ngCFG.lua") --Pull Config File
cfgver = ngCFG.KARCAver
Debug = ngCFG.Debug

-- ### ADD ### CheckVer(KARCAver)

-- Local Functions (Most will be moved to P73-NetCore.lua)[Someday]
function RemoteEXELine(RunThis ,NETrepy2)
	shell.run(RunThis)
	--reply code here using NETrepy2
end

function CandC() --Clean up & Close
	activemodem = rednet.close(ngCFG.modemside)
	--put stuff here
end
-- End Local Functions

--Program Startup & Prerun Checks
local tArgs = { ... }

if #tArgs < 1 then
    print("Usage: NetGet 'Protocol' ")
    return
end
--Get the set Protocol
protocol = tArgs[1]--Set protocol via the 1st Argument.
other = tArgs[2] --For later Usage

function PrerunChecks() --Presend Checks
	if protocol == "RemoteEXE" then --Warn if Protocol is RemoteEXE
		RemoteAccept = P73core.confirmYN(ngCFG.RemoteWarnMsg)
		if RemoteAccept == true then
			print("Okay, Using RemoteEXE Protocol.")
		else
			print("Okay, Not using RemoteEXE...")
			print("Shuting down NetGet Program.")
			print("Press any key to quit & reboot...")
			os.pullEvent("char")
			os.reboot() --Replace This
		end
	end
end

--REDNET code for Receiving data
PrerunChecks()
print("Listening via the " .. protocol .. " Protocol.")
activemodem = rednet.open(ngCFG.modemside)
NETsenderID, NETMessage, NETprotocol = rednet.receive()

--Protocol's Defined (Move to NET-Protocols.lua)

--Check Protocol of Data Received
if NETprotocol == "TestNet" then
	P73core.Debugger("Remote PC via TestNet:",NETMessage)
	print("Received from PC-ID#",NETsenderID)
elseif NETprotocol == "RemoteEXE" then
	NETrepy2 = NETsenderID
	RemoteEXELine(NETMessage,NETrepy2)
else
	print("Got Message via unknown protocol")
	if Debug == false then
		print("Set Debug = true to see info")
	else
		P73core.Debugger(NETprotocol, NETMessage)
	end
end

