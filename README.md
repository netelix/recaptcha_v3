# RecaptchaV3

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/recaptcha_v3`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recaptcha_v3'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install recaptcha_v3

## Usage

### Getting Google API Keys
First you need to create a pair of keys for Google Recaptcha V3.

* Go here https://www.google.com/recaptcha/admin/create
* Name your project  
* choose 'reCaptcha version 3'
* Add your local and production domains 
* Copy the key to your environment variable


I use figaro for dev so env vars go to `application.yml` 
```yaml
GOOGLE_CAPTCHA_CLIENT: public_key_JsEhfPZqiaBo
GOOGLE_CAPTCHA_SERVER: private_key-KkH_62dg7E
```

**important** : you can't have recaptcha working with an localhost:3000 url. Personally, I use ngrok for testing, in to have a public URL.

### Setting up the route

in `routes.rb`
```ruby
  post 'captcha_token', to: 'application#recaptcha_token', as: :captcha_token
```

### Include RecaptchaHelper

in `application_controller.rb`

```ruby
class ApplicationController < ActionController::Base
  include RecaptchaV3Helpers
  
  ...
end  
```

### Call recaptcha_data_attribute from your main view

in the <body> tag of your page, call `recaptcha_v3` 

```html
<body class="..." <%= recaptcha_v3 %>>
    ...
</body>
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/recaptcha_v3. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/recaptcha_v3/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RecaptchaV3 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/recaptcha_v3/blob/master/CODE_OF_CONDUCT.md).