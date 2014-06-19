module BaconExpect; module Matcher
  class BeWithin
    def initialize(range)
      @range = range
    end

    def of(center_value)
      @center_value = center_value
      self
    end

    def matches?(subject)
      raise InvalidMatcher.new("be_within matcher incomplete. Missing .of value") unless @center_value
      (subject - @center_value).abs <= @range
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_be_within(negated, subject, @range, @center_value))
    end
  end
end; end