# Update Grant Web Design applicaton

This action can be used to take care of most of the legwork involved in updating an application on the Grant Web Desing hosting server. It uses SSH to connect to the hosting server, and runs the `build-start-application.sh` script in the git folder given in the `gitFolderLocation` input.

To SSH into the server, this action requires the follwing inputs:

## `privateKey`
This is the SSH private key, stored in the `GWD_HOSTING_SERVER_KEY` organization secrets. As value you can enter `${ secrets.GWD_HOSTING_SERVER_KEY }` to use this secret.

## `serverAddress`
This is the address of the hosting server, stored in the `GWD_HOSTING_SERVER_ADDRESS` organization secrets. As value you can enter `${ secrets.GWD_HOSTING_SERVER_ADDRESS }` to use this secret.
