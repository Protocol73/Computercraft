local lit = os.clock() --(L)og (I)n (T)ime
print("You were Logged in for " ..lit.. ".")
sleep(1)
term.clear()
term.setCursorPos(1,1)
print("Loging Out and Password Protecting this PC")
sleep(1)
os.reboot()
