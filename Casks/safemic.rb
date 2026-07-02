cask "safemic" do
  version "0.5.2"
  sha256 "43f783ef0d711279bbfe06e5d941b839e7aae30006b6d916d15d13ca9efa3bb4"

  url "https://github.com/vdsmon/safemic/releases/download/v0.5.2/safemic-0.5.2-aarch64-apple-darwin.dmg"
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
