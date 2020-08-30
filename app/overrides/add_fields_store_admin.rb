Deface::Override.new(:virtual_path => "spree/admin/stores/_form",
                     :name => "store_basic_information_fields_admin_store_form",
                     :insert_before => "erb[loud]:contains('f.field_container :url')",
                     :partial => "spree/admin/stores/store_basic_information_fields")

Deface::Override.new(:virtual_path => "spree/admin/stores/_form",
                     :name => "store_email_fields_admin_store_form",
                     :insert_before => "erb[loud]:contains('f.field_container :mail_from_address')",
                     :partial => "spree/admin/stores/store_email_fields")