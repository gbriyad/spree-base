# module Spree
#   module TaxonsControllerDecorator
#     def product_carousel
#       if stale?(etag: carousel_etag, last_modified: last_modified, public: true)
#         load_products
#         if @products.any?
#           render template: 'spree/taxons/product_carousel', layout: false
#         else
#           head :no_content
#         end
#       end
#     end
#   end
# end
#
# Spree::TaxonsController.prepend Spree::TaxonsControllerDecorator if Spree::TaxonsController.included_modules.exclude?(Spree::TaxonsControllerDecorator)