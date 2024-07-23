class Collection < ApplicationRecord
  validates :user_id, :name, presence: true
end
