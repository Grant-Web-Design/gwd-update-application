# Update customer preview website action

This action can be used to take care of most of the legwork involved in updating a customer preview website. It uses SSH to connect to the Grant Web Design hosting server, and runs the `build-start-application.sh` script in the git folder given in the `gitFolderLocation` input.

The action uses the Grant Web Design organization secrets `GWD_HOSTING_SERVER_ADDRESS` and `GWD_HOSTING_SERVER_KEY` to connect to the server, so please make sure the repository you use this action in has sufficient access rights to these secrets.
