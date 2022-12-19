# Rails Code Challenge - Theaters

For this assessment, you'll be working with a Theater domain.

In this repo, there is a Rails application with some features built out. There
is NO built React frontend application, so test your application utilizing other tools.

Your job is to build out the Rails API to add the functionality described in the
deliverables below.

## Setup

To download the dependencies for the backend, run:

```sh
bundle install
```

There is some starter code in the `db/seeds.rb` file so that once you've
generated the models, you'll be able to create data to test your application.

You can run your Rails API on [`localhost:3000`](http://localhost:3000) by running:

```sh
rails s
```

Ideally you will test your code by:

- Running the Rails server and utilizing your browser at the specified endpoints
- Running the Rails server and using Postman to make requests

## Models

You need to create the following relationships:

- A `Theater` has many `Guest`s through `Ticket`
- A `Guest` has many `Theater`s through `Ticket`
- A `Ticket` belongs to a `Theater` and belongs to a `Guest`

Start by creating the models and migrations for the following database tables:

| Theater          |
| ---------------- |
| name:string      |
| capacity:integer |

(Capacity is the capacity per theater for those asking...)

| Guest   |
| ----------- |
| name:string |

| Ticket        |
| ------------- |
| price:decimal |
| guest_id      |
| theater_id    |

Add any code needed in the model files to establish the relationships.

Then, run the migrations and seed file:

```sh
rails db:migrate db:seed
```

> If you aren't able to get the provided seed file working, you are welcome to
> generate your own seed data to test the application.

## Validations

Add validations to the `Ticket` model:

- must have a `price` between 1 and 30

Add validations to the `Guest` model:

- must have a `name`

Add validations to the `Theater` model:

- must have a `capacity` between 10 and 200

## Routes

Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.

### GET /theaters

Return JSON data in the format below:

```json
[
  {
    "name": "Royal Cinema",
    "capacity": 60
  },
  {
    "name": "Amazing World Cinemas",
    "capacity": 120
  }
]
```

### GET /theaters/:id

If the `Theater` exists, return JSON data in the format below:

```json
{
  "name": "Royal Cinema",
  "capacity": 60,
  "guests": [
    {
      "id": 1,
      "name": "Chett"
    },
    {
      "id": 2,
      "name": "Alina"
    }
  ]
}
```

If the `Theater` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Theater not found"
}
```

### POST /theaters

This route should create a new `Theater`. It should accept an object with the following properties in the body of the request:

```json
{
  "name": "Some Great Theater Name",
  "capacity": 60
}
```

If the `Theater` is created successfully, send back a response with the data
related to the `Theater`:

```json
{
  "id": 1,
  "name": "Some Great Theater Name",
  "capacity": 60
}
```

### DELETE /theaters/:id

If the `Theater` exists, it should be removed from the database, along with
any `Ticket`s that are associated with it (a `Ticket` belongs
to a `Theater`, so you need to delete the `Ticket`s before the
`Theater` can be deleted).

After deleting the `Theater`, return an _empty_ response body, along with the
appropriate HTTP status code.

If the `Theater` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Theater not found"
}
```

### GET /guests

Return JSON data in the format below:

```json
[
  {
    "id": 1,
    "name": "Chett"
  },
  {
    "id": 2,
    "name": "Alina"
  }
]
```

### POST /tickets

This route should create a new `Ticket` that is associated with an
existing `Guest` and `Theater`. It should accept an object with the following
properties in the body of the request:

```json
{
  "price": 5,
  "guest_id": 1,
  "theater_id": 3
}
```

If the `Ticket` is created successfully, send back a response with the data
related to the `Guest`:

```json
{
  "id": 1,
  "name": "Chett",
  "tickets": [
    {
      "id": 1,
      "price": 10.0,
      "guest_id": 1,
      "theater_id": 1
    }
  ]
}
```

If the `Ticket` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": [
    "Guest must exist",
    "Price must be greater than 1"
   ]
}
```
