# Debugging Apache in Docker Container

This project contains a Bash script to install and configure Apache in a Docker container to serve a page containing "Hello Holberton".

## Steps to Fix the Issue

1. Run the Docker container:
    ```bash
    docker run -p 8080:80 -d -it holbertonschool/265-0
    ```

2. Connect to the container:
    ```bash
    docker ps
    docker exec -it <container_id> /bin/bash
    ```

3. Inside the container, run the following commands to install and configure Apache:
    ```bash
    apt-get update
    apt-get install -y apache2
    echo "Hello Holberton" > /var/www/html/index.html
    service apache2 start
    ```

4. Verify the setup:
    ```bash
    curl 0:8080
    ```

## Usage

You can also use the provided Bash script `fix_apache.sh` to automate the fix.

1. Make the script executable:
    ```bash
    chmod +x fix_apache.sh
    ```

2. Run the script inside the Docker container:
    ```bash
    ./fix_apache.sh
    ``
