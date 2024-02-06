package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end

class Types {} // blank

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_State')
extern class Lua_State {}

/*
 * Type for C functions registered with Lua.
 */
typedef Lua_CFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>) -> Int>;

/*
 * Type for functions that read blocks when loading/dumping Lua chunks.
 */
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.RawPointer<cpp.Void>, sz:cpp.RawPointer<cpp.SizeT>) -> cpp.ConstCharStar>;

/*
 * Type for functions that write blocks when loading/dumping Lua chunks.
 */
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:cpp.RawConstPointer<cpp.Void>, sz:cpp.SizeT, ud:cpp.RawPointer<cpp.Void>) -> Int>;

/*
 * Type for memory-allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.RawPointer<cpp.Void>, ptr:cpp.RawPointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.RawPointer<cpp.Void>>;

/*
 * Type of numbers in Lua.
 */
typedef Lua_Number = Float;

/*
 * Type for integer functions 
 */
typedef Lua_Integer = cpp.PtrDiffT;

/* activation record */
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
	var name:cpp.ConstCharStar; /* (n) */
	var namewhat:cpp.ConstCharStar; /* (n) "global", "local", "field", "method" */
	var what:cpp.ConstCharStar; /* (S) "Lua", "C", "main", "tail" */
	var source:cpp.ConstCharStar; /* (S) */
	var currentline:Int; /* (l) */
	var nups:Int; /* (u) number of upvalues */
	var linedefined:Int; /* (S) */
	var lastlinedefined:Int; /* (S) */
	var short_src:cpp.Char; /* (S) */
	var i_ci:Int; /* active function */
}

/*
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

	var p:cpp.CharStar; /* current position in buffer */
	var lvl:Int; /* number of strings in the stack (level) */
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

/* Low-overhead profiling API. */
typedef LuaJIT_Profile_Callback = cpp.Callable<(data:cpp.RawPointer<cpp.Void>, L:cpp.RawPointer<Lua_State>, samples:Int, vmstate:Int) -> Void>;
