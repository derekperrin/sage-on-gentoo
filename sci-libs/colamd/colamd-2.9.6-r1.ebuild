# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Column approximate minimum degree ordering algorithm"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="mirror://sagemath/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE="static-libs"

RDEPEND=">=sci-libs/suitesparseconfig-5.4.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default

	# remove .la file
	find "${ED}" -name '*.la' -delete || die
}
