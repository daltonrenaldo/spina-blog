module Spina
  class Article < ActiveRecord::Base
    before_save :create_slug
    mount_uploader :header_photo, PhotoUploader
    validates :title, :subtitle, :content, :publish_date, presence: true
    belongs_to :category
    belongs_to :author

    private

    def create_slug
      self.slug = self.title.parameterize unless self.slug.present?
    end
  end
end
