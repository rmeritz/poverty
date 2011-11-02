class SalariesController < ApplicationController
  def new
    @salary = Salary.new
  end
end
