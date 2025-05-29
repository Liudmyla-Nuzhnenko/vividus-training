GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Broken User
Given I am on main application page
When I fill problem_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
