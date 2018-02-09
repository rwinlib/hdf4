_realname=hdf
pkgbase=mingw-w64-${_realname}
pkgname=("${MINGW_PACKAGE_PREFIX}-${_realname}")
pkgver=4.2.13
pkgrel=1
pkgdesc="HDF4"
arch=('any')
url='https://support.hdfgroup.org/products/hdf4/'
license=('GPL2')
source=("https://support.hdfgroup.org/ftp/HDF/HDF_Current/src/${_realname}-${pkgver}.tar.gz")
sha256sums=('be9813c1dc3712c2df977d4960e1f13f20f447dfa8c3ce53331d610c1f470483')

prepare() {
  cd ${srcdir}/${_realname}-${pkgver}
  sed -i '873s/-pc-cygwin/mingw/' configure.ac
  sed -i '50s/WIN32/MSVC/' mfhdf/fortran/mfsdf.c
  sed -i 's/WIN32/MSVC/' mfhdf/libsrc/local_nc.h
  autoreconf -fiv
}

build() {
  [[ -d "${srcdir}"/build-${CARCH} ]] && rm -rf "${srcdir}"/build-${CARCH}
  mkdir -p "${srcdir}"/build-${CARCH} && cd "${srcdir}"/build-${CARCH}
  ../${_realname}-${pkgver}/configure \
    --prefix="/usr/local" \
    --build=${MINGW_CHOST} \
    --host=${MINGW_CHOST} \
    --target=${MINGW_CHOST} \
    --disable-fortran \
    --disable-netcdf

  cd hdf
  make
  cd ../mfhdf/libsrc
  make
  cd ../xdr
  make || true
  sed -i 's#LIBS =#LIBS = .libs/libxdr.a -lws2_32#g' Makefile
  make
}

package() {
  cd "${srcdir}"/build-${CARCH}/hdf
  make install DESTDIR="${pkgdir}"
  cd "${srcdir}"/build-${CARCH}/mfhdf/libsrc
  make install DESTDIR="${pkgdir}"
  cd "${srcdir}"/build-${CARCH}/mfhdf/xdr
  make install DESTDIR="${pkgdir}"
}
