
local buf = {};
local function call(a)
    buf[#buf + 1] = a;
    return call;
end

call 1 2 3 4 5;

if(#buf ~= 5) then
    return false, "call wasn't called 5 times";
end

for i = 1, #buf do
    if(buf[i] ~= i) then
        return false, "expected "..tostring(i).." at index "..tostring(i).." but got "..tostring(buf[i]);
    end
end


buf = {};
call 1 2,2 3,3,3 4,4,4,4 5,5,5,5,5;

if(#buf ~= 5) then
    return false, "call wasn't called 5 times";
end

for i = 1, #buf do
    if(buf[i] ~= i) then
        return false, "expected "..tostring(i).." at index "..tostring(i).." but got "..tostring(buf[i]);
    end
end


return true;
