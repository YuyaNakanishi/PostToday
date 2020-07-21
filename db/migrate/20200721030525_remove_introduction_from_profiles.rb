class RemoveIntroductionFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :introduction
  end
end
