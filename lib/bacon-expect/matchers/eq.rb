module BaconExpect; module Matcher
  class Eq < SingleMethod
    def initialize(value)
      super(:==, value)
    end

    def fail_message(subject)
      "#{subject} expected to be == to #{@value}"
    end
  end
end; end