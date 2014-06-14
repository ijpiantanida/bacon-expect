module BaconExpect; module Matcher
  class BeTrue
    def matches?(value)
      value == true
    end

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to be true but wasn't")
    end
  end
end; end