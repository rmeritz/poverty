require 'spec_helper'

describe SalarySorter do
  let(:in_poverty)  {SalarySorter.new(:amount => '100')}
  let(:not_in_poverty) {SalarySorter.new(:amount => '20,890')}
  let(:on_poverty_line) {SalarySorter.new(:amount => '10,890')}

  it "knows if you're not in poverty" do 
    not_in_poverty.should_not be_in_poverty
  end
  it "knows you're on the poverty line" do 
    on_poverty_line.should be_in_poverty
  end
  it "knows if you're in poverty" do 
     in_poverty.should be_in_poverty
  end
  it "knows how much more you make than those in poverty" do
    not_in_poverty.delta.should == 10000
  end
  it "knows that you are exactly on the poverty line" do
    on_poverty_line.delta.should == 0
  end
  it "knows how far below the poverty line you are" do
    in_poverty.delta.should == 10790
  end
end
