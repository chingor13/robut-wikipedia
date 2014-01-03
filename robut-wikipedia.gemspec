Gem::Specification.new do |s|
  s.name        = 'robut-wikipedia'
  s.version     = '0.0.2'
  s.authors     = ["Jeff Ching"]
  s.description = %{ Robut plugin that provides Wikipedia querying functionality. }
  s.summary     = "Wikipedia Robut plugin"
  s.email       = "ching.jeff@gmail.com"
  s.homepage    = "http://github.com/chingor13/robut-wikipedia"

  s.platform    = Gem::Platform::RUBY
  s.add_dependency 'robut', '>= 0.3.0'
  s.add_dependency 'wikipedia-client', '~> 1.3.0'
  s.add_dependency 'nokogiri'
  
  s.license = 'MIT'
  s.files            = `git ls-files`.split("\n")
  s.extra_rdoc_files = ["README.md"]
  s.require_path     = "lib"
end