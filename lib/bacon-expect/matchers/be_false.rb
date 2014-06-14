module BaconExpect; module Matcher
  class BeFalse
    def matches?(value)
      !value
    end

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to be false but wasn't")
    end
  end
end; end