module Spree
  module OrderDecorator
    def deliver_order_confirmation_email
      OrderMailer.confirm_email(id).deliver_later
      update_column(:confirmation_delivered, true)
      OrderMailer.store_owner_notification_email(id).deliver_later
    end
  end
end

Spree::Order.prepend Spree::OrderDecorator if Spree::Order.included_modules.exclude?(Spree::OrderDecorator)