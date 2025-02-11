{
  description = "mIRC on Wine development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Wine and core dependencies
            wine
            winetricks
            wineWowPackages.stable
            
            # Support tools
            cabextract
            p7zip
            wget

            # Audio support
            wineasio
          ];

          shellHook = ''
            export WINEPREFIX="$PWD/.wine"
            export WINEARCH="win32"
            
            if [ ! -d "$WINEPREFIX" ]; then
              echo "Initializing Wine prefix..."
              wineboot --init
              echo "Installing common dependencies..."
              winetricks corefonts d3dx9 vcrun6
            fi

            echo "mIRC Wine environment ready!"
            echo "Run 'wine mIRC.exe' to start mIRC"
          '';
        };
      }
    );
}
