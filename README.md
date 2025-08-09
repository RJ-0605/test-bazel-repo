# Test Bazel Repo

A Python application built with Bazel build system, ready for containerization.

## Prerequisites

- Python 3.9+
- Bazel 6.0.0
- Docker (for container builds - coming soon)

## Quick Start

### 1. Install Bazel (if not already installed)

**Ubuntu/Debian:**
```bash
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel-6.0.0 -y
sudo ln -sf /usr/bin/bazel-6.0.0 /usr/local/bin/bazel
```

**macOS:**
```bash
brew install bazel
```

### 2. Setup Development Environment

```bash
./setup_env.sh
```

### 3. Activate Virtual Environment

```bash
source venv/bin/activate
```

### 4. Build and Run

**Build Python application:**
```bash
bazel build //:main_simple
```


**Run the application:**
```bash
bazel run //:main_simple
```

## Project Structure

```
.
├── .bazelversion          # Bazel version specification
├── WORKSPACE             # Bazel workspace configuration  
├── BUILD.bazel           # Build configuration
├── main.py               # Flask application (needs dependencies)
├── main_simple.py        # Simple Python app (working)
├── requirements.txt      # Python dependencies
├── setup_env.sh          # Environment setup script
├── .gitignore           # Git ignore rules
└── README.md            # This file
```

## Current Status

✅ **Working:**
- Basic Python application builds (`bazel build //:main_simple`)
- Python application execution (`bazel run //:main_simple`)
- Virtual environment setup
- Bazel installation and configuration

🚧 **In Progress:**
- Flask integration with Bazel pip dependencies
- Container image builds
- Docker integration

## Development

### Building Applications

**Simple Python app (working):**
```bash
bazel build //:main_simple
bazel run //:main_simple
```

**Flask app (needs dependency setup):**
```bash
# Will work after pip integration is complete
bazel build //:main
bazel run //:main
```

### Bazel Commands

- `bazel build //:main_simple` - Build the simple Python application
- `bazel run //:main_simple` - Build and run the simple application  
- `bazel clean` - Clean build artifacts
- `bazel query //...` - List all targets

## Next Steps for Team

1. **Current working state** is ready for collaboration
2. **Container builds** need Go rules configuration (in progress)
3. **Flask integration** needs pip dependency resolution
4. **CI/CD** can be set up using the working Python builds

## Troubleshooting

### Virtual Environment Issues
If you encounter Python path issues, ensure your virtual environment is activated:

```bash
source venv/bin/activate
which python
```

### Bazel Cache Issues
If builds fail unexpectedly, try cleaning the cache:

```bash
bazel clean --expunge
```

## Contributing

1. Clone the repository
2. Run `./setup_env.sh` to set up your environment
3. Make your changes
4. Test with `bazel build //:main_simple`
5. Submit a pull request

## Application Details

**Simple Application (`main_simple.py`):**
- ✅ Pure Python, no external dependencies
- ✅ Builds and runs with Bazel
- ✅ Ready for development and testing

**Flask Application (`main.py`):**
- 🚧 Requires Flask dependency integration
- 🚧 Will expose HTTP endpoint on port 5000
- 🚧 Target for containerization
