class Policy < ApplicationRecord
  has_one :vehicle
  has_one :insured
end
