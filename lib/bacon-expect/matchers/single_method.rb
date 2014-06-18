module BaconExpect; module Matcher
  class SingleMethod
    def initialize(method_name, *values)
      @values = values
      @method_name = method_name
    end

    def matches?(subject)
      subject.send(@method_name, *@values)
    end

    def fail!(subject)
      raise FailedExpectation.new(self.fail_message(subject))
    end

    def fail_message(subject)
      raise 'Subclass responsability'
    end
  end
end; end