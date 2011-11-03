class SalariesController < ApplicationController
  def index
    salary_csv_s = Salary.all.map do |salary|
      salary.to_csv
    end.join "\n"
    render :text => "created_at,amount,ip\n#{salary_csv_s}"
  end
  def new
    @salary = Salary.new
  end
  def create 
    @salary = Salary.new(params[:salary].merge(:ip => user_ip))
    if @salary.save
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
  def user_ip
    ENV['RAILS_TEST_IP_ADDRESS'] || request.remote_ip
  end
end


