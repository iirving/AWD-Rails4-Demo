# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
Work::Application.initialize!

Work::Application.configure do


 #config.action_mailer.delivery_method = :test

  # Alternate configuration example, using gmail:
    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.smtp_settings = {
    #   address:        "smtp.gmail.com",
    #   port:           587,
    #   domain:         "domain.of.sender.net",
    #   authentication: "plain",
    #   user_name:      "dave",
    #   password:       "secret",
    #   enable_starttls_auto: true
    # }

    # Don't care if the mailer can't send.
  # config.action_mailer.raise_delivery_errors = false

end