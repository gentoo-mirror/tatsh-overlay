# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WEBAPP_MANUAL_SLOT="yes"
inherit webapp

DESCRIPTION="Repository for NuGet with Chocolatey support."
HOMEPAGE="https://www.kendar.org/?p=/dotnet/phpnuget"
SRC_URI="https://www.kendar.org/?p=/dotnet/${PN}/${PN}.${PV}.zip -> ${P}.zip"

LICENSE="GPL-3+ PHP-3.01"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	dev-lang/php"
need_httpd_cgi

S="${WORKDIR}"

src_prepare() {
	local name
	for name in .gitignore 'composer.*' 'license*' '*.md' version '*.dist' '.*.yml' \
		'*managedfusion*'; do
		find . -type f -iname "$name" -delete || die
	done
	rm -R bin inc/PHPMailer/{examples,docs} data sample.web.config || die
	sed -re "s|require_once.*settings.php\"\);$|require_once(\"${EPREFIX}/etc/${PN}/settings.php\")|" \
		-i index.php || die
	default
}

src_install() {
	webapp_src_preinst
	insinto "${MY_HTDOCSDIR}"
	doins -r .
	webapp_server_configfile apache "${FILESDIR}/${PN}-apache-example.conf" "${PN}.conf"
	webapp_server_configfile nginx "${FILESDIR}/${PN}-nginx-example.conf" "${PN}.conf"
	newdoc "${FILESDIR}/${PN}-fpm-example.conf" "php-fpm-${PN}.conf"
	insinto "/etc/${PN}"
	newins settings.sample.php settings.php
	keepdir /var/lib/phpnuget/{db,packages} || die
	webapp_src_install
	keepdir "/var/lib/${PN}"
}
