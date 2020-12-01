class CreateKombuchas < ActiveRecord::Migration[6.0]
  def change
    create_table :kombuchas do |t|
      t.string :brand_name
      t.integer :calories
      t.string :size
      t.timestamps
    end
  end
end
