describe "Matcher::Eql" do
  it 'eql passes when value is == to subject' do
    obj = Object.new
    expect(obj).to eql(obj)
  end

  it "eql fails when value is not == subject" do
    expect_failure{ expect(Object.new).to eql(Object.new) }
  end

  it "eql fails when value is nil and subject an Object" do
    expect_failure{ expect(Object.new).to eql(nil) }
  end

  it "be is an alias of eql" do
    obj = Object.new
    expect(obj).to be(obj)
  end
end