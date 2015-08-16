# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Petr Pisar, https://bugs.gentoo.org/show_bug.cgi?id=254704

EAPI="5"

inherit perl-app

DESCRIPTION="GUI to produce PDF or DjVu files from scanned documents"
HOMEPAGE="http://gscan2pdf.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="adf djvu email help cuneiform gocr +tesseract tiff +unpaper"

RDEPEND=">=dev-perl/gtk2-perl-1.90.0
	>=dev-perl/glib-perl-1.220
	dev-perl/Gtk2-Ex-Simple-List
	dev-perl/Gtk2-ImageView
	media-gfx/imagemagick[perl]
	>=dev-perl/Locale-gettext-1.05
	dev-perl/Config-General
	dev-perl/PDF-API2
	dev-perl/Sane
	dev-perl/Set-IntSpan
	dev-perl/Goo-Canvas
	dev-perl/HTML-Parser
	dev-perl/Readonly
	dev-perl/Log-Log4perl
	dev-perl/Try-Tiny
	dev-perl/List-MoreUtils
	dev-perl/Proc-ProcessTable
	virtual/perl-Archive-Tar
	virtual/perl-threads
	virtual/perl-threads-shared
	virtual/perl-Getopt-Long
	virtual/perl-Data-Dumper
	virtual/perl-Carp
	virtual/perl-File-Temp
	adf? ( media-gfx/sane-frontends )
	djvu? ( app-text/djvu )
	email? ( x11-misc/xdg-utils )
	help? ( dev-perl/Gtk2-Ex-PodViewer )
	cuneiform? ( app-text/cuneiform )
	gocr? ( app-text/gocr )
	tesseract? ( app-text/tesseract )
	tiff? ( media-libs/tiff )
	unpaper? ( app-text/unpaper )"
DEPEND="${RDEPEND}
	media-gfx/sane-backends"

src_install() {
	perl-module_src_install
	dodoc History
}

optfeature() {
	local desc=$1
	shift
	while (( $# )); do
		if has_version "$1"; then
			elog "  [I] $1 to ${desc}"
		else
			elog "  [ ] $1 to ${desc}"
		fi
		shift
	done
}

pkg_postinst() {
	optfeature "Send to mail" x11-misc/xdg-utils
	optfeature "Scanning via ADF" media-gfx/sane-frontends
	optfeature "OCR support" \
		app-text/gocr \
		app-text/tesseract \
		app-text/ocropus \
		app-text/cuneiform
	optfeature "Convert/scan to DJVU" app-text/djvu
	optfeature "Post-process scans with unpaper" app-text/unpaper
	optfeature "Convert/scan to TIFF" media-libs/tiff
	optfeature "Display help" dev-perl/Gtk2-Ex-PodViewer
}
