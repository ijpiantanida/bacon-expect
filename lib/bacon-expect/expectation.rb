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
      fail(matcher, false) unless matcher_passes(matcher)
      assert
    end

    def not_to(matcher)
      fail(matcher, true) if matcher_passes(matcher)
      assert
    end
    alias_method :to_not, :not_to

    def matcher_passes(matcher)
      matcher.matches?(@subject, &@subject_block)
    end

    def fail(matcher, negated)
      raise matcher.fail!(@subject, negated, &@subject_block)
    end

    def assert
      true.should == true
    end
  end
end