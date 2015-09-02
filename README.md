# gn_tool
Downloads GN binaries.
Currently works for Linux and Windows, Mac is untested.


GN (generate ninja) is a meta-build system. Used in chromium and mojo.

- Requires python 2.6 or 2.7
- Requires Powershell 3 on Windows
- Requires wget on Linux and Mac

Usage:
  1 - clone repo
  2 - start shell (or cmd) cd into gn_tool
  3 - Linux/Mac:: run bootstrap.sh Windows: run bootstrap.ps1

Notes:
- Downloads and runs gsutil (googlestorage one)
- You might need to chmod +x the boostrap file.
- The current set of GN binaries are pinned by hash and are from at least August 2015.
