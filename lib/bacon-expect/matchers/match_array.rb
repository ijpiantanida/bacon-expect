module BaconExpect; module Matcher
  class MatchArray
    def initialize(expected_array)
      @expected_array = expected_array
    end

    def matches?(subject_array)
      return false unless subject_array.size == @expected_array.size
      array_copy = subject_array.dup
      @expected_array.all? do |item|
        has = array_copy.include?(item)
        array_copy.delete(item) if has
        has
      end
    end

    def fail!(subject_array, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_match_array(negated, subject_array, @expected_array))
    end
  end
end; end