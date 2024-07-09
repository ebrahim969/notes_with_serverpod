# Note App with Serverpod

Welcome to the Note App! This application allows users to create, edit, and delete notes. The backend is built with Serverpod, a powerful server-side framework for Dart.

## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Project Description

The Note App is a simple application that provides functionality to manage notes. Users can add new notes, edit existing ones, and delete notes they no longer need. This project is an example of using Serverpod to create a backend for a note-taking application.

## Features

- Create a new note
- Edit an existing note
- Delete a note
- View all notes

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have Dart and Flutter installed on your machine.
- You have a PostgreSQL database setup.
- You have installed Serverpod CLI.

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/ebrahim969/notes_with_serverpod.git
    cd notes_server
    ```

2. **Install dependencies:**

    ```bash
    dart pub get
    ```

3. **Configure the database:**

    Update the `config.yaml` file with your database configuration.

4. **Generate server code:**

    ```bash
    serverpod generate
    ```

5. **Run the server:**

    ```bash
    dart bin/main.dart
    ```
