import futhark

importc:
  sysPath "/usr/lib/clang/14/include"
  path "tinyfiledialogs"
  define TINYFD_IMPLEMENTATION
  "tinyfiledialogs.h"
