class AddUserIdToFashions < ActiveRecord::Migration[6.0]
  def change
    add_reference :fashions, :user
  end
end
