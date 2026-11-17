# ShopSphere

ShopSphere is a Spring Boot REST API for managing an e-commerce product catalog. It supports listing products, retrieving a product by ID, creating and updating products with uploaded images, retrieving product images, and deleting products.

Each product stores its name, description, brand, price, category, release date, availability, quantity, and image data. Product records are persisted with Spring Data JPA. The included configuration uses an in-memory H2 database, so data is temporary and is lost when the application stops.

## Tech stack

- Java 21
- Spring Boot and Spring Web MVC
- Spring Data JPA with H2
- Maven

## Run locally

Make sure Java 21 is installed, then start the application with the Maven wrapper:

```bash
./mvnw spring-boot:run
```

The API is available at `http://localhost:8080/api`.

To build the executable JAR:

```bash
./mvnw clean package
```

## API endpoints

| Method | Endpoint | Description |
| --- | --- | --- |
| `GET` | `/api/` | Simple greeting |
| `GET` | `/api/products` | List all products |
| `GET` | `/api/products/{id}` | Get a product by ID |
| `POST` | `/api/products` | Create a product with an image |
| `PUT` | `/api/products/{id}` | Update a product with an image |
| `GET` | `/api/products/{productId}/image` | Get a product's image |
| `DELETE` | `/api/products/{id}` | Delete a product |

Create and update requests use `multipart/form-data` with a `product` JSON part and an `imageFile` part. For example:

```bash
curl -X POST http://localhost:8080/api/products \
  -F 'product={"name":"Keyboard","description":"Mechanical keyboard","brand":"Example","price":99.99,"category":"Accessories","release_date":"17-11-2026","available":true,"quantity":10};type=application/json' \
  -F 'imageFile=@keyboard.jpg'
```

The `release_date` field is formatted as `dd-MM-yyyy` in JSON.

## Sample data

`src/main/resources/data2.sql` contains example product inserts. The current application configuration does not point Spring's SQL initializer at this filename, so the sample rows are not automatically loaded on startup.

## Docker

The Dockerfile packages the built JAR into a Java 21 runtime image. Build the JAR first, then build and run the image:

```bash
./mvnw clean package
docker build -t shopsphere .
docker run --rm -p 8080:8080 shopsphere
```
