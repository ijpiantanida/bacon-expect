describe "Matcher::BeFalse" do
  it 'be_false passes when value is false' do
    expect(false).to be_false
  end

  it "be_false fails when value is true" do
    expect_failure("true expected to be false"){ expect(true).to be_false }
  end

  it "be_false fails when value is an Object" do
    object = Object.new
    expect_failure("#{object} expected to be false"){ expect(object).to be_false }
  end

  it "be_false fails when value is false but asked for not_to" do
    expect_failure("false not expected to be false"){ expect(false).not_to be_false }
  end

  it "be_false passes when value is true but asked for not_to" do
    expect(true).not_to be_false
  end
end