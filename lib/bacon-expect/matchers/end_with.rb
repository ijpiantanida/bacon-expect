module BaconExpect; module Matcher
  class EndWith
    def initialize(end_string)
      @end_string = end_string
    end

    def matches?(subject)
      subject[-@end_string.size..-1] == @end_string
    end

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to end with #{@start_string}")
    end
  end
end; end