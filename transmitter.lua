local modem = peripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)

local function shortenBig(n)
    local s = string.format("%.0f", n)  -- convert number to full string without scientific notation
    local len = #s

    if len > 24 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fZ", mantissa)
    elseif len > 21 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fE", mantissa)
    elseif len > 18 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fP", mantissa)
    elseif len > 15 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fT", mantissa)
    elseif len > 12 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fB", mantissa)
    elseif len > 9 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fM", mantissa)
    elseif len > 6 then
        local mantissa = tonumber(string.sub(s, 1, 3)) / 10^(len - 3)
        return string.format("%.2fK", mantissa)
    else
        return s
    end
end


local energy = peripheral.wrap("back")
local sleeptime = 2.5

while true do
    local capacity = energy.getMaxEnergyStored()  -- KEEP AS NUMBER
    local formatted = shortenBig(capacity)

    modem.transmit(321, 321, formatted)
    sleep(sleeptime)
end
