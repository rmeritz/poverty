require 'spec_helper'
include ActionView::Helpers::NumberHelper

describe SalarySorter do
  def amount_offsetter(offset)
    number_to_currency(SalarySorter::POVERTY_LINE + offset,
                       :precision => 0,
                       :unit => "")
  end
  let(:poverty_delta) {100}
  let(:in_poverty)  do 
    SalarySorter.new(:amount =>
                     amount_offsetter(-poverty_delta))
  end
  let(:not_in_poverty) do 
    SalarySorter.new(:amount =>
                     amount_offsetter(poverty_delta))
  end
  let(:on_poverty_line) do 
    SalarySorter.new(:amount => amount_offsetter(0))
  end
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
    not_in_poverty.delta.should == poverty_delta
  end
  it "knows that you are exactly on the poverty line" do
    on_poverty_line.delta.should == 0
  end
  it "knows how far below the poverty line you are" do
    in_poverty.delta.should == poverty_delta
  end
end
