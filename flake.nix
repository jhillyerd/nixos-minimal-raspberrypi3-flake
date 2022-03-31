{
  description = "Build Raspberry Pi 3 image";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }: rec {
    nixosConfigurations.rpi3 = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./sd-image-pi3.nix
        "${nixpkgs}/nixos/modules/config/no-x-libs.nix"
        ./configuration.nix
      ];
    };
    images.rpi3 = nixosConfigurations.rpi3.config.system.build.sdImage;
  };
}
