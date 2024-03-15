# frozen_string_literal: true

class Insured < ApplicationRecord
  belongs_to :policy

  validates :name, :cpf, presence: true
end
