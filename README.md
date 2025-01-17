# Inception

**Inception** is a project that focuses on deploying and managing a multi-service infrastructure using **Docker**. The goal is to familiarize yourself with containerization, service orchestration, and system configuration to create a robust, scalable environment.

## Project Overview

The project requires setting up a system architecture with multiple containers, each running distinct services. You will configure these services using Docker Compose and ensure secure, isolated operations across the environment.

### Services Included:

- **Nginx**: Acts as a reverse proxy and serves static files.
- **WordPress**: A dynamic CMS for hosting content.
- **MariaDB**: A database server to manage WordPress data.
- **Custom Network**: All services run within a custom Docker network for isolation.
- **Volumes**: Persistent data storage for MariaDB and WordPress.

## Features

- **Containerized Services**: Deploy services in isolated containers.
- **HTTPS Configuration**: Enable secure connections using SSL/TLS.
- **Multi-Service Deployment**: Manage multiple interconnected services with Docker Compose.
- **Persistence**: Ensure data integrity with volume mounting.
- **Scalability**: Designed to scale up with additional containers or services if needed.

## Getting Started

### Prerequisites

- **Operating System**: Linux-based system (Debian/Ubuntu recommended).
- **Docker**: Version 20.10 or higher.
- **Docker Compose**: Version 2.x or higher.

### Installation

1. Clone the repository:
   ```bash
   git clone git@github.com:d2iv3r/Inception.git
   cd inception
   ```

2. Build and start the services:
   ```bash
   make
   ```
3. Access the services:
   - Nginx: `https://<your-domain>`
   - WordPress: `https://<your-domain>/wordpress`
   - Wordpress admin: `https://<your-domain>/wp-admin`

## Configuration

### Environment Variables

Configuration is managed through `.env` files for portability and customization. Examples:

```env
MYSQL_ROOT_PASSWORD=mysqlroot
MYSQL_DATABASE=inception
MYSQL_USER=user
MYSQL_PASSWORD=mysqlpassword
C=your_country
ST=your_state
L=your_locality
O=your_organization
CN=your_common_name
URL=your_doamin.com
TITLE=you_title
ADMIN_USER=admin
ADMIN_PASS=adminpassword
ADMIN_EMAIL=admin@mail.com
```

### SSL/TLS

- Certificates are generated automatically using **OpenSSL** or provided manually.
- Ensure the certificate paths are correctly specified in the Nginx configuration.

### Volumes

Persistent data is stored using Docker volumes:
- `mariadb_data`: Stores MariaDB data.
- `wordpress_data`: Stores WordPress uploads and settings.

### Volumes Paths
Change the paths of the volumes to put the data on your host machine :
   - In Makefile:
      ```bash
      mkdir -p your/path/to/volume/wordpress your/path/to/volume/db
   - In docker-compose.yml
      - DB volume :
         ```bash
         device: your/path/to/volume/db
      - wordpress volume:
         ```bash
         device: your/path/to/volume/wordpress

### Domain Name
   - Change domain name in nginx conf to your hostname machine, In nginx conf :
   ```bash
   server_name yourdomain.com;
   ```


## Project Structure

```
.
├── Makefile                  # runing the project
├── srcs
   ├── docker-compose.yml     # Service definitions
   ├── requirements
      ├── mariadb/            # MariaDB configuration
      ├── nginx/              # Nginx configuration
      ├── wordpress/          # WordPress configuration
├── .env                      # Environment variables
└── README.md                 # Project documentation
```

## Testing

1. Verify the services are running:
   ```bash
   docker ps
   ```

2. Check logs for any errors:
   ```bash
   docker-compose logs
   ```

3. Test HTTPS using your browser or tools like `curl`:
   ```bash
   curl -k https://yourdomain.com
   ```
