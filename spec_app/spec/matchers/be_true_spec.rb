describe "Matcher::BeTrue" do
  it 'be_true passes when value is true' do
    expect(true).to be_true
  end

  it "be_true fails when value is false" do
    expect_failure{ expect(false).to be_true }
  end

  it "be_true fails when value is an Object" do
    expect_failure{ expect(Object.new).to be_true }
  end

  it "be_true fails when value is true but asked for not_to" do
    expect_failure{ expect(true).not_to be_true }
  end

  it "be_true passes when value is false but asked for not_to" do
    expect(false).to_not be_true
  end
end