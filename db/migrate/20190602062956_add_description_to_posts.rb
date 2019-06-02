class AddDescriptionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :description, :string, null: false
  end
end
