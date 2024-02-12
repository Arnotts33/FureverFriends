class AddWeightToBreeds < ActiveRecord::Migration[7.1]
  def change
    add_column :breeds, :weight, :string
  end
end
