package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
class Types {}

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_State')
extern class Lua_State {}

/**
 * Type for C functions registered with Lua.
 */
typedef Lua_CFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>) -> Int>;

/**
 * Type for functions that read blocks when loading/dumping Lua chunks.
 */
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.RawPointer<cpp.Void>, sz:cpp.RawPointer<cpp.SizeT>) -> cpp.ConstCharStar>;

/**
 * Type for functions that write blocks when loading/dumping Lua chunks.
 */
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:cpp.RawConstPointer<cpp.Void>, sz:cpp.SizeT, ud:cpp.RawPointer<cpp.Void>) -> Int>;

/**
 * Type for memory-allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.RawPointer<cpp.Void>, ptr:cpp.RawPointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.RawPointer<cpp.Void>>;

/**
 * Type of numbers in Lua.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Number')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Number from Float to Float {}

/**
 * Type for integer functions
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Integer')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Integer from Int to Int {}

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('lua_Debug')
extern class Lua_Debug
{
	@:native('lua_Debug')
	static function alloc():Lua_Debug;

	var event:Int;
	var name:cpp.ConstCharStar;
	var namewhat:cpp.ConstCharStar;
	var what:cpp.ConstCharStar;
	var source:cpp.ConstCharStar;
	var currentline:Int;
	var nups:Int;
	var linedefined:Int;
	var lastlinedefined:Int;
	var short_src:cpp.CastCharStar;
	var i_ci:Int;
}

/**
 * Functions to be called by the debuger in specific events
 */
typedef Lua_Hook = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ar:cpp.RawPointer<Lua_Debug>) -> Void>;

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('luaL_Buffer')
extern class LuaL_Buffer
{
	@:native('luaL_Buffer')
	static function alloc():LuaL_Buffer;

	var p:cpp.CastCharStar;
	var lvl:Int;
	var L:cpp.RawPointer<Lua_State>;
	var buffer:cpp.Char;
}

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('luaL_Reg')
extern class LuaL_Reg
{
	@:native('luaL_Reg')
	static function alloc():LuaL_Reg;

	var name:cpp.ConstCharStar;
	var func:Lua_CFunction;
}

/**
 * Low-overhead profiling API.
 */
typedef LuaJIT_Profile_Callback = cpp.Callable<(data:cpp.RawPointer<cpp.Void>, L:cpp.RawPointer<Lua_State>, samples:Int, vmstate:Int) -> Void>;
