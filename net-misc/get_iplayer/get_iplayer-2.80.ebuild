# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Command-line tool to search, index, stream and record BBC services"
HOMEPAGE="http://www.infradead.org/get_iplayer/html/get_iplayer.html"
SRC_URI="ftp://ftp.infradead.org/pub/${PN}/${P}.tar.gz"

inherit perl-app

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl
	media-sound/id3v2
	media-video/atomicparsley	
	media-video/ffmpeg
	media-video/flvstreamer
	media-video/mplayer
	media-video/vlc"
