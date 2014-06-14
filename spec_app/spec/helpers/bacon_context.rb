class Bacon::Context
  def expect_failure(&block)
    expect(&block).to raise_error(BaconExpect::FailedExpectation)
  end
end