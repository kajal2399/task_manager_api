# Task Management App API (Backend)

This project provides the backend API for a task management application. It allows for creating, reading, updating, and deleting tasks with title, description, and status.

## Features

- RESTful API endpoints for Create, Read, Update, and Delete operations for tasks.
- Server-side validation for task data.
- Error handling for invalid requests and server errors.
- Automated test suite for critical components.

## Technologies Used

- Ruby on Rails for the API.
- PostgreSQL as the database system.

## Getting Started

### Prerequisites

- Ruby version: "3.0.0"
- Rails version: "~> 7.1.3", ">= 7.1.3.2"
- PostgreSQL

### Installation

1. Clone the repository:
2. Navigate to the project directory:
3. Install dependencies:
4. Create and migrate the database:
5. Start the server:

## API Endpoints

| Method | Endpoint        | Description                |
| ------ | --------------- | -------------------------- |
| POST   | `/tasks`        | Create a new task          |
| GET    | `/tasks`        | Retrieve all tasks         |
| GET    | `/tasks/:id`    | Retrieve a task by id      |
| PATCH  | `/tasks/:id`    | Update a task by id        |
| DELETE | `/tasks/:id`    | Delete a task by id        |


## To Run Test Cases
bundle exec rspec

