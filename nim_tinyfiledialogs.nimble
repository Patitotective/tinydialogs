# Package

version       = "0.1.0"
author        = "Patitotective"
description   = "Tiny file dialogs bindings for Nim"
license       = "MIT"
# installFiles  = @["tinyfiledialogs/tinyfiledialogs.c", "tinyfiledialogs/tinyfiledialogs.h"]

# Dependencies

requires "nim >= 1.6.4"
# requires "futhark >= 0.5.1"

# import std/[sequtils, os]

# TODO
# task gen, "Generate bindings":
  # exec "nim c gen.nim"
  # cpFile(walkFiles(nimcacheDir() / "gen_d" / "futhark_*.nim").toSeq(), "nim_tinyfiledialogs.nim")
