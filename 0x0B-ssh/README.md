# SSH Client Configuration

This project configures the SSH client to use a specific private key and refuse password authentication.

## Requirements

- SSH client must use the private key `~/.ssh/school`.
- SSH client must refuse to authenticate using a password.

## Setup

1. Create or edit the SSH client configuration file located at `~/.ssh/config`.
2. Add the following configuration:

    ```text
    Host myserver
        HostName <server_ip>
        User ubuntu
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
    ```

3. Replace `<server_ip>` with the actual IP address or hostname of your server.

This configuration allows you to connect to your server without typing a password, using the specified private key.
