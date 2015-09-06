local results = {};


for i = 1, 1024 do

    if(maybe) then
        results[true] = true;
    else
        results[false] = true;
    end

    if(results[true] and results[false]) then

        return true, "got correct results";

    end

end

return false, "got incorrect results";
