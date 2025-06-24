Scenario: Check the title is correct
Given I am on main application page
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check that allow to change language to UA
Given I am on main application page
When I click on element located by `xpath(//button[@class="location-selector__button"])`
When I click on an element with the attribute 'lang'='uk'
When I wait until element located by `xpath(//button[@class="location-selector__button"])` contains text `Україна (UA)`

Scenario: Check the policies list
Given I am on main application page
When I wait until element located by `xpath(//h2[text()="policies"])` appears
When I wait until element located by `xpath(//a[text()="INVESTORS"])` appears
When I wait until element located by `xpath(//a[text()="COOKIE POLICY"])` appears
When I wait until element located by `xpath(//a[text()="OPEN SOURCE"])` appears
When I wait until element located by `xpath(//a[text()="APPLICANT PRIVACY NOTICE"])` appears
When I wait until element located by `xpath(//a[text()="PRIVACY POLICY"])` appears

Scenario: Check that allow to switch location list by region
Given I am on main application page
When I wait until element located by `xpath(//span[@class="museo-sans-light"][contains(text(), "Our")])` appears
When I click on element located by `xpath(//a[text()="EMEA"])`
When I click on element located by `xpath(//a[text()="APAC"])`
When I wait until element located by `xpath(//button[@data-country-title="Australia"][@tabindex="0"])` appears

Scenario: Check the search function
Given I am on main application page
When I click on element located by `xpath(//button[@class="header-search__button header__icon"])`
When I enter `AI` in field located by `xpath(//input[@id="new_form_search"])`
When I click on element located by `xpath(//span[@class="bth-text-layer"])`
When I wait until element located by `xpath(//h2[contains(text(), "AI")])` appears

Scenario: Check that the Company logo on the header lead to the main page
Given I am on a page with the URL 'https://www.epam.com/about'
When I click on element located by `xpath(//a[@class="header__logo-link"])`
Then `${current-page-url}` is equal to `https://www.epam.com/`

Scenario: Check the ability to switch Light / Dark mode
Given I am on main application page
When I click on element located by `xpath(//div[@class="theme-switcher"])`
When I COMPARE_AGAINST baseline with name `mainPage` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE|
|5                         |
