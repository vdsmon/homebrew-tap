cask "safemic" do
  version "0.7.0"
  sha256 "550cf7cb33accf7ce9f5170e7bc22556a4e4d9f8a3d9a3c2948d55dc6346b9c7"

  url "https://github.com/vdsmon/safemic/releases/download/v0.7.0/safemic-0.7.0-aarch64-apple-darwin.dmg"
  name "SafeMic"
  desc "System-wide microphone mute for macOS"
  homepage "https://github.com/vdsmon/safemic"

  depends_on arch: :arm64

  app "SafeMic.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/SafeMic.app"]
  end

  zap trash: [
    "~/Library/Application Support/safemic",
    "~/Library/LaunchAgents/com.vdsmon.safemic.plist",
    "~/Library/Caches/com.vdsmon.safemic",
  ]
end
