cask "safemic" do
  version "0.6.0"
  sha256 "67a24696bf222d33a4d8fe40b8eb9ecb7da1ec85553df912b811bc786f386c31"

  url "https://github.com/vdsmon/safemic/releases/download/v0.6.0/safemic-0.6.0-aarch64-apple-darwin.dmg"
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
