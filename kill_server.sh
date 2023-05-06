#!/bin/bash

# Kill programs using port 5002
echo "Killing programs using port 5002..."
sudo lsof -t -i:5002 | xargs kill -9

# Kill programs using port 5003
echo "Killing programs using port 5003..."
sudo lsof -t -i:5003 | xargs kill -9

echo "Done."
