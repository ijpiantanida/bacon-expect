module BaconExpect; module Matcher
  class BeGeneric < SingleMethod
    def initialize(method_name, *values)
      super("#{method_name}?", *values)
    end

    def fail_message(subject)
      message = "#{subject} #{@method_name}?"
      message += "(#{@values.join(', ')})" unless @values.empty?
      message += " expected to be true"
      message
    end
  end
end; end