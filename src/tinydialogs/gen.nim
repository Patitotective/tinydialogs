# Run this file in order to generate the bindings. They are generated at the nim cache directory.
import futhark

importc:
  sysPath "/usr/lib/clang/14/include"
  path "tinyfiledialogs"
  define TINYFD_IMPLEMENTATION
  "tinyfiledialogs.h"
