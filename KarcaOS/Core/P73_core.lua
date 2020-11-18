--Written by Protocol73 For ComputerCraft 1.6
local P73core =  {}

--Must Get Settings from .cfg here too
--Debug = true -- (Temp Hardcode Value in function)

--functions (P73_core.lua)
function P73core.getVer()
	NSver = "0.6"
	return NSver
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
	else
		--Name is set don't change it 
	end
	hostname = os.getComputerLabel()
	return hostname
end

return P73core