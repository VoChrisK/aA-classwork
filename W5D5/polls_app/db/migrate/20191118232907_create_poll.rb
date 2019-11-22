class CreatePoll < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :user_id, null: false
      t.text :title
    end
  end
end
