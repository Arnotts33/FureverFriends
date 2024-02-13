class DropEmailsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :emails
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
