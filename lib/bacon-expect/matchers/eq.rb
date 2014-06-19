module BaconExpect; module Matcher
  class Eq < SingleMethod
    def initialize(value)
      super(:==, value)
    end

    def fail_message(subject, negated)
      FailMessageRenderer.message_for_be_eq(negated, subject, @values.first)
    end
  end
end; end