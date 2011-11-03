require 'spec_helper'

describe Salary do 
it "produces its own CSV" do
    s = Salary.new(:ip => "1.1.1.1", :amount => 1111)
    s.save
    s.to_csv.should == "#{s.created_at.iso8601},1111,1.1.1.1"
  end
end
