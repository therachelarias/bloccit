require 'rails_helper'

describe Vote do
  describe "value validation" do
    it "only allows -1 or 1 as values" do
      if Vote.new(value: 1 || -1)
        expect(@vote.valid?).to eq(true)
      elsif
        expect(@vote.valid?).to eq(false)
      end
    end
  end
end