module BaconExpect; module Matcher
  class SingleMethod
    def initialize(method_name, *values)
      @values = values
      @method_name = method_name
    end

    def matches?(subject)
      subject.send(@method_name, *@values)
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(self.fail_message(subject, negated))
    end

    def fail_message(subject, negated = false)
      FailMessageRenderer.message_for_be(negated, subject, @method_name, @values)
    end
  end
end; end