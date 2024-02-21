module BaconExpect
  module Matcher
    module BaconContext
      def be_nil
        BeNil.new
      end

      def be_true
        BeTrue.new
      end

      def be_false
        BeFalse.new
      end

      def raise_error(exception_class = Exception, message = "")
        RaiseError.new(exception_class, message)
      end
      alias_method :raise_exception, :raise_error

      def be_a(value)
        SingleMethod.new(:kind_of?, value)
      end

      def be_an(value)
        SingleMethod.new(:kind_of?, value)
      end

      def eql(value)
        Eql.new(value)
      end

      def equal(value)
        Be.new(value)
      end

      def eq(value)
        Eq.new(value)
      end

      def be(*args)
        args.empty? ? BeMatcher.new : Be.new(*args)
      end

      def match(regex)
        Match.new(regex)
      end

      def match_array(array)
        MatchArray.new(array)
      end
      alias_method :contain_exactly, :match_array

      def include(*values)
        Include.new(*values)
      end

      def have(number)
        HaveItems.new(number)
      end

      def satisfy(&block)
        Satisfy.new(&block)
      end

      def respond_to(method_name)
        RespondTo.new(method_name)
      end

      def start_with(substring)
        StartWith.new(substring)
      end

      def end_with(substring)
        EndWith.new(substring)
      end

      def change(&change_block)
        Change.new(change_block)
      end

      def be_within(range)
        BeWithin.new(range)
      end

      def method_missing(method_name, *args, &block)
        string_method_name = method_name.to_s
        match_be = string_method_name.match(/^be_(.*)/)
        if match_be
          BeGeneric.new(match_be[1], *args)
        else
          match_have = string_method_name.match(/^have_(.*)/)
          if match_have
            HaveGeneric.new(match_have[1], *args)
          else
            super
          end
        end
      end
    end
  end
end
