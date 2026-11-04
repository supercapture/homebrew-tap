# SuperCapture for Homebrew (docs/SCAP_COMMAND_LINE.md, "Homebrew meets Velopack"): Homebrew installs the app and
# links scap; the app updates itself (Velopack), so the cask says auto_updates and `brew upgrade` leaves it alone.
# build.sh --push writes version and sha256 at each release.
cask "supercapture" do
  version "1.0.455"
  sha256 "05e525382867c9fcacb793a391c12b2e31debbae25d1372ccda5b8847b0069e1"

  url "https://github.com/supercapture/releases/releases/download/v#{version}/SuperCapture-osx-Portable.zip",
      verified: "github.com/supercapture/releases/"
  name "SuperCapture"
  desc "Screenshot, recording and annotation tool with a command-line and MCP server"
  homepage "https://supercapture.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "SuperCapture.app"
  binary "#{appdir}/SuperCapture.app/Contents/MacOS/scap"

  # Never the library (~/Documents/SuperCapture by default): those are the user's files.
  zap trash: [
    "~/Library/Application Support/SuperCapture",
    "~/Library/Caches/io.supercapture.desktop",
    "~/Library/Caches/velopack/SuperCapture",
    "~/Library/HTTPStorages/io.supercapture.desktop",
    "~/Library/HTTPStorages/io.supercapture.desktop.binarycookies",
    "~/Library/Preferences/io.supercapture.desktop.plist",
    "~/Library/WebKit/io.supercapture.desktop",
  ]
end
