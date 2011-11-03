class SalariesController < ApplicationController
  def new
    @salary = presenter
  end
  def create 
    @salary = presenter.with_params(params[:salary])
    salary_sorter = SalarySorter.new(@salary)
    if salary_sorter.in_poverty?
      render :action => 'no'
    else
      render :action => 'yes'
    end
  end
  def presenter
    Presenter.new('salary',
                  :fields => [:amount])
  end
end
