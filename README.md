# tinydialogs
[Tiny file dialogs](https://sourceforge.net/projects/tinyfiledialogs) _v3.8.8_ Nim bindings.

## Example
```nim
import std/os
import tinydialogs

beep()
notifyPopup("Message", "You just received a message from Beef", "info")
echo messageBox("Hey", "Do you want to receive more notifications?", "yesno", "question", 1)
echo inputBox("Name", "Please enter your password :]", "")
echo saveFileDialog("Save the file", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text file") # "\0" for an emtpy file
echo openFileDialog("Open the file", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text file")
echo openMultipleFilesDialog("Open the files", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text files")
echo selectFolderDialog("Open the directory of the file", getCurrentDir())
echo colorChooser("Choose a color")
echo colorChooser("Choose a color", "#000000") # Hex
echo colorChooser("Choose a color", [0u8, 0u8, 0u8]) # RGB
```

## Docs
### `beep`
```nim
proc beep()
```
A beep sound.

### `notifyPopup`
```nim
proc notifyPopup(title, message, iconType: string): int
```
- `message`: It may contain `\n\t`.
- `iconType`: `"info"`, `"warning"` or `"error"`.

### `messageBox`
```nim
proc messageBox(title, message, dialogType, iconType: string, defaultButton: range[0..2]): int 
```
- `message`: It may contain `\n\t`.
- `dialogType`: `"ok"`, `"okcancel"`, `"yesno"` or `"yesnocancel"`.
- `iconType`: `"info"`, `"warning"`, `"error"` or `"question"`.
- `defaultButton`: `0` for cancel/no, `1` for ok/yes or `2` for no in `yesnocancel`.
Returns `0` for cancel/no, `1` for ok/yes or `2` for no in `yesnocancel`.

### `inputBox`
```nim
proc inputBox(title, message, defaultInput: string): string
```
- `message`: `\n\t` have no effect.
- `defaultInput`: `""` for a password box or something else for an input box. (See https://github.com/Patitotective/tinydialogs/issues/1)

### `saveFileDialog`
```nim
proc saveFileDialog(title, defaultPathAndFile: string, filterPatterns: openArray[string], singleFilterDescription: string = ""): string
```
- `defaultPathAndFile`: For an empty "file" use a trailing slash `dir/` (or using `std/os` `"dir" / "\0"`).
- `filterPatterns`: e.i.: `["*.txt", "*.text"]`.
- `singleFilterDescriptor`: Text to show instead of the `filterPatterns`.
Returns the selected file path (empty string when cancelled).  
**NOTE:** tinyfiledialogs at the moment only supports one filter. `filterPatterns` are for a single filter.

### `openFileDialog`
```nim
proc openFileDialog(title, defaultPathAndFile: string, filterPatterns: openArray[string], singleFilterDescription: string = ""): string
```
- `defaultPathAndFile`: For an empty "file" use a trailing slash `dir/` (or using `std/os` `"dir" / "\0"`).
- `filterPatterns`: e.i.: `["*.txt", "*.text"]`.
- `singleFilterDescriptor`: Text to show instead of the `filterPatterns`.
Returns the selected file path (empty string when cancelled).  
**NOTE:** tinyfiledialogs at the moment only supports one filter. `filterPatterns` are a single filter.

### `openMultipleFilesDialog`
```nim
proc openMultipleFilesDialog(title, defaultPathAndFile: string, filterPatterns: openArray[string], singleFilterDescription: string = ""): seq[string]
```
- `defaultPathAndFile`: For an empty "file" use a trailing slash `dir/` (or using `std/os` `"dir" / "\0"`).
- `filterPatterns`: e.i.: `["*.txt", "*.text"]`.
- `singleFilterDescriptor`: Text to show instead of the `filterPatterns`.
Returns the selected file path (empty string when cancelled).  
**NOTE:** tinyfiledialogs at the moment only supports one filter. `filterPatterns` are a single filter.

### `selectFolderDialog`
```nim
proc selectFolderDialog(title, defaultPath: string): string
```
Returns the selected file path (empty string when cancelled).  

### `colorChooser`
```nim
proc colorChooser(title, defaultHexRGB: string = ""): tuple[hex: string, rgb: array[3, byte]]
proc colorChooser(title: string, defaultRGB: array[3, byte]): tuple[hex: string, rgb: array[3, byte]]
```
When no color is selected `("", [0u8, 0u8, 0u8])` is returned.
