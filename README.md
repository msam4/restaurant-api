# 🍽️ Restaurant API Application

A simple restaurant API application made with Ruby on Rails. 
<br>
NO frontend UI. USE Postman to access the API.

<br>
Contact me for URL link.
   
## How to Use
- Open an API platform application like [Postman](https://www.postman.com/) and sign in.
![image](https://github.com/msam4/restaurant-api/assets/137851066/c8bb9def-26f8-42a5-ac77-268464747a54)

- Create a new workspace.

### Show All Restaurants
- Set the verb to GET.
- In the URL after the GET verb, insert the following url: INSERT_URL_HERE/api/v1/restaurants
- Save and then click the SEND button.

![image](https://github.com/msam4/restaurant-api/assets/137851066/d4c77574-50c1-4c79-b655-8f21169cc11d)

<br>

### Show One Restaurants
- Set the verb to GET.
- In the URL after the GET verb, insert the following url: INSERT_URL_HERE/api/v1/restaurants/:id
  - :id should be the restaurant id you want to see
- Save and then click the SEND button.

![image](https://github.com/msam4/restaurant-api/assets/137851066/6d05dd10-f1dc-4fa1-b2a6-53de3e1e4128)
<br>

### Create a New Restaurant
- Set the verb to POST
- In the URL after POST verb, insert the following url: INSERT_URL_HERE/api/v1/restaurants
- In the Headers tab under the verb and url, insert the following key and value:
  - Content-Type: application/json
  - X-User-Email: INSERT_USER_EMAIL
  - X-User-Token: INSERT_USER_TOKEN


- In the body tab, select raw and the drop down menu set as JSON.
- Add a new restaurant using this format inside of curly brackets:
  - "name": "ADD_RESTAURANT_NAME", "address": "ADD_RESTAURANT_ADDRESS"

- Save and then click the SEND button

![image](https://github.com/msam4/restaurant-api/assets/137851066/a8f4363c-1776-491d-bd46-170fbfeb3120)
<br>

### Update a Restaurant
- Set the verb to PATCH
- In the url after the PATCH verb, insert the following url: INSERT_URL_HERE/api/v1/restaurants/:id
  - :id should be the restaurant id you want to update
- In the HEADER tab, make sure to have same header keys and values when creating a new restaurant (see Create a New Restaurant 3rd bullet point)
- In the body tab, select raw and set the drop down menu to JSON

- Save and then click the SEND button

![image](https://github.com/msam4/restaurant-api/assets/137851066/04f1f3d8-22bc-4717-b2a5-1a4f5c4a2fbf)
<br>

## Destroy a Restaurant
- Set the verb to DELETE
- In the url after the DELETE verb, insert the following url: INSERT_URL_HERE/api/v1/restaurants/:id
  - :id should be the restaurant id that you want to delete
- In the header tab, make sure to have the following keys and value:
  - X-User-Email: INSERT_USER_EMAIL
  - X-User-Token: INSERT_USER_TOKEN

- Save and then click the SEND button
- A 204 No Content should appear which means the destory was a success.

![image](https://github.com/msam4/restaurant-api/assets/137851066/f5cac8b9-3b15-47d1-b8b2-16bd5dda42b0)
<br>

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. 
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database

## Additional Features to Add
- Rspec test for comment controller and route.
- Frontend UI to connect with the backend server.
