# frozen_string_literal: true

class Policy < ApplicationRecord
  has_one :vehicle, dependent: :destroy
  has_one :insured, dependent: :destroy
end
