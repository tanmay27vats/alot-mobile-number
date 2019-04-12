class MobileNumber < ApplicationRecord
  validates :mobile_number, presence: true, length: { is: 10 }

  enum status: { not_allotted: 0, allotted: 1, ported: 2 }
end
