When /^I go to the homepage$/ do
  visit('/')
#  save_and_open_page
end

Then /^I see that I'm livining in poverty$/ do
  page.should have_content('no')
end

When /^I submit a salary above the poverty line$/ do
  fill_in('salary', :with=>100_000_000_000_000.to_s)
  click_button('Find out')
end

Then /^I see that I'm not living in poverty$/ do #'
  page.should have_content('yes')
end

When /^I submit a tiny value$/ do
  fill_in('salary', :with=>'30000')
  click_button('Find out')

end

Then /^I see that I'm in the (\d+)%$/ do |percent| #'
  pending # express the regexp above with the code you wish you had
end

