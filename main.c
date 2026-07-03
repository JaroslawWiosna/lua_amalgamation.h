#define LUA_AMALGAMATION_IMPLEMENTATION
#include "lua_amalgamation.h"

int main() {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaL_dostring(L, "print('hello world')");
  luaL_dostring(L, "t={a='foo bar baz'}; print('hello '..t.a)");
  luaL_dostring(L, "t={a='12', b='9'}; for k,v in pairs(t) do print(k,v) end");
}

