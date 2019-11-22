class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, uniq: true
      t.string :image_url
      t.integer :artist_id, null: false, uniq: true
    end
  end
end
