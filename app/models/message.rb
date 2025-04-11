class Message < ApplicationRecord
    has_many :comments, -> { where(parent_id: nil) }, dependent: :destroy

end
