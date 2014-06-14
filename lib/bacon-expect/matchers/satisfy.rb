module BaconExpect; module Matcher
  class Satisfy
    def initialize(&condition_block)
      @condition_block = condition_block
    end

    def matches?(*values)
      @condition_block.call(*values)
    end

    def fail!(subject)
      raise FailedExpectation.new("\"#{subject}\" expected to satisfy condition")
    end
  end
end; end