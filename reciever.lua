local modem = paripheral.find("modem") or error("No Modem Found!", 0)
modem.open(123)
local sleeptime = 2.5
while true do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    if channel == 321 then
        print("Received data from transmitter:")
        print(message)
    end
    sleep(sleeptime)
end