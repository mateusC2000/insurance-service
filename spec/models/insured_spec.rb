# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Insured, type: :model do
  it { should belong_to(:policy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
end
