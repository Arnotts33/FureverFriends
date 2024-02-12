class CreateBreedSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_sellers do |t|
      t.references :breed, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
