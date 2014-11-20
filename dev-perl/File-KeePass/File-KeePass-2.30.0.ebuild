# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

<<<<<<< HEAD
EAPI=5
=======
EAPI=4
>>>>>>> 128e0df7d8d45773efea3a26acb5d1a762b7a8d2

MODULE_AUTHOR="RHANDOM"
MODULE_VERSION="2.03"
inherit perl-module

DESCRIPTION=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Crypt-Rijndael"
DEPEND="${RDEPEND}"

SRC_TEST="do"
