# Introduction

GitHub actions to build open-source tools.

## SQLite3 shell

See `sqlite3-shell` folder.

* Add Unicode support to `sqlite3.exe`

<img alt="Screenshot of sqlite3.exe" src="../assets/sqlite3-shell-unicode.png?raw=true" width="320">

## WOFF2 tool

See `woff2` folder.

* Compiled `woff2_compress`, `woff2_decompress`, `woff2_info` into a single program
  ```
  woff2 c myfont.ttf
  woff2 d myfont.woff2
  woff2 i myfont.woff2
  ```

## MiniWeb

See `miniweb` folder.

* Support `.json`, `.svg` and `.svgz`
* Support VC++ build

## License
Anything in `.github` is released under the [WTFPL](http://www.wtfpl.net/about/).
