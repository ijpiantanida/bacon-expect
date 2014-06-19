module BaconExpect
  class FailMessageRenderer
    def self.expectation(negated)
      "#{negated ? " not" : ""} expected"
    end

    def self.message_for_be_false(negated, subject)
      "#{subject.inspect}#{expectation(negated)} to be false"
    end

    def self.message_for_be_true(negated, subject)
      "#{subject.inspect}#{expectation(negated)} to be true"
    end

    def self.message_for_be_nil(negated, subject)
      "#{subject.inspect}#{expectation(negated)} to be nil"
    end

    def self.message_for_be(negated, subject, method_name, values)
      message = "#{subject.inspect} ##{method_name}"
      message += "(#{values.map(&:inspect).join(', ')})" unless values.empty?
      message += "#{expectation(negated)} to return true"
      message
    end

    def self.message_for_be_within(negated, subject, range, center_value)
      "#{subject.inspect}#{expectation(negated)} to be within #{range} of #{center_value}"
    end

    def self.message_for_change(negated, change_amount, value_diff)
      message = "Block#{expectation(negated)} to change value"
      message += " by #{change_amount}" if change_amount
      message += " but changed by #{value_diff}" if change_amount && !negated
      message
    end

    def self.message_for_end_with(negated, subject, end_string)
      "#{subject.inspect}#{expectation(negated)} to end with #{end_string.inspect}"
    end

    def self.message_for_start_with(negated, subject, start_string)
      "#{subject.inspect}#{expectation(negated)} to start with #{start_string.inspect}"
    end

    def self.message_for_be_equal(negated, subject, value)
      "#{subject.inspect}#{expectation(negated)} to be same object as #{value.inspect}"
    end

    def self.message_for_be_eq(negated, subject, value)
      "#{subject.inspect}#{expectation(negated)} to be == to #{value.inspect}"
    end
    
    def self.message_for_have_generic(negated, subject, method_name, values)
      message = "#{subject.inspect} #has_#{method_name}?"
      message += "(#{values.map(&:inspect).join(', ')})" unless values.empty?
      message += "#{expectation(negated)} to return true"
      message
    end

    def self.message_for_have_items(negated, subject, expected_number_of_items, actual_number_of_items, key_type_name)
      message = "#{subject.inspect}#{expectation(negated)} to have #{expected_number_of_items} #{key_type_name}"
      message += " but had #{actual_number_of_items}" unless negated
      message
    end

    def self.message_for_include(negated, subject, values)
      values_message = values.size == 1 ? values.first : values
      message = "#{subject.inspect}#{expectation(negated)} to include #{values_message.inspect}"
      message
    end

    def self.message_for_match_array(negated, subject_array, expected_array)
      message = "#{subject_array.inspect}#{expectation(negated)} to match array"
      message += " #{expected_array.inspect}"
      message
    end

    def self.message_for_match(negated, subject, match)
      "#{subject.inspect}#{expectation(negated)} to match #{match.inspect}"
    end

    def self.message_for_raise_error(negated, show_class, error_class, show_message, error_message, rescued_exception)
      message = "Block#{expectation(negated)} to raise error"
      message += " of type #{error_class}" if show_class
      message += " with message matching #{error_message.inspect}" if show_message
      message += " but was #{rescued_exception.inspect}" if rescued_exception && !negated
      message
    end

    def self.message_for_respond_to(negated, subject, method_name, number_of_args)
      message = "#{subject.inspect}#{expectation(negated)} to respond to ##{method_name}"
      message += " with #{number_of_args} arguments" if number_of_args
      message
    end

    def self.message_for_satisfy(negated)
      "Block#{expectation(negated)} to satisfy condition"
    end
  end
end