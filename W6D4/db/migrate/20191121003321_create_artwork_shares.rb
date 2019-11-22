class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false, uniq: true
      t.integer :viewer_id, null: false, uniq: true
    end
  end
end
