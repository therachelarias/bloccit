describe Vote do
  describe "validations" do
    describe  "value validation" do
      it "only allows -1 or 1 as values" do
        valid_vote_neg_1 = Vote.new(value: -1)
        valid_vote = Vote.new(value: 1)
        invalid_vote = Vote.new(value: 0)
        expect(valid_vote_neg_1.valid?).to eq(true)
        expect(valid_vote.valid?).to eq(true)
        expect(invalid_vote.valid?).to eq(false)
      end
    end
  end
end