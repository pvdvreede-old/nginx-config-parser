lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "nginx-config-parser"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paul Van de Vreede"]
  s.email       = ["paul@vdvreede.net"]
  s.homepage    = "http://github.com/pvdvreede/nginx-config-parser"
  s.summary     = "Parse Nginx config files to Ruby object"
  s.description = "Parse Nginx config files to work with them as Ruby objects."

  s.add_dependency "parslet"
  s.add_development_dependency "rspec"

  s.files        = Dir.glob("lib/**/*")
  s.require_path = 'lib'
end
