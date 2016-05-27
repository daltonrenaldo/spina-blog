class AddSlugToArticles < ActiveRecord::Migration
  def change
    add_column :spina_articles, :slug, :string
    add_index :spina_articles, :slug, unique: true
  end
end
