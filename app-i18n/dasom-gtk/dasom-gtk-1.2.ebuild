# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit autotools eutils gnome2-utils

DESCRIPTION="dasom-gtk provides GTK+2, GTK+3 IM modules for Dasom"
HOMEPAGE="https://github.com/dasom-im/dasom-gtk"
SRC_URI="https://github.com/dasom-im/dasom-gtk/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+nls"

DEPEND="sys-devel/libtool
	virtual/pkgconfig
	>=dev-util/intltool-0.35.0
	>=dev-lang/perl-5.8.1
	dev-perl/XML-Parser
	x11-libs/gtk+:2
	x11-libs/gtk+:3
	dev-util/gtk-update-icon-cache
	app-i18n/dasom"

DOCS=(AUTHORS README NEWS)

src_prepare() {
	WANT_AUTOCONF=2.5 eautoreconf
}

src_configure() {
	local myconf

	if ! use nls; then
		myconf="${myconf} --disable-nls"
	fi

	econf ${myconf} || die
}

src_install() {
	default

	prune_libtool_files --all
}

pkg_preinst() {
	gnome2_schemas_savelist
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_query_immodules_gtk2
	gnome2_query_immodules_gtk3
	gnome2_schemas_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_query_immodules_gtk2
	gnome2_query_immodules_gtk3
	gnome2_icon_cache_update
}
