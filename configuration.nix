{ config, pkgs, nixpkgs, lib, ... }: {
  boot.supportedFilesystems = [ "vfat" "f2fs" "ntfs" "cifs" ];

  services.openssh.enable = true;

  services.httpd = {
    enable = true;
    adminAddr = "user@examaple.com";
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

  users.users.root.openssh.authorizedKeys.keys =
    lib.splitString "\n" (builtins.readFile ./authorized_keys.txt);
}
