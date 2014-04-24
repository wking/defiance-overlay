# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/liblognorm/liblognorm-0.3.6-r1.ebuild,v 1.1 2014/03/20 14:19:00 maksbotan Exp $

EAPI=5

AUTOTOOLS_AUTORECONF="yes"
AUTOTOOLS_IN_SOURCE_BUILD=1

inherit  autotools-utils

DESCRIPTION="Fast samples-based log normalization library"
HOMEPAGE="http://www.liblognorm.com"
SRC_URI="http://www.liblognorm.com/files/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~x86 ~amd64-linux"
IUSE="debug static-libs doc"

RDEPEND="
	>=dev-libs/libestr-0.1.3
	>=dev-libs/libee-0.3.2
	"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	"
DOCS=( ChangeLog )

# PATCHES=( "${FILESDIR}"/respect_CFLAGS.patch )

src_configure() {
	econf \
		$(use_enable doc docs) \
		$(use_enable debug) \
		$(use_enable static-libs static)
}

src_compile() {
	autotools-utils_src_compile -j1
}
