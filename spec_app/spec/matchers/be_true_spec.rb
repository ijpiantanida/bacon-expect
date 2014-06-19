describe "Matcher::BeTrue" do
  it 'be_true passes when value is true' do
    expect(true).to be_true
  end

  it "be_true fails when value is false" do
    expect_failure("false expected to be true"){ expect(false).to be_true }
  end

  it "be_true fails when value is an Object" do
    object = Object.new
    expect_failure("#{object} expected to be true"){ expect(object).to be_true }
  end

  it "be_true fails when value is true but asked for not_to" do
    expect_failure("true not expected to be true"){ expect(true).not_to be_true }
  end

  it "be_true passes when value is false but asked for not_to" do
    expect(false).to_not be_true
  end
end