class SalarySorter
  POVERTY_LINE = 10890
  def initialize(presenter)
    @amount = presenter[:amount].gsub(',','').to_i
  end
  def in_poverty?
    @amount <= POVERTY_LINE
  end
  def delta 
    (@amount - POVERTY_LINE).abs
  end
end
