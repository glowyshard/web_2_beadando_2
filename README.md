<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## Installation

- clone this repository
- install the packages. ```composer install```, ```npm install```
- import the database
- copy the ```.env.example``` file into the ```.env``` file and set up your database name (```DB_DATABASE=```) and
  credentials
- run the ```php artisan key:generate``` command to make the cryptography key for the app
- build the assets with the ```npm run build``` terminal command
- create the database with the ```php artisan migrate``` command.
- create an administrative user ```php artisan make:filament-user```. After creating, you will have to change the
  user's ```role``` in the database from ```user``` to ```admin```.
- you can also use the applications web interface to sign up, it's the same result and you still will have to change the
  type of the first user manually. After setting up the first user manually, you can
  visit ```<web_address_of_app>/admin``` to add new users or manage existing ones.

### Admin panel features

Access the admin panel at ```<web_address_of_app>/admin```

- you can manage the users of the application (2 / d)
- you can upload navigation items, which are stored inside the database. Please use full URL's, route parsing from
  databas links is not supported. This is why they are only visible on the home page. (2 / b)

### RESTFUL API

- use the ```Restful postman.json``` file provided in the repository, to test the ```pastry``` API resource. (4)

### Application

- visiting the homepage (```<web_address_of_app>/login```) will reveal the company introduction page (1)
- clicking the Laravel logo on the navigation bar will take you to the login page (you can also
  use ```<web_address_of_app>/login``` and ```<web_address_of_app>/register```)
- after signing up and logging in, you will be greeted with a chart ob the user level dashboard, which shows the
  distribution of users and administrators in the system using chart.js (7)
- also on this dashboard, you can search the pastries stored in the database. The search is based on a javascript
  class (6, 3)
