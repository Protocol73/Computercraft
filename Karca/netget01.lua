--Written by Protocol73 For ComputerCraft 1.6 +
--netget.lua
KARCAver = 0.8
P73core = require("Core/P73_core") --Import Core Functions
NP_73 = require("Core/NET_Protocols") --Import Protocols
hostname = P73core.PChostname() --check/set hostname
os.loadAPI("Karca/Config/ngCFG.lua") --Pull Config File
endlessloop = ngCFG.Loop
cfgver = ngCFG.KARCAver
Debug = ngCFG.Debug

--Version info for P73core.getVer()
Mainver_KARCAver = KARCAver
P73core.getVer()

-- Local Functions (Most moved to P73-NetCore.lua)
function RemoteEXELine(RunThis ,NETrepy2)
	shell.run(RunThis)
	--reply code here using NETrepy2
end

function CandC() --Clean up & Close
	--P73core.clearTerm()
	--put stuff here
end

-- End Local Functions

--Program Startup, Prerun Checks & Get Arguments
local tArgs = { ... }

if #tArgs < 1 then
    print("Usage: NetGet 'Protocol' ")
    return
end

protocol = tArgs[1]--Set protocol via the 1st Argument.
endlessloop = tArgs[2] --For Looping via Argument

function main()
	NP_73.PrerunChecks(protocol)
	--REDNET code for Receiving data
	print("Listening via the " .. protocol .. " Protocol.")
	activemodem = rednet.open(ngCFG.modemside)
	NETsenderID, NETMessage, NETprotocol = rednet.receive()
	NP_73.Protocol(NETprotocol,NETMessage)
end

function mainloop()
	loopcount = 0
	while endlessloop do --if looping is enabled
		main()
		loopcount = loopcount + 1
		print("NetGet has run" , loopcount, "times.")
	end
end

if endlessloop then
	mainloop()
else
	main()
	activemodem = rednet.close(ngCFG.modemside)
end

--END Karca/NetGet
