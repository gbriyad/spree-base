module Spree
  module OrderMailerDecorator
    def store_owner_notification_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      current_store = @order.store
      subject = Spree.t('order_mailer.store_owner_notification_email.subject', store_name: current_store.name)
      mail(to: current_store.order_notification_email.split(','), from: from_address, subject: subject)
    end
  end
end

Spree::OrderMailer.prepend Spree::OrderMailerDecorator if Spree::OrderMailer.included_modules.exclude?(Spree::OrderMailerDecorator)