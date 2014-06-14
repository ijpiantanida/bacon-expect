module BaconExpect; module Matcher
  class Change
    def initialize(change_block)
      @change_block = change_block
    end

    def by(amount)
      @change_amount = amount
      self
    end

    def matches?(subject, &expectation_block)
      old_value = @change_block.call
      expectation_block.call
      new_value = @change_block.call
      if @change_amount
        new_value - @change_amount == old_value
      else
        new_value != old_value
      end
    end

    def fail!(subject)
      message = "Block expected to change value"
      message += " by #{@change_amount}" if @change_amount
      raise FailedExpectation.new(message)
    end
  end
end; end