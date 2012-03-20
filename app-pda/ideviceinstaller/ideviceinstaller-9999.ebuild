# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-pda/ideviceinstaller/ideviceinstaller-1.0.0.ebuild,v 1.1 2011/03/29 08:11:21 ssuominen Exp $

EAPI=4
inherit eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="http://git.sukimashita.com/${PN}.git"
else
	SRC_URI="http://www.libimobiledevice.org/downloads/${P}.tar.bz2"
fi

DESCRIPTION="A tool to interact with the installation_proxy of an Apple's iDevice"
HOMEPAGE="http://www.libimobiledevice.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=app-pda/libimobiledevice-9999
	>=app-pda/libplist-9999
	>=dev-libs/libzip-0.8"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	NOCONFIGURE="set" ./autogen.sh 		
	sed -i -e 's:-Werror -g::' configure || die
}