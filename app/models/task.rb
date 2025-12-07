class Task < ApplicationRecord
  validates :description, presence: true, length: { maximum: 100 }
end
