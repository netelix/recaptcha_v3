Recaptcha =
  typeof Recaptcha != "undefined"
    ? Recaptcha
    : {
        initialize: function() {
          Recaptcha.challengeCaptchaThenDoThat(function(){});
        },

        challengeCaptchaThenDoThat: function(action) {
          if(Recaptcha.shouldChallenge()) {
            GlobalVariable.onDefined('grecaptcha', function() {
              var action_after_captcha_token = action;

              if(Recaptcha.isChallenged()) {
                action_after_captcha_token();
              } else {
                Recaptcha.setChallenged();
                Recaptcha.doSomethingWithTheToken(function(token) {
                  $.post('<%= Rails.application.routes.url_helpers.captcha_token_path %>', { recaptcha_token: token })
                    .always(function() {
                      action_after_captcha_token();
                    });
                });
              }
            });
          } else {
            action();
          }
        },

      challenged: false,

      isChallenged: function() {
          return Recaptcha.challenged;
        },

        setChallenged: function() {
          Recaptcha.challenged = true;
        },

        shouldChallenge: function() {
          return $('[data-should-challenge-recaptcha=1]').length
        },

        doSomethingWithTheToken: function(something){
          grecaptcha.ready(function() {
            grecaptcha.execute('<%= ENV['GOOGLE_CAPTCHA_CLIENT'] %>').then(something);
          });
        },

        onSubmit: function(token) {
        }
      };

$(document).on("ajax_modal:load turbolinks:load", function() {
  Recaptcha.initialize();
});
