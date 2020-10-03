print("Starting ")

--Settings
clsAtStart = true
modemside = "back"
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
