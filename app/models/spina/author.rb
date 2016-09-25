module Spina
  class Author < ActiveRecord::Base
    default_scope { order('first_name').order('last_name') }

    has_many :articles

    def name
      "#{first_name} #{last_name}"
    end
  end
end
