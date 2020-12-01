class CreateFlavors < ActiveRecord::Migration[6.0]
  def change
    create_table :flavors do |t|
      t.string :ingredients
      t.boolean :alcoholic
      t.belongs_to :user
      t.belongs_to :kombucha
      t.timestamps
    end
  end
end
