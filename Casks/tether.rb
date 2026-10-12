cask "tether" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.5.1"
  sha256 arm:   "c7eb33fc376e2aef9f4c446638a22b5871c5227baae305e60b0d76691d51919f",
         intel: "a29372efc902f547656d773143b2c79a4555e9eb821921d8dc1a8e8039717d07"

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
