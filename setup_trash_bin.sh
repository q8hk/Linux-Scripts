#!/bin/zsh

# Create the trash bin directory
mkdir ~/.trash

# Add an alias for the rm command to move files to the trash bin
echo 'alias rm="mv --target-directory=$HOME/.trash"' >> ~/.zshrc

# Reload the shell configuration
source ~/.zshrc

# Create a script to empty the trash bin
echo '#!/bin/zsh
rm -rf $HOME/.trash/*' > empty_trash.sh

# Move the script to /usr/local/bin
sudo mv empty_trash.sh /usr/local/bin/

# Make the script executable
sudo chmod +x /usr/local/bin/empty_trash.sh

# Set up a cron job to run the script once a month
(crontab -l 2>/dev/null; echo "0 0 1 * * /usr/local/bin/empty_trash.sh") | crontab -
