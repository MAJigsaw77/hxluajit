package;

import hxluajit.Lua;
import hxluajit.LuaJIT;
import hxluajit.LuaL;
import hxluajit.Types;

class Main
{
	public static function main():Void
	{
		/* version info */
		Sys.println(Lua.VERSION);
		Sys.println(LuaJIT.VERSION);

		/* initialize Lua */
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		/* load Lua base libraries */
		LuaL.openlibs(vm);

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		trace('stack: ${Lua.gettop(vm)}');
		trace('num: ${Lua.tointeger(vm, 1)}');

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
