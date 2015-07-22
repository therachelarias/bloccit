describe Vote do
  describe "validations" do
    describe  "value validation" do
      it "only allows -1 or 1 as values" do
        if 
          Vote.new(value: 1 || -1)
        then
        expect(@vote.valid?).to eq(true)
      end
        expect(@vote.valid?).to eq(false)
      end
    end
  end
end