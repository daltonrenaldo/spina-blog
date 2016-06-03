module Spina
  class Author < ActiveRecord::Base
    default_scope { order('name') }

    has_many :articles
    self.table_name = 'spina_users'

    def name
      "#{first_name} #{last_name}"
    end
  end
end
