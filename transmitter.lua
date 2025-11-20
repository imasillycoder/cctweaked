local modem = peripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)

local function shorten(n)
    if n >= 1e15 then
        return string.format("%.1fP", n / 1e15)
    elseif n >= 1e12 then
        return string.format("%.1fT", n / 1e12)
    elseif n >= 1e9 then
        return string.format("%.1fB", n / 1e9)
    elseif n >= 1e6 then
        return string.format("%.1fM", n / 1e6)
    elseif n >= 1e3 then
        return string.format("%.1fK", n / 1e3)
    else
        return tostring(n)
    end
end

local core = peripheral.find("draconic_rf_storage")
local energy = peripheral.wrap("back")

local sleeptime = 2.5

while true do
    local capacity = energy.getMaxEnergyStored()
    local formatted = shorten(capacity)

    modem.transmit (321, 321, formatted)
    sleep(sleeptime)
end