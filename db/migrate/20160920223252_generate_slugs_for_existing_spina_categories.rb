class GenerateSlugsForExistingSpinaCategories < ActiveRecord::Migration
  def up
    Spina::Category.all.each do |category|
      category.update_attribute(:slug, category.title.parameterize)
    end
  end

  def down
  end
end
