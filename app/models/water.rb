class Water < ApplicationRecord
  validates :hot, :cold, { numericality: { greater_than: 0 }, presence: true }
end
