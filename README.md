# README

Rails application that enables users to complete regular checklists

## Typical usage:

USER would log in from the default page, then be taken to the DASHBOARD where they can create new CHECKLISTS.

Once a checklist is created they will appear in the user's dashboard at the correct position depending on the target frequency (DAILY, WEEKLY, MONTHLY).

The user can select the created checklist and IMPLEMENT them. If the checklist type is BINARY, then they would tick the checkbox, if NUMERIC they would enter some numerical value. Upon returning the dashboard, they would see the checklist marked as completed.

ANALYTICS page would display the user's checklist completion statistics (not yet implemented)

Via the ADMIN page user can add CONTEXT-specific FORM OPTIONS, which would be used for checklists of either type SINGLE_SELECT or MULTI_SELECT. This is not yet implemented.


## Ruby version: 

2.3.1

## Rails version: 

5.0.1

## Configurations:

When installing gems via bundle install/update, for Windows, there will be a problem with bcrypt gem.
So you will have to remove the bcrypt gem, then manually install bcrypt using the following command:

```
gem 'bcrypt', '~> 3.1.11'
```

Just as described in the Gemfile

## Database initialization:

Development/test environment is configured to user SQLite at the moment as specified in database.yml
Seed contains one user but a secure sign-up process is yet to be implemented to user creation is unrestricted from the front end.

So run:
```
rake db:migrate
```
and
```
rake db:seed
```