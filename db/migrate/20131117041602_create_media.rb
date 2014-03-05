class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.integer :runtime
      t.string :genre
      t.string :platform
      t.string :director
      t.text :cast
      t.date :release_date
      t.integer :critic_rating
      t.integer :audience_rating
      t.boolean :foreign
      t.text :summary
      t.string :trailer_link
      t.string :movie_link
      t.string :rotten_id

      t.timestamps
    end
  end
end
