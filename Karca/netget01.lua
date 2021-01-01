--Written by Protocol73 For ComputerCraft 1.6 +
--netget.lua
KARCAver = 0.8
P73core = require("Core/P73_core") --Import Core Functions
NP_73 = require("Core/NET_Protocols") --Import Protocols
hostname = P73core.PChostname() --check/set hostname
os.loadAPI("Karca/Config/ngCFG.lua") --Pull Config File
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

function NETrepy2(PCID,Data) --Lazy man's TCP
	rednet.send(PCID,Data,"NETrepy")
end

function help()
	P73core.clearTerm()
	print("NetGet Help")
	print("NetGet 'Protocol' Optional: Loop Mode")
	print("Avalable Protocols are:\n")
	NP_73.printProtocols()
	print("\nLoop Mode can be blank or 'true'")
	print("EX: netget TestNet true\n")
end

function CandC() --Clean up & Close
	if ngCFG.clearAL == true then
		P73core.clearTerm()
		--activemodem = rednet.close(ngCFG.modemside)
	end
end

-- End Local Functions

--Program Startup, Prerun Checks & Get Arguments
local tArgs = { ... }

if #tArgs < 1 then
    print("Usage: NetGet 'Protocol' T-F:loop")
    return
end

protocol = tArgs[1]--Set protocol via the 1st Argument.
endlessloop = tArgs[2] --For Looping via Argument

if protocol == 'help' then
	help()
	error("Printed Help, Exiting",0)
end

function main()
	NP_73.PrerunChecks(protocol)
	--REDNET code for Receiving data
	print("Listening via the " .. protocol .. " Protocol.")
	activemodem = rednet.open(ngCFG.modemside)
	NETsenderID, NETMessage, NETprotocol = rednet.receive(protocol)
	NP_73.Protocol(NETprotocol,NETMessage)
end

function mainloop()
	loopcount = 0
	while endlessloop do --if looping is enabled
		main()
		CandC()
		loopcount = loopcount + 1
		print("NetGet has run" , loopcount, "times.")
		print("Last Message was:",NETMessage, "via", NETprotocol)
	end
end

if endlessloop then
	mainloop()
else
	main()
end

--END Karca/NetGet
