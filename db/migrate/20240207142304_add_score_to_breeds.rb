class AddScoreToBreeds < ActiveRecord::Migration[7.1]
  def change
    add_column :breeds, :score, :integer
  end
end
