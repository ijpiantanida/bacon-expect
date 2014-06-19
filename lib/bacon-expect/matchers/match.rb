module BaconExpect; module Matcher
  class Match < SingleMethod
    def initialize(value)
      super(:match, value)
    end

    def fail_message(subject, negated)
      FailMessageRenderer.message_for_match(negated, subject, @values.first)
    end
  end
end; end