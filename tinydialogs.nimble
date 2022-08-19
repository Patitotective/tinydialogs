# Package

version       = "1.0.0"
author        = "Patitotective"
description   = "Tiny file dialogs bindings for Nim"
license       = "MIT"
srcDir        = "src"
skipFiles     = @["tinydialogs/gen.nim"]

# Dependencies

requires "nim >= 1.6.4"

task docs, "Generate documentation":
  exec "nim doc --git.url:https://github.com/Patitotective/tinydialogs --git.commit:main --project --outdir:docs src/tinydialogs.nim"
  exec "echo \"<meta http-equiv=\\\"Refresh\\\" content=\\\"0; url='tinydialogs.html'\\\" />\" >> docs/index.html"
