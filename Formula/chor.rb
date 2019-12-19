class Chor < Formula

  chor_version = "0.0.5"

  desc "CLI to manage integration applications with Choreo platform"
  homepage "https://github.com/wso2/choreo-cli"
  url "https://github.com/wso2/choreo-cli/archive/v#{chor_version}.tar.gz"
  sha256 "9cd773e1fb08f2cc940a8f81714ef053d42a5d4900003cdd411cf342e591c743"

  bottle do
    root_url "https://github.com/wso2/choreo-cli/releases/download/v#{chor_version}"
    sha256 "7c53843d8fabc9e419b817074ef2c8555fedead8666231dd7feacf709ac4f5c4" => :high_sierra
    sha256 "54c6798f61733f8e80222c4e0578513640ca78e9c7b8b1922cd197bae80e1dd8" => :mojave
    sha256 "9ebbe049b0926d6a2c4ece8a0829925cf2acc9147f5bb1a82d552512f6664d15" => :catalina
  end

  depends_on "go" => :build

  def install
    system "make", "build-cli"
    bin.install "builder/target/chor"
  end

  test do
    output=shell_output("chor version").split
    assert_match "#{chor_version}", output[1]
  end

end
