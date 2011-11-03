class Salary < ActiveRecord::Base
  validates_presence_of :amount
  def to_csv 
    "#{created_at.iso8601},#{amount},#{ip}"
  end
end
