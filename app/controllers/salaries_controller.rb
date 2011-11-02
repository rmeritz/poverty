class SalariesController < ApplicationController
  def new
    @salary = presenter
  end
  def create 
    @salary = presenter.with_params(params[:salary])
    # salary_sorter = SalarySorter.new(@salary)
    # if salary_sorter.top_1?
      render :action => 'no'
  end
  def presenter
    Presenter.new('salary',
                  :fields => [:amount])
  end
end
