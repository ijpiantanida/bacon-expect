describe "Matcher::EndWith" do
  it 'end_with passes when the subject ends with the given string' do
    expect("super").to end_with("per")
  end

  it "end_with fails when the subject doesn't end with the given string" do
    expect_failure("\"super\" expected to end with \"key\""){ expect("super").to end_with("key") }
  end

  it "end_with fails when the subject ends with the given string but asked to not" do
    expect_failure("\"super\" not expected to end with \"per\""){ expect("super").not_to end_with("per") }
  end
end