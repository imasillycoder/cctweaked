local modem = peripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)

local function shortenBig(n)
    -- First, force n to a string without scientific notation
    -- "%.0f" gives no decimal, string.format returns a string, then tonumber may lose precision,
    -- so we operate on the string for very large values.
    local s = string.format("%.0f", n)  -- this gives full integer representation

    -- Determine how many digits
    local len = #s

    -- Define suffixes based on the number of digits
    -- 16-18 digits → P (peta), 19-21 → E (exa), 22-24 → Z (zetta), etc.
    if len > 24 then
        -- Zetta+: divide by 10^(len-1), keep two digits
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fZ", mantissa)
    elseif len > 21 then
        -- Exa
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fE", mantissa)
    elseif len > 18 then
        -- Peta
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fP", mantissa)
    elseif len > 15 then
        -- Tera
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fT", mantissa)
    elseif len > 12 then
        -- Giga
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fB", mantissa)
    elseif len > 9 then
        -- Mega
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fM", mantissa)
    elseif len > 6 then
        -- Thousand
        local exponent = len - 1
        local mantissa = tonumber(string.sub(s, 1, 3)) / (10 ^ (exponent - 2))
        return string.format("%.2fK", mantissa)
    else
        return s  -- small number, just return full integer
    end
end


local core = peripheral.find("draconic_rf_storage")
local energy = peripheral.wrap("back")

local sleeptime = 2.5

while true do
    local capacity = tostring(energy.getMaxEnergyStored())
    local formatted = shorten(capacity)

    modem.transmit (321, 321, formatted)
    sleep(sleeptime)
end