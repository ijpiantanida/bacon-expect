module BaconExpect; module Matcher
  class Be < SingleMethod
    def initialize(value)
      super(:equal?, value)
    end

    def fail_message(subject, negated)
      FailMessageRenderer.message_for_be_equal(negated, subject, @values.first)
    end
  end
end; end