class CreateFashions < ActiveRecord::Migration[6.0]
  def change
    create_table :fashions do |t|
      t.string :name
      t.string :tops
      t.string :pants
      t.string :shoes
      t.text :other
      t.text :description

      t.timestamps
    end
  end
end
