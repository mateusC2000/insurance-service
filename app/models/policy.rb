# frozen_string_literal: true

class Policy < ApplicationRecord
  before_create :policy_number, :dates

  has_one :vehicle, dependent: :destroy
  has_one :insured, dependent: :destroy

  validates :number, :emission_date, :coverage_end_date, presence: true

  def policy_number
    self.number ||= "300311#{rand.to_s[2..8]}"
    policy_number if Policy.exists?(number: number)
  end

  def dates
    self.emission_date ||= Time.zone.today
    self.coverage_end_date ||= 2.years.from_now
  end
end
