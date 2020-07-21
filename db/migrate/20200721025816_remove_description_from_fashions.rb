class RemoveDescriptionFromFashions < ActiveRecord::Migration[6.0]
  def change
    remove_column :fashions, :description
  end
end
