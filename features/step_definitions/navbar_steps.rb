Then(/^I must see the logout link in the navigation bar$/) do
  within('nav', id: "header-nav") do
	expect(page).to have_content "Log out"
  end
end

Then(/^I must not see the admin menu item in the navigation bar$/) do
  within('nav', id: "header-nav") do
	expect(page).to_not have_content "Admin"
  end
end

Then(/^I must see the admin menu item in the navigation bar$/) do
	within('nav', id: "header-nav") do
		expect(page).to have_content "Admin"
	end
end