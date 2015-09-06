

local i = 1;

ascend i;

if(i ~= 2) then
    return false, "ascension of local i (1) resulted in "..tostring(i);
end

TEMP_i = 1;

ascend TEMP_i;

if(TEMP_i ~= 2) then
    return false, "ascension of global TEMP_i (1) resulted in "..tostring(TEMP_i);
end

TEMP_i = nil;

local nothing;

local s,c = pcall(function()

    ascend nothing;

end);

if(s) then
    return false, "ascension of local nothing (nil) resulted in "..tostring(nothing);
end


local s,c = pcall(function()

    ascend TEMP_nothing;

end);

if(s) then
    return false, "ascension of global TEMP_nothing (nil) resulted in "..tostring(nothing);
end



return true;
