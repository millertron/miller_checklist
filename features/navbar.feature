Feature: MUTEX Navigation Bar

In order to navigate between pages
as a privileged user
I want to see links on the navigation bar

Scenario: A basic user sees logout link in the navigation bar
	Given I am logged in as a basic user
	When I go to the dashboard page
	Then I must see the logout link in the navigation bar
	
Scenario: A basic user shouldn't see the admin menu item in the navigation bar
	Given I am logged in as a basic user
	When I go to the dashboard page
	Then I must not see the admin menu item in the navigation bar
	
Scenario: An admin user sees admin menu item in the navigation bar
	Given I am logged in as an admin user
	When I go to the dashboard page
	Then I must see the admin menu item in the navigation bar