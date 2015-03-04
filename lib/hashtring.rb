require "hashtring/version"
require "core_ext/string"

module Hashtring
  class Constructor
    attr_accessor :name, :hash

    def initialize(name, hash={})
      @name = name.to_s
      @hash = hash
    end

    def [](*args)
      hash.send(:[], *args)
    end

    def inspect
      to_s
    end

    def method_missing(method_sym, *args, &block)
      if stringify_keys(hash).has_key? method_sym.to_s
        stringify_keys(hash).send(:[], method_sym.to_s)
      else
        super
      end
    end

    def to_s
      name.to_s
    end

    private

    def stringify_keys(hash)
      Hash[hash.map { |k, v| [k.to_s, v] }]
    end
  end
end
