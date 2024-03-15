# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :policy

  validates :brand, :model, :year, :plate, presence: true
end
