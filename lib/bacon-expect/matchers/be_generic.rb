module BaconExpect; module Matcher
  class BeGeneric
    def initialize(method_name, *args)
      @method_name = method_name
      @args = args
    end

    def matches?(value)
      value.send("#{@method_name}?", *@args)
    end

    def fail!(subject)
      message = "#{subject} expected to be #{@method_name}"
      message += " with #{@args}" unless @args.empty?
      raise FailedExpectation.new(message)
    end
  end
end; end