package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

/**
 * Provides bindings to Lua's auxiliary library functions.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class LuaL
{
	/**
	 * Opens a library.
	 *
	 * @param L The Lua state.
	 * @param libname The name of the library.
	 * @param l The array of library functions.
	 * @param nup The number of upvalues.
	 */
	@:native('luaL_openlib')
	static function openlib(L:cpp.RawPointer<Lua_State>, libname:cpp.ConstCharStar, l:cpp.RawConstPointer<LuaL_Reg>, nup:Int):Void;

	/**
	 * Registers a library.
	 *
	 * @param L The Lua state.
	 * @param libname The name of the library.
	 * @param l The array of library functions.
	 */
	@:native('luaL_register')
	static function register(L:cpp.RawPointer<Lua_State>, libname:cpp.ConstCharStar, l:cpp.RawConstPointer<LuaL_Reg>):Void;

	/**
	 * Gets a metafield.
	 *
	 * @param L The Lua state.
	 * @param obj The index of the object.
	 * @param e The metafield name.
	 * @return The type of the metafield.
	 */
	@:native('luaL_getmetafield')
	static function getmetafield(L:cpp.RawPointer<Lua_State>, obj:Int, e:cpp.ConstCharStar):Int;

	/**
	 * Calls a metamethod.
	 *
	 * @param L The Lua state.
	 * @param obj The index of the object.
	 * @param e The metamethod name.
	 * @return The result of the metamethod call.
	 */
	@:native('luaL_callmeta')
	static function callmeta(L:cpp.RawPointer<Lua_State>, obj:Int, e:cpp.ConstCharStar):Int;

	/**
	 * Raises a type error.
	 *
	 * @param L The Lua state.
	 * @param narg The argument index.
	 * @param tname The expected type name.
	 * @return The error code.
	 */
	@:native('luaL_typeerror')
	static function typeerror(L:cpp.RawPointer<Lua_State>, narg:Int, tname:cpp.ConstCharStar):Int;

	/**
	 * Raises an argument error.
	 *
	 * @param L The Lua state.
	 * @param numarg The argument index.
	 * @param extramsg The error message.
	 * @return The error code.
	 */
	@:native('luaL_argerror')
	static function argerror(L:cpp.RawPointer<Lua_State>, numarg:Int, extramsg:cpp.ConstCharStar):Int;

	/**
	 * Checks and returns a string argument.
	 *
	 * @param L The Lua state.
	 * @param numArg The argument index.
	 * @param l A pointer to store the string length.
	 * @return The string.
	 */
	@:native('luaL_checklstring')
	static function checklstring(L:cpp.RawPointer<Lua_State>, numArg:Int, l:cpp.Star<cpp.SizeT>):cpp.ConstCharStar;

	/**
	 * Returns an optional string argument.
	 *
	 * @param L The Lua state.
	 * @param numArg The argument index.
	 * @param def The default string.
	 * @param l A pointer to store the string length.
	 * @return The string.
	 */
	@:native('luaL_optlstring')
	static function optlstring(L:cpp.RawPointer<Lua_State>, numArg:Int, def:cpp.ConstCharStar, l:cpp.Star<cpp.SizeT>):cpp.ConstCharStar;

	/**
	 * Checks and returns a number argument.
	 *
	 * @param L The Lua state.
	 * @param numArg The argument index.
	 * @return The number.
	 */
	@:native('luaL_checknumber')
	static function checknumber(L:cpp.RawPointer<Lua_State>, numArg:Int):Lua_Number;

	/**
	 * Returns an optional number argument.
	 *
	 * @param L The Lua state.
	 * @param nArg The argument index.
	 * @param def The default number.
	 * @return The number.
	 */
	@:native('luaL_optnumber')
	static function optnumber(L:cpp.RawPointer<Lua_State>, nArg:Int, def:Lua_Number):Lua_Number;

	/**
	 * Checks and returns an integer argument.
	 *
	 * @param L The Lua state.
	 * @param numArg The argument index.
	 * @return The integer.
	 */
	@:native('luaL_checkinteger')
	static function checkinteger(L:cpp.RawPointer<Lua_State>, numArg:Int):Lua_Integer;

	/**
	 * Returns an optional integer argument.
	 *
	 * @param L The Lua state.
	 * @param nArg The argument index.
	 * @param def The default integer.
	 * @return The integer.
	 */
	@:native('luaL_optinteger')
	static function optinteger(L:cpp.RawPointer<Lua_State>, nArg:Int, def:Lua_Integer):Lua_Integer;

	/**
	 * Checks the Lua stack space.
	 *
	 * @param L The Lua state.
	 * @param sz The required space.
	 * @param msg The error message.
	 */
	@:native('luaL_checkstack')
	static function checkstack(L:cpp.RawPointer<Lua_State>, sz:Int, msg:cpp.ConstCharStar):Void;

	/**
	 * Checks the type of an argument.
	 *
	 * @param L The Lua state.
	 * @param narg The argument index.
	 * @param t The expected type.
	 */
	@:native('luaL_checktype')
	static function checktype(L:cpp.RawPointer<Lua_State>, narg:Int, t:Int):Void;

	/**
	 * Checks if an argument is present.
	 *
	 * @param L The Lua state.
	 * @param narg The argument index.
	 */
	@:native('luaL_checkany')
	static function checkany(L:cpp.RawPointer<Lua_State>, narg:Int):Void;

	/**
	 * Creates a new metatable.
	 *
	 * @param L The Lua state.
	 * @param tname The name of the metatable.
	 * @return 1 if the metatable was created, 0 if it already exists.
	 */
	@:native('luaL_newmetatable')
	static function newmetatable(L:cpp.RawPointer<Lua_State>, tname:cpp.ConstCharStar):Int;

	/**
	 * Checks if a userdata has a specific metatable.
	 *
	 * @param L The Lua state.
	 * @param ud The index of the userdata.
	 * @param tname The name of the metatable.
	 * @return A pointer to the userdata.
	 */
	@:native('luaL_checkudata')
	static function checkudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:cpp.ConstCharStar):cpp.RawPointer<cpp.Void>;

	/**
	 * Appends a location to the error message.
	 *
	 * @param L The Lua state.
	 * @param lvl The stack level.
	 */
	@:native('luaL_where')
	static function where(L:cpp.RawPointer<Lua_State>, lvl:Int):Void;

	/**
	 * Raises an error.
	 *
	 * @param L The Lua state.
	 * @param fmt The format string.
	 * @param args The arguments.
	 * @return The error code.
	 */
	@:native('luaL_error')
	static function error(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, args:cpp.Rest<cpp.VarArg>):Int;

	/**
	 * Checks an option argument.
	 *
	 * @param L The Lua state.
	 * @param narg The argument index.
	 * @param def The default option.
	 * @param lst The list of options.
	 * @return The index of the option.
	 */
	@:native('luaL_checkoption')
	static function checkoption(L:cpp.RawPointer<Lua_State>, narg:Int, def:cpp.ConstCharStar, lst:cpp.ConstCharStar):Int;

	/**
	 * No reference constant.
	 */
	@:native('LUA_NOREF')
	static var NOREF:Int;

	/**
	 * Nil reference constant.
	 */
	@:native('LUA_REFNIL')
	static var LUA_REFNIL:Int;

	/**
	 * Creates a reference to a value.
	 *
	 * @param L The Lua state.
	 * @param t The index of the table.
	 * @return The reference index.
	 */
	@:native('luaL_ref')
	static function ref(L:cpp.RawPointer<Lua_State>, t:Int):Int;

	/**
	 * Releases a reference.
	 *
	 * @param L The Lua state.
	 * @param t The index of the table.
	 * @param ref The reference index.
	 */
	@:native('luaL_unref')
	static function unref(L:cpp.RawPointer<Lua_State>, t:Int, ref:Int):Void;

	/**
	 * Loads a file.
	 *
	 * @param L The Lua state.
	 * @param filename The name of the file to load.
	 * @return The result of the load operation.
	 */
	@:native('luaL_loadfile')
	static function loadfile(L:cpp.RawPointer<Lua_State>, filename:cpp.ConstCharStar):Int;

	/**
	 * Loads a buffer.
	 *
	 * @param L The Lua state.
	 * @param buff The buffer to load.
	 * @param sz The size of the buffer.
	 * @param name The name of the buffer.
	 * @return The result of the load operation.
	 */
	@:native('luaL_loadbuffer')
	static function loadbuffer(L:cpp.RawPointer<Lua_State>, buff:cpp.ConstCharStar, sz:cpp.SizeT, name:cpp.ConstCharStar):Int;

	/**
	 * Loads a string.
	 *
	 * @param L The Lua state.
	 * @param s The string to load.
	 * @return The result of the load operation.
	 */
	@:native('luaL_loadstring')
	static function loadstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Int;

	/**
	 * Creates a new Lua state.
	 *
	 * @return A pointer to the new Lua state.
	 */
	@:native('luaL_newstate')
	static function newstate():cpp.RawPointer<Lua_State>;

	/**
	 * Performs a string substitution.
	 *
	 * @param L The Lua state.
	 * @param s The original string.
	 * @param p The pattern to match.
	 * @param r The replacement string.
	 * @return The result string.
	 */
	@:native('luaL_gsub')
	static function gsub(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, p:cpp.ConstCharStar, r:cpp.ConstCharStar):cpp.ConstCharStar;

	/**
	 * Finds a table in the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The stack index.
	 * @param fname The name of the table.
	 * @param szhint The size hint.
	 * @return The result string.
	 */
	@:native('luaL_findtable')
	static function findtable(L:cpp.RawPointer<Lua_State>, idx:Int, fname:cpp.ConstCharStar, szhint:Int):cpp.ConstCharStar;

	/**
	 * Reports the result of a file operation.
	 *
	 * @param L The Lua state.
	 * @param stat The status of the operation.
	 * @param fname The name of the file.
	 * @return The result of the operation.
	 */
	@:native('luaL_fileresult')
	static function fileresult(L:cpp.RawPointer<Lua_State>, stat:Int, fname:cpp.ConstCharStar):Int;

	/**
	 * Reports the result of an execution operation.
	 *
	 * @param L The Lua state.
	 * @param stat The status of the operation.
	 * @return The result of the operation.
	 */
	@:native('luaL_execresult')
	static function execresult(L:cpp.RawPointer<Lua_State>, stat:Int):Int;

	/**
	 * Loads a file with a specified mode.
	 *
	 * @param L The Lua state.
	 * @param filename The name of the file.
	 * @param mode The mode to use.
	 * @return The result of the load operation.
	 */
	@:native('luaL_loadfilex')
	static function loadfilex(L:cpp.RawPointer<Lua_State>, filename:cpp.ConstCharStar, mode:cpp.ConstCharStar):Int;

	/**
	 * Loads a buffer with a specified mode.
	 *
	 * @param L The Lua state.
	 * @param buff The buffer to load.
	 * @param sz The size of the buffer.
	 * @param name The name of the buffer.
	 * @param mode The mode to use.
	 * @return The result of the load operation.
	 */
	@:native('luaL_loadbufferx')
	static function loadbufferx(L:cpp.RawPointer<Lua_State>, buff:cpp.ConstCharStar, sz:cpp.SizeT, name:cpp.ConstCharStar, mode:cpp.ConstCharStar):Int;

	/**
	 * Generates a traceback.
	 *
	 * @param L The Lua state.
	 * @param L1 Another Lua state.
	 * @param msg The error message.
	 * @param level The stack level.
	 */
	@:native('luaL_traceback')
	static function traceback(L:cpp.RawPointer<Lua_State>, L1:cpp.RawPointer<Lua_State>, msg:cpp.ConstCharStar, level:Int):Void;

	/**
	 * Registers functions.
	 *
	 * @param L The Lua state.
	 * @param l The array of functions.
	 * @param nup The number of upvalues.
	 */
	@:native('luaL_setfuncs')
	static function setfuncs(L:cpp.RawPointer<Lua_State>, l:cpp.RawConstPointer<LuaL_Reg>, nup:Int):Void;

	/**
	 * Pushes a module onto the stack.
	 *
	 * @param L The Lua state.
	 * @param modname The name of the module.
	 * @param sizehint The size hint.
	 */
	@:native('luaL_pushmodule')
	static function pushmodule(L:cpp.RawPointer<Lua_State>, modname:cpp.ConstCharStar, sizehint:Int):Void;

	/**
	 * Tests userdata.
	 *
	 * @param L The Lua state.
	 * @param ud The index of the userdata.
	 * @param tname The name of the metatable.
	 * @return A pointer to the userdata.
	 */
	@:native('luaL_testudata')
	static function testudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:cpp.ConstCharStar):cpp.RawPointer<cpp.Void>;

	/**
	 * Sets a metatable.
	 *
	 * @param L The Lua state.
	 * @param tname The name of the metatable.
	 */
	@:native('luaL_setmetatable')
	static function setmetatable(L:cpp.RawPointer<Lua_State>, tname:cpp.ConstCharStar):Void;

	/**
	 * Checks an argument condition.
	 *
	 * @param L The Lua state.
	 * @param cond The condition.
	 * @param numarg The argument index.
	 * @param extramsg The error message.
	 */
	@:native('luaL_argcheck')
	static function argcheck(L:cpp.RawPointer<Lua_State>, cond:Int, numarg:Int, extramsg:cpp.ConstCharStar):Void;

	/**
	 * Checks and returns a string argument.
	 *
	 * @param L The Lua state.
	 * @param n The argument index.
	 * @return The string.
	 */
	@:native('luaL_checkstring')
	static function checkstring(L:cpp.RawPointer<Lua_State>, n:Int):cpp.ConstCharStar;

	/**
	 * Returns an optional string argument.
	 *
	 * @param L The Lua state.
	 * @param n The argument index.
	 * @param d The default string.
	 * @return The string.
	 */
	@:native('luaL_optstring')
	static function optstring(L:cpp.RawPointer<Lua_State>, n:Int, d:cpp.ConstCharStar):cpp.ConstCharStar;

	/**
	 * Checks and returns an integer argument.
	 *
	 * @param L The Lua state.
	 * @param n The argument index.
	 * @return The integer.
	 */
	@:native('luaL_checkint')
	static function checkint(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	/**
	 * Returns an optional integer argument.
	 *
	 * @param L The Lua state.
	 * @param n The argument index.
	 * @param d The default integer.
	 * @return The integer.
	 */
	@:native('luaL_optint')
	static function optint(L:cpp.RawPointer<Lua_State>, n:Int, d:Lua_Integer):Int;

	/**
	 * Checks and returns a long argument.
	 *
	 * @param L The Lua state.
	 * @param n The argument index.
	 * @return The long.
	 */
	@:native('luaL_checklong')
	static function checklong(L:cpp.RawPointer<Lua_State>, n:Int):cpp.Long;

	/**
	 * Returns an optional long argument.
	 *
	 * @param L The Lua state.
	 * @param n The argument index.
	 * @param d The default long.
	 * @return The long.
	 */
	@:native('luaL_optlong')
	static function optlong(L:cpp.RawPointer<Lua_State>, n:Int, d:Lua_Integer):cpp.Long;

	/**
	 * Returns the type name of an argument.
	 *
	 * @param L The Lua state.
	 * @param index The stack index.
	 * @return The type name.
	 */
	@:native('luaL_typename')
	static function typename(L:cpp.RawPointer<Lua_State>, index:Int):cpp.ConstCharStar;

	/**
	 * Executes a file.
	 *
	 * @param L The Lua state.
	 * @param filename The name of the file.
	 * @return The result of the execution.
	 */
	@:native('luaL_dofile')
	static function dofile(L:cpp.RawPointer<Lua_State>, filename:cpp.ConstCharStar):Int;

	/**
	 * Executes a string.
	 *
	 * @param L The Lua state.
	 * @paramstr The string to execute.
	 * @return The result of the execution.
	 */
	@:native('luaL_dostring')
	static function dostring(L:cpp.RawPointer<Lua_State>, str:cpp.ConstCharStar):Int;

	/**
	 * Gets the metatable for a name.
	 *
	 * @param L The Lua state.
	 * @param tname The name of the metatable.
	 * @return The result of the operation.
	 */
	@:native('luaL_getmetatable')
	static function getmetatable(L:cpp.RawPointer<Lua_State>, tname:cpp.ConstCharStar):Int;

	/**
	 * Creates a new library table.
	 *
	 * @param L The Lua state.
	 * @param l The library registration array.
	 */
	@:native('luaL_newlibtable')
	static function newlibtable(L:cpp.RawPointer<Lua_State>, l:LuaL_Reg):Void;

	/**
	 * Creates a new library.
	 *
	 * @param L The Lua state.
	 * @param l The library registration array.
	 */
	@:native('luaL_newlib')
	static function newlib(L:cpp.RawPointer<Lua_State>, l:LuaL_Reg):Void;

	/**
	 * Adds a character to a buffer.
	 *
	 * @param B The buffer.
	 * @param c The character to add.
	 */
	@:native('luaL_addchar')
	static function addchar(B:cpp.RawPointer<LuaL_Buffer>, c:cpp.Char):Void;

	/**
	 * Adds a character to a buffer (alternative name).
	 *
	 * @param B The buffer.
	 * @param c The character to add.
	 */
	@:native('luaL_putchar')
	static function putchar(B:cpp.RawPointer<LuaL_Buffer>, c:cpp.Char):Void;

	/**
	 * Adds a size to a buffer.
	 *
	 * @param B The buffer.
	 * @param n The size to add.
	 */
	@:native('luaL_addsize')
	static function addsize(B:cpp.RawPointer<LuaL_Buffer>, n:Int):Void;

	/**
	 * Initializes a buffer.
	 *
	 * @param L The Lua state.
	 * @param B The buffer.
	 */
	@:native('luaL_buffinit')
	static function buffinit(L:cpp.RawPointer<Lua_State>, B:cpp.RawPointer<LuaL_Buffer>):Void;

	/**
	 * Prepares a buffer size.
	 *
	 * @param B The buffer.
	 * @param sz The size to prepare.
	 * @return A pointer to the prepared buffer.
	 */
	@:native('luaL_prepbuffsize')
	static function prepbuffsize(B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):cpp.CastCharStar;

	/**
	 * Adds a string of specified length to a buffer.
	 *
	 * @param B The buffer.
	 * @param s The string to add.
	 * @param l The length of the string.
	 */
	@:native('luaL_addlstring')
	static function addlstring(B:cpp.RawPointer<LuaL_Buffer>, s:cpp.ConstCharStar, l:cpp.SizeT):Void;

	/**
	 * Adds a string to a buffer.
	 *
	 * @param B The buffer.
	 * @param s The string to add.
	 */
	@:native('luaL_addstring')
	static function addstring(B:cpp.RawPointer<LuaL_Buffer>, s:cpp.ConstCharStar):Void;

	/**
	 * Adds a value from the stack to a buffer.
	 *
	 * @param B The buffer.
	 */
	@:native('luaL_addvalue')
	static function addvalue(B:cpp.RawPointer<LuaL_Buffer>):Void;

	/**
	 * Pushes the result of a buffer to the stack.
	 *
	 * @param B The buffer.
	 */
	@:native('luaL_pushresult')
	static function pushresult(B:cpp.RawPointer<LuaL_Buffer>):Void;

	/**
	 * Opens all standard Lua libraries.
	 *
	 * @param L The Lua state.
	 * @return The result of the operation.
	 */
	@:native('luaL_openlibs')
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
