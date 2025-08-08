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
echo "To build with Bazel: bazel build //:main"
echo "To build container: bazel build //:app_image"
