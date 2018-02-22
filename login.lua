-- Made by Protocol73 https://github.com/Protocol73
-- Uncomment line three to stop ppl from ( ctrl + t ) "Terminating" the Program
--os.pullEvent = os.pullEventRaw

-- Edit lines 7 & 8 to setup program.

local password = "changeme" --Name program 'startup' to run at boot.
local user ="changeme" --Change to your MC username.

while true do 
 term.clear()
 term.setCursorPos(15,8)
 write("Login Code:")
 local input = read("*")
  if input == password then 
  term.clear()
  term.setCursorPos(19,8)
  print("Access Granted")
  sleep(1)
  term.setCursorPos(15,10)
  print("Welcome Back "..user..".")
  sleep(1)
  term.clear()
  term.setCursorPos(1,1)
  break
 else
  term.clear()
  term.setCursorPos(20,8)
  textutils.slowPrint("Access Denied.",7)
  term.setCursorPos(15,10)
  textutils.slowPrint("Check Your Access Code.",8)
  sleep(3)
 end
end   
