desc 'Remove Redundant seed data!'
task :remove_redundant_seed_data => :environment do
  Spree::Zone.destroy_all

  Spree::Country.where.not(name: 'Bangladesh').destroy_all
end
