When /^I go to the homepage$/ do
  visit('/')
#  save_and_open_page
end

Then /^I see that I'm livining in poverty$/ do #'
  page.should have_content('no')
end

When /^I submit a salary of \$(\d+)\/yr$/ do | amount |
  fill_in('salary', :with=>amount.to_s)
  click_button('Find out')
end

Then /^I see that I'm not living in poverty$/ do #'
  page.should have_content('yes')
end

When /^I submit a tiny value$/ do
  fill_in('salary', :with=>'10000')
  click_button('Find out')
end

