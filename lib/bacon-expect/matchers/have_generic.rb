module BaconExpect; module Matcher
  class HaveGeneric
    def initialize(method_name, *args)
      @method_name = method_name
      @args = args
    end

    def matches?(subject)
      subject.send("has_#{@method_name}?", *@args)
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_have_generic(negated, subject, @method_name, @args))
    end
  end
end; end