term.clear()
term.setCursorPos(1,1)
 write("Enter Wireless Modem Side:")
 local input = read()
rednet.open(input)
sleep(0.25)
print("FTP wating to Receive to PC ID of:"..os.getComputerID())

while true do 
  id,msg = rednet.receive()
  if msg == "RECEIVE" then
    id2,msg2 = rednet.receive()
    file = fs.open(msg2,"w")
    id3,msg3 = rednet.receive()
    file.write(msg3)
    file.close()
    print("The File " ..msg2.. " was Received.")
    sleep(3)
    break
  else if
   msg == nil then
   print("Error")
  end  
 end
end 
