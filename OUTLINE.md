### Project Outline

This project provides a self-hosted, self-masked VLESS+Reality and WireGuard server using `sing-box` and `caddy`. It is designed to be easy to set up and use with Docker.

**Core Components:**

*   **`sing-box`**: The core proxy server that handles the VLESS and WireGuard protocols.
    *   **Configuration**: The configuration is generated from a template (`config-template-vless.json`) and environment variables. This allows for easy setup of UUIDs, keys, and other parameters.
    *   **Device Management**: The project includes a script to manage devices.
        *   `add-device`: A helper script to add new devices. It can create both VLESS and WireGuard configurations.
        *   For each device, a complete configuration bundle is created, including the configuration file, a QR code, and a zip archive of both.
        *   The initial user's configuration is also created automatically.
    *   **Scripts**:
        *   `gen-vless`: A helper script to generate the necessary credentials (UUID, private/public keys, short ID) and create a `.env` file.
        *   `show-template`: A template for a script that displays client configuration details, including QR codes.
*   **`caddy`**: A web server that acts as a reverse proxy and serves a placeholder website.
    *   **Configuration**: The `Caddyfile` is generated from a template (`Caddyfile-template`) and an environment variable for the domain name.
    *   **Self-masking**: Caddy serves a simple placeholder login page (`srv/index.html`) to mask the fact that a proxy server is running on the same machine. It also handles HTTP to HTTPS redirection.
*   **Docker**: The entire setup is containerized using Docker and Docker Compose.
    *   **`docker-compose.yml`**: For production use, pulls pre-built images from Docker Hub.
    *   **`docker-compose-dev.yml`**: For development, builds the images locally from the `sing-box` and `caddy` directories.

**Workflows:**

*   **CI/CD**: GitHub Actions are used to automate the building and publishing of the `sing-box` and `caddy` Docker images to Docker Hub.
    *   The `sing-box` image is automatically updated with the latest release from `SagerNet/sing-box`.
    *   The Docker Hub README is kept in sync with the `README.EN.md` file in the repository.

**Further Development:**

Based on this outline, here are some potential areas for further development:

*   **Enhance the placeholder website**: The current placeholder is a simple login form. This could be improved to be a more convincing decoy, such as a blog or personal portfolio.
*   **Add support for more protocols**: The project currently focuses on VLESS and WireGuard. It could be extended to support other protocols like Trojan or Shadowsocks.
*   **Improve user management**: The `add-device` script could be improved to allow removing and listing devices.
*   **Add monitoring and logging**: The project could be improved by adding monitoring and logging capabilities to track usage and diagnose issues.
*   **Expand documentation**: The documentation could be expanded with more detailed explanations of the configuration options and advanced usage scenarios.