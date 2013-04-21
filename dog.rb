class Dog
  attr_reader :name
  attr_accessor :abilities

  MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}

  def initialize(name)
    @name = name
  end

  def can(*abilities)
    abilities.each do |ability|
      meta = class << self; self; end
      meta.class_eval do
        define_method ability do
          "#{self.name} #{MSGS[ability]}"
        end
      end
    end
  end

  def method_missing(name, *args, &block)
    "#{self.name} doesn't understand #{name}"
  end
end
