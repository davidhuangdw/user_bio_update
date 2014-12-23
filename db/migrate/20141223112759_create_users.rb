class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :auth_token
      t.text :bio
      t.integer :bio_update_count, default:0, null:false

      t.timestamps
    end
  end
end
