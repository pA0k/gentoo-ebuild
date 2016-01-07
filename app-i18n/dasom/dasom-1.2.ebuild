# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit autotools eutils gnome2-utils

DESCRIPTION="Dasom is an input method framework"
HOMEPAGE="https://github.com/dasom-im/dasom"
SRC_URI="https://github.com/dasom-im/dasom/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+nls gtk gnome-shell qt"

DEPEND="sys-devel/libtool
	virtual/pkgconfig
	>=dev-util/intltool-0.35.0
	>=dev-lang/perl-5.8.1
	dev-perl/XML-Parser
	nls? ( virtual/libintl )
	x11-libs/libX11
	dev-libs/glib
	x11-libs/gtk+:3
	dev-libs/libappindicator:3
	dev-util/gtk-update-icon-cache
	gnome-base/librsvg
	dev-libs/gobject-introspection
	gnome-shell? ( gnome-base/gnome-shell )"

PDEPEND="gtk? ( app-i18n/dasom-gtk )
	qt? ( app-i18n/dasom-qt )"

DOCS=(AUTHORS README NEWS)

src_prepare() {
	# Rerun autotools
	einfo "Regenerating autotools files..."
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

	rm -rf "${ED}"/usr/share/im-config || die
	if ! use gnome-shell; then
		rm -rf "${ED}"/usr/share/gnome-shell || die
	fi
}

pkg_preinst() {
	gnome2_schemas_savelist
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
