local LUA = {
    CORE =    { "src/lapi.c", "src/lcode.c", "src/lctype.c", "src/ldebug.c", "src/ldo.c", "src/ldump.c", "src/lfunc.c", "src/lgc.c", "src/llex.c", "src/lmem.c", "src/lobject.c", "src/lopcodes.c", "src/lparser.c", "src/lstate.c", "src/lstring.c", "src/ltable.c", "src/ltm.c", "src/lundump.c", "src/lvm.c", "src/lzio.c" },
    LIB =     { "src/lauxlib.c", "src/lbaselib.c", "src/lbitlib.c", "src/lcorolib.c", "src/ldblib.c", "src/liolib.c", "src/lmathlib.c", "src/loslib.c", "src/lstrlib.c", "src/ltablib.c", "src/lutf8lib.c", "src/loadlib.c", "src/linit.c" },
    LUA =     { "src/lua.c" },
    LUAC =    { "src/luac.c" }
}


local lua_os_commandline = {

	linux = "-Wl,-E"

}

local lua_os_links = {

	linux = { "dl", "readline" }

}

local lua_os_defines = {
    linux = {
        "LUA_USE_LINUX"
    },
    freebsd = {
        "LUA_USE_LINUX"
    },
    macos = {
        "LUA_USE_MACOSX"
    },
    bsd = {
        "LUA_USE_POSIX", "LUA_USE_DLOPEN"
    },
	solaris = {
		"LUA_USE_POSIX", "LUA_USE_DLOPEN", "_REENTRANT"
	}
}

solution "Lua 5.3.0"
    location "project"
    targetdir "bin"

    flags "StaticRuntime"

    configurations { "Debug", "Release" }

	links ( lua_os_links[ os.get() ] )

	buildoptions ( lua_os_commandline[ os.get() ] )

	defines ( lua_os_defines[ os.get() ] )

    configuration "Debug"
        flags "symbols"

    configuration "Release"
        optimize "On"

    project "lua"
        kind "ConsoleApp"

        files { LUA.LUA }
        links { "lua53" }

    project "luac"
        kind "ConsoleApp"

        files { LUA.LUAC }
        links { "lua53" }

    project "lua53"
        kind "StaticLib"

        files { LUA.CORE, LUA.LIB }
