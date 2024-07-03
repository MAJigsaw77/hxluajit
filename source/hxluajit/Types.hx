package hxluajit;

/**
 * Dummy class for importing LuaJIT types.
 */
#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
class Types {}

/**
 * Lua state type, representing the entire execution context of a Lua interpreter.
 */
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
 * Type for memory allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.RawPointer<cpp.Void>, ptr:cpp.RawPointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.RawPointer<cpp.Void>>;

/**
 * Type for numbers in Lua.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Number')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Number from Float to Float {}

/**
 * Type for integers in Lua.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Integer')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Integer from Int to Int {}

/**
 * Lua debug information.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('lua_Debug')
extern class Lua_Debug
{
	/**
	 * Allocates a new Lua_Debug instance.
	 *
	 * @return A new Lua_Debug instance.
	 */
	@:native('lua_Debug')
	static function alloc():Lua_Debug;

	/**
	 * Event code.
	 */
	var event:Int;

	/**
	 * Name of the current function.
	 */
	var name:cpp.ConstCharStar;

	/**
	 * Type of name ('global', 'local', etc.).
	 */
	var namewhat:cpp.ConstCharStar;

	/**
	 * Source type ('Lua', 'C', etc.).
	 */
	var what:cpp.ConstCharStar;

	/**
	 * Source of the chunk.
	 */
	var source:cpp.ConstCharStar;

	/**
	 * Current line where the call is.
	 */
	var currentline:Int;

	/**
	 * Number of upvalues.
	 */
	var nups:Int;

	/**
	 * Line where the function was defined.
	 */
	var linedefined:Int;

	/**
	 * Last line where the function was defined.
	 */
	var lastlinedefined:Int;

	/**
	 * Short description of the location.
	 */
	var short_src:cpp.CastCharStar;

	/**
	 * Instruction index.
	 */
	var i_ci:Int;
}

/**
 * Functions called by the debugger on specific events.
 */
typedef Lua_Hook = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ar:cpp.RawPointer<Lua_Debug>) -> Void>;

/**
 * Buffer for building Lua strings.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('luaL_Buffer')
extern class LuaL_Buffer
{
	/**
	 * Allocates a new LuaL_Buffer instance.
	 *
	 * @return A new LuaL_Buffer instance.
	 */
	@:native('luaL_Buffer')
	static function alloc():LuaL_Buffer;

	/**
	 * Current position in the buffer.
	 */
	var p:cpp.CastCharStar;

	/**
	 * Number of elements in the buffer.
	 */
	var lvl:Int;

	/**
	 * Lua state.
	 */
	var L:cpp.RawPointer<Lua_State>;

	/**
	 * Buffer storage.
	 */
	var buffer:cpp.Char;
}

/**
 * Structure for Lua library functions.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('luaL_Reg')
extern class LuaL_Reg
{
	/**
	 * Allocates a new LuaL_Reg instance.
	 *
	 * @return A new LuaL_Reg instance.
	 */
	@:native('luaL_Reg')
	static function alloc():LuaL_Reg;

	/**
	 * Name of the function.
	 */
	var name:cpp.ConstCharStar;

	/**
	 * Function registered with Lua.
	 */
	var func:Lua_CFunction;
}

/**
 * Low-overhead profiling API callback.
 */
typedef LuaJIT_Profile_Callback = cpp.Callable<(data:cpp.RawPointer<cpp.Void>, L:cpp.RawPointer<Lua_State>, samples:Int, vmstate:Int) -> Void>;
