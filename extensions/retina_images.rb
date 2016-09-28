# Middleman 4.x Image Resizer Extension
# by Sam Rayner
#
# In config.rb:
# require 'extensions/retina_images'
# activate :retina_images

class RetinaImages < Middleman::Extension
  option :input_folders, ['images'], 'List of directories containing the images to downscale'

  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def retina_image_tag(url, options_hash={})
      return image_tag(url, options_hash) if url =~ /(https?:)?\/\//
      options_hash[:srcset] ||= "#{image_path(url)} 2x"
      options_hash[:alt] ||= image_alt(url)
      extension = File.extname(url)
      #don't alter URL in development as image won't exist in /source/
      url.sub!(extension, "@1x#{extension}") if build?
      image_tag(url, options_hash)
    end
  end

  def after_build(builder)
    options.input_folders.each do |folder|
      files = Dir.glob("source/#{folder}/**/*.{jpg,jpeg,png,JPG,JPEG,PNG}")

      files.each do |file|
        extension = File.extname(file)
        output_path = file.sub('source', 'build').sub(extension, "@1x#{extension}")
        image = MiniMagick::Image.open(file)
        image.resize '50%'
        image.write output_path
        builder.trigger :created, output_path
      end
    end
  end
end

::Middleman::Extensions.register(:retina_images, RetinaImages) do
  require 'mini_magick'
  RetinaImages
end
