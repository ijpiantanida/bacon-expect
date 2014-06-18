module BaconExpect; module Matcher
  class Eql < SingleMethod
    def initialize(value)
      super(:eql?, value)
    end

    def fail_message(subject)
      "#{subject} expected to be eql? to #{@value}"
    end
  end
end; end