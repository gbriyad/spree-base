Deface::Override.new(:virtual_path => "spree/admin/stores/_form",
                     :name => "store_phone_field_admin_store_form",
                     :insert_before => "erb[loud]:contains('f.field_container :url')",
                     :partial => "spree/admin/stores/store_phone_field")