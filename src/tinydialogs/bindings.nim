{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

when not declared(tinyfd_getGlobalChar):
  proc tinyfd_getGlobalChar*(
    aCharVariableName: cstring
  ): cstring {.cdecl, importc: "tinyfd_getGlobalChar".}

else:
  static:
    hint(
      "Declaration of " & "tinyfd_getGlobalChar" & " already exists, not redeclaring"
    )
when not declared(tinyfd_getGlobalInt):
  proc tinyfd_getGlobalInt*(
    aIntVariableName: cstring
  ): cint {.cdecl, importc: "tinyfd_getGlobalInt".}

else:
  static:
    hint("Declaration of " & "tinyfd_getGlobalInt" & " already exists, not redeclaring")
when not declared(tinyfd_setGlobalInt):
  proc tinyfd_setGlobalInt*(
    aIntVariableName: cstring, aValue: cint
  ): cint {.cdecl, importc: "tinyfd_setGlobalInt".}

else:
  static:
    hint("Declaration of " & "tinyfd_setGlobalInt" & " already exists, not redeclaring")
when not declared(tinyfd_version):
  var tinyfd_version* {.importc: "tinyfd_version".}: array[8'i64, cschar]
else:
  static:
    hint("Declaration of " & "tinyfd_version" & " already exists, not redeclaring")
when not declared(tinyfd_needs):
  var tinyfd_needs* {.importc: "tinyfd_needs".}: ptr UncheckedArray[cschar]
else:
  static:
    hint("Declaration of " & "tinyfd_needs" & " already exists, not redeclaring")
when not declared(tinyfd_verbose):
  var tinyfd_verbose* {.importc: "tinyfd_verbose".}: cint
else:
  static:
    hint("Declaration of " & "tinyfd_verbose" & " already exists, not redeclaring")
when not declared(tinyfd_silent):
  var tinyfd_silent* {.importc: "tinyfd_silent".}: cint
else:
  static:
    hint("Declaration of " & "tinyfd_silent" & " already exists, not redeclaring")
when not declared(tinyfd_allowCursesDialogs):
  var tinyfd_allowCursesDialogs* {.importc: "tinyfd_allowCursesDialogs".}: cint
else:
  static:
    hint(
      "Declaration of " & "tinyfd_allowCursesDialogs" &
        " already exists, not redeclaring"
    )
when not declared(tinyfd_forceConsole):
  var tinyfd_forceConsole* {.importc: "tinyfd_forceConsole".}: cint
else:
  static:
    hint("Declaration of " & "tinyfd_forceConsole" & " already exists, not redeclaring")
when not declared(tinyfd_assumeGraphicDisplay):
  var tinyfd_assumeGraphicDisplay* {.importc: "tinyfd_assumeGraphicDisplay".}: cint
else:
  static:
    hint(
      "Declaration of " & "tinyfd_assumeGraphicDisplay" &
        " already exists, not redeclaring"
    )
when not declared(tinyfd_response):
  var tinyfd_response* {.importc: "tinyfd_response".}: array[1024'i64, cschar]
else:
  static:
    hint("Declaration of " & "tinyfd_response" & " already exists, not redeclaring")
when not declared(tinyfd_beep):
  proc tinyfd_beep*(): void {.cdecl, importc: "tinyfd_beep".}
else:
  static:
    hint("Declaration of " & "tinyfd_beep" & " already exists, not redeclaring")
when not declared(tinyfd_notifyPopup):
  proc tinyfd_notifyPopup*(
    aTitle: cstring, aMessage: cstring, aIconType: cstring
  ): cint {.cdecl, importc: "tinyfd_notifyPopup".}

else:
  static:
    hint("Declaration of " & "tinyfd_notifyPopup" & " already exists, not redeclaring")
when not declared(tinyfd_messageBox):
  proc tinyfd_messageBox*(
    aTitle: cstring,
    aMessage: cstring,
    aDialogType: cstring,
    aIconType: cstring,
    aDefaultButton: cint,
  ): cint {.cdecl, importc: "tinyfd_messageBox".}

else:
  static:
    hint("Declaration of " & "tinyfd_messageBox" & " already exists, not redeclaring")
when not declared(tinyfd_inputBox):
  proc tinyfd_inputBox*(
    aTitle: cstring, aMessage: cstring, aDefaultInput: cstring
  ): cstring {.cdecl, importc: "tinyfd_inputBox".}

else:
  static:
    hint("Declaration of " & "tinyfd_inputBox" & " already exists, not redeclaring")
when not declared(tinyfd_saveFileDialog):
  proc tinyfd_saveFileDialog*(
    aTitle: cstring,
    aDefaultPathAndFile: cstring,
    aNumOfFilterPatterns: cint,
    aFilterPatterns: ptr cstring,
    aSingleFilterDescription: cstring,
  ): cstring {.cdecl, importc: "tinyfd_saveFileDialog".}

else:
  static:
    hint(
      "Declaration of " & "tinyfd_saveFileDialog" & " already exists, not redeclaring"
    )
when not declared(tinyfd_openFileDialog):
  proc tinyfd_openFileDialog*(
    aTitle: cstring,
    aDefaultPathAndFile: cstring,
    aNumOfFilterPatterns: cint,
    aFilterPatterns: ptr cstring,
    aSingleFilterDescription: cstring,
    aAllowMultipleSelects: cint,
  ): cstring {.cdecl, importc: "tinyfd_openFileDialog".}

else:
  static:
    hint(
      "Declaration of " & "tinyfd_openFileDialog" & " already exists, not redeclaring"
    )
when not declared(tinyfd_selectFolderDialog):
  proc tinyfd_selectFolderDialog*(
    aTitle: cstring, aDefaultPath: cstring
  ): cstring {.cdecl, importc: "tinyfd_selectFolderDialog".}

else:
  static:
    hint(
      "Declaration of " & "tinyfd_selectFolderDialog" &
        " already exists, not redeclaring"
    )
when not declared(tinyfd_colorChooser):
  proc tinyfd_colorChooser*(
    aTitle: cstring,
    aDefaultHexRGB: cstring,
    aDefaultRGB: array[3'i64, uint8],
    aoResultRGB: array[3'i64, uint8],
  ): cstring {.cdecl, importc: "tinyfd_colorChooser".}

else:
  static:
    hint("Declaration of " & "tinyfd_colorChooser" & " already exists, not redeclaring")

