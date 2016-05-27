module Spina
  class Article < ActiveRecord::Base
    mount_uploader :header_photo, PhotoUploader
    validates :title, :subtitle, :content, :publish_date, presence: true
    belongs_to :category

    def to_param
      slug
    end

    def slug
      super || self.title.parameterize
    end
  end
end
