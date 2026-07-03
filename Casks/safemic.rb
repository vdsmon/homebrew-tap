cask "safemic" do
  version "0.5.5"
  sha256 "14e15887778970e5a080c13819202b5217378faf0b76a3533905529bff8cfec6"

  url "https://github.com/vdsmon/safemic/releases/download/v0.5.5/safemic-0.5.5-aarch64-apple-darwin.dmg"
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
