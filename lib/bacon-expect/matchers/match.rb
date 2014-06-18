module BaconExpect; module Matcher
  class Match < SingleMethod
    def initialize(value)
      super(:match, value)
    end

    def fail_message(subject)
      "\"#{subject}\" expected to match #{@regex}"
    end
  end
end; end