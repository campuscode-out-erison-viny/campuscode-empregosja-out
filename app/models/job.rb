class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category

  validates :title, :description, :location, :category, :company_id, presence: true

  def expired?
    created_at < 90.days.ago
  end

  def recent?
    created_at > 6.days.ago
  end
end
