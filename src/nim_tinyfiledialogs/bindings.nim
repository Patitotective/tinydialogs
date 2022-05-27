from macros import hint

when not declared(tinyfdverbose):
  var tinyfdverbose*: cint
else:
  static :
    hint("Declaration of " & "tinyfd_verbose" &
        " already exists, not redeclaring")
when not declared(tinyfdassumegraphicdisplay):
  var tinyfdassumegraphicdisplay*: cint
else:
  static :
    hint("Declaration of " & "tinyfd_assumeGraphicDisplay" &
        " already exists, not redeclaring")
when not declared(tinyfdcolorchooser):
  proc tinyfdcolorchooser*(atitle: cstring; adefaulthexrgb: cstring;
                           adefaultrgb: array[3'i64, cuchar];
                           aoresultrgb: array[3'i64, cuchar]): cstring {.cdecl,
      importc: "tinyfd_colorChooser".}
else:
  static :
    hint("Declaration of " & "tinyfd_colorChooser" &
        " already exists, not redeclaring")
when not declared(tinyfdresponse):
  var tinyfdresponse*: array[1024'i64, cschar]
else:
  static :
    hint("Declaration of " & "tinyfd_response" &
        " already exists, not redeclaring")
when not declared(tinyfdsavefiledialog):
  proc tinyfdsavefiledialog*(atitle: cstring; adefaultpathandfile: cstring;
                             anumoffilterpatterns: cint;
                             afilterpatterns: ptr ptr cschar;
                             asinglefilterdescription: cstring): cstring {.
      cdecl, importc: "tinyfd_saveFileDialog".}
else:
  static :
    hint("Declaration of " & "tinyfd_saveFileDialog" &
        " already exists, not redeclaring")
when not declared(tinyfdsilent):
  var tinyfdsilent*: cint
else:
  static :
    hint("Declaration of " & "tinyfd_silent" &
        " already exists, not redeclaring")
when not declared(tinyfdselectfolderdialog):
  proc tinyfdselectfolderdialog*(atitle: cstring; adefaultpath: cstring): cstring {.
      cdecl, importc: "tinyfd_selectFolderDialog".}
else:
  static :
    hint("Declaration of " & "tinyfd_selectFolderDialog" &
        " already exists, not redeclaring")
when not declared(tinyfdgetglobalint):
  proc tinyfdgetglobalint*(aintvariablename: cstring): cint {.cdecl,
      importc: "tinyfd_getGlobalInt".}
else:
  static :
    hint("Declaration of " & "tinyfd_getGlobalInt" &
        " already exists, not redeclaring")
when not declared(tinyfdbeep):
  proc tinyfdbeep*(): void {.cdecl, importc: "tinyfd_beep".}
else:
  static :
    hint("Declaration of " & "tinyfd_beep" & " already exists, not redeclaring")
when not declared(tinyfdneeds):
  var tinyfdneeds*: ptr UncheckedArray[cschar]
else:
  static :
    hint("Declaration of " & "tinyfd_needs" & " already exists, not redeclaring")
when not declared(tinyfdinputbox):
  proc tinyfdinputbox*(atitle: cstring; amessage: cstring;
                       adefaultinput: cstring): cstring {.cdecl,
      importc: "tinyfd_inputBox".}
else:
  static :
    hint("Declaration of " & "tinyfd_inputBox" &
        " already exists, not redeclaring")
when not declared(tinyfdallowcursesdialogs):
  var tinyfdallowcursesdialogs*: cint
else:
  static :
    hint("Declaration of " & "tinyfd_allowCursesDialogs" &
        " already exists, not redeclaring")
when not declared(tinyfdnotifypopup):
  proc tinyfdnotifypopup*(atitle: cstring; amessage: cstring; aicontype: cstring): cint {.
      cdecl, importc: "tinyfd_notifyPopup".}
else:
  static :
    hint("Declaration of " & "tinyfd_notifyPopup" &
        " already exists, not redeclaring")
when not declared(tinyfdversion):
  var tinyfdversion*: array[8'i64, cschar]
else:
  static :
    hint("Declaration of " & "tinyfd_version" &
        " already exists, not redeclaring")
when not declared(tinyfdsetglobalint):
  proc tinyfdsetglobalint*(aintvariablename: cstring; avalue: cint): cint {.
      cdecl, importc: "tinyfd_setGlobalInt".}
else:
  static :
    hint("Declaration of " & "tinyfd_setGlobalInt" &
        " already exists, not redeclaring")
when not declared(tinyfdforceconsole):
  var tinyfdforceconsole*: cint
else:
  static :
    hint("Declaration of " & "tinyfd_forceConsole" &
        " already exists, not redeclaring")
when not declared(tinyfdmessagebox):
  proc tinyfdmessagebox*(atitle: cstring; amessage: cstring;
                         adialogtype: cstring; aicontype: cstring;
                         adefaultbutton: cint): cint {.cdecl,
      importc: "tinyfd_messageBox".}
else:
  static :
    hint("Declaration of " & "tinyfd_messageBox" &
        " already exists, not redeclaring")
when not declared(tinyfdopenfiledialog):
  proc tinyfdopenfiledialog*(atitle: cstring; adefaultpathandfile: cstring;
                             anumoffilterpatterns: cint;
                             afilterpatterns: ptr ptr cschar;
                             asinglefilterdescription: cstring;
                             aallowmultipleselects: cint): cstring {.cdecl,
      importc: "tinyfd_openFileDialog".}
else:
  static :
    hint("Declaration of " & "tinyfd_openFileDialog" &
        " already exists, not redeclaring")
when not declared(tinyfdgetglobalchar):
  proc tinyfdgetglobalchar*(acharvariablename: cstring): cstring {.cdecl,
      importc: "tinyfd_getGlobalChar".}
else:
  static :
    hint("Declaration of " & "tinyfd_getGlobalChar" &
        " already exists, not redeclaring")
