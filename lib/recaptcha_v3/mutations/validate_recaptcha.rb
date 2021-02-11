module RecaptchaV3
  module Mutations
    class ValidateRecaptcha < Mutations::Command
      required { duck :params }
      optional { string :ip }

      def execute
        siteverify['success']
      end

      def response
        uri = URI.parse('https://www.google.com/recaptcha/api/siteverify')
        Net::HTTP.post_form(uri, parameters)
      end

      def siteverify
        @siteverify ||= JSON.parse(response.body)
      end

      def parameters
        {
          secret: ENV['GOOGLE_CAPTCHA_SERVER'],
          response: params['recaptcha_token'],
          remote_ip: ip
        }
      end
    end
  end
end