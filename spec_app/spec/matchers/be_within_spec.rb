describe "Matcher::BeWithin" do
  it "passes when subject is within range" do
    expect(27.5).to be_within(0.5).of(27.9)
    expect(27.5).to be_within(0.5).of(28.0)
    expect(27.5).to be_within(0.5).of(27.1)
    expect(27.5).to be_within(0.5).of(27.0)
    expect(27.5).not_to be_within(0.5).of(28.1)
    expect(27.5).not_to be_within(0.5).of(26.9)
  end

  it "fails when subject is not within range" do
    expect_failure{ expect(27.5).not_to be_within(0.5).of(28) }
    expect_failure{ expect(27.5).not_to be_within(0.5).of(27) }
    expect_failure{ expect(27.5).to be_within(0.5).of(28.1) }
    expect_failure{ expect(27.5).to be_within(0.5).of(26.9) }
  end

  it "raises an exception when the matcher is not complete" do
    expect{ expect(1).to be_within(10) }.to raise_error(BaconExpect::InvalidMatcher)
  end
end