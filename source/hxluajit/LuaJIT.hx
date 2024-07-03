package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

/**
 * Provides access to various properties and functionalities of LuaJIT.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class LuaJIT
{
	/**
	 * The version string of LuaJIT.
	 */
	@:native('::String(LUAJIT_VERSION)')
	static var VERSION:String;

	/**
	 * The version number of LuaJIT.
	 */
	@:native('LUA_VERSION_NUM')
	static var VERSION_NUM:Int;

	/**
	 * The copyright information of LuaJIT.
	 */
	@:native('::String(LUAJIT_COPYRIGHT)')
	static var COPYRIGHT:String;

	/**
	 * The URL pointing to LuaJIT's homepage.
	 */
	@:native('::String(LUAJIT_URL)')
	static var URL:String;

	/**
	 * Bitmask for LuaJIT mode settings.
	 */
	@:native('LUAJIT_MODE_MASK')
	static var MODE_MASK:Int;

	/**
	 * Set mode for the whole LuaJIT engine.
	 */
	@:native('LUAJIT_MODE_ENGINE')
	static var MODE_ENGINE:Int;

	/**
	 * Set debug mode (idx = level).
	 */
	@:native('LUAJIT_MODE_DEBUG')
	static var MODE_DEBUG:Int;

	/**
	 * Change mode for a function.
	 */
	@:native('LUAJIT_MODE_FUNC')
	static var MODE_FUNC:Int;

	/**
	 * Recurse into subroutine protos.
	 */
	@:native('LUAJIT_MODE_ALLFUNC')
	static var MODE_ALLFUNC:Int;

	/**
	 * Change only the subroutines.
	 */
	@:native('LUAJIT_MODE_ALLSUBFUNC')
	static var MODE_ALLSUBFUNC:Int;

	/**
	 * Flush a compiled trace.
	 */
	@:native('LUAJIT_MODE_TRACE')
	static var MODE_TRACE:Int;

	/**
	 * Set wrapper mode for C function calls.
	 */
	@:native('LUAJIT_MODE_WRAPCFUNC')
	static var MODE_WRAPCFUNC:Int;

	/**
	 * Maximum mode value.
	 */
	@:native('LUAJIT_MODE_MAX')
	static var MODE_MAX:Int;

	/**
	 * Turn feature off.
	 */
	@:native('LUAJIT_MODE_OFF')
	static var MODE_OFF:Int;

	/**
	 * Turn feature on.
	 */
	@:native('LUAJIT_MODE_ON')
	static var MODE_ON:Int;

	/**
	 * Flush JIT-compiled code.
	 */
	@:native('LUAJIT_MODE_FLUSH')
	static var MODE_FLUSH:Int;

	/**
	 * Controls the LuaJIT engine mode.
	 *
	 * @param L The Lua state.
	 * @param idx The stack index or 0.
	 * @param mode The mode to set.
	 * @return 1 on success, or 0 on failure.
	 */
	@:native('luaJIT_setmode')
	static function setmode(L:cpp.RawPointer<Lua_State>, idx:Int, mode:Int):Int;

	/**
	 * Starts profiling LuaJIT execution.
	 *
	 * @param L The Lua state.
	 * @param mode The profiling mode.
	 * @param cb The callback function for profiling.
	 * @param data Additional data to pass to the callback.
	 */
	@:native('luaJIT_profile_start')
	static function profile_start(L:cpp.RawPointer<Lua_State>, mode:cpp.ConstCharStar, cb:LuaJIT_Profile_Callback, data:cpp.RawPointer<cpp.Void>):Void;

	/**
	 * Stops profiling LuaJIT execution.
	 *
	 * @param L The Lua state.
	 */
	@:native('luaJIT_profile_stop')
	static function profile_stop(L:cpp.RawPointer<Lua_State>):Void;

	/**
	 * Dumps the LuaJIT execution stack for profiling.
	 *
	 * @param L The Lua state.
	 * @param fmt The format string.
	 * @param depth The maximum depth of the stack to dump.
	 * @param len Pointer to store the length of the dump.
	 * @return A const char pointer to the dumped stack, or null on error.
	 */
	@:native('luaJIT_profile_dumpstack')
	static function profile_dumpstack(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, depth:Int, len:cpp.Star<cpp.SizeT>):cpp.ConstCharStar;

	/**
	 * Enforces dynamic linker errors for LuaJIT version mismatches. Call from main.
	 */
	@:native('LUAJIT_VERSION_SYM')
	static function VERSION_SYM():Void;
}
