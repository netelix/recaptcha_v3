
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "recaptcha_v3/version"

Gem::Specification.new do |spec|
  spec.name          = "recaptcha_v3"
  spec.version       = RecaptchaV3::VERSION
  spec.authors       = ["Alexis Panet"]
  spec.email         = ["netelix@gmail.com"]

  spec.summary       = %q{Easily add and manage Google Captcha}
  spec.description   = %q{Easily add and manage Google Captcha}
  spec.homepage      = "https://github.com/netelix/recaptcha_v3"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
