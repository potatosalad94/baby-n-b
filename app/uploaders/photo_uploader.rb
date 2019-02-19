class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :simple do
    process :resize_to_fill => [164, 164, :fill]
    process :convert => 'png'

    cloudinary_transformation :quality => 80
  end
end
