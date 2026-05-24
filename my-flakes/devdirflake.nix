{
  description = "Development environment with k3d, kubectl, go, and awscli2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonWithPackages = pkgs.python3.withPackages (ps: with ps; [
          pyyaml
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            k9s
            k3d
            kind
            eksctl
            kubernetes-helm
            kubectl
            rclone
            zstd
            kubernetes-code-generator
            go
            gotools
            graphviz-nox 
            golangci-lint
            awscli2
            pythonWithPackages
            micromamba
            nodejs_24
          ];

          env = {
            AWS_PROFILE = "Admin-516524556673";
          };

          shellHook = ''
            echo "🚀 Development environment loaded!"
            echo ""
            echo "Available tools:"
            echo "  • k3d      - $(k3d version 2>/dev/null | head -1 | cut -d' ' -f3 || echo 'installed')"
            echo "  • kubectl  - $(kubectl version --client --short 2>/dev/null || echo 'Not connected to cluster')"
            echo "  • go       - $(go version | cut -d' ' -f3)"
            echo "  • aws      - $(aws --version 2>/dev/null | cut -d' ' -f1 | cut -d'/' -f2 || echo 'installed')"
            echo "  • python   - $(python --version | cut -d' ' -f2)"
            echo ""
            echo "💡 Tip: Use 'k3d cluster create dev' to create a local cluster"
          '';
        };
      });
} 