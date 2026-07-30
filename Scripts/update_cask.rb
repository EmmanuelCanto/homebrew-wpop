#!/usr/bin/env ruby
# frozen_string_literal: true

require "rubygems"

unless ARGV.length == 3
  warn "Usage: update_cask.rb VERSION DOWNLOAD_URL SHA256"
  exit 64
end

version, download_url, sha256 = ARGV
cask_path = File.expand_path("../Casks/wpop.rb", __dir__)
content = File.read(cask_path)

replacements = {
  /^  version ".*"$/ => %(  version "#{version}"),
  /^  url ".*"$/ => %(  url "#{download_url}"),
  /^  sha256 ".*"$/ => %(  sha256 "#{sha256}"),
}

replacements.each do |pattern, replacement|
  matches = content.scan(pattern).length
  abort "Expected exactly one #{pattern.inspect} entry, found #{matches}" unless matches == 1

  content.sub!(pattern, replacement)
end

if Gem::Version.new(version) >= Gem::Version.new("4.0") &&
   !content.match?(/^  auto_updates true$/)
  dependency_pattern = /^(  depends_on macos: .*)$/
  abort "Could not find macOS dependency stanza" unless content.match?(dependency_pattern)

  content.sub!(dependency_pattern, "  auto_updates true\n\\1")
end

File.write(cask_path, content)
