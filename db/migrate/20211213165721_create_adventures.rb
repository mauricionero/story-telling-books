class CreateAdventures < ActiveRecord::Migration[6.1]
  def change
    create_table :adventures do |t|
      t.string :title, limit: 32

      t.timestamps
    end
  end
end
