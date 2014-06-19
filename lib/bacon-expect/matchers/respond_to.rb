module BaconExpect; module Matcher
  class RespondTo
    def initialize(method_name)
      @method_name = method_name
    end

    def with(number_of_args)
      @number_of_args = number_of_args
      self
    end

    def arguments
      self
    end
    alias_method :argument, :arguments

    def matches?(subject)
      valid = true
      valid &&= subject.respond_to?(@method_name)
      valid &&= subject.method(@method_name).arity == @number_of_args if valid && @number_of_args
      valid
    end

    def fail!(subject, negated)
      raise FailedExpectation.new(FailMessageRenderer.message_for_respond_to(negated, subject, @method_name, @number_of_args))
    end
  end
end; end