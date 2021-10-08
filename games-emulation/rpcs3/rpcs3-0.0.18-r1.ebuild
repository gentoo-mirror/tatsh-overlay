# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake xdg

DESCRIPTION="PS3 emulator and debugger."
HOMEPAGE="https://rpcs3.net/ https://github.com/RPCS3/rpcs3"
MY_SHA="v0.0.18"
ASMJIT_SHA="723f58581afc0f4cb16ba13396ff77e425896847"
GLSLANG_SHA="ae2a562936cc8504c9ef2757cceaff163147834f"
HIDAPI_SHA="01f601a1509bf9c67819fbf521df39644bab52d5"
LLVM_SHA="5836324d6443a62ed09b84c125029e98324978c3"
SPIRV_HEADERS_SHA="3fdabd0da2932c276b25b9b4a988ba134eba1aa6"
SPIRV_TOOLS_SHA="895927bd3f2d653f40cebab55aa6c7eabde30a86"
YAML_CPP_SHA="6a211f0bc71920beef749e6c35d7d1bcc2447715"
SRC_URI="https://github.com/RPCS3/rpcs3/archive/${MY_SHA}.tar.gz -> ${P}.tar.gz
	https://github.com/RPCS3/llvm-mirror/archive/${LLVM_SHA}.tar.gz -> ${PN}-llvm-${LLVM_SHA:0:7}.tar.gz
	https://github.com/asmjit/asmjit/archive/${ASMJIT_SHA}.tar.gz -> ${PN}-asmjit-${ASMJIT_SHA:0:7}.tar.gz
	https://github.com/RPCS3/hidapi/archive/${HIDAPI_SHA}.tar.gz -> ${PN}-hidapi-${HIDAPI_SHA:0:7}.tar.gz
	https://github.com/RPCS3/yaml-cpp/archive/${YAML_CPP_SHA}.tar.gz -> ${PN}-yaml-cpp-${YAML_CPP_SHA:0:7}.tar.gz
	https://github.com/KhronosGroup/glslang/archive/${GLSLANG_SHA}.tar.gz -> ${PN}-glslang-${GLSLANG_SHA:0:7}.tar.gz
	https://github.com/KhronosGroup/SPIRV-Tools/archive/${SPIRV_TOOLS_SHA}.tar.gz -> ${PN}-SPIRV-Tools-${SPIRV_TOOLS_SHA:0:7}.tar.gz
	https://github.com/KhronosGroup/SPIRV-Headers/archive/${SPIRV_HEADERS_SHA}.tar.gz -> ${PN}-SPIRV-Headers-${SPIRV_HEADERS_SHA:0:7}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="alsa faudio joystick +llvm pulseaudio vulkan wayland"
REQUIRED_USE="wayland? ( vulkan )"

DEPEND="dev-libs/pugixml
	dev-libs/flatbuffers
	dev-libs/libusb
	>=dev-libs/wolfssl-4.7.0
	dev-libs/xxhash
	dev-qt/qtcore:5
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	media-libs/libpng:*
	media-libs/openal
	media-video/ffmpeg
	sys-libs/zlib
	virtual/jpeg:=
	virtual/opengl
	alsa? ( media-libs/alsa-lib )
	faudio? ( app-emulation/faudio )
	joystick? ( dev-libs/libevdev )
	pulseaudio? ( media-sound/pulseaudio )
	vulkan? ( media-libs/vulkan-loader )
	wayland? ( dev-libs/wayland )"
RDEPEND="${DEPEND} sys-devel/gdb"
BDEPEND=">=sys-devel/gcc-9"
# Eventually:
# dev-util/spirv-headers
# dev-util/spirv-tools
# dev-util/glslang

S="${WORKDIR}/${PN}-${MY_SHA:1}"
PATCHES=(
	"${FILESDIR}/${PN}-0003-add-missing-include-fix-branch-names.patch"
	"${FILESDIR}/${PN}-0004-add-use_wayland.patch"
	"${FILESDIR}/${PN}-0006-vk.patch"
)

src_prepare() {
	rmdir "${S}/llvm" || die
	mv "${WORKDIR}/llvm-mirror-${LLVM_SHA}" "${S}/llvm" || die
	rmdir "${S}/3rdparty/hidapi/hidapi" || die
	mv "${WORKDIR}/hidapi-${HIDAPI_SHA}" "${S}/3rdparty/hidapi/hidapi" || die
	rmdir "${S}/3rdparty/yaml-cpp/yaml-cpp" || die
	mv "${WORKDIR}/yaml-cpp-${YAML_CPP_SHA}" "${S}/3rdparty/yaml-cpp/yaml-cpp" || die
	rmdir "${S}/3rdparty/asmjit/asmjit" || die
	mv "${WORKDIR}/asmjit-${ASMJIT_SHA}" "${S}/3rdparty/asmjit/asmjit" || die
	rmdir "${S}/3rdparty/SPIRV/SPIRV-"{Headers,Tools} || die
	mv "${WORKDIR}/SPIRV-Tools-${SPIRV_TOOLS_SHA}" "${S}/3rdparty/SPIRV/SPIRV-Tools" || die
	mv "${WORKDIR}/SPIRV-Headers-${SPIRV_HEADERS_SHA}" "${S}/3rdparty/SPIRV/SPIRV-Headers" || die
	rmdir "${S}/3rdparty/glslang/glslang" || die
	mv "${WORKDIR}/glslang-${GLSLANG_SHA}" "${S}/3rdparty/glslang/glslang" || die
	echo "#define RPCS3_GIT_VERSION \"0000-${MY_SHA}\"" > rpcs3/git-version.h
	echo '#define RPCS3_GIT_BRANCH "master"' >> rpcs3/git-version.h
	echo '#define RPCS3_GIT_VERSION_NO_UPDATE 1' >> rpcs3/git-version.h
	sed -r \
		-e 's/MATCHES "\^\(DEBUG\|RELEASE\|RELWITHDEBINFO\|MINSIZEREL\)\$/MATCHES "^(DEBUG|RELEASE|RELWITHDEBINFO|MINSIZEREL|GENTOO)/' \
		-i "${S}/llvm/CMakeLists.txt" || die
	sed -i -e '/find_program(CCACHE_FOUND/d' CMakeLists.txt || die
	sed -i -e 's|FAudio.h|FAudio/FAudio.h|' rpcs3/Emu/Audio/FAudio/FAudioBackend.h || die
	cmake_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DBUILD_EXTERNAL=OFF
		-DBUILD_LLVM_SUBMODULE=ON
		-DUSE_PRECOMPILED_HEADERS=OFF
		-DUSE_ALSA=$(usex alsa)
		-DUSE_DISCORD_RPC=OFF
		-DUSE_FAUDIO=$(usex faudio)
		-DUSE_SYSTEM_FAUDIO=$(usex faudio)
		-DUSE_LIBEVDEV=$(usex joystick)
		-DUSE_NATIVE_INSTRUCTIONS=OFF
		-DUSE_PULSE=$(usex pulseaudio)
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_FFMPEG=ON
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_LIBUSB=ON
		-DUSE_SYSTEM_PUGIXML=ON
		-DUSE_SYSTEM_XXHASH=ON
		-DUSE_SYSTEM_ZLIB=ON
		-DUSE_SYSTEM_FLATBUFFERS=ON
		-DUSE_SYSTEM_WOLFSSL=ON
		-DUSE_VULKAN=$(usex vulkan)
		-DUSE_WAYLAND=$(usex wayland)
		-DWITH_LLVM=$(usex llvm)
		-Wno-dev
	)
	cmake_src_configure
}
