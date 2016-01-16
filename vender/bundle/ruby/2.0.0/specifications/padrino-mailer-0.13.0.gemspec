# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "padrino-mailer"
  s.version = "0.13.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Padrino Team", "Nathan Esquenazi", "Davide D'Agostino", "Arthur Chiu"]
  s.date = "2015-10-11"
  s.description = "Mailer system for padrino allowing easy delivery of application emails"
  s.email = "padrinorb@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://www.padrinorb.com"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "padrino-mailer"
  s.rubygems_version = "2.0.14"
  s.summary = "Mailer system for padrino"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<padrino-core>, ["= 0.13.0"])
      s.add_runtime_dependency(%q<mail>, ["~> 2.5.3"])
    else
      s.add_dependency(%q<padrino-core>, ["= 0.13.0"])
      s.add_dependency(%q<mail>, ["~> 2.5.3"])
    end
  else
    s.add_dependency(%q<padrino-core>, ["= 0.13.0"])
    s.add_dependency(%q<mail>, ["~> 2.5.3"])
  end
end
