class AddHassanToMedia < ActiveRecord::Migration
  def change
    add_column :media, :watched, :boolean
    add_column :media, :hassan_rating, :integer
    add_column :media, :poster_link, :string
    add_column :media, :own, :boolean
  end
end
