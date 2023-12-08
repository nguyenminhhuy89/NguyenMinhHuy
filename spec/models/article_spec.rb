require 'rails_helper'

describe Article do
  describe 'test' do
    it { expect(create(:article)).to be_valid() }
  end
end