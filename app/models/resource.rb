class Resource < ApplicationRecord
    validates :name, :posted_at, :category, :description, presence: true
    before_validation { self.posted_at ||= Date.current }

end
