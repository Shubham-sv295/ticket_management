# -*- encoding: utf-8 -*-
# stub: linkedin 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "linkedin".freeze
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Wynn Netherland".freeze]
  s.date = "2010-02-05"
  s.description = "Ruby wrapper for the LinkedIn API".freeze
  s.email = "wynn.netherland@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.markdown".freeze]
  s.files = ["LICENSE".freeze, "README.markdown".freeze]
  s.homepage = "http://github.com/pengwynn/linkedin".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Ruby wrapper for the LinkedIn API".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<oauth>.freeze, ["~> 0.3.5"])
    s.add_runtime_dependency(%q<roxml>.freeze, ["~> 3.1.3"])
    s.add_runtime_dependency(%q<crack>.freeze, ["~> 0.1.4"])
    s.add_development_dependency(%q<thoughtbot-shoulda>.freeze, [">= 2.10.1"])
    s.add_development_dependency(%q<jnunemaker-matchy>.freeze, ["= 0.4.0"])
    s.add_development_dependency(%q<mocha>.freeze, ["= 0.9.4"])
    s.add_development_dependency(%q<fakeweb>.freeze, [">= 1.2.5"])
  else
    s.add_dependency(%q<oauth>.freeze, ["~> 0.3.5"])
    s.add_dependency(%q<roxml>.freeze, ["~> 3.1.3"])
    s.add_dependency(%q<crack>.freeze, ["~> 0.1.4"])
    s.add_dependency(%q<thoughtbot-shoulda>.freeze, [">= 2.10.1"])
    s.add_dependency(%q<jnunemaker-matchy>.freeze, ["= 0.4.0"])
    s.add_dependency(%q<mocha>.freeze, ["= 0.9.4"])
    s.add_dependency(%q<fakeweb>.freeze, [">= 1.2.5"])
  end
end
