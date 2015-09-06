

if(0b1010 ~= 10) then
    return false, "0b1010 ~= 10";
end

if(math.type(0b1010) ~= "integer") then
    return false, "math.type(0b1010) ~= 'integer'";
end

return true;
