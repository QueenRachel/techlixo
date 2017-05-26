# Load the Rails application.
require File.expand_path('../application', __FILE__)
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  authentication: :plain,
  domain: 'heroku.com',
  enable_starttls_auto: true,
  password: ENV['SENDGRID_PASSWORD'],
  port: '587',
  user_name: ENV['SENDGRID_USERNAME']
}
# Initialize the Rails application.
Rails.application.initialize!
