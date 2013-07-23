# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A command line interface to KeePass database files"
HOMEPAGE="http://kpcli.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/kpcli/kpcli-1.6.pl"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl
	dev-perl/Clone
	dev-perl/Crypt-Rijndael
	dev-perl/TermReadKey
	dev-perl/Sort-Naturally
	dev-perl/Term-ShellUI
	dev-perl/File-KeePass"

src_unpack() {
	mkdir ${S}
	mv ${DISTDIR}/kpcli-1.6.pl ${S} || die
}

src_install() {
	mv ${S}/kpcli-1.6.pl ${S}/kpcli || die
	dobin kpcli || die
}
