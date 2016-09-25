module Spina
  class Category < ActiveRecord::Base
    validates :title, :description, presence: true
    has_and_belongs_to_many :articles, join_table: :spina_articles_categories
    before_save :create_slug

    private

    def create_slug
      self.slug = self.title.parameterize unless self.slug.present?
    end
  end
end
