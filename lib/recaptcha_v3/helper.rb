module RecaptchaV3
  module Helper
    def recaptcha_v3
      return "data-should-challenge-recaptcha=1" if should_challenge_captcha?
    end
  end
end