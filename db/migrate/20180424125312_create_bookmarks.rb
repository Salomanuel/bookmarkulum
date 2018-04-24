class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.string :shortening
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
