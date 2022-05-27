import std/strutils
import nim_tinyfiledialogs/bindings
export bindings

{.compile: "nim_tinyfiledialogs/tinyfiledialogs/tinyfiledialogs.c".}

proc beep*() = tinyfd_beep()

proc notifyPopup*(title, message, iconType: string): int = 
  tinyfd_notifyPopup(cstring title, cstring message, cstring iconType)

proc messageBox*(title, message, dialogType, iconType: string, defaultButton: range[0..2]): int = 
  tinyfd_messageBox(cstring title, cstring message, cstring dialogType, cstring iconType, defaultButton)

proc inputBox*(title, message, defaultInput: string): string = 
  $tinyfd_inputBox(cstring title, cstring message, cstring defaultInput)

proc saveFileDialog*(title, defaultPathAndFile: string, filterPatterns: openArray[cstring], singleFilterDescription: string = ""): string = 
  $tinyfd_saveFileDialog(
    cstring title, 
    cstring defaultPathAndFile, 
    cint filterPatterns.len, 
    cast[ptr ptr cschar](filterPatterns.unsafeAddr), 
    cstring singleFilterDescription
  )

proc openFileDialog*(title, defaultPathAndFile: string, filterPatterns: openArray[cstring], singleFilterDescription: string = ""): string = 
  $tinyfd_openFileDialog(
    cstring title, 
    cstring defaultPathAndFile, 
    cint filterPatterns.len, 
    cast[ptr ptr cschar](filterPatterns.unsafeAddr), 
    cstring singleFilterDescription, 
    0
  )

proc openMultipleFilesDialog*(title, defaultPathAndFile: string, filterPatterns: openArray[cstring], singleFilterDescription: string = ""): seq[string] = 
  let paths = tinyfd_openFileDialog(
    cstring title, 
    cstring defaultPathAndFile, 
    cint filterPatterns.len, 
    cast[ptr ptr cschar](filterPatterns.unsafeAddr), 
    cstring singleFilterDescription, 
    1
  )
  if paths.len > 0:
    result = split($paths, '|')

proc selectFolderDialog*(title, defaultPath: string): string = 
  $tinyfd_selectFolderDialog(cstring title, cstring defaultPath)

proc colorChooser*(title, defaultHexRGB: string = ""): tuple[hex: string, rgb: array[3, byte]] = 
  var rgb: array[3, cuchar]
  result.hex = $tinyfd_colorChooser(cstring title, cstring defaultHexRGB, rgb, rgb)
  result.rgb = cast[array[3, byte]](rgb)

proc colorChooser*(title: string, defaultRGB: array[3, byte]): tuple[hex: string, rgb: array[3, byte]] = 
  var rgb: array[3, cuchar]
  result.hex = $tinyfd_colorChooser(title, nil, cast[array[3, cuchar]](defaultRGB), rgb)
  result.rgb = cast[array[3, byte]](rgb)
