describe "Matcher::BeGeneric" do
  it 'be_empty passes when value is empty' do
    expect([]).to be_empty
  end

  it "be_empty fails when value is not empty" do
    expect_failure("[2, 3] #empty? expected to return true"){ expect([2, 3]).to be_empty }
  end

  it "be_kind_of passes when value is of the given type" do
    expect("i'm a string").to be_kind_of(String)
  end

  it "be_kind_of fails when value is not of the given type" do
    expect_failure("\"i'm a string\" #kind_of?(TrueClass) expected to return true"){ expect("i'm a string").to be_kind_of(TrueClass) }
  end

  it "be_amazing passes when the value responds to amazing? and returns true" do
    class TestClass; def amazing?; true; end; end
    expect(TestClass.new).to be_amazing
  end

  it "be_amazing fails when the value responds to amazing? and returns false" do
    class TestClass; def amazing?; false; end; end
    object = TestClass.new
    expect_failure("#{object.inspect} #amazing? expected to return true"){ expect(object).to be_amazing }
  end
end