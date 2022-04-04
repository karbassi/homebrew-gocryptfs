class Gocryptfs < Formula
  desc "Encrypted overlay filesystem written in Go"
  homepage "https://nuetzlich.net/gocryptfs/"
  url "https://github.com/rfjakob/gocryptfs/releases/download/v2.2.1/gocryptfs_v2.2.1_src-deps.tar.gz"
  sha256 "8d3f66fe426de6b31dfd56122f26047cc8cda679d2fba7bc26d78448701da5e3"
  license "MIT"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@1.1"


  def install
    system "./build.bash"
    bin.install "gocryptfs"
  end


  test do
    (testpath/"encdir").mkpath
    pipe_output("#{bin}/gocryptfs -init #{testpath}/encdir", "password", 0)
    assert_predicate testpath/"encdir/gocryptfs.conf", :exist?
  end
end
