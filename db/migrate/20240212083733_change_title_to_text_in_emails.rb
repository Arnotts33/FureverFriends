class ChangeTitleToTextInEmails < ActiveRecord::Migration[7.1]
  def change
    change_column :emails, :title, :text
  end
end
