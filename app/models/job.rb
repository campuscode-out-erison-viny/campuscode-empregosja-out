class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category

  validates :title, :description, :location, presence: true
end
