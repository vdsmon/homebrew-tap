cask "safemic" do
  version "0.5.4"
  sha256 "6190335a8f68df68fd49f01cd81daeba9403fbc957703b9feef39166c527f908"

  url "https://github.com/vdsmon/safemic/releases/download/v0.5.4/safemic-0.5.4-aarch64-apple-darwin.dmg"
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
