class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :post_count, default: 0, null: false

      t.timestamps
    end
  end
end
