task :generate_slugs => :environment do
  Catalog.find_each(&:save)
  Product.find_each(&:save)
end