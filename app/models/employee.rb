class Employee < ApplicationRecord
  validates :firstName, presence: true
  validates :lastName, presence: true
end
