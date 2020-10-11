--Written by Protocol73 For ComputerCraft 1.6
NSver = "v0.6"
P73Core = require ("Core/P73_core") --Import Core Functions
--LocalCFG = require("CFG/NetSendCFG.lua") --Pull Config File

--Settings (Move to NetSent.cfg)
clsAtStart = true
modemside = "top"
reciverID = 1
protocol = "TestNet"
hostname = "Test-01"
DTS_Override = "Test Data from " .. hostname --Data to Send

if clsAtStart == true then
	term.clear()
	term.setCursorPos(1,1)
end

--Program
rednet.open(modemside)
rednet.broadcast(DTS,protocol)
print("Sent Message via", protocol, "of:")
print(DTS_Override)
