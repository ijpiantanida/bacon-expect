module BaconExpect; module Matcher
  class BeTrue
    def matches?(value)
      value == true
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_be_true(negated, subject))
    end
  end
end; end