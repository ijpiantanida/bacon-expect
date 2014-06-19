module BaconExpect; module Matcher
  class Include
    def initialize(*values)
      @values = *values
    end

    def matches?(subject)
      @values.all?{|v| subject.include?(v)}
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_include(negated, subject, @values))
    end
  end
end; end