class AddSlugSpinaCategories < ActiveRecord::Migration
  def change
    add_column :spina_categories, :slug, :string
    add_index :spina_categories, :slug, unique: true
  end
end
