#  lua_amalgamation.h

  Single-header amalgamation of Lua 5.5.0 source code.

  Use like other stb-style single-header libraries:
// https://github.com/nothings/stb/blob/f58f558c/docs/stb_howto.txt

## Quick example

```console
gcc -DLUA_USE_POSIX -static -o main main.c -lm
./main
```

```c
#define LUA_AMALGAMATION_IMPLEMENTATION
#include "lua_amalgamation.h"

int main() {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaL_dostring(L, "print('hello world')");
  luaL_dostring(L, "t={a='foo bar baz'}; print('hello '..t.a)");
  luaL_dostring(L, "t={a='12', b='9'}; for k,v in pairs(t) do print(k,v) end");
}
```

## Disclaimer

This file is a derivative work (packaging and minor patches)
of the official Lua source code. It is not an official Lua distribution.

Amalgamation idea inspired by SQLite: https://sqlite.org/amalgamation.html

## Credits

Downloaded from https://www.lua.org/download.html 2026-07-03
lua-5.5.0.tar.gz
2025-12-15, 388K, sha256:
57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d

## Licence

```
// ==================== ORIGINAL LUA COPYRIGHT AND LICENSE ====================

** Copyright (c) 1994–2025 Lua.org, PUC-Rio.
**
** Permission is hereby granted, free of charge, to any person obtaining
** a copy of this software and associated documentation files (the
** "Software"), to deal in the Software without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Software, and to
** permit persons to whom the Software is furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be
** included in all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
**
** See https://www.lua.org/license.html for more information.

// MIT licence ends

* Amalgamation created by:
 * Copyright (c) 2026 Jarosław Wiosna [](https://github.com/JaroslawWiosna)
 *
 * This amalgamation is a derivative work licensed under the same MIT license.
 *
 * Downloaded from: https://www.lua.org/download.html on 2026-07-03
 * Version: lua-5.5.0.tar.gz
 * SHA256: 57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d
 *
 * Minor patches applied:
   * patch: TM_N equals 25 in lua-5.5.0,
            hardcoded to prevent cyclic dependencies
            between lstate.h and ltm.h, and add static_assert(25 == TM_N);
   * patch: Replace `#include "ljumptab.h` with the content of that file
   * patch: Remove the rest of `#include "l*`
   * patch: preprocessor guards for `vmdispatch, vmcase, vmbreak` 
            to prevent redefinitions

```

# This is NOT amalg.lua

Also, please don't confuse with 
amalg.lua - https://siffiejoe.github.io/lua-amalg/
which makes (amalgamates) multiple lua scripts into one script.

Here, in lua_amalgamation we make it convenient to include 
the whole source code of Lua into your C program.

Amalgamation idea is present in https://sqlite.org/amalgamation.html , but
SQLite's amalgamation was made by SQLite developers.
I am not associated with Lua developers, though.


