--Written by Protocol73 For ComputerCraft 1.6 +
--P73_core.lua
local P73core = {}
local KARCAver = 0.8

--Set Version info for P73core.getVer()
P73core_KARCAver = KARCAver

--Must Get Settings from .cfg here too?
--Debug = true -- (Temp Hardcode Value in function)

--functions (P73_core.lua)

function P73core.clearTerm() --Clear & Reset Terminal
	term.clear()
	term.setCursorPos(1,1)
end

function P73core.confirmYN(warnmsg) --Warn & Ask to Continue
	print(warnmsg)
	term.write("### Continue? (y/n)")
	local input = read()
	if input == "y" then
		return true
	else
		return false
	end
end

function P73core.Debugger(debugItem, debugdata) --For Output of Debug Data
	if Debug == true then
		string.rep("-",38)
		print("---v---v---DEBUGGING OUTPUT---v---v---")
		print("Debug data from",debugItem)
		print(debugdata)
		print("---^---^---DEBUGGING OUTPUT---^---^---")
		string.rep("-",38)
	else
		--Output no debug info if false
		--Fix Start & end of Debug output.
	end
end

function P73core.getVer() -- Version Checking for KARCA
	VerChecked = false
	if P73core_KARCAver == Mainver_KARCAver then
		Check1 = true
	else
		print("Failed KARCA version Check")
		print("Core:" .. P73core_KARCAver)
		print("Main:" .. Mainver_KARCAver)
		Check1 = false
	end
	if P73core_KARCAver == NP_73_KARCAver then
		Check2 = true
	else
		Check2 = false
		print("Failed KARCA version Check")
		print("P73_core:" .. P73core_KARCAver)
		print("Net_Protocols:" .. NP_73_KARCAver)
	end
	if Check1 and Check2 == true then 
		VerChecked = true
	else
		VerChecked = false
		error("Version Checks Failed")
	end
	return VerChecked
end

function P73core.PChostname()
	hostname = os.getComputerLabel()
	if hostname == nil then
		--auto name it
		CCPCNum = os.getComputerID()
		os.setComputerLabel("NetPC" .. CCPCNum)
		hostname = os.getComputerLabel() --Just for Debugger
		P73core.Debugger("Hostame was nil, set to:", hostname)
	else
		--Name is set don't change it
		P73core.Debugger("Hostame was already set:", hostname)
	end
	hostname = os.getComputerLabel()
	return hostname
end

return P73core

--END Karca/P73_core
