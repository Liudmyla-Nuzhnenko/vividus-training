Meta:
@API
@Petstore


Scenario: Verify that allows creating a User
Given request body: {"id": 10020,"username": "Mike216","firstName": "Mike","lastName": "John","email": "mike6@gmail.com","password": "password1234","phone": "0699952122","userStatus": 1}
When I set request headers:
|name                 |value                          |
|Content-Type         |application/json; charset=UTF-8|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"10020"`


Scenario: Verify that allows login as a User
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username=Mike216&password=password1234`
Then `${responseCode}` is equal to `200`


Scenario: Verify that allows adding a new Pet
Given request body:
{
  "id": 10025,
  "category": {
    "id": 10026,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 10027,
      "name": "dog"
    }
  ],
  "status": "available"
}
When I set request headers:
|name                 |value                          |
|Content-Type         |application/json; charset=UTF-8|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`
Then `${responseCode}` is equal to `200`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `petId`


Scenario: Verify that allows updating Pet’s name and status
Given request body: {
  "id": 10025,
  "category": {
    "id": 10026,
    "name": "Cherry"
  },
  "name": "Cherry",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 10027,
      "name": "Cherry"
    }
  ],
  "status": "available"
}
When I set request headers:
|name                 |value                          |
|Content-Type         |application/json; charset=UTF-8|
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.name` is equal to `"Cherry"`

Scenario: Verify that allows deleting Pet
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/10025`
Then `${responseCode}` is equal to `200`
