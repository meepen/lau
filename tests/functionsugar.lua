local function test()
{

    return {42};

}

if (test()[1] ~= 42) then

    return false, "test()[1] ~= 42";

end

if ((function() { return 44 })() ~= 44) then
    return false, "(function() { return 44 })() ~= 44";
end

function gtest()
{

    return 46;

}

if (_ENV.gtest == nil) then
    return false, "_ENV.gtest == nil";
end
if(gtest() ~= 46) then
    return false, "gtest() ~= 46";
end

return true;
