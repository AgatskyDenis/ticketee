Feature: Ticket Notifications
  Background:
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
      | bob@ticketee.com   | password |
    
    Given a clear email queue
    
    Given there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "bob@ticketee.com" can view the "TextMate 2" project
    And "alice@ticketee.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very shortly. |
    
    Given I am signed in as "bob@ticketee.com"
    Given I am on the homepage
    
  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    When I follow "Sign out"

Given a clear email queue
Given I am signed in as "alice@ticketee.com"
When I follow "TextMate 2"
And I follow "Release date"
And I fill in "Text" with "Not yet!"
And I press "Create Comment"
Then I should see "Comment has been created."
Then "bob@ticketee.com" should receive an email
Then "alice@ticketee.com" should have no emails
