--Written by Protocol73 For ComputerCraft 1.6+
--NET-Protocols.lua
local NP_73 = {}
local KARCAver = 0.8

--Set Version info for P73core.getVer()
NP_73_KARCAver = KARCAver

function NP_73.PrerunChecks(protocol) --User prompt's & checks
	if protocol == "RemoteEXE" then --Warn if Protocol is RemoteEXE
		if cfgLoop == false then --Unless set to loop
			RemoteAccept = P73core.confirmYN(ngCFG.RemoteWarnMsg)
		else
			RemoteAccept = true
		end
		if RemoteAccept == true then
			print("Okay, Using RemoteEXE Protocol.")
		else
			print("Okay, Not using RemoteEXE...")
			print("Shuting down NetGet Program.")
			print("Press any key to quit & reboot...")
			os.pullEvent("char")
			--break
			os.reboot() --Replace This
		end
	end
end

function NP_73.printProtocols() --Protocol Documentation
	print("TestNet: for Testing/Debugging")
	print("RemoteEXE: Run a Program on a Remote PC")
	print("Unknown: If Data Received is of unknown protocol")
end

function NP_73.Protocol(protocol,args) --Check Protocol of Data Received
	if protocol == "TestNet" then
		P73core.Debugger("Remote PC via TestNet:",NETMessage)
		print("Received from PC-ID#",NETsenderID)
	elseif protocol == "RemoteEXE" then
		NETrepy2 = NETsenderID
		RemoteEXELine(args,NETrepy2)
	elseif protocol == "Other1" then
		print("For next Protocol")	
	else
		print("Got Message via unknown protocol")
		if Debug == false then
			print("Set Debug = true to see info")
		else
			P73core.Debugger(protocol, args)
		end
	end
end

return NP_73