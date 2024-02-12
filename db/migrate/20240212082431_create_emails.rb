class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
