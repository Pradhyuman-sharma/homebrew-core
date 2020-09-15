class Scummvm < Formula
  desc "Graphic adventure game interpreter"
  homepage "https://www.scummvm.org/"
  url "https://www.scummvm.org/frs/scummvm/2.2.0/scummvm-2.2.0.tar.xz"
  sha256 "1469657e593bd8acbcfac0b839b086f640ebf120633e93f116cab652b5b27387"
  license "GPL-2.0-or-later"
  head "https://github.com/scummvm/scummvm.git"

  livecheck do
    url "https://www.scummvm.org/frs/scummvm/"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["']}i)
  end

  bottle do
    rebuild 1
    sha256 "2d1de2f1efde7505ec7b06a2dfd90e287d6d816d5082f7a89ae2f44c6c25b9d8" => :catalina
    sha256 "5b28e8e3d52ce3b1d9a0a172483090a8926c4f9244915b6af5a38b3c02c1eca8" => :mojave
    sha256 "a31b470f92fa3f75ce56c01c45c4c6c09960b001e6b96e90149e58932e3c4bee" => :high_sierra
  end

  depends_on "a52dec"
  depends_on "faad2"
  depends_on "flac"
  depends_on "fluid-synth"
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libmpeg2"
  depends_on "libpng"
  depends_on "libvorbis"
  depends_on "mad"
  depends_on "sdl2"
  depends_on "theora"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--enable-release",
                          "--with-sdl-prefix=#{Formula["sdl2"].opt_prefix}"
    system "make"
    system "make", "install"
    (share+"pixmaps").rmtree
    (share+"icons").rmtree
  end

  test do
    system "#{bin}/scummvm", "-v"
  end
end
