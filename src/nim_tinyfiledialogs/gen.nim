import std/[strutils,os]
import futhark

const sysPath {.strdefine.} = "/usr/lib/clang/14/include"

importc:
  sysPath sysPath
  path "./tinyfiledialogs"
  define TINYFD_IMPLEMENTATION
  "tinyfiledialogs.h"
