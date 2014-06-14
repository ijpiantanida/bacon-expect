module BaconExpect; module Matcher
  class RaiseError
    def initialize(error_class = Exception, message = "")
      @error_class = error_class.is_a?(Class) ? error_class : Exception
      @error_message = (error_class.is_a?(String) || error_class.is_a?(Regexp)) ? error_class : message
    end

    def matches?(value, &block)
      begin
        block.call
        false
      rescue Exception => e
        @rescued_exception = e
        exception_matches(e)
      end
    end

    def exception_matches(e)
      e.is_a?(@error_class) && (
        (@error_message.is_a?(String) && e.message.include?(@error_message)) ||
            (@error_message.is_a?(Regexp) && @error_message.match(e.message))
      )
    end

    def fail!(subject)
      message = "Block expected to raise exception of type #{@error_class}"
      message += " but was #{@rescued_exception.class} #{@rescued_exception}" if @rescued_exception
      raise FailedExpectation.new(message)
    end
  end
end; end