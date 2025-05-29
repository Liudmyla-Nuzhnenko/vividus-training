GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Locked out User
Given I am on main application page
When I fill locked_out_user, secret_sauce
When I wait until element located by `xpath(//h3[@data-test="error"])` contains text `Epic sadface: Sorry, this user has been locked out.`
