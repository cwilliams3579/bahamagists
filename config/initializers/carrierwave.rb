CarrierWave.configure do |config|
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                          # required
    aws_access_key_id:     ENV["aws_access_key_id"],       # required
    aws_secret_access_key: ENV["aws_secret_access_key"],  # required
  }
  config.fog_directory  = ENV["fog_directory"]             # required
end
