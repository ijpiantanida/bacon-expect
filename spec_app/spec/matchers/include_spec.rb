describe "Matcher::Include" do
  it 'include passes when subject include? responds true' do
    expect([1,2,3,4]).to include(4)
  end

  it 'include fails when subject include? responds false' do
    expect_failure("[1, 2, 3, 4] expected to include \"asd\""){ expect([1,2,3,4]).to include("asd") }
  end

  it 'include passes when an object responds true to include?' do
    class TestClass; def include?(value); true; end; end
    expect(TestClass.new).to include(3)
  end

  it 'include passes when an object responds false to include?' do
    class TestClass; def include?(value); false; end; end
    test_object = TestClass.new
    expect_failure("#{test_object.inspect} expected to include 3"){ expect(test_object).to include(3) }
  end

  it "include passes when all values are included in subject" do
    expect([1,2,3,4]).to include(2,3,4)
  end

  it "include fails when some values are not included in subject" do
    expect_failure("#{[1,2,3,4]} expected to include #{[2, 3, 4, 6]}"){ expect([1,2,3,4]).to include(2, 3, 4, 6) }
  end

  it "include fails when all values are included but asked not to" do
    expect_failure("#{[1,2,3,4,5,6]} not expected to include #{[3, 4, 6]}"){ expect([1,2,3,4,5,6]).not_to include(3, 4, 6) }
  end
end