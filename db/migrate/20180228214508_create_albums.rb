class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :artwork
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
