module BaconExpect; module Matcher
  class StartWith
    def initialize(start_string)
      @start_string = start_string
    end

    def matches?(subject)
      subject[0...@start_string.size] == @start_string
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_start_with(negated, subject, @start_string))
    end
  end
end; end