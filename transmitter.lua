local modem = peripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)

local core = peripheral.find("draconic_rf_storage")
local energy = peripheral.wrap("back")
local capacity = energy.getMaxEnergyStored()

if core then
    local coreenergy = capacity
    print(capacity)
end

local sleeptime = 2.5

while true do
    modem.transmit (321, 321, coreenergy())
    sleep(sleeptime)
end