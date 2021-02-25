module RecaptchaV3
  module Helper
    def recaptcha_v3
      attributes = "data-recaptcha-client-id='<%= ENV['GOOGLE_CAPTCHA_CLIENT'] %>'"
      attributes += " data-should-challenge-recaptcha=1" if should_challenge_captcha?
      return attributes
    end
  end
end