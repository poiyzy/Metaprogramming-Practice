class Dog
  attr_reader :name

  MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}

  def initialize(name)
    @name = name
  end

  def can(*abilities, &block)
    meta = class << self; self; end
    abilities.each do |ability|
      meta.class_eval do
        if block_given?
          send(:define_method, ability, &block)
        else
          send(:define_method, ability) { "#{name} #{MSGS[ability]}" }
        end
      end
    end
  end

  def method_missing(name)
    "#{self.name} doesn't understand #{name}"
  end
end
