When /^I go to the homepage$/ do
  visit('/')
#  save_and_open_page
end

Then /^I see that I'm living in poverty$/ do #'
  page.should have_content('yes')
end

When /^I submit a salary of \$(\d+)\/yr$/ do |amount|
  fill_in('salary', :with=>amount.to_s)
  click_button('Find out')
end

Then /^I see that I'm not living in poverty$/ do #'
  page.should have_content('no')
end

When /^I submit a tiny value$/ do
  fill_in('salary', :with=>'10000')
  click_button('Find out')
end

Then /^that I make \$(\d+)\/yr more than those in poverty$/ do |amount_over|
  page.should have_content("You make $#{amount_over}/yr above the poverty line.")
end
