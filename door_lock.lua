-- Uncomment line two to stop ppl from ( ctrl + t ) "Terminating" the Program
--os.pullEvent = os.pullEventRaw
--Edit the varables set on lines 5-8 to setup the lock.

local password = "changeme" --edit & Name program 'startup' to run at boot.
local ot = 3 --(O)pen (T)ime in Seconds
local side = "right left ect." --Set side of Redstone output
user = "changeme" -- Change to your MC username


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
  print("Welcome Back " ..user..".") 
  redstone.setOutput(side, true)
  sleep(ot)
  redstone.setOutput(side, false)
  term.clear()
  term.setCursorPos(1,1)
else
  term.clear()
  term.setCursorPos(20,8)
  textutils.slowPrint("Access Denied.",7)
  term.setCursorPos(15,10)
  textutils.slowPrint("Check Your Access Code.",8)
  sleep(3)
 end
end
