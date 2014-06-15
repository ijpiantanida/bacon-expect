module BaconExpect; module Matcher
  class Be
    def initialize(value)
      @value = value
    end

    def matches?(subject)
      subject.equal?(@value)
    end

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to be equal? to #{@value}")
    end
  end
end; end