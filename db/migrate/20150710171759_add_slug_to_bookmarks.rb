class AddSlugToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :slug, :string, index: true
  end
end
