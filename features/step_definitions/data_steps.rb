Given /^that no data has ever been entered$/ do
end

When /^I go to the private CSV URL$/ do
  visit('/salaries.csv')
end

Then /^I expect the empty CSV$/ do
  page.source.should == "created_at,amount,ip\n"
end

Given /^the following data has been entered:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |user_session|
    Timecop.freeze(Time.parse(user_session[:created_at]))
    ENV['RAILS_TEST_IP_ADDRESS'] = user_session[:ip]
    visit('/')
    fill_in('salary_amount', :with=>user_session[:amount])
    click_button('Find out')
  end
end

Then /^I see the following CSV:$/ do |table|
  expected = table.raw.map do |row|
    row.join ','
  end.join "\n"
    page.source.should == expected
end
