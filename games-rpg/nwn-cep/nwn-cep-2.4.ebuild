# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-rpg/nwn-cep/nwn-cep-2.0.ebuild,v 1.8 2012/10/07 11:26:09 pacho Exp $

EAPI=2
inherit eutils games unpacker

DESCRIPTION="High quality custom content addon for Neverwinter Nights"
HOMEPAGE="http://www.neverwinternights.info/cep.htm"
SRC_URI="http://vnfiles.ign.com/nwvault.ign.com/fms/files/hakpaks/7849/CEP_24_a.rar"

LICENSE="all-rights-reserved"
SLOT="2"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=">=games-rpg/nwn-1.69"

S=${WORKDIR}

dir=${GAMES_PREFIX_OPT}/nwn

pkg_setup() {
	games_pkg_setup
	if ! has_version 'games-rpg/nwn-data[hou,sou]' ; then
		eerror "${P} requires NWN v1.69, Shadows of Undrentide, and Hordes of"
		eerror "the Underdark. Please make sure you have all three before using"
		eerror "this patch."
		die "Requirements not met"
	fi
}

src_install() {
	local i
	for i in hak tlk erf
	do
		cd ${i}
		insinto "${dir}"/${i}
		doins *.${i} || die "${i} failed"
		cd ..
	done

	cd modules
	insinto "${dir}"/modules
	doins *.mod || die "mod failed"
	cd ..

	cd docs/cep
	insinto "${dir}"/docs/cep
	doins *.pdf || die "pdf failed"
	cd ../..

	cd dmvault
	insinto "${dir}"/dmvault
	doins *.bic || die "dmvault failed"
	cd ..

	prepgamesdirs
}
