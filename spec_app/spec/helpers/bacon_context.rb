class Bacon::Context
  def expect_failure(fail_message = "", &block)
    expect(&block).to raise_error(BaconExpect::FailedExpectation, fail_message)
  end
end