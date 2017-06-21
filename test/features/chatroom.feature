Feature: Chat in chatroom
	User can create a chatroom
	User can join a chatroom
	User can chat in a chatroom

Scenario: Create a chatroom
  Given I am in the chatroom_list_page
  When I click 'create chatroom' button
  And I enter chatroom name 'new chatroom 1'
  And I click 'create' button
  Then I should enter the chatroom successfully

Scenario: Send message in chatroom
  Given I am in a chatroom 'new chatroom 1'
  When I enter text 'hello everybody'
  And I click 'send' button
  Then I should send message in chatroom successfully
  And I should see message 'hello everybody'

Scenario: Receive message in chatroom
  Given I am in a chatroom 'new chatroom 1'
  And another user 'John' join chatroom 'new chatroom 1'
  When another user 'John' send a message 'how are you?'
  Then I should see message 'how are you?'

Scenario: Back from chatroom to chatroom list
  Given I am in a chatroom 'new chatroom 1'
  When I click 'Back to index' link
  Then I should see the chatroom_list_page

Scenario: Join a chatroom
  Given another user 'John' create a chatroom 'Travel Japan'
  And I am in the chatroom list
  Then I should not be able to enter chatroom 'Travel Japan'
  When I click 'join' link
  Then I should enter the chatroom 'Travel Japan'

Scenario: Search chatroom name in chatroom list
  Given I am in the chatroom_list_page
  When I enter keyword 'xx' in search bar
  Then I should not see any chatroom in chatroom list
  When I enter keyword 'new' in search bar
  Then I should see 'new chatroom 1' in chatroom list

Scenario: Search chatroom id in chatroom list
  Given there are only 4 chatrooms
  And I am in the chatroom_list_page
  When I enter keyword '5' in search bar
  Then I should not see any chatroom in chatroom list
  When I enter keyword '1' in search bar
  Then I should see 'new chatroom 1' in chatroom list
