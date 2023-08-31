# Ecommerce Flutter Assignment

## Description

In this assignment, we will require you to create a basic ecommerce application using Flutter running on both iOS and Android. Your task is to create a multi-page mobile application to allow users to browse and search for products.

## Instructions

1. Design and implement a mobile application that allow users to browse and search for products.
2. The application should have the following screens:
   1. Home Screen: Display a list of products with their images, names, ratings and prices (discounted prices if available). Add a search bar for users to search products. After searched, display a list of search results.
   2. Product Detail Screen: Display detailed information about the product such as images, category, brand, rating, status of the inventory, name, price and description.
3. You are free to design whatever screens you desired as long as user is able to browse and search for products. Instruction #2 is for your reference.
   API you can used to fetch data are: https://dummyjson.com
   You can use the following endpoints in your app.
4. GET https://dummyjson.com/products (Get products)

- Sample Response
  {
  "products": [
  {
  "id": 1,
  "title": "iPhone 9",
  "description": "An apple mobile which is nothing like apple",
  "price": 549,
  "discountPercentage": 12.96,
  "rating": 4.69,
  "stock": 94,
  "brand": "Apple",
  "category": "smartphones",
  "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
  "images": [
  "https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"
  ]
  }
  ],
  "total": 100,
  "skip": 0,
  "limit":30
  }

2. GET https://dummyjson.com/products/1 (Get product)

- Sample Response
  {
  "id": 1,
  "title": "iPhone 9",
  "description": "An apple mobile which is nothing like apple",
  "price": 549,
  "discountPercentage": 12.96,
  "rating": 4.69,
  "stock": 94,
  "brand": "Apple",
  "category": "smartphones",
  "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
  "images": [
  "https://i.dummyjson.com/data/products/1/1.jpg",
  "https://i.dummyjson.com/data/products/1/2.jpg",
  "https://i.dummyjson.com/data/products/1/3.jpg",
  "https://i.dummyjson.com/data/products/1/4.jpg",
  "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
  ]
  }

1. GET https://dummyjson.com/products/search?q=Laptop (Search products)

- Sample Response
  {
  "products": [
  {
  "id": 1,
  "title": "iPhone 9",
  "description": "An apple mobile which is nothing like apple",
  "price": 549,
  "discountPercentage": 12.96,
  "rating": 4.69,
  "stock": 94,
  "brand": "Apple",
  "category": "smartphones",
  "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
  "images": [
  "https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"
  ]
  }
  ],
  "total": 100,
  "skip": 0,
  "limit":30
  }

## Requirements

- Use Flutter to develop the mobile application.
- Use a state management like Flutter Bloc, Provider, Getx or Riverpod to manage the app's state.
- Write clean, maintainable and well-documented code.

### Bonus Points

- Develop a responsive layout to support different screen sizes.
- Include animation to make UI feel more intuitive.
- Handle loading, error states and lost internet connection during data fetching.
- Work in offline mode.
- Implement pagination to fetch limited records at once.
- Handle receiving push notification after product is added to cart (Dont need to involve backend).

referens

- https://cdn.dribbble.com/userupload/5034252/file/original-e8a2161c1f6f796d13b52762c89de56e.png?resize=2048x1536
