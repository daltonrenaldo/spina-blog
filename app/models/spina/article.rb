module Spina
  class Article < ActiveRecord::Base
    before_save :create_slug
    mount_uploader :header_photo, PhotoUploader
    validates :title, :subtitle, :content, :publish_date, presence: true
    has_and_belongs_to_many :categories, join_table: :spina_articles_categories
    belongs_to :author

    scope :published, -> { where(draft: false) }

    private

    def create_slug
      self.slug = self.title.parameterize unless self.slug.present?
    end
  end
end
