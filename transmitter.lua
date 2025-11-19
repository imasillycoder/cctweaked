local modem = paripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)

local core = paripheral.find("draconic_rf_storage")

local sleeptime = 2.5

while true do
    modem.transmit (123, 321, core)
    sleep(sleeptime)
end