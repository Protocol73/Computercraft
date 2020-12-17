--For Testing KarcaOS

print("Loading Startup File")

local modemside = "top"

function Modem(modemside)
    ccemux.attach(modemside,"wireless_modem",{
    range = 64,
    interdimensional = false,
    world = "main",
    posX = 1, posY = 1, posZ = 1,})
    print("Modem added to",modemside)
end

Modem(modemside)
shell.run("cd Karca")
