describe "Matcher::StartWith" do
  it 'start_with passes when the subject starts with the given string' do
    expect("super").to start_with("sup")
  end

  it "start_with fails when the subject doesn't start with the given string" do
    expect_failure("\"super\" expected to start with \"key\""){ expect("super").to start_with("key") }
  end

  it 'start_with fails when the subject starts with the given string but asked not to' do
    expect_failure("\"super\" not expected to start with \"sup\""){ expect("super").to_not start_with("sup") }
  end
end