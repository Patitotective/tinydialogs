# Generate Bindings

Make sure to have futhark installed

```sh
nimble install futhark
```

Compile and run src/tinydialogs/gen.nim

```sh
nim c -r src/tinydialogs/gen.nim
```

Copy the generated bindings from the cache folder

```sh
cp ~/.cache/nim/gen_d/futhark_*.nim src/tinydialogs/bindings.nim
```
