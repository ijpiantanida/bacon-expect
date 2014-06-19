describe "Matcher::RespondTo" do
  it 'respond_to passes when subject responds to method name' do
    expect("string").to respond_to(:upcase)
  end

  it "respond_to fails when subject doesn't respond to method name" do
    expect_failure("\"string\" expected to respond to #floor"){ expect("string").to respond_to(:floor) }
  end

  it "respond_to when given number of arguments fails when subject doesn't respond to method name" do
    expect_failure("\"string\" expected to respond to #floor with 2 arguments"){ expect("string").to respond_to(:floor).with(2).arguments }
  end

  it "respond_to when given number of arguments passes when subject responds to method name with exactly the same number of arguments" do
    class TestCase; def call_me(a,b,c); end; end
    expect(TestCase.new).to respond_to(:call_me).with(3).arguments
  end

  it "respond_to when given number of arguments fails when subject responds to method name with different number of arguments" do
    class TestCase; def call_me(a,b,c); end; end
    test_object = TestCase.new
    expect_failure("#{test_object.inspect} expected to respond to #call_me with 1 arguments"){ expect(test_object).to respond_to(:call_me).with(1).argument }
  end

  it "respond_to when given number of arguments fails when subject responds to method name with exactly the same number of arguments but asked not to" do
    class TestCase; def call_me(a,b,c); end; end
    test_object = TestCase.new
    expect_failure("#{test_object.inspect} not expected to respond to #call_me with 3 arguments"){ expect(test_object).not_to respond_to(:call_me).with(3).arguments }
  end
end