class CreateBreedSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_suggestions do |t|
      t.references :breed, null: false, foreign_key: true
      t.references :quiz_result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
