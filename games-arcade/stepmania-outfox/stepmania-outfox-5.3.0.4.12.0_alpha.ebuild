# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop wrapper xdg

DESCRIPTION="Advanced rhythm game. Designed for both home and arcade use"
HOMEPAGE="https://projectoutfox.com/"

UPPER_PN="${PN^^}"
MY_PN="${UPPER_PN:10:1}${PN:11:2}${UPPER_PN:13:1}${PN:14}"
MAIN_PV="${PV:0:5}"
MY_PV="${PV:6:4}"
ALT_PV="${PV:6:6}"
SHARED_DATE="20211231"
SRC_URI="amd64? ( https://github.com/TeamRizu/OutFox/releases/download/OF${ALT_PV}/OutFox-${MAIN_PV}-alpha-${ALT_PV}-amd64-linux64bit-date-${SHARED_DATE}.tar.gz -> ${P}-amd64.tar.gz )
	arm64? ( https://github.com/TeamRizu/OutFox/releases/download/OF${ALT_PV}/OutFox-${MAIN_PV}-alpha-${ALT_PV}-arm64v8-linuxARM64bit-date-${SHARED_DATE}.tar.gz -> ${P}-arm64.tar.gz )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+bundled-songs +bundled-courses doc"
BDEPEND="!arm? ( dev-util/patchelf )"
RDEPEND="app-arch/bzip2
	app-arch/lz4
	media-libs/alsa-lib
	media-libs/flac
	media-libs/libglvnd
	media-libs/libogg
	media-libs/libsndfile
	media-libs/libsdl2
	media-libs/libvorbis
	media-libs/vulkan-loader
	|| ( media-sound/pulseaudio media-sound/apulse )
	virtual/glu
	virtual/jack
	virtual/opengl
	virtual/udev"
RESTRICT="splitdebug"

S="${WORKDIR}"

src_prepare() {
	if use amd64; then
		cd "${MY_PN/-}-${MAIN_PV}-alpha-${ALT_PV}-amd64-date-${SHARED_DATE}" || die
	elif use arm64; then
		cd "${WORKDIR}/${MY_PN/-}-${MAIN_PV}-alpha-${ALT_PV}-arm64v8-date-${SHARED_DATE}" || die
	else
		die 'Unsupported architecture'
	fi
	einfo 'Removing useless instructions.txt files ...'
	find . -type f -iname 'instructions.txt' -exec rm -f {} \;
	# Built-in songs and courses
	if ! use bundled-courses; then
		einfo 'Removing bundled courses'
		rm -rf "Courses/Default"
	fi
	if ! use bundled-songs; then
		einfo 'Removing bundled songs'
		rm -rf 'Songs/StepMania 5' Songs/Outfox
	fi
	default
}

src_install() {
	if use amd64; then
		cd "${MY_PN/-}-${MAIN_PV}-alpha-${ALT_PV}-amd64-date-${SHARED_DATE}" || die
	elif use arm64; then
		cd "${WORKDIR}/${MY_PN/-}-${MAIN_PV}-alpha-${ALT_PV}-arm64v8-date-${SHARED_DATE}" || die
	else
		die 'Unsupported architecture'
	fi
	local inst="${EPREFIX}/opt/${PN}"
	if ! use arm; then
		patchelf --set-rpath "\$ORIGIN:${EPREFIX}/lib64:${EPREIFX}/usr/lib64" \
			OutFox || die 'Failed to patch ELFs'
		patchelf --replace-needed libbz2.so.1.0 libbz2.so.1 \
			libav{codec,format}.so.* || die "Failed to patch ELFs"
	fi
	make_wrapper "$PN" "${inst}/OutFox" "${inst}" "${inst}" /usr/bin
	insinto "$inst"
	doins -r Announcers Appearance BackgroundEffects BackgroundTransitions \
		BGAnimations Characters Courses Data Scripts Songs
	! use bundled-songs && keepdir "${inst}/Songs"
	! use bundled-courses && keepdir "${inst}/Courses"
	exeinto "${inst}"
	doexe OutFox *.so*
	use doc && dodoc -r Docs/*
	newicon "Appearance/Themes/default/Graphics/Common window icon.png" \
		${PN}.png
	make_desktop_entry "${PN}" "StepMania OutFox"
}
