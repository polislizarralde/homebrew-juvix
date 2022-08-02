class Juvix < Formula
  desc "The Juvix compiler."
  homepage "https://juvix.org"
  url "https://github.com/anoma/juvix/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "6c4cff2655c2f13d0770c40e5473b03f25cc049edc73b4f3c4458013032f70ec"
  license "GPL-3.0"
  
  head do
    url "https://github.com/anoma/juvix.git", branch: "main"
  end

  option "with-emacs", "Install Emacs Plus v28"
  
  depends_on "make" => :build
  depends_on "stack" => :build
  depends_on "d12frosted/emacs-plus/emacs-plus@28" => :optional
  
  def install
      bin.install Dir["juvix-stdlib"] 
      system "git", "submodule" , "update", "--init", "--recursive"
      system "make", "install"
      prefix.install "README.org"
      prefix.install "LICENSE" 
  end

  test do
    system "make", "test-shell"
  end
end
