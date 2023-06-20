# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake flag-o-matic xdg

DESCRIPTION="PS3 emulator and debugger."
HOMEPAGE="https://rpcs3.net/ https://github.com/RPCS3/rpcs3"
ASMJIT_SHA="c59847629d3a19da4d10f0be4ac33b43fc4a100f"
HIDAPI_SHA="8b43a97a9330f8b0035439ce9e255e4be202deca"
ITTAPI_VERSION="3.18.12"
LLVM_SHA="cd89023f797900e4492da58b7bed36f702120011"
SOUNDTOUCH_SHA="83cfba67b6af80bb9bfafc0b324718c4841f2991"
YAML_CPP_SHA="0b67821f307e8c6bf0eba9b6d3250e3cf1441450"
SRC_URI="https://github.com/RPCS3/rpcs3/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/llvm/llvm-project/archive/${LLVM_SHA}.tar.gz -> ${PN}-llvm-${LLVM_SHA:0:7}.tar.gz
	https://github.com/asmjit/asmjit/archive/${ASMJIT_SHA}.tar.gz -> ${PN}-asmjit-${ASMJIT_SHA:0:7}.tar.gz
	https://github.com/RPCS3/hidapi/archive/${HIDAPI_SHA}.tar.gz -> ${PN}-hidapi-${HIDAPI_SHA:0:7}.tar.gz
	https://github.com/RPCS3/yaml-cpp/archive/${YAML_CPP_SHA}.tar.gz -> ${PN}-yaml-cpp-${YAML_CPP_SHA:0:7}.tar.gz
	https://github.com/intel/ittapi/archive/refs/tags/v${ITTAPI_VERSION}.tar.gz -> ${PN}-ittapi-${ITTAPI_VERSION}.tar.gz
	https://github.com/RPCS3/soundtouch/archive/${SOUNDTOUCH_SHA}.tar.gz -> ${PN}-${SOUNDTOUCH_SHA:0:7}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="faudio joystick +llvm vulkan wayland"
REQUIRED_USE="wayland? ( vulkan )"

DEPEND=">=dev-libs/flatbuffers-2.0.6
	dev-libs/pugixml
	>=dev-libs/wolfssl-4.7.0[writedup]
	media-libs/cubeb
	dev-libs/xxhash
	dev-util/spirv-tools
	dev-qt/qtconcurrent
	dev-qt/qtcore:5
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtmultimedia:5[widgets]
	dev-qt/qtnetwork:5
	dev-qt/qtsvg
	dev-qt/qtwidgets:5
	media-libs/glew:0
	media-libs/libglvnd[X]
	media-libs/libpng:*
	media-libs/openal
	media-libs/rtmidi
	media-video/ffmpeg
	net-libs/miniupnpc
	net-misc/curl
	sys-libs/ncurses
	sys-libs/zlib
	media-libs/libjpeg-turbo
	virtual/libusb:1
	virtual/udev
	x11-libs/libX11
	faudio? ( app-emulation/faudio )
	joystick? ( dev-libs/libevdev )
	vulkan? (
		media-libs/vulkan-loader
		dev-util/glslang )
	wayland? ( dev-libs/wayland )"
RDEPEND="${DEPEND} sys-devel/gdb"
BDEPEND=">=sys-devel/gcc-9
	dev-util/spirv-headers"

PATCHES=(
	"${FILESDIR}/${PN}-0001-versioning.patch"
	"${FILESDIR}/${PN}-0002-vk-use-system-glslangtospv.h.patch"
	"${FILESDIR}/${PN}-0003-add-use_wayland.patch"
	"${FILESDIR}/${PN}-0004-allow-use-of-system-spirv-an.patch"
	"${FILESDIR}/${PN}-0005-allow-system-cubeb.patch"
	"${FILESDIR}/${PN}-0006-support-for-system-miniupnpc.patch"
	"${FILESDIR}/${PN}-0007-remove-extra.patch"
	"${FILESDIR}/${PN}-0008-allow-system-rtmidi.patch"
	"${FILESDIR}/${PN}-9999-ittapi-remove-git-co.patch"
)

src_prepare() {
	rmdir "${S}/3rdparty/llvm/llvm" || die
	mv "${WORKDIR}/llvm-project-${LLVM_SHA}" "${S}/3rdparty/llvm/llvm" || die
	rmdir "${S}/3rdparty/hidapi/hidapi" || die
	mv "${WORKDIR}/hidapi-${HIDAPI_SHA}" "${S}/3rdparty/hidapi/hidapi" || die
	rmdir "${S}/3rdparty/yaml-cpp/yaml-cpp" || die
	mv "${WORKDIR}/yaml-cpp-${YAML_CPP_SHA}" "${S}/3rdparty/yaml-cpp/yaml-cpp" || die
	rmdir "${S}/3rdparty/asmjit/asmjit" || die
	mv "${WORKDIR}/asmjit-${ASMJIT_SHA}" "${S}/3rdparty/asmjit/asmjit" || die
	{ echo "#define RPCS3_GIT_VERSION \"0000-v${PV}\""
		echo '#define RPCS3_GIT_BRANCH "master"'
		echo '#define RPCS3_GIT_FULL_BRANCH "RPCS3/rpcs3/master"'
		echo '#define RPCS3_GIT_VERSION_NO_UPDATE 1'; } > rpcs3/git-version.h
	sed -re 's/MATCHES "\^\(DEBUG\|RELEASE\|RELWITHDEBINFO\|MINSIZEREL\)\$/MATCHES "^(DEBUG|RELEASE|RELWITHDEBINFO|MINSIZEREL|GENTOO)/' \
		-i "${S}/3rdparty/llvm/llvm/llvm/CMakeLists.txt" || die
	sed -e '/find_program(CCACHE_FOUND/d' -i CMakeLists.txt || die
	sed -re '/\s+add_compile_options\(-Werror=missing-noreturn\).*/d' \
		-e '/\s+add_compile_options\(-Werror=old-style-cast\).*/d' \
		-i buildfiles/cmake/ConfigureCompiler.cmake || die
	mv "${WORKDIR}/ittapi-${ITTAPI_VERSION}" "${WORKDIR}/ittapi" || die
	rmdir "${S}/3rdparty/SoundTouch/soundtouch" || die
	mv "${WORKDIR}/soundtouch-${SOUNDTOUCH_SHA}" "${S}/3rdparty/SoundTouch/soundtouch" || die
	cmake_src_prepare
}

src_configure() {
	append-cflags -DNDEBUG
	append-cxxflags -DNDEBUG
	filter-lto
	mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DBUILD_TESTING=OFF
		-DUSE_PRECOMPILED_HEADERS=OFF
		-DUSE_DISCORD_RPC=OFF
		"-DUSE_FAUDIO=$(usex faudio)"
		"-DUSE_SYSTEM_FAUDIO=$(usex faudio)"
		"-DUSE_LIBEVDEV=$(usex joystick)"
		-DUSE_NATIVE_INSTRUCTIONS=OFF
		-DUSE_SYSTEM_CUBEB=ON
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_FFMPEG=ON
		-DUSE_SYSTEM_FLATBUFFERS=ON
		-DUSE_SYSTEM_GLSLANG=ON
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_LIBUSB=ON
		-DUSE_SYSTEM_MINIUPNP=ON
		-DUSE_SYSTEM_PUGIXML=ON
		-DUSE_SYSTEM_RTMIDI=ON
		-DUSE_SYSTEM_WOLFSSL=ON
		-DUSE_SYSTEM_XXHASH=ON
		-DUSE_SYSTEM_ZLIB=ON
		"-DUSE_VULKAN=$(usex vulkan)"
		"-DUSE_WAYLAND=$(usex wayland)"
		"-DWITH_LLVM=$(usex llvm)"
		-Wno-dev
	)
	cmake_src_configure
}
