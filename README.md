# 🍽️ Restaurant API Application

A simple restaurant API application made with Ruby on Rails. 

<br>
App home: https://michael-restaurants-api-78cca9b4536d.herokuapp.com/
   
## How to Use
- Open an API platform application like [Postman](https://www.postman.com/) and sign in.
![image](https://github.com/msam4/restaurant-api/assets/137851066/c8bb9def-26f8-42a5-ac77-268464747a54)

- Create a new workspace.

### Show All Restaurants
- Set the verb to GET.
- In the URL after the GET verb, insert the following url: https://michael-restaurants-api-78cca9b4536d.herokuapp.com/api/v1/restaurants
![image](https://github.com/msam4/restaurant-api/assets/137851066/a1841fd8-20d0-4508-a22f-146d8981ea3c)
<br>

- Save and then click the SEND button.

![image](https://github.com/msam4/restaurant-api/assets/137851066/d4c77574-50c1-4c79-b655-8f21169cc11d)

<br>

### Show One Restaurants
- Set the verb to GET.
- In the URL after the GET verb, insert the following url: https://michael-restaurants-api-78cca9b4536d.herokuapp.com/api/v1/restaurants/:id
![image](https://github.com/msam4/restaurant-api/assets/137851066/8c8e8a10-b996-4856-a758-eb49873a496e)
<br>
- Save and then click the SEND button.

![image](https://github.com/msam4/restaurant-api/assets/137851066/6d05dd10-f1dc-4fa1-b2a6-53de3e1e4128)
<br>

### Create a New Restaurant
- Set the verb to POST
- In the URL after POST verb, insert the following url: https://michael-restaurants-api-78cca9b4536d.herokuapp.com/api/v1/restaurants
- In the Headers tab under the verb and url, insert the following key and value:
  - Content-Type: application/json
  - X-User-Email: INSERT_USER_EMAIL
  - X-User-Token: INSERT_USER_TOKEN
![image](https://github.com/msam4/restaurant-api/assets/137851066/1c8d7bd4-d244-4adb-97a6-c296495d5b4c)
<br>

- In the body tab, select raw and the drop down menu set as JSON.
- Add a new restaurant using this format inside of curly brackets:
  - "name": "ADD_RESTAURANT_NAME", "address": "ADD_RESTAURANT_ADDRESS"
<br>

![image](https://github.com/msam4/restaurant-api/assets/137851066/0b430f29-64de-43ab-8a0a-717e9225ae1c)
<br>
- Save and then click the SEND button

![image](https://github.com/msam4/restaurant-api/assets/137851066/a8f4363c-1776-491d-bd46-170fbfeb3120)
<br>

### Update a Restaurant

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
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling

## Additional Features to Add
- Frontend UI to connect with the backend server.
