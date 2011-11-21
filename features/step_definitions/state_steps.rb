Given /^there is a state called "([^"]*)"$/ do |arg1|
  State.create!(:name => arg1)
end
