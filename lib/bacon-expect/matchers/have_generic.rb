module BaconExpect; module Matcher
  class HaveGeneric
    def initialize(method_name, *args)
      @method_name = method_name
      @args = args
    end

    def matches?(subject)
      subject.send("has_#{@method_name}?", *@args)
    end

    def fail!(subject)
      message = "#{subject} has_#{@method_name}?"
      message += " with #{@args}" unless @args.empty?
      message += " to return true"
      raise FailedExpectation.new(message)
    end
  end
end; end