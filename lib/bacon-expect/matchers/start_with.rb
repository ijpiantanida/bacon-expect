module BaconExpect; module Matcher
  class StartWith
    def initialize(start_string)
      @start_string = start_string
    end

    def matches?(subject)
      subject[0...@start_string.size] == @start_string
    end

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to start with #{@start_string}")
    end
  end
end; end