require 'spec_helper'

describe Dog do
  let(:dog) { Dog.new("Qiqi") }

  context "having abilities" do
    it "shows is doing something" do
      dog.can :dance
      dog.dance.should == "Qiqi is dancing"
    end
  end

  context "Not having abilities" do
    context "call abilities included in MSGS" do
      it "shows does not understand" do
        dog.dance.should == "Qiqi doesn't understand dance"
      end
    end

    context "call abilities excluded in MSGS" do
      it "shows does not understand" do
        dog.some_action.should == "Qiqi doesn't understand some_action"
      end
    end
  end
end
