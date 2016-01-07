# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit font

BASE_NAME="Hamchorom-LVT"

DESCRIPTION="Hamchorom-LVT fonts"
HOMEPAGE="http://wiki.ktug.org/wiki/wiki.php/%ED%95%A8%EC%B4%88%EB%A1%AC%EC%B2%B4LVT"
SRC_URI="http://ftp.ktug.org/KTUG/hcr-lvt/${BASE_NAME}.zip -> ${P}.zip"

LICENSE="Hancom"
SLOT="0"
KEYWORDS="~arm64 ~x86 ~*"
IUSE=""

DEPEND="app-arch/unzip"
RESTRICT="binchecks strip"

S="${WORKDIR}/${PN}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
