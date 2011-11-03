class SalariesController < ApplicationController
  def index
    render :text => "created_at,amount,ip"
  end
  def new
    @salary = presenter
  end
  def create 
    @salary = presenter.with_params(params[:salary])
    if @salary.valid?
      salary_sorter = SalarySorter.new(@salary)
      if salary_sorter.in_poverty?
        @amount_under = salary_sorter.delta
        render :action => 'yes'
      else
        @amount_over = salary_sorter.delta
        render :action => 'no'
      end
    else
      render :new
    end
  end
  def presenter
    Presenter.new('salary',
                  :fields => [:amount], 
                  :validator => SalaryValidator)
  end
end


