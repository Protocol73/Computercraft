-- A Simple Scrolling Text Program for ComputerCraft
-- By Protocol73 https://github.com/Protocol73/Computercraft 
local pos = 18
Text = "Scrolling Text" --Set Text here.
mon = peripheral.wrap("monitor_0") --Change to side if Monitor is not Connected over a network
mon.clear()
mon.setCursorPos(1,1)
mon.setTextScale(4)

while true do
 if pos==-26 then
 pos = 18
end
--The Pos Values may need a little tweeking to fit your needs. 

 mon.clear()
 mon.setCursorPos(pos,1)
 mon.write(Text)
 term.clear()
 term.setCursorPos(1,1)
 print("The Scrolling Text Program is Running...")
 pos = pos-1
 
 os.sleep(0.15)
end  
