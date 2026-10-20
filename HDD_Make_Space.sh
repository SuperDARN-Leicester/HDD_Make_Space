#!/bin/sh
# This script stops the radar, deletes the oldest 4 days worth of logs and data then restarts the radar. Note that it does not resume the screen. To manually reconnect the screen run 'screen -r borealis' afterwards.

# Stop Radar
cd /home/radar/borealis/scripts/
sh stop_radar.sh

# Delete old logs
cd /srv/data/borealis_logs/
find -mtime +13 -exec rm {} +

# Delete old data
cd /srv/data/borealis_data/
find -type d -mtime +13 -exec rm -rf {} +

# Restart Radar
cd /home/radar/borealis/scripts/
sh start_radar.sh
