cask "safemic" do
  version "0.5.3"
  sha256 "d2b3ec2b00707fd7410297c1529874a864635e539073bd790d2f0d47304be49e"

  url "https://github.com/vdsmon/safemic/releases/download/v0.5.3/safemic-0.5.3-aarch64-apple-darwin.dmg"
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
