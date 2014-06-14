module BaconExpect; module Matcher
  class MatchArray
    def initialize(array)
      @array = array
    end

    def matches?(subject_array)
      return false unless subject_array.size == @array.size
      array_copy = subject_array.dup
      @array.all? do |item|
        has = array_copy.include?(item)
        array_copy.delete(item) if has
        has
      end
    end

    def fail!(subject_array)
      raise FailedExpectation.new("\"#{subject_array}\" expected to have same items as #{@array}")
    end
  end
end; end