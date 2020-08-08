module Spree
  module StoreDecorator
    def self.prepended(base)
      base.attribute :phone
    end
  end
end

Spree::Store.prepend Spree::StoreDecorator if Spree::Store.included_modules.exclude?(Spree::StoreDecorator)