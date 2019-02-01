class CreateShowsWatched < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.integer :date
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
