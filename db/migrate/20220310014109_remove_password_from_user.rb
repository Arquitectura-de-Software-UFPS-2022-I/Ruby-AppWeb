class RemovePasswordFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :user, :password, :string
  end
end
