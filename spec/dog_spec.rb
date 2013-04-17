require 'spec_helper'

describe Dog do
  context "having method" do
    it "shows MSGS attributes" do
      dog = Dog.new("Qiqi")
      dog.can :dance
      dog.dance.should == "Qiqi is dancing"
    end
  end
end
