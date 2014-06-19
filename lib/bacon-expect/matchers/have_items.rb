module BaconExpect; module Matcher
  class HaveItems
    def initialize(number_of_items)
      @number_of_items = number_of_items
    end

    def matches?(value)
      value.size == @number_of_items
    end

    [:items, :item, :keys, :values].each do |key_type_name|
      define_method(key_type_name) do
        @key_type_name = key_type_name
        self
      end
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_have_items(negated, subject, @number_of_items, subject.size, @key_type_name))
    end
  end
end; end