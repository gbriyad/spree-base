class AddColumnsToSpreeStores < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_stores, :contact_email, :string
    add_column :spree_stores, :order_notification_email, :string
    add_column :spree_stores, :address, :text
  end
end
