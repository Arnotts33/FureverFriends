class RemoveDetailsFromBreeds < ActiveRecord::Migration[7.1]
  def change
    remove_column :breeds, :details, :text
  end
end
