# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'frasier/version'

Gem::Specification.new do |spec|
  spec.name          = "frasier"
  spec.version       = Frasier::VERSION
  spec.authors       = ["pjaspers"]
  spec.email         = ["piet@jaspe.rs"]
  spec.description   = %q{Passphrase generator using plain text books}
  spec.summary       = %q{Inspired by Diceware™, except instead of being cryptogaphically sound, this uses not a carefully created word list but uses text from books.}
  spec.homepage      = "https://github.com/pjaspers/frasier"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.cert_chain  = ['certs/pjaspers.pem']
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  spec.add_development_dependency "bundler", "~> 1.3"
end
