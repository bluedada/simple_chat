Feature: Sign in and sign out
	User can sign in
	User can sign out

Scenario: sign up
  Given I am in the hompage
  When I click 'sign up' link
  Then I should see sign_up_page
	When I enter nickname 'Tester1'
	And I enter email 'tester1@aa.bb'
	And I enter password '111111'
	And I enter password confirmation '111111'
	And I click 'sign up' button
	Then I should see chatrooms list

Scenario: sign in
  Given I am in the homepage
  When I enter email 'tester1@aa.bb'
  And I enter pasword '111111'
  And I click 'log in' button
	Then I should sign up successfully
	And I should see chatrooms list

Scenario: sign out
  Given I am sign in to the application
  And I can see the chatrooms list
  When I click 'log out' button
  Then I should logout successfully