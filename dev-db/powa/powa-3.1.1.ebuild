# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

POSTGRES_COMPAT=( 10 )
POSTGRES_USEDEP="server"

PSRC="REL_${PV//./_}"
S="${WORKDIR}/${PN}-archivist-${PSRC}"
inherit eutils postgres-multi versionator

SLOT="0"

DESCRIPTION="PostgreSQL Workload Analyzer"
HOMEPAGE="http://dalibo.github.io/powa/"
SRC_URI="https://github.com/dalibo/${PN}-archivist/archive/${PSRC}.tar.gz -> ${P}.tar.gz"

LICENSE="DWTFYW"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"
REQUIRED_USE="${POSTGRES_REQ_USE}"

DEPEND="
	${POSTGRES_DEP}
"
RDEPEND="
	dev-db/pg_stat_kcache
	dev-db/pg_qualstats
	dev-db/hypopg
	${DEPEND}
"

src_prepare() {
	eapply_user
	postgres-multi_src_prepare
}

src_compile() {
	postgres-multi_foreach emake
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" install

	use static-libs || find "${ED}" -name '*.a' -delete
}