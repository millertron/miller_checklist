Feature: MUTEX Dashboard

In order to access my checklists to implement
as a standard account holder
I want to see my checklists

Scenario:
  Given I am logged in as kohachoji with password password123
  And there is an incomplete, daily checklist that belongs to me called daily_checklist_1
  When I go to the dashboard page
  Then I must see the implementation link for daily_checklist_1 under daily checklists

Scenario:
  Given I am logged in as kohachoji with password password123
  And there is an incomplete, weekly checklist that belongs to me called weekly_checklist_1
  When I go to the dashboard page
  Then I must see the implementation link for weekly_checklist_1 under weekly checklists
  
Scenario:
  Given I am logged in as kohachoji with password password123
  And there is an incomplete, monthly checklist that belongs to me called monthly_checklist_1
  When I go to the dashboard page
  Then I must see the implementation link for monthly_checklist_1 under monthly checklists