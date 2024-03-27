class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, inclusion: { in: %w(To\ Do In\ Progress Done) }
end
