module ApplicationHelper
  def generate_public_url(blob)
    ActiveStorage::Blob.service.path_for(blob.key).split('/public').second
  end
end
