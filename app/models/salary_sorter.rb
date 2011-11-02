class SalarySorter
  def initialize(presenter)
    @amount = presenter[:amount]
  end
  def top_1?
    @amount.to_i > 100000000000
  end
end

