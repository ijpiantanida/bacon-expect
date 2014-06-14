describe "Matcher::HaveItems" do
  it 'have passes when subject has the same number of items' do
    expect([1,2,3]).to have(3).items
  end

  it 'have fails when subject has the a different number of items' do
    expect_failure{ expect([1,2,3]).to have(10).items }
  end
end