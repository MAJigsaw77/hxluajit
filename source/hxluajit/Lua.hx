package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

/**
 * Provides access to various properties and functionalities of Lua.
 */
@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class Lua
{
	/**
	 * The version string of Lua.
	 */
	@:native('::String(LUA_VERSION)')
	static var VERSION:String;

	/**
	 * The release string of Lua.
	 */
	@:native('::String(LUA_RELEASE)')
	static var RELEASE:String;

	/**
	 * The version number of Lua.
	 */
	@:native('LUA_VERSION_NUM')
	static var VERSION_NUM:Int;

	/**
	 * The copyright information of Lua.
	 */
	@:native('::String(LUA_COPYRIGHT)')
	static var COPYRIGHT:String;

	/**
	 * The authors of Lua.
	 */
	@:native('::String(LUA_AUTHORS)')
	static var AUTHORS:String;

	/**
	 * The signature of Lua.
	 */
	@:native('::String(LUA_SIGNATURE)')
	static var SIGNATURE:String;

	/**
	 * Return multiple results.
	 */
	@:native('LUA_MULTRET')
	static var MULTRET:Int;

	/**
	 * Registry index.
	 */
	@:native('LUA_REGISTRYINDEX')
	static var REGISTRYINDEX:Int;

	/**
	 * Environment index.
	 */
	@:native('LUA_ENVIRONINDEX')
	static var ENVIRONINDEX:Int;

	/**
	 * Globals index.
	 */
	@:native('LUA_GLOBALSINDEX')
	static var GLOBALSINDEX:Int;

	/**
	 * Get the upvalue index.
	 *
	 * @param i The upvalue index.
	 * @return The index of the upvalue.
	 */
	@:native('lua_upvalueindex')
	static function upvalueindex(i:Int):Int;

	/**
	 * Status code for success.
	 */
	@:native('LUA_OK')
	static var OK:Int;

	/**
	 * Status code for a yield.
	 */
	@:native('LUA_YIELD')
	static var YIELD:Int;

	/**
	 * Status code for a runtime error.
	 */
	@:native('LUA_ERRRUN')
	static var ERRRUN:Int;

	/**
	 * Status code for a syntax error.
	 */
	@:native('LUA_ERRSYNTAX')
	static var ERRSYNTAX:Int;

	/**
	 * Status code for a memory allocation error.
	 */
	@:native('LUA_ERRMEM')
	static var ERRMEM:Int;

	/**
	 * Status code for an error handling error.
	 */
	@:native('LUA_ERRERR')
	static var ERRERR:Int;

	/**
	 * Status code for a file error.
	 */
	@:native('LUA_ERRFILE')
	static var ERRFILE:Int;

	/**
	 * Type for no type.
	 */
	@:native('LUA_TNONE')
	static var TNONE:Int;

	/**
	 * Type for nil.
	 */
	@:native('LUA_TNIL')
	static var TNIL:Int;

	/**
	 * Type for boolean.
	 */
	@:native('LUA_TBOOLEAN')
	static var TBOOLEAN:Int;

	/**
	 * Type for light userdata.
	 */
	@:native('LUA_TLIGHTUSERDATA')
	static var TLIGHTUSERDATA:Int;

	/**
	 * Type for number.
	 */
	@:native('LUA_TNUMBER')
	static var TNUMBER:Int;

	/**
	 * Type for string.
	 */
	@:native('LUA_TSTRING')
	static var TSTRING:Int;

	/**
	 * Type for table.
	 */
	@:native('LUA_TTABLE')
	static var TTABLE:Int;

	/**
	 * Type for function.
	 */
	@:native('LUA_TFUNCTION')
	static var TFUNCTION:Int;

	/**
	 * Type for userdata.
	 */
	@:native('LUA_TUSERDATA')
	static var TUSERDATA:Int;

	/**
	 * Type for thread.
	 */
	@:native('LUA_TTHREAD')
	static var TTHREAD:Int;

	/**
	 * Minimum stack size.
	 */
	@:native('LUA_MINSTACK')
	static var MINSTACK:Int;

	/**
	 * Maximum captures.
	 */
	@:native('LUA_MAXCAPTURES')
	static var MAXCAPTURES:Int;

	/**
	 * Maximum ID size.
	 */
	@:native('LUA_IDSIZE')
	static var IDSIZE:Int;

	/**
	 * Create a new Lua state.
	 *
	 * @param f The memory allocator function.
	 * @param ud User data to be passed to the allocator function.
	 * @return The new Lua state.
	 */
	@:native('lua_newstate')
	static function newstate(f:Lua_Alloc, ud:cpp.RawPointer<cpp.Void>):cpp.RawPointer<Lua_State>;

	/**
	 * Close a Lua state.
	 *
	 * @param L The Lua state to close.
	 */
	@:native('lua_close')
	static function close(L:cpp.RawPointer<Lua_State>):Void;

	/**
	 * Create a new thread.
	 *
	 * @param L The Lua state.
	 * @return The new thread state.
	 */
	@:native('lua_newthread')
	static function newthread(L:cpp.RawPointer<Lua_State>):cpp.RawPointer<Lua_State>;

	/**
	 * Set a panic function.
	 *
	 * @param L The Lua state.
	 * @param panicf The panic function.
	 * @return The old panic function.
	 */
	@:native('lua_atpanic')
	static function atpanic(L:cpp.RawPointer<Lua_State>, panicf:Lua_CFunction):Lua_CFunction;

	/**
	 * Get the top index of the stack.
	 *
	 * @param L The Lua state.
	 * @return The top index of the stack.
	 */
	@:native('lua_gettop')
	static function gettop(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Set the top index of the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The new top index.
	 */
	@:native('lua_settop')
	static function settop(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Push a value onto the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value to push.
	 */
	@:native('lua_pushvalue')
	static function pushvalue(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Remove a value from the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value to remove.
	 */
	@:native('lua_remove')
	static function remove(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Insert a value into the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The index where the value should be inserted.
	 */
	@:native('lua_insert')
	static function insert(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Replace a value in the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value to replace.
	 */
	@:native('lua_replace')
	static function replace(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Check the stack size.
	 *
	 * @param L The Lua state.
	 * @param sz The stack size to check.
	 * @return 1 if successful, 0 otherwise.
	 */
	@:native('lua_checkstack')
	static function checkstack(L:cpp.RawPointer<Lua_State>, sz:Int):Int;

	/**
	 * Move values between Lua states.
	 *
	 * @param from The source Lua state.
	 * @param to The destination Lua state.
	 * @param n The number of values to move.
	 */
	@:native('lua_xmove')
	static function xmove(from:cpp.RawPointer<Lua_State>, to:cpp.RawPointer<Lua_State>, n:Int):Void;

	/**
	 * Check if a value is a number.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value to check.
	 * @return 1 if the value is a number, 0 otherwise.
	 */
	@:native('lua_isnumber')
	static function isnumber(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Check if a value is a string.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value to check.
	 * @return 1 if the value is a string, 0 otherwise.
	 */
	@:native('lua_isstring')
	static function isstring(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Check if a value is a C function.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value to check.
	 * @return 1 if the value is a C function, 0 otherwise.
	 */
	@:native('lua_iscfunction')
	static function iscfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
		* Check if a value is userdata.
		*
		* @param L The Lua state.
		* @param idx The index of the value to check.
		* @return 1 if the value is userdata, 0 otherwise.
		@:native('lua_isuserdata')
		static function isuserdata(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

		/**
		* Get the type of a value.
		*
		* @param L The Lua state.
		* @param idx The index of the value.
		* @return The type of the value.
	 */
	@:native('lua_type')
	static function type(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Get the name of a type.
	 *
	 * @param L The Lua state.
	 * @param tp The type.
	 * @return The name of the type.
	 */
	@:native('lua_typename')
	static function typename(L:cpp.RawPointer<Lua_State>, tp:Int):cpp.ConstCharStar;

	/**
	 * Check if two values are equal.
	 *
	 * @param L The Lua state.
	 * @param idx1 The index of the first value.
	 * @param idx2 The index of the second value.
	 * @return 1 if equal, 0 otherwise.
	 */
	@:native('lua_equal')
	static function equal(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	/**
	 * Check if two values are raw equal.
	 *
	 * @param L The Lua state.
	 * @param idx1 The index of the first value.
	 * @param idx2 The index of the second value.
	 * @return 1 if raw equal, 0 otherwise.
	 */
	@:native('lua_rawequal')
	static function rawequal(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	/**
	 * Check if one value is less than another.
	 *
	 * @param L The Lua state.
	 * @param idx1 The index of the first value.
	 * @param idx2 The index of the second value.
	 * @return 1 if less than, 0 otherwise.
	 */
	@:native('lua_lessthan')
	static function lessthan(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	/**
	 * Convert a value to a number.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The number.
	 */
	@:native('lua_tonumber')
	static function tonumber(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_Number;

	/**
	 * Convert a value to an integer.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The integer.
	 */
	@:native('lua_tointeger')
	static function tointeger(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_Integer;

	/**
	 * Convert a value to a boolean.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The boolean.
	 */
	@:native('lua_toboolean')
	static function toboolean(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Convert a value to a string.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @param len The length of the string.
	 * @return The string.
	 */
	@:native('lua_tolstring')
	static function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Star<cpp.SizeT>):cpp.ConstCharStar;

	/**
	 * Get the length of an object.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the object.
	 * @return The length.
	 */
	@:native('lua_objlen')
	static function objlen(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.SizeT;

	/**
	 * Convert a value to a C function.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The C function.
	 */
	@:native('lua_tocfunction')
	static function tocfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_CFunction;

	/**
	 * Convert a value to userdata.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The userdata.
	 */
	@:native('lua_touserdata')
	static function touserdata(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawPointer<cpp.Void>;

	/**
	 * Convert a value to a thread.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The thread.
	 */
	@:native('lua_tothread')
	static function tothread(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawPointer<Lua_State>;

	/**
	 * Convert a value to a pointer.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the value.
	 * @return The pointer.
	 */
	@:native('lua_topointer')
	static function topointer(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawConstPointer<cpp.Void>;

	/**
	 * Push a nil value onto the stack.
	 *
	 * @param L The Lua state.
	 */
	@:native('lua_pushnil')
	static function pushnil(L:cpp.RawPointer<Lua_State>):Void;

	/**
	 * Push a number onto the stack.
	 *
	 * @param L The Lua state.
	 * @param n The number to push.
	 */
	@:native('lua_pushnumber')
	static function pushnumber(L:cpp.RawPointer<Lua_State>, n:Lua_Number):Void;

	/**
	 * Push an integer onto the stack.
	 *
	 * @param L The Lua state.
	 * @param n The integer to push.
	 */
	@:native('lua_pushinteger')
	static function pushinteger(L:cpp.RawPointer<Lua_State>, n:Lua_Integer):Void;

	/**
	 * Push a string onto the stack.
	 *
	 * @param L The Lua state.
	 * @param s The string to push.
	 * @param len The length of the string.
	 */
	@:native('lua_pushlstring')
	static function pushlstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, len:cpp.SizeT):Void;

	/**
	 * Push a string onto the stack.
	 *
	 * @param L The Lua state.
	 * @param s The string to push.
	 */
	@:native('lua_pushstring')
	static function pushstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Void;

	/**
	 * Push a formatted string onto the stack.
	 *
	 * @param L The Lua state.
	 * @param s The format string.
	 * @param argp The arguments for the format string.
	 */
	@:native('lua_pushvfstring')
	static function pushvfstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, argp:cpp.VarList):Void;

	/**
	 * Push a formatted string onto the stack.
	 *
	 * @param L The Lua state.
	 * @param fmt The format string.
	 * @param args The arguments for the format string.
	 * @return The formatted string.
	 */
	@:native('lua_pushfstring')
	static function pushfstring(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, args:cpp.Rest<cpp.VarArg>):cpp.ConstCharStar;

	/**
	 * Push a C closure onto the stack.
	 *
	 * @param L The Lua state.
	 * @param fn The C function.
	 * @param n The number of upvalues.
	 */
	@:native('lua_pushcclosure')
	static function pushcclosure(L:cpp.RawPointer<Lua_State>, fn:Lua_CFunction, n:Int):Void;

	/**
	 * Push a boolean onto the stack.
	 *
	 * @param L The Lua state.
	 * @param b The boolean to push.
	 */
	@:native('lua_pushboolean')
	static function pushboolean(L:cpp.RawPointer<Lua_State>, b:Int):Void;

	/**
	 * Push light userdata onto the stack.
	 *
	 * @param L The Lua state.
	 * @param p The light userdata to push.
	 */
	@:native('lua_pushlightuserdata')
	static function pushlightuserdata(L:cpp.RawPointer<Lua_State>, p:cpp.RawPointer<cpp.Void>):Void;

	/**
	 * Push the thread onto the stack.
	 *
	 * @param L The Lua state.
	 * @return 1 if the thread is the main thread, 0 otherwise.
	 */
	@:native('lua_pushthread')
	static function pushthread(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Get a table from the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 * @return The result of the operation.
	 */
	@:native('lua_gettable')
	static function gettable(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Get a field from a table.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 * @param k The key of the field to get.
	 * @return The result of the operation.
	 */
	@:native('lua_getfield')
	static function getfield(L:cpp.RawPointer<Lua_State>, idx:Int, k:cpp.ConstCharStar):Int;

	/**
	 * Raw get a table.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 */
	@:native('lua_rawget')
	static function rawget(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Raw get a field from a table.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 * @param n The key of the field to get.
	 */
	@:native('lua_rawgeti')
	static function rawgeti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Void;

	/**
	 * Create a new table and push it onto the stack.
	 *
	 * @param L The Lua state.
	 * @param narr The number of array elements.
	 * @param nrec The number of non-array elements.
	 */
	@:native('lua_createtable')
	static function createtable(L:cpp.RawPointer<Lua_State>, narr:Int, nrec:Int):Void;

	/**
	 * Create a new userdata object.
	 *
	 * @param L The Lua state.
	 * @param size The size of the userdata object.
	 * @return A pointer to the new userdata object.
	 */
	@:native('lua_newuserdata')
	static function newuserdata(L:cpp.RawPointer<Lua_State>, size:cpp.SizeT):cpp.RawPointer<cpp.Void>;

	/**
	 * Get the metatable of a value.
	 *
	 * @param L The Lua state.
	 * @param objindex The index of the value.
	 * @return 1 if the value has a metatable, 0 otherwise.
	 */
	@:native('lua_getmetatable')
	static function getmetatable(L:cpp.RawPointer<Lua_State>, objindex:Int):Int;

	/**
	 * Get the environment of a function.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the function.
	 * @return The result of the operation.
	 */
	@:native('lua_getfenv')
	static function getfenv(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Set a table on the stack.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 */
	@:native('lua_settable')
	static function settable(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Set a field in a table.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 * @param k The key of the field to set.
	 */
	@:native('lua_setfield')
	static function setfield(L:cpp.RawPointer<Lua_State>, idx:Int, k:cpp.ConstCharStar):Void;

	/**
	 * Raw set a table.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 */
	@:native('lua_rawset')
	static function rawset(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	/**
	 * Raw set a field in a table.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the table.
	 * @param n The key of the field to set.
	 */
	@:native('lua_rawseti')
	static function rawseti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Void;

	/**
	 * Set the metatable of a value.
	 *
	 * @param L The Lua state.
	 * @param objindex The index of the value.
	 * @return 1 if the value has a metatable, 0 otherwise.
	 */
	@:native('lua_setmetatable')
	static function setmetatable(L:cpp.RawPointer<Lua_State>, objindex:Int):Int;

	/**
	 * Set the environment of a function.
	 *
	 * @param L The Lua state.
	 * @param idx The index of the function.
	 * @return The result of the operation.
	 */
	@:native('lua_setfenv')
	static function setfenv(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * Call a function.
	 *
	 * @param L The Lua state.
	 * @param nargs The number of arguments.
	 * @param nresults The number of results.
	 */
	@:native('lua_call')
	static function call(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int):Void;

	/**
	 * Call a function with error handling.
	 *
	 * @param L The Lua state.
	 * @param nargs The number of arguments.
	 * @param nresults The number of results.
	 * @param errfunc The index of the error handling function.
	 * @return The result of the call.
	 */
	@:native('lua_pcall')
	static function pcall(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int, errfunc:Int):Int;

	/**
	 * Call a C function with a user data.
	 *
	 * @param L The Lua state.
	 * @param func The C function.
	 * @param ud The user data.
	 * @return The result of the call.
	 */
	@:native('lua_cpcall')
	static function cpcall(L:cpp.RawPointer<Lua_State>, func:Lua_CFunction, ud:cpp.RawPointer<cpp.Void>):Int;

	/**
	 * Load a Lua chunk.
	 *
	 * @param L The Lua state.
	 * @param reader The reader function.
	 * @param dt The user data for the reader.
	 * @param chunkname The name of the chunk.
	 * @return The status code.
	 */
	@:native('lua_load')
	static function load(L:cpp.RawPointer<Lua_State>, reader:Lua_Reader, dt:cpp.RawPointer<cpp.Void>, chunkname:cpp.ConstCharStar):Int;

	/**
	 * Dump a Lua function as a binary chunk.
	 *
	 * @param L The Lua state.
	 * @param writer The writer function.
	 * @param data The user data for the writer.
	 * @return The status code.
	 */
	@:native('lua_dump')
	static function dump(L:cpp.RawPointer<Lua_State>, writer:Lua_Writer, data:cpp.RawPointer<cpp.Void>):Int;

	/**
	 * Yield a coroutine.
	 *
	 * @param L The Lua state.
	 * @param nresults The number of results to return.
	 * @return The status code.
	 */
	@:native('lua_yield')
	static function yield(L:cpp.RawPointer<Lua_State>, nresults:Int):Int;

	/**
	 * Resume a coroutine.
	 *
	 * @param L The Lua state.
	 * @param nargs The number of arguments to pass to the coroutine.
	 * @return The status code.
	 */
	@:native('lua_resume')
	static function resume(L:cpp.RawPointer<Lua_State>, nargs:Int):Int;

	/**
	 * Get the status of a coroutine.
	 *
	 * @param L The Lua state.
	 * @return The status code.
	 */
	@:native('lua_status')
	static function status(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * Stop the garbage collector.
	 */
	@:native('LUA_GCSTOP')
	static var GCSTOP:Int;

	/**
	 * Restart the garbage collector.
	 */
	@:native('LUA_GCRESTART')
	static var GCRESTART:Int;

	/**
	 * Perform a full garbage-collection cycle.
	 */
	@:native('LUA_GCCOLLECT')
	static var GCCOLLECT:Int;

	/**
	 * Get the total memory in use by Lua in Kbytes.
	 */
	@:native('LUA_GCCOUNT')
	static var GCCOUNT:Int;

	/**
	 * Garbage collection step in bytes.
	 */
	@:native('LUA_GCCOUNTB')
	static var GCCOUNTB:Int;

	/**
	 * Perform a garbage collection step.
	 */
	@:native('LUA_GCSTEP')
	static var GCSTEP:Int;

	/**
	 * Set the garbage collector's pause.
	 */
	@:native('LUA_GCSETPAUSE')
	static var GCSETPAUSE:Int;

	/**
	 * Set the garbage collector's step multiplier.
	 */
	@:native('LUA_GCSETSTEPMUL')
	static var GCSETSTEPMUL:Int;

	/**
	 * Check if the garbage collector is running.
	 */
	@:native('LUA_GCISRUNNING')
	static var GCISRUNNING:Int;

	@:native('lua_gc')
	static function gc(L:cpp.RawPointer<Lua_State>, what:Int, data:Int):Int;

	@:native('lua_error')
	static function error(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_next')
	static function next(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_concat')
	static function concat(L:cpp.RawPointer<Lua_State>, n:Int):Void;

	@:native('lua_getallocf')
	static function getallocf(L:cpp.RawPointer<Lua_State>, ud:cpp.RawPointer<cpp.RawPointer<cpp.Void>>):Lua_Alloc;

	@:native('lua_setallocf')
	static function setallocf(L:cpp.RawPointer<Lua_State>, f:Lua_Alloc, ud:cpp.RawPointer<cpp.Void>):Void;

	@:native('lua_pop')
	static function pop(L:cpp.RawPointer<Lua_State>, n:Int):Void;

	@:native('lua_newtable')
	static function newtable(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_register')
	static function register(L:cpp.RawPointer<Lua_State>, name:cpp.ConstCharStar, f:Lua_CFunction):Void;

	@:native('lua_pushcfunction')
	static function pushcfunction(L:cpp.RawPointer<Lua_State>, fn:Lua_CFunction):Void;

	@:native('lua_strlen')
	static function strlen(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.SizeT;

	@:native('lua_isfunction')
	static function isfunction(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_istable')
	static function istable(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_islightuserdata')
	static function islightuserdata(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_isnil')
	static function isnil(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_isboolean')
	static function isboolean(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_isthread')
	static function isthread(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_isnone')
	static function isnone(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_isnoneornil')
	static function isnoneornil(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_pushliteral')
	static function pushliteral(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):cpp.ConstCharStar;

	@:native('lua_setglobal')
	static function setglobal(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Int;

	@:native('lua_getglobal')
	static function getglobal(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Int;

	@:native('lua_tostring')
	static function tostring(L:cpp.RawPointer<Lua_State>, i:Int):cpp.ConstCharStar;

	@:native('lua_open')
	static function open():cpp.RawPointer<Lua_State>;

	@:native('lua_getregistry')
	static function getregistry(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_getgccount')
	static function getgccount(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_setlevel')
	static function setlevel(from:cpp.RawPointer<Lua_State>, to:cpp.RawPointer<Lua_State>):Void;

	@:native('LUA_HOOKCALL')
	static var HOOKCALL:Int;

	@:native('LUA_HOOKRET')
	static var HOOKRET:Int;

	@:native('LUA_HOOKLINE')
	static var HOOKLINE:Int;

	@:native('LUA_HOOKCOUNT')
	static var HOOKCOUNT:Int;

	@:native('LUA_HOOKTAILCALL')
	static var HOOKTAILCALL:Int;

	@:native('LUA_MASKCALL')
	static var MASKCALL:Int;

	@:native('LUA_MASKRET')
	static var MASKRET:Int;

	@:native('LUA_MASKLINE')
	static var MASKLINE:Int;

	@:native('LUA_MASKCOUNT')
	static var MASKCOUNT:Int;

	@:native('lua_getstack')
	static function getstack(L:cpp.RawPointer<Lua_State>, level:Int, ar:cpp.RawPointer<Lua_Debug>):Int;

	@:native('lua_getinfo')
	static function getinfo(L:cpp.RawPointer<Lua_State>, what:cpp.ConstCharStar, ar:cpp.RawPointer<Lua_Debug>):Int;

	@:native('lua_getlocal')
	static function getlocal(L:cpp.RawPointer<Lua_State>, ar:cpp.RawConstPointer<Lua_Debug>, n:Int):cpp.ConstCharStar;

	@:native('lua_setlocal')
	static function setlocal(L:cpp.RawPointer<Lua_State>, ar:cpp.RawConstPointer<Lua_Debug>, n:Int):cpp.ConstCharStar;

	@:native('lua_getupvalue')
	static function getupvalue(L:cpp.RawPointer<Lua_State>, funcindex:Int, n:Int):cpp.ConstCharStar;

	@:native('lua_setupvalue')
	static function setupvalue(L:cpp.RawPointer<Lua_State>, funcindex:Int, n:Int):cpp.ConstCharStar;

	@:native('lua_sethook')
	static function sethook(L:cpp.RawPointer<Lua_State>, func:Lua_Hook, mask:Int, count:Int):Int;

	@:native('lua_gethook')
	static function gethook(L:cpp.RawPointer<Lua_State>):Lua_Hook;

	@:native('lua_gethookmask')
	static function gethookmask(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_gethookcount')
	static function gethookcount(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_upvalueid')
	static function upvalueid(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):cpp.RawPointer<cpp.Void>;

	@:native('lua_upvaluejoin')
	static function upvaluejoin(L:cpp.RawPointer<Lua_State>, idx1:Int, n1:Int, idx2:Int, n2:Int):Void;

	@:native('lua_loadx')
	static function loadx(L:cpp.RawPointer<Lua_State>, reader:Lua_Reader, dt:cpp.RawPointer<cpp.Void>, chunkname:cpp.ConstCharStar,
		mode:cpp.ConstCharStar):Int;

	@:native('lua_version')
	static function version(L:cpp.RawPointer<Lua_State>):cpp.RawConstPointer<Lua_Number>;

	@:native('lua_copy')
	static function copy(L:cpp.RawPointer<Lua_State>, fromidx:Int, toidx:Int):Void;

	@:native('lua_tonumberx')
	static function tonumberx(L:cpp.RawPointer<Lua_State>, idx:Int, isnum:cpp.Star<Int>):Lua_Number;

	@:native('lua_tointegerx')
	static function tointegerx(L:cpp.RawPointer<Lua_State>, idx:Int, isnum:cpp.Star<Int>):Lua_Integer;

	@:native('lua_isyieldable')
	static function isyieldable(L:cpp.RawPointer<Lua_State>):Int;

	@:native('::String(LUA_FILEHANDLE)')
	static var FILEHANDLE:String;

	@:native('::String(LUA_COLIBNAME)')
	static var COLIBNAME:String;

	@:native('::String(LUA_MATHLIBNAME)')
	static var MATHLIBNAME:String;

	@:native('::String(LUA_STRLIBNAME)')
	static var STRLIBNAME:String;

	@:native('::String(LUA_TABLIBNAME)')
	static var TABLIBNAME:String;

	@:native('::String(LUA_IOLIBNAME)')
	static var IOLIBNAME:String;

	@:native('::String(LUA_OSLIBNAME)')
	static var OSLIBNAME:String;

	@:native('::String(LUA_LOADLIBNAME)')
	static var LOADLIBNAME:String;

	@:native('::String(LUA_DBLIBNAME)')
	static var DBLIBNAME:String;

	@:native('::String(LUA_BITLIBNAME)')
	static var BITLIBNAME:String;

	@:native('::String(LUA_JITLIBNAME)')
	static var JITLIBNAME:String;

	@:native('::String(LUA_FFILIBNAME)')
	static var FFILIBNAME:String;
}
