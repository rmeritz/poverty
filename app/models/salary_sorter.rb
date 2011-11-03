class SalarySorter
  def initialize(presenter)
    @amount = presenter[:amount]
  end
  def in_poverty?
    @amount.to_i <= 10890
  end
end
