module Spree
  module StoreControllerDecorator
    def mobile_account_link
      render partial: 'spree/shared/link_to_mobile_account'
      fresh_when(try_spree_current_user)
    end
  end
end

Spree::StoreController.prepend Spree::StoreControllerDecorator if Spree::StoreController.included_modules.exclude?(Spree::StoreControllerDecorator)
