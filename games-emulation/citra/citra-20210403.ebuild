# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake xdg-utils

DESCRIPTION="A Nintendo 3DS emulator."
HOMEPAGE="https://citra-emu.org/"
MY_SHA="b3cab3c4507dc1b28e2f15b2e0c9f473f6e1959f"
LODEPNG_SHA="31d9704fdcca0b68fb9656d4764fa0fb60e460c2"
SOUNDTOUCH_SHA="060181eaf273180d3a7e87349895bd0cb6ccbf4a"
DYNARMIC_SHA="f9d84871fb6dd41c47945d649dc9017aa3762125"
SRC_URI="https://github.com/citra-emu/citra/archive/${MY_SHA}.tar.gz -> ${P}.tar.gz
	https://github.com/lvandeve/lodepng/archive/${LODEPNG_SHA}.tar.gz -> ${PN}-lodepng-${LODEPNG_SHA:0:7}.tar.gz
	https://github.com/citra-emu/ext-soundtouch/archive/${SOUNDTOUCH_SHA}.tar.gz -> ${PN}-soundtouch-${SOUNDTOUCH_SHA:0:7}.tar.gz
	https://api.citra-emu.org/gamedb/ -> ${PN}-compatibility_list-${PV}.json
	https://github.com/citra-emu/dynarmic/archive/${DYNARMIC_SHA}.tar.gz -> ${PN}-dynarmic-${DYNARMIC_SHA:0:7}.tar.gz"

LICENSE="ZLIB BSD GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="web-service"

DEPEND="app-arch/zstd
	dev-cpp/catch:0
	dev-libs/boost:0
	dev-libs/crypto++:=
	dev-libs/cubeb
	dev-libs/libfmt:=
	dev-libs/mp
	dev-libs/teakra
	>=dev-libs/xbyak-5.941
	dev-util/nihstro
	media-libs/libsdl2
	media-video/ffmpeg
	net-libs/enet:="
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-inih.patch"
	"${FILESDIR}/${PN}-system-libs.patch"
)

S="${WORKDIR}/${PN}-${MY_SHA}"

src_prepare() {
	rmdir "${S}/externals/lodepng/lodepng" \
		"${S}/externals/"{soundtouch,dynarmic} || die
	mv "${WORKDIR}/ext-soundtouch-${SOUNDTOUCH_SHA}" "${S}/externals/soundtouch" || die
	mv "${WORKDIR}/lodepng-${LODEPNG_SHA}" "${S}/externals/lodepng/lodepng" || die
	mv "${WORKDIR}/dynarmic-${DYNARMIC_SHA}" "${S}/externals/dynarmic" || die
	mkdir -p "${WORKDIR}/${P}_build/dist/compatibility_list" || die
	cp "${DISTDIR}/${PN}-compatibility_list-${PV}.json" "${WORKDIR}/${P}_build/dist/compatibility_list/compatibility_list.json" || die
	sed -e 's/fmt::fmt/fmt/g' -i externals/dynarmic/src/CMakeLists.txt || die
	sed -e 's|${CMAKE_CURRENT_SOURCE_DIR}/xbyak/xbyak|/usr/include/xbyak|' \
		-i externals/dynarmic/externals/CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DDISABLE_SUBMODULE_CHECK=ON
		-DENABLE_FFMPEG_AUDIO_DECODER=ON
		-DENABLE_FFMPEG_VIDEO_DUMPER=ON
		-DENABLE_WEB_SERVICE=$(usex web-service)
		-DUSE_SYSTEM_BOOST=ON
		-DUSE_SYSTEM_CRYPTOPP=ON
		-DUSE_SYSTEM_CUBEB=ON
		-DUSE_SYSTEM_ENET=ON
		-DUSE_SYSTEM_FMT=ON
		-DUSE_SYSTEM_INIH=ON
		-DUSE_SYSTEM_TEAKRA=ON
		-DUSE_SYSTEM_XBYAK=ON
		-DUSE_SYSTEM_ZSTD=ON
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}
