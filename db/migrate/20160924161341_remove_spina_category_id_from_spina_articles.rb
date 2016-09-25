class RemoveSpinaCategoryIdFromSpinaArticles < ActiveRecord::Migration
  def change
    remove_column :spina_articles, :spina_category_id, :integer
  end
end
