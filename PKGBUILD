_pkgname=seiwm
pkgname=$_pkgname-git
pkgver=6.4.r1929.499d9e5
pkgrel=1
pkgdesc="A simple and effective dynamic window manager"
url=https://github.com/Fuwn/seiwm
arch=(i686 x86_64)
license=(MIT)
makedepends=(git)
depends=(freetype2 libx11 libxft)
optdepends=(
	'dmenu: program launcher'
	'st: terminal emulator')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/Fuwn/seiwm)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	echo "CPPFLAGS+=${CPPFLAGS}" >>config.mk
	echo "CFLAGS+=${CFLAGS}" >>config.mk
	echo "LDFLAGS+=${LDFLAGS}" >>config.mk
	# to use a custom config.h, place it in the package directory
	if [[ -f ${SRCDEST}/config.h ]]; then
		cp "${SRCDEST}/config.h" .
	fi
}

build() {
	cd "$_pkgname"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
