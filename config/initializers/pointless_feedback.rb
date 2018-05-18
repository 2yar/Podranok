PointlessFeedback.setup do |config|
  # ==> Feedback Configuration
  # Configure the topics for the user to choose from on the feedback form
  # config.message_topics = ['Error on page', 'Other']

  # ==> Email Configuration
  # Configure feedback email properties (disabled by default)
  # Variables needed for emailing feedback
  config.email_feedback            = true
  config.send_from_submitter       = true
  config.from_email                = 'feedback@pointlesscorp.com'
  config.to_emails                 = ['adacer91092@mail.ru', 'adacer73044210@gmail.com']
  # config.google_captcha_site_key   = nil
  # config.google_captcha_secret_key = nil
end
