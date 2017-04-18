Feature: MUTEX Dashboard

In order to access my checklists to implement
as a standard account holder
I want to see my checklists

Scenario: User with an unimplemented daily checklist logs into the system
	Given I am logged in as a basic user
	And there is an incomplete, daily checklist that belongs to me called daily_checklist_1
	When I go to the dashboard page
	Then I must see the implementation link for daily_checklist_1 under daily checklists

Scenario: User with an unimplemented weekly checklist logs into the system
	Given I am logged in as a basic user
	And there is an incomplete, weekly checklist that belongs to me called weekly_checklist_1
	When I go to the dashboard page
	Then I must see the implementation link for weekly_checklist_1 under weekly checklists
  
Scenario: User with an unimplemented monthly checklist logs into the system
	Given I am logged in as a basic user
	And there is an incomplete, monthly checklist that belongs to me called monthly_checklist_1
	When I go to the dashboard page
	Then I must see the implementation link for monthly_checklist_1 under monthly checklists

Scenario: User with checklists of all types logs into the system
	Given I am logged in as a basic user
	And there is an incomplete, daily checklist that belongs to me called daily_checklist_1
	And there is an incomplete, weekly checklist that belongs to me called weekly_checklist_1
	And there is an incomplete, monthly checklist that belongs to me called monthly_checklist_1
	When I go to the dashboard page
	Then I must see the implementation link for daily_checklist_1 under daily checklists
	And I must see the implementation link for weekly_checklist_1 under weekly checklists
	And I must see the implementation link for monthly_checklist_1 under monthly checklists
	
Scenario: User only sees their own checklists
	Given I am logged in as a basic user
	And there is an incomplete, daily checklist that belongs to someone else
	When I go to the dashboard page
	Then I must not see the implementation link for checklists that is not mine
	
  
