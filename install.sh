#!/bin/bash

# Store current directory to return later
original_dir=$(pwd)

# Elevate to root and execute all commands
sudo bash -c '
# Install required packages
apt update && apt upgrade -y
apt install docker-compose -y

# Start the containers in detached mode
cd pterodactyl/panel
docker-compose up -d

# Run the user creation command inside the panel container
docker-compose run --rm panel php artisan p:user:make
'
# Return to original directory
cd "$original_dir"

# Run privileged setup
sudo bash -c '

# Start Docker containers
cd pterodactyl/wings
docker-compose up -d

# Traverse deeply into /etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc

# Go to pterodactyl to write config
cd pterodactyl

# Prompt for multi-line config until user types KS
echo "Enter config: "
config=""
while IFS= read -r line; do
  [[ "$line" == "KS" ]] && break
  config+="$line"$'\n'
done

# Save config to file
echo "$config"  > config.yml
'

# Return to original directory
cd "$original_dir"

# Go into pterodactyl/wings and force-recreate containers
cd pterodactyl/wings
docker-compose up -d --force-recreate
