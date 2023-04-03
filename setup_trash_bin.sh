#!/bin/bash

# Create the trash bin directory
mkdir ~/.trash

# Add an alias for the rm command to move files to the trash bin
echo 'alias rm="mv --target-directory=$HOME/.trash"' >> ~/.bashrc

# Reload the shell configuration
source ~/.bashrc

# Create a script to empty the trash bin
echo '#!/bin/bash
rm -rf $HOME/.trash/*' > ~/empty_trash.sh

# Make the script executable
chmod +x ~/empty_trash.sh

# Set up a cron job to run the script once a month
(crontab -l 2>/dev/null; echo "0 0 1 * * $HOME/empty_trash.sh") | crontab -
