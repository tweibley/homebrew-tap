cask "hypermnesia" do
  version "0.1.0"
  sha256 "2ad05f45190531cff799c58af7a20ad45c60820cef5d76f1d4e6ea5695d273ca"

  url "https://github.com/tweibley/hypermnesia/releases/download/v#{version}/Hypermnesia-#{version}.zip",
      verified: "github.com/tweibley/hypermnesia/"
  name "Hypermnesia"
  desc "Local-first, decaying memory for your coding agents"
  homepage "https://hypermnesia.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Hypermnesia.app"
  # Put the bundled CLI on PATH (replaces the manual ~/.local/bin symlink).
  binary "#{appdir}/Hypermnesia.app/Contents/Resources/hypermnesia"

  zap trash: [
    "~/Library/Application Support/Hypermnesia",
    "~/Library/Caches/app.hypermnesia",
    "~/Library/Preferences/app.hypermnesia.plist",
    "~/Library/Saved Application State/app.hypermnesia.savedState",
  ]

  caveats <<~EOS
    Hypermnesia captures from and injects into Claude Code, Cursor, and Google Antigravity
    via editor hooks. Turn that on (and add the MCP recall/ask/remember path) with:

      hypermnesia setup --with-mcp

    To remove the hooks later, run `hypermnesia setup --uninstall` BEFORE `brew uninstall`.
  EOS
end
