GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
Given I am on main application page
When I fill standard_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`


Scenario: Log in as a Broken User
Given I am on main application page
When I fill problem_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`


Scenario: Log in as a Locked out User
Given I am on main application page
When I fill locked_out_user, secret_sauce
When I wait until element located by `xpath(//h3[@data-test="error"])` contains text `Epic sadface: Sorry, this user has been locked out.`


Scenario: Log in as a Slow User
Given I am on main application page
When I fill performance_glitch_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
