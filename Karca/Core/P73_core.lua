--Written by Protocol73 For ComputerCraft 1.6 +
--P73_core.lua
local P73core = {}
local KARCAver = "0.8"

--Must Get Settings from .cfg here too
--Debug = true -- (Temp Hardcode Value in function)

--functions (P73_core.lua)
function P73core.getVer()
	-- ### ADD ### --
	--check if core & program version are same.
	return NSver
end
function P73core.clearTerm()
	term.clear()
	term.setCursorPos(1,1)
end

function P73core.confirmYN(warnmsg)
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
		print("- - - DEBUGGING OUTPUT - - -")
		print("Debug data from",debugItem)
		print(debugdata)
		print("- - -END DEBUGGING OUTPUT - - -")
	else
		--Output no debug info if false
		--Fix Start & end of Debug output.
	end
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