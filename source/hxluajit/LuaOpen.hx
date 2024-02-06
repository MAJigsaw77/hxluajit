package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class LuaOpen
{
	@:native('luaopen_base')
	static function base(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_math')
	static function math(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_string')
	static function string(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_table')
	static function table(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_io')
	static function io(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_os')
	static function os(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_package')
	static function lpackage(L:cpp.RawPointer<Lua_State>):Int; /* lpackage because haxe can't use `package` as function name */

	@:native('luaopen_debug')
	static function debug(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_bit')
	static function bit(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_jit')
	static function jit(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_ffi')
	static function ffi(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_string_buffer')
	static function string_buffer(L:cpp.RawPointer<Lua_State>):Int;
}
