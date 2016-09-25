class MigrateAuthorsFromUsersTableToAuthors < ActiveRecord::Migration
  def up
    Spina::Article.all.each do |article|
      if author_id = article.author_id
        user = Spina::User.find(author_id)
        new_author = Spina::Author.find_or_initialize_by(old_id: author_id)
        new_author.update_attributes(first_name: user.first_name, last_name: user.last_name)
        new_id = new_author.reload.id
        article.update_attribute(:author_id, new_id)
      end
    end
  end

  def down
  end
end
