# mIRC Wine Environment

This is a dedicated Nix development environment for running mIRC through Wine.

## Setup

1. Clone this repository:
```bash
git clone <your-repo-url>
cd mirc-wine
```

2. Initialize the environment:
```bash
nix develop
```

3. Download and install mIRC:
```bash
# Example: Download mIRC (replace with your preferred version)
wget https://www.mirc.com/get.php?version=latest -O mirc.exe
wine mirc.exe
```

## Usage

1. Enter the environment:
```bash
nix develop
```

2. Run mIRC:
```bash
wine ~/.wine/drive_c/Program\ Files/mIRC/mirc.exe
```

## Directory Structure

- `.wine/` - Wine prefix (created automatically)
- `flake.nix` - Nix flake configuration
- `flake.lock` - Lock file for dependencies

## Notes

- The Wine prefix is created locally in the project directory
- All Wine configurations and installed programs will be stored in the `.wine` directory
- You can modify the `flake.nix` to add additional dependencies or configurations

## Troubleshooting

If you experience issues:

1. Reset Wine prefix:
```bash
rm -rf .wine
nix develop
```

2. Install additional dependencies:
```bash
winetricks corefonts tahoma d3dx9 vcrun6
```
