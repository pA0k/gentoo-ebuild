# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=2
inherit font

MY_P="${PN}-Ver${PV}-TTC-20151103"

DESCRIPTION="D2Coding fixed width font based NanumBareunGothic font"
HOMEPAGE="http://dev.naver.com/projects/d2coding/"
SRC_URI="http://dev.naver.com/frs/download.php/11568/${MY_P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~arm64 ~x86 ~*"
IUSE=""

RESTRICT="strip binchecks"

DEPEND="app-arch/unzip"
RDEPEND=""

# MY_A="${MY_P}.zip"
S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttc"
