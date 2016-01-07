# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit autotools eutils gnome2-utils

DESCRIPTION="dasom-jeongeum is a Korean engine based on libhangul"
HOMEPAGE="https://github.com/dasom-im/dasom-jeongeum"
SRC_URI="https://github.com/dasom-im/dasom-jeongeum/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/choehwanjin/libhangul/master/data/hanja/mssymbol.txt"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/libtool
	virtual/pkgconfig
	>=app-i18n/dasom-1.1
	>=app-i18n/libhangul-0.0.12"

AUTOTOOLS_IN_SOURCE_BUILD=1

DOCS=(AUTHORS README NEWS)

src_prepare() {
	WANT_AUTOCONF=2.5 eautoreconf
}

src_configure() {
	econf || die
}

src_install() {
	default

	prune_libtool_files --all

	# mssymbols
	mkdir -p "${ED}"/usr/share/libhangul/hanja
	cp "${DISTDIR}"/mssymbol.txt "${ED}"/usr/share/libhangul/hanja
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}
