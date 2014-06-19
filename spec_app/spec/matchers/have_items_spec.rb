describe "Matcher::HaveItems" do
  it 'have passes when subject has the same number of items' do
    expect([1,2,3]).to have(3).items
  end

  it 'have fails when subject has the a different number of items' do
    expect_failure("[1, 2, 3] expected to have 10 items but had 3"){ expect([1,2,3]).to have(10).items }
  end

  it 'have fails when subject has the same number of items but asked not to' do
    expect_failure("[1, 2, 3] not expected to have 3 items"){ expect([1,2,3]).not_to have(3).items }
  end

  it 'have failure message changes when sending #keys instead of #items' do
    expect_failure("[1, 2, 3] not expected to have 3 keys"){ expect([1,2,3]).not_to have(3).keys }
  end
end