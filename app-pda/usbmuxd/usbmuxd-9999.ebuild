# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-pda/usbmuxd/usbmuxd-1.0.7-r1.ebuild,v 1.3 2012/01/23 14:11:36 tomka Exp $

EAPI=3
inherit eutils cmake-utils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="http://git.sukimashita.com/${PN}.git"
else
	SRC_URI="http://marcansoft.com/uploads/${PN}/${P}.tar.bz2"
fi

DESCRIPTION="USB multiplex daemon for use with Apple iPhone/iPod Touch devices"
HOMEPAGE="http://marcansoft.com/blog/iphonelinux/usbmuxd/"

LICENSE="GPL-2 GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~ppc64 x86"
IUSE=""

DEPEND="=app-pda/libplist-9999
	virtual/libusb:1"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup plugdev
	enewuser usbmux -1 -1 -1 "usb,plugdev"
}

DOCS="AUTHORS README README.devel"
