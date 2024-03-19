# frozen_string_literal: true

class PolicySerializer < ActiveModel::Serializer
  has_one :insured, serializer: InsuredSerializer
  has_one :vehicle, serializer: VehicleSerializer
  attributes :number
  attributes :emission_date
  attributes :coverage_end_date
end
