--Written by Protocol73 For ComputerCraft 1.6
NSver = "v0.6"

--Settings (Move to NetGet.cfg)
modemside = "top"
reciverID = nil
protocol = nil
hostname = os.getComputerLabel()
Debug = true

--functions (Maybe move to P73_core_functions.lua)

function Debugger(debugItem, debugdata) --For Output of Debug Data
	if Debug == true then
		print("---DEBUGGING OUTPUT---")
		print("Debug data from",debugItem)
		print(debugdata)
		print("---END DEBUGGING OUTPUT---")
	else
		--Output no debug info if false
	end
end

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

protocol = tArgs[1]

--REDNET CODE
print("Listening on " .. protocol .. " Protocol.")
activemodem = rednet.open(modemside)
NETsenderID, NETMessage, NETprotocol = rednet.receive()

--Protocol's Defined (Maybe move to ML-NET.)

--Check Protocol of Data Received
if NETprotocol == "TestNet" then
	Debugger("Remote PC via TestNet:",NETMessage)
	print("Received from PC-ID#",NETsenderID)
elseif NETprotocol == "RemoteRun" then
	NETrepy2 = NETsenderID
	RemoteRunLine(NETMessage,NETrepy2)
else
	print("Got Message via unknown protocol")
	if Debug == false then
		print("Set Debug = true to see info")
	else
		Debugger(NETprotocol, NETMessage)
	end
end
