# frozen_string_literal: true

require_relative "recaptcha_v3/version"
require 'rails'
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require 'orm_adapter'
require 'set'
require 'securerandom'

module RecaptchaV3
  module Controllers
    autoload :Helpers,        'recaptcha_v3/controllers/helpers'
  end

  require 'recaptcha_v3/helper'
  ActiveSupport.on_load(:action_view) do
    include RecaptchaV3::Helper
  end
end
