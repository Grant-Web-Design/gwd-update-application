# Update customer preview website action

This action can be used to take care of most of the legwork involved in updating a customer preview website. It uses SSH to connect to the Grant Web Design hosting server, and runs the `build-start-application.sh` script in the git folder given in the `gitFolderLocation` input.

To SSH into the server, this action requires the follwing inputs:

## `privateKey`
This is the SSH private key, stored in the `GWD_HOSTING_SERVER_KEY` organization secrets. As value you can enter `${ secrets.GWD_HOSTING_SERVER_KEY }` to use this secret.

## `serverAddress`
This is the address of the hosting server, stored in the `GWD_HOSTING_SERVER_ADDRESS` organization secrets. As value you can enter `${ secrets.GWD_HOSTING_SERVER_ADDRESS }` to use this secret.
