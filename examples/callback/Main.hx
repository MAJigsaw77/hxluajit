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
		Lua.register(vm, "average", cpp.Function.fromStaticFunction(average));

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}

	private static function average(l:cpp.RawPointer<Lua_State>):Int
	{
		var sum:Float = 0.0;

		final n:Int = Lua.gettop(l);

		/* loop through each argument */
		for (i in 0...n)
		{
			if (Lua.isnumber(l, i + 1) != 1)
				LuaL.error(l, "Incorrect argument to 'average'");

			/* total the arguments */
			sum += Lua.tonumber(l, i + 1);
		}

		Lua.pop(l, n); /* clear the stack */

		Lua.pushnumber(l, sum / n); /* push the average */
		Lua.pushnumber(l, sum); /* push the sum */

		return 2; /* return the number of results */
	}
}
