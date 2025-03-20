class AddEditedToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :edited, :boolean, default: false
  end
end
