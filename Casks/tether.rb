cask "tether" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.5"
  sha256 arm:   "6b8e52611dc755d86edaedce5fd6deb57c6163b82d684ff2354c540ceca3a61b",
         intel: "23764c401d3424c5e4ac6d213cfef9e7076339be18c791f1eb7d0d51fe7bd9c0"

  url "https://github.com/subhashhhhhh/Tether/releases/download/v#{version}/Tether-#{version}-#{arch}.dmg"
  name "Tether"
  desc "Phone notifications, texts, files and clipboard from Android via KDE Connect"
  homepage "https://github.com/subhashhhhhh/Tether"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Tether.app"

  # Tether isn't notarized; clearing the flag spares Homebrew users the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tether.app"]
  end

  uninstall quit: "com.subhashh.Tether"

  zap trash: [
    "~/Library/Application Support/Tether",
    "~/Library/Caches/com.subhashh.Tether",
    "~/Library/Caches/TetherIncoming",
    "~/Library/Caches/TetherOutgoing",
    "~/Library/Caches/TetherUpdate",
    "~/Library/Preferences/com.subhashh.Tether.plist",
  ]
end
