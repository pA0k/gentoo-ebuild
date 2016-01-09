# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=(python{3_3,3_4})

inherit git-2 python

DESCRIPTION="Korean spellchecking dictionary for hunspell"
HOMEPAGE="https://github.com/changwoo/hunspell-dict-ko"
EGIT_REPO_URI="https://github.com/changwoo/hunspell-dict-ko.git"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=app-text/hunspell-1.2.14"
DEPEND="${RDEPEND} dev-python/lxml"

pkg_setup() {
	python_set_active_version 3
	python_pkg_setup
}

src_compile() {
	emake

	mv ${S}/ko.dic ${S}/ko_KR.dic
	mv ${S}/ko.aff ${S}/ko_KR.aff
}

src_install() {
	SPELLDIR=/usr/share/hunspell
	insinto ${SPELLDIR}
	doins ${S}/ko_KR.dic
	doins ${S}/ko_KR.aff

	MYSPELLDIR=/usr/share/myspell
	dodir ${MYSPELLDIR}
	dosym ${SPELLDIR}/ko_KR.dic ${MYSPELLDIR}/ko_KR.dic
	dosym ${SPELLDIR}/ko_KR.aff ${MYSPELLDIR}/ko_KR.aff

	dodoc CREDITS LICENSE README.md
}
