describe "Matcher::Satisfy" do
  it 'satisfy passes when the block returns true' do
    expect(1).to satisfy{|v| v == 1}
  end

  it 'satisfy fails when the block returns false' do
    expect_failure("Block expected to satisfy condition"){ expect(1).to satisfy{|v| v == 3} }
  end

  it 'satisfy fails when the block raises an exception' do
    expect{ expect(1).to satisfy{|v| 1/0 } }.to raise_error(ZeroDivisionError)
  end

  it 'satisfy fails when the block returns true but asked not to' do
    expect_failure("Block not expected to satisfy condition"){ expect(1).not_to satisfy{|v| v == 1} }
  end
end