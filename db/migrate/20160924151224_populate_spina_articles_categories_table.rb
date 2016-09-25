class PopulateSpinaArticlesCategoriesTable < ActiveRecord::Migration
  def up
    sql = "INSERT INTO spina_articles_categories (article_id, category_id) SELECT id, spina_category_id FROM spina_articles"
    ActiveRecord::Base.connection.execute(sql)
  end

  def down
    sql = "UPDATE spina_articles AS sa SET spina_category_id = sac.category_id FROM spina_articles_categories AS sac WHERE sa.id = sac.article_id"
    ActiveRecord::Base.connection.execute(sql)
  end
end
