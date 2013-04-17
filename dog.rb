class Dog
  attr_reader :name
  attr_accessor :abilities

  MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}

  def initialize(name)
    @name = name
    @abilities = []
  end

  def can(*abilities)
    self.abilities = abilities
  end

  def method_missing(name, *args, &block)
    if abilities.include?(name)
      "#{self.name} #{MSGS[name]}"
    else
      "#{self.name} doesn't understand #{name}"
    end
  end
end
