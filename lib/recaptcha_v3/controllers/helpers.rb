module RecaptchaV3
  module Controllers
    # Those helpers are convenience methods added to ApplicationController.
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method :should_challenge_captcha?

        def recaptcha_token
          render json: recaptcha_valid? ? 'ok' : 'nok'
        end

        def recaptcha_valid?
          return true if user_already_validate_captcha?

          session[:user_already_validate_captcha] =
            ValidateRecaptcha.run!(params: params, ip: request.remote_ip)
        end

        def user_already_validate_captcha?
          session[:user_already_validate_captcha] == true
        end

        def should_challenge_captcha?
          session[:user_already_validate_captcha].nil?
        end
      end
    end
  end
end