Feature: User Sign-up / Account Creation

In order to log in and use the application 
as an end user
I want to create a user account

Scenario: A guest should see the user sign-up link from the login page
	Given I am a guest user
	When I go to the login page
	Then I must see the link to the sign-up page
	
Scenario: A guest should see the user creation form in the sign-up page
	Given I am a guest user
	When I go to the sign up page
	Then I must see a user creation form
	And there should be form fields for username, first name, last name, email address, password
	
Scenario: A guest should be able to successfully create a user account with valid details in the sign-up page
	Given I am a guest user
	When I go to the sign up page
	And I submit the form filled in with username=username, first name=first, last name=last, email=address=user@email.com, password=password
	Then I must end up at the login page
	And I must see a success flash that says "Please activate your account"
	
Scenario: A guest user who has created a user account cannot log in with that account before activation
	Give I am a guest user
	When I go to the sign up page
	And I submit the form filled in with username=username, first name=first, last name=last, email=address=user@email.com, password=password
	And I log in as username with password password
	Then I must end up at the login page
	And I must see a danger flash that says "Failed to log in"
	
	
	