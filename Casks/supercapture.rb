# SuperCapture for Homebrew (docs/SCAP_COMMAND_LINE.md, "Homebrew meets Velopack"): Homebrew installs the app and
# links scap; the app updates itself (Velopack), so the cask says auto_updates and `brew upgrade` leaves it alone.
# build.sh --push writes version and sha256 at each release.
cask "supercapture" do
  version "1.0.461"
  sha256 "74a7ab326fd0728396f51df9b23d9ab700a390bba87c070bc4cc13eb8c264fd8"

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
  binary "#{appdir}/SuperCapture.app/Contents/MacOS/scap", target: "supercapture"

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

  caveats <<~EOS
    SuperCapture's command line tool is scap, or supercapture. Try: scap help
    SuperCapture updates itself, so brew upgrade leaves it alone.
  EOS
end
