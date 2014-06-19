describe "Matcher::Change" do
  class TestClass
    attr_reader :counter
    def initialize
      @counter = 0
    end

    def add
      @counter += 1
    end

    def dont_add; end
  end

  it 'change passes when the expected block changes the result of the argument block' do
    test_object = TestClass.new
    expect{ test_object.add }.to change{ test_object.counter }
  end

  it "change fails when the expected block doesn't change the result of the argument block" do
    test_object = TestClass.new
    expect_failure("Block expected to change value"){ expect{ test_object.dont_add }.to change{ test_object.counter } }
  end

  it "change passes when the expected block doesn't change the result of the argument block but asked not_to" do
    test_object = TestClass.new
    expect{ test_object.dont_add }.not_to change{ test_object.counter }
  end

  it "change when specified 'by' passes when the expected block changes the result of the argument block by the given amount" do
    test_object = TestClass.new
    expect{ test_object.add; test_object.add }.to change{ test_object.counter }.by(2)
  end

  it "change when specified 'by' fails when the expected block changes the result of the argument block by a different amount" do
    test_object = TestClass.new
    expect_failure("Block expected to change value by 6 but changed by 2"){ expect{ test_object.add; test_object.add }.to change{ test_object.counter }.by(6) }
  end

  it "change when specified 'by' fails when the expected block changes the result of the argument block by the given amount but asked not to" do
    test_object = TestClass.new
    expect_failure("Block not expected to change value by 2"){ expect{ test_object.add; test_object.add }.not_to change{ test_object.counter }.by(2) }
  end
end