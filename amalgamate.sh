#!/usr/bin/env bash
set -euo pipefail

out="lua_amalgamation.h"

h_files=(
  "lua-5.5.0/src/luaconf.h"
  "lua-5.5.0/src/lua.h"
  "lua-5.5.0/src/llimits.h"
  "lua-5.5.0/src/lobject.h"
  "lua-5.5.0/src/lopcodes.h"
  "lua-5.5.0/src/lzio.h"
  "lua-5.5.0/src/lstate.h"
  "lua-5.5.0/src/ltm.h"
  "lua-5.5.0/src/lvm.h"
  "lua-5.5.0/src/ltable.h"
  "lua-5.5.0/src/lstring.h"
  "lua-5.5.0/src/lauxlib.h"
  "lua-5.5.0/src/lparser.h"
  "lua-5.5.0/src/lgc.h"
  "lua-5.5.0/src/llex.h"
  "lua-5.5.0/src/lopnames.h"
  "lua-5.5.0/src/lualib.h"
  "lua-5.5.0/src/lmem.h"
  "lua-5.5.0/src/lundump.h"
  "lua-5.5.0/src/lfunc.h"
  "lua-5.5.0/src/lctype.h"
  "lua-5.5.0/src/ldebug.h"
  "lua-5.5.0/src/lprefix.h"
  "lua-5.5.0/src/lapi.h"
  "lua-5.5.0/src/lcode.h"
  "lua-5.5.0/src/ldo.h"
  "lua-5.5.0/src/ljumptab.h"
)
c_files0=(
)
c_files=(
  "lua-5.5.0/src/lapi.c"
  "lua-5.5.0/src/lauxlib.c"
  "lua-5.5.0/src/lbaselib.c"
  "lua-5.5.0/src/lcode.c"
  "lua-5.5.0/src/lcorolib.c"
  "lua-5.5.0/src/lctype.c"
  "lua-5.5.0/src/ldblib.c"
  "lua-5.5.0/src/ldebug.c"
  "lua-5.5.0/src/ldo.c"
  "lua-5.5.0/src/ldump.c"
  "lua-5.5.0/src/lfunc.c"
  "lua-5.5.0/src/lgc.c"
  "lua-5.5.0/src/linit.c"
  "lua-5.5.0/src/liolib.c"
  "lua-5.5.0/src/llex.c"
  "lua-5.5.0/src/lmathlib.c"
  "lua-5.5.0/src/lmem.c"
  "lua-5.5.0/src/loadlib.c"
  "lua-5.5.0/src/lobject.c"
  "lua-5.5.0/src/lopcodes.c"
  "lua-5.5.0/src/loslib.c"
  "lua-5.5.0/src/lparser.c"
  "lua-5.5.0/src/lstate.c"
  "lua-5.5.0/src/lstring.c"
  "lua-5.5.0/src/lstrlib.c"
  "lua-5.5.0/src/ltable.c"
  "lua-5.5.0/src/ltablib.c"
  "lua-5.5.0/src/ltm.c"
#  "lua-5.5.0/src/lua.c"
#  "lua-5.5.0/src/luac.c"
  "lua-5.5.0/src/lundump.c"
  "lua-5.5.0/src/lutf8lib.c"
  "lua-5.5.0/src/lvm.c"
  "lua-5.5.0/src/lzio.c"
)

cat > "$out" <<'HEADER'
#ifndef LUA_AMALGAMATION_H
#define LUA_AMALGAMATION_H

/*
  lua_amalgamation.h
  Single-header amalgamation of Lua 5.5.0 source code.

  Use like other stb-style single-header libraries:
// https://github.com/nothings/stb/blob/f58f558c/docs/stb_howto.txt

// Quick example:
-------------------------------------------------------------------------------
// gcc -DLUA_USE_POSIX -static -o main main.c -lm

#define LUA_AMALGAMATION_IMPLEMENTATION
#include "lua_amalgamation.h"

int main() {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaL_dostring(L, "print('hello world')");
  luaL_dostring(L, "t={a='foo bar baz'}; print('hello '..t.a)");
  luaL_dostring(L, "t={a='12', b='9'}; for k,v in pairs(t) do print(k,v) end");
}

-------------------------------------------------------------------------------

This file is a derivative work (packaging and minor patches)
of the official Lua source code. It is not an official Lua distribution.

Amalgamation idea inspired by SQLite: https://sqlite.org/amalgamation.html

// disclaimer ends

Downloaded from https://www.lua.org/download.html 2026-07-03
lua-5.5.0.tar.gz
2025-12-15, 388K, sha256:
57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d

// credits ends

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
 * Copyright (c) 2026 Jarosław Wiosna ( https://github.com/JaroslawWiosna )
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

// MIT licence for amalgamation ends 

Also, please don't confuse with 
amalg.lua - https://siffiejoe.github.io/lua-amalg/
which makes (amalgamates) multiple lua scripts into one script.

Here, in lua_amalgamation we make it convenient to include 
the whole source code of Lua into your C program.

Amalgamation idea is present in https://sqlite.org/amalgamation.html , but
SQLite's amalgamation was made by SQLite developers.
I am not associated with Lua developers, though.

*/
HEADER

# .h
for f in "${h_files[@]}"; do
  [ -f "$f" ] || { echo "Brak pliku: $f" >&2; exit 1; }
  echo "" >> "$out"
  echo "/* ===== $f ===== */" >> "$out"
  cat "$f" >> "$out"
done

#.c 
cat >> "$out" <<'MID'
#ifdef LUA_AMALGAMATION_IMPLEMENTATION
MID

for f in "${c_files[@]}"; do
  [ -f "$f" ] || { echo "Brak pliku: $f" >&2; exit 1; }
  echo "" >> "$out"
  echo "/* ===== $f ===== */" >> "$out"
  cat "$f" >> "$out"
done

# patch: static_assert
echo "#ifndef static_assert" >> "$out"
echo "  #if !defined(__cplusplus)" >> "$out"
echo "    #if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)" >> "$out"
echo "      #define static_assert(cond, msg) _Static_assert((cond), msg)" >> "$out"
echo "    #else" >> "$out"
echo "      /* If C11 _Static_assert doesn't exist, disable checks (worst case). */" >> "$out"
echo "      #define static_assert(cond, msg) /* static_assert disabled */" >> "$out"
echo "    #endif" >> "$out"
echo "  #endif" >> "$out"
echo "#endif" >> "$out"

echo "static_assert(25 == TM_N, \"TM_N changed\");" >> "$out"

cat >> "$out" <<'FOOTER'


#endif /* LUA_AMALGAMATION_IMPLEMENTATION */
#endif /* LUA_AMALGAMATION_H */
FOOTER

sed -i '/#include "luaconf\.h"/d' lua_amalgamation.h
sed -i '/#include "lua\.h"/d' lua_amalgamation.h
sed -i '/#include "llimits\.h"/d' lua_amalgamation.h
sed -i '/#include "lobject\.h"/d' lua_amalgamation.h
sed -i '/#include "ldo\.h"/d' lua_amalgamation.h
sed -i '/#include "ltm\.h"/d' lua_amalgamation.h
sed -i '/#include "lzio\.h"/d' lua_amalgamation.h
sed -i '/#include "lgc\.h"/d' lua_amalgamation.h
sed -i '/#include "lstate\.h"/d' lua_amalgamation.h
sed -i '/#include "lmem\.h"/d' lua_amalgamation.h
sed -i '/#include "llex\.h"/d' lua_amalgamation.h
sed -i '/#include "lopcodes\.h"/d' lua_amalgamation.h
sed -i '/#include "lparser\.h"/d' lua_amalgamation.h
sed -i '/#include "lprefix\.h"/d' lua_amalgamation.h
sed -i '/#include "lapi\.h"/d' lua_amalgamation.h
sed -i '/#include "ldebug\.h"/d' lua_amalgamation.h
sed -i '/#include "lfunc\.h"/d' lua_amalgamation.h
sed -i '/#include "lstring\.h"/d' lua_amalgamation.h
sed -i '/#include "ltable\.h"/d' lua_amalgamation.h
sed -i '/#include "lundump\.h"/d' lua_amalgamation.h
sed -i '/#include "lvm\.h"/d' lua_amalgamation.h
sed -i '/#include "lauxlib\.h"/d' lua_amalgamation.h
sed -i '/#include "lualib\.h"/d' lua_amalgamation.h
sed -i '/#include "lcode\.h"/d' lua_amalgamation.h
sed -i '/#include "lopnames\.h"/d' lua_amalgamation.h
sed -i '/#include "lctype\.h"/d' lua_amalgamation.h
sed -i '/#include "ljumptype\.h"/d' lua_amalgamation.h

#sed -i '/^#include "l/d' lua_amalgamation.h


# patch: TM_N equals 25 in lua-5.5.0,
# so let's hardcode it to prevent cyclic dependencies
# between lstate.h and ltm.h
sed -i 's/tmname\[TM_N\]/tmname[25]/g' lua_amalgamation.h

sed -i 's/^\(\s*\)&&L_OP/\/\/\1&&L_OP/' lua_amalgamation.h

sed -i '/^#include "ljumptab\.h"$/{
r lua-5.5.0/src/ljumptab.h
d
}' lua_amalgamation.h

sed -E -i 's/^(#define[[:space:]]+vmdispatch.*)$/#ifndef vmdispatch\n\1\n#endif/' lua_amalgamation.h
sed -E -i 's/^(#define[[:space:]]+vmcase.*)$/#ifndef vmcase\n\1\n#endif/' lua_amalgamation.h
sed -E -i 's/^(#define[[:space:]]+vmbreak.*)$/#ifndef vmbreak\n\1\n#endif/' lua_amalgamation.h
