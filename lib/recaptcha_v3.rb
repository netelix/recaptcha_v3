require "recaptcha_v3/version"
require "recaptcha_v3/engine"

module RecaptchaV3
  module Controllers
    autoload :Helpers,        'recaptcha_v3/controllers/helpers'
  end

  module Mutations
    autoload :ValidateRecaptcha,        'recaptcha_v3/mutations/validate_recaptcha'
  end

  require 'recaptcha_v3/helper'
  ActiveSupport.on_load(:action_view) do
    include RecaptchaV3::Helper
  end
end