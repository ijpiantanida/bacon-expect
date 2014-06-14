module BaconExpect; module Matcher
  class HaveItems
    def initialize(number_of_items)
      @number_of_items = number_of_items
    end

    def matches?(value)
      value.size == @number_of_items
    end

    def items
      self
    end

    alias_method :keys, :items
    alias_method :values, :items

    def fail!(subject)
      raise FailedExpectation.new("#{subject} expected to have #{@number_of_items} items")
    end
  end
end; end