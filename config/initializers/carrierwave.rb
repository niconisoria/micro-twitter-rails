if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['S3_ACCESS_KEY'],         # required unless using use_iam_profile
      aws_secret_access_key: ENV['S3_SECRET_KEY'],         # required unless using use_iam_profile
    }
    config.fog_directory  = ENV['S3_BUCKET']                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end