describe "Matcher::BeFalse" do
  it 'be_false passes when value is false' do
    expect(false).to be_false
  end

  it "be_false fails when value is true" do
    expect_failure{ expect(true).to be_false }
  end

  it "be_false fails when value is an Object" do
    expect_failure{ expect(Object.new).to be_false }
  end

  it "be_false fails when value is false but asked for not_to" do
    expect_failure{ expect(false).not_to be_false }
  end

  it "be_false passes when value is true but asked for not_to" do
    expect(true).not_to be_false
  end
end