# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_SLOT="7.0"
inherit desktop dotnet-utils wrapper xdg

DESCRIPTION=".NET decompiler."
HOMEPAGE="https://github.com/icsharpcode/AvaloniaILSpy"
MY_PN="AvaloniaILSpy"
MY_PN_SHORT="ILSpy"
MY_PV="${PV//_/-}"
NUGETS="avalonia-0.10.13
	avalonia.angle.windows.natives-2.1.0.2020091801
	avalonia.avaloniaedit-0.10.12.2
	avalonia.controls.datagrid-0.10.13
	avalonia.desktop-0.10.13
	avalonia.diagnostics-0.10.13
	avalonia.freedesktop-0.10.13
	avalonia.markup.xaml.loader-0.10.13
	avalonia.native-0.10.13
	avalonia.remote.protocol-0.10.13
	avalonia.skia-0.10.13
	avalonia.win32-0.10.13
	avalonia.x11-0.10.13
	harfbuzzsharp-2.8.2-preview.178
	harfbuzzsharp.nativeassets.linux-2.8.2-preview.178
	harfbuzzsharp.nativeassets.macos-2.8.2-preview.178
	harfbuzzsharp.nativeassets.webassembly-2.8.2-preview.178
	harfbuzzsharp.nativeassets.win32-2.8.2-preview.178
	icsharpcode.decompiler-7.1.0.6543
	icsharpcode.decompiler-7.2.1.6856
	jetbrains.annotations-10.3.0
	microsoft.aspnetcore.app.ref-6.0.14
	microsoft.aspnetcore.app.runtime.linux-arm64-6.0.14
	microsoft.aspnetcore.app.runtime.linux-x64-6.0.14
	microsoft.aspnetcore.app.runtime.osx-arm64-6.0.14
	microsoft.aspnetcore.app.runtime.osx-x64-6.0.14
	microsoft.aspnetcore.app.runtime.win-arm64-6.0.14
	microsoft.aspnetcore.app.runtime.win-x64-6.0.14
	microsoft.codeanalysis.analyzers-2.9.6
	microsoft.codeanalysis.common-3.4.0
	microsoft.codeanalysis.csharp-3.4.0
	microsoft.codeanalysis.csharp.scripting-3.4.0
	microsoft.codeanalysis.scripting.common-3.4.0
	microsoft.csharp-4.0.1
	microsoft.csharp-4.3.0
	microsoft.diasymreader-1.4.0
	microsoft.diasymreader.native-17.0.0-beta1.21524.1
	microsoft.diasymreader.portablepdb-1.7.0-beta-21525-03
	microsoft.netcore.app.host.linux-arm64-6.0.14
	microsoft.netcore.app.host.linux-x64-6.0.14
	microsoft.netcore.app.host.osx-arm64-6.0.14
	microsoft.netcore.app.host.osx-x64-6.0.14
	microsoft.netcore.app.host.win-arm64-6.0.14
	microsoft.netcore.app.host.win-x64-6.0.14
	microsoft.netcore.app.ref-6.0.14
	microsoft.netcore.app.runtime.linux-arm64-6.0.14
	microsoft.netcore.app.runtime.linux-x64-6.0.14
	microsoft.netcore.app.runtime.osx-arm64-6.0.14
	microsoft.netcore.app.runtime.osx-x64-6.0.14
	microsoft.netcore.app.runtime.win-arm64-6.0.14
	microsoft.netcore.app.runtime.win-x64-6.0.14
	microsoft.netcore.platforms-1.0.1
	microsoft.netcore.platforms-1.1.0
	microsoft.netcore.platforms-1.1.1
	microsoft.netcore.platforms-2.0.0
	microsoft.netcore.platforms-2.1.2
	microsoft.netcore.platforms-5.0.0
	microsoft.netcore.targets-1.0.1
	microsoft.netcore.targets-1.1.0
	microsoft.netcore.targets-1.1.3
	microsoft.visualstudio.composition-17.1.20
	microsoft.visualstudio.composition.analyzers-17.1.20
	microsoft.visualstudio.validation-17.0.34
	microsoft.win32.primitives-4.0.1
	microsoft.win32.registry-4.0.0
	microsoft.win32.registry-5.0.0
	microsoft.win32.systemevents-4.5.0
	mono.cecil-0.11.3
	netstandard.library-2.0.3
	newtonsoft.json-9.0.1
	nuget.client-4.2.0
	nuget.common-4.2.0
	nuget.contentmodel-4.2.0
	nuget.frameworks-4.2.0
	nuget.packaging-4.2.0
	nuget.packaging.core-4.2.0
	nuget.packaging.core.types-4.2.0
	nuget.repositories-4.2.0
	nuget.runtimemodel-4.2.0
	nuget.versioning-4.2.0
	runtime.any.system.collections-4.3.0
	runtime.any.system.diagnostics.tools-4.3.0
	runtime.any.system.diagnostics.tracing-4.3.0
	runtime.any.system.globalization-4.3.0
	runtime.any.system.io-4.3.0
	runtime.any.system.reflection-4.3.0
	runtime.any.system.reflection.extensions-4.3.0
	runtime.any.system.reflection.primitives-4.3.0
	runtime.any.system.resources.resourcemanager-4.3.0
	runtime.any.system.runtime-4.3.0
	runtime.any.system.runtime.handles-4.3.0
	runtime.any.system.runtime.interopservices-4.3.0
	runtime.any.system.text.encoding-4.3.0
	runtime.any.system.text.encoding.extensions-4.3.0
	runtime.any.system.threading.tasks-4.3.0
	runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.native.system-4.0.0
	runtime.native.system-4.3.0
	runtime.native.system.io.compression-4.3.0
	runtime.native.system.security.cryptography-4.0.0
	runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.unix.microsoft.win32.primitives-4.3.0
	runtime.unix.system.diagnostics.debug-4.3.0
	runtime.unix.system.io.filesystem-4.3.0
	runtime.unix.system.private.uri-4.3.0
	runtime.unix.system.runtime.extensions-4.3.0
	runtime.win.microsoft.win32.primitives-4.3.0
	runtime.win.system.diagnostics.debug-4.3.0
	runtime.win.system.io.filesystem-4.3.0
	runtime.win.system.runtime.extensions-4.3.0
	skiasharp-2.88.0-preview.178
	skiasharp.nativeassets.linux-2.88.0-preview.178
	skiasharp.nativeassets.macos-2.88.0-preview.178
	skiasharp.nativeassets.webassembly-2.88.0-preview.178
	skiasharp.nativeassets.win32-2.88.0-preview.178
	system.buffers-4.3.0
	system.buffers-4.4.0
	system.buffers-4.5.1
	system.collections-4.0.11
	system.collections-4.3.0
	system.collections.concurrent-4.0.12
	system.collections.immutable-1.5.0
	system.collections.immutable-1.6.0
	system.collections.immutable-5.0.0
	system.componentmodel.annotations-4.5.0
	system.componentmodel.composition-6.0.0
	system.composition-6.0.0
	system.composition.attributedmodel-6.0.0
	system.composition.convention-6.0.0
	system.composition.hosting-6.0.0
	system.composition.runtime-6.0.0
	system.composition.typedparts-6.0.0
	system.diagnostics.debug-4.0.11
	system.diagnostics.debug-4.3.0
	system.diagnostics.process-4.1.0
	system.diagnostics.tools-4.0.1
	system.diagnostics.tracing-4.1.0
	system.diagnostics.tracing-4.3.0
	system.drawing.common-4.5.0
	system.dynamic.runtime-4.0.11
	system.dynamic.runtime-4.3.0
	system.globalization-4.0.11
	system.globalization-4.3.0
	system.io-4.1.0
	system.io-4.3.0
	system.io.compression-4.3.0
	system.io.filesystem-4.0.1
	system.io.filesystem-4.3.0
	system.io.filesystem.primitives-4.0.1
	system.io.filesystem.primitives-4.3.0
	system.linq-4.1.0
	system.linq-4.3.0
	system.linq.expressions-4.1.0
	system.linq.expressions-4.3.0
	system.memory-4.5.3
	system.memory-4.5.4
	system.numerics.vectors-4.4.0
	system.numerics.vectors-4.5.0
	system.objectmodel-4.0.12
	system.objectmodel-4.3.0
	system.private.uri-4.3.0
	system.reactive-5.0.0
	system.reflection-4.1.0
	system.reflection-4.3.0
	system.reflection.emit-4.0.1
	system.reflection.emit-4.3.0
	system.reflection.emit-4.7.0
	system.reflection.emit.ilgeneration-4.0.1
	system.reflection.emit.ilgeneration-4.3.0
	system.reflection.emit.ilgeneration-4.7.0
	system.reflection.emit.lightweight-4.0.1
	system.reflection.emit.lightweight-4.3.0
	system.reflection.extensions-4.0.1
	system.reflection.extensions-4.3.0
	system.reflection.metadata-1.6.0
	system.reflection.metadata-5.0.0
	system.reflection.primitives-4.0.1
	system.reflection.primitives-4.3.0
	system.reflection.typeextensions-4.1.0
	system.reflection.typeextensions-4.3.0
	system.reflection.typeextensions-4.7.0
	system.resources.resourcemanager-4.0.1
	system.resources.resourcemanager-4.3.0
	system.runtime-4.1.0
	system.runtime-4.3.0
	system.runtime-4.3.1
	system.runtime.compilerservices.unsafe-4.5.2
	system.runtime.compilerservices.unsafe-4.5.3
	system.runtime.compilerservices.unsafe-4.6.0
	system.runtime.extensions-4.1.0
	system.runtime.extensions-4.3.0
	system.runtime.extensions-4.3.1
	system.runtime.handles-4.0.1
	system.runtime.handles-4.3.0
	system.runtime.interopservices-4.1.0
	system.runtime.interopservices-4.3.0
	system.runtime.interopservices.windowsruntime-4.3.0
	system.runtime.numerics-4.0.1
	system.runtime.serialization.primitives-4.1.1
	system.security.accesscontrol-5.0.0
	system.security.cryptography.algorithms-4.2.0
	system.security.cryptography.encoding-4.0.0
	system.security.cryptography.primitives-4.0.0
	system.security.principal.windows-4.7.0
	system.security.principal.windows-5.0.0
	system.text.encoding-4.0.11
	system.text.encoding-4.3.0
	system.text.encoding.codepages-4.5.1
	system.text.encoding.extensions-4.3.0
	system.text.regularexpressions-4.1.0
	system.text.regularexpressions-4.3.0
	system.threading-4.0.11
	system.threading-4.3.0
	system.threading.overlapped-4.3.0
	system.threading.tasks-4.0.11
	system.threading.tasks-4.3.0
	system.threading.tasks.dataflow-5.0.0
	system.threading.tasks.extensions-4.0.0
	system.threading.tasks.extensions-4.3.0
	system.threading.tasks.extensions-4.5.3
	system.threading.tasks.extensions-4.5.4
	system.threading.thread-4.0.0
	system.threading.threadpool-4.0.10
	system.valuetuple-4.5.0
	system.xml.readerwriter-4.0.11
	system.xml.readerwriter-4.3.1
	system.xml.xdocument-4.0.11
	tmds.dbus-0.9.0"
SRC_URI="https://github.com/icsharpcode/${MY_PN}/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz
	https://pkgs.dev.azure.com/dnceng/9ee6d478-d288-47f7-aacc-f6e6d082ae6d/_packaging/d1622942-d16f-48e5-bc83-96f4539e7601/nuget/v3/flat2/microsoft.diasymreader.converter.xml/1.1.0-beta2-22164-02/microsoft.diasymreader.converter.xml.1.1.0-beta2-22164-02.nupkg
	https://pkgs.dev.azure.com/dnceng/9ee6d478-d288-47f7-aacc-f6e6d082ae6d/_packaging/d1622942-d16f-48e5-bc83-96f4539e7601/nuget/v3/flat2/microsoft.diasymreader.portablepdb/1.7.0-beta-21525-03/microsoft.diasymreader.portablepdb.1.7.0-beta-21525-03.nupkg
	$(nuget_uris)"

DEPEND="sys-libs/zlib"
RDEPEND="${DEPEND}
	dev-libs/icu
	dev-libs/openssl
	media-libs/libglvnd[X]
	media-libs/libsdl2
	media-libs/libsoundio
	media-libs/openal
	media-video/ffmpeg
	x11-libs/gtk+:3"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${MY_PV}"

DOTNET_PROJECTS=( "${MY_PN_SHORT}.sln" )
DOTNET_PV="${MY_PV}"

src_install() {
	newicon "ILSpy.Core/Images/${MY_PN_SHORT}.png" "${MY_PN_SHORT}"
	mkdir -p "${D}/usr/$(get_libdir)/${MY_PN_SHORT}" || die
	cp -R "${MY_PN_SHORT}/bin/Release/net6.0/linux-x64/publish/"* "${D}/usr/$(get_libdir)/${MY_PN_SHORT}"
	make_wrapper "${MY_PN_SHORT}" "/usr/$(get_libdir)/${MY_PN_SHORT}/${MY_PN_SHORT}" \
		"/usr/$(get_libdir)/${MY_PN_SHORT}"
	make_desktop_entry "${MY_PN_SHORT}" "${MY_PN_SHORT}"
	einstalldocs
}
