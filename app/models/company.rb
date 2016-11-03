class Company < ApplicationRecord
  has_many :jobs

  validates :name, presence: true
  validates :location, presence: true
  validates :mail, presence: true
  validates :phone, presence: true
end
