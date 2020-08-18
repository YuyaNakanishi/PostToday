class AddFashionIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :fashion
  end
end

