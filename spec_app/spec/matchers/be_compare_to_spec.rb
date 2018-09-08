describe "Matcher::BeCompareTo" do
  it 'be > passes when greater' do
    expect(1).to be > 0
  end

  it 'be > fails when lesser' do
    expect_failure('1 expected to be < to 0') { expect(1).to be < 0 }
  end
end
