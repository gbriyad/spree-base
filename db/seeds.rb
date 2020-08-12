# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# create Relation Type for related product
Spree::RelationType.create(name: 'Related Product', applies_to: 'Spree::Product')

#taxonomy creation
taxonomies = [
    { name: I18n.t('spree.taxonomy_categories_name') }
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.where(taxonomy_attrs).first_or_create!
end

#taxon creation
categories = Spree::Taxonomy.find_by!(name: I18n.t('spree.taxonomy_categories_name'))
categories_taxon = Spree::Taxon.where(name: I18n.t('spree.taxonomy_categories_name')).first_or_create!

['Bestsellers', 'Trending', 'Offers', 'Sale'].each do |taxon_name|
  taxon = categories_taxon.children.where(name: taxon_name).first_or_create!
  taxon.permalink = taxon.permalink.gsub('categories/', '')
  taxon.taxonomy = categories
  taxon.save!
end
