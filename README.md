# Ecommerce Flutter App Documentation

**Table of Contents**

[TOCM]

[TOC]

#Description
Welcome to the documentation for the Ecommerce Flutter App project that runs on both iOS and Android platforms. The primary goal of the application is to allow users to browse and search for products.

#Instruction
This app is mobile application with the following functionality:

Home Screen: Display a list of products with images, names, ratings, and prices (including discounted prices if available). Implement a search bar for users to search for products. After a search, show a list of search results.

Product Detail Screen: Provide detailed information about a selected product, including images, category, brand, rating, inventory status, name, price, and description.

Cart Screen: Provide list of selected product, including images, category, name and price.

The API to fetch data for the application is: https://dummyjson.com
#Screens
The application comprises the following screens:

Home Screen: Display the list of products with search functionality.
Product Detail Screen: Display detailed information about a selected product.
Cart Screen: Display the list of products in the cart.
#API Integration
All the data integrated from the API into app by using:

GET https://dummyjson.com/products: Use this endpoint to retrieve a list of products.

GET https://dummyjson.com/products/search?q=: Use this endpoint to search based on keyword.

GET https://dummyjson.com/products?limit=10: Use this endpoint to retrieve a list of products limit by 10 for pagination.

#Getting Started

To set up and run the project on your local machine, follow these steps:

Clone the repository:

`git clone https://github.com/your-username/ecommerce-flutter-app.git`
`$cd ecommerce-flutter-app`

Install Flutter and Dart if not already installed. You can find installation instructions here.

Install required packages:
`$ flutter pub get`

Run the application:
`$ flutter run`
#License
This project is licensed under the MIT License. More details can be found in the LICENSE file at the root of the project.

If you have any questions or need assistance, feel free to contact us aizatkmrdin@gmail.com.
