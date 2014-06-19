describe "Matcher::Match" do
  it 'match passes when subject is a string and matches the regex' do
    expect("asd asd asd").to match(/asd/)
  end

  it "match fails when subject is a string and doesn't match the regex" do
    expect_failure("\"qwerty qwerty\" expected to match /asd/"){ expect("qwerty qwerty").to match(/asd/) }
  end

  it "match passes when subject is a regex and matches the given string" do
    expect(/foo/).to match("food")
  end

  it "match fails when subject is a regex and doesn't matche the given string" do
    expect_failure("/foo/ expected to match \"drink\""){ expect(/foo/).to match("drink") }
  end

  it 'match fails when subject is a string and matches the regex but asked not to' do
    expect_failure("\"asd asd asd\" not expected to match /asd/"){ expect("asd asd asd").to_not match(/asd/) }
  end
end