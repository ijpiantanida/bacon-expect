module BaconExpect; module Matcher
  class Match
    def initialize(regex)
      @regex = regex
    end

    def matches?(subject)
      subject.match(@regex)
    end

    def fail!(subject)
      raise FailedExpectation.new("\"#{subject}\" expected to match #{@regex}")
    end
  end
end; end