Scenario: Navigate to the website homepage
Given I am on main application page
When I check that the page is correct
When I COMPARE_AGAINST baseline with name `firstpage_edge`


Scenario: Log in as a Good User
Given I am on main application page
When I fill standard_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I COMPARE_AGAINST baseline with name `homepage_edge` ignoring:
|ELEMENT                                     |
|By.xpath(//*[@class='inventory_item_img'])  |

Scenario: Log in as a Broken User
Given I am on main application page
When I fill problem_user, secret_sauce
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I COMPARE_AGAINST baseline with name `homepage_edge` ignoring:
|ELEMENT                                     |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@class='inventory_item_img'])  |10                        |
