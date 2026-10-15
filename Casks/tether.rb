cask "tether" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.8"
  sha256 arm:   "edc19e488c2abaa593730d0eec5577fc0df8cdf9666334717c0fb61198c0b6ec",
         intel: "a17e044fd539f7777c159d71626a2648441c210d8904dd8cc839a74561313254"

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
