# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit udev

DESCRIPTION="Random systemd utilities."
HOMEPAGE="https://github.com/kylemanna/systemd-utils"
SHA="eadaa1c9878553b7c032bf2911321fd6374fdeaa"
MY_PN="${PN/kylemanna-}"
SRC_URI="https://github.com/kylemanna/${MY_PN}/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="amazon cmsis-dap btrfs crashplan ipv6 rssh systemd storj tahoe kodi youtube papertrail multilib"

RDEPEND="btrfs? ( sys-fs/btrfs-progs )
	multilib? (
		cmsis-dap? ( dev-embedded/openocd[cmsis-dap] )
	)
	kodi? ( media-tv/kodi )
	systemd? ( sys-apps/systemd )"
REQUIRED_USE="cmsis-dap? ( multilib )"

S="${WORKDIR}/${MY_PN}-${SHA}"

src_prepare() {
	default
	sed -e '10s:.*:ExecStart=/usr/sbin/failure-monitor.py %i:' -i \
		failure-monitor/failure-monitor@.service || die
	sed -e '6s:.*:ExecStart=/usr/sbin/onfailure.sh %i:' -i \
		onfailure/failure-email@.service || die
	sed -e '38s/--user //' -i onfailure/onfailure.sh || die
	sed -e '12s/--user //' -i units/import-env.service || die
}

src_install() {
	insinto /lib/systemd/system
	use amazon && doins units/amazon-cloud-drive.service
	use btrfs && doins units/btrfs*
	use crashplan && doins units/crashplan.timer
	use ipv6 && doins units/ipv6*.service units/ping6*
	use papertrail && doins units/papertrail.service
	use rssh && doins units/rssh.service
	use storj && doins units/storj-dataserv-client.service
	use tahoe && doins units/tahoe*
	use kodi && doins units/wm.target units/xbmc.service
	use youtube && doins units/wm.target units/youtube-tv.service
	doins units/uber-fail.service \
		units/import-env.service \
		failure-monitor/failure-monitor@.service \
		onfailure/failure-email@.service
	if use cmsis-dap; then
		doins units/openocd-cmsis-dap*
		udev_dorules scripts/98-cmsis-dap.rules
	fi
	dosbin failure-monitor/failure-monitor.py onfailure/onfailure.sh
	dobin scripts/systemd-email
	einstalldocs
}

pkg_postinst() {
	einfo
	einfo "youtube-tv.service requires Google Chrome or Chromium to be installed."
	einfo
}
