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
    expect_failure{ expect{ test_object.dont_add }.to change{ test_object.counter } }
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
    expect_failure{ expect{ test_object.add; test_object.add }.to change{ test_object.counter }.by(6) }
  end
end