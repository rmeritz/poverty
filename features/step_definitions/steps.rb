include ActionView::Helpers::NumberHelper

When /^I go to the homepage$/ do
  visit('/')
end

Then /^I see that I'm living in poverty$/ do #'
  page.should have_content('Yes')
end

When /^I submit a salary of \$(\d+)\/yr$/ do |amount|
  @amount = amount.to_i
  fill_in('salary_amount', :with=>amount.to_s)
  click_button('Find out')
end

Then /^I see that I'm not living in poverty$/ do #'
  page.should have_content('No')
end

Then /^I see how far above the poverty line I am$/ do
  amount_over = @amount - SalarySorter::POVERTY_LINE
  page.should have_content("You make #{number_to_currency amount_over, :precision => 0} above the poverty line, per year.")
end

Then /^I see how far below the poverty line I am$/ do
  amount_under = SalarySorter::POVERTY_LINE - @amount
  page.should have_content("You make #{number_to_currency amount_under, :precision => 0} below the poverty line, per year.")
end

When /^I submit nothing$/ do
  click_button('Find out')
end

Then /^I am still on the homepage$/ do
  page.should have_css('form')
end

Then /^I see an error message for entering nothing$/ do
  field = 'salary_amount'
  error_message = "can't be blank"
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')
  form_for_input = element.find(:xpath, 'ancestor::form[1]')
  error_class = 'field_with_errors'
  classes.should include(error_class)
  page.should have_content"Amount #{error_message}"
end




