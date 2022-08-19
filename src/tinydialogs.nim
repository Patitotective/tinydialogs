## [Tiny file dialogs](https://sourceforge.net/projects/tinyfiledialogs) _v3.8.8_ Nim bindings.
## Example
## ```nim
## import std/os
## import tinydialogs
## 
## beep()
## notifyPopup("Message", "You just received a message from Beef", Info)
## echo messageBox("Hey", "Do you want to receive more notifications?", YesNo, Question, Yes)
## echo inputBox("Name", "Please enter your password :]", "")
## echo saveFileDialog("Save the file", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text file") # "\0" for an emtpy file
## echo openFileDialog("Open the file", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text file")
## echo openMultipleFilesDialog("Open the files", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text files")
## echo selectFolderDialog("Open the directory of the file", getCurrentDir())
## echo colorChooser("Choose a color")
## echo colorChooser("Choose a color", "#000000") # Hex
## echo colorChooser("Choose a color", [0u8, 0u8, 0u8]) # RGB
## ```

import std/[strutils, sugar]
import tinydialogs/bindings
export bindings

when defined(Windows):
  {.passL: "-LC:/mingw/lib -lcomdlg32 -lole32".}

{.compile: "tinydialogs/tinyfiledialogs/tinyfiledialogs.c".}

type
  IconType* = enum
    Info = "info", 
    Warning = "warning", 
    Error = "error", 
    Question = "question" ## Question only works in the message box.

  DialogType* = enum
    Ok = "ok", 
    OkCancel = "okcancel", 
    YesNo = "yesno", 
    YesNoCancel = "yesnocancel"

  Button* = enum
    Cancel, ## Cancel/No
    Yes, ## Ok/Yes
    No ## No in DialogType.YesNoCancel

proc beep*() = 
  ## A beep sound.
  tinyfd_beep()

proc notifyPopup*(title, message: string, iconType: IconType) = 
  ## `message` may contain `\n\t`.
  discard tinyfd_notifyPopup(cstring title, cstring message, cstring $iconType)

proc messageBox*(title, message: string, dialogType: DialogType, iconType: IconType, defaultButton: Button): Button = 
  ## `message` may contain `\n\t`.
  Button tinyfd_messageBox(cstring title, cstring message, cstring $dialogType, cstring $iconType, cint defaultButton)

proc inputBox*(title, message, defaultInput: string): string = 
  ## `\n\t` have no effect in `message`.
  ## 
  ## Use `""` in `defaultInput` for a password box or something else for an input box. ([#1](https://github.com/Patitotective/tinydialogs/issues/1) related)
  $tinyfd_inputBox(cstring title, cstring message, cstring defaultInput)

proc saveFileDialog*(title, defaultPath: string, filterPatterns: openArray[string], singleFilterDescription = ""): string = 
  ## Returns the selected file (or empty string when cancelled).
  ## 
  ## For an empty "file" use a trailing slash `dir/` in `defaultPath` (or using `std/os` `"dir" / "\0"`).
  ## 
  ## Example of `filterPatterns`: `["*.txt", "*.text"]`.
  ## 
  ## `singleFilterDescriptor` is the text to show instead of `filterPatterns`. **Note:** tinyfiledialogs at the moment only supports one filter.

  let filterPatterns = collect:
    for patt in filterPatterns: cstring patt

  $tinyfd_saveFileDialog(
    cstring title, 
    cstring defaultPath, 
    cint filterPatterns.len, 
    cast[ptr ptr cschar](filterPatterns[0].unsafeAddr), 
    cstring singleFilterDescription
  )

proc openFileDialog*(title, defaultPath: string, filterPatterns: openArray[string], singleFilterDescription = ""): string = 
  ## Returns the selected file (or empty string when cancelled).
  ## 
  ## For an empty "file" use a trailing slash `dir/` in `defaultPath` (or using `std/os` `"dir" / "\0"`).
  ## 
  ## Example of `filterPatterns`: `["*.txt", "*.text"]`.
  ## 
  ## `singleFilterDescriptor` is the text to show instead of `filterPatterns`. **Note:** tinyfiledialogs at the moment only supports one filter.

  let filterPatterns = collect:
    for patt in filterPatterns: cstring patt

  $tinyfd_openFileDialog(
    cstring title, 
    cstring defaultPath, 
    cint filterPatterns.len, 
    cast[ptr ptr cschar](filterPatterns[0].unsafeAddr), 
    cstring singleFilterDescription, 
    0
  )

proc openMultipleFilesDialog*(title, defaultPath: string, filterPatterns: openArray[string], singleFilterDescription = ""): seq[string] = 
  ## Returns the selected files (or empty string when cancelled).
  ## 
  ## For an empty "file" use a trailing slash `dir/` in `defaultPath` (or using `std/os` `"dir" / "\0"`).
  ## 
  ## Example of `filterPatterns`: `["*.txt", "*.text"]`.
  ## 
  ## `singleFilterDescriptor` is the text to show instead of `filterPatterns`. **Note:** tinyfiledialogs at the moment only supports one filter.

  let filterPatterns = collect:
    for patt in filterPatterns: cstring patt

  let paths = tinyfd_openFileDialog(
    cstring title, 
    cstring defaultPath, 
    cint filterPatterns.len, 
    cast[ptr ptr cschar](filterPatterns[0].unsafeAddr), 
    cstring singleFilterDescription, 
    1
  )
  if paths.len > 0:
    result = split($paths, '|')

proc selectFolderDialog*(title, defaultPath: string): string = 
  ## Returns the selected folder (or empty when cancelled).

  $tinyfd_selectFolderDialog(cstring title, cstring defaultPath)

proc colorChooser*(title, defaultHexRGB = ""): tuple[hex: string, rgb: array[3, byte]] = 
  ## Returns `("", [0u8, 0u8, 0u8])` when no color is selected.
  var rgb: array[3, cuchar]
  result.hex = $tinyfd_colorChooser(cstring title, cstring defaultHexRGB, rgb, rgb)
  result.rgb = cast[array[3, byte]](rgb)

proc colorChooser*(title: string, defaultRGB: array[3, byte]): tuple[hex: string, rgb: array[3, byte]] = 
  ## Returns `("", [0u8, 0u8, 0u8])` when no color is selected.
  var rgb: array[3, cuchar]
  result.hex = $tinyfd_colorChooser(title, nil, cast[array[3, cuchar]](defaultRGB), rgb)
  result.rgb = cast[array[3, byte]](rgb)
