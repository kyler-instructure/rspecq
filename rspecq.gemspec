require_relative "lib/rspecq/version"

Gem::Specification.new do |s|
  s.name        = "rspecq"
  s.version     = RSpecQ::VERSION
  s.summary     = "Optimally distribute and run RSpec suites among parallel " \
                  "workers; for faster CI builds"
  s.authors     = "Agis Anastasopoulos"
  s.email       = "agis.anast@gmail.com"
  s.files       = Dir["lib/**/*", "CHANGELOG.md", "LICENSE", "Rakefile", "README.md"]
  s.executables << "rspecq"
  s.homepage    = "https://github.com/skroutz/rspecq"
  s.license     = "MIT"

  if ENV["CI"] && ENV["RSPEC_CORE"]
    s.add_dependency "rspec-core", ENV["RSPEC_CORE"]
  else
    s.add_dependency "rspec-core"
  end

  s.add_dependency "redis", ">= 4.0", "< 6.0"
  s.add_dependency "sentry-ruby"
  s.add_dependency "rspec_junit_formatter"

  s.add_development_dependency "minitest"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rubocop", "~> 0.93.0"
end
