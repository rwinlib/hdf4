# HDf4

This library is really old and has not really been tested on MINGW. But it has been requested to support this driver in gdal for R (in sf and rgdal).

Note that the `PKGBUILD` has some `sed` lines to comment out `_WIN32` blocks that specific to MSVC.

If building `mfhdf` fails you may need to first make `mfhdf/xdr` and install to `/usr/local/` and then start from scratch.
