$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ActiveRecord
  module Validations
    module ClassMethods
      def validate_block(opts = {}, &block)
        @block_opts = opts || {}
        yield
      end

      def method_missing(name, attrib, opts = {}, &block)
        if name.to_s =~ /^validates_/
          send(name, attrib, opts.merge(@block_opts))
        elsif respond_to?(("validates_"+name.to_s).to_sym)
          send(("validates_"+name.to_s).to_sym, attrib, opts.merge(@block_opts))
        else
          super
        end
      end
    end    
  end
end
