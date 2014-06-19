describe "Matcher::BeNil" do
  it 'be_nil passes when value is nil' do
    expect(nil).to be_nil
  end

  it "be_nil fails when value is true" do
    expect_failure("true expected to be nil"){ expect(true).to be_nil }
  end

  it "be_nil fails when value is false" do
    expect_failure("false expected to be nil"){ expect(false).to be_nil }
  end

  it "be_nil fails when value is an Object" do
    object = Object.new
    expect_failure("#{object} expected to be nil"){ expect(object).to be_nil }
  end

  it "be_nil fails when value is nil but asked not to" do
    expect_failure("nil not expected to be nil"){ expect(nil).not_to be_nil }
  end
end