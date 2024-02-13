class AddLifespanToBreeds < ActiveRecord::Migration[7.1]
  def change
    add_column :breeds, :lifespan, :string
  end
end
