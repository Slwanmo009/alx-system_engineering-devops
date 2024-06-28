# Puppet Manifest Project

This project contains a Puppet manifest that creates a file at `/tmp/school` with specific permissions, owner, and content.

## Requirements

- File path: `/tmp/school`
- File permissions: `0744`
- File owner: `www-data`
- File group: `www-data`
- File content: `I love Puppet`

## Usage

1. Ensure Puppet is installed on your system.
2. Save the manifest file `create_file.pp`.
3. Apply the manifest using the command:
    ```sh
    sudo puppet apply create_file.pp
    ```
4. Verify the file has been created with the correct specifications.

## Linting

Ensure your manifest passes `puppet-lint` checks by running:
```sh
puppet-lint create_file.pp
