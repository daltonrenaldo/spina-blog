class CreateSpinaAuthors < ActiveRecord::Migration
  def change
    create_table :spina_authors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :old_id
    end
  end
end
