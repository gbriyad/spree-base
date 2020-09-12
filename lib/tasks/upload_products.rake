desc 'Upload Products!'
task :upload_products => :environment do
  require 'csv'
  table = CSV.parse(File.read("upload-products/product-list.csv"), headers: true)

  PRODUCT_IMAGE_LOCATION='upload-products/images/'
  shipping_category = Spree::ShippingCategory.first

  categories = Spree::Taxonomy.find_by!(name: I18n.t('spree.taxonomy_categories_name'))
  categories_taxon = Spree::Taxon.where(name: 'Shop By Category').first_or_create!

  table.each do |row|

    #extract data
    product_name = row['Product Name']
    if product_name != nil

      cost, master_price = row['Master Price'].split(',')
      cost = cost.to_f
      master_price = master_price.to_f

      initial_stock = row['Initial stock'].to_i
      image_file_name = row['Image file name']

      if image_file_name!=nil && image_file_name.include?('DSC')
        image_file_name='_'+image_file_name+'.jpg'
      end
      puts image_file_name

      taxons = []
      row['Category'].split(',').each do |taxon_name|
        taxon = categories_taxon.children.where(name: taxon_name).first_or_create!
        #taxon.permalink = taxon.permalink.gsub('categories/', '')
        taxon.taxonomy = categories
        taxon.save!
        taxons << taxon
      end

      #create product
      puts "Creating product: #{product_name}"
      product = Spree::Product.new(name: product_name,
                                   shipping_category: shipping_category,
                                   price: master_price,
                                   cost_price: cost,
                                   available_on: Time.now)
      product.taxons = taxons
      product.save!

      Spree::StockMovement.new(quantity: initial_stock, stock_item: product.stock_items.first).save!

      if image_file_name!=nil && File.exist?(PRODUCT_IMAGE_LOCATION + image_file_name)
        i = Spree::Product.last.master.images.new
        i.attachment.attach(io: File.open(PRODUCT_IMAGE_LOCATION + image_file_name), filename: image_file_name)
        i.save!
        puts 'Image found and saved!'
      else
        puts 'Image not found!'
      end

      puts "Product Created: #{product_name}"
    end
  end

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
