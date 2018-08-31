require 'active_support/concern'
require 'fluent/version'
require 'fluent/lexicon'

module Fluent
  extend ActiveSupport::Concern

  class_methods do
    attr_reader :lexicographer, :dictionary, :translator, :combiner

    def lexicon(lex)
      @lexicographer = lex
      @dictionary = lex.dictionary
      @translator = lex.translator
      @combiner = lex.combiner
    end
    
    def lookup(&block)
      @dictionary = block
    end

    def translate(&block)
      @translator = block
    end

    def combine(&block)
      @combiner = block
    end
  end

  def respond_to?(name)
    super(name) || self.class.dictionary.call(name).present?
  end

  def method_missing(name, *args, &block)
    translated = name
    translated = self.class.translator.call(name) if self.class.translator.present?
    definition = self.class.dictionary.call(translated)
    
    if definition.present?
      result = Reflex.inject({ 
        api: self, 
        name: name, 
        definition: definition, 
        args: args, 
        block: block
      }, self.class.combiner)
      
      return result
    end

    super(name, *args, &block)
  end
end
