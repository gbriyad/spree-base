Spree.fetchMobileAccount = function () {
  return $.ajax({
    url: Spree.pathFor('mobile_account_link')
  }).done(function (data) {
    Spree.mobileAccountFetched = true
    return $('#link-to-mobile-account').html(data)
  })
}

Spree.ready(function () {
  if (!Spree.mobileAccountFetched) Spree.fetchMobileAccount()
})
