
local function ansicolor(name, sgr)

    if(package.cpath:match(";%.%"..package.config:sub(1,1).."%?%.([^;]+)") == "so") then

        if(name == "reset") then return "\x1b[0m"; end

        local sgrs = {
            blink = 35,
        }

        local colors = {
            red = 31,
            green = 32,
        }


        return "\x1B["..(sgr and tostring(sgrs[sgr])..";" or ";")..colors[name].."m";

    end

    return "";
end

local function format(file, success, id, msg)

    return (success and ansicolor"green".."SUCCEEDED"..ansicolor"reset" or ansicolor"red".."!FAILED!!"..ansicolor"reset")..": file '"..file.."' ".."".."@"..id..(msg and " '"..msg.."'" or "");

end

local function try(file)

    local f, e = loadfile(file);

    print( format(file, f, "compile", e) )

    if(f) then

        local rets = table.pack(pcall(f))

        print( format(file, rets[2], "run", rets[3]) )

    end

end


try "maybemaybe.lua"
try "maybeif.lua"

try "binarynotation.lua"

try "descend.lua"
try "ascend.lua"

try "mutation.lua"

try "parenthesislesscalls.lua"

try "ternary.lua"
