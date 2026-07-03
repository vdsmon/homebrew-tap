cask "safemic" do
  version "0.7.1"
  sha256 "b81fd02b2bc607cf58ce57cefc29161de40e488cf44dace91490c36056577d21"

  url "https://github.com/vdsmon/safemic/releases/download/v0.7.1/safemic-0.7.1-aarch64-apple-darwin.dmg"
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
