class Company < ApplicationRecord
  has_many :jobs

  validates :name, :location, :mail, :phone, presence: true
end
