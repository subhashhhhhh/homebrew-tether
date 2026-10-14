cask "tether" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.6"
  sha256 arm:   "59c9cb65fdd268417ea6d1e2020c93c1b23b1d62d070d3315764251267f0e82a",
         intel: "293495938131153149ffacfa495572dbbf07b01beea40a4e033b8553f018699e"

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
