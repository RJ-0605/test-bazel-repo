#!/bin/bash

# Setup script for the Bazel project
set -e

echo "Setting up Bazel development environment..."

# Check if Python 3.9+ is available
python3 --version

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install Python dependencies
echo "Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Virtual environment setup complete!"
echo "To activate: source venv/bin/activate"

echo "Clean the Bazel cache and remove all build outputs: bazel clean --expunge"
echo "Build the main binary with Bazel: bazel build //:main"
echo "Synchronize external dependencies: bazel sync"
echo "Load the Docker image into your local environment: bazel run //:app_image.load"
echo "Run the container from the image: docker run --rm app_image:latest"
echo "List all local Docker images: docker image ls"

