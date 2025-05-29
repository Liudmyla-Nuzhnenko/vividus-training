GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
Given I am on main application page
When I fill standard_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
