class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :profile_picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
