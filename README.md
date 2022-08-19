# tinydialogs
High-level [Tiny file dialogs](https://sourceforge.net/projects/tinyfiledialogs) _v3.8.8_ Nim bindings.

## Example
```nim
import std/os
import tinydialogs

beep()
notifyPopup("Message", "You just received a message from Beef", Info)
echo messageBox("Hey", "Do you want to receive more notifications?", YesNo, Question, Yes)
echo inputBox("Name", "Please enter your password :]", "")
echo saveFileDialog("Save the file", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text file") # "\0" for an emtpy file
echo openFileDialog("Open the file", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text file")
echo openMultipleFilesDialog("Open the files", getCurrentDir() / "\0", ["*.txt", "*.text"], "Text files")
echo selectFolderDialog("Open the directory of the file", getCurrentDir())
echo colorChooser("Choose a color")
echo colorChooser("Choose a color", "#000000") # Hex
echo colorChooser("Choose a color", [0u8, 0u8, 0u8]) # RGB
```

Read more at the [docs](https://patitotective.github.io/tinydialogs).

## About
- GitHub: https://github.com/Patitotective/ImTemplate.
- Discord: https://discord.gg/as85Q4GnR6.

Contact me:
- Discord: **Patitotective#0127**.
- Twitter: [@patitotective](https://twitter.com/patitotective).
- Email: **cristobalriaga@gmail.com**.
