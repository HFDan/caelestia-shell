# caelestia-shell

# Maintainer: DO NOT DISTRIBUTE

_pkgname='caelestia-shell-dani'
pkgname="$_pkgname-git"
pkgver=1.3.2.r11.g1075a7e
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='git@github.com/HFDan/caelestia-shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'libcava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative')
makedepends=('git' 'cmake' 'ninja')
provides=($_pkgname caelestia-shell)
conflicts=($_pkgname caelestia-shell)
source=("$pkgname::git+ssh://$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/ -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
