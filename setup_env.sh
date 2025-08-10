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
echo "List Dockerfile-based image targets from external repo: bazel query '@app_image_dockerfile_ext//...:*"

# results were as below:
# @app_image_dockerfile_ext//image:BUILD
# @app_image_dockerfile_ext//image:dockerfile_image.tar

# query shows the external repo created exactly one buildable target => @app_image_dockerfile_ext//image:dockerfile_image.tar

# Build the image tar produced by dockerfile_image
echo "Build the Docker image tar with Bazel:"
echo "bazel build @app_image_dockerfile_ext//image:dockerfile_image.tar"

# Resolve the tar path and load it into Docker
echo "Resolve the built tar path:"
echo  " TAR='$(bazel cquery --output=files @app_image_dockerfile_ext//image:dockerfile_image.tar)'  "
echo " Load the image tar into Docker: docker load -i "$TAR" "

# if no tag printed, find the IMAGE ID:
echo "docker images | head "

# then tag & run (replace <IMAGE_ID>):
echo "docker tag <IMAGE_ID> app_image_dockerfile:latest"
echo "docker run --rm app_image_dockerfile:latest"


echo "List all local Docker images: docker image ls"

echo  "✅ Script is done "

