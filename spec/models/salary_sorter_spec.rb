require 'spec_helper'

describe SalarySorter do 
  it "knows if you're not in poverty" do 
    s = SalarySorter.new(:amount => "100000000")
    s.should_not be_in_poverty
  end
  it "knows you're on the poverty line" do 
    s = SalarySorter.new(:amount => "10890")
    s.should be_in_poverty
  end
  it "knows if you're in poverty" do 
    s = SalarySorter.new(:amount => "10000")
    s.should be_in_poverty
  end
end
