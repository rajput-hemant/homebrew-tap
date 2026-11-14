class Dman < Formula
  desc "Terminal-first download manager built on aria2 (optional yt-dlp for video): CLI, TUI, web UI and daemon"
  homepage "https://github.com/rajput-hemant/dman"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/rajput-hemant/dman/releases/download/v0.1.0/dman-aarch64-apple-darwin.tar.gz"
      sha256 "e07c717d53cb821304966139f683765cb26d29e4db7865c24ac4683d46911e89"
    end
    if Hardware::CPU.intel?
      url "https://github.com/rajput-hemant/dman/releases/download/v0.1.0/dman-x86_64-apple-darwin.tar.gz"
      sha256 "c6fb004277588fb43ebb34ce8d085b41ede0403a87b027a47507b1af2759d398"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/rajput-hemant/dman/releases/download/v0.1.0/dman-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f9210c2cc4f5f48b0411d0193183cae3f358037178813a56d0f612625f73a874"
    end
    if Hardware::CPU.intel?
      url "https://github.com/rajput-hemant/dman/releases/download/v0.1.0/dman-x86_64-unknown-linux-musl.tar.gz"
      sha256 "225db408dbdbab730edd43fb6ded749abf6171f8879ecb7c9a64e22b4aaa6ccb"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]
  depends_on "aria2"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dman"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "dman"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "dman"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "dman"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
