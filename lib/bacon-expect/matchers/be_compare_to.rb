module BaconExpect; module Matcher
  class BeMatcher
    [:==, :<, :<=, :>=, :>, :===, :=~].each do |operator|
      define_method operator do |operand|
        BeComparedTo.new(operator, operand)
      end
    end
  end

  class BeComparedTo < SingleMethod
    def matches?(actual)
      @actual = actual
      @actual.__send__ @method_name, *@values
    rescue ArgumentError, NoMethodError
      false
    end

    def fail!(subject, negated)
      raise FailedExpectation, fail_message(subject, negated)
    end

    def fail_message(subject, negated = false)
      FailMessageRenderer.message_for_be_compared(negated, subject, @method_name, *@values)
    end
  end
end; end

