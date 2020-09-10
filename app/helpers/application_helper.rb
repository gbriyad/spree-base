module ApplicationHelper
  def generate_public_url(blob)
    ActiveStorage::Blob.service.path_for(blob.key).split('/public').second
  end

  def product_discount_percentage(product)
    if product.on_sale?
      "-#{((product.original_price-product.price)/product.original_price*100).to_i}%"
    else
      "0%"
    end
  end
end
