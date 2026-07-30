cask "wpop" do
  version "4.0"
  sha256 "3a34c6e9c9face9fda09df88d0591bcca4bec5a43cb8663f28f513f8affbde74"

  url "https://github.com/EmmanuelCanto/wpop/releases/download/4.0/Wpop.dmg"
  name "Wpop"
  desc "Floating lyrics window for Apple Music and Spotify"
  homepage "https://github.com/EmmanuelCanto/wpop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Wpop.app"
end
