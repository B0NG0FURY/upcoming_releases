require_relative 'lib/upcoming_releases/version'

Gem::Specification.new do |spec|
  spec.name          = "upcoming_releases"
  spec.version       = UpcomingReleases::VERSION
  spec.authors       = ["bongofury"]
  spec.email         = ["jtroutmanman@gmail.com"]

  spec.summary       = %q{Lists all upcoming indie album releases}
  spec.description   = %q{Grabs all upcoming releases from Midheaven Mailorder and lists them}
  spec.homepage      = "https://github.com/B0NG0FURY/upcoming_releases"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/B0NG0FURY/upcoming_releases"
  spec.metadata["changelog_uri"] = "https://github.com/B0NG0FURY/upcoming_releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_dependency "nokogiri"
end
