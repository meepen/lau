local LUA = {
	CORE = 	{ "src/lapi.c", "src/lcode.c", "src/lctype.c", "src/ldebug.c", "src/ldo.c", "src/ldump.c", "src/lfunc.c", "src/lgc.c", "src/llex.c", "src/lmem.c", "src/lobject.c", "src/lopcodes.c", "src/lparser.c", "src/lstate.c", "src/lstring.c", "src/ltable.c", "src/ltm.c", "src/lundump.c", "src/lvm.c", "src/lzio.c" },
	LIB = 	{ "src/lauxlib.c", "src/lbaselib.c", "src/lbitlib.c", "src/lcorolib.c", "src/ldblib.c", "src/liolib.c", "src/lmathlib.c", "src/loslib.c", "src/lstrlib.c", "src/ltablib.c", "src/lutf8lib.c", "src/loadlib.c", "src/linit.c" },
	LUA = 	{ "src/lua.c" },
	LUAC = 	{ "src/luac.c" }
}

solution "Lua 5.3.0"
	location "project"
	targetdir "bin"

	flags "StaticRuntime"

	configurations { "Debug", "Release" }

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
