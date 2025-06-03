Scenario: Navigate to the website homepage
Given I am on main application page
When I check that the page is correct
When I take screenshot

Scenario: Log in as a Locked out User
Given I am on main application page
When I fill locked_out_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//div[@class="inventory_item"])` is equal to `6`
