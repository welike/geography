# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{geography}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kevin Elliott"]
  s.date = %q{2009-09-14}
  s.description = %q{TODO}
  s.email = %q{kevin@welikeinc.com}
  s.extra_rdoc_files = [
    "README",
     "README.rdoc"
  ]
  s.files = [
    "MIT-LICENSE",
     "README",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "generators/geography/geography_generator.rb",
     "generators/geography/templates/geography_tasks.rake",
     "generators/geography/templates/migrations/combined_v1.rb",
     "generators/geography/templates/migrations/continents.rb",
     "generators/geography/templates/migrations/counties.rb",
     "generators/geography/templates/migrations/countries.rb",
     "generators/geography/templates/migrations/regions.rb",
     "generators/geography/templates/migrations/states.rb",
     "generators/geography/templates/models/continent.rb",
     "generators/geography/templates/models/country.rb",
     "generators/geography/templates/models/county.rb",
     "generators/geography/templates/models/region.rb",
     "generators/geography/templates/models/state.rb",
     "geography.gemspec",
     "init.rb",
     "install.rb",
     "lib/geography.rb",
     "lib/geography/data_loaders.rb",
     "lib/geography/data_loaders/continents.rb",
     "lib/geography/data_loaders/countries.rb",
     "rails/init.rb",
     "test/geography_test.rb",
     "test/test_helper.rb",
     "uninstall.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/welike/geography}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Commonly needed geography classes, migrations, and helpers}
  s.test_files = [
    "test/geography_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
