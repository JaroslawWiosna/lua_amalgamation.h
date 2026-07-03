

# -DLUA_USE_POSIX 
# to silence the
# /usr/bin/ld: /tmp/ccyhf5xR.o: in function `os_tmpname':
# main.c:(.text+0x2211f): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
# warning

gcc -DLUA_USE_POSIX -static -o main main.c -lm


