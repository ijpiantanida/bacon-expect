describe "Matcher::MatchArray" do
  it 'match_array passes when subject has the same items as value' do
    expect([1,2,3,4]).to match_array([4,2,1,3])
  end

  it "match_array fails when subject has less items than value" do
    expect_failure{ expect([1,2,3]).to match_array([1,2,3,4]) }
  end

  it "match_array fails when subject has more items than value" do
    expect_failure{ expect([1,2,3,4]).to match_array([1,2,4,4,3]) }
  end

  it "match_array fails when subject has different items" do
    expect_failure{ expect([1,2,3,4]).to match_array([Object.new, "a", 2, 3]) }
  end
end