class CreateFeaturedImages < ActiveRecord::Migration[7.0]
  def change
    create_table :featured_images do |t|
      t.text :image_url
      t.text :categorry 
      t.timestamps
    end
  end
end
