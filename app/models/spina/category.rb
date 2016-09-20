module Spina
  class Category < ActiveRecord::Base
    validates :title, :description, presence: true
    has_many :articles
    before_save :create_slug
    
    private

    def create_slug
      self.slug = self.title.parameterize unless self.slug.present?
    end
  end
end
