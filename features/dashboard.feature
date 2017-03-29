Feature: MUTEX Dashboard

In order to access my checklists to implement
as a standard account holder
I want to see my checklists

Scenario:
  Given I am logged in as kohachoji with password password123
  And there is a checklist that belongs to me
  When I go to the dashboard page
  Then I must see the checklist's summary
