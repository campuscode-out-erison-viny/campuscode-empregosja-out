class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category

  validates :title, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :company_id, presence: true
end
