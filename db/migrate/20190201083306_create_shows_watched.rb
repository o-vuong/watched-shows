class CreateShowsWatched < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.integer :date
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
