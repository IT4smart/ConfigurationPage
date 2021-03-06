#!/bin/bash
# build some functions
NUM_CPUS=`nproc`
echo "###############"
echo "### Using ${NUM_CPUS} cores"
echo "###############"

SRC_DIR=$(pwd)

function fix_arch_ctl()
{
	ARCH=$(dpkg --print-architecture)
	sed '/Architecture/d' -i $1
	test ${ARCH}x == i386x && echo "Architecture: i386" >> $1
	test ${ARCH}x == armhfx && echo "Architecture: armhf" >> $1
	test ${ARCH}x == amd64x && echo "Architecture: amd64" >> $1
	test ${ARCH}x == x86_64x && echo "Architecture: amd64" >> $1
	sed '$!N; /^\(.*\)\n\1$/!P; D' -i $1
}
function dpkg_build()
{
	# Calculate package size and update control file before packaging.
	if [ ! -e "$1" -o ! -e "$1/DEBIAN/control" ]; then exit 1; fi
	sed '/^Installed-Size/d' -i "$1/DEBIAN/control"
	size=$(du -s --apparent-size "$1" | awk '{print $1}')
	echo "Installed-Size: $size" >> "$1/DEBIAN/control"
	dpkg -b "$1" "$2"
}
# build
cd ConfigPage
cmake .
make "-j${NUM_CPUS}"
# get back to root
cd ..
sed '/Package/d' -i "${SRC_DIR}/files/DEBIAN/control"
sed '/Depends/d' -i "${SRC_DIR}/files/DEBIAN/control"
echo "Package: configpage" >> "${SRC_DIR}/files/DEBIAN/control"
echo "Depends: qt5-default, python" >> "${SRC_DIR}/files/DEBIAN/control"
mkdir -p files/opt/IT4smart/configurationpage/ConfigPage
cp -ar ConfigPage/ConfigPage files/opt/IT4smart/configurationpage/ConfigPage
cp -ar ConfigPage/certificates files/opt/IT4smart/configurationpage/ConfigPage
cp -ar ConfigPage/scripts files/opt/IT4smart/configurationpage/ConfigPage
cp -ar ConfigPage/setting files/opt/IT4smart/configurationpage/ConfigPage
fix_arch_ctl "files/DEBIAN/control"
dpkg_build files "${1}-configpage.deb"

# get current version of this package
version=$(awk '/^Version:/ { print $2 }' files/DEBIAN/control)
package=$(awk '/^Package:/ { print $2 }' files/DEBIAN/control)
architecture=$(awk '/^Architecture:/ { print $2 }' files/DEBIAN/control)

mv "${1}-configpage.deb" "${package}_${version}_${architecture}.deb"
