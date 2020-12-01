class CreateFlavors < ActiveRecord::Migration[6.0]
  def change
    create_table :flavors do |t|
      t.string :name
      t.string :ingredients
      t.boolean :alcoholic
      t.timestamps
    end
  end
end
