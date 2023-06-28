# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit linux-mod-r1 udev

DESCRIPTION="CX2388x direct ADC capture driver."
HOMEPAGE="https://github.com/happycube/cxadc-linux3"
SHA="cc910373501de410ec0f5f5edd2154dd7ccea16b"
SRC_URI="https://github.com/happycube/cxadc-linux3/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}-linux3-${SHA}"

src_prepare() {
	echo 'leveladj:' >> Makefile
	# shellcheck disable=SC2016
	echo -e '\tcc $(CFLAGS) -o cxleveladj leveladj.c' >> Makefile
	default
}

src_compile() {
	local modlist=( "${PN}" )
	local modargs=( KDIR="${KERNEL_DIR}" clean default leveladj )
	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
	udev_dorules "${PN}.rules"
	insinto /lib/modprobe.d
	doins "${PN}.conf"
	dobin utils/c* cxleveladj
}
