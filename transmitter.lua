local modem = peripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)

local core = peripheral.find("draconic_rf_storage")
local coreenergy = core.getEnergy()

local sleeptime = 2.5

while true do
    modem.transmit (123, 321, coreenergy())
    sleep(sleeptime)
end