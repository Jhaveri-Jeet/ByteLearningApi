# Byte Learning PHP APIs

Welcome to the Byte Learning project! This repository contains PHP APIs that serve as the backbone for the Byte Learning learning management system.

## Getting Started

Follow the steps below to set up and run the project locally.

### Prerequisites

- PHP (version 8.2.4 recommended)
- MariaDB (version 10.4.28 recommended)
- Web server (e.g., Apache or Nginx)

### Installation

1. Clone the repository to your local machine.

   ```bash
   git clone https://github.com/your-username/byte-learning-php-apis.git
   ```

2. Import the database schema using the provided SQL dump file (`bytelearningdb.sql`).

3. Configure the database connection in the PHP files under the `includes` directory, if needed.

4. Set up your web server to point to the project's root directory.

5. Access the project in your web browser.

## Features

- **User Management:** Create and manage administrators, professors, and students.

- **Content Management:** Organize playlists, videos, subjects, and handle doubts efficiently.

- **Interactions:** Enable users to follow professors, rate and review playlists, and engage in doubt discussions.

- **Data Integrity:** Foreign key constraints and relationships maintain database consistency.

- **Security:** User authentication and authorization mechanisms ensure data security.
