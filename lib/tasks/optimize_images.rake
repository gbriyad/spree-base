desc 'Optimize Images!'
task :optimize_images => :environment do

  include Spree::BaseHelper
  puts 'Image pre-process Started.'
  total = Spree::Product.all.count
  Spree::Product.all.each_with_index do |p, i|
    puts "optimizing and processing image for #{p.name}"
    image = default_image_for_product_or_variant(p)
    image&.plp_url
    sizes = %w[lg md sm xs mini]
    sizes.each do |s|
      image&.url("plp_and_carousel_#{s}")
    end
    puts "done! #{i+1}/#{total}"
  end
  puts 'Image pre-process Completed'

end
