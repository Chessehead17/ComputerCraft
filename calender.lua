------------------------------------------
-- Configuration
------------------------------------------
local time = os.time()
local day = os.day()
local lengthofyear = 365
local year = day/lengthofyear
local dayfinal = day%lengthofyear
local monitorside = "top"
local scaling = 1
------------------------------------------
-- Needed Maths
------------------------------------------
monitor01 = peripheral.wrap(monitorside)
monitor01.setTextScale(scaling)
x,y = monitor01.getSize()
midY = (y/2)-1 -- Vertical Center
midX = x/2
fluff = 1
--midX = x/2-- Horizontal Center
------------------------------------------
-- Program
------------------------------------------
function grabtime()
    time = os.time()
    printabletime = textutils.formatTime(time)
    printabletimelength = string.len(printabletime)/2
    printabletimelengthX = midX - printabletimelength +fluff
    day = os.day()
    dayprintable = tostring(math.floor(day))
    daytruestring = "Total Days: "..dayprintable
    dayprintablelength = string.len(daytruestring)/2
    dayprintablelengthX = midX - dayprintablelength +fluff
    year = day/365
    yearstring = tostring(math.floor(year))
    dayfinal = day%365
    dayfinalstring = tostring(math.floor(dayfinal))
    YearLine = "Year:" .. yearstring .. " Day:" .. dayfinalstring
    YearLineLength = string.len(YearLine)/2
    YearLineLengthX = midX - YearLineLength +fluff
end

function monitorprint()
    grabtime()
    monitor01.clear()
    monitor01.setCursorPos(printabletimelengthX+1,midY)
    monitor01.write(printabletime)
    monitor01.setCursorPos(YearLineLengthX,midY+1)
    monitor01.write(YearLine)
    monitor01.setCursorPos(dayprintablelengthX,midY+2)
    monitor01.write(daytruestring)
end

------------------------------------------
-- Main Loop/Body of Program
------------------------------------------
while true do
    monitorprint()
    sleep(1)
end