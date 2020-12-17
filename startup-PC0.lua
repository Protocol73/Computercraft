--For Testing KarcaOS
print("Loading KarcaOS Startup")
sleep(2)

local modemside = "top"

function Modem(modemside)
    ccemux.attach(modemside,"wireless_modem",{
    range = 64,
    interdimensional = true,
    world = "main",
    posX = 0, posY = 0, posZ = 0,})
    print("Modem added to",modemside)
end

--Modem(modemside)

shell.run("emu open 1")
shell.run("emu open 2")
print("Closing this Computer in 15 Seconds")
print("Hold Ctrl + T to stop this...")
sleep(15)
shell.run("emu close 0")