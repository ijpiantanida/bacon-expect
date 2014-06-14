describe "Matcher::HaveGeneric" do
  it "have_key passes if the hash includes the given key" do
    expect({a: 1, b: 2, c: 3}).to have_key(:c)
  end

  it "have_key fails if the hash doesn't include the given key" do
    expect_failure{ expect({a: 1, b: 2, c: 3}).to have_key(:h) }
  end

  it "have_color passes when the value responds to has_color? and returns true" do
    class TestClass; def has_color?(color); color == :red; end; end
    expect(TestClass.new).to have_color(:red)
  end

  it "have_color fails when the value responds to has_color? and returns false" do
    class TestClass; def has_color?(color); color == :red; end; end
    expect_failure{ expect(TestClass.new).to have_color(:blue) }
  end
end