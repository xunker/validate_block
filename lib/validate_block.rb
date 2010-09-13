$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ActiveRecord
  module Validations
    module ClassMethods
      def validate_block(opts = {}, &block)
        @block_opts = opts || {}
        yield
      end

      def method_missing(name, *args, &block)
        if args.last.class == Hash
          args.last.merge!(@block_opts)
        else
          args << @block_opts
        end
        
        if name.to_s =~ /^validates_/
          send(name, *args)
        elsif respond_to?(("validates_"+name.to_s).to_sym)
          send(("validates_"+name.to_s).to_sym, *args)
        else
          super
        end
      end
    end    
  end
end
