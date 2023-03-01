# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
MPV_REQ_USE="lua"
USE_MPV="rdepend"
inherit mpv-plugin

DESCRIPTION="Writes a list of edits made to the current video file to a file"
HOMEPAGE="https://github.com/paradox460/mpv-scripts"
SHA="0000000a253e244308a0f9465e09fa8a2aca814a"
SRC_URI="https://github.com/paradox460/mpv-scripts/archive/${SHA}.tar.gz -> paradox460-mpv-scripts-${SHA:0:7}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

MPV_PLUGIN_FILES=(
	"${PN}.lua"
)

S="${WORKDIR}/mpv-scripts-${SHA}/${PN}"
