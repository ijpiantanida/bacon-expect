describe "Matcher::BeNil" do
  it 'be_nil passes when value is nil' do
    expect(nil).to be_nil
  end

  it "be_nil fails when value is true" do
    expect_failure{ expect(true).to be_nil }
  end

  it "be_nil fails when value is false" do
    expect_failure{ expect(false).to be_nil }
  end

  it "be_nil fails when value is an Object" do
    expect_failure{ expect(Object.new).to be_nil }
  end
end