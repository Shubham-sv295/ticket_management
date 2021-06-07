# -*- encoding: utf-8 -*-
# stub: oauth 0.3.6 ruby lib

Gem::Specification.new do |s|
  s.name = "oauth".freeze
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Pelle Braendgaard".freeze, "Blaine Cook".freeze, "Larry Halff".freeze, "Jesse Clark".freeze, "Jon Crosby".freeze, "Seth Fitzsimmons".freeze]
  s.date = "2009-09-14"
  s.description = "OAuth Core Ruby implementation".freeze
  s.email = "oauth-ruby@googlegroups.com".freeze
  s.executables = ["oauth".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "License.txt".freeze, "Manifest.txt".freeze, "website/index.txt".freeze]
  s.files = ["History.txt".freeze, "License.txt".freeze, "Manifest.txt".freeze, "bin/oauth".freeze, "website/index.txt".freeze]
  s.homepage = "http://oauth.rubyforge.org".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "OAuth Core Ruby implementation".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ruby-hmac>.freeze, [">= 0.3.1"])
    s.add_development_dependency(%q<newgem>.freeze, [">= 1.5.2"])
    s.add_development_dependency(%q<actionpack>.freeze, [">= 0"])
    s.add_development_dependency(%q<rack>.freeze, [">= 0"])
    s.add_development_dependency(%q<hoe>.freeze, [">= 2.3.3"])
  else
    s.add_dependency(%q<ruby-hmac>.freeze, [">= 0.3.1"])
    s.add_dependency(%q<newgem>.freeze, [">= 1.5.2"])
    s.add_dependency(%q<actionpack>.freeze, [">= 0"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<hoe>.freeze, [">= 2.3.3"])
  end
end
