Feature: Create new checklist

 In order to see all my checklists
 As a user
 I want to see my checklists
 
 Scenario: 
  Given I am a logged in user
  And there is a checklist that belongs to me
  When I go to the dashboard page
  Then I must see the checklist's summary