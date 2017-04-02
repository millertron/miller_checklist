Feature: Checklist Creation

In order to have checklists available for me to implement
as a checklist creator
I want to create checklists

Scenario: A logged in user should see the link to the checklist creation page in the dashboard.
	Given I am logged in as a basic user
	When I go to the dashboard page
	Then I must see a link to the checklist creation page
	
Scenario: A user navigates from the dashboard to the checklist creation page to see the form.
	Given I am logged in as a basic user
	When I go to the dashboard page
	And I go to the checklist creation page
	Then I must see a checklist creation form
