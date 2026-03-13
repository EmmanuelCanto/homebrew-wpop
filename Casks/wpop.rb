cask "wpop" do
  version "1.0"

  url "https://github.com/EmmanuelCanto/wpop/releases/download/beta/Wpop.dmg"
  sha256 :no_check

  name "Wpop"
  desc "Floating lyrics window for Apple Music and Spotify"
  homepage "https://github.com/EmmanuelCanto/wpop"

  app "Wpop.app"
end