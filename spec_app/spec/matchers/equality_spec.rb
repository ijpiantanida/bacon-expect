describe "Matcher::Equality" do
  it 'eql passes when value is eql? to subject' do
    expect(1).to eql(1)
  end

  it "eql fails when value is not eql? subject" do
    expect_failure("1 #eql?(1.0) expected to return true"){ expect(1).to eql(1.0) }
  end

  it "eq passes if value is == to subject" do
    expect(1).to eq(1.0)
  end

  it "eq fails if value is == to subject" do
    expect_failure("1 expected to be == to 2.0"){ expect(1).to eq(2.0) }
  end

  it "be passes if value is same object as subject" do
    object = Object.new
    expect(object).to be(object)
  end

  it "be fails if value is not the same object as subject" do
    expect_failure("\"super\" expected to be same object as \"super\""){ expect("super").to be("super") }
  end

  it "equal fails if value is not the same object as subject" do
    expect_failure("\"super\" expected to be same object as \"super\""){ expect("super").to equal("super") }
  end

  it "equal fails if value is the same object as subject but asked not to" do
    expect_failure("\"super\" not expected to be same object as \"super\"") do
      string = "super"
      expect(string).not_to equal(string)
    end
  end
end