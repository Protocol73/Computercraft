-- Made by Protocol73 https://github.com/Protocol73
-- Uncomment line three to stop ppl from ( ctrl + t ) "Terminating" the Program
--os.pullEvent = os.pullEventRaw
local password = "password" -- edit & Name program 'startup' to run at boot.
local ot = 3
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
  print("Welcome Back Player") -- Change to your MC username
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
