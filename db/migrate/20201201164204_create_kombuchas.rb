class CreateKombuchas < ActiveRecord::Migration[6.0]
  def change
    create_table :kombuchas do |t|
      t.string :brand_name
      t.integer :calories
      t.string :size
      t.belongs_to :user
      t.belongs_to :flavor
    end
  end
end
