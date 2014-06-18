module BaconExpect; module Matcher
  class Be < SingleMethod
    def initialize(value)
      super(:equal?, value)
    end

    def fail_message(subject)
      "#{subject} expected to be equal? to #{@value}"
    end
  end
end; end