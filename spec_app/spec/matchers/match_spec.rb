describe "Matcher::Match" do
  it 'match passes when subject is a string and matches the regex' do
    expect("asd asd asd").to match(/asd/)
  end

  it "match fails when subject is a string and doesn't match the regex" do
    expect_failure{ expect("qwerty qwerty").to match(/asd/) }
  end

  it "match passes when subject is a regex and matches the given string" do
    expect(/foo/).to match("food")
  end

  it "match fails when subject is a regex and doesn't matche the given string" do
    expect_failure{ expect(/foo/).to match("drink") }
  end
end