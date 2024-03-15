# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Policy, type: :model do
  it { should have_one(:insured) }
  it { should have_one(:vehicle) }
end
