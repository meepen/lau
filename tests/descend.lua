

local i = 1;

descend i;

if(i ~= 0) then
    return false, "descension of local i (1) resulted in "..tostring(i);
end

TEMP_i = 1;

descend TEMP_i;

if(TEMP_i ~= 0) then
    return false, "descension of global TEMP_i (1) resulted in "..tostring(TEMP_i);
end

TEMP_i = nil;

local nothing;

local s,c = pcall(function()

    descend nothing;

end);

if(s) then
    return false, "descension of local nothing (nil) resulted in "..tostring(nothing);
end


local s,c = pcall(function()

    descend TEMP_nothing;

end);

if(s) then
    return false, "descension of global TEMP_nothing (nil) resulted in "..tostring(nothing);
end



return true;
