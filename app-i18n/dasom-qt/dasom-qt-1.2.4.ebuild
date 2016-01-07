# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit autotools eutils

DESCRIPTION="dasom-qt provides Qt4, Qt5 IM modules for Dasom"
HOMEPAGE="https://github.com/dasom-im/dasom-qt"
SRC_URI="https://github.com/dasom-im/dasom-qt/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/libtool
	virtual/pkgconfig
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	app-i18n/dasom"

AUTOTOOLS_IN_SOURCE_BUILD=1

DOCS=(AUTHORS README)

src_prepare() {
	WANT_AUTOCONF=2.5 eautoreconf
}

src_configure() {
	econf || die
}

src_install() {
	default

	prune_libtool_files --all
}
