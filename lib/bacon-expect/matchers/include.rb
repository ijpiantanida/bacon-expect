module BaconExpect; module Matcher
  class Include
    def initialize(*values)
      @values = *values
    end

    def matches?(subject)
      @values.all?{|v| subject.include?(v)}
    end

    def fail!(subject)
      raise FailedExpectation.new("\"#{subject}\" expected to include #{@values}")
    end
  end
end; end