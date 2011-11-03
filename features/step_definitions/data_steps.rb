When /^no data has ever been entered in the website$/ do
end

When /^I go to the private CSV URL$/ do
  visit('/salaries.csv')
end

Then /^I expect the empty CSV$/ do
  page.source.should == "created_at,amount,ip"
end

