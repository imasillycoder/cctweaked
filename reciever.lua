local modem = peripheral.find("modem") or error("No Modem Found!", 0)
modem.open(321)
local sleeptime = 1
local monitor = peripheral.find("monitor") or error("No Monitor Found!", 0)

while true do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    if channel == 321 then
        print("Received data from transmitter:")
        
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.write(message)

        print(message)

        sleep(sleeptime)
    end
end