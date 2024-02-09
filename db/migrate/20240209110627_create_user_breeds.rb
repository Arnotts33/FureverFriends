class CreateUserBreeds < ActiveRecord::Migration[7.1]
  def change
    create_table :user_breeds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
