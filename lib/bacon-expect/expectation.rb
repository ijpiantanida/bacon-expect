module BaconExpect
  class Expectation
    module BaconContext
      def expect(subject = nil, &block)
        Expectation.new(subject, &block)
      end
    end

    def initialize(subject, &subject_block)
      @subject = subject
      @subject_block = subject_block
    end

    def to(matcher)
      unless matcher.matches?(@subject, &@subject_block)
        raise matcher.fail!(@subject, &@subject_block)
      end
      assert
    end

    def not_to(matcher)
      if matcher.matches?(@subject, &@subject_block)
        raise matcher.fail!(@subject, &@subject_block)
      end
      assert
    end
    alias_method :to_not, :not_to

    def assert
      true.should == true
    end
  end
end

module Spector



end
