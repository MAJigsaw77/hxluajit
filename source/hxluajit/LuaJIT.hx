package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class LuaJIT
{
	@:native('::String(LUAJIT_VERSION)')
	static var VERSION:String;

	@:native('LUA_VERSION_NUM')
	static var VERSION_NUM:Int;

	@:native('::String(LUAJIT_COPYRIGHT)')
	static var COPYRIGHT:String;

	@:native('::String(LUAJIT_URL)')
	static var URL:String;

	/* Modes for luaJIT_setmode. */
	@:native('LUAJIT_MODE_MASK')
	static var MODE_MASK:Int;

	/* Set mode for whole JIT engine. */
	@:native('LUAJIT_MODE_ENGINE')
	static var MODE_ENGINE:Int;

	/* Set debug mode (idx = level). */
	@:native('LUAJIT_MODE_DEBUG')
	static var MODE_DEBUG:Int;

	/* Change mode for a function. */
	@:native('LUAJIT_MODE_FUNC')
	static var MODE_FUNC:Int;

	/* Recurse into subroutine protos. */
	@:native('LUAJIT_MODE_ALLFUNC')
	static var MODE_ALLFUNC:Int;

	/* Change only the subroutines. */
	@:native('LUAJIT_MODE_ALLSUBFUNC')
	static var MODE_ALLSUBFUNC:Int;

	/* Flush a compiled trace. */
	@:native('LUAJIT_MODE_TRACE')
	static var MODE_TRACE:Int;

	/* Set wrapper mode for C function calls. */
	@:native('LUAJIT_MODE_WRAPCFUNC')
	static var MODE_WRAPCFUNC:Int;

	@:native('LUAJIT_MODE_MAX')
	static var MODE_MAX:Int;

	/* Flags or'ed in to the mode. */

	/* Turn feature off. */
	@:native('LUAJIT_MODE_OFF')
	static var MODE_OFF:Int;

	/* Turn feature on. */
	@:native('LUAJIT_MODE_ON')
	static var MODE_ON:Int;

	/* Flush JIT-compiled code. */
	@:native('LUAJIT_MODE_FLUSH')
	static var MODE_FLUSH:Int;

	/* LuaJIT public C API. */

	/* Control the JIT engine. */
	@:native('luaJIT_setmode')
	static function setmode(L:cpp.RawPointer<Lua_State>, idx:Int, mode:Int):Int;

	@:native('luaJIT_profile_start')
	static function profile_start(L:cpp.RawPointer<Lua_State>, mode:cpp.ConstCharStar, cb:LuaJIT_Profile_Callback, data:cpp.RawPointer<cpp.Void>):Void;

	@:native('luaJIT_profile_stop')
	static function profile_stop(L:cpp.RawPointer<Lua_State>):Void;

	@:native('luaJIT_profile_dumpstack')
	static function profile_dumpstack(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, depth:Int, len:cpp.Star<cpp.SizeT>):cpp.ConstCharStar;

	/* Enforce (dynamic) linker error for version mismatches. Call from main. */
	@:native('LUAJIT_VERSION_SYM')
	static function VERSION_SYM():Void;
}
