class CreateShowsWatched < ActiveRecord::Migration
  def change
    create_table :shows_watched do |t|
      t.text :title
      t.text :date
      t.timestamps null: false
    end
  end
end
