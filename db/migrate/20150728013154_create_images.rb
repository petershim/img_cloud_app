class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :url
      t.integer :user_id
      t.integer :upvotes, default: 0

      t.timestamps null: false
    end
  end
end
