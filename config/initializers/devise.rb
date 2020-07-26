Devise.secret_key = "2c16d3695d67b627d71a26081085da225c070aac04a55d2e9965aa7ba2b80baffa6feb600dc2bbe5a4a77d281c39bec30eca"

Devise.setup do |config|
  # Required so users don't lose their carts when they need to confirm.
  config.allow_unconfirmed_access_for = 1.days

  # Fixes the bug where Confirmation errors result in a broken page.
  config.router_name = :spree

  # Add any other devise configurations here, as they will override the defaults provided by spree_auth_devise.
end