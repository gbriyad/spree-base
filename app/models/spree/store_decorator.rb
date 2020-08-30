module Spree
  module StoreDecorator
    def self.prepended(base)
      base.attribute :phone
      base.attribute :contact_email
      base.attribute :order_notification_email
      base.attribute :address
    end
  end
end

Spree::Store.prepend Spree::StoreDecorator if Spree::Store.included_modules.exclude?(Spree::StoreDecorator)