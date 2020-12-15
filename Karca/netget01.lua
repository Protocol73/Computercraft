--Written by Protocol73 For ComputerCraft 1.6 +
--netget.lua
KARCAver = "v0.8"
P73core = require("Core/P73_core") --Import Core Functions
NP_73 = require("Core/NET_Protocols") --Import Protocols
hostname = P73core.PChostname() --check/set hostname
os.loadAPI("Karca/Config/ngCFG.lua") --Pull Config File
cfgLoop = ngCFG.Loop
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

--Get the protocol & args
protocol = tArgs[1]--Set protocol via the 1st Argument.
endlessloop = tArgs[2] --For Looping via Argument

NP_73.PrerunChecks(protocol)

--REDNET code for Receiving data
print("Listening via the " .. protocol .. " Protocol.")
activemodem = rednet.open(ngCFG.modemside)
NETsenderID, NETMessage, NETprotocol = rednet.receive()
NP_73.Protocol(NETprotocol,NETMessage)