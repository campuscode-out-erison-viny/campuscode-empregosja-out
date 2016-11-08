class Company < ApplicationRecord
  has_many :jobs

  validates :name, :location, :mail, :phone, presence: true

  def premium?
    jobs.size > 4
  end
end
