class CreateSpinaArticlesCategories < ActiveRecord::Migration
  def change
    create_table :spina_articles_categories, id: false do |t|
      t.integer :article_id
      t.integer :category_id
    end

    add_index :spina_articles_categories, :article_id
    add_index :spina_articles_categories, :category_id
  end
end
