module Fluent
  class Lexicon
    class << self
      def collect(argser, kwargser)
        lambda do |*args, **kwargs|
          results = [] 

          args.each do |arg|
            results << argser.call(*arg)
          end if args.present?

          kwargs.map do |k, v|
            results << kwargser.call(k, v)
          end if kwargs.present?

          results
        end
      end

      def reflect(base)
        lambda do |name|
          klass = "#{base.name}::#{name.to_s.classify}"
          begin
            return klass.constantize
          rescue NameError => e
            raise e if e.name.to_s != name.to_s.classify
            return nil
          end
        end
      end
    end
  end
end