package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

/**
 * Provides static methods to open various Lua standard libraries and extensions.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class LuaOpen
{
	/**
	 * Opens the basic library (`base`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_base')
	static function base(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the mathematical library (`math`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_math')
	static function math(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the string manipulation library (`string`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_string')
	static function string(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the table manipulation library (`table`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_table')
	static function table(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the I/O library (`io`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_io')
	static function io(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the operating system library (`os`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_os')
	static function os(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the package library (`package`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_package')
	static function lpackage(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the debug library (`debug`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_debug')
	static function debug(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the bit manipulation library (`bit`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_bit')
	static function bit(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the Just-In-Time compilation library (`jit`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_jit')
	static function jit(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the Foreign Function Interface library (`ffi`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_ffi')
	static function ffi(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Opens the string buffer library (`string_buffer`) into the given Lua state.
	 *
	 * @param L The Lua state.
	 * @return The number of results pushed onto the Lua stack.
	 */
	@:native('luaopen_string_buffer')
	static function string_buffer(L:cpp.RawPointer<Lua_State>):Int;
}
