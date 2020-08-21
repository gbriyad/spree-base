module Spree
  module Admin
    module GeneralSettingsControllerDecorator
      def clear_cache
        Rails.cache.clear

        current_store.touch
        Taxon.touch_all

        invoke_callbacks(:clear_cache, :after)
        head :no_content
      end
    end
  end
end
Spree::Admin::GeneralSettingsController.prepend Spree::Admin::GeneralSettingsControllerDecorator if Spree::Admin::GeneralSettingsController.included_modules.exclude?(Spree::Admin::GeneralSettingsControllerDecorator)