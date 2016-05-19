local args = {...}

rednet.open("top")

term.clear()
term.setCursorPos(1,1)

if #args < 1 then 
 print("Usage  <Required>  [Optional]")
 print("ftpsend [ComputerID] <file>")
 return
end

if #args == 1 then
  if fs.exists(args[1]) then
  textutils.slowPrint("Brodcasting " ..args[1].. " ...")
  rednet.broadcast("RECEIVE")
  rednet.broadcast(args[1])
  file = fs.open(args[1],"r")
  rednet.broadcast(file.readAll())
  file.close()
 else 
   print(args[1].." Does not Exist") 
   return
 end 
else
  if fs.exists(args[2]) then
    textutils.slowPrint("Sending " ..args[2].. " to " ..args[1].." !")
    file2 = fs.open(args[2],"r")
    id = tonumber(args[1])
    rednet.send(id, "RECEIVE")
    rednet.send(id, args[2])
    rednet.send(id, file2.readAll())
    file2.close()
  else
    print(args[2].." Does not Exist")
     return
   end
end  
