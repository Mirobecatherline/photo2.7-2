class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.text :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
