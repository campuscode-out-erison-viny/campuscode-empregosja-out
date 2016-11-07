class Job < ApplicationRecord
  belongs_to :company

  validates :title, :description, :location, presence: true
end
