Meta:
    @group Training
    @requirementId MyTask-0007


Scenario: Navigate to the website homepage
Given I am on main application page
When I check that the page is correct

Scenario: Log In
Given I am on main application page
When I enter `standard_user` in field located by `xpath(//input[@id="user-name"])`
And I enter `secret_sauce` in field located by `xpath(//input[@id="password"])`
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

Scenario: Populate checkout data
When I click on element located by `xpath(//a[@class="shopping_cart_link"])`
When I click on a button with the name 'checkout'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-one.html`
When I enter `#{toLowerCase(#{generate(Name.firstName)})}` in field located by `xpath(//input[@id="first-name"])`
When I enter `#{toUpperCase(#{generate(Name.lastName)})}` in field located by `xpath(//input[@id="last-name"])`
When I enter `#{generate(regexify '[A-Z]{3}-[0-9]{5}')}` in field located by `xpath(//input[@id="postal-code"])`
When I take screenshot

Scenario: Complete checkout process
When I click on a button with the name 'continue'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`
When I click on a button with the name 'finish'
When I save text of element located by `xpath(//h2[@class="complete-header"])` to scenario variable `$messageText`
Given I initialize scenario variable `$message` with value `#{loadResource(/data/message.txt)}`
Then `#{eval($messageText)}` is equal to `#{eval($message)}`
