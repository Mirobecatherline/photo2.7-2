class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :username
      t.text :image_url
      t.text :password_digest
      t.boolean :approved, default: "false"
      t.text :role,inclusion: ["admin","superadmin","user"], null:false,default: "user"
      t.timestamps
    end
  end
end
