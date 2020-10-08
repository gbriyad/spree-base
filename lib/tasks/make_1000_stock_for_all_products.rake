desc 'Make 1000 Stock for all products'
task :make_1000_stock_for_all_products => :environment do

  puts 'Starting process:'
  total = Spree::Product.all.count
  Spree::Product.all.each_with_index do |p, i|
    puts "Adding stock for product: #{p.name}"
    to_be_added = 1000 - p.total_on_hand
    if to_be_added.positive?
      Spree::StockMovement.new(quantity: to_be_added, stock_item: p.stock_items.first).save!
      puts "done! #{i+1}/#{total}"
    else
      puts "Already over 1000! #{i+1}/#{total}"
    end

  end
  puts 'Stocking completed'

end
