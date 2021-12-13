class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :image_url, limit: 128
      t.string :email, limit: 64, null: false
      t.string :last_id_token, limit: 1250

      t.timestamps
    end
  end
end
