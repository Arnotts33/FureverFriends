class AddInfoToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :address, :string
  end
end
