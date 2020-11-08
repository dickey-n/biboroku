class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_limit: [640, 480]
  
  def default_url(*_args)
    ActionController::Base.helpers.asset_path('fallback/' + [version_name, 'default.png'].compact.join('_'))
  end

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
     var = :"@#{mounted_as}_secure_token"
     model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end