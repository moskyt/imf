# -*- encoding: utf-8 -*-
# stub: rubyXL 3.4.6 ruby lib

Gem::Specification.new do |s|
  s.name = "rubyXL"
  s.version = "3.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vivek Bhagwat", "Wesha"]
  s.date = "2019-08-21"
  s.description = "rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents"
  s.email = "bhagwat.vivek@gmail.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/gilt/rubyXL"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 1.1.6"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<ruby-prof>, [">= 0"])
      s.add_development_dependency(%q<rspec_junit_formatter>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_dependency(%q<rubyzip>, [">= 1.1.6"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<ruby-prof>, [">= 0"])
      s.add_dependency(%q<rspec_junit_formatter>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
    s.add_dependency(%q<rubyzip>, [">= 1.1.6"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<ruby-prof>, [">= 0"])
    s.add_dependency(%q<rspec_junit_formatter>, [">= 0"])
  end
end
