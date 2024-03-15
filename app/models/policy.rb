# frozen_string_literal: true

class Policy < ApplicationRecord
  before_create :policy_number, :dates

  has_one :vehicle, dependent: :destroy
  has_one :insured, dependent: :destroy

  validates :number, :emission_date, :coverage_end_date, presence: true
  validates :number, uniqueness: true

  def policy_number
    self.number = "300311#{rand.to_s[2..8]}"
  end

  def dates
    self.emission_date = Time.zone.today
    self.coverage_end_date = 2.year.from_now
  end
end
