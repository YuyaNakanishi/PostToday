class RemoveOtherFromFashions < ActiveRecord::Migration[6.0]
  def change
    remove_column :fashions, :other
  end
end
