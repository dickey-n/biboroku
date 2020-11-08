CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'biboroku'
    config.asset_host = 'https://biboroku.s3.amazonaws.com'
    config.fog_public     = false
    config.fog_authenticated_url_expiration = 600  
    config.fog_credentials = {
      provider: 'aws',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1',
      path_style: true
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/