describe "Matcher::RespondTo" do
  it 'respond_to passes when subject responds to method name' do
    expect("string").to respond_to(:upcase)
  end

  it "respond_to fails when subject doesn't respond to method name" do
    expect_failure{ expect("string").to respond_to(:floor) }
  end

  it "respond_to when given number of arguments fails when subject doesn't respond to method name" do
    expect_failure{ expect("string").to respond_to(:floor).with(2).arguments }
  end

  it "respond_to when given number of arguments passes when subject responds to method name with exactly the same number of arguments" do
    class TestCase; def call_me(a,b,c); end; end
    expect(TestCase.new).to respond_to(:call_me).with(3).arguments
  end

  it "respond_to when given number of arguments fails when subject responds to method name with different number of arguments" do
    class TestCase; def call_me(a,b,c); end; end
    expect_failure{ expect(TestCase.new).to respond_to(:call_me).with(1).argument }
  end
end