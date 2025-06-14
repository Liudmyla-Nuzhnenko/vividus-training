Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|username               |password    |
|standard_user          |secret_sauce|
|performance_glitch_user|secret_sauce|


Scenario: Navigate to the website homepage
Given I am on main application page
When I check that the page is correct

Scenario: Log In
Given I am on main application page
When I enter `<username>` in field located by `xpath(//input[@id="user-name"])`
And I enter `<password>` in field located by `xpath(//input[@id="password"])`
And I click on element located by `xpath(//input[@id="login-button"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Add item to the shopping cart
When I wait until element located by `<itemName>` appears
When I click on a button with the name '<addToCartButtonId>'
Examples:
|itemName                                          |addToCartButtonId                   |
|xpath(//div[text()="Sauce Labs Backpack"])        |add-to-cart-sauce-labs-backpack     |
|xpath(//div[text()="Sauce Labs Bike Light"])      |add-to-cart-sauce-labs-bike-light   |
|xpath(//div[text()="Sauce Labs Bolt T-Shirt"])    |add-to-cart-sauce-labs-bolt-t-shirt |


Scenario: Validate the num of items in the shopping cart
When I click on element located by `xpath(//a[@class="shopping_cart_link"])`
When I wait until element located by `xpath(//span[text()="3"])` has text matching `3`


Scenario: Log Out
When I click on element located by `xpath(//button[@id="react-burger-menu-btn"])`
When I click on element located by `xpath(//a[@id="reset_sidebar_link"])`
When I click on element located by `xpath(//a[@id="logout_sidebar_link"])`
