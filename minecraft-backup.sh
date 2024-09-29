#!/bin/bash

docker exec minecraft rcon-cli stop
docker compose -f /home/vaporvee/minecraft/docker-compose.yml down
echo making world backup this can take a while...
rclone sync /home/vaporvee/minecraft/data/world minecraft-backups:/MinecraftBackups/lastworld
rclone sync /home/vaporvee/minecraft/data/world_nether/DIM-1 minecraft-backups:/MinecraftBackups/lastworld/DIM-1
rclone sync /home/vaporvee/minecraft/data/world_the_end/DIM1 minecraft-backups:/MinecraftBackups/lastworld/DIM1
docker compose -f /home/vaporvee/minecraft/docker-compose.yml up -d
