module BaconExpect; module Matcher
  class BeNil
    def matches?(value)
      value == nil
    end

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to be nil but wasn't")
    end
  end
end; end