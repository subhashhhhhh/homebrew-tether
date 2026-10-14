cask "tether" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.7"
  sha256 arm:   "c8b138599a70885babde3bf11d5342f05adbd96c6be1442dba1d0932a76fa141",
         intel: "ce88a44026a2a19d15d947196b6236fe80eb2a3108ba6414fd0778a54ac604de"

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
