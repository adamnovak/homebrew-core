class Pianod < Formula
  desc "Pandora client with multiple control interfaces"
  homepage "https://deviousfish.com/pianod/"
  url "http://deviousfish.com/Downloads/pianod2/Devel/pianod2-298.tar.gz"
  sha256 "0de916d8df19c045a98fd9b63ec25f157d30235c412689c00c3cead99c64ba76"

  bottle do
    cellar :any
    rebuild 1
    sha256 "14b7d55edd091ded3ad707d14e81136fdd34ec38308b292bd78a4879c7690fa1" => :catalina
    sha256 "e85267b08e38e5657066b8c20e84177ada48b11567c79de70e4b61b65da515f7" => :mojave
    sha256 "f3b3d4d7ab4c8841a87cb44ecfee33fdd69b05c85c2f62f094ae4251fe38d777" => :high_sierra
  end

  depends_on "pkg-config" => :build
  depends_on "json-c"
  depends_on "libao"
  depends_on "libgcrypt"

  def install
    ENV["OBJCXXFLAGS"] = "-std=c++11"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/pianod", "-v"
  end
end
