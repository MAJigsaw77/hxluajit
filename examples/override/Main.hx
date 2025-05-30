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

		/* register our function */
		Lua.register(vm, "print", cpp.Function.fromStaticFunction(print));

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}

	private static function print(l:cpp.RawPointer<Lua_State>):Int
	{
		final n:Int = Lua.gettop(l);

		/* loop through each argument */
		for (i in 0...n)
			Sys.println(cast(Lua.tostring(l, i + 1), String));

		Lua.pop(l, n); /* clear the stack */

		return 0;
	}
}
