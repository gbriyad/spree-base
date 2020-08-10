module Spree
  module AssetDecorator

    WATERMARK_PATH = ::Rails.root.join('app', 'assets', 'images', Spree::Config[:logo]).to_s
    WATERMARK_WIDTH, WATERMARK_HEIGHT = FastImage.size(WATERMARK_PATH, :raise_on_failure => true)
    WATERMARK_GRAVITY = 'northeast'
    WATERMARK_MARGIN = '10,10'

    #override for adding watermark to product images
    def url(style)
      return placeholder(style) unless attachment.attached?

      resize_value = dimensions_for_style(style)

      width, _ = resize_value.chop.split('x')
      #resizing watermark width to 10% of the Background image width
      width = (width.to_i/7)
      #resizing watermark height to maintain aspect ratio
      height = ((WATERMARK_HEIGHT * width) / WATERMARK_WIDTH)

      draw_value = "image Over #{WATERMARK_MARGIN} #{width},#{height} '#{WATERMARK_PATH}'"

      attachment.variant(gravity: WATERMARK_GRAVITY,
                         resize: resize_value,
                         draw: draw_value
      )
    end
  end
end
Spree::Asset.prepend Spree::AssetDecorator if Spree::Asset.included_modules.exclude?(Spree::AssetDecorator)