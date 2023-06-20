# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="GTA Liberty City Stories decompiled and re-built."
HOMEPAGE="https://github.com/GTAmodding/re3/tree/lcs"
SHA="33abd1b4e7a7b19e2d09c796c481c3325c1e2902"
LIBRW_SHA="5501c4fdc7425ff926be59369a13593bb6c81b54"
SRC_URI="https://web.archive.org/web/20210903220219/https://github.com/GTAmodding/re3/archive/${SHA}.zip -> ${P}.zip
	https://github.com/aap/librw/archive/${LIBRW_SHA}.tar.gz -> ${PN}-librw-${LIBRW_SHA}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
IUSE="opus sanitizer sndfile"

DEPEND="media-libs/libsndfile
	media-libs/openal
	media-libs/glew:0
	media-sound/mpg123
	>=media-libs/glfw-3.3.2
	opus? ( media-libs/opus media-libs/opusfile )
	sndfile? ( media-libs/libsndfile )"
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

PATCHES=( "${FILESDIR}/${PN}-link-x11.patch" )

S="${WORKDIR}/re3-${SHA}"

src_unpack() {
	default
	cp -R "librw-${LIBRW_SHA}"/* "${S}/vendor/librw/"
}

src_prepare() {
	cmake_src_prepare
	rm -fR vendor/{libsndfile,mpg123,openal-soft}
	# Other interesting variables:
	# - FINAL (which would enable USE_MY_DOCUMENTS)
	# - PC_PARTICLE
	cat << "EOF" >> src/core/config.h
#define BIND_VEHICLE_FIREWEAPON
#define NEW_WALK_AROUND_ALGORITHM
#define PEDS_REPORT_CRIMES_ON_PHONE
#define SIMPLIER_MISSIONS
#define VC_PED_PORTS
EOF
}

src_configure() {
	local mycmakeargs=(
		"-DRELCS_WITH_ASAN=$(usex sanitizer)"
		"-DRELCS_WITH_LIBSNDFILE=$(usex sndfile)"
		"-DRELCS_WITH_OPUS=$(usex opus)"
		-DLIBRW_PLATFORM=GL3
		-DBUILD_SHARED_LIBS=OFF
		-DLIBRW_TOOLS=OFF
		-DRELCS_AUDIO=OAL
		-DRELCS_INSTALL=ON
		-DRELCS_VENDORED_LIBRW=ON
		"-DCMAKE_INSTALL_PREFIX=${EPREFIX}/usr/share/${PN}"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dosym "../share/${PN}/reLCS" /usr/bin/reLCS
	einstalldocs
}
