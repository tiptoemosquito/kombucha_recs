class CreateKombuchas < ActiveRecord::Migration[6.0]
  def change
    create_table :kombuchas do |t|
      t.string :brand
      t.boolean :alcohol
      t.string :size
      t.belongs_to :user
      t.belongs_to :flavor
    end
  end
end
