# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { should belong_to(:policy) }

  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:plate) }
end
