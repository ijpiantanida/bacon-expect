describe "Matcher::EndWith" do
  it 'end_with passes when the subject ends with the given string' do
    expect("super").to end_with("per")
  end

  it "end_with fails when the subject doesn't end with the given string" do
    expect_failure{ expect("super").to end_with("key") }
  end
end