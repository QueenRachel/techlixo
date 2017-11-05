CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    region:                'us-east-1',
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'] || '',
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || '',
  }
  config.storage = (Rails.env.production? || Rails.env.staging?) ? :fog : :file
  config.fog_directory = ENV['AWS_BUCKET_NAME'] || ''
  config.enable_processing = false if Rails.env.test?
end
