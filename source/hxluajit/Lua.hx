package hxluajit;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxluajit.Types;

@:buildXml('<include name="${haxelib:hxluajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class Lua
{
	@:native('::String(LUA_VERSION)')
	static var VERSION:String;

	@:native('::String(LUA_RELEASE)')
	static var RELEASE:String;

	@:native('LUA_VERSION_NUM')
	static var VERSION_NUM:Int;

	@:native('::String(LUA_COPYRIGHT)')
	static var COPYRIGHT:String;

	@:native('::String(LUA_AUTHORS)')
	static var AUTHORS:String;

	/* mark for precompiled code (`<esc>Lua') */
	@:native('::String(LUA_SIGNATURE)')
	static var SIGNATURE:String;

	/* option for multiple returns in `lua_pcall' and `lua_call' */
	@:native('LUA_MULTRET')
	static var MULTRET:Int;

	@:native('LUA_REGISTRYINDEX')
	static var REGISTRYINDEX:Int;

	@:native('LUA_ENVIRONINDEX')
	static var ENVIRONINDEX:Int;

	@:native('LUA_GLOBALSINDEX')
	static var GLOBALSINDEX:Int;

	@:native('lua_upvalueindex')
	static function upvalueindex(i:Int):Int;

	@:native('LUA_OK')
	static var OK:Int;

	@:native('LUA_YIELD')
	static var YIELD:Int;

	@:native('LUA_ERRRUN')
	static var ERRRUN:Int;

	@:native('LUA_ERRSYNTAX')
	static var ERRSYNTAX:Int;

	@:native('LUA_ERRMEM')
	static var ERRMEM:Int;

	@:native('LUA_ERRERR')
	static var ERRERR:Int;

	@:native('LUA_ERRFILE')
	static var ERRFILE:Int;

	/**
	 * basic types
	 */

	@:native('LUA_TNONE')
	static var TNONE:Int;

	@:native('LUA_TNIL')
	static var TNIL:Int;

	@:native('LUA_TBOOLEAN')
	static var TBOOLEAN:Int;

	@:native('LUA_TLIGHTUSERDATA')
	static var TLIGHTUSERDATA:Int;

	@:native('LUA_TNUMBER')
	static var TNUMBER:Int;

	@:native('LUA_TSTRING')
	static var TSTRING:Int;

	@:native('LUA_TTABLE')
	static var TTABLE:Int;

	@:native('LUA_TFUNCTION')
	static var TFUNCTION:Int;

	@:native('LUA_TUSERDATA')
	static var TUSERDATA:Int;

	@:native('LUA_TTHREAD')
	static var TTHREAD:Int;

	/* minimum Lua stack available to a C function */
	@:native('LUA_MINSTACK')
	static var MINSTACK:Int;

	/**
	 * state manipulation
	 */

	@:native('lua_newstate')
	static function newstate(f:Lua_Alloc, ud:cpp.RawPointer<cpp.Void>):cpp.RawPointer<Lua_State>;

	@:native('lua_close')
	static function close(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_newthread')
	static function newthread(L:cpp.RawPointer<Lua_State>):cpp.RawPointer<Lua_State>;

	@:native('lua_atpanic')
	static function atpanic(L:cpp.RawPointer<Lua_State>, panicf:Lua_CFunction):Lua_CFunction;

	/**
	 * basic stack manipulation
	 */

	@:native('lua_gettop')
	static function gettop(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_settop')
	static function settop(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_pushvalue')
	static function pushvalue(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_remove')
	static function remove(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_insert')
	static function insert(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_replace')
	static function replace(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_checkstack')
	static function checkstack(L:cpp.RawPointer<Lua_State>, sz:Int):Int;

	@:native('lua_xmove')
	static function xmove(from:cpp.RawPointer<Lua_State>, to:cpp.RawPointer<Lua_State>, n:Int):Void;

	/**
	 * access functions (stack -> C)
	 */

	@:native('lua_isnumber')
	static function isnumber(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_isstring')
	static function isstring(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_iscfunction')
	static function iscfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_isuserdata')
	static function isuserdata(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_type')
	static function type(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_typename')
	static function typename(L:cpp.RawPointer<Lua_State>, tp:Int):cpp.ConstCharStar;

	@:native('lua_equal')
	static function equal(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	@:native('lua_rawequal')
	static function rawequal(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	@:native('lua_lessthan')
	static function lessthan(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	@:native('lua_tonumber')
	static function tonumber(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_Number;

	@:native('lua_tointeger')
	static function tointeger(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_Integer;

	@:native('lua_toboolean')
	static function toboolean(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_tolstring')
	static function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Star<cpp.SizeT>):cpp.ConstCharStar;

	@:native('lua_objlen')
	static function objlen(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.SizeT;

	@:native('lua_tocfunction')
	static function tocfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_CFunction;

	@:native('lua_touserdata')
	static function touserdata(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawPointer<cpp.Void>;

	@:native('lua_tothread')
	static function tothread(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawPointer<Lua_State>;

	@:native('lua_topointer')
	static function topointer(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawConstPointer<cpp.Void>;

	/**
	 * push functions (C -> stack)
	 */

	@:native('lua_pushnil')
	static function pushnil(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_pushnumber')
	static function pushnumber(L:cpp.RawPointer<Lua_State>, n:Lua_Number):Void;

	@:native('lua_pushinteger')
	static function pushinteger(L:cpp.RawPointer<Lua_State>, n:Lua_Integer):Void;

	@:native('lua_pushlstring')
	static function pushlstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, len:cpp.SizeT):Void;

	@:native('lua_pushstring')
	static function pushstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Void;

	@:native('lua_pushvfstring')
	static function pushvfstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, argp:cpp.VarList):Void;

	@:native('lua_pushfstring')
	static function pushfstring(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, args:cpp.Rest<cpp.VarArg>):cpp.ConstCharStar;

	@:native('lua_pushcclosure')
	static function pushcclosure(L:cpp.RawPointer<Lua_State>, fn:Lua_CFunction, n:Int):Void;

	@:native('lua_pushboolean')
	static function pushboolean(L:cpp.RawPointer<Lua_State>, b:Int):Void;

	@:native('lua_pushlightuserdata')
	static function pushlightuserdata(L:cpp.RawPointer<Lua_State>, p:cpp.RawPointer<cpp.Void>):Void;

	@:native('lua_pushthread')
	static function pushthread(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * get functions (Lua -> stack)
	 */

	@:native('lua_gettable')
	static function gettable(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_getfield')
	static function getfield(L:cpp.RawPointer<Lua_State>, idx:Int, k:cpp.ConstCharStar):Int;

	@:native('lua_rawget')
	static function rawget(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_rawgeti')
	static function rawgeti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	@:native('lua_createtable')
	static function createtable(L:cpp.RawPointer<Lua_State>, narr:Int, nrec:Int):Void;

	@:native('lua_newuserdata')
	static function newuserdata(L:cpp.RawPointer<Lua_State>, sz:cpp.SizeT):cpp.RawPointer<cpp.Void>;

	@:native('lua_getmetatable')
	static function getmetatable(L:cpp.RawPointer<Lua_State>, objindex:Int):Int;

	@:native('lua_getfenv')
	static function getfenv(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * set functions (stack -> Lua)
	 */

	@:native('lua_settable')
	static function settable(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_setfield')
	static function setfield(L:cpp.RawPointer<Lua_State>, idx:Int, k:cpp.ConstCharStar):Int;

	@:native('lua_rawset')
	static function rawset(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_rawseti')
	static function rawseti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	@:native('lua_setmetatable')
	static function setmetatable(L:cpp.RawPointer<Lua_State>, objindex:Int):Int;

	@:native('lua_setfenv')
	static function setfenv(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	/**
	 * `load' and `call' functions (load and run Lua code)
	 */

	@:native('lua_call')
	static function call(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int):Void;

	@:native('lua_pcall')
	static function pcall(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int, errfunc:Int):Int;

	@:native('lua_cpcall')
	static function cpcall(L:cpp.RawPointer<Lua_State>, func:Lua_CFunction, ud:cpp.RawPointer<cpp.Void>):Int;

	@:native('lua_load')
	static function load(L:cpp.RawPointer<Lua_State>, reader:Lua_Reader, dt:cpp.RawPointer<cpp.Void>, chunkname:cpp.ConstCharStar):Int;

	@:native('lua_dump')
	static function dump(L:cpp.RawPointer<Lua_State>, reader:Lua_Writer, data:cpp.RawPointer<cpp.Void>):Int;

	/**
	 * coroutine functions
	 */

	@:native('lua_yield')
	static function yield(L:cpp.RawPointer<Lua_State>, nresults:Int):Int;

	@:native('lua_resume')
	static function resume(L:cpp.RawPointer<Lua_State>, nargs:Int):Int;

	@:native('lua_status')
	static function status(L:cpp.RawPointer<Lua_State>):Int;

	/**
	 * garbage-collection function and options
	 */

	@:native('LUA_GCSTOP')
	static var GCSTOP:Int;

	@:native('LUA_GCRESTART')
	static var GCRESTART:Int;

	@:native('LUA_GCCOLLECT')
	static var GCCOLLECT:Int;

	@:native('LUA_GCCOUNT')
	static var GCCOUNT:Int;

	@:native('LUA_GCCOUNTB')
	static var GCCOUNTB:Int;

	@:native('LUA_GCSTEP')
	static var GCSTEP:Int;

	@:native('LUA_GCSETPAUSE')
	static var GCSETPAUSE:Int;

	@:native('LUA_GCSETSTEPMUL')
	static var GCSETSTEPMUL:Int;

	@:native('LUA_GCISRUNNING')
	static var GCISRUNNING:Int;

	@:native('lua_gc')
	static function gc(L:cpp.RawPointer<Lua_State>, what:Int, data:Int):Int;

	/**
	 * miscellaneous functions
	 */

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

	/**
	 * ===============================================================
	 * some useful macros
	 * ===============================================================
	 */

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

	/*
	 * compatibility macros and functions
	 */

	@:native('lua_open')
	static function open():cpp.RawPointer<Lua_State>;

	@:native('lua_getregistry')
	static function getregistry(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_getgccount')
	static function getgccount(L:cpp.RawPointer<Lua_State>):Int;

	/* hack */
	@:native('lua_setlevel')
	static function setlevel(from:cpp.RawPointer<Lua_State>, to:cpp.RawPointer<Lua_State>):Void;

	/**
 	 * {======================================================================
	 * Debug API
	 * =======================================================================
	 */

	/**
	 * Event codes
	 */
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

	/**
	 * Event masks
	 */
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

	/* From Lua 5.2. */
	@:native('lua_upvalueid')
	static function upvalueid(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):cpp.RawPointer<cpp.Void>;

	@:native('lua_upvaluejoin')
	static function upvaluejoin(L:cpp.RawPointer<Lua_State>, idx1:Int, n1:Int, idx2:Int, n2:Int):Void;

	@:native('lua_loadx')
	static function loadx(L:cpp.RawPointer<Lua_State>, reader:Lua_Reader, dt:cpp.RawPointer<cpp.Void>, chunkname:cpp.ConstCharStar, mode:cpp.ConstCharStar):Int;

	@:native('lua_version')
	static function version(L:cpp.RawPointer<Lua_State>):cpp.RawConstPointer<Lua_Number>;

	@:native('lua_copy')
	static function copy(L:cpp.RawPointer<Lua_State>, fromidx:Int, toidx:Int):Void;

	@:native('lua_tonumberx')
	static function tonumberx(L:cpp.RawPointer<Lua_State>, idx:Int, isnum:cpp.Star<Int>):Lua_Number;

	@:native('lua_tointegerx')
	static function tointegerx(L:cpp.RawPointer<Lua_State>, idx:Int, isnum:cpp.Star<Int>):Lua_Integer;

	/* From Lua 5.3. */
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
