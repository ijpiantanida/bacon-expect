describe "Matcher::StartWith" do
  it 'start_with passes when the subject starts with the given string' do
    expect("super").to start_with("sup")
  end

  it "start_with fails when the subject doesn't start with the given string" do
    expect_failure{ expect("super").to start_with("key") }
  end
end