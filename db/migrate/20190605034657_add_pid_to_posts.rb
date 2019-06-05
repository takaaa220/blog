class AddPidToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pid, :string, null: :false
    add_index :posts, :pid, unique: true
  end
end
