GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Slow User
Given I am on main application page
When I fill performance_glitch_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
