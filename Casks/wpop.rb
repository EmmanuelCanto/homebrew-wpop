cask "wpop" do
  version "3.0"
  sha256 "3a4c6d121707bf627b78a218bf074e24bf711cb72393edef3f0a8a1e2fc3e975"

  url "https://github.com/EmmanuelCanto/wpop/releases/download/3.0/Wpop.dmg"
  name "Wpop"
  desc "Floating lyrics window for Apple Music and Spotify"
  homepage "https://github.com/EmmanuelCanto/wpop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Wpop.app"
end
