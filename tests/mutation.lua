
local i = 0;

local function expect(str, expect)

    return "expected "..tostring(expect).." for '"..str.."' but got "..tostring(i);

end



i += 1;

if(i ~= 1) then return false, expect("+=", 1); end


i -= 2;

if(i ~= -1) then return false, expect("-=", -1); end



i /= 2;

if(i ~= -.5) then return false, expect("/=", -.5); end



i *= -2;

if(i ~= 1) then return false, expect("*=", 1); end



i %= 1;

if(i ~= 0) then return false, expect("%=", 0); end



i |= 0xFEEF00;

if(i ~= 0xFEEF00) then return false, expect("|=", 0); end



i &= 0xF00;

if(i ~= 0xF00) then return false, expect("&=", 0xF00); end



i ^= 2;

if(i ~= 0xF00 ^ 2) then return false, expect("^=", 0xF00 ^ 2); end



i = "c";

i ..= "!!k";

if(i ~= "c!!k") then return false, expect("..=", "c!!k"); end


return true;
