# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.14.0

EAPI=8

CRATES="
	ab_glyph@0.2.29
	ab_glyph_rasterizer@0.1.8
	addr2line@0.24.2
	adler2@2.0.0
	aes@0.8.4
	ahash@0.8.11
	aho-corasick@1.1.3
	android-activity@0.6.0
	android-properties@0.2.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	arbitrary@1.4.1
	arboard@3.4.1
	arrayvec@0.7.6
	as-raw-xcb-connection@1.0.1
	ash@0.38.0+1.3.281
	ashpd@0.11.0
	async-broadcast@0.7.2
	async-recursion@1.1.1
	async-trait@0.1.87
	atomic-polyfill@1.0.3
	atomic-waker@1.1.2
	autocfg@1.4.0
	backtrace@0.3.74
	base64@0.22.1
	bindgen@0.71.1
	bit-set@0.6.0
	bit-set@0.8.0
	bit-vec@0.7.0
	bit-vec@0.8.0
	bitflags@1.3.2
	bitflags@2.9.0
	block-buffer@0.10.4
	block2@0.5.1
	block2@0.6.0
	block@0.1.6
	bumpalo@3.17.0
	bytemuck@1.22.0
	bytemuck_derive@1.8.1
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@1.10.1
	bzip2-sys@0.1.13+1.0.8
	bzip2@0.5.2
	calloop-wayland-source@0.3.0
	calloop@0.13.0
	cc@1.2.16
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	cgl@0.3.2
	chrono@0.4.40
	cipher@0.4.4
	clang-sys@1.8.1
	clap@4.5.32
	clap_builder@4.5.32
	clap_derive@4.5.32
	clap_lex@0.7.4
	clipboard-win@5.4.0
	cmake@0.1.54
	cobs@0.2.3
	codespan-reporting@0.11.1
	colorchoice@1.0.3
	combine@4.6.7
	concurrent-queue@2.5.0
	constant_time_eq@0.3.1
	core-foundation-sys@0.8.7
	core-foundation@0.10.0
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	cpufeatures@0.2.17
	crc-catalog@2.4.0
	crc32fast@1.4.2
	crc@3.2.1
	critical-section@1.2.0
	crossbeam-utils@0.8.21
	crypto-common@0.1.6
	cursor-icon@1.1.0
	dashmap@6.1.0
	data-encoding@2.8.0
	deflate64@0.1.9
	deranged@0.3.11
	derive_arbitrary@1.4.1
	digest@0.10.7
	dirs-sys@0.5.0
	dirs@6.0.0
	dispatch2@0.2.0
	dispatch@0.2.0
	displaydoc@0.2.5
	dlib@0.5.2
	document-features@0.2.11
	downcast-rs@1.2.1
	dpi@0.1.1
	ecolor@0.31.1
	eframe@0.31.1
	egui-wgpu@0.31.1
	egui-winit@0.31.1
	egui@0.31.1
	egui_glow@0.31.1
	either@1.15.0
	emath@0.31.1
	embedded-io@0.4.0
	embedded-io@0.6.1
	encoding_rs@0.8.35
	endi@1.1.0
	enumflags2@0.7.11
	enumflags2_derive@0.7.11
	epaint@0.31.1
	equivalent@1.0.2
	errno@0.3.10
	error-code@3.3.1
	event-listener-strategy@0.5.3
	event-listener@5.4.0
	fastrand@2.3.0
	fatfs@0.3.6
	fdeflate@0.3.7
	filetime@0.2.25
	filetime_creation@0.2.0
	flate2@1.1.0
	fnv@1.0.7
	foldhash@0.1.4
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-io@0.3.31
	futures-lite@2.6.0
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-timer@3.0.3
	futures-util@0.3.31
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	getrandom@0.3.1
	gimli@0.31.1
	gl_generator@0.14.0
	glob@0.3.2
	glow@0.16.0
	glutin-winit@0.5.0
	glutin@0.32.2
	glutin_egl_sys@0.7.1
	glutin_glx_sys@0.6.1
	glutin_wgl_sys@0.6.1
	governor@0.8.1
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-descriptor-types@0.2.0
	gpu-descriptor@0.3.1
	h2@0.4.8
	hash32@0.2.1
	hashbrown@0.14.5
	hashbrown@0.15.2
	heapless@0.7.17
	heck@0.5.0
	hermit-abi@0.4.0
	hex@0.4.3
	hexf-parse@0.2.1
	hmac@0.12.1
	home@0.5.11
	http-body-util@0.1.3
	http-body@1.0.1
	http@1.3.1
	httparse@1.10.1
	hyper-rustls@0.27.5
	hyper-util@0.1.10
	hyper@1.6.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	idna@1.0.3
	idna_adapter@1.2.0
	image@0.25.5
	indexmap@2.8.0
	inout@0.1.4
	ipnet@2.11.0
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itoa@1.0.15
	jni-sys@0.3.0
	jni@0.21.1
	jobserver@0.1.32
	jpeg-decoder@0.3.1
	js-sys@0.3.77
	khronos-egl@6.0.0
	khronos_api@3.1.0
	libc@0.2.171
	libloading@0.8.6
	libmimalloc-sys@0.1.39
	libredox@0.1.3
	linux-raw-sys@0.4.15
	linux-raw-sys@0.9.2
	litemap@0.7.5
	litrs@0.4.1
	lock_api@0.4.12
	lockfree-object-pool@0.1.6
	log@0.4.26
	lzma-rs@0.3.0
	lzma-rust@0.1.7
	malloc_buf@0.0.6
	memchr@2.7.4
	memmap2@0.9.5
	memoffset@0.9.1
	metal@0.31.0
	mimalloc@0.1.43
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.8.5
	mio@1.0.3
	naga@24.0.0
	ndk-context@0.1.1
	ndk-sys@0.5.0+25.2.9519653
	ndk-sys@0.6.0+11769913
	ndk@0.9.0
	nix@0.29.0
	no-std-compat@0.4.1
	nohash-hasher@0.2.0
	nom@7.1.3
	nonzero_ext@0.3.0
	nt-time@0.8.1
	num-conv@0.1.0
	num-traits@0.2.19
	num_enum@0.7.3
	num_enum_derive@0.7.3
	objc-sys@0.3.5
	objc2-app-kit@0.2.2
	objc2-app-kit@0.3.0
	objc2-cloud-kit@0.2.2
	objc2-contacts@0.2.2
	objc2-core-data@0.2.2
	objc2-core-foundation@0.3.0
	objc2-core-image@0.2.2
	objc2-core-location@0.2.2
	objc2-encode@4.1.0
	objc2-foundation@0.2.2
	objc2-foundation@0.3.0
	objc2-link-presentation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	objc2-symbols@0.2.2
	objc2-ui-kit@0.2.2
	objc2-uniform-type-identifiers@0.2.2
	objc2-user-notifications@0.2.2
	objc2@0.5.2
	objc2@0.6.0
	objc@0.2.7
	object@0.36.7
	once_cell@1.21.0
	option-ext@0.2.0
	orbclient@0.3.48
	ordered-float@4.6.0
	ordered-stream@0.2.0
	owned_ttf_parser@0.15.2
	owned_ttf_parser@0.25.0
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pbkdf2@0.12.2
	percent-encoding@2.3.1
	pin-project-internal@1.1.10
	pin-project-lite@0.2.16
	pin-project@1.1.10
	pin-utils@0.1.0
	pkg-config@0.3.32
	png@0.17.16
	polling@3.7.4
	pollster@0.4.0
	portable-atomic@1.11.0
	postcard@1.1.1
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	prettyplease@0.2.30
	proc-macro-crate@3.3.0
	proc-macro2@1.0.94
	profiling@1.0.16
	quanta@0.12.5
	quick-xml@0.37.2
	quinn-proto@0.11.9
	quinn-udp@0.5.10
	quinn@0.11.6
	quote@1.0.40
	rand@0.8.5
	rand@0.9.0
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.6.4
	rand_core@0.9.3
	raw-cpuid@11.5.0
	raw-window-handle@0.6.2
	redox_syscall@0.4.1
	redox_syscall@0.5.10
	redox_users@0.5.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	renderdoc-sys@1.1.0
	reqwest@0.12.14
	rfd@0.15.3
	ring@0.17.14
	rpkg-config@0.1.2
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-hash@2.1.1
	rustc_version@0.4.1
	rustix@0.38.44
	rustix@1.0.2
	rustls-pemfile@2.2.0
	rustls-pki-types@1.11.0
	rustls-webpki@0.102.8
	rustls@0.23.23
	rusttype@0.9.3
	rustversion@1.0.20
	ryu@1.0.20
	same-file@1.0.6
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sdl3-src@3.2.8
	sdl3-sys@0.4.6+SDL3-3.2.8
	semver@1.0.26
	serde-big-array@0.5.1
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.140
	serde_repr@0.1.20
	serde_urlencoded@0.7.1
	sevenz-rust@0.6.1
	sha1@0.10.6
	sha2@0.10.8
	shlex@1.3.0
	signal-hook-registry@1.4.2
	simd-adler32@0.3.7
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.14.0
	smithay-client-toolkit@0.19.2
	smithay-clipboard@0.7.2
	smol_str@0.2.2
	socket2@0.5.8
	spin@0.9.8
	spin_sleep@1.3.0
	spinning_top@0.3.0
	spirv@0.3.0+sdk-1.3.268.0
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@2.0.100
	sync_wrapper@1.0.2
	synstructure@0.13.1
	tempfile@3.18.0
	termcolor@1.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.12
	thiserror@1.0.69
	thiserror@2.0.12
	tiff@0.9.1
	time-core@0.1.3
	time-macros@0.2.20
	time@0.3.39
	tinystr@0.7.6
	tinyvec@1.9.0
	tinyvec_macros@0.1.1
	tokio-macros@2.5.0
	tokio-rustls@0.26.2
	tokio-util@0.7.13
	tokio@1.44.0
	toml@0.5.11
	toml_datetime@0.6.8
	toml_edit@0.22.24
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.2
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing@0.1.41
	try-lock@0.2.5
	ttf-parser@0.15.2
	ttf-parser@0.25.1
	tungstenite@0.26.2
	type-map@0.5.0
	typenum@1.18.0
	uds_windows@1.1.0
	unicode-ident@1.0.18
	unicode-segmentation@1.12.0
	unicode-width@0.1.14
	unicode-xid@0.2.6
	untrusted@0.9.0
	url@2.5.4
	urlencoding@2.1.3
	utf-8@0.7.6
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	version_check@0.9.5
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-futures@0.4.50
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	wayland-backend@0.3.8
	wayland-client@0.31.8
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.8
	wayland-protocols-plasma@0.3.6
	wayland-protocols-wlr@0.3.6
	wayland-protocols@0.32.6
	wayland-scanner@0.31.6
	wayland-sys@0.31.6
	web-sys@0.3.77
	web-time@1.1.0
	webbrowser@1.0.4
	webpki-roots@0.26.8
	weezl@0.1.8
	wgpu-core@24.0.2
	wgpu-hal@24.0.2
	wgpu-types@24.0.0
	wgpu@24.0.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.58.0
	windows-implement@0.58.0
	windows-interface@0.58.0
	windows-link@0.1.0
	windows-registry@0.4.0
	windows-result@0.2.0
	windows-result@0.3.1
	windows-strings@0.1.0
	windows-strings@0.3.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows-targets@0.53.0
	windows@0.58.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.0
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.0
	winit@0.30.9
	winnow@0.7.4
	winres@0.1.12
	wit-bindgen-rt@0.33.0
	write16@1.0.0
	writeable@0.5.5
	x11-dl@2.21.0
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	xcursor@0.3.8
	xdg-home@1.3.0
	xkbcommon-dl@0.4.2
	xkeysym@0.2.1
	xml-rs@0.8.25
	yoke-derive@0.7.5
	yoke@0.7.5
	zbus@5.5.0
	zbus_macros@5.5.0
	zbus_names@4.2.0
	zerocopy-derive@0.7.35
	zerocopy-derive@0.8.23
	zerocopy@0.7.35
	zerocopy@0.8.23
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.1
	zeroize_derive@1.4.2
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zip@2.2.3
	zopfli@0.8.1
	zstd-safe@7.2.3
	zstd-sys@2.0.14+zstd.1.5.7
	zstd@0.13.3
	zvariant@5.4.0
	zvariant_derive@5.4.0
	zvariant_utils@3.2.0
"

inherit cargo

DESCRIPTION="N64 emulator written in Rust."
HOMEPAGE="https://github.com/gopher64/gopher64"
PARALLEL_RDP_STANDALONE_SHA="388d70f5835b352d841d9d9e5a08c5de01470f41"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Themaister/parallel-rdp-standalone/archive/${PARALLEL_RDP_STANDALONE_SHA}.tar.gz -> ${PN}-parallel-rdp-standalone-${PARALLEL_RDP_STANDALONE_SHA:0:7}.tar.gz
	${CARGO_CRATE_URIS}"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )

src_prepare() {
	rmdir parallel-rdp/parallel-rdp-standalone || die
	mv "${WORKDIR}/parallel-rdp-standalone-${PARALLEL_RDP_STANDALONE_SHA}" parallel-rdp/parallel-rdp-standalone || die
	default
}

src_install() {
	cargo_src_install
	einstalldocs
	make_desktop_entry "${PN}"
}
