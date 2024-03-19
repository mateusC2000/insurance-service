# frozen_string_literal: true

class VehicleSerializer < ActiveModel::Serializer
  attributes :brand
  attributes :model
  attributes :year
  attributes :plate
end
