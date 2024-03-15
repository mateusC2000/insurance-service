# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Policy, type: :model do
  it { should have_one(:insured) }
  it { should have_one(:vehicle) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:emission_date) }
  it { should validate_presence_of(:coverage_end_date) }
end
