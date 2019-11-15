class SingularShortUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :shortened_urls, :short_urls, :short_url
  end
end
