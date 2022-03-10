class ChangeFileToBeLongBlobInFile < ActiveRecord::Migration[5.2]
  def up
    change_column :file, :file, :binary, :limit => 16.megabyte
  end
  def down
  end
end
