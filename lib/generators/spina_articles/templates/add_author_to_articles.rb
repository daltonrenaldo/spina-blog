class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_column :spina_articles, :author_id, :integer
    add_column :spina_articles, :created_by, :integer

    add_index :spina_articles, :author_id
  end
end
