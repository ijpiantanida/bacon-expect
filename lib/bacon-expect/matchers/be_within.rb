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

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to be within #{@range} of #{@center_value}")
    end
  end
end; end